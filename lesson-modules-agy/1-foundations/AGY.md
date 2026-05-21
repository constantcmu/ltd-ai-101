---
provenance: subagent:ada
---

# Lesson 1: Foundations (พื้นฐานและจุดเริ่มต้น)

**เวลาที่ใช้: ~20-25 นาที**

**สิ่งที่คุณจะได้หลังจากจบบทนี้:** ภาพที่ชัดเจนว่าการทำงานร่วมกับ AI Coding Assistant แบบจับคู่ (Pair Programming) ใน Antigravity (agy) แตกต่างจากการแชททั่วไปอย่างไร (Chat vs Cowork vs Code/agy), ทัวร์พื้นที่ทำงานของ agy 3 จุดที่คนเพิ่งเริ่มต้นมักกลัว (Working Directory, Model Selection, Planning/Auto Modes), สร้างโฟลเดอร์โครงการแรกชื่อ `my-first-project` แยกต่างหากในหน้าต่างที่ 2, สร้างไฟล์ `AGY.md` ตัวแรกของคุณ, และสร้างคำสั่งย่อ `/brief TICKER` ตัวแรกที่จะช่วยวิเคราะห์หุ้นและบันทึกผลลงโฟลเดอร์ `briefs/` โดยก่อนจะจบบทนี้เราจะมาทดสอบคำสั่งนี้ด้วยชื่อหุ้นจริงกันนะครับ โฟลเดอร์เรียนรู้หลัก (หน้าต่างนี้) จะเปิดไว้เป็นติวเตอร์ส่วนตัวของคุณตลอดเวลาเลย

นี่คือพื้นฐานที่เราจะเอาไปสร้างต่อในบทเรียนที่เหลือทั้งหมดครับ Lesson 2 จะยกสถานะ `/brief` จากคำสั่งย่อธรรมดาให้กลายเป็นทักษะ (Skill) Lesson 3 จะเชื่อมต่อข้อมูลรายงานผลประกอบการ (Earnings Call Transcript) จริงเข้าไปเพื่อให้ส่วน `Latest earnings` ไม่ใช่แค่เดาจากความจำเดิม Lesson 4 จะแตกงานวิเคราะห์ออกเป็น 3 sub-agents ขนานกัน (Fundamentals อ่าน 10-K, Earnings อ่าน Transcript, News+Sentiment ค้นหาเว็บ) และ Lesson 5 จะเอาผลงานไปแชร์ (deploy) บนเว็บ ทุกอย่างจะสร้างทับจากชิ้นงานชิ้นเดียวกันนี้ขึ้นไปทีละชั้นเลยครับ

---

## ก่อนเริ่ม: ถ้าคุณยังไม่ได้เปิด folder นี้ใน Antigravity (agy)

- **Mac/Windows Desktop App:** เปิด agy แล้วไปที่ File > Open Folder (หรือ Open...) เลือก folder `ltd-ai-101` แล้วกด trust ถ้ามีป๊อปอัปถาม
- **Drag-drop:** ลาก folder `ltd-ai-101` ทั้งก้อนไปทับไอคอน agy ใน Dock (Mac) หรือ Taskbar (Windows) แล้วปล่อย
- **Verify:** ดูที่ chat input ด้านล่าง แล้วพิมพ์ `ฉันอยู่ folder ไหน?` ถ้า agy ตอบว่า `ltd-ai-101` คุณพร้อมแล้ว

---

## ช่วงเวลาที่คุณกำลังเริ่มต้น

ตอนนี้คุณมี Antigravity (agy) ติดตั้งและทำงานอยู่แล้ว คุณกำลังอ่านคู่มือนี้ผ่านผมอยู่เลย ดีครับ นั่นคือเส้นเริ่มต้นของคอร์สนี้

ใน 20-25 นาทีต่อจากนี้ เราจะ:

1. ทำความเข้าใจสั้นๆ ว่า Chat, Cowork, Code/agy ต่างกันยังไง (รู้ว่าครั้งหน้าจะเปิดอันไหน) ~3 min
2. ทัวร์หน้าจอ agy 3 จุดที่คนเพิ่งเริ่มกลัว โดยใช้ `ltd-ai-101` ที่เปิดอยู่ตอนนี้เป็นตัวอย่างจริง ~5-7 min
3. สร้าง folder `my-first-project` แล้วเปิด agy หน้าต่างที่ 2 (หน้าต่าง 1 คือคอร์สนี้ เก็บไว้) ~3 min
4. สร้าง `AGY.md` ตัวแรกใน `my-first-project` (paste prompt ในหน้าต่าง 2) ~5 min
5. สร้าง `/brief TICKER` slash command (paste prompt ในหน้าต่าง 2) ~5 min
6. ทดสอบด้วย `/brief AAPL` หรือ ticker ที่คุณอยากรู้จริง ในหน้าต่าง 2 ~3 min
7. เช็ค checklist ปิดท้าย ส่งต่อ Lesson 2

ทำอันนี้ให้ตรง บทต่อๆ ไปจะรู้สึกง่ายเพราะเรารู้แล้วว่า `/brief` มันทำงานยังไง

ถ้าอยากพักกลางคัน พิมพ์ `PAUSE` ผมเซฟไว้ให้แล้วกลับมาต่อได้

---

ACTION: Greet the student briefly in Thai. Do NOT recap the whole course (the README covered that). Just confirm you are about to start Lesson 1, tell them it takes about 20-25 minutes, and ask them this question:

"ก่อนเริ่ม ขอเช็คก่อนว่าตอนนี้คุณเปิด agy อยู่ที่โฟลเดอร์ `ltd-ai-101` ใช่ไหมครับ? ลองพิมพ์ในแชท: `pwd` หรือบอกผมว่าเห็นโฟลเดอร์อะไรบ้าง"

If they confirm they're in `ltd-ai-101`, continue with Step 1. If they say they're in a different folder, ask them to close agy and reopen it at the `ltd-ai-101` folder before continuing.

---

STOP: Wait for the student to confirm they are in `ltd-ai-101` (or tell you what they see).

---

USER: [Waits for student to confirm working directory before continuing]

---

## Step 1: Chat vs Cowork vs agy (รู้ว่าจะเปิดอันไหน)

ก่อนเริ่มทำ เรามาเข้าใจสั้นๆ ว่า AI มี 3 รูปแบบหลักๆ คุณกำลังนั่งอยู่ใน agy (อันที่ 3) แต่เพื่อให้รู้ว่าครั้งหน้าจะเปิดอันไหน เราดูทั้งสามตัวกันนะครับ

