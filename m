Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54799AB766E
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 22:09:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984585.1370662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFIPf-0000P6-Oy; Wed, 14 May 2025 20:09:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984585.1370662; Wed, 14 May 2025 20:09:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFIPf-0000Ne-Li; Wed, 14 May 2025 20:09:11 +0000
Received: by outflank-mailman (input) for mailman id 984585;
 Wed, 14 May 2025 20:09:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5kHg=X6=3mdeb.com=krystian.hebel@srs-se1.protection.inumbo.net>)
 id 1uFIPd-0000NY-65
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 20:09:10 +0000
Received: from 1.mo576.mail-out.ovh.net (1.mo576.mail-out.ovh.net
 [178.33.251.173]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4978ee46-30ff-11f0-9ffb-bf95429c2676;
 Wed, 14 May 2025 22:09:06 +0200 (CEST)
Received: from director2.ghost.mail-out.ovh.net (unknown [10.108.9.253])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4ZyPYs1fnQz2G3j
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 20:09:05 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-x5dkc (unknown [10.110.118.120])
 by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 7FECD1FD2E;
 Wed, 14 May 2025 20:09:03 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.111])
 by ghost-submission-5b5ff79f4f-x5dkc with ESMTPSA
 id XSQSDF/4JGgm9hsAasCC5w
 (envelope-from <krystian.hebel@3mdeb.com>); Wed, 14 May 2025 20:09:03 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 4978ee46-30ff-11f0-9ffb-bf95429c2676
Authentication-Results:garm.ovh; auth=pass (GARM-111S00554af65ee-9925-471f-9134-38fabac865d4,
                    9B436DAC6DFFFB54EA311452D2E4A14E2CA829B8) smtp.auth=krystian.hebel@3mdeb.com
X-OVh-ClientIp:217.171.54.142
Content-Type: multipart/alternative;
 boundary="------------hvjD3qBJB9sl4JxYqxVTCmgZ"
Message-ID: <5aca7ae5-1237-461c-a336-d1c62f3d5c06@3mdeb.com>
Date: Wed, 14 May 2025 22:09:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/22] x86/include/asm/intel-txt.h: constants and
 accessors for TXT registers and heap
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Sergii Dmytruk <sergii.dmytruk@3mdeb.com>, xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ross Philipson <ross.philipson@oracle.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>, =?UTF-8?Q?Mateusz_M=C3=B3wka?=
 <mateusz.mowka@intel.com>, trenchboot-devel@googlegroups.com
References: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
 <c049f4ced707769a630cbb8d38a617910279b404.1747155790.git.sergii.dmytruk@3mdeb.com>
 <a286bb98-4c97-4a93-ad99-e2095d5c86e6@citrix.com>
Content-Language: en-US
From: Krystian Hebel <krystian.hebel@3mdeb.com>
In-Reply-To: <a286bb98-4c97-4a93-ad99-e2095d5c86e6@citrix.com>
X-Ovh-Tracer-Id: 17897586395426367900
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdejleduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurheptgfkffggfgfuvfevfhfhjgesrgdtreertddvjeenucfhrhhomhepmfhrhihsthhirghnucfjvggsvghluceokhhrhihsthhirghnrdhhvggsvghlseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeehheefhfeiffffledvfeeuvdfgteeiteekvdfhgeegheevleeuvdfgieekteetgfenucffohhmrghinhepkhhisgdrkhhivghvrdhurgdpfehmuggvsgdrtghomhenucfkphepuddvjedrtddrtddruddpvddujedrudejuddrheegrddugedvpdefjedrheelrddugedvrdduuddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehkrhihshhtihgrnhdrhhgvsggvlhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheejiegmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=QU1v89ODndJ21lqfMdqKnpKQv3A4VOjyU/XmaEsRvkw=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1747253345; v=1;
 b=mkW8TFTereGv0NAirNsZwG+XNMs8QaNObpbtyZ5R3gfLjPN4lknsmIeEDTVUEG0WMQPwLNYM
 70IVKHjzoYlHD8cSwYjFqF5JurKoXS4yRPX/avHBF8eTq4rNvEUhlbDV5Hjk0ecrIWAi4FgY5xz
 g6OO/Y7K4Hf+6IMtb2CAAmFUiZCwnBKaLdPnROxuwHMIa/RtL/3FRJ4Z1sUNh1jy4+g5hoKT3KI
 8hTUKjV+nyzHny96tluxKYpiDdVJOo1JX3Yp/Y6Gkxf92/IXC9Dwweyl4pbOQWDRBdKbrufFVY5
 u2rg/2zfSwDdGYEMnt5CE93u3QRDqud5UJjGMiVWNcDRg==

