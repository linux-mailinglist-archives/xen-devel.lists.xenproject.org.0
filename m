Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D51560832
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 20:02:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358028.586977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6c0l-0004Vq-8P; Wed, 29 Jun 2022 18:01:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358028.586977; Wed, 29 Jun 2022 18:01:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6c0l-0004U6-5L; Wed, 29 Jun 2022 18:01:59 +0000
Received: by outflank-mailman (input) for mailman id 358028;
 Wed, 29 Jun 2022 18:01:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o6c0k-0004U0-4h
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 18:01:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o6c0j-0000fq-UE; Wed, 29 Jun 2022 18:01:57 +0000
Received: from [54.239.6.187] (helo=[192.168.9.41])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o6c0j-00062L-Mc; Wed, 29 Jun 2022 18:01:57 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=7VoP880SRoJXEVg0j7FHhUEnCYZABffhkjsN2aIfDVA=; b=Pmf102J2sSI+sYr89ALuS9FIss
	iU+FK3/KiEc0MsJRtfvAYnySwaX28lsi32OcxF+N5LrRNd2ImuCx4mMCxQsECahIaqa4xRlB11dFY
	DzzPzxB7piwiYTrr7KsoAoGje/JH3TtYfFin2FGFP5EAWjZIZ39XGrurCDeNUitww8jo=;
Message-ID: <ef8b540c-d2c2-c999-d3fe-08fc88665ad9@xen.org>
Date: Wed, 29 Jun 2022 19:01:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: R: R: Crash when using xencov
To: Carmine Cesarano <c.cesarano@hotmail.it>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <AM7PR10MB355942D32F58FF02379C398CF8B99@AM7PR10MB3559.EURPRD10.PROD.OUTLOOK.COM>
 <87d0667b-2b85-f006-ea3c-6f557b2bdc8e@xen.org>
 <AM7PR10MB355972A68A222CB9FBAC43D4F8B99@AM7PR10MB3559.EURPRD10.PROD.OUTLOOK.COM>
 <daa12b90-da87-d463-24c4-a13fba330f1d@xen.org>
 <AM7PR10MB35593AA7F46B4D4A0BBD9841F8B99@AM7PR10MB3559.EURPRD10.PROD.OUTLOOK.COM>
 <AM7PR10MB3559BB8CB733902773B1AD6AF8B99@AM7PR10MB3559.EURPRD10.PROD.OUTLOOK.COM>
 <AM7PR10MB3559A1984F6B53CEFB4FECC7F8B89@AM7PR10MB3559.EURPRD10.PROD.OUTLOOK.COM>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AM7PR10MB3559A1984F6B53CEFB4FECC7F8B89@AM7PR10MB3559.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

(moving the discussion to xen-devel)

On 28/06/2022 16:32, Carmine Cesarano wrote:
> Hi,

Hello,

Please refrain to top-post and/or post images on the ML. If you need to 
share an image, then please upload them somewhere else.

> I made two further attempts, first by compiling xen and xen-tools with gcc 10 and second with gcc 7, getting the same problem.
> 
> By running “xencov reset”, with with both compilers, the line of code associated with the crash is:

Discussing with Andrew Cooper on IRC, it looks like the problem is 
because Xen and GCC disagrees on the format. There are newer format that 
Xen doesn't understand.

If you are interested to support GCOV on your setup, then I would 
suggest to look at the documentation and/or look at what Linux is doing 
for newer compiler.

