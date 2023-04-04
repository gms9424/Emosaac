/** @jsxImportSource @emotion/react */
import { css } from "@emotion/react";
import { useRouter } from "next/router";
import { useState } from "react";
import { useIsResponsive } from "@/components/Responsive/useIsResponsive";
import EmopickSearchModal from "@/components/emopick/EmopickSearchModal";
import { postEmopickList } from "@/api/emopick/postEmopick";
import { FiSearch } from "react-icons/fi";
import { SearchBar } from "@/components/UI/NavigationBar/SearchBar";
import { SearchBarMobile } from "@/components/UI/NavigationBar/SearchBarMobile";

// request: {
//   content: string;
//   novelList: object;
//   title: string;
//   webtoonList: object;
// };
// token?: string | null;

const write = () => {
  const [isDeskTop, isTablet, isMobile] = useIsResponsive();
  const [title, setTitle] = useState("이모픽 등록 테스트");
  const [content, setContent] = useState("이모픽 등록 테스트 내용내용");
  const [bookList, setBookList] = useState({});
  // 전송할때만 쓰는 리스트
  // const [webtoonList, setWebtoonList] = useState({ 3281: "모죠 잼써요" });
  // const [novelList, setNovelList] = useState({ 7189: "레벨업 할게요" });
  const [webtoonList, setWebtoonList] = useState({});
  const [novelList, setNovelList] = useState({});
  const [isSearchBoxOpen, setIsSearchBoxOpen] = useState(false);
  function submitEmopick(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault;
    const token = localStorage.getItem("token");
    const request = { title, content, novelList, webtoonList };
    // if (Object.keys(bookList).length > 3 && title.length > 1 && content.length > 9) {
    //   postEmopickList({ request, token }).then((res) => {
    //     console.log(res);
    //   });
    // }
  }
  return (
    <div>
      <div css={pageTitleCSS({ isDeskTop, isTablet, isMobile })}>
        <div css={innerCSS({ isDeskTop, isTablet, isMobile })}>
          <h3>emo.PICK 등록하기</h3>
          <div>당신이 추천하고 싶은 작품을 소개해주세요.</div>
        </div>
      </div>
      <div>
        <form
          onSubmit={submitEmopick}
          css={formCSS({ isDeskTop, isTablet, isMobile })}
        >
          <div css={innerCSS({ isDeskTop, isTablet, isMobile })}>
            <div
              css={[
                formColumnCSS({ isDeskTop, isTablet, isMobile }),
                titleCSS({ isDeskTop, isTablet, isMobile }),
              ]}
            >
              <h3>
                제목<span>2자 이상 30자 이하로 작성해주세요.</span>
              </h3>
              <input
                type="text"
                id="title"
                css={inputTextCSS({ isDeskTop, isTablet, isMobile })}
                placeholder="제목을 입력해주세요."
              />
            </div>
            <div
              css={[
                formColumnCSS({ isDeskTop, isTablet, isMobile }),
                contentCSS({ isDeskTop, isTablet, isMobile }),
              ]}
            >
              <h3>
                내용<span>10자 이상 500자 이하로 작성해주세요.</span>
              </h3>
              <textarea
                name="content"
                id="content"
                css={TextareaCSS({ isDeskTop, isTablet, isMobile })}
                placeholder="내용을 입력해주세요."
              ></textarea>
            </div>
          </div>
          <div
            css={[
              innerCSS({ isDeskTop, isTablet, isMobile }),
              recommendCSS({ isDeskTop, isTablet, isMobile }),
            ]}
          >
            <div css={formColumnCSS({ isDeskTop, isTablet, isMobile })}>
              <h3>
                추천 작품 & 리뷰<span>추천 작품과 리뷰를 남겨주세요.</span>
              </h3>
              <div css={searchBarCSS({ isDeskTop, isTablet, isMobile })}>
                $
                {isMobile ? (
                  <SearchBarMobile
                    isSearchClicked={false}
                    setIsSearchBoxOpen={setIsSearchBoxOpen}
                  />
                ) : (
                  <SearchBar setIsSearchBoxOpen={setIsSearchBoxOpen} />
                )}
              </div>
              <div css={bookSetCSS({ isDeskTop, isTablet, isMobile })}>
                {/* 여기는 스크롤 */}
                <div>
                  {/* 맵으로 합니다 */}
                  <div
                    css={bookThumbnailCSS({ isDeskTop, isTablet, isMobile })}
                  >
                    여기에 웹툰 웹소설 썸네일
                  </div>
                  <div css={bookReviewCSS({ isDeskTop, isTablet, isMobile })}>
                    {/* 여기에 추천 문구 */}
                    <textarea
                      name="review"
                      css={TextareaCSS({ isDeskTop, isTablet, isMobile })}
                      placeholder="내용을 입력해주세요."
                    ></textarea>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div css={innerCSS({ isDeskTop, isTablet, isMobile })}>
            <div css={buttonWrapCSS({ isDeskTop, isTablet, isMobile })}>
              <button id="preview_button" type="button">
                뒤로 가기
              </button>
              <button
                id="submit_button"
                css={submitButtonCSS({ isDeskTop, isTablet, isMobile })}
                type="submit"
              >
                제출
              </button>
            </div>
          </div>
        </form>
      </div>
      <EmopickSearchModal />
    </div>
  );
};

