Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6939785BD4
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 17:18:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589390.921286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYpcP-0007rg-0h; Wed, 23 Aug 2023 15:18:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589390.921286; Wed, 23 Aug 2023 15:18:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYpcO-0007po-U7; Wed, 23 Aug 2023 15:18:00 +0000
Received: by outflank-mailman (input) for mailman id 589390;
 Wed, 23 Aug 2023 15:17:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JPpt=EI=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qYpcN-0007oH-E0
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 15:17:59 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3db21cc6-41c8-11ee-8783-cb3800f73035;
 Wed, 23 Aug 2023 17:17:58 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 886B54EE0737;
 Wed, 23 Aug 2023 17:17:57 +0200 (CEST)
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
X-Inumbo-ID: 3db21cc6-41c8-11ee-8783-cb3800f73035
MIME-Version: 1.0
Date: Wed, 23 Aug 2023 17:17:57 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH] arm64/vfp: address MISRA C:2012 Dir 4.3
In-Reply-To: <a0a4a13a-3ada-4586-81cf-86a9e583fc60@xen.org>
References: <998ecebdda92f1704fa35e8692b1f7e37b674d16.1692800477.git.nicola.vetrini@bugseng.com>
 <a0a4a13a-3ada-4586-81cf-86a9e583fc60@xen.org>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <5d9ae833749502c5d0d773645c79e32d@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 23/08/2023 16:59, Julien Grall wrote:
> Hi,
> 
> On 23/08/2023 15:27, Nicola Vetrini wrote:
>> Directive 4.3 prescribes the following:
>> "Assembly language shall be encapsulated and isolated",
>> on the grounds of improved readability and ease of maintenance.
>> The Directive is violated in this case by asm code in between C code.
>> 
>> A macro is the chosen encapsulation mechanism.
> 
> I would rather prefer if we use a static inline.
> 

Ok

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