**Chat** คือ AI Web Chat (เช่น ChatGPT หรือ Gemini Web) บน browser คุณพิมพ์ถาม AI ตอบ แต่เขา **ไม่เห็น** เครื่องหรือไฟล์ของคุณเลย เหมือนคุยกับเพื่อนใน LINE เพื่อนช่วยตอบได้ แต่เห็นเฉพาะข้อความที่คุณพิมพ์ส่งให้

**Cowork** คือ AI desktop app ที่ช่วยทำงานสำนักงานทั่วไป (Office Tasks) AI **เห็นไฟล์ในเครื่องได้** ในโฟลเดอร์ที่คุณอนุญาต เช่น ช่วยแก้ Excel/PowerPoint/Word หรือใช้ Web Search ค้นหาข้อมูล แต่จะไม่ได้รันคำสั่ง Terminal หรือจัดการโค้ดให้คุณโดยตรง

**agy (Antigravity)** คือตัวที่คุณกำลังนั่งอยู่ตอนนี้เลยครับ AI **เห็นไฟล์ทั้งโฟลเดอร์ที่คุณเปิดอยู่** + สามารถรันคำสั่ง terminal + เขียน/แก้ไขไฟล์และโค้ด + ใช้งาน git ได้เต็มที่ เป็นแบบ Agentic โคตรทรงพลัง เหมาะกับสาย Dev หรือสร้างโปรเจกต์จริงจัง

เปรียบเทียบง่ายๆ เหมือนพนักงาน 3 ระดับ:

- **Chat** = พนักงานที่คุยตอบเก่งมากใน LINE แต่ไม่เห็นคอมพิวเตอร์ของคุณเลย
- **Cowork** = พนักงานออฟฟิศที่ช่วยเปิด Excel/PowerPoint บนเครื่องคุณได้ ช่วยเขียนสรุปเอกสารให้ได้ แต่ไม่ใช่สายลุยโค้ดหรือ Terminal
- **agy** = พนักงานเขียนโค้ดที่มานั่งข้างคุณ เห็นไฟล์ทั้งโฟลเดอร์ รันคำสั่ง Terminal และเขียนสคริปต์แก้ไขไฟล์ให้คุณได้เสร็จสรรพ

คอร์สนี้เราจะเน้นตัวที่ 3 (agy) ซึ่งเป็นตัวที่หลายคนมักกลัวที่สุดตอนเริ่ม แต่ถ้าค่อยๆ เดินตามกันไป ไม่ยากแน่นอนครับ

---

STOP: เข้าใจความต่างของ 3 รูปแบบนี้พอสังเขปไหมครับ? ถ้าเข้าใจ พิมพ์ "เข้าใจ" หรือ "ok" ได้เลยนะ หรือถ้ายังงงตรงไหน ถามผมได้เลยครับ

---

USER: [Waits for student to confirm understanding or ask clarifying questions]

---

ACTION: When the student responds:

1. If they say "เข้าใจ" or "ok" or anything affirmative, say "ดีครับ ไปดูหน้าจอกัน" and move to Step 2.
2. If they ask a clarifying question, answer it briefly in plain Thai. Use the analogy if helpful. Do not move on until they confirm understanding.
3. If they ask "แล้วผมจะใช้ Cowork เมื่อไหร่ ใช้ agy เมื่อไหร่?", answer: "Cowork เหมาะสำหรับงานเอกสารทั่วไป สรุปข้อมูล ค้นหาข้อมูลบนเว็บ ส่วน agy เหมาะสำหรับงานที่คุณต้องการให้ AI เข้าถึงไฟล์จริงๆ เช่น เขียน script แก้ไขโครงสร้างไฟล์ หรือเรียนรู้ในคอร์สนี้ครับ" Then move on.

---

## Step 2: ทัวร์หน้าจอ / 3 จุดที่คนเพิ่งเริ่มกลัว

ตอนนี้คุณอยู่ใน agy ที่โฟลเดอร์ `ltd-ai-101` เราเอาโฟลเดอร์นี้เป็นตัวอย่างประกอบจริงกันเลยครับ

มี 3 จุดบนหน้าจอของ agy ที่คนเพิ่งเริ่มใช้งานมักจะงงที่สุดครับ

### จุดที่ 1: Working Directory (โฟลเดอร์ทำงาน)

จุดนี้จะคอยบอกว่า agy กำลัง "นั่งทำงาน" อยู่ในโฟลเดอร์ไหนในเครื่องของคุณ (ปกติจะเห็นทางด้านบนหรือด้านล่างของหน้าต่างแชท) ตอนนี้น่าจะเป็นโฟลเดอร์ที่ลงท้ายด้วย `/ltd-ai-101`

นี่คือจุดสำคัญมากครับ เพราะ agy จะเห็นเฉพาะของที่อยู่ในโฟลเดอร์นี้และโฟลเดอร์ย่อยเท่านั้น ถ้าคุณเปิด agy ที่ Desktop ตรงๆ มันจะเห็นทุกไฟล์บนหน้าจอ ซึ่งอาจจะไม่ค่อยปลอดภัย ดังนั้นเราควรเปิด agy เฉพาะในโฟลเดอร์ที่เราต้องการทำงานด้วยเท่านั้นครับ

ลองพิมพ์ในแชทดูครับ:

```
pwd
```

หรือถ้าถนัดพิมพ์คุยปกติ:

```
ตอนนี้ฉันอยู่ที่โฟลเดอร์ไหน?
```

agy จะตอบที่อยู่ (path) ปัจจุบันกลับมาให้คุณดู

### จุดที่ 2: การเลือก Model

โมเดลที่เราเลือกใช้ใน agy จะมีผลต่อความฉลาดและความเร็วในการทำงาน:

- **Gemini Pro (Pro Model)** = ตัวหลักที่ฉลาดที่สุด วิเคราะห์โค้ด ซับซ้อน วางแผนอย่างเป็นระบบได้ยอดเยี่ยม เหมาะสำหรับงานวางแผน โครงสร้างหลัก หรือแก้ปัญหาโค้ดยากๆ
- **Gemini Flash (Flash Model)** = ตัวเบาที่ทำงานรวดเร็วมาก เหมาะสำหรับงานแก้ไขสั้นๆ เล็กๆ น้อยๆ หรือรันสคริปต์ที่ไม่ต้องวิเคราะห์ซับซ้อนมาก

กฎการทำงานของผมคือ ใช้ Gemini Pro เป็นตัวตั้งต้นสำหรับการวางแผนและแกนหลัก เพราะมันเข้าใจเป้าหมายและไม่มั่วโครงสร้าง ส่วน Flash จะเอาไว้รันสเกลทีหลังครับ

### จุดที่ 3: โหมดการทำงาน (Planning Mode vs Direct Execution)

