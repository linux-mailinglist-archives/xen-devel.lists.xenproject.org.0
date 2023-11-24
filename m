Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2667F756A
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 14:41:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640710.999324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6WQw-0004lr-Lj; Fri, 24 Nov 2023 13:41:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640710.999324; Fri, 24 Nov 2023 13:41:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6WQw-0004jf-J5; Fri, 24 Nov 2023 13:41:26 +0000
Received: by outflank-mailman (input) for mailman id 640710;
 Fri, 24 Nov 2023 13:41:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5NGl=HF=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r6WQv-0004jZ-3T
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 13:41:25 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 285d54d0-8acf-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 14:41:23 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 157234EE073C;
 Fri, 24 Nov 2023 14:41:23 +0100 (CET)
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
X-Inumbo-ID: 285d54d0-8acf-11ee-98e2-6d05b1d4d9a1
MIME-Version: 1.0
Date: Fri, 24 Nov 2023 14:41:23 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, jbeulich@suse.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, Simone Ballarin <simone.ballarin@bugseng.com>, Doug
 Goldstein <cardoe@cardoe.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>
Subject: Re: [XEN PATCH v5 0/2] use the documentation for MISRA C:2012 Dir 4.1
In-Reply-To: <cover.1700211131.git.nicola.vetrini@bugseng.com>
References: <cover.1700211131.git.nicola.vetrini@bugseng.com>
Message-ID: <4dce3cf790d2beea9f1ea5a38c1d7b51@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-11-17 09:53, Nicola Vetrini wrote:
> This series addresses some concerns raised on patches 2 and 3 from [1].
> Note that patch 1 from that series has already been applied.
> 
> Patch 1 comprises a modified version of patches 2 and 3 of the previous 
> series.
> Patch 2 is brand new, as it merely clarifies how to write such 
> documentation.
> 
> [1] 
> https://lore.kernel.org/xen-devel/cover.1696231870.git.nicola.vetrini@bugseng.com/
> 
> Nicola Vetrini (2):
>   automation/eclair: make the docs for MISRA C:2012 Dir 4.1 visible to
>     ECLAIR
>   docs/misra: add guidance on the format of  Dir 4.1 docs for ECLAIR
> 
>  automation/eclair_analysis/build.sh   | 31 +++++++++++++++++++++++----
>  automation/eclair_analysis/prepare.sh |  7 +++---
>  docs/misra/C-runtime-failures.rst     |  8 +++++++
>  3 files changed, 39 insertions(+), 7 deletions(-)

I think all outstanding comments on this series have been addressed, so 
I think it could be committed.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

