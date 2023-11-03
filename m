Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 103A07E07EE
	for <lists+xen-devel@lfdr.de>; Fri,  3 Nov 2023 19:09:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627309.978270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyybK-0002WT-5F; Fri, 03 Nov 2023 18:08:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627309.978270; Fri, 03 Nov 2023 18:08:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyybK-0002Uo-2A; Fri, 03 Nov 2023 18:08:58 +0000
Received: by outflank-mailman (input) for mailman id 627309;
 Fri, 03 Nov 2023 18:08:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ozhd=GQ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qyybI-0002Ui-HB
 for xen-devel@lists.xenproject.org; Fri, 03 Nov 2023 18:08:56 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d7a9c87-7a74-11ee-98d8-6d05b1d4d9a1;
 Fri, 03 Nov 2023 19:08:55 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 3A2EE4EE0744;
 Fri,  3 Nov 2023 19:08:55 +0100 (CET)
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
X-Inumbo-ID: 0d7a9c87-7a74-11ee-98d8-6d05b1d4d9a1
MIME-Version: 1.0
Date: Fri, 03 Nov 2023 19:08:55 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, jbeulich@suse.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19] domain: add ASSERT to help static analysis
 tools
In-Reply-To: <3f163bb58993410183229e72eb1f227057f9b1c7.1699034273.git.nicola.vetrini@bugseng.com>
References: <3f163bb58993410183229e72eb1f227057f9b1c7.1699034273.git.nicola.vetrini@bugseng.com>
Message-ID: <3e58166f7dcfb3fd3bd15614096b27ce@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-11-03 18:58, Nicola Vetrini wrote:
> Static analysis tools may detect a possible null
> pointer dereference at line 760 (the memcpy call)
> of xen/common/domain.c. This ASSERT helps them in
> detecting that such a condition is not possible
> and also provides a basic sanity check.
> 
Suggested-by: Julien Grall <julien@xen.org>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

This should have been present as well, I forgot to add it.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

