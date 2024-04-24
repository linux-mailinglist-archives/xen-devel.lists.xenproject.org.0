Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D068B0DE4
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 17:18:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711513.1111512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzeNG-0007Ht-1t; Wed, 24 Apr 2024 15:17:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711513.1111512; Wed, 24 Apr 2024 15:17:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzeNF-0007G4-UV; Wed, 24 Apr 2024 15:17:29 +0000
Received: by outflank-mailman (input) for mailman id 711513;
 Wed, 24 Apr 2024 15:17:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RcL4=L5=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1rzeNE-0007Fy-7N
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 15:17:28 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1a69e2e-024d-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 17:17:26 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 427574EE0739;
 Wed, 24 Apr 2024 17:17:25 +0200 (CEST)
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
X-Inumbo-ID: c1a69e2e-024d-11ef-b4bb-af5377834399
MIME-Version: 1.0
Date: Wed, 24 Apr 2024 17:17:25 +0200
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH 2/2] x86/msr: add suffix 'U' to MSR_AMD_CSTATE_CFG
 macro.
Reply-To: alessandro.zucchelli@bugseng.com
Mail-Reply-To: alessandro.zucchelli@bugseng.com
In-Reply-To: <12b6774f-b2da-4407-ba70-501e03a91129@vates.tech>
References: <cover.1713956723.git.alessandro.zucchelli@bugseng.com>
 <ec689584e80421d7ffa5b1c0f576ed60b84aeda3.1713956723.git.alessandro.zucchelli@bugseng.com>
 <12b6774f-b2da-4407-ba70-501e03a91129@vates.tech>
Message-ID: <ebf434ae29242240c1d57f9a41044212@bugseng.com>
X-Sender: alessandro.zucchelli@bugseng.com
Organization: BUGSENG Srl
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2024-04-24 14:53, Teddy Astie wrote:
> Le 24/04/2024 à 14:11, Alessandro Zucchelli a écrit :
>> This addresses violations of MISRA C:2012 Rule 7.2 which states as
>> following: A “u” or “U” suffix shall be applied to all integer 
>> constants
>> that are represented in an unsigned type.
>> 
>> No functional change.
>> 
>> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
>> ---
>>   xen/arch/x86/include/asm/msr-index.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/xen/arch/x86/include/asm/msr-index.h 
>> b/xen/arch/x86/include/asm/msr-index.h
>> index 92dd9fa496..9cdb5b2625 100644
>> --- a/xen/arch/x86/include/asm/msr-index.h
>> +++ b/xen/arch/x86/include/asm/msr-index.h
>> @@ -236,7 +236,7 @@
>> 
>>   #define MSR_VIRT_SPEC_CTRL                  _AC(0xc001011f, U) /* 
>> Layout matches MSR_SPEC_CTRL */
>> 
>> -#define MSR_AMD_CSTATE_CFG                  0xc0010296
>> +#define MSR_AMD_CSTATE_CFG                  0xc0010296U
>> 
>>   /*
>>    * Legacy MSR constants in need of cleanup.  No new MSRs below this 
>> comment.
> 
> Hello, thanks for the patches
> 
> I wonder if the same approach should be also taken for all the other 
> MSR
> constants of this file that are similar ?
> 
Hello,

from a (strict) point of view of Rule 7.2, the suffix is needed if the
numeric constant cannot be represented using an int and it is therefore
represented using an unsigned integer.
Every violation in the MSR file has already been addressed.
-- 
Alessandro Zucchelli, B.Sc.

Software Engineer, BUGSENG (https://bugseng.com)

