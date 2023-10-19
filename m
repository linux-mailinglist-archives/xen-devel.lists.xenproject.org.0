Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 696747CF572
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 12:35:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619152.963753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQMv-0004Sy-SO; Thu, 19 Oct 2023 10:35:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619152.963753; Thu, 19 Oct 2023 10:35:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQMv-0004Rk-Oa; Thu, 19 Oct 2023 10:35:09 +0000
Received: by outflank-mailman (input) for mailman id 619152;
 Thu, 19 Oct 2023 10:35:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qtQMu-0004Qr-Bv
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 10:35:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qtQMr-0004Ny-0c; Thu, 19 Oct 2023 10:35:05 +0000
Received: from [15.248.3.1] (helo=[10.24.67.33])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qtQMq-0006oG-Pi; Thu, 19 Oct 2023 10:35:04 +0000
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
	bh=j62t+9DSO39t7SFMliHewsayfvCx4YrKUP9SV7smm6A=; b=jHnuvoNWtzWBZoCphRiDWa60wg
	3h6R/0oAfaTo5SlEg5lX3ganZi4uWL1q0WoFqv6ZTHNolWK7SYgW1qYAqCUhPAYlVGV1iAw1WXtUk
	4fvuj/qea3mL0yjwc1yF2+yO55xeiMt+n3VHNbPaUne+3iH7+OM91anWMXAA50zB/VMA=;
Message-ID: <c474dde4-3175-426b-a10d-43e816f9fe27@xen.org>
Date: Thu, 19 Oct 2023 11:35:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/29] xen/asm-generic: introduce stub header paging.h
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <5def596788d602b9b34302630c91644952c7115d.1694702259.git.oleksii.kurochko@gmail.com>
 <0911e74f-73e1-6053-ce1f-ecea98ea5f17@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0911e74f-73e1-6053-ce1f-ecea98ea5f17@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 19/10/2023 10:05, Jan Beulich wrote:
> On 14.09.2023 16:56, Oleksii Kurochko wrote:
>> The patch introduces stub header needed for full Xen build.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>>   xen/include/asm-generic/paging.h | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>   create mode 100644 xen/include/asm-generic/paging.h
>>
>> diff --git a/xen/include/asm-generic/paging.h b/xen/include/asm-generic/paging.h
>> new file mode 100644
>> index 0000000000..2aab63b536
>> --- /dev/null
>> +++ b/xen/include/asm-generic/paging.h
>> @@ -0,0 +1,17 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#ifndef __ASM_GENERIC_PAGING_H__
>> +#define __ASM_GENERIC_PAGING_H__
>> +
>> +#define paging_mode_translate(d)	(1)
>> +#define paging_mode_external(d)		(1)
This is more a question for Jan, in the past I recall you asked the 
macor to evaluate the argument. Shouldn't we do the same here?

Also, I think we want to take the opportunity to convert to true. 
Lastly, this seems to be using hard tab rather than soft tab. In Xen we 
use the latter (unless this is a file imported from Linux).

>> +
>> +#endif /* __ASM_GENERIC_PAGING_H__ */
> 
> Looks okay, but wants accompanying by dropping (i.e. effectively moving)
> Arm's respective header.

FWIW, I would be ok if the change is separate. I can help to write it also.

> The description than also wants adjusting (it
> wasn't quite suitable anyway, as there's missing context).

Cheers,

-- 
Julien Grall

