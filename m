Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 100847D0875
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 08:29:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619662.965120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtizw-0004Q5-Lr; Fri, 20 Oct 2023 06:28:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619662.965120; Fri, 20 Oct 2023 06:28:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtizw-0004NW-Il; Fri, 20 Oct 2023 06:28:40 +0000
Received: by outflank-mailman (input) for mailman id 619662;
 Fri, 20 Oct 2023 06:28:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SYNS=GC=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qtizu-0004NN-RQ
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 06:28:38 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e631addc-6f11-11ee-9b0e-b553b5be7939;
 Fri, 20 Oct 2023 08:28:36 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id F28964EE073A;
 Fri, 20 Oct 2023 08:28:35 +0200 (CEST)
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
X-Inumbo-ID: e631addc-6f11-11ee-9b0e-b553b5be7939
MIME-Version: 1.0
Date: Fri, 20 Oct 2023 08:28:35 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Henry Wang <Henry.Wang@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Xen-devel
 <xen-devel@lists.xenproject.org>, Community Manager
 <community.manager@xenproject.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau?=
 =?UTF-8?Q?_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH 1/3] CHANGELOG.md: Mention the MISRA-C improvement in 4.18
 dev cycle
In-Reply-To: <B8B61F24-CE9D-4924-992D-A8C43EB22956@arm.com>
References: <20231019052050.1032492-1-Henry.Wang@arm.com>
 <20231019052050.1032492-2-Henry.Wang@arm.com>
 <alpine.DEB.2.22.394.2310190911020.1945130@ubuntu-linux-20-04-desktop>
 <B8B61F24-CE9D-4924-992D-A8C43EB22956@arm.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <f8b782372150321e26ed77c1b5fcfa04@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 20/10/2023 03:31, Henry Wang wrote:
> Hi Stefano,
> 
>> On Oct 20, 2023, at 00:13, Stefano Stabellini <sstabellini@kernel.org> 
>> wrote:
>> 
>> On Thu, 19 Oct 2023, Henry Wang wrote:
>>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>>> ---
>>> CHANGELOG.md | 1 +
>>> 1 file changed, 1 insertion(+)
>>> 
>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>> index 165c5caf9b..47e98f036f 100644
>>> --- a/CHANGELOG.md
>>> +++ b/CHANGELOG.md
>>> @@ -33,6 +33,7 @@ The format is based on [Keep a 
>>> Changelog](https://keepachangelog.com/en/1.0.0/)
>>>    nodes using a device tree overlay binary (.dtbo).
>>>  - Introduce two new hypercalls to map the vCPU runstate and time 
>>> areas by
>>>    physical rather than linear/virtual addresses.
>>> + - The project has now officially adopted 72 rules of MISRA-C.
>> 
>> I counted them again, they are 71 today. We have accepted 3 more
>> recently but for the CHANGELOG.md I would stick with what is on
>> docs/misra/rules.rst
> 
> Thanks for the pointer of the doc, I checked the doc and noticed that
> we actually support 65 rules and 6 directives (65+6=71 so you are 
> correct),
> but to avoid the confusion, would you mind me writing in this way:
> "The project has officially adopted 6 directives and 65 rules of 
> MISRA-C”?
> 
> Kind regards,
> Henry

Just dropping this small suggestion: the general term used by MISRA to 
indicate either
a Rule or a Directive is Guideline, so it's also correct to say that 71 
Guidelines have been
adopted.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

