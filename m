Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C757DEFAD
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 11:18:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626817.977419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyUlk-0004jz-Kj; Thu, 02 Nov 2023 10:17:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626817.977419; Thu, 02 Nov 2023 10:17:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyUlk-0004iG-IC; Thu, 02 Nov 2023 10:17:44 +0000
Received: by outflank-mailman (input) for mailman id 626817;
 Thu, 02 Nov 2023 10:17:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UOkq=GP=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qyUlj-0004i8-9U
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 10:17:43 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e881a72-7969-11ee-98d6-6d05b1d4d9a1;
 Thu, 02 Nov 2023 11:17:42 +0100 (CET)
Received: from [192.168.1.15] (host-87-7-132-154.retail.telecomitalia.it
 [87.7.132.154])
 by support.bugseng.com (Postfix) with ESMTPSA id 6DA804EE0737;
 Thu,  2 Nov 2023 11:17:41 +0100 (CET)
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
X-Inumbo-ID: 0e881a72-7969-11ee-98d6-6d05b1d4d9a1
Message-ID: <8dea91cd-54a6-4846-b845-f3ed334fd470@bugseng.com>
Date: Thu, 2 Nov 2023 11:17:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] x86/iommu_init: address a violation of MISRA
 C:2012 Rule 8.3
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
References: <ba5d1368fce181a6a3a6abc150651e1e5323e489.1698238686.git.federico.serafini@bugseng.com>
 <e21cb579-842c-a3c3-db82-067dc023ef06@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <e21cb579-842c-a3c3-db82-067dc023ef06@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/10/23 16:01, Jan Beulich wrote:
> On 25.10.2023 15:01, Federico Serafini wrote:
>> Make function definition and declaration consistent and emphasize that
>> the formal parameter is deliberately not used.
> 
> Coming back to my earlier objection: Did you consider alternatives? Best
> would of course be to get rid of the forward declaration. That seems
> possible, albeit not quite as straightforward as it ended up being in
> other cases. Second best would be to rename the parameter in the forward
> declaration. Question of course in how far "emphasize that the formal
> parameter is deliberately not used" is important here. (If it was, I
> wonder why VT-d's do_iommu_page_fault() is left alone.)
> 
> Jan

I can propose a new version of the patch with the second option.
If one day you will decide to accept also Rule 2.7 ("A function
should not contain unused parameters"), then a deviation based on
the parameter name "unused" would be viable.

If, however, there is interest in applying the first option,
I think the best thing is for you to take care of it.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