อันนี้สำคัญสุดๆ สำหรับมือใหม่เลยครับ agy มีโหมดการทำงานหลักที่สลับได้:

1. **Planning Mode (โหมดวางแผนก่อนทำ)**: โหมดนี้ agy จะทำตัวเรียบร้อยมาก มันจะไม่เข้าไปแก้ไฟล์ในเครื่องของคุณทันที แต่จะทำการวิเคราะห์ เขียน "แผนการติดตั้ง (implementation plan)" และกำหนดรายการงาน (task.md) เสนอให้คุณตรวจและกดยืนยัน (Approve) ก่อนลุยงานจริงเสมอ
2. **Direct Execution / Auto (โหมดสั่งลุยทันที)**: agy จะลงมือเขียนและแก้ไขไฟล์ให้คุณทันทีโดยไม่ต้องรอเสนอแผน เหมาะกับกรณีที่คุณมั่นใจมาก หรือเป็นงานแก้ไขเล็กๆ น้อยๆ เท่านั้น

**กฎเหล็กของผมคือ ในคอร์สนี้เราจะใช้ Planning Mode เป็นหลักครับ** เพราะจะทำให้เราเห็นภาพชัดเจนว่า agy กำลังจะทำอะไร ช่วยลดข้อผิดพลาด และฝึกให้เราหัดตรวจทานแผนงานไปในตัวด้วยครับ

เปรียบเทียบง่ายๆ เหมือนการเทรนพนักงานใหม่:
- วันแรกๆ: ให้เขาวางแผนบนกระดาษมาเสนอคุณก่อนลงมือทำจริง (Planning Mode)
- เมื่อเก่งขึ้น: ให้เขาทำเองได้เลย ค่อยตรวจผลลัพธ์ทีหลัง (Direct/Auto)

ใน Planning Mode เวลา agy เสนอแผนมา จะมีปุ่มให้คุณกด Approve หรือคุณสามารถพิมพ์ในช่องแชทว่า "approve" หรือ "ลุยเลย" ก็ได้เช่นกันครับ

---

STOP: ลองดูบนหน้าจอ agy ของคุณตอนนี้หน่อยครับ:

1. คุณเห็น Working Directory บอกทางไหนบ้าง (ลงท้ายด้วย `/ltd-ai-101` ไหม)
2. สังเกตเห็นจุดที่บอกรุ่น Model ปัจจุบันไหม (ถ้าใช้ Gemini Pro หรือ Flash อยู่)
3. ลองเช็คสิว่าตอนนี้คุณอยู่ใน Planning Mode หรือเปล่า (ลองถามผมในแชทนี้ก็ได้ว่า "ตอนนี้ผมอยู่ใน Planning Mode หรือเปล่า")

ตอบกลับผมมาทั้ง 3 ข้อเลยนะครับ ถ้าติดข้อไหนบอกผมได้เลย

---

USER: [Waits for student to identify the 3 UI elements]

---

ACTION: When the student responds:

1. If they identify all 3 correctly, say "ดีครับ คุณรู้จักหน้าจอแล้ว ต่อไปเราจะเปิดหน้าต่างที่ 2 มาสร้างของของคุณเอง คอร์สนี้ยังเปิดอยู่ตรงนี้" Move to Step 3.
2. If they can't find one of the elements, first tell them to ask agy directly in chat: "ตอนนี้ฉันใช้โมเดลอะไร และอยู่ในโหมดไหน" agy will answer. The exact location of UI elements varies, so the chat route is more reliable. Only if that doesn't unblock them, walk them through it step by step.
3. If they're not sure about the mode and the chat trick didn't help, suggest restarting agy once.

---

## Step 3: สร้าง `my-first-project` แล้วเปิด agy หน้าต่างที่ 2

ตอนนี้คุณอยู่ในโฟลเดอร์ `ltd-ai-101` ซึ่งเป็นโฟลเดอร์เนื้อหาของคอร์สเรียน ของจริงเราต้องไปทำในโฟลเดอร์ใหม่ของคุณเอง เพื่อให้โฟลเดอร์คอร์สนี้สะอาด ไม่ปนไฟล์งานอื่นๆ ครับ

**Project folder** (โฟลเดอร์โปรเจกต์) คือโฟลเดอร์ที่ agy "นั่งทำงานอยู่" ในตอนนั้น ซึ่ง agy จะเห็นเฉพาะสิ่งของในโฟลเดอร์นั้นเท่านั้น ห้ามเปิด agy ที่ Desktop หรือ Documents ตรงๆ เพราะมันจะดึงข้อมูลเยอะและไม่ปลอดภัยครับ

### 3.1 สร้างโฟลเดอร์ `my-first-project`

ในเครื่องคอมพิวเตอร์ของคุณ ให้สร้างโฟลเดอร์ใหม่ชื่อ `my-first-project` ไว้ที่ **Desktop** (เพราะจะหาเจอได้ง่ายในเวลาปกติ):

- **Mac:** เปิด Finder ไปที่ Desktop กด Cmd+Shift+N สร้างโฟลเดอร์ใหม่ ตั้งชื่อ `my-first-project`
- **Windows:** เปิด File Explorer ไปที่ Desktop คลิกขวา New > Folder ตั้งชื่อ `my-first-project`

คุณจะตั้งชื่อโฟลเดอร์เป็นตัวเล็กหรือตัวใหญ่ก็ได้ครับ แต่ในคอร์สเรียนนี้ผมจะยกตัวอย่างเป็น `my-first-project` ตลอดนะครับ

### 3.2 เปิด agy หน้าต่างที่ 2

เราจะเปิดหน้าต่าง agy ขึ้นมาอีกบานหนึ่ง **อย่าเพิ่งปิดหน้าต่างบานหลักนี้นะครับ** หน้าต่างบานแรกนี้คือผม (ผู้สอน) ที่จะคอยแนะนำ ส่วนหน้าต่างบานใหม่จะเป็นห้องทดลองเวิร์กชอปของคุณ คุณสามารถสลับหน้าต่างไปมาได้เลยครับ

**Desktop App:** เปิดแอป Antigravity (agy) ขึ้นมาอีกหนึ่งหน้าต่าง (อาจกด Ctrl+N หรือ File > New Window ตามเครื่องของคุณ) แล้วกดเปิดโฟลเดอร์ (Open Folder) ไปที่โฟลเดอร์ `my-first-project` ที่เราเพิ่งสร้างไว้

**Terminal / CLI:** เปิด Terminal ขึ้นมาอีกบานหนึ่ง แล้วพิมพ์ `cd` เข้าไปที่โฟลเดอร์ `my-first-project` แล้วจึงพิมพ์เปิดใช้งาน `agy`
- Mac: `cd ~/Desktop/my-first-project && agy`
- Windows: `cd $HOME\Desktop\my-first-project; agy`

