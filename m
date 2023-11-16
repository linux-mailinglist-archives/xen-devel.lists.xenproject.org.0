Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAE57EDEA4
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 11:36:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634114.989362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Zit-0005ze-EL; Thu, 16 Nov 2023 10:35:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634114.989362; Thu, 16 Nov 2023 10:35:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Zit-0005xP-BL; Thu, 16 Nov 2023 10:35:47 +0000
Received: by outflank-mailman (input) for mailman id 634114;
 Thu, 16 Nov 2023 10:35:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r3Zir-0005xJ-Pe
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 10:35:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r3Ziq-0002mC-St; Thu, 16 Nov 2023 10:35:44 +0000
Received: from [15.248.3.7] (helo=[10.24.67.23])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r3Ziq-0000Hx-Lu; Thu, 16 Nov 2023 10:35:44 +0000
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
	bh=lDunPYJEu0qlRXFSN9pmtjJoSe6aYhhOxDGP0YUPEFw=; b=oAaD1H+lDPqO4UBiIrYCusMhi+
	4TCe2xHopKcvvVlOLLpJR/shNrFmAwQ4P03dXz9LuIPjpWyKE3guX8OL7NV6MvsY8cI7uyLkJO3IC
	gSUvUIaQbnDi6tkOKsIIhetcfNhg1A+u1at1BRkA/LwtktcLmdI+BHmm8aAs1HwCoF8g=;
Message-ID: <bb7fb994-02e0-43a3-ade4-f3472d832696@xen.org>
Date: Thu, 16 Nov 2023 10:35:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.18] SUPPORT.md: Define support lifetime
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Henry Wang <Henry.Wang@arm.com>
References: <20231115121632.63868-1-julien@xen.org>
 <AA42890F-2B1D-4DCA-939B-4F7BCB073891@arm.com>
 <c010e6c5-f352-46da-bb23-cd668de6a0a8@xen.org>
 <a64fec3e-0d60-4495-aecc-f1fe44627234@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a64fec3e-0d60-4495-aecc-f1fe44627234@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jan,

On 16/11/2023 08:32, Jan Beulich wrote:
> On 15.11.2023 13:35, Julien Grall wrote:
>> Hi Henry,
>>
>> On 15/11/2023 12:27, Henry Wang wrote:
>>>> On Nov 15, 2023, at 20:16, Julien Grall <julien@xen.org> wrote:
>>>>
>>>> From: Julien Grall <jgrall@amazon.com>
>>>>
>>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>> ---
>>>> SUPPORT.md | 8 ++++----
>>>> 1 file changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/SUPPORT.md b/SUPPORT.md
>>>> index fff4b4c5bad6..c452635eb552 100644
>>>> --- a/SUPPORT.md
>>>> +++ b/SUPPORT.md
>>>> @@ -9,10 +9,10 @@ for the definitions of the support status levels etc.
>>>>
>>>> # Release Support
>>>>
>>>> -    Xen-Version: 4.18-rc
>>>> -    Initial-Release: n/a
>>>> -    Supported-Until: TBD
>>>> -    Security-Support-Until: Unreleased - not yet security-supported
>>>> +    Xen-Version: 4.18
>>>> +    Initial-Release: 2023-11-16
>>>> +    Supported-Until: 2025-05-16
>>>> +    Security-Support-Until: 2025-11-16
>>>
>>> I thought we have a 3 years’ support lifetime, so maybe it should be 2026-11-16, but not sure
>>> if it is still the case.
>>
>> Hmmm... You are right for the security support. I didn't do the math
>> properly.
>>
>> So it should be 2026-11-16.
> 
> Assuming this is the patch you said on Matrix you want my ack for, with
> this adjustment
> Acked-by: Jan Beulich <jbeulich@suse.com>

Yes this was the patch. Thanks! I will commit and and tag 4.18.

Cheers,

-- 
Julien Grall

