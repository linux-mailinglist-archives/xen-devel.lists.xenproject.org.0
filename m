Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 657B97FF407
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 16:56:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645023.1006767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8jOZ-0001eK-U7; Thu, 30 Nov 2023 15:56:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645023.1006767; Thu, 30 Nov 2023 15:56:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8jOZ-0001bv-RJ; Thu, 30 Nov 2023 15:56:07 +0000
Received: by outflank-mailman (input) for mailman id 645023;
 Thu, 30 Nov 2023 15:56:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hcd2=HL=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r8jOY-0001aY-L6
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 15:56:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7a083c0-8f98-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 16:56:04 +0100 (CET)
Received: from [192.168.1.15] (host-82-59-158-146.retail.telecomitalia.it
 [82.59.158.146])
 by support.bugseng.com (Postfix) with ESMTPSA id 4A1E34EE0739;
 Thu, 30 Nov 2023 16:56:04 +0100 (CET)
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
X-Inumbo-ID: f7a083c0-8f98-11ee-9b0f-b553b5be7939
Message-ID: <6e770043-c358-4000-badb-5a4e08e8c8b2@bugseng.com>
Date: Thu, 30 Nov 2023 16:56:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 0/2] x86/p2m: address a violation of MISRA C:2012 Rule
 8.3
Content-Language: en-US, it
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
 "jbeulich@suse.com Andrew Cooper" <andrew.cooper3@citrix.com>,
 george.dunlap@citrix.com, roger.pau@citrix.com, wl@xen.org
References: <cover.1701344917.git.federico.serafini@bugseng.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <cover.1701344917.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/11/23 16:48, Federico Serafini wrote:
> Patch 1/2 does some preparation work, hence it needs to be committed as first.
> Patch 2/2 addresses the violation.
> 
> Federico Serafini (2):
>    x86/p2m: preparation work for xenmem_add_to_physmap_one()
>    x86/p2m: address a violation of MISRA C:2012 Rule 8.3
> 
>   xen/arch/x86/mm/p2m.c | 36 ++++++++++++++++++------------------
>   1 file changed, 18 insertions(+), 18 deletions(-)

Adding maintainers in CC.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