### 3.3 การจัดการ 2 หน้าต่าง

หน้าต่างที่ 1 (โฟลเดอร์ `ltd-ai-101`) = ผมกำลังสอนคุณอยู่ตรงนี้
หน้าต่างที่ 2 (โฟลเดอร์ `my-first-project`) = agy เปล่าๆ ที่รอคุณป้อนคำสั่งลุยงาน

คุณสามารถสลับสองหน้าต่างนี้ไปมาด้วยปุ่ม Alt+Tab (Windows) หรือ Cmd+Tab (Mac)

ในขั้นตอนต่อจากนี้ไป ผมจะส่ง Prompt (ข้อความคำสั่ง) ให้คุณนำไปก็อปปี้และวางใน **หน้าต่างที่ 2** จากนั้นค่อยกลับมารายงานความคืบหน้าให้ผมฟังใน **หน้าต่างที่ 1** นี้นะครับ

---

STOP: บอกผมทีครับว่า:

1. คุณสร้างโฟลเดอร์ `my-first-project` ในคอมพิวเตอร์ของคุณแล้วหรือยัง
2. คุณเปิดหน้าต่าง agy บานที่ 2 ไปที่โฟลเดอร์ใหม่นั้นเรียบร้อยแล้วใช่ไหม ลองเช็คด้วยการถาม agy ในหน้าต่างที่ 2 ว่า "ตอนนี้อยู่โฟลเดอร์ไหน" แล้วตอบผมว่าลงท้ายด้วยชื่อโฟลเดอร์ที่คุณเพิ่งสร้างหรือเปล่าครับ

---

USER: [Waits for student to confirm folder created + window 2 open at my-first-project]

---

ACTION: When the student responds:

1. If folder is created AND window 2's working directory ends with the folder name they chose, note the name they used and confirm, then move to Step 4.
2. If they accidentally created the folder inside `ltd-ai-101`, ask them to move it out into Documents or Desktop. Wait for fix.
3. If they used any other name than `my-first-project`, that is fine. Note the name they chose. For the rest of the lesson, remind them once that their folder is named differently and they should substitute their actual name.
4. If window 2 is at the wrong folder, ask them to close window 2 and reopen at the correct folder. Don't proceed until window 2 is at their project folder.
5. If they ask "ทำไมไม่ปิดหน้าต่าง 1?" reassure: "หน้าต่าง 1 คือผม (ผู้สอน) ทุก step ที่เหลือผมจะพาคุณทำ ถ้าปิดหน้าต่าง 1 ผมจะหาย ต้องเริ่มใหม่ หน้าต่าง 2 คือ agy เปล่าๆ ที่ทำงานใน folder ใหม่แยกอิสระกันครับ"

---

## Step 4: สร้าง `AGY.md` ตัวแรกใน `my-first-project`

`AGY.md` คือ "บัตรประจำตัวของโปรเจกต์" เป็นไฟล์พิเศษที่ agy จะเข้ามาอ่านโดยอัตโนมัติทุกครั้งที่เริ่มรันในโฟลเดอร์นี้ ทำให้ AI ทราบสไตล์ ขอบเขตงาน และกฎเกณฑ์ต่างๆ โดยที่เราไม่ต้องมาคอยนั่งพิมพ์อธิบายบอกกันใหม่ทุกเช้าครับ

เปรียบเหมือนวันแรกที่คุณรับพนักงานใหม่เข้ามาทำงาน แล้วคุณยื่นเอกสารให้เขาบอกว่า "บริษัทเราทำโปรเจกต์อะไร มีกฎอะไรบ้าง ห้ามทำอะไรบ้าง" พนักงานคนนี้ก็จะอ่านวันแรกและทำงานตามแนวนั้นทันที

ACTION: Hand the student this prompt to paste in **window 2** Tell them clearly: "ก็อปปี้ทั้งบล็อกข้อความข้างล่างนี้ แล้วเอาไปวางส่งในแชทของหน้าต่างที่ 2 (โฟลเดอร์ my-first-project) จากนั้นค่อยกลับมาคุยกับผมที่นี่นะครับ"

````text
สร้างไฟล์ AGY.md ใน folder นี้ด้วยเนื้อหาตามนี้:

# Project: My First Project

**What this is:** โปรเจกต์ทดลองตัวแรกของผม เพื่อหัดใช้ Antigravity (agy) ในการสร้าง slash command, skill, และ sub-agent ระหว่างเรียน LTD AI 101

## วิธีทำงาน

- ก่อนทำอะไรที่แก้ไฟล์เยอะหรือลบของ ให้เสนอแผนงานใน Planning Mode เสมอ
- แก้ไขไฟล์ที่มีอยู่แล้ว อย่าสร้างใหม่ถ้าไม่จำเป็นจริงๆ
- ตอบคำถามให้ตรงประเด็น ไม่ล้อมค้อม
- ใช้ได้ทั้งภาษาไทยและภาษาอังกฤษ

## โครงสร้างโฟลเดอร์

- `briefs/` สำหรับจัดเก็บไฟล์เอกสารสรุปหุ้นที่คำสั่ง /brief สร้างขึ้น
- `.agy/commands/` สำหรับเก็บไฟล์คำสั่งย่อ (slash command files)

## กฎและข้อห้าม

- ห้ามรันคำสั่งลบโฟลเดอร์แรงๆ (เช่น rm -rf) โดยไม่ได้รับอนุญาตก่อนเด็ดขาด
- ห้ามไปแก้ไขหรือยุ่งเกี่ยวกับไฟล์นอกโฟลเดอร์นี้เด็ดขาด

ทำเลยครับ
````

---

STOP: บอกผมทีครับว่า agy ในหน้าต่างที่ 2 ตอบกลับมาว่าอย่างไรบ้าง และเมื่อเปิดดูในโฟลเดอร์ `my-first-project` มีไฟล์ `AGY.md` โผล่มาและมีเนื้อหาข้างในตามนั้นเรียบร้อยดีไหมครับ (เช็คด้วยการเปิดดูผ่าน Finder/Explorer หรือจะถาม agy ในหน้าต่างที่ 2 ว่า "ขอดูเนื้อหาในไฟล์ AGY.md หน่อย" ก็ได้ครับ)

---

