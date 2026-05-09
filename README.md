---
provenance: subagent:ada
title: LTD AI 101 / Claude Code สำหรับคนเพิ่งเริ่ม
audience_level: absolute-beginner
length_estimate: 60-90min total (5 lessons)
status: in-progress
---

# LTD AI 101

**Claude Code จากเปิดใช้ครั้งแรก จนใช้เป็นเครื่องมือทำงานจริงได้ ในประมาณ 60-90 นาที**

Version 0.2 | โดย Paint (ลงทุนไดอารี่)

---

> ⚠️ **คำเตือน / Disclaimer**
>
> คอร์สนี้เพื่อการศึกษาเท่านั้น **ไม่ใช่คำแนะนำการลงทุนหรือคำแนะนำทางการเงิน** หุ้นและ ticker ทั้งหมดเป็นตัวอย่างประกอบการสอน ไม่ใช่คำแนะนำซื้อ/ขาย/ถือหุ้นใดๆ การลงทุนมีความเสี่ยง ผู้ลงทุนควรศึกษาและตัดสินใจด้วยตนเอง
>
> This course is for **educational purposes only**. Nothing here is investment or financial advice. All tickers and examples are illustrative only, not buy/sell/hold recommendations. See [DISCLAIMER.md](DISCLAIMER.md) for full details.
>
> 📜 **License:** Free for personal educational use only. No selling, reselling, or commercial use. All rights reserved. See [LICENSE](LICENSE).

---

**BIG IDEA:** ถ้าคุณเข้าใจ 4 พื้นฐาน (CLAUDE.md, slash command, skill, sub-agent) คุณสร้างเครื่องมือช่วยงานของตัวเองได้โดยไม่ต้องเขียน code.

---

## ปัญหาที่คอร์สนี้แก้

ผมทำคลิปใช้ Claude Code มาก่อนแล้ว แต่อ่าน comment กลับมาเยอะมากว่า "ทำตามไม่ทัน" / "ลงเสร็จเปิดมาแล้วไม่รู้จะพิมพ์อะไร" / "งงต่อว่าจะทำอะไรต่อ / หรือผมมีคอร์สไหม?"

ผมเข้าใจ ผมเองก็เพิ่งหัด terminal ของจริงไม่กี่เดือน. คอร์สนี้เลยเกิดจากความรู้สึกแบบนั้น คนที่เพิ่งจะเริ่มอยากได้คนเดินช้าๆ ไปกับคุณตั้งแต่ 0, ซึ่งที่ผมอยากสื่อคือ ไม่รู้อะไรก็แค่ถาม AI 

LTD AI 101 เลยเกิดขึ้นมา ไม่เหมือนกับคลิป YouTube เดิมของผม เพราะ AI น่าจะรู้ดีกว่าผมอีกว่ามันทำอะไรได้บ้างจริงไหม? เพียงคุณเปิด folder นี้ใน Claude Code (ที่ลงไว้ในเครื่องอยู่แล้ว) แล้ว Claude เองจะเป็นคนสอนคุณตามบท ทีละ step หยุดรอคุณตอบ หยุดรอคุณกด แล้วค่อยไปต่อเมื่อคุณพร้อม ค่อยๆ ทำไปำกับคุณ

---

## สิ่งที่คุณจะได้หลังจบคอร์สนี้

คอร์สนี้สร้างของชิ้นเดียวกันแต่จะค่อยๆ เพิ่มความยากใน 5 บท เริ่มจากของง่ายๆ แล้วค่อยๆ ปรับขึ้นจนกลายเป็นเครื่องมือที่เอาไปปรับใช้งานได้จริง:

- ของชิ้นนั้นคือ **`/brief TICKER`** เครื่องมือสรุปหุ้น 1 ตัว (ทำอะไร, ข่าว 7 วันล่าสุด, bull/bear, ถามอะไรก่อนซื้อ) ที่ save ไฟล์ markdown ลง folder `briefs/` ของคุณเอง
- L1 ทำเวอร์ชั่น 0 เป็น slash command ขั้นต้น (คำสั่งลัดที่ขึ้นต้นด้วย `/`)
- L2 ยกระดับเป็น **skill** (ทักษะที่ Claude เรียกใช้ซ้ำได้) แล้วใส่ "เสียงนักลงทุน" ของคุณเองเข้า `CLAUDE.md` ของโปรเจค
- L3 ใส่ earnings transcript เข้ามาเป็น source ที่ Claude ใช้เขียน brief จริง (ไม่ปล่อยให้ Claude เดาจาก training data เก่า) + วิธีคุม cost (เลือก model ให้คุ้ม, ใช้ `/context` ดู token)
- L4 แตก research ออกเป็น 3 sub-agent ทำงานขนานกัน — fundamentals (อ่าน 10-K), earnings (อ่าน transcript), news & sentiment (websearch)
- L5 deploy showcase ขึ้น Vercel แล้วปิดด้วยภาพรวมว่า ClaudyOS (ระบบที่ผมใช้ทำคอนเทนต์ทั้งช่อง) ประกอบจากของพวกนี้ยังไง

