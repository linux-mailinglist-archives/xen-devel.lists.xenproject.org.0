Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B091F7489CC
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 19:04:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559465.874468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH5v7-0002EF-Od; Wed, 05 Jul 2023 17:04:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559465.874468; Wed, 05 Jul 2023 17:04:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH5v7-0002Bm-Ls; Wed, 05 Jul 2023 17:04:01 +0000
Received: by outflank-mailman (input) for mailman id 559465;
 Wed, 05 Jul 2023 17:04:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yom7=CX=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qH5v6-0002Bg-UN
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 17:04:00 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef03f90d-1b55-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 19:03:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 8CCA98285553;
 Wed,  5 Jul 2023 12:03:58 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id gIrsQYezwWCG; Wed,  5 Jul 2023 12:03:57 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id CE5058285563;
 Wed,  5 Jul 2023 12:03:57 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id pbAPpExwlw_u; Wed,  5 Jul 2023 12:03:57 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 6AD4D8285553;
 Wed,  5 Jul 2023 12:03:57 -0500 (CDT)
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
X-Inumbo-ID: ef03f90d-1b55-11ee-b237-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com CE5058285563
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1688576637; bh=JM/NQ1l/xxAwLlFO3BI/MiFvFYF49qkS0yr7kU5GZnA=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=htp6mr6Jhj/XbAAg7CDHGNoXVqUIDLaM5ihnvm5Kj4zFVf5k7FP8OlKjYUieo2pjF
	 F/M0AP1+sgLNfSYaCxbBRV6Lfjcrx1KyziVe5bdwmJmCq8njlbZSnOKfmL/WCH3+uC
	 tAgpQxcaSV3bwz1YeZiPuFGEbKQhCziV52qrTngI=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <a72163cf-a958-2b06-7b94-79adafa85a57@raptorengineering.com>
Date: Wed, 5 Jul 2023 12:03:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] ppc: make also linking work with big-endian tool chain
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f56a208f-97d1-b7ec-afad-3b7bc180cf87@suse.com>
 <4725795c-3f0e-af91-5683-1059ba6163c9@raptorengineering.com>
 <cbf263fe-9221-018d-b187-3d17be76e937@suse.com>
 <1b3a9165-43fd-d8e0-5c2f-49875973c8e1@raptorengineering.com>
 <55c311cc-7ee3-93d8-21c2-ce03e3222096@citrix.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <55c311cc-7ee3-93d8-21c2-ce03e3222096@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/5/23 11:53 AM, Andrew Cooper wrote:
> On 05/07/2023 5:22 pm, Shawn Anastasio wrote:
>> On 7/5/23 11:09 AM, Jan Beulich wrote:
>>> On 05.07.2023 17:10, Shawn Anastasio wrote:
>>>> Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>>> Thanks.
>> Just to clarify, as the maintainer of PPC64, would it be my
>> responsibility to commit this now directly to xen/staging? Or should I
>> commit it to my own tree and have someone pull it?
>>
>> I'm not super familiar with the project's maintainer workflow yet so any
>> hints would be appreciated.
> 
> Ah, so this is somewhere where we're quite different to Linux.
> 
> There is one single tree, and there are a small group of people with
> commit access.  We're "THE REST" in the maintainers file.  Jan can
> commit, as can I, and several others.
> 
> The role of committers is (technically at least) to take any patch from
> the mailing list which is suitably acked, and commit it.
> 
> So, in principle you have nothing further to do here.  As this is one of
> Jan's patches, I'm sure he'll include in in the next set of patches he
> commits.
> 
> It can happen that patches fall between the cracks, so it is generally
> helpful for maintainers to double check and ping on IRC/email/etc if
> there are patches that appear to be outstanding.
> 
> ~Andrew

Thanks for the explanation, that makes sense.

Shawn

