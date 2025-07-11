
// img 3개
const preview1 = document.getElementById('preview1'); // 썸네일
const preview2 = document.getElementById('preview2');
const preview3 = document.getElementById('preview3');


const previewList = document.querySelectorAll('.preview'); // NodeList를 배열로 변환

// X 3개
const delete1 = document.getElementById('delete1'); // 썸네일
const delete2 = document.getElementById('delete2');
const delete3 = document.getElementById('delete3');

const deleteImageList = document.querySelectorAll(".delete-image");

const inputImage = document.getElementById('inputImage'); // input type file
const inputImageList = document.querySelectorAll(".inputImage"); // 5개 리스트

const addImage = document.getElementById('addImage'); // 파일첨부 버튼



const addImageBtn1 = document.getElementById('addImageBtn1'); // 파일 첨부 버튼
const addImageBtn2 = document.getElementById('addImageBtn2'); // 파일 첨부 버튼
const addImageBtn3 = document.getElementById('addImageBtn3'); // 파일 첨부 버튼


const uploadNames = document.querySelectorAll('.upload-name'); // 파일첨부명

// 이미지 선택 이후 취소를 누를 경우를 대비한 백업 이미지
// (백업 원리 -> 복제품으로 기존 요소를 대체함)
const backupInputList = new Array(inputImageList.length);



document.addEventListener("DOMContentLoaded", function() {
    
    previewList.forEach(function(preview) {
        preview.addEventListener("error", function() {
            // 이미지 로드 중에 오류가 발생한 경우
            if (this.id === "preview1") {
                this.alt = "썸네일 이미지";
            } else {
                this.alt = "일반 이미지";
            }
        });
    });
});

/* ***** input 태그 값 변경 시(파일 선택 시) 실행할 함수 ***** */
/**
 * @param inputImage : 파일이 선택된 input 태그
 * @param order : 이미지 순서
 */
const changeImageFn = (inputImage, order) => {

    // byte단위로 10MB 지정
    const maxSzie = 1024 * 1024 * 10;

    // 업로드된 파일 정보가 담긴 객체를 얻어와 변수에 저장
    const file = inputImage.files[0];


  // ------------- 파일 선택 -> 취소 해서 파일이 없는 경우 ----------------
    if(file == undefined){
    console.log("파일 선택 취소됨");

    // 같은 순서(order)번째 backupInputList 요소를 얻어와 대체하기

    /* 한 번 화면에 추가된 요소는 재사용(다른 곳에 또 추가) 불가능 */

    // 백업본을 한 번 더 복제
    const temp = backupInputList[order].cloneNode(true);

    inputImage.after(temp); // 백업본을 다음 요소로 추가
    inputImage.remove();    // 원본을 삭제
    inputImage = temp;      // 원본 변수에 백업본을 참조할 수 있게 대입

    // 백업본에 없는 이벤트 리스너를 다시 추가
    inputImage.addEventListener("change", e => {
    
        changeImageFn(e.target, order);
        
    })

        return;
    }


    // ---------- 선택된 파일의 크기가 최대 크기(maxSize) 초과 ---------

    if(file.size > maxSzie){
        alert("10MB 이하의 이미지를 선택해주세요");

        // 해당 순서의 backup 요소가 없거나, 
        // 요소는 있는데 값이 없는 경우 == 아무 파일도 선택된적 없을 때
        if(backupInputList[order] == undefined
            || backupInputList[order].value == ''){

            inputImage.value = ""; // 잘못 업로드된 파일 값 삭제
            return;
        }

        // 이전에 정상 선택 -> 다음 선택에서 이미지 크기 초과한 경우
        // 백업본을 한 번 더 복제
        const temp = backupInputList[order].cloneNode(true);

        inputImage.after(temp); // 백업본을 다음 요소로 추가
        inputImage.remove();    // 원본을 삭제
        inputImage = temp;      // 원본 변수에 백업본을 참조할 수 있게 대입
    
        // 백업본에 없는 이벤트 리스너를 다시 추가
        inputImage.addEventListener("change", e => {
            changeImageFn(e.target, order);
        })

        return;
    }


    // ------------ 선택된 이미지 미리보기 --------------

    const reader = new FileReader(); // JS에서 파일을 읽고 저장하는 객체

    // 선택된 파일을 JS로 읽어오기 -> reader.result 변수에 저장됨
    reader.readAsDataURL(file);

    reader.addEventListener("load", e => {
        const url = e.target.result;

        // img 태그(.preview)에 src 속성으로 url 값을 대입
        previewList[order].src = url;

        // 같은 순서 backupInputList에 input태그를 복제해서 대입
        backupInputList[order] = inputImage.cloneNode(true);
    });

    }




    for(let i=0 ; i<inputImageList.length ; i++){

    // **** input태그에 이미지가 선택된 경우(값이 변경된 경우) ****
    inputImageList[i].addEventListener("change", e => {
        changeImageFn(e.target, i);
    })


    // **** x 버튼 클릭 시 ****
    deleteImageList[i].addEventListener("click", () => {

        // img, input, backup의 인덱스가 모두 일치한다는 특징을 이용

        previewList[i].src       = ""; // 미리보기 이미지 제거
        inputImageList[i].value  = ""; // input에 선택된 파일 제거
        backupInputList[i] = undefined; // 백업본 제거
        uploadNames[i].value = "";

    });

}










// 작성 폼 유효성 검사
document.querySelector("#boardWriteForm").addEventListener("submit", e => {

    const boardTitle = document.querySelector("[name='boardTitle']");
    const boardContent = document.querySelector("[name='boardContent']");

    if(boardTitle.value.trim().length == 0){
        alert("제목을 작성해 주세요");
        boardTitle.focus();
        e.preventDefault();
        return;
    }

    if(boardContent.value.trim().length == 0){
        alert("내용을 작성해 주세요");
        boardContent.focus();
        e.preventDefault();
        return;
    }

});

