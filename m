Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4159E808F99
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 19:10:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650104.1015348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBIok-0001Ki-Ke; Thu, 07 Dec 2023 18:09:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650104.1015348; Thu, 07 Dec 2023 18:09:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBIok-0001J3-HJ; Thu, 07 Dec 2023 18:09:46 +0000
Received: by outflank-mailman (input) for mailman id 650104;
 Thu, 07 Dec 2023 18:09:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fUwa=HS=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rBIoi-0001Iu-P5
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 18:09:44 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca4d28bc-952b-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 19:09:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id D4C888285699;
 Thu,  7 Dec 2023 12:09:39 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id RvgAiTkgzPCb; Thu,  7 Dec 2023 12:09:39 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 29A1B82856A2;
 Thu,  7 Dec 2023 12:09:39 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id uVamJeiu9JZ4; Thu,  7 Dec 2023 12:09:39 -0600 (CST)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 898448285699;
 Thu,  7 Dec 2023 12:09:38 -0600 (CST)
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
X-Inumbo-ID: ca4d28bc-952b-11ee-9b0f-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 29A1B82856A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1701972579; bh=RRYGcmFAZ4lqXWbmZEQd7K81iGVYOBFPBET0KKFx29c=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=UXsoJrxMddHSK+hIp1IVrIRe1LfABekNs7TO5SPfKRsn7F4JKDJJ+dZJaz80/ynqy
	 lA6NoFclAHyoAs44wD+Vfhee9Z1unaJUwL8qc05TbEkGAAFyICkvSGhOnVpsWHweol
	 fiJ1W5T40zyrLwjWP5eoYY6im4JJ2S3wXtoojKVU=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <c2f3280e-2208-496b-a0b5-fda1a2076b3a@raptorengineering.com>
Date: Thu, 7 Dec 2023 12:09:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/39] xen/riscv: introduce arch-riscv/hvm/save.h
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <acb870b980a791d7800d47c08c9574275159df39.1700761381.git.oleksii.kurochko@gmail.com>
 <5eae9d9b-e499-4c8c-aed0-2f52c0aa7c9f@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <5eae9d9b-e499-4c8c-aed0-2f52c0aa7c9f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/5/23 9:59 AM, Jan Beulich wrote:
> On 24.11.2023 11:30, Oleksii Kurochko wrote:
>> --- a/xen/include/public/hvm/save.h
>> +++ b/xen/include/public/hvm/save.h
>> @@ -91,6 +91,8 @@ DECLARE_HVM_SAVE_TYPE(END, 0, struct hvm_save_end);
>>  #include "../arch-arm/hvm/save.h"
>>  #elif defined(__powerpc64__)
>>  #include "../arch-ppc.h"
>> +#elif defined(__riscv)
>> +#include "../arch-riscv/hvm/save.h"
>>  #else
>>  #error "unsupported architecture"
>>  #endif
> 
> The PPC part here looks bogus altogether. Shawn?
>

I think my original intention here was to avoid creating yet another
empty header while still having a place to put PPC-specific definitions
that might be required.

See as how the ARM file is entirely empty though, I doubt we'll be any
different, so this could definitely be dropped.

> Jan

Thanks,
Shawn

