Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FAD901CB2
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 10:16:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737026.1143130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGaAq-0002Dz-Dg; Mon, 10 Jun 2024 08:14:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737026.1143130; Mon, 10 Jun 2024 08:14:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGaAq-0002Au-8A; Mon, 10 Jun 2024 08:14:40 +0000
Received: by outflank-mailman (input) for mailman id 737026;
 Mon, 10 Jun 2024 08:14:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yElo=NM=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sGaAo-0002Ao-P8
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 08:14:38 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79a5e171-2701-11ef-b4bb-af5377834399;
 Mon, 10 Jun 2024 10:14:36 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id B75DD4EE0737;
 Mon, 10 Jun 2024 10:14:35 +0200 (CEST)
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
X-Inumbo-ID: 79a5e171-2701-11ef-b4bb-af5377834399
MIME-Version: 1.0
Date: Mon, 10 Jun 2024 10:14:35 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Simone Ballarin
 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH for-4.19 v2 3/3] automation/eclair_analysis: add more
 clean MISRA guidelines
In-Reply-To: <0cae0e19-8512-40e0-9ef2-6e91069779ec@suse.com>
References: <cover.1717790683.git.nicola.vetrini@bugseng.com>
 <42645b41cf9d2d8b5ef72f0b171989711edb00a1.1717790683.git.nicola.vetrini@bugseng.com>
 <0cae0e19-8512-40e0-9ef2-6e91069779ec@suse.com>
Message-ID: <e199bad317efee793a995523d6d10eac@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-06-10 09:43, Jan Beulich wrote:
> On 07.06.2024 22:13, Nicola Vetrini wrote:
>> Rules 20.9, 20.12 and 14.4 are now clean on ARM and x86, so they are 
>> added
>> to the list of clean guidelines.
> 
> Why is 20.9 being mentioned here when ...
> 
>> --- a/automation/eclair_analysis/ECLAIR/tagging.ecl
>> +++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
>> @@ -60,6 +60,7 @@ MC3R1.R11.7||
>>  MC3R1.R11.9||
>>  MC3R1.R12.5||
>>  MC3R1.R14.1||
>> +MC3R1.R14.4||
>>  MC3R1.R16.7||
>>  MC3R1.R17.1||
>>  MC3R1.R17.3||
>> @@ -73,6 +74,7 @@ MC3R1.R20.4||
>>  MC3R1.R20.6||
>>  MC3R1.R20.9||
>>  MC3R1.R20.11||
>> +MC3R1.R20.12||
>>  MC3R1.R20.13||
>>  MC3R1.R20.14||
>>  MC3R1.R21.3||
> 
> ... nothing changes in its regard?
> 

Right, it should be removed from the message.

> Jan

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

