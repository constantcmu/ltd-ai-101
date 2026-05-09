---
provenance: subagent:ada
---

# Lesson 1: Foundations

**Time: ~20-25 min**

**You'll finish with:** A clear picture of what Chat vs Cowork vs Code are, a tour of 3 spots on the Claude Code screen that scare beginners (working directory, model picker, plan/auto modes), a brand new `my-first-project` folder open in a second Claude Code window, your first `CLAUDE.md` file, and a working `/brief TICKER` slash command that researches a stock and saves the result to a `briefs/` folder. We'll test it with a real ticker before we end. The course window (this one) stays open the whole time as your tutor.

This is the foundation we'll build on for the rest of the course. Lesson 2 promotes `/brief` from a slash command into a skill. Lesson 3 feeds in a real earnings call transcript so the `Latest earnings` section stops being a guess. Lesson 4 splits it into 3 parallel sub-agents (fundamentals/10-K, earnings/transcript, news+sentiment/websearch). Lesson 5 deploys a showcase. Same artifact, layered up.

---

## ก่อนเริ่ม: ถ้าคุณยังไม่ได้เปิด folder นี้ใน Claude Code

- **Mac/Windows Desktop App:** เปิด Claude Code app แล้วไปที่ File > Open Folder (หรือ Open...) เลือก folder `ltd-ai-101` แล้วกด trust ถ้ามีป๊อปอัปถาม
- **Drag-drop:** ลาก folder `ltd-ai-101` ทั้งก้อนไปทับไอคอน Claude Code ใน Dock (Mac) หรือ Taskbar (Windows) แล้วปล่อย
- **Verify:** ดูที่ chat input ด้านล่าง แล้วพิมพ์ `ฉันอยู่ folder ไหน?` ถ้า Claude ตอบว่า `ltd-ai-101` คุณพร้อมแล้ว

---

## The moment you're in

You already have Claude Code installed and running. You're inside Claude Code right now, reading this through me. Good. นั่นคือเส้นเริ่มต้นของคอร์สนี้

ใน 20-25 นาทีต่อจากนี้ เราจะ:

1. ทำความเข้าใจสั้นๆ ว่า Chat, Cowork, Code ต่างกันยังไง (รู้ว่าครั้งหน้าจะเปิดอันไหน) ~3 min
2. ทัวร์หน้าจอ Claude Code 3 จุดที่คนเพิ่งเริ่มกลัว โดยใช้ `ltd-ai-101` ที่เปิดอยู่ตอนนี้เป็นตัวอย่างจริง ~5-7 min
3. สร้าง folder `my-first-project` แล้วเปิด Claude Code หน้าต่างที่ 2 (หน้าต่าง 1 คือคอร์สนี้ เก็บไว้) ~3 min
4. สร้าง `CLAUDE.md` ตัวแรกใน `my-first-project` (paste prompt ในหน้าต่าง 2) ~5 min
5. สร้าง `/brief TICKER` slash command (paste prompt ในหน้าต่าง 2) ~5 min
6. ทดสอบด้วย `/brief AAPL` หรือ ticker ที่คุณอยากรู้จริง ในหน้าต่าง 2 ~3 min
7. เช็ค checklist ปิดท้าย ส่งต่อ Lesson 2

ทำอันนี้ให้ตรง บทต่อๆ ไปจะรู้สึกง่ายเพราะเรารู้แล้วว่า `/brief` มันทำงานยังไง

ถ้าอยากพักกลางคัน พิมพ์ `PAUSE` ผมเซฟไว้ให้แล้วกลับมาต่อได้

---

ACTION: Greet the student briefly in Thai. Do NOT recap the whole course (the README covered that). Just confirm you are about to start Lesson 1, tell them it takes about 20-25 minutes, and ask them this question:

"ก่อนเริ่ม ขอเช็คก่อนว่าตอนนี้คุณเปิด Claude Code อยู่ที่ folder `ltd-ai-101` ใช่ไหมครับ? พิมพ์ใน chat: `pwd` หรือบอกผมว่า file tree ทางซ้ายเห็น folder อะไรบ้าง"

If they confirm they're in `ltd-ai-101`, continue with Step 1. If they say they're in a different folder, ask them to close Claude Code and reopen it at the `ltd-ai-101` folder before continuing.

---

STOP: Wait for the student to confirm they are in `ltd-ai-101` (or tell you what they see).

---

USER: [Waits for student to confirm working directory before continuing]

---

## Step 1: Chat vs Cowork vs Code (รู้ว่าจะเปิดอันไหน)

ก่อนเริ่มทำ เรามาเข้าใจสั้นๆ ว่า Claude มี 3 หน้า คุณกำลังนั่งอยู่ใน Code (อันที่ 3) แต่เพื่อให้รู้ว่าครั้งหน้าจะเปิดอันไหน เราดูทั้งสามตัว

**Chat** คือ claude.ai บน browser คุณพิมพ์ถาม Claude ตอบ Claude **ไม่เห็น** เครื่องคุณเลย เหมือนคุยกับเพื่อนใน LINE เพื่อนช่วยตอบได้ แต่เห็นเฉพาะข้อความที่คุณส่งให้

