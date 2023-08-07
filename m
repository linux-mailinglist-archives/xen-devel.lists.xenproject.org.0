Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5E4772A85
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 18:23:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578718.906359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT30B-0000P4-7m; Mon, 07 Aug 2023 16:22:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578718.906359; Mon, 07 Aug 2023 16:22:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT30B-0000MM-46; Mon, 07 Aug 2023 16:22:39 +0000
Received: by outflank-mailman (input) for mailman id 578718;
 Mon, 07 Aug 2023 16:22:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Un4=DY=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qT309-0000MG-FB
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 16:22:37 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d160c17-353e-11ee-b280-6b7b168915f2;
 Mon, 07 Aug 2023 18:22:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id E79ED8285614;
 Mon,  7 Aug 2023 11:22:32 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 7Rdtpzm9DrP7; Mon,  7 Aug 2023 11:22:32 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id F2E2E8285869;
 Mon,  7 Aug 2023 11:22:31 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id rfmzEZErQy5B; Mon,  7 Aug 2023 11:22:31 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 97FAA8285614;
 Mon,  7 Aug 2023 11:22:31 -0500 (CDT)
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
X-Inumbo-ID: 9d160c17-353e-11ee-b280-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com F2E2E8285869
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1691425352; bh=U2qvdXd5/gE2j6fLA/EynBU+JzMY/KeOwVUZItiPaZA=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=lFwHTlEjbiZn/KgYyhdNErvTH/X7A3NRlJKHnuzHAAp65bWa3k85nqJIQol/hxwFR
	 f7HYNM5kjZMxV5ErAr+wMqdQ8+c6+HR9BGIgrCz0UN9IWIcPeJxyuIeViZ1q/rotR3
	 XwAJQ08Y6/RAv+7r/TqRmVF0RCtMBwSJtktvuNcw=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <62c8859d-8904-ce30-019b-df976378256c@raptorengineering.com>
Date: Mon, 7 Aug 2023 11:22:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/4] xen/ppc: Switch to medium PIC code model
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1690934409.git.sanastasio@raptorengineering.com>
 <c72c242988295b665a8bd235a351806dc112ad01.1690934409.git.sanastasio@raptorengineering.com>
 <d3c5e9a2-918d-5b6c-b0bd-34b61d00c769@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <d3c5e9a2-918d-5b6c-b0bd-34b61d00c769@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/2/23 2:16 AM, Jan Beulich wrote:
> On 02.08.2023 02:11, Shawn Anastasio wrote:
>> --- a/xen/arch/ppc/include/asm/asm-defns.h
>> +++ b/xen/arch/ppc/include/asm/asm-defns.h
>> @@ -16,6 +16,13 @@
>>      lis reg, (val) @h;                                                       \
>>      ori reg, reg, (val) @l;                                                  \
>>
>> +/*
>> + * Load the address of a symbol from the TOC into the specified GPR.
>> + */
>> +#define LOAD_REG_ADDR(reg,name)                                              \
>> +    addis reg,%r2,name@toc@ha;                                               \
>> +    addi  reg,reg,name@toc@l
> 
> Didn't you indicate you'd add blanks after the commas (also) here?
> 
>> --- a/xen/arch/ppc/ppc64/head.S
>> +++ b/xen/arch/ppc/ppc64/head.S
>> @@ -1,6 +1,7 @@
>>  /* SPDX-License-Identifier: GPL-2.0-or-later */
>>
>>  #include <asm/asm-defns.h>
>> +#include <asm/asm-offsets.h>
>>
>>      .section .text.header, "ax", %progbits
>>
>> @@ -11,16 +12,19 @@ ENTRY(start)
>>      FIXUP_ENDIAN
>>
>>      /* set up the TOC pointer */
>> -    LOAD_IMM32(%r2, .TOC.)
>> +    bcl	    20, 31, 1f
> 
> Hard tab slipped in.
> 
> I'm happy to take care of both while committing; then:
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks, Jan. Just to clarify, are there any outstanding comments that I
need to address in this series, or are they all able to be handled by
you during commit?

> Jan

- Shawn

