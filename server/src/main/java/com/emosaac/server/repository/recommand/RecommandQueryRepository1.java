package com.emosaac.server.repository.recommand;

import com.emosaac.server.domain.user.User;
import com.emosaac.server.dto.book.BookListResponse;
import com.emosaac.server.dto.book.BookRequest;
import com.emosaac.server.dto.book.QBookListResponse;
import com.querydsl.core.types.Predicate;
import com.querydsl.core.types.dsl.BooleanExpression;
import com.querydsl.core.types.dsl.Expressions;
import com.querydsl.jpa.JPAExpressions;
import com.querydsl.jpa.impl.JPAQueryFactory;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Slice;
import org.springframework.data.domain.SliceImpl;
import org.springframework.stereotype.Repository;

import java.util.List;

import static com.emosaac.server.domain.book.QBook.book;
import static com.emosaac.server.domain.book.QGenre.genre;
import static com.emosaac.server.domain.book.QReadBook.readBook;

@RequiredArgsConstructor
@Repository
public class RecommandQueryRepository1 {

    private final JPAQueryFactory jpaQueryFactory;

    public Slice<BookListResponse> findBestList(int hit, int typeCd, Long prevId, Double prevScore, PageRequest page) {
        List<BookListResponse> content = jpaQueryFactory.select(new QBookListResponse(book))
                .from(book)
                .where(book.type.eq(typeCd),
                        cursorIdAndCursorScoreAndCursorHit(prevId, prevScore, hit)
                )
                .limit(page.getPageSize() + 1)
                .orderBy(book.hit.desc(), book.score.desc(), book.bookId.desc())
                .fetch();

        boolean hasNext = false;
        if (content.size() == page.getPageSize() + 1) {
            content.remove(page.getPageSize());
            hasNext = true;
        }

        return new SliceImpl<>(content, page, hasNext);
    }
    public Slice<BookListResponse> findNewBookList(String regist, int typeCd, Long prevId, PageRequest page) {
        List<BookListResponse> content = jpaQueryFactory.select(new QBookListResponse(book))
                .from(book)
                .where(book.type.eq(typeCd),
                        cursorIdAndCursorRegist(prevId, regist)
                )
                .limit(page.getPageSize() + 1)
                .orderBy(book.regist.desc(), book.bookId.desc())
                .fetch();

        boolean hasNext = false;
        if (content.size() == page.getPageSize() + 1) {
            content.remove(page.getPageSize());
            hasNext = true;
        }

        return new SliceImpl<>(content, page, hasNext);
    }
    private Predicate cursorIdAndCursorScoreAndCursorHit(Long cursorId, Double cursorScore, Integer hit) {
        return (book.hit.eq(hit).and(book.score.lt(cursorScore)))
                .or(book.score.eq(cursorScore).and(book.bookId.lt(cursorId)))
                .or(book.hit.lt(hit));
    }
    private Predicate cursorIdAndCursorRegist(Long cursorId, String regist) {
        return (book.regist.eq(regist).and(book.bookId.lt(cursorId)))
                .or(book.regist.lt(regist));
    }

}