**Cowork** คือ Claude desktop app (Mac/Windows ลงเครื่อง) สำหรับงาน office Claude **เห็นไฟล์ในเครื่องได้** ใน folder ที่คุณ allow + แก้ Excel/PowerPoint/Word ได้ + ใช้ web search ได้ แต่ไม่ได้รันคำสั่ง terminal/code (ดูรายละเอียด: https://support.claude.com/en/articles/13345190-get-started-with-claude-cowork)

**Code** คือ Claude Code (ที่คุณกำลังนั่งอยู่ตอนนี้) Claude **เห็นไฟล์ทั้ง folder ที่คุณเปิดอยู่** + รันคำสั่ง terminal + เขียน/แก้ code/script + git ได้ แรงที่สุด สาย dev

Analogy ที่ผมใช้คือ พนักงาน 3 ระดับ access:

- **Chat** = พนักงานคุยใน LINE เก่ง แต่ไม่เห็นเครื่องคุณ
- **Cowork** = พนักงาน office ที่เปิด Excel/PowerPoint บนเครื่องคุณได้ แก้เอกสารให้ได้ แต่ไม่ใช่สาย code/terminal
- **Code** = พนักงานที่นั่งโต๊ะเดียวกับคุณ เห็นไฟล์ทั้ง folder + รันคำสั่ง + แก้ code ได้

คอร์สนี้เน้นตัวที่ 3 (Code) เพราะเป็นตัวที่หลายคนกลัวที่สุด แต่ถ้าค่อยๆ เดิน ทำตามได้

---

STOP: เข้าใจความต่างของ 3 ตัวนี้พอใช้ได้ไหม? ถ้าเข้าใจ พิมพ์ "เข้าใจ" หรือ "ok" ถ้ายังงง บอกผมว่างงตรงไหน

---

USER: [Waits for student to confirm understanding or ask clarifying questions]

---

ACTION: When the student responds:

1. If they say "เข้าใจ" or "ok" or anything affirmative, say "ดีครับ ไปดูหน้าจอกัน" and move to Step 2.
2. If they ask a clarifying question, answer it briefly in plain Thai. Use the analogy if helpful. Do not move on until they confirm understanding.
3. If they ask "แล้วผมจะใช้ Cowork เมื่อไหร่ ใช้ Code เมื่อไหร่?", answer: "Cowork สำหรับงานที่อ่าน/เขียนเมล นัดประชุม สรุป Drive. Code สำหรับงานที่อยากให้ Claude เห็นไฟล์ในเครื่อง เช่น เขียน script, refactor folder, อ่าน CSV หลายไฟล์ หรือคอร์สนี้" Then move on.

---

## Step 2: ทัวร์หน้าจอ / 3 จุดที่คนเพิ่งเริ่มกลัว

ตอนนี้คุณอยู่ใน Claude Code ที่ folder `ltd-ai-101`. เราเอา folder นี้เป็นตัวอย่างไปเลย

มี 3 จุดบนหน้าจอ Claude Code ที่คนเพิ่งเริ่มงงที่สุด

### จุดที่ 1: Working directory (folder ที่ Claude นั่งอยู่)

ที่ด้านบนของ chat (หรือใน statusline ด้านล่าง ขึ้นกับ version) จะมี path (path คือที่อยู่ของไฟล์ คล้าย C:\Users\Fai\Documents\file.xlsx ใน Windows) บอกว่า Claude อยู่ folder ไหน ตอนนี้น่าจะเป็น path ที่ลงท้ายด้วย `/ltd-ai-101`.

นี่คือคีย์เลย Claude เห็นเฉพาะของใน folder นี้ ถ้าคุณเปิด Claude Code ที่ Documents (ทั้งหมด) Claude จะเห็นทุกไฟล์ใน Documents. ถ้าเปิดที่ `/` (root ของ disk) Claude จะเห็นทุกอย่างในเครื่อง อันตราย

ลองพิมพ์ใน chat:

```
pwd
```

หรือถ้าไม่อยากใช้คำสั่ง terminal-style:

```
ตอนนี้ฉันอยู่ folder ไหน?
```

Claude จะตอบ path ปัจจุบันให้

### จุดที่ 2: Model picker (ตัวเลือกรุ่น Claude)

Claude มี 3 รุ่นหลัก:

- **Sonnet** = default daily driver. ฉลาดพอ เร็วพอ ราคาพอดี ใช้ได้กับงาน 80%
- **Opus** = ฉลาดที่สุด แพงที่สุด ใช้กับงานยากที่ต้องคิดเยอะ
- **Haiku** = เร็วที่สุด ถูกที่สุด ใช้กับงานซ้ำๆ ที่ไม่ต้องคิดเยอะ เช่น indexing

ถ้าใน UI มีปุ่มเลือก model ก็กดสลับได้ตรงนั้น ถ้าไม่เห็นปุ่ม ลองถาม Claude ใน chat ตรงๆ ว่า "ตอนนี้ใช้ model อะไร เปลี่ยนยังไง" Claude จะบอกวิธีตาม version ที่คุณใช้

Analogy คือ พนักงาน 3 คน เก่งคนละแบบ ราคาคนละราคา คุณเลือกคนเหมาะกับงาน ไม่ใช้ Opus กับงานก๊อปไฟล์ ไม่ใช้ Haiku กับงานคิดยาก

กฎของผมคือ default ใช้ Sonnet ก่อน ใช้ Opus เฉพาะตอนที่ Sonnet ทำไม่ผ่าน หรืองานที่ผลลัพธ์สำคัญมาก Haiku เก็บไว้ทีหลังเมื่อรู้ว่างานไหนเหมาะ Lesson 3 จะลงรายละเอียดเรื่องนี้

### จุดที่ 3: Mode picker (ระดับอิสระที่ให้ Claude)

อันนี้สำคัญที่สุดสำหรับคนเพิ่งเริ่ม Claude Code มี 5 mode ให้เลือก เปิด picker ขึ้นมาดู (กด `Shift+Tab` หรือถาม Claude ตรงๆ ว่า "ตอนนี้อยู่ mode ไหน"):

1. **Ask permissions** = ถาม approve ทุก action (ปลอดภัยมาก ช้ามาก)
2. **Accept edits** = แก้ไฟล์ได้เลย แต่ถ้ารันคำสั่ง terminal/shell จะถามก่อน (มักเป็น default ที่ติ๊กไว้)
3. **Plan mode** = Claude ต้องวางแผนก่อน รอคุณ approve ทั้งแผนแล้วค่อยลงมือ (แผนมักตรงกับที่ขอใน 1 shot บ่อยกว่า)
4. **Auto mode** = ทำได้เลยทั้งแก้ไฟล์ + รันคำสั่ง ถามเฉพาะเรื่องอันตราย (ลบ folder, force push, etc.)
5. **Bypass permissions** = ทำเลย ไม่ถามอะไรเลย เปิดด้วย `claude --dangerously-skip-permissions` ตั้งแต่ start session เท่านั้น (อันตรายสุด)

**กฎของผมคือ ตอนเรียนคอร์สนี้ ใช้ Plan mode เป็น default ครับ** เพราะ Claude จะคิดก่อน แล้ว action ออกมาตรงกับที่เราขอใน 1 shot บ่อยกว่า โดยเฉพาะตอนคุณยังไม่คุ้นว่า prompt แบบไหนจะออกมาเป็นยังไง พอคุ้น workflow แล้วค่อยเลื่อนเป็น Accept edits หรือ Auto

Analogy คือเทรนพนักงานใหม่:

- วันแรก ให้วางแผนก่อนแล้วขออนุญาต (Plan)
- ถัดมา ทำเองได้แต่ Excel เท่านั้น ถ้าจะรัน script ขออนุญาต (Accept edits)
- เดือนถัดไป ทำเองได้เกือบหมด ถามแค่เรื่องใหญ่ (Auto)

เวลา Claude อยู่ใน Plan mode มันจะแสดงแผนเป็น list แล้วรอคำตอบจากคุณ คุณกดปุ่ม approve (อาจชื่อ "Approve"/"Yes"/"Accept" ขึ้นกับ version) หรือพิมพ์ "approve"/"yes"/"ทำเลย" ใน chat ก็ได้

วิธีสลับ mode: กด `Shift+Tab` ใน chat ของ Claude Code จะวน mode ให้ดูทีละตัว ถ้า hotkey ไม่ work ใน version คุณ ถาม Claude ตรงๆ ใน chat ว่า "ตอนนี้อยู่ mode ไหน เปลี่ยนเป็น Plan ยังไง" Claude จะตอบให้ตาม version ที่คุณใช้

Bypass mode คอร์สนี้ไม่ใช้ ถ้าวันหลังคุณอยากลอง Bypass ใช้ใน folder sandbox ที่ลบทั้ง folder แล้วไม่เสียดายเท่านั้น

### Statusline (แถบสถานะด้านล่าง)

แถบเล็กๆ ด้านล่างจอ (ถ้ามี ขึ้นกับ version) บอก model ปัจจุบัน + mode ปัจจุบัน ถ้าไม่โชว์ ถาม Claude ตรงๆ ว่า "ตอนนี้ใช้ model อะไร อยู่ใน mode อะไร" ได้เหมือนกัน

---

STOP: ลองเปิดดูบนหน้าจอ Claude Code ของคุณตอนนี้:

1. คุณเห็น working directory path ที่ไหน? (path ลงท้ายด้วย `/ltd-ai-101` ใช่ไหม)
2. คุณหา model picker เจอไหม (ปุ่มหรือถามใน chat)?
3. ตอนนี้คุณอยู่ใน mode ไหน (Plan หรือ Auto)?

ตอบทั้ง 3 ข้อ ถ้าหาไม่เจอข้อไหน บอกผม

---

USER: [Waits for student to identify the 3 UI elements]

---

ACTION: When the student responds:

1. If they identify all 3 correctly, say "ดีครับ คุณรู้จักหน้าจอแล้ว ต่อไปเราจะเปิดหน้าต่างที่ 2 มาสร้างของของคุณเอง คอร์สนี้ยังเปิดอยู่ตรงนี้" Move to Step 3.
2. If they can't find one of the elements, first tell them to ask Claude directly in chat: "Claude ตอนนี้ฉันใช้ model อะไร อยู่ใน mode อะไร" Claude will answer. The exact location of UI elements varies by version, so the chat route is more reliable than pointing to a specific spot. Only if that doesn't unblock them, walk them through it step by step.
3. If they're not sure about mode and the chat trick didn't help, suggest restarting Claude Code once. Don't push specific commands you're not 100% sure exist in their version.

---

## Step 3: สร้าง `my-first-project` แล้วเปิด Claude Code หน้าต่างที่ 2

ตอนนี้คุณอยู่ใน folder `ltd-ai-101` ซึ่งเป็น folder คอร์ส ของจริงเราต้องไปทำใน folder ใหม่ของคุณเอง เพราะคอร์สนี้ออกแบบมาให้ folder คอร์สสะอาด ไม่ปนของส่วนตัว

**Project folder** (folder โปรเจค) คือ folder ที่ Claude Code "นั่งอยู่" ตอนทำงาน Claude เห็นเฉพาะของในโฟลเดอร์นี้ ไม่เห็นของในโฟลเดอร์อื่น ห้ามเปิด Claude Code ที่ Documents หรือ Desktop ตรงๆ เพราะมันจะเห็นทุกไฟล์ในนั้น

### 3.1 สร้าง folder `my-first-project`

ในเครื่องคุณ สร้าง folder ใหม่ชื่อ `my-first-project` ที่ **Desktop** (เพราะหาเจอง่ายตอนกลับมาเปิดอีกที):

- **Mac:** เปิด Finder ไปที่ Desktop กด Cmd+Shift+N สร้าง folder ใหม่ ตั้งชื่อ `my-first-project`
- **Windows:** เปิด File Explorer ไปที่ Desktop คลิกขวา New Folder ตั้งชื่อ `my-first-project`

ตั้งชื่อ folder อะไรก็ได้ที่คุณจำได้ ผมจะใช้ `my-first-project` เป็นตัวอย่างตลอด lesson คุณจะตั้งเป็น `my first project`, `myproject`, `MyFirstProject` ก็ได้ ระวังแค่อย่าให้ซ้ำกับ folder อื่นที่คุณมี

### 3.2 เปิด Claude Code หน้าต่างที่ 2

เราจะเปิด Claude Code หน้าต่างที่ 2 **อย่าปิดหน้าต่างคอร์สนี้นะครับ** หน้าต่างนี้คือผม (ผู้สอน) หน้าต่างที่ 2 คือ workshop ของคุณ คุณจะสลับไปมาได้

**ถ้าใช้ Desktop App ทั้ง lesson ไม่ต้อง Terminal เลย เลือกตัวนี้ก่อน CLI ด้านล่างคือทางเลือกสำหรับคนที่ใช้ terminal เป็นแล้ว**

**Desktop app:** ให้เปิด Claude Code app อีกตัวจาก Dock (Mac) หรือ Start menu (Windows) เพื่อเปิด window ใหม่ บางเวอร์ชั่นมี hotkey Cmd+N / Ctrl+N หรือ File > New Window ลองได้เลยถ้าอยากลอง แต่ถ้าไม่มีก็ไม่เป็นไร เปิดจาก Dock/Start เหมือนกัน พอ window ใหม่ขึ้นมา เลือก "Open Folder" แล้วเลือก `my-first-project`

**Terminal/CLI:** เปิด terminal window ใหม่ (Mac: Cmd+T ใน Terminal, หรือเปิด Terminal app อีกตัว Windows: terminal ใหม่ใน Windows Terminal/PowerShell) แล้ว `cd` เข้า folder `my-first-project` ก่อนพิมพ์ `claude`

- Mac: `cd ~/Desktop/my-first-project && claude`
- Windows: `cd $HOME\Desktop\my-first-project; claude`

(`cd` คือคำสั่ง terminal ที่แปลว่า "change directory" หรือ "เข้าไปใน folder นี้" เหมือน double-click folder ใน Finder/Explorer แต่พิมพ์เอา เครื่องหมาย `~` ใน Mac คือ shortcut ของ home folder ของ user คุณ ส่วน `&&` กับ `;` คือเครื่องหมายต่อคำสั่ง 2 อัน "ทำอันแรกแล้วถ้าสำเร็จก็ทำอันต่อไป")

### 3.3 จัดการ 2 หน้าต่าง

หน้าต่าง 1 (folder `ltd-ai-101`) = ผมพูดกับคุณ หน้าต่าง 2 (folder `my-first-project`) = คุณพูดกับ Claude blank ที่ทำงานในโปรเจคใหม่ สลับไปมาด้วย Cmd+Tab (Mac) หรือ Alt+Tab (Windows)

ทุก step ต่อจากนี้ ผมจะส่ง prompt ให้คุณ paste ใน **หน้าต่าง 2** แล้วกลับมารายงานที่ **หน้าต่าง 1**

---

STOP: บอกผมว่า:

1. สร้าง folder `my-first-project` แล้วยัง (ดูใน Finder/Explorer ว่ามีจริง)

ถ้ามีแล้ว ต่อไป:

2. เปิด Claude Code หน้าต่างที่ 2 ที่ folder นั้นแล้วยัง พิมพ์ `pwd` ในหน้าต่าง 2 หรือถาม Claude หน้าต่าง 2 ว่า "ตอนนี้อยู่ folder ไหน" แล้วบอกผมว่า working directory ของหน้าต่าง 2 ลงท้ายด้วยชื่อ folder ที่คุณเพิ่งสร้างใช่ไหม

---

USER: [Waits for student to confirm folder created + window 2 open at my-first-project]

---

ACTION: When the student responds:

1. If folder is created AND window 2's working directory ends with the folder name they chose, note the name they used (whatever it is) and confirm, then move to Step 4.
2. If they accidentally created the folder inside `ltd-ai-101`, ask them to move it out into Documents (or wherever they prefer). Wait for fix.
3. If they used any other name than `my-first-project` (with spaces, different case, different words), that is fine. Note the name they chose. For the rest of the lesson, when you refer to `my-first-project` as an example, remind them once that their folder is named differently and they should substitute their actual name wherever they see `my-first-project` in the instructions.
4. If window 2 is at the wrong folder (e.g. parent of their project folder, or still at ltd-ai-101), ask them to close window 2 and reopen at the correct folder. Don't proceed until window 2 is at their project folder.
5. If they ask "ทำไมไม่ปิดหน้าต่าง 1?" reassure: "หน้าต่าง 1 คือผม (ผู้สอน) ทุก step ที่เหลือผมจะพาคุณทำ ถ้าปิดหน้าต่าง 1 ผมจะหาย ต้องเริ่มใหม่ หน้าต่าง 2 คือ Claude blank ที่ทำงานใน folder ใหม่ ใช้คนละ session กัน"

---

## Step 4: สร้าง `CLAUDE.md` ตัวแรกใน `my-first-project`

`CLAUDE.md` คือ "บัตรประจำตัว" ของโปรเจค เป็นไฟล์ที่ Claude อ่านอัตโนมัติทุกครั้งที่เปิดโปรเจคนี้ คุณไม่ต้องอธิบายโปรเจคซ้ำในแต่ละ chat

Analogy คือ เหมือนคุณจ้างพนักงานใหม่ แล้วให้กระดาษบอก "บริษัทเราทำอะไร เราชอบทำงานยังไง อย่าทำอะไร" พนักงานจะอ่านวันแรก แล้วทำงานตามแนวนั้นไปเลย ไม่ต้องสอนใหม่ทุกเช้า

ACTION: Hand the student this prompt to paste in **window 2** Tell them clearly: "ก็อปทั้งบล็อคข้างล่างนี้ paste ใน chat ของหน้าต่าง 2 (folder my-first-project) แล้วกลับมาบอกผม"

````text
สร้างไฟล์ CLAUDE.md ใน folder นี้ด้วยเนื้อหาตามนี้:

# Project: My First Project

**What this is:** โปรเจคทดลองตัวแรกของผม เพื่อหัดใช้ Claude Code ใช้เป็นที่ทดลองสร้าง slash command, skill, sub-agent ระหว่างเรียน LTD AI 101

## วิธีทำงาน

- ก่อนทำอะไรที่แก้ไฟล์เยอะหรือลบของ ให้ขออนุญาตก่อน
- แก้ไฟล์ที่มีอยู่แล้ว อย่าสร้างใหม่ถ้าไม่จำเป็น
- คำตอบให้ตรง อย่าอ้อม
- ภาษาไทยใช้ได้ ภาษาอังกฤษใช้ได้

## What lives where

- `briefs/` สำหรับ stock brief ที่ /brief สร้าง
- `.claude/commands/` สำหรับ slash command files

## ห้าม

- อย่ารัน rm -rf หรือคำสั่งลบ folder โดยไม่ถามก่อน
- อย่าแก้ไฟล์ที่อยู่ข้างนอก folder นี้

ทำเลย
````

---

STOP: บอกผมว่า Claude ในหน้าต่าง 2 ตอบยังไง แล้วเปิดไฟล์ `CLAUDE.md` ที่ root ของ `my-first-project` ดูสิว่ามีเนื้อหาตามด้านบนจริงไหม (ใช้ Finder/Explorer เปิดดู หรือถาม Claude ในหน้าต่าง 2 ว่า "show me the contents of CLAUDE.md")

---

USER: [Waits for student to report Claude's response in window 2 + verify CLAUDE.md content]

---

ACTION: When the student responds:

1. If Claude in window 2 created CLAUDE.md and the file content matches, say "ดีครับ ไฟล์ CLAUDE.md พร้อมแล้ว ต่อไป slash command." Move to Step 5.
2. If Claude in window 2 asked permission instead of creating (Plan mode), tell them: "หน้าต่าง 2 อยู่ใน Plan mode ให้คุณ approve แผนของ Claude ก่อน หรือถ้าอยากให้ทำเลย สลับเป็น Auto mode ในหน้าต่าง 2." Wait until file exists.
3. If file was created but content is different from what we sent, ask them to paste the prompt again exactly. Don't move on with a wrong CLAUDE.md.
4. If Claude in window 2 created the file in the wrong place (e.g. inside `.claude/` or a subfolder), ask them to ask Claude in window 2 to move it to the project root.

---

## Step 5: สร้าง `/brief TICKER` slash command

**Slash command** (คำสั่งที่ขึ้นต้นด้วย `/`) คือปุ่มลัดของ Claude Code. แทนที่จะพิมพ์ prompt ยาวๆ ทุกครั้ง คุณสร้างคำสั่งสั้นๆ แล้วเรียกใช้ซ้ำได้

Analogy คือ เหมือน hashtag ใน LINE หรือ shortcut บนคีย์บอร์ด พิมพ์ตัวเดียว ระบบทำงานทั้ง flow ให้

ครั้งนี้เราสร้าง `/brief` ที่จะรับ ticker หุ้น แล้ว research + บันทึกผลลัพธ์เป็นไฟล์ markdown (markdown คือ format text แบบเรียบๆ ใช้ # สำหรับ heading * สำหรับ bullet เปิดดูได้ใน text editor ปกติ ไม่ต้องโปรแกรมพิเศษ) ใน folder `briefs/` นี่คือ **เวอร์ชั่น 0** ของเครื่องมือเรา Lesson 2 จะยกระดับเป็น skill (เพิ่ม SOP + เสียงนักลงทุน) Lesson 3 ใส่ earnings transcript จริงเข้าไปเป็น source Lesson 4 แตกเป็น 3 sub-agent ขนาน Lesson 5 deploy showcase

Slash command อยู่ใน folder `.claude/commands/` (จุดด้านหน้า `.claude` คือสไตล์ hidden folder บน Mac/Linux. เป็น folder ที่ Claude Code ใช้เก็บของตัวเอง ปกติ Finder/Explorer ไม่โชว์ จะเห็นด้วยถ้ากด Cmd+Shift+. บน Mac หรือเปิด "show hidden files" บน Windows).

ACTION: Hand the student this prompt to paste in **window 2**

````text
สร้างไฟล์ใหม่ที่ .claude/commands/brief.md ด้วยเนื้อหาตามนี้:

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

ทำเลย
````

---

STOP: บอกผมว่า `.claude/commands/brief.md` ถูกสร้างไหม ลองถาม Claude ในหน้าต่าง 2 ว่า "show full path of brief.md ที่เพิ่งสร้าง" Claude จะตอบ path กลับมา path ต้องเป็น `.claude/commands/brief.md` (lowercase พร้อมจุดข้างหน้า).

---

USER: [Waits for student to verify brief.md exists at the correct path]

---

ACTION: When the student responds:

1. If path is `.claude/commands/brief.md` exactly, say "ดี slash command พร้อม ลองเรียกใช้กัน" Move to Step 6.
2. If path is different (e.g. `commands/brief.md` without the dot, or in project root), ask them to paste in window 2: "ย้ายไฟล์ brief.md ไปที่ .claude/commands/brief.md" or "move brief.md to `.claude/commands/brief.md`". Wait for fix before moving on.
3. If `.claude/` folder isn't visible in their file tree, that's normal (hidden folder). The path check via Claude in window 2 is the source of truth.
4. If Claude in window 2 asked for approval first (Plan mode), tell them to approve the plan. Wait for file creation before checking path.

---

## Step 6: ทดสอบ `/brief` ด้วย ticker จริง

**ก่อนรัน ขอเตือนล่วงหน้านะครับ** ครั้งแรกที่พิมพ์ `/brief AAPL` หน้าต่าง 2 มัก จะขึ้น error 2 บรรทัด:

```
Unknown command: /brief
Args from unknown skill: AAPL
```

อันนี้ปกติ ไม่ใช่ของพัง Claude Code ต้อง restart ก่อนถึงจะโหลด slash command ใหม่ที่เพิ่งสร้าง วิธี restart:

1. **Desktop App (วิธีหลัก)** ปิดหน้าต่าง 2 แล้วเปิดใหม่ที่ folder `my-first-project` เหมือนเดิม ไม่ต้องแตะ terminal
2. **Terminal/CLI (ทางเลือก)** ถ้าตอนแรกคุณเปิด Claude Code จาก terminal (ไม่ใช่ Desktop App) ใน chat ของหน้าต่าง 2 พิมพ์ `/exit` ออกจาก session แล้วใน terminal เดิม พิมพ์ `claude` อีกที session ใหม่จะโหลด slash command ที่เพิ่งสร้างเข้ามาด้วย ถ้าคุณใช้ Desktop App ปกติ ทำตามวิธีบนได้เลย ข้ามอันนี้ไป

หลัง restart ใน chat ของ **หน้าต่าง 2** พิมพ์:

```
/brief AAPL
```

หรือ ticker ที่คุณอยากรู้จริง เช่น `/brief NVDA`, `/brief TSLA`, `/brief META`

Claude ควร:

1. สร้าง folder `briefs/` ถ้ายังไม่มี
2. ทำ research แล้วบันทึก `briefs/AAPL.md` (uppercase ticker ในชื่อไฟล์)
3. โชว์เนื้อหา brief กลับมาใน chat ด้วย ทั้ง 4 section

(ถ้าหน้าต่าง 2 อยู่ใน Plan mode Claude จะบอกแผนก่อนแล้วรอให้คุณ approve แต่ละขั้น approve ไปได้เลย นั่นคือ Plan mode ทำงานตามปกติ)

**ของจริงข้อสำคัญ:** Claude อาจจะไม่มี data earnings ไตรมาสล่าสุดจริง (training cutoff) ถ้ามันบอกตรงๆ ว่า "ไม่มี data quarter ล่าสุด แต่นี่คือ pattern ที่ควรดู" อันนั้น OK และเป็นสิ่งที่ Lesson 3 จะแก้ด้วยการ feed earnings transcript จริงเข้าไปให้ Claude อ่าน ถ้ามันแต่งตัวเลข earnings ขึ้นมาเอง อันนั้นไม่ OK อย่างที่ L3 จะแก้ structurally

ACTION: Tell the student to run `/brief AAPL` (or another ticker) in **window 2**, then come back to window 1.

---

STOP: บอกผม:

1. หน้าต่าง 2 แสดงอะไรหลัง `/brief AAPL`? (Claude ตอบยาวๆ มี 4 section ในแชทไหม หรือยัง error อยู่)
2. เปิดไฟล์ `briefs/AAPL.md` (หรือ ticker ที่ใช้) ดูสิ มี 4 section ครบไหม (What the company does, Latest earnings, Bull/Bear, What to ask)
3. ส่วน Latest earnings Claude แต่งตัวเลขเฉพาะเจาะจง (ชื่อ exec + ตัวเลข + quarter) หรือบอกตรงๆ ว่าไม่มี data quarter ล่าสุด?

---

USER: [Waits for student to report /brief output and file content]

---

ACTION: When the student returns and reports:

1. If brief has 4 sections AND Latest earnings is honest about lacking real-time data, say (in Paint's friendly voice): "เป็นไง เจ๋งมะ แค่ 1 prompt ก็มี research ออกมาเลย แต่ผมรู้มันยังไม่ค่อยกาว เดี๋ยวเรามาค่อยๆ เพิ่มอันนี้ใน lesson ต่อๆ ไปนะ ผ่าน foundation แน่นแล้ว `/brief` ทำงานในเครื่องคุณจริง" Move to Step 7.
2. If `/brief` was treated as plain text (Claude echoed the command back as a literal string, OR the student saw `Unknown command: /brief` even after restart), first check window-2 was actually restarted (the warning at the top of Step 6 is the most common stumble: students try to run /brief without closing-and-reopening the Desktop App, or skip the `/exit` + `claude` relaunch if they started from terminal). If yes, ask Claude in window 2: "show full path of brief.md ที่เพิ่งสร้าง". It must be at `.claude/commands/brief.md` (lowercase, with the leading dot). If wrong, ask Claude in window 2 to move it, then restart window 2 and re-test.
3. If Claude fabricated specific earnings headlines that look made up (specific revenue numbers + quarter + dates that Claude cannot have known to the day), say honestly: "อันนี้คือสาเหตุที่ Lesson 3 ต้อง feed earnings transcript จริง ตอนนี้ Claude แต่งตัวเลขเพราะมันไม่มี data จริงในมือ v0 ของเรา expected behavior คือ 'ไม่มี data quarter ล่าสุด' หรือ 'นี่คือ pattern ทั่วไปที่ควรดู' ทำงานต่อ Lesson 2 ผมจะใส่ SOP ที่บังคับ honest ก่อน แล้ว Lesson 3 ค่อยใส่ source จริง" Move to Step 7 anyway, the skeleton works.
4. If `briefs/AAPL.md` was created but only has 1-2 sections, ask them to run `/brief` again on a different ticker in window 2. Sometimes the first run gets truncated. If it keeps happening, tell them: "ไม่เป็นไรครับ skeleton ของ /brief พร้อมแล้ว Lesson 2 จะ tighten output เป็น SOP ที่บังคับให้ครบ 4 section." Move to Step 7.
5. If `briefs/` folder wasn't created at all, ask them in window 2 to ask Claude: "ทำไม briefs/ folder ไม่ถูกสร้าง ลองรัน /brief AAPL ใหม่ดู". Wait for fix.

---

## Step 7: เช็คความเรียบร้อย + ปิดท้าย

(step นี้ทำในหน้าต่าง 1 ไม่ต้อง paste อะไรในหน้าต่าง 2)

ก่อนปิด lesson 1 เช็ค checklist:

1. หน้าต่าง 2 ที่ `my-first-project` ยังเปิดอยู่ใช่ไหม (เก็บไว้ จะใช้ต่อใน Lesson 2)
2. มีไฟล์ `CLAUDE.md` ที่ root ของ `my-first-project`
3. มีไฟล์ `.claude/commands/brief.md`
4. มีไฟล์ `briefs/<TICKER>.md` อย่างน้อย 1 ไฟล์ จากการรัน `/brief`

(ตรวจโดย: เปิด Finder หรือ Explorer ที่ my-first-project หรือถาม Claude ในหน้าต่าง 2 ว่า "list all files in this project including hidden")

---

STOP: ทั้ง 4 ข้อข้างบน ผ่านครบไหม? ตอบในหน้าต่าง 1 (หน้าต่างนี้).

---

USER: [Waits for student final checklist confirmation]

---

ACTION: When the student responds:

1. If all 4 pass, say "ครบ Lesson 1 ผ่านแล้ว" Move to "What just happened" section.
2. If any item is missing, troubleshoot that specific item before wrapping up Lesson 1. Don't move on with a hole.

---

## What just happened (สรุปสั้นๆ)

ใน 20-25 นาทีที่ผ่านมา คุณ:

1. รู้ว่า Chat / Cowork / Code คืออะไร แต่ละตัวเหมาะกับงานไหน
2. รู้จัก 3 จุดสำคัญบนหน้าจอ Claude Code: working directory, model picker, plan/auto modes (และรู้ว่า Bypass mode ต้องเปิดด้วย flag ไม่ใช่ปุ่มปกติ)
3. สร้างโปรเจคของตัวเองที่ `my-first-project` พร้อม `CLAUDE.md` ที่ Claude อ่านอัตโนมัติทุก session
4. สร้าง slash command ตัวแรก `/brief TICKER` ที่ generate stock brief แล้วบันทึกเป็น markdown
5. รัน `/brief` กับ ticker จริง ได้ไฟล์ใน `briefs/` ออกมา

ตอนนี้คุณมี **เครื่องมือเวอร์ชั่น 0** อยู่ในมือ มันยังหยาบ เพราะ:

- Claude ไม่มี data quarter earnings ล่าสุดจริง (Lesson 3 จะแก้ด้วยการ feed transcript จริงเข้า)
- Output ยังไม่มีเสียงนักลงทุนของคุณ (Lesson 2 จะใส่)
- ทำงาน sequential ทีละ section (Lesson 4 จะแตกเป็น 3 sub-agent ขนาน)
- ใช้ได้แค่ในเครื่องคุณคนเดียว (Lesson 5 จะ deploy showcase)

แต่ว่า เครื่องมือมันเดินได้แล้ว อย่างอื่นเป็นการ layer ขึ้น ไม่ใช่สร้างใหม่

และของชิ้นแรกที่คุณเพิ่งทำ คือเครื่องมือ research หุ้น 1 ตัวจาก prompt เดียว สิ่งที่ DCA ตาม ETF อย่างเดียวให้ไม่ได้ คือเวลาที่จะ scale ความเข้าใจของตัวเองไปทีละหุ้น `/brief` คือก้าวแรกของ scale นั้น

---

## ก่อนปิด Lesson 1, ลองคำสั่ง `/clear`

ก่อนไปต่อ ลองพิมพ์ `/clear` ในหน้าต่าง 2 ดูสิครับ chat จะเคลียร์ context ของ session เริ่มหน้าใหม่

`/clear` เป็น slash command ที่ Claude Code ทำมาให้เลย ไม่ต้องสร้างเอง เหมือน `/brief` ที่เราเพิ่งทำ ต่างกันตรงที่ /brief เราสร้างเอง `/clear` เป็น built-in ใครเปิด Claude Code มาก็ใช้ได้เลย out of the box

ใช้ `/clear` ตอนเริ่มงานใหม่จะดี Claude ไม่ลากของเก่ามาคิด context ก็เริ่มสะอาด ทำงานต่อใน session เดียวกันได้นานขึ้นโดยไม่ต้องปิดหน้าต่าง

(ลอง `/clear` ในหน้าต่าง 2 แค่เพื่อให้รู้ว่ามี ของในไฟล์ briefs/, CLAUDE.md, .claude/commands/ ไม่หาย เคลียร์เฉพาะ chat history เท่านั้น)

---

## Common stumbles (ถ้าติดตรงไหน)

- **`/brief` ไม่ทำงาน** ตรวจ path ของไฟล์ ต้องเป็น `.claude/commands/brief.md` เป๊ะๆ ตัวพิมพ์เล็ก ถ้าเพิ่งสร้างไฟล์ บางที Claude Code ต้อง restart เพื่อโหลด slash command ใหม่
- **Claude ไม่อ่าน `CLAUDE.md`** ไฟล์ต้องเป็น `CLAUDE.md` ตัวพิมพ์ใหญ่ที่ root ของโปรเจค (ไม่ใช่ใน subfolder)
- **File tree ไม่โชว์ `.claude` folder** ปกติ มัน hidden ถามใน chat ว่า "list ไฟล์ใน .claude/commands/" ก็ยืนยันได้ว่ามีอยู่
- **Ticker ไม่ใช่หุ้นจริง** เช่น พิมพ์ `/brief XYZ123` Claude อาจจะตอบว่าไม่รู้จัก ใช้ ticker จริงที่ list ใน NYSE/Nasdaq เช่น AAPL, NVDA, GOOGL, MSFT, TSLA, META
- **Brief มีแค่ 2-3 section ไม่ครบ 4** บางครั้ง output ขาด ลอง run อีก ticker ดู Lesson 2 จะเขียน SOP ที่บังคับครบ 4 section ทุกครั้ง
- **กลัวเผลอลบไฟล์** ใช้ Plan mode ทุกครั้งจน workflow คุ้น แล้วค่อยเลื่อนเป็น Auto. ห้ามเปิด Claude Code ที่ Documents ทั้งหมด เปิดแค่ folder ย่อย `my-first-project`
- **paste prompt ผิดหน้าต่าง** prompt ที่ผมส่งให้ paste ทั้งหมดต้องไปหน้าต่าง 2 (folder `my-first-project`) ไม่ใช่หน้าต่างนี้ ถ้าเผลอ paste ในหน้าต่าง 1 (ที่ผมพูดอยู่) ผมจะตอบเหมือน Claude ปกติ แต่ไฟล์ไปสร้างใน folder คอร์สแทน folder ของคุณ ถ้าเผลอ ลบไฟล์ใน `ltd-ai-101` แล้วสลับไปหน้าต่าง 2 paste ใหม่
- **ปิดหน้าต่าง 1 ไปแล้ว** ถ้าเผลอปิดหน้าต่างคอร์ส เปิด Claude Code ที่ folder `ltd-ai-101` ใหม่ แล้วพิมพ์ "ผมทำ Step N เสร็จแล้ว ช่วยเช็คให้หน่อย" ผมจะกลับมารับช่วงต่อ

ถ้าหาทางออกไม่ได้จริงๆ comment มาในคลิปคอร์สนี้ ผมก็เพิ่งหัดเหมือนกัน

---

## พร้อมขึ้น Lesson 2 ยัง

ก่อนขึ้นบทถัดไป ตรวจอีกครั้งว่า:

- folder `my-first-project` มีไฟล์ `CLAUDE.md` + `.claude/commands/brief.md` + `briefs/<TICKER>.md` (อย่างน้อย 1 ตัว)
- หน้าต่าง 2 (folder `my-first-project`) ยังเปิดอยู่ Lesson 2 จะใช้ต่อในหน้าต่างเดิม

พิมพ์ `Start Lesson 2` ในหน้าต่างนี้ (หน้าต่าง 1 = `ltd-ai-101`) แล้วเปิดหน้าต่าง 2 ค้างไว้ เราจะใช้หน้าต่าง 2 ต่อใน Lesson 2.

---

STOP: ทั้ง 2 ข้อข้างบน ผ่านครบหรือยัง? ถ้าผ่านครบ พิมพ์ "Start Lesson 2". ถ้ายังขาด บอกผมตรงข้อไหน เราเก็บก่อนไปต่อ

---

USER: [Waits for student to confirm readiness or report missing artifact before moving to Lesson 2]

---

ACTION: When the student types "Start Lesson 2" or anything that signals they're ready (e.g., "พร้อมแล้ว", "ไปต่อ", "next lesson"), read the file at `lesson-modules/2-skill-and-voice/CLAUDE.md` and begin Lesson 2 from its instructions.

If they ask a question or want to revisit something from Lesson 1, answer it. Don't move on until they say they're ready.

If the file `lesson-modules/2-skill-and-voice/CLAUDE.md` doesn't exist yet (course is still being shipped lesson by lesson), tell them: "Lesson 2 ยังไม่ ship ครับ คอร์สนี้ทยอยปล่อยทีละบท เก็บ `/brief` ที่เพิ่งสร้างไว้แบบนั้น Lesson 2 จะ build ต่อจาก slash command นี้โดยตรง ไว้เจอกัน"