ของจริงทั้งหมด ไม่ใช่ demo. จบคอร์สคุณจะมี `/brief` ใช้ได้ในเครื่องของคุณเอง พร้อมไฟล์ briefs/ ที่ generate จากทุกตัวที่คุณ run และ URL showcase ที่ share ให้คนอื่นดูได้

---

## คอร์สนี้สำหรับใคร

- คนที่ดาวน์โหลด Claude Code มาแล้ว แต่ยังไม่ได้ลองทำอะไรจริง
- คนที่เคยใช้ ChatGPT มาก่อน แต่ยังไม่เคยให้ AI เห็นไฟล์ในเครื่องตัวเอง
- คนที่กลัว terminal (หน้าจอดำพิมพ์คำสั่ง) แต่อยากใช้ AI ทำงานได้มากกว่าแชทตอบเฉยๆ
- นักลงทุน/นักทำคอนเทนต์ ที่อยากเริ่มสร้างระบบช่วยตัวเอง ไม่ใช่ใช้แอพคนอื่นต่อไปเรื่อยๆ

**ไม่ต้องเขียน code เป็นมาก่อน.** Claude เป็นคนทำงานหนักให้ คุณแค่พิมพ์ภาษาคน.

---

## สิ่งที่ต้องมีก่อนเริ่ม

**บังคับ:**

- คุณกำลังเปิด folder `ltd-ai-101` นี้อยู่ใน Claude Code แล้ว และพิมพ์ chat โต้ตอบได้
- Claude account (ที่ login เข้า Claude Code ไว้แล้ว)
- เวลาประมาณ 60-90 นาที ที่ไม่มีใครรบกวน

**ไม่ต้องมี:**

- ความรู้ coding
- ความรู้ git, npm, terminal มาก่อน
- Claude Max plan (Pro plan เพียงพอแล้ว ไม่จำเป็นต้องเป็น Max, แต่ Free plan ใช้ Claude Code ไม่ได้)
- Domain หรือ hosting

---

## โครงสร้างคอร์ส

5 บทเรียน รวมประมาณ 60-90 นาที. ทุกบทต่อยอด **ของชิ้นเดียวกัน** คือ `/brief TICKER`.

| Lesson | สิ่งที่จะสร้าง / เพิ่มเข้า `/brief`                                            | เวลา      |
| ------ | ------------------------------------------------------------------------------ | --------- |
| 1      | โปรเจคแรก + `CLAUDE.md` + `/brief` v0 (slash command, prompt ตรงๆ บันทึก briefs/) | ~20-25 min |
| 2      | ยก `/brief` เป็น skill (ทักษะ reusable) + ใส่เสียงนักลงทุนของคุณเข้า `CLAUDE.md` | ~15-20 min |
| 3      | ใส่ earnings transcript เป็น source + คุม cost (model picker, `/context`)         | ~25 min    |
| 4      | แตก `/brief` เป็น 3 sub-agent ขนาน (fundamentals/10-K, earnings/transcript, news+sentiment/websearch) | ~15 min    |
| 5      | Deploy showcase ขึ้น Vercel + ภาพรวม ClaudyOS ของผม                              | ~15-20 min |

แต่ละบทต่อจากของบทก่อน. Lesson 2 ยกระดับ `/brief` ที่ Lesson 1 สร้าง. Lesson 4 แตก skill ที่ Lesson 2 ทำ. ข้ามไปไม่ได้.

---

## วิธีเริ่ม

คอร์สนี้ไม่ได้ออกแบบให้นั่งอ่าน. คุณกำลังเปิด folder นี้ใน Claude Code อยู่แล้ว Claude จะเป็นคนสอนคุณ.

### ยืนยันก่อนว่าคุณพร้อม

มอง chat ของ Claude Code ตอนนี้. ถ้าเห็น chat input ที่พิมพ์ได้ และดู file tree ทางซ้ายเห็น folder `ltd-ai-101` (มี `README.md`, `CLAUDE.md`, `lesson-modules/`) แสดงว่าพร้อม.

ถ้ายังไม่เห็นแบบนั้น ตรวจ: คุณเปิด folder `ltd-ai-101` ใน Claude Code แล้วใช่ไหม (ไม่ใช่ folder อื่น)

### พิมพ์คำนี้ใน chat

```
Start Lesson 1
```

Claude จะเปิดไฟล์ lesson 1 อ่าน แล้วเริ่มสอนคุณตามบท หยุดรอคุณตอบ หยุดรอคุณกด แล้วค่อยไปต่อ.

จบ lesson 1 แล้วค่อยพิมพ์ `Start Lesson 2`, `Start Lesson 3`, ตามลำดับ.

---

## โครงสร้าง folder