interface IsResponsive {
  isDeskTop: boolean;
  isTablet: boolean;
  isMobile: boolean;
}

const innerCSS = ({ isDeskTop, isTablet, isMobile }: IsResponsive) => css`
  padding: ${isDeskTop ? "20px 105px" : isTablet ? "15px 50px" : "10px 20px"};
`;
const pageTitleCSS = ({ isDeskTop, isTablet, isMobile }: IsResponsive) => css`
  background-color: var(--main-color);
  & > div {
    display: flex;
    flex-direction: ${isMobile ? "column" : "row"};
    align-items: ${isMobile ? "flex-start" : "center"};
    justify-content: ${isMobile ? "center" : "flex-start"};
    height: ${isDeskTop ? "120px" : isTablet ? "100px" : "80px"};
    & > h3 {
      font-size: ${isDeskTop ? "24px" : isTablet ? "20px" : "18px"};
      font-weight: bold;
      margin-right: 10px;
    }
    & > div {
      font-size: ${isDeskTop ? "16px" : isTablet ? "14px" : "12px"};
      margin-top: ${isMobile ? "8px" : "0px"};
    }
  }
`;
const formCSS = ({ isDeskTop, isTablet, isMobile }: IsResponsive) => css``;
const formColumnCSS = ({ isDeskTop, isTablet, isMobile }: IsResponsive) =>
  css`
    padding: ${isDeskTop ? "20px 0" : isTablet ? "15px 0" : "10px 0"};
    & > h3 {
      display: flex;
      justify-content: flex-start;
      align-items: center;
      font-size: ${isDeskTop ? "20px" : isTablet ? "17px" : "14px"};
      font-weight: bold;
      height: 40px;
      & > span {
        font-size: ${isDeskTop ? "14px" : isTablet ? "14px" : "12px"};
        font-weight: normal;
        color: var(--text-color-3);
        margin-left: 10px;
      }
    }
  `;
const inputTextCSS = ({ isDeskTop, isTablet, isMobile }: IsResponsive) => css`
  width: 100%;
  height: ${isMobile ? "30px" : "50px"};
  border-radius: 5px;
  font-size: ${isDeskTop ? "16px" : isTablet ? "14px" : "12px"};
  padding: 10px;
  border: none;
  background-color: var(--back-color-2);
  ::placeholder {
  }
`;
const TextareaCSS = ({ isDeskTop, isTablet, isMobile }: IsResponsive) => css`
  width: 100%;
  font-size: ${isDeskTop ? "16px" : isTablet ? "14px" : "12px"};
  padding: 14px 10px;
  border-radius: 5px;
  resize: none;
  overflow-y: scroll;
  border: none;
  background-color: var(--back-color-2);
  height: 240px;
`;
const titleCSS = ({ isDeskTop, isTablet, isMobile }: IsResponsive) => css``;
const contentCSS = ({ isDeskTop, isTablet, isMobile }: IsResponsive) => css``;
const recommendCSS = ({ isDeskTop, isTablet, isMobile }: IsResponsive) => css`
  background-color: var(--main-color-2);
`;
const searchBarCSS = ({ isDeskTop, isTablet, isMobile }: IsResponsive) =>
  css`
    /* cursor: pointer;
    height: 40px;
    border-radius: 5px;
    border: none;
    background-color: var(--main-color);
    margin-left: 10px;
    font-size: 16px;
    display: flex;
    justify-content: center;
    align-items: center;
    width: 160px;
    > svg {
      margin-right: 6px;
    } */
  `;
const searchModalCSS = ({ isDeskTop, isTablet, isMobile }: IsResponsive) =>
  css``;
const bookSetCSS = ({ isDeskTop, isTablet, isMobile }: IsResponsive) => css`
  height: 400px;
  padding: ${isDeskTop ? "30px 30px" : isTablet ? "20px 20px" : "20px 20px"};
  overflow-y: scroll;
  background-color: var(--back-color);
  border-radius: 5px;
  ::-webkit-scrollbar-track {
    background-color: rgba(0, 0, 0, 0);
    border-radius: 10px;
  }
  & > div {
    display: grid;
    grid-template-columns: 180px 1fr;
    column-gap: 20px;
  }
`;
const bookThumbnailCSS = ({ isDeskTop, isTablet, isMobile }: IsResponsive) =>
  css`
    border-radius: 5px;
    background-color: var(--back-color-3);
    height: 240px;
  `;
const bookReviewCSS = ({ isDeskTop, isTablet, isMobile }: IsResponsive) =>
  css``;
const buttonWrapCSS = ({ isDeskTop, isTablet, isMobile }: IsResponsive) =>
  css`
    width: ${isMobile ? "100%" : "500px"};
    margin: 0 auto;
    display: grid;
    grid-template-columns: 1fr 1fr;
    column-gap: 20px;
    & > button {
      cursor: pointer;
      height: 40px;
      border-radius: 5px;
      border: 1px solid var(--border-color-2);
      background-color: var(--back-color-2);
    }
  `;
const submitButtonCSS = ({ isDeskTop, isTablet, isMobile }: IsResponsive) =>
  css`
    background-color: var(--main-color) !important;
    border: none !important;
  `;

export default write;