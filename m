Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E127D4307
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 01:04:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621630.968290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qv3xl-0007f0-RZ; Mon, 23 Oct 2023 23:03:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621630.968290; Mon, 23 Oct 2023 23:03:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qv3xl-0007dL-Om; Mon, 23 Oct 2023 23:03:57 +0000
Received: by outflank-mailman (input) for mailman id 621630;
 Mon, 23 Oct 2023 23:03:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6cm=GF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qv3xk-0007dF-BE
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 23:03:56 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f3bc46a-71f8-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 01:03:54 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 948E1CE29E4;
 Mon, 23 Oct 2023 23:03:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 118FCC433C7;
 Mon, 23 Oct 2023 23:03:48 +0000 (UTC)
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
X-Inumbo-ID: 6f3bc46a-71f8-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698102230;
	bh=roVglbnmYd54zwOj+gCJobTbqSooURhAExCPrbXcaJM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VrBXPpCTum0QNO6wCrZiNW9oXseyH9A573iFYTKbkZA8udj3rJ/Ph+8WZgIrD3pNw
	 5s1bEwOIyrDdtOcyVm4mCOhuECQhZMyQj6XmSlrT+al4+t7tKpElXvaPutOPVyhLwQ
	 ieqDbszYbVDFTXv52tyYN6LaWvR00wh1+eOI8oHXK9iYSGVSdgDvjaPKMZ6dDnO8rf
	 eyfvJzaQvtStbFiCosEHedujKl6u97Z5QRU23fKxtuJBsq/5lsfNyk7uy9UzF+jr56
	 N9kbGX72TTkuzSu9TaiCF90PCSUCAl4dm166yZw9yfAv/sLsCYD6uBf9lNSTuJjsRQ
	 jmbtuTMvUCy/A==
Date: Mon, 23 Oct 2023 16:03:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19 v4 1/8] xen: modify or add declarations
 for variables where needed
In-Reply-To: <1da22c0b7c32f62f200383af8607caaf1a02ba0d.1698053876.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310231603210.3516@ubuntu-linux-20-04-desktop>
References: <cover.1698053876.git.nicola.vetrini@bugseng.com> <1da22c0b7c32f62f200383af8607caaf1a02ba0d.1698053876.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 23 Oct 2023, Nicola Vetrini wrote:
> Some variables with external linkage used in C code do not have
> a visible declaration where they are defined. Other variables
> can become static, thereby eliminating the need for a declaration.
> Doing so also resolves violations of MISRA C:2012 Rule 8.4.
> 
> Fix typo s/mcinfo_dumpped/mcinfo_dumped/ while making
> the variable static.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