USER: [Waits for student to report agy's response in window 2 + verify AGY.md content]

---

ACTION: When the student responds:

1. If agy in window 2 created AGY.md and the file content matches, say "ดีครับ ไฟล์ AGY.md พร้อมแล้ว ต่อไป slash command." Move to Step 5.
2. If agy in window 2 asked permission instead of creating (Planning Mode), tell them: "หน้าต่าง 2 อยู่ใน Planning Mode ให้คุณกด Approve แผนของ agy ก่อน หรือพิมพ์บอกว่า 'ทำได้เลย' เพื่อเริ่มสร้างไฟล์ครับ" Wait until file exists.
3. If file was created but content is different, ask them to paste the prompt again exactly. Don't move on with a wrong AGY.md.
4. If agy in window 2 created the file in the wrong place, ask them to ask agy in window 2 to move it to the project root.

---

## Step 5: สร้างคำสั่งลัด `/brief TICKER` (เวอร์ชัน 0)

**Slash Command** (คำสั่งย่อที่นำหน้าด้วยตัว `/`) คือปุ่มลัดหรือคีย์ลัดส่วนตัวของ agy แทนที่จะต้องมาพิมพ์เขียน Prompt ยาวๆ ทุกครั้งที่คุณอยากให้ AI ทำอะไรเฉพาะทาง คุณสามารถเขียนมันไว้เป็นคำสั่งสั้นๆ แล้วพิมพ์เรียกมาใช้ซ้ำได้เรื่อยๆ เลยครับ

เหมือนเวลาเราพิมพ์คุยกันใน LINE แล้วพิมพ์แฮชแท็กหรือใช้คีย์ลัดในโปรเจกต์นั่นแหละครับ พิมพ์คำเดียวปุ๊บ ระบบลุยงานตามแผนงานที่เราใส่ไว้ทันที

ในขั้นตอนนี้เราจะสร้างคำสั่ง `/brief หุ้น` ที่จะคอยรับชื่อหุ้น (Ticker) เข้าไปวิเคราะห์ จากนั้นบันทึกผลเป็นไฟล์สรุป Markdown ลงโฟลเดอร์ `briefs/` ซึ่งนี่คือเวอร์ชันแรก (v0) ของเราครับ ในบทต่อๆ ไปเราจะเติมความเจ๋งให้มันไปเรื่อยๆ จนน่าทึ่งเลย

ไฟล์ของ Slash Command จะถูกเก็บเอาไว้ในโฟลเดอร์ลับ `.agy/commands/` ครับ (ที่มีจุดนำหน้าเพราะเป็นชื่อโฟลเดอร์ซ่อนในระบบตามหลักการสากล ปกติใน Finder หรือ Explorer จะไม่โชว์ให้เห็นโดยตรงครับ แต่เราสั่งให้ AI คุมไฟล์ได้สบายมาก)

ACTION: Hand the student this prompt to paste in **window 2**

````text
สร้างไฟล์ใหม่ที่ .agy/commands/brief.md ด้วยเนื้อหาตามนี้:

---
description: Research a stock ticker and save a brief to briefs/<TICKER>.md
---

You are running the /brief command.

The user will give you a stock ticker (e.g. AAPL, NVDA, GOOGL). Your job:

1. Research the company behind the ticker. Use what you know.
2. Produce a brief with these 4 sections:
   - **What the company does** (2-3 sentences in Thai, plain language)
   - **Latest earnings** (3-5 bullet points based on the most recent quarterly earnings call you know of; if you cannot verify which quarter is most recent, say so honestly. Lesson 3 will plug in a real earnings transcript so this section stops relying on training memory.)
   - **Bull case / Bear case** (2-3 bullets each)
   - **What to ask before owning it** (3-5 questions a beginner should consider)
3. If the briefs/ folder does not exist, create it.
4. Save the brief as briefs/<TICKER>.md (uppercase ticker in the filename).
5. Also show the full brief in chat.

If the user did not give a ticker, ask which ticker before doing anything.

Do not give a buy/sell recommendation. This is a research summary, not advice.

ทำเลยครับ
````

---

STOP: บอกผมหน่อยครับว่าไฟล์ `.agy/commands/brief.md` ถูกสร้างเรียบร้อยดีไหม ลองให้ agy ในหน้าต่างที่ 2 คอนเฟิร์มด้วยการถามเขาว่า "มีไฟล์ brief.md อยู่ในโฟลเดอร์ .agy/commands/ หรือยัง และขอดูเนื้อหาหน่อย" ยืนยันว่า path ถูกต้องนะครับ

---

USER: [Waits for student to verify brief.md exists at the correct path]

---

ACTION: When the student responds:

1. If path is `.agy/commands/brief.md` exactly, say "ดี slash command พร้อม ลองเรียกใช้กัน" Move to Step 6.
2. If path is different (e.g. `commands/brief.md` without the dot, or in project root), ask them to paste in window 2: "ย้ายไฟล์ brief.md ไปที่ .agy/commands/brief.md" or "move brief.md to `.agy/commands/brief.md`". Wait for fix before moving on.
3. If `.agy/` folder isn't visible in their file tree, that's normal (hidden folder). The path check via agy in window 2 is the source of truth.
4. If agy in window 2 asked for approval first (Planning Mode), tell them to approve the plan. Wait for file creation before checking path.

---

## Step 6: ทดสอบ `/brief` ด้วย ticker จริง

**ก่อนที่จะทดลองรัน มีข้อควรรู้นะครับ**
ครั้งแรกที่คุณลองพิมพ์ใช้คำสั่ง `/brief AAPL` ในหน้าต่างที่ 2 ระบบอาจจะยังไม่รู้จักคำสั่งนี้เพราะเพิ่งถูกสร้างขึ้นมาใหม่ และอาจจะขึ้นข้อความเตือนว่า `Unknown command` หรือมองว่ามันเป็นแค่ประโยคคุยธรรมดา

อันนี้เป็นเรื่องปกติของเครื่องมือระดับโปรแกรมเมอร์ครับ เราต้องทำการ restart (เริ่มใหม่) หรือรีโหลดหน้าแชทของ agy เสียก่อน เพื่อให้โปรแกรมโหลดเอาคำสั่งย่อใหม่ล่าสุดที่เราเพิ่งสร้างเข้าไป

**วิธี Restart หน้ารันของ agy (ในหน้าต่างที่ 2):**

1. **ถ้าใช้ Desktop App:** ปิดหน้าต่างที่ 2 นั้นลงไปเลยครับ แล้วค่อยสั่งเปิดแอปขึ้นมาใหม่ ชี้ไปที่โฟลเดอร์ `my-first-project` เหมือนเดิม
2. **ถ้าใช้ Terminal / CLI:** พิมพ์คำสั่งลัด `/exit` ในแชทของหน้าต่างที่ 2 เพื่อปิดไปก่อน แล้วค่อยรันคำสั่ง `agy` ในหน้าต่าง Terminal เดิมอีกครั้งหนึ่งเพื่อเปิดระบบขึ้นมาใหม่

เมื่อเริ่มต้นหน้าต่างที่ 2 บานใหม่เสร็จแล้ว ให้ลองพิมพ์ในแชทของ **หน้าต่างที่ 2** ว่า:

```
/brief AAPL
```

(หรือชื่อย่อหุ้นบริษัทอื่นๆ ที่คุณชอบและอยากทดสอบวิเคราะห์ เช่น `/brief NVDA` หรือ `/brief TSLA` ก็ได้หมดเลยครับ)

ผลลัพธ์ที่ agy ควรจะทำให้คือ:

1. ตรวจพบคำสั่งและสร้างโฟลเดอร์ `briefs/` ขึ้นมาให้โดยอัตโนมัติ (หากยังไม่มี)
2. ทำการสืบค้นข้อมูลบริษัทแล้วบันทึกไฟล์สรุปไว้ที่ `briefs/AAPL.md` (ชื่อ Ticker จะเป็นตัวใหญ่ในชื่อไฟล์)
3. พิมพ์แสดงข้อมูลผลการสรุปเป็นรายงานภาษาไทย 4 หัวข้อหลักขึ้นมาให้เราเห็นในช่องแชทพร้อมๆ กันด้วย

(ถ้าหน้าต่างที่ 2 ของคุณยังตั้งเป็น Planning Mode อยู่ agy ก็จะเสนอแผนให้คุณกดยอมรับ "Approve" ก่อนนะครับ ซึ่งก็กดยืนยันหรือพิมพ์ตอบว่า "ลุยเลย" ได้ตามปกติเลยครับ)

**หมายเหตุสำคัญข้อเท็จจริง:** เนื่องจากตอนนี้ข้อมูลบริษัทมาจากข้อมูลเดิมของตัว AI (ความจำฐานข้อมูลเดิม) ดังนั้นหากข้อมูลไตรมาสล่าสุดมันเก่าไป หรือ AI ยอมรับตรงๆ ว่าขาดข้อมูลช่วงล่าสุด อันนั้นถือว่าเป็นพฤติกรรมที่ยอมรับได้ครับและเหมาะสมแล้ว เพราะใน **Lesson 3** เราจะมาเรียนรู้วิธีป้อนข้อมูลผลประกอบการของจริง (Earnings Call Transcript) ให้กับ AI อ่านประกอบโดยไม่ต้องเดาข้อมูลเองกันครับ

ACTION: Tell the student to run `/brief AAPL` (or another ticker) in **window 2**, then come back to window 1.

---

STOP: กลับมารายงานผลในหน้าต่างที่ 1 (บานนี้) ให้ฟังหน่อยครับว่า:

1. ในหน้าต่างที่ 2 พิมพ์รัน `/brief AAPL` แล้วได้สรุปภาษาไทย 4 หัวข้อครบถ้วนไหม หรือมีปัญหาระบบหาคำสั่งไม่เจอหรือเปล่า
2. เมื่อเปิดเข้าไปดูในคอมพิวเตอร์ของคุณที่โฟลเดอร์ `my-first-project/briefs/` มีไฟล์สรุปหุ้นโผล่มาจริงไหม
3. ตรงข้อมูลสรุป `ผลประกอบการล่าสุด (Latest earnings)` ตัว AI ตอบยอมรับตรงๆ ว่าไม่แน่ใจข้อมูลใหม่สุด หรือมันแกล้งแต่งตัวเลขข้อมูลมั่วซั่วขึ้นมาเองครับ

---

USER: [Waits for student to report /brief output and file content]

---

ACTION: When the student returns and reports:

1. If brief has 4 sections AND Latest earnings is honest about lacking real-time data, say (in Paint's friendly voice): "เป็นไง เจ๋งมะ แค่ 1 prompt ก็มี research ออกมาเลย แต่ผมรู้มันยังไม่ค่อยกาว เดี๋ยวเรามาค่อยๆ เพิ่มอันนี้ใน lesson ต่อๆ ไปนะ ผ่าน foundation แน่นแล้ว `/brief` ทำงานในเครื่องคุณจริง" Move to Step 7.
2. If `/brief` was treated as plain text (agy echoed the command back as a literal string, OR the student saw `Unknown command: /brief` even after restart), first check window-2 was actually restarted (the warning at the top of Step 6 is the most common stumble: students try to run /brief without closing-and-reopening the Desktop App, or skip the `/exit` + `agy` relaunch if they started from terminal). If yes, ask agy in window 2: "show full path of brief.md ที่เพิ่งสร้าง". It must be at `.agy/commands/brief.md` (lowercase, with the leading dot). If wrong, ask agy in window 2 to move it, then restart window 2 and re-test.
3. If agy fabricated specific earnings headlines that look made up (specific revenue numbers + quarter + dates that agy cannot have known to the day), say honestly: "อันนี้คือสาเหตุที่ Lesson 3 ต้อง feed earnings transcript จริง ตอนนี้ agy แต่งตัวเลขเพราะมันไม่มี data จริงในมือ v0 ของเรา expected behavior คือ 'ไม่มี data quarter ล่าสุด' หรือ 'นี่คือ pattern ทั่วไปที่ควรดู' ทำงานต่อ Lesson 2 ผมจะใส่ SOP ที่บังคับ honest ก่อน แล้ว Lesson 3 ค่อยใส่ source จริง" Move to Step 7 anyway, the skeleton works.
4. If `briefs/AAPL.md` was created but only has 1-2 sections, ask them to run `/brief` again on a different ticker in window 2. Sometimes the first run gets truncated. If it keeps happening, tell them: "ไม่เป็นไรครับ skeleton ของ /brief พร้อมแล้ว Lesson 2 จะ tighten output เป็น SOP ที่บังคับให้ครบ 4 section." Move to Step 7.
5. If `briefs/` folder wasn't created at all, ask them in window 2 to ask agy: "ทำไม briefs/ folder ไม่ถูกสร้าง ลองรัน /brief AAPL ใหม่ดู". Wait for fix.

---

## Step 7: เช็คความเรียบร้อย + ปิดท้าย

(ในขั้นตอนนี้ให้พิมพ์ตอบผมในหน้าต่างที่ 1 บานนี้เท่านั้นครับ ไม่ต้องพิมพ์ส่งในหน้าต่างที่ 2 แล้วนะ)

ก่อนที่เราจะปิดตัวบทเรียนที่ 1 มาตรวจความพร้อมของ Checklist โครงการในหน้าต่าง 2 กันก่อนนะครับ:

1. หน้าต่างที่ 2 ที่ชี้อยู่ที่โฟลเดอร์ `my-first-project` ยังเปิดใช้งานค้างไว้ดีอยู่ใช่ไหม (ห้ามปิดนะ เดี๋ยวเราจะเอาไปลุยต่อในบทเรียนถัดไป)
2. มีไฟล์ `AGY.md` อยู่ที่หน้าแรก (root) ของโฟลเดอร์โครงการ `my-first-project`
3. มีไฟล์ `.agy/commands/brief.md` ถูกสร้างเรียบร้อยดี
4. มีไฟล์รายงานหุ้นอยู่ในโฟลเดอร์ `briefs/` เช่น `briefs/AAPL.md` อย่างน้อยหนึ่งไฟล์จากการทดลองรัน

(ตรวจความเรียบร้อยได้โดยการเปิดดูหน้าโฟลเดอร์คอมพิวเตอร์ปกติของคุณ หรือจะแอบถาม agy ในหน้าต่างที่ 2 ว่า "ขอดูรายชื่อไฟล์ทั้งหมดในโปรเจกต์นี้ รวมถึงโฟลเดอร์ลับด้วยหน่อยสิ" ก็ได้ครับ)

---

STOP: ทั้ง 4 ข้อข้างบน ผ่านครบหมดรึยังครับ? พิมพ์ยืนยันบอกผมในหน้าต่างบานหลักนี้ได้เลยครับ

---

USER: [Waits for student final checklist confirmation]

---

ACTION: When the student responds:

1. If all 4 pass, say "ครบ Lesson 1 ผ่านแล้ว" Move to "What just happened" section.
2. If any item is missing, troubleshoot that specific item before wrapping up Lesson 1. Don't move on with a hole.

---

## What just happened (สรุปก้าวแรกของเรา)

ในเวลาประมาณ 20-25 นาทีที่ผ่านมา คุณสามารถ:

1. เข้าใจหลักการเบื้องต้นว่ารูปแบบ Chat / Cowork / agy ต่างกันอย่างไร และเลือกตัวไหนให้ถูกงาน
2. รู้จัก 3 จุดเด่นบนหน้าจอของ agy: Working directory, การสลับ Model, และ Planning Mode ที่คอยปกป้องไฟล์ให้ปลอดภัย
3. ลงมือสร้างโฟลเดอร์โปรเจกต์ของตัวเองที่ `my-first-project` พร้อมไฟล์ `AGY.md` ที่เป็นคู่มือแนะนำโปรเจกต์ส่วนตัวของคุณให้ AI เข้าใจอัตโนมัติ
4. สร้างปุ่มคำสั่งลัด (Slash Command) ตัวแรกสำเร็จ นั่นก็คือ `/brief หุ้น` ที่ช่วยทุ่นแรงสืบค้นวิเคราะห์ธุรกิจแล้วเซฟออกมาเป็นรายงานสวยงาม
5. ลองรันคำสั่งจริง และได้ไฟล์สรุปหุ้นโผล่ออกมาในคอมพิวเตอร์ได้จริงๆ

ตอนนี้นับว่าคุณมี **เครื่องมือรุ่นตั้งไข่ (v0)** อยู่ในมือเรียบร้อยแล้วล่ะครับ แม้มันจะยังมีข้อจำกัดเล็กๆ น้อยๆ เช่น:
- AI ยังไม่มีฐานข้อมูลผลประกอบการสดๆ ร้อนๆ ที่สมบูรณ์จริง (เราจะแก้ใน **Lesson 3** ด้วยการใส่ไฟล์บันทึก Transcript)
- ข้อมูลสรุปยังไม่ค่อยมีน้ำเสียงความชอบส่วนตัวสไตล์พอร์ตการลงทุนของคุณ (เราจะแก้ใน **Lesson 2** ด้วยการใส่ Voice ของเราลงไป)
- ทำงานวิเคราะห์ทีละขั้นตอนช้าๆ (เราจะแก้ใน **Lesson 4** ด้วยการแตกเป็น 3 sub-agents ขนานกันเพื่อความรวดเร็วและละเอียด)
- ยังเห็นและใช้ได้เฉพาะในโฟลเดอร์คอมพิวเตอร์ของคุณเอง (เราจะยกไปโชว์ใน **Lesson 5** ด้วยการ deploy หน้าเว็บ)

แต่โครงร่างฐานรากทั้งหมดของระบบนี้ถูกปูไว้สมบูรณ์แล้วครับ ขั้นตอนหลังจากนี้เป็นเพียงแค่การแต่งหน้าทาปากเพิ่มฟังก์ชันลงไปเท่านั้นเอง ไม่ต้องรื้อสร้างใหม่แต่แรกแล้วครับ

เครื่องมือนี้แหละครับที่เป็นหัวใจสำคัญในการสเกลการคัดกรองหุ้นของนักลงทุน DCA อย่างพวกเรา ให้สามารถทำความเข้าใจโครงสร้างธุรกิจได้นับสิบๆ ตัวโดยไม่สูญเสียพลังชีวิตวันอาทิตย์ไปทั้งหมด

---

## ก่อนเริ่มต่อ Lesson 2: ลองใช้คำสั่ง `/clear` หน่อยครับ

ก่อนที่เราจะผ่านบทนี้ไป ลองกลับไปพิมพ์คำสั่งนี้ใน **หน้าต่างที่ 2** หน่อยครับ:

```
/clear
```

`/clear` คือคำสั่งลัดที่ติดตั้งมาให้สำเร็จรูปในระบบของ agy อยู่แล้วครับ (ต่างจาก `/brief` ที่เราเพิ่งเขียนสร้างขึ้นมาเอง ตัว `/clear` นี้ใครเปิดโปรแกรม agy มาก็ใช้งานได้ทันทีครับ)

หน้าที่ของคำสั่งนี้คือการสั่งให้ AI "ล้างความทรงจำในห้องแชทบานนั้นลงไปก่อน" เริ่มต้นนับหนึ่งใหม่ในการประมวลผล เพื่อไม่ให้เอากล่องข้อความเก่ายาวๆ มารวมคิดประมวลผลให้เปลืองโควต้าและหน่วงระบบ แต่แน่นอนว่าไฟล์งานต่างๆ ที่เราสร้างไว้ในคอมพิวเตอร์ เช่น ในโฟลเดอร์ briefs/, AGY.md หรือคำสั่งที่เราสร้างไว้ จะยังปลอดภัยร้อยเปอร์เซ็นต์ ไม่ได้ถูกลบทิ้งไปด้วยครับ เป็นแค่การคลีนโต๊ะแชทเฉยๆ ครับ

---

## ปัญหาที่มักพบและวิธีแก้ไขเบื้องต้น (Common stumbles)

- **เรียกใช้งาน `/brief` แล้วระบบไม่รู้จัก:** ลองไปตรวจสอบที่อยู่ของไฟล์ใหม่อีกครั้งครับ ตัวไฟล์จะต้องเซฟไว้ที่ `.agy/commands/brief.md` สะกดตัวพิมพ์เล็กทั้งหมด มีจุดนำหน้าโฟลเดอร์ และหลังจากการเขียนไฟล์เสร็จแล้ว ต้องสั่งรีสตาร์ทตัว agy (ปิดหน้าต่างที่ 2 แล้วเปิดใหม่) เพื่อให้ระบบทำการรีโหลดคำสั่งย่อใหม่ขึ้นมาครับ
- **agy ไม่อ่านคู่มือโปรเจกต์:** ยืนยันว่าชื่อไฟล์เป็นตัวพิมพ์ใหญ่สะกดเป๊ะๆ ว่า `AGY.md` และวางไว้หน้าแรก (root) ของโฟลเดอร์โครงการ `my-first-project` เท่านั้นนะครับ (ไม่ใช่เอาไปซ่อนไว้ในโฟลเดอร์อื่น)
- **หาโฟลเดอร์ซ่อน `.agy` ไม่เจอในคอมพิวเตอร์:** ปกติของระบบปฏิบัติการครับ มันจะซ่อนไว้เพื่อป้องกันผู้ใช้งานเผลอไปกดลบ คุณสามารถลองตรวจสอบโดยการพิมพ์แชทถาม agy หน้าต่างที่ 2 ตรงๆ ว่า "ช่วยแสดงไฟล์และโฟลเดอร์ทั้งหมดที่มีในโปรเจกต์นี้ รวมถึงโฟลเดอร์ลับด้วยหน่อยสิ" ก็จะเห็นรายการได้สบายมากครับ
- **วิเคราะห์รหัสหุ้นไม่พบ:** หุ้นที่จะพิมพ์สรุป v0 นี้ แนะนำว่าควรเป็นตัวอักษรหุ้นใหญ่ที่เป็นสากล เช่น AAPL, NVDA, TSLA, MSFT เป็นต้นนะครับ หากพิมพ์ข้อความเล่นๆ มั่วๆ AI ก็จะแสดงข้อหาไม่พบหุ้นตัวนี้
- **วาง Prompt ผิดหน้าต่าง:** อันนี้เกิดขึ้นบ่อยสุดๆ ครับ ให้ระวังเสมอว่า Prompt วาร์ปงานต่างๆ ที่ผมส่งให้ก็อปปี้ ต้องเอาไปวางแชทใน **หน้าต่างที่ 2** เท่านั้นนะครับ หากเอามาแปะส่งในหน้าต่างนี้ (หน้าต่างบานที่ 1) ผมจะเผลอไปสร้างไฟล์งานเหล่านั้นทับลงในโฟลเดอร์หลักของบทเรียนหลักแทนที่จะเป็นโปรเจกต์ของคุณเอง ซึ่งหากเผลอไป ให้กดยกเลิกไฟล์ที่ผิดพลาดใน folder คอร์ส แล้วกลับไปทำใหม่ในหน้าต่างที่ 2 ให้ถูกจุดนะครับ
- **เผลอปิดหน้าต่างที่ 1 ไปซะงั้น:** หากเผลอปิดติวเตอร์สอน (หน้าต่างบานที่ 1 นี้) ไม่ต้องตกใจครับ ให้กดเปิด agy ขึ้นมาใหม่ชี้ไปที่โฟลเดอร์ `ltd-ai-101` เหมือนเดิม แล้วพิมพ์ส่งบอกแชทมาว่า "ผมทำ Step N เสร็จแล้วครับ ช่วยตรวจให้หน่อยนะ" เดี๋ยวผมจะสแกนตัวระบบแล้วกลับมารับช่วงนำทางพาคุณทำต่อทันทีครับ

หากเจอจุดติดปัญหาอื่นๆ ที่คิดว่าหาทางออกไม่ได้จริงๆ สามารถแวะเข้ามาทิ้งคอมเมนต์แลกเปลี่ยนความรู้ใต้คลิปวิดีโอของคอร์สเรียนนี้ได้เลยครับ ผมก็เพิ่งมาหัดศึกษาใช้งานร่วมกันไปเหมือนกันครับ

---

## พร้อมที่จะลุยต่อใน Lesson 2 แล้วหรือยังครับ

ก่อนที่เราจะก้าวข้ามบทเรียนแรก ให้ตรวจสอบยืนยันอีกหนึ่งครั้งนะครับ:

- โฟลเดอร์ `my-first-project` ของคุณมีโครงสร้างไฟล์: `AGY.md` + `.agy/commands/brief.md` + โฟลเดอร์สรุปหุ้นพร้อมเอกสาร `briefs/<TICKER>.md` ครบถ้วน
- หน้าต่างที่ 2 (โฟลเดอร์ `my-first-project`) ยังคงเปิดใช้งานค้างไว้ปกติดี (เราจะลุยงานต่อในห้องทดลองเดิมยาวๆ ไปในบทเรียนถัดไปครับ)

หากทุกอย่างเรียบร้อยและพร้อมลุยต่อแล้ว ให้คุณพิมพ์ข้อความบอกผมในช่องแชทหน้าต่างบานหลักนี้ (หน้าต่างบานเรียนรู้) ว่า:
`Start Lesson 2`

---

STOP: ทั้งสองประเด็นด้านบน ยืนยันว่าเรียบร้อยสมบูรณ์รึยังครับ? หากสมบูรณ์พร้อมเริ่มบทถัดไปแล้ว พิมพ์คอนเฟิร์มว่า `Start Lesson 2` ได้เลยนะครับ หรือหากติดขัดตรงข้อไหน บอกผมมาได้เลย เดี๋ยวเรามาเชียร์ช่วยกันเคลียร์ให้เรียบร้อยก่อนไปต่อกันครับ

---

USER: [Waits for student to confirm readiness or report missing artifact before moving to Lesson 2]

---

ACTION: When the student types "Start Lesson 2" or anything that signals they're ready (e.g., "พร้อมแล้ว", "ไปต่อ", "next lesson"), read the file at `lesson-modules-agy/2-skill-and-voice/AGY.md` and begin Lesson 2 from its instructions.

If they ask a question or want to revisit something from Lesson 1, answer it. Don't move on until they say they're ready.

If the file `lesson-modules-agy/2-skill-and-voice/AGY.md` doesn't exist yet (course is still being shipped lesson by lesson), tell them: "Lesson 2 ยังไม่ ship ครับ คอร์สนี้ทยอยปล่อยทีละบท เก็บ `/brief` ที่เพิ่งสร้างไว้แบบนั้น Lesson 2 จะ build ต่อจาก slash command นี้โดยตรง ไว้เจอกัน"