> 
>    *   /xen/xen/common/coverage/gcc_4_7.c:123
> By running “xencov read”, I get two different behaviors with the two compilers:
> 
>    *   /xen/xen/common/coverage/gcc_4_7.c:165   [GCC 11]
>    *   /xen/xen/common/coverage/gcov.c:131          [GCC 7]
> 
> Attached are the logs captured with a serial port.
> 
> Cheers,
> 
> Carmine Cesarano
> Da: Julien Grall<mailto:julien@xen.org>
> Inviato: lunedì 27 giugno 2022 14:42
> A: Carmine Cesarano<mailto:c.cesarano@hotmail.it>
> Oggetto: Re: R: Crash when using xencov
> 
> Hello,
> 
> You seemed to have removed xen-users from the CC list. Please keep it in
> CC unless the discussion needs to private.
> 
> Also, please avoid top-posting.
> 
> On 27/06/2022 13:36, Carmine Cesarano wrote:
>> Yes, i mean stable-4.16. Below the logs after running "xencov reset". The situation for "xencov read" is similar.
>>
>> (XEN) ----[ Xen-4.16.2-pre  x86_64  debug=y gcov=y  Not tainted ]----
>> (XEN) CPU:    0
>> (XEN) RIP:    e008:[<ffff82d040257bd2>] gcov_info_reset+0x87/0xa9
>> (XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor (d0v0)
>> (XEN) rax: 0000000000000000   rbx: ffff82d04056bdc0   rcx: 00000000000c000b
>> (XEN) rdx: 0000000000000000   rsi: 0000000000000001   rdi: ffff82d04056bdc0
>> (XEN) rbp: ffff83023a7e7cb0   rsp: ffff83023a7e7c88   r8:  7fffffffffffffff
>> (XEN) r9:  deadbeefdeadf00d   r10: 0000000000000000   r11: 0000000000000000
>> (XEN) r12: 0000000000000001   r13: ffff82d04056be28   r14: 0000000000000000
>> (XEN) r15: ffff82d04056bdc0   cr0: 0000000080050033   cr4: 0000000000172620
>> (XEN) cr3: 000000017ea0b000   cr2: 0000000000000000
>> (XEN) fsb: 00007fc0fb0ca200   gsb: ffff88807b400000   gss: 0000000000000000
>> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
>> (XEN) Xen code around <ffff82d040257bd2> (gcov_info_reset+0x87/0xa9):
>> (XEN)  1d 44 89 f0 49 8b 57 70 <4c> 8b 24 c2 49 83 c4 18 48 83 05 a6 81 4c 00 01
>> (XEN) Xen stack trace from rsp=ffff83023a7e7c88:
>> (XEN)    ffff82d04056bdc0 0000000000000001 ffff82d04070f180 0000000000000001
>> (XEN)    0000000000000000 ffff83023a7e7cc8 ffff82d040257a6a ffff83023a7e7db0
>> (XEN)    ffff83023a7e7ce8 ffff82d040257547 ffff83023a7e7fff ffff83023a7e7fff
>> (XEN)    ffff83023a7e7e58 ffff82d040255d5f ffff83023a7e7d68 ffff82d0403b5e8b
>> (XEN)    000000000017d5b2 0000000000000000 ffff83023a6b5000 0000000000000000
>> (XEN)    00007fc0fb348010 800000017ea0e127 0000000000000202 ffff82d040399fd8
>> (XEN)    0000000000005a40 ffff83023a7e7d68 0000000000000206 ffff82e002fab640
>> (XEN)    ffff83023a7e7e58 ffff82d0403bb29d ffff83023a69f000 000000003a7e7fff
>> (XEN)    000000017ea0f067 0000000000000000 000000000017d5b2 000000000017d5b2
>> (XEN)    0000001400000014 0000000000000002 ffffffffffffffff 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> (XEN)    0000000000000000 ffff83023a7e7ef8 0000000000000001 ffff83023a69f000
>> (XEN)    deadbeefdeadf00d ffff82d04025579d ffff83023a7e7ee8 ffff82d040387f62
>> (XEN)    00007fc0fb348010 deadbeefdeadf00d deadbeefdeadf00d deadbeefdeadf00d
>> (XEN)    deadbeefdeadf00d ffff83023a7e7fff ffff82d0403b2c99 ffff83023a7e7eb8
>> (XEN)    ffff82d04038214c ffff83023a69f000 ffff83023a7e7ed8 ffff83023a69f000
>> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> (XEN)    00007cfdc58180e7 ffff82d0404392ae 0000000000000000 ffff88800f484c00
>> (XEN) Xen call trace:
>> (XEN)    [<ffff82d040257bd2>] R gcov_info_reset+0x87/0xa9
> 
> Thanks! There are multiple versions of gcov_info_reset() in the tree.
> The one used will depend on the compiler you are using.
> 
> Can you use addr2line (or gdb) to find out the file and line of code
> associated with the crash?
> 
> For addr2line you could do:
> 
>     addr2line -e xen-syms 0xffff82d040257bd2

Cheers,

-- 
Julien Grall

