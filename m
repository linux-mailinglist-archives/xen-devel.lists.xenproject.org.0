Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DF19C57D3
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2024 13:35:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834579.1250142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAq6C-0000tn-Ud; Tue, 12 Nov 2024 12:34:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834579.1250142; Tue, 12 Nov 2024 12:34:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAq6C-0000rH-Rq; Tue, 12 Nov 2024 12:34:24 +0000
Received: by outflank-mailman (input) for mailman id 834579;
 Tue, 12 Nov 2024 12:34:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PmjB=SH=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1tAq6B-0000rB-Je
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2024 12:34:23 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fd4b8f6-a0f2-11ef-99a3-01e77a169b0f;
 Tue, 12 Nov 2024 13:34:19 +0100 (CET)
Received: from [192.168.1.113] (93-36-216-241.ip62.fastwebnet.it
 [93.36.216.241])
 by support.bugseng.com (Postfix) with ESMTPSA id 126F74EE0739;
 Tue, 12 Nov 2024 13:34:18 +0100 (CET)
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
X-Inumbo-ID: 6fd4b8f6-a0f2-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE2Mi41NS4xMzEuNDciLCJoZWxvIjoic3VwcG9ydC5idWdzZW5nLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjZmZDRiOGY2LWEwZjItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDE0ODU5LjM3MTk0LCJzZW5kZXIiOiJmZWRlcmljby5zZXJhZmluaUBidWdzZW5nLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1731414858; bh=DawTrb/8OYdqQ/+dNLYfJmQu9TjbBAey82rAQ7mO5KQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mU+GUOGETkwGg0ki+AQBj6dZQUGktm5bGT89QGYDX1ScZvmf3zTnMmpffSH+a2Z8M
	 nq54WhyJ9fsgeQsxVFc8tU+WPVisdsniGJrv39OUBndSnu4ZeAbyq+nZ5w8JHHYCfX
	 TulALPoNTJfxKOYWLaQFg2vXowGy1pRmPT/eKhydyDkw51IJNyJdHx1hc/F+auhiAH
	 N04psZoffyQCtYIM2sP6URksxB4FjSevEXOn+BlOhukkMZdySOIEsIUvPOZQhbWdiq
	 IHwz326zLabqsqsOlnqe9F1211XtBEaFwVNAwtCcZpe0h3zLDvgRYjubDIm+ZKoL12
	 Yt+f7pq3+webg==
Message-ID: <c80ba929-3af4-4e72-b698-5f185a4ae708@bugseng.com>
Date: Tue, 12 Nov 2024 13:34:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/3] x86/emul: define pseudo keyword fallthrough
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1730880832.git.federico.serafini@bugseng.com>
 <a0341b50ece1ba1b5b346b54db7d2abdc150cb95.1730880832.git.federico.serafini@bugseng.com>
 <be21f3cf-e7a8-469a-99a6-4098032a4df4@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG
In-Reply-To: <be21f3cf-e7a8-469a-99a6-4098032a4df4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/11/24 12:22, Jan Beulich wrote:
> On 06.11.2024 10:04, Federico Serafini wrote:
>> The pseudo keyword fallthrough shall be used to make explicit the
>> fallthrough intention at the end of a case statement (doing this
>> through comments is deprecated).
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>> ---
>>   xen/arch/x86/x86_emulate/x86_emulate.h | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
> 
> When you had asked my privately on Matrix, I specifically said: "Adding
> the pseudo-keyword to x86-emulate.h (not x86_emulate.h) is probably best,
> unless problems with that approach turn up." Even if identical re-
> definitions are deemed fine, I for one consider such bad practice. Yet
> by playing with this file (and outside of any relevant #ifdef) means
> there will be such a re-definition when building Xen itself.

Sorry Jan, I misinterpreted your message.
I tested the definition in the x86-emulate.h and there are no problems.
I will send a V2.


> In fact the patch subject should also already clarify that the auxiliary
> definition is only needed for the test and fuzzing harnesses.

Ok.


>> --- a/xen/arch/x86/x86_emulate/x86_emulate.h
>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.h
>> @@ -23,6 +23,16 @@
>>   # error Unknown compilation width
>>   #endif
>>   
>> +/*
>> + * Pseudo keyword 'fallthrough' to make explicit the fallthrough intention at
>> + * the end of a case statement.
>> + */
>> +#if (!defined(__clang__) && (__GNUC__ >= 7))
> 
> I realize xen/compiler.h has it like that, but may I ask that you omit
> the meaningless outer pair of parentheses?

Ok.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG
Ph.D. Student, Ca' Foscari University of Venice


