Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A23D8A86FA
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 17:05:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707621.1105698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx6qo-0000RY-Mm; Wed, 17 Apr 2024 15:05:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707621.1105698; Wed, 17 Apr 2024 15:05:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx6qo-0000Pn-Jh; Wed, 17 Apr 2024 15:05:30 +0000
Received: by outflank-mailman (input) for mailman id 707621;
 Wed, 17 Apr 2024 15:05:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TCN8=LW=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rx6qm-0000Ph-VG
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 15:05:28 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec1cadf7-fccb-11ee-94a3-07e782e9044d;
 Wed, 17 Apr 2024 17:05:26 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 261A54EE073C;
 Wed, 17 Apr 2024 17:05:26 +0200 (CEST)
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
X-Inumbo-ID: ec1cadf7-fccb-11ee-94a3-07e782e9044d
MIME-Version: 1.0
Date: Wed, 17 Apr 2024 17:05:26 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, bertrand.marquis@arm.com, Simone Ballarin
 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH] automation/eclair_analysis: substitute deprecated
 service
In-Reply-To: <64c40ce6-3305-4fa0-82cb-5ae3431b0ce6@xen.org>
References: <4850cedd9680e521cfac350930b24af19cdf1ab8.1713338908.git.nicola.vetrini@bugseng.com>
 <64c40ce6-3305-4fa0-82cb-5ae3431b0ce6@xen.org>
Message-ID: <504af9967255fcaec1b870e53dfc2617@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-04-17 16:57, Julien Grall wrote:
> Hi Nicola,
> 
> On 17/04/2024 15:51, Nicola Vetrini wrote:
>> The service STD.emptrecd is in the process of being removed in favour
>> of STD.anonstct.
> 
> I am guessing this is not a new feature and the current ECLAIR version 
> is supporting it?
> 
> Cheers,
> 

Yes, it was just an oversight to leave the old emptrcd there. It will 
eventually be phased out in the next release.

>> 
>> No functional change.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>>   automation/eclair_analysis/ECLAIR/toolchain.ecl | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/automation/eclair_analysis/ECLAIR/toolchain.ecl 
>> b/automation/eclair_analysis/ECLAIR/toolchain.ecl
>> index 71a1e2cce029..86e9a79b5231 100644
>> --- a/automation/eclair_analysis/ECLAIR/toolchain.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/toolchain.ecl
>> @@ -44,8 +44,8 @@
>>   -doc_end
>>     -doc_begin="See Section \"6.19 Structures with No Members\" of 
>> "GCC_MANUAL"."
>> --config=STD.emptrecd,behavior+={c99,GCC_ARM64,specified}
>> --config=STD.emptrecd,behavior+={c99,GCC_X86_64,specified}
>> +-config=STD.anonstct,behavior+={c99,GCC_ARM64,specified}
>> +-config=STD.anonstct,behavior+={c99,GCC_X86_64,specified}
>>   -doc_end
>>     -doc_begin="See Section \"6.18 Arrays of Length Zero\" of 
>> "GCC_MANUAL"."

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

