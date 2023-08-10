Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FF77774E1
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 11:48:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582027.911540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU2HL-000307-PI; Thu, 10 Aug 2023 09:48:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582027.911540; Thu, 10 Aug 2023 09:48:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU2HL-0002xy-Mj; Thu, 10 Aug 2023 09:48:27 +0000
Received: by outflank-mailman (input) for mailman id 582027;
 Thu, 10 Aug 2023 09:48:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MZIv=D3=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qU2HK-0002xc-If
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 09:48:26 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c24e722-3763-11ee-8613-37d641c3527e;
 Thu, 10 Aug 2023 11:48:24 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 9D5554EE073F;
 Thu, 10 Aug 2023 11:48:23 +0200 (CEST)
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
X-Inumbo-ID: 0c24e722-3763-11ee-8613-37d641c3527e
MIME-Version: 1.0
Date: Thu, 10 Aug 2023 11:48:23 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Julien Grall <julien.grall@linaro.org>
Subject: Re: [XEN PATCH] xen/arm: traps: remove unused function
 'dump_guest_s1_walk'
In-Reply-To: <23c5b1a1ffc755b5db17d699a08fc86e1f0cc788.1691659744.git.nicola.vetrini@bugseng.com>
References: <23c5b1a1ffc755b5db17d699a08fc86e1f0cc788.1691659744.git.nicola.vetrini@bugseng.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <ef847651a7de76b948377fe347405d29@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 10/08/2023 11:29, Nicola Vetrini wrote:
> The function in question has no callers and its removal has already
> been proposed (and acked) as part of this larger series [1].
> There have been further bugfixes to that function [2], but they do not 
> add
> any caller, hence it can be removed.
> 
> [1] 
> https://lore.kernel.org/xen-devel/1395766541-23979-27-git-send-email-julien.grall@linaro.org/
> [2] 
> https://lore.kernel.org/xen-devel/20160720161017.4508-1-jtd@galois.com/
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Suggested-by: Julien Grall <julien.grall@linaro.org>
> ---

Wrong mail address for Julien, sorry

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

