Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5858BDF18
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 11:57:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717963.1120467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4HZm-000163-OP; Tue, 07 May 2024 09:57:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717963.1120467; Tue, 07 May 2024 09:57:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4HZm-00012r-LM; Tue, 07 May 2024 09:57:34 +0000
Received: by outflank-mailman (input) for mailman id 717963;
 Tue, 07 May 2024 09:57:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s4HZk-00012j-OP
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 09:57:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s4HZj-00031K-R8; Tue, 07 May 2024 09:57:31 +0000
Received: from [15.248.2.31] (helo=[10.24.67.35])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s4HZj-00069J-G4; Tue, 07 May 2024 09:57:31 +0000
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
	bh=FxG6s7sf/5Zp7OQTdwIn5Zm+iEX8TkB+QnNL89TCXpY=; b=GSKhzQNE5tyy92R1izzT+WtUUG
	H4JHEM5lZBj2YfdKFgREN7Q0MpoLSLhWUEPAmnGGaloHkqvPvwdrbM7mosU5qwNrJvnfkYB9T94zq
	AAswUSIS2rKZU1mKufsF2SnXLweyp/76YS7G0AvuRXFxS7B1Bkdt4GTfsg0j3E54+U2E=;
Message-ID: <398afdf1-8a11-4584-bb07-cf6fc2373d21@xen.org>
Date: Tue, 7 May 2024 10:57:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] xen/arm64: bpi: Add missing code symbol
 annotations
Content-Language: en-GB
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, jbeulich@suse.com,
 andrew.cooper3@citrix.com, edgar.iglesias@amd.com
References: <20240501035448.964625-1-edgar.iglesias@gmail.com>
 <20240501035448.964625-7-edgar.iglesias@gmail.com>
 <alpine.DEB.2.22.394.2405031656490.1151289@ubuntu-linux-20-04-desktop>
 <CAJy5ezpgXVp838aA_E8vJDARoO5iQOh07D+Gpn0kMCLj_iXyLw@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAJy5ezpgXVp838aA_E8vJDARoO5iQOh07D+Gpn0kMCLj_iXyLw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 06/05/2024 13:54, Edgar E. Iglesias wrote:
> On Sat, May 4, 2024 at 2:14 AM Stefano Stabellini
> <sstabellini@kernel.org> wrote:
>>
>> On Wed, 1 May 2024, Edgar E. Iglesias wrote:
>>> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
>>>
>>> Use the generic xen/linkage.h macros to annotate code symbols
>>> and add missing annotations.
>>>
>>> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
>>> ---
>>>   xen/arch/arm/arm64/bpi.S | 20 ++++++++++++--------
>>>   1 file changed, 12 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/arm64/bpi.S b/xen/arch/arm/arm64/bpi.S
>>> index 4e63825220..b16e4d1e29 100644
>>> --- a/xen/arch/arm/arm64/bpi.S
>>> +++ b/xen/arch/arm/arm64/bpi.S
>>> @@ -52,14 +52,15 @@
>>>    * micro-architectures in a system.
>>>    */
>>>       .align   11
>>> -ENTRY(__bp_harden_hyp_vecs_start)
>>> +FUNC(__bp_harden_hyp_vecs_start)
>>>       .rept 4
>>>       vectors hyp_traps_vector
>>>       .endr
>>> -ENTRY(__bp_harden_hyp_vecs_end)
>>> +GLOBAL(__bp_harden_hyp_vecs_end)
>>> +END(__bp_harden_hyp_vecs_start)
>>
>> Shouldn't GLOBAL be changed to FUNC as well?
>>
> 
> I was a bit unsure but went for GLOBAL since the _end labels point to
> addresses after and outside of the code sequence.
> But I don't have a strong opinion and am happy to change them to FUNC
> if you feel that's better.

I don't think it should be FUNC as this is not meant to be called 
directly. I am also under the impression, we were planning to get rid of 
GLOBAL() as well.

Furthermore, __bp_harden_hyp_vec_start is not a function per say. It is 
a pointer to the vector table.

 From the brief look, the same remarks would apply to the rest of bpi.S. 
So I think we want to switch all the ENTRY() to LABEL().

Cheers,

-- 
Julien Grall