```
ltd-ai-101/
├── README.md                            (ไฟล์ที่คุณกำลังอ่านอยู่)
├── CLAUDE.md                            (บทบาทของ Claude ตอน guide คุณ)
├── lesson-modules/
│   ├── 1-foundations/CLAUDE.md          (Lesson 1: /brief v0)
│   ├── 2-skill-and-voice/CLAUDE.md      (Lesson 2: ยกเป็น skill + เสียงนักลงทุน)
│   ├── 3-earning-and-cost/CLAUDE.md     (Lesson 3: Earnings transcript + คุม cost)
│   ├── 4-subagents/CLAUDE.md            (Lesson 4: 3 sub-agent ขนาน)
│   └── 5-deploy-and-recap/CLAUDE.md     (Lesson 5: deploy + ClaudyOS recap)
```

(Lesson 2-5 จะทยอย ship ตามมา. Lesson 1 พร้อมแล้ว.)

---

## วิธีทำงานของแต่ละ lesson

ทุก lesson หน้าตาเหมือนกัน:

1. Claude อ่านไฟล์ lesson แล้วเริ่มคุยกับคุณใน chat
2. คุณทำตาม paste โค้ดบล็อก ยืนยันสิ่งที่เห็นบนจอ
3. Claude หยุดที่ทุก checkpoint ที่สำคัญ เพื่อเช็คว่าของที่เพิ่งทำมัน work จริง
4. จบ lesson Claude จะบอกว่าให้พิมพ์อะไรเพื่อขึ้นบทถัดไป

คุณไม่ได้กำลังนั่งอ่าน documentation. คุณกำลังคุยกับ Claude แบบมี guide ขณะที่สร้างของไปด้วย.

**สำคัญ: คอร์สนี้ใช้ 2 หน้าต่าง.** ตั้งแต่ Lesson 1 คุณจะเปิด Claude Code หน้าต่างที่ 2 ที่ folder `my-first-project`. หน้าต่าง 1 (folder `ltd-ai-101` หน้าต่างนี้) คือผู้สอน. หน้าต่าง 2 คือ workshop ของคุณ paste prompt ที่ผู้สอนส่งให้ และดูผลลัพธ์ที่ Claude สร้าง. คุณสลับ 2 หน้าต่างไปมาตลอดคอร์ส (Cmd+Tab / Alt+Tab). อย่าปิดหน้าต่าง 1 ระหว่างคอร์ส.

---

## กฎเดียวของคอร์สนี้

ทำตามลำดับ. อย่าข้าม.

ทุก lesson ต่อยอด `/brief` ตัวเดิมจากบทก่อน. Lesson 2 ใช้ slash command จาก Lesson 1. Lesson 4 แตก skill จาก Lesson 2. Lesson 5 deploy ของที่สร้างมาทั้งหมด. ถ้าข้าม คุณจะติดและไม่รู้ว่าติดที่ไหน.

ถ้าระหว่างทางมี step ไหนที่ทำตามไม่ทัน หยุดบอก Claude ว่า "ช้าหน่อย" หรือ "ไม่เข้าใจ ขอใหม่" Claude จะกลับมาอธิบายให้. ไม่ต้องเร่ง.

---

## เกี่ยวกับคนสอน

**Paint (ลงทุนไดอารี่)** เป็นคนทำคลิป YouTube สาย investing + AI เป็นภาษาไทย. ผมเริ่มใช้ Claude Code เมื่อต้นปี 2026 ตอนที่ทำเองยังไม่ค่อยเป็น ผมไม่เข้าใจอะไรก็ถาม AI นี่แหละ เลยเป็นที่มาว่าก็ให้ AI มันสอนเราไปเลยสิ

ผมไม่ได้เก่ง coding. ผมแค่ใช้ Claude Code ทำงานทุกวันมาประมาณ 2 เดือน (ตอนเขียนคอร์สนี้) แล้วระบบที่ผมใช้ทำคอนเทนต์ทั้งช่อง ก็ประกอบจากของพื้นฐานที่อยู่ในคอร์สนี้แทบทั้งหมด ถ้าผมทำได้ คุณก็ทำได้

---

## พร้อมจะเริ่มยัง

ใน chat ของ Claude Code ตรงนี้ พิมพ์:

**Start Lesson 1**

ตั้ง timer 90 นาทีเอาไว้ก็ดี. ส่วนใหญ่จบใน 60-90 นาที. ถ้านานกว่านั้น ก็ไม่เป็นไร ไม่ใช่การแข่ง

---

**Version:** 0.2
**Last Updated:** 2026-05-07

---

## License & Disclaimer

- **License:** Free for personal educational use only. No commercial use, no resale, no redistribution under another name. All rights reserved by Paint (ลงทุนไดอารี่). See [LICENSE](LICENSE).
- **Disclaimer:** Educational content only — not investment or financial advice. See [DISCLAIMER.md](DISCLAIMER.md).

Copyright © 2026 Paint (ลงทุนไดอารี่). All rights reserved.
