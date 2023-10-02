Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB25C7B5D37
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 00:40:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611810.951402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnRaF-0006oX-2r; Mon, 02 Oct 2023 22:40:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611810.951402; Mon, 02 Oct 2023 22:40:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnRaF-0006mB-0F; Mon, 02 Oct 2023 22:40:11 +0000
Received: by outflank-mailman (input) for mailman id 611810;
 Mon, 02 Oct 2023 22:40:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oggk=FQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qnRaD-0006m5-FK
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 22:40:09 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3abc212-6174-11ee-98d2-6d05b1d4d9a1;
 Tue, 03 Oct 2023 00:40:08 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 43F5CB81689;
 Mon,  2 Oct 2023 22:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A313AC433C7;
 Mon,  2 Oct 2023 22:40:05 +0000 (UTC)
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
X-Inumbo-ID: a3abc212-6174-11ee-98d2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696286407;
	bh=f3ezCHpAzXvLE6wd5J1aVpNq54qxq8SkZr4MhFf+SWA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=M10J7mwptqHxppCTxdrrmxSlY/ALYveUC67bL6NU7yvSLKWqI+jkhNLy81di+rNJ2
	 0l5PeYyvvPynRqlPKWsIDJNjXw5HfQjTZSL163x1o/6r3J8jIISbfIUMcFQNIppfyY
	 TineJ6nR4V9FK4zWeI0a34CDwSxZxSXdd5beWJQFxCT/yGqCi2qQEYm+6WPt2wFC7L
	 gYOwfh8yXrSVBrz0JRwZl4A8/nuDn67Dg5aM+Wo+L0I+PE+bAXfKiwBsIf317sZv9q
	 /AhDi/iyXsLlpzMggADVSmeGvER3GKMZcpWbkLqqIcdyhwlIEWG8RmN40bcFSWXY2p
	 33Ti2JTmfwPZQ==
Date: Mon, 2 Oct 2023 15:40:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, Henry.Wang@arm.com, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 3/7] x86: add deviation comments for  asm-only
 functions
In-Reply-To: <cf9012d5e4fbe514e9cce3f0074b1a87df505bc0.1696232393.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310021539570.2348112@ubuntu-linux-20-04-desktop>
References: <cover.1696232393.git.nicola.vetrini@bugseng.com> <cf9012d5e4fbe514e9cce3f0074b1a87df505bc0.1696232393.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 2 Oct 2023, Nicola Vetrini wrote:
> As stated in rules.rst, functions used only in asm code
> are allowed to have no prior declaration visible when being
> defined, hence these functions are deviated.
> This also fixes violations of MISRA C:2012 Rule 8.4.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