This is a multi-part message in MIME format.
--------------hvjD3qBJB9sl4JxYqxVTCmgZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14.05.2025 16:55, 'Andrew Cooper' via trenchboot-devel wrote:
> On 13/05/2025 6:05 pm, Sergii Dmytruk wrote:
>> diff --git a/xen/arch/x86/include/asm/intel-txt.h b/xen/arch/x86/include/asm/intel-txt.h
>> new file mode 100644
>> index 0000000000..07be43f557
>> --- /dev/null
>> +++ b/xen/arch/x86/include/asm/intel-txt.h
>> @@ -0,0 +1,277 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +
> Please have at least a one-liner introduction to what TXT is.  Is there
> a stable URL for the TXT spec?  (I can't spot an obvious one, googling
> around)
Not an official source and I don't know if it would be OK to use it
here, but my go-to source is https://kib.kiev.ua/x86docs/Intel/TXT/,
it even has previous versions, which may be helpful in understanding
some of deprecated (e.g. related to TPM 1.2) intricacies of
implementation.
>> +{
>> +    volatile uint64_t *reg = _txt(TXT_PRIV_CONFIG_REGS_BASE + reg_no);
>> +    return *reg;
>> +}
>> +
>> +static inline void write_txt_reg(int reg_no, uint64_t val)
>> +{
>> +    volatile uint64_t *reg = _txt(TXT_PRIV_CONFIG_REGS_BASE + reg_no);
>> +    *reg = val;
>> +    /* This serves as TXT register barrier */
>> +    (void)read_txt_reg(TXTCR_ESTS);
> What is this barrier for?
>
> It's not for anything in the CPU side of things, because UC accesses are
> strictly ordered.
>
> I presume it's for LPC bus ordering then, but making every write be a
> write/read pair seems very expensive.
According to TXT spec, it is required only for TXT.CMD.CLOSE-PRIVATE
and TXT.CMD.UNLOCK-MEM-CONFIG, and it probably could be changed to any
other serializing instruction. IIRC, those registers are written to
only in txt_reset(), so maybe adding a barrier there would suffice.
>> +/*
>> + * Functions to extract data from the Intel TXT Heap Memory. The layout
>> + * of the heap is as follows:
>> + *  +------------------------------------+
>> + *  | Size of Bios Data table (uint64_t) |
>> + *  +------------------------------------+
>> + *  | Bios Data table                    |
>> + *  +------------------------------------+
>> + *  | Size of OS MLE table (uint64_t)    |
>> + *  +------------------------------------+
>> + *  | OS MLE table                       |
>> + *  +--------------------------------    +
>> + *  | Size of OS SINIT table (uint64_t)  |
>> + *  +------------------------------------+
>> + *  | OS SINIT table                     |
>> + *  +------------------------------------+
>> + *  | Size of SINIT MLE table (uint64_t) |
>> + *  +------------------------------------+
>> + *  | SINIT MLE table                    |
>> + *  +------------------------------------+
>> + *
>> + *  NOTE: the table size fields include the 8 byte size field itself.
>> + */
>> +static inline uint64_t txt_bios_data_size(void *heap)
>> +{
>> +    return *((uint64_t *)heap) - sizeof(uint64_t);
>> +}
> This is quite horrible, but I presume this is as specified by TXT?
Yes.
> To confirm, it's a tightly packed data structure where each of the 4
> blobs is variable size?  Are there any alignment requirements on the
> table sizes?  I suspect not, given the __packed attributes.
Yes, those are all of variable sizes. TXT specification notes that all
of the sizes must be a multiple of 8 bytes, but we've seen platforms
where BiosData (filled by BIOS ACM, so beyond our control) isn't
aligned, which makes following fields also unaligned. Because of that,
we treated it as if there was no such requirement.

-- 
Krystian Hebel
Firmware Engineer
https://3mdeb.com  | @3mdeb_com

--------------hvjD3qBJB9sl4JxYqxVTCmgZ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 14.05.2025 16:55, 'Andrew Cooper'
      via trenchboot-devel wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:a286bb98-4c97-4a93-ad99-e2095d5c86e6@citrix.com">
      <pre class="moz-quote-pre" wrap="">On 13/05/2025 6:05 pm, Sergii Dmytruk wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">diff --git a/xen/arch/x86/include/asm/intel-txt.h b/xen/arch/x86/include/asm/intel-txt.h
new file mode 100644
index 0000000000..07be43f557
--- /dev/null
+++ b/xen/arch/x86/include/asm/intel-txt.h
@@ -0,0 +1,277 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Please have at least a one-liner introduction to what TXT is.  Is there
a stable URL for the TXT spec?  (I can't spot an obvious one, googling
around)</pre>
    </blockquote>
    Not an official source and I don't know if it would be OK to use it<br>
    here, but my go-to source is <a class="moz-txt-link-freetext" href="https://kib.kiev.ua/x86docs/Intel/TXT/">https://kib.kiev.ua/x86docs/Intel/TXT/</a>,<br>
    it even has previous versions, which may be helpful in understanding<br>
    some of deprecated (e.g. related to TPM 1.2) intricacies of<br>
    implementation.<br>
    <blockquote type="cite"
      cite="mid:a286bb98-4c97-4a93-ad99-e2095d5c86e6@citrix.com"><span
      style="white-space: pre-wrap">
</span><span style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+{
+    volatile uint64_t *reg = _txt(TXT_PRIV_CONFIG_REGS_BASE + reg_no);
+    return *reg;
+}
+
+static inline void write_txt_reg(int reg_no, uint64_t val)
+{
+    volatile uint64_t *reg = _txt(TXT_PRIV_CONFIG_REGS_BASE + reg_no);
+    *reg = val;
+    /* This serves as TXT register barrier */
+    (void)read_txt_reg(TXTCR_ESTS);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
What is this barrier for?

It's not for anything in the CPU side of things, because UC accesses are
strictly ordered.

I presume it's for LPC bus ordering then, but making every write be a
write/read pair seems very expensive.</pre>
    </blockquote>
    According to TXT spec, it is required only for TXT.CMD.CLOSE-PRIVATE<br>
    and TXT.CMD.UNLOCK-MEM-CONFIG, and it probably could be changed to
    any<br>
    other serializing instruction. IIRC, those registers are written to<br>
    only in txt_reset(), so maybe adding a barrier there would suffice.<br>
    <blockquote type="cite"
      cite="mid:a286bb98-4c97-4a93-ad99-e2095d5c86e6@citrix.com"><span
      style="white-space: pre-wrap">
</span><span style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+/*
+ * Functions to extract data from the Intel TXT Heap Memory. The layout
+ * of the heap is as follows:
+ *  +------------------------------------+
+ *  | Size of Bios Data table (uint64_t) |
+ *  +------------------------------------+
+ *  | Bios Data table                    |
+ *  +------------------------------------+
+ *  | Size of OS MLE table (uint64_t)    |
+ *  +------------------------------------+
+ *  | OS MLE table                       |
+ *  +--------------------------------    +
+ *  | Size of OS SINIT table (uint64_t)  |
+ *  +------------------------------------+
+ *  | OS SINIT table                     |
+ *  +------------------------------------+
+ *  | Size of SINIT MLE table (uint64_t) |
+ *  +------------------------------------+
+ *  | SINIT MLE table                    |
+ *  +------------------------------------+
+ *
+ *  NOTE: the table size fields include the 8 byte size field itself.
+ */
+static inline uint64_t txt_bios_data_size(void *heap)
+{
+    return *((uint64_t *)heap) - sizeof(uint64_t);
+}
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This is quite horrible, but I presume this is as specified by TXT?</pre>
    </blockquote>
    Yes.<span style="white-space: pre-wrap">
</span><span style="white-space: pre-wrap">
</span>
    <blockquote type="cite"
      cite="mid:a286bb98-4c97-4a93-ad99-e2095d5c86e6@citrix.com">
      <pre class="moz-quote-pre" wrap="">To confirm, it's a tightly packed data structure where each of the 4
blobs is variable size?  Are there any alignment requirements on the
table sizes?  I suspect not, given the __packed attributes.</pre>
    </blockquote>
    Yes, those are all of variable sizes. TXT specification notes that
    all<br>
    of the sizes must be a multiple of 8 bytes, but we've seen platforms<br>
    where BiosData (filled by BIOS ACM, so beyond our control) isn't<br>
    aligned, which makes following fields also unaligned. Because of
    that,<br>
    we treated it as if there was no such requirement.<br>
    <pre class="moz-signature" cols="72">-- 
Krystian Hebel
Firmware Engineer
<a class="moz-txt-link-freetext" href="https://3mdeb.com">https://3mdeb.com</a> | @3mdeb_com</pre>
  </body>
</html>

--------------hvjD3qBJB9sl4JxYqxVTCmgZ--

