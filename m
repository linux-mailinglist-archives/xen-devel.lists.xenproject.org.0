Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D347187F60E
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 04:33:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695194.1084761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmQE2-0004rj-RM; Tue, 19 Mar 2024 03:33:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695194.1084761; Tue, 19 Mar 2024 03:33:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmQE2-0004pE-Mz; Tue, 19 Mar 2024 03:33:18 +0000
Received: by outflank-mailman (input) for mailman id 695194;
 Tue, 19 Mar 2024 03:33:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N0xd=KZ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rmQE1-0003wv-3P
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 03:33:17 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6aa3a620-e5a1-11ee-a1ee-f123f15fe8a2;
 Tue, 19 Mar 2024 04:33:15 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0A066CE08D4;
 Tue, 19 Mar 2024 03:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDBCAC433F1;
 Tue, 19 Mar 2024 03:33:10 +0000 (UTC)
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
X-Inumbo-ID: 6aa3a620-e5a1-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710819192;
	bh=BhwU4HC5QYEwU9zq/KGOAxnObTvAl0v2AzcqP8ga7oI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=R19cf63oLsm/tD6Fm0gso/oCSQStF7TQj5bqiLP4Sw8M7z4hYLZJ5PAfpTg6dpi1m
	 Qtn5rs3niB0q1EmmC0bJ9Ic7IoOopuQnpye+TCUnah5EPavfZQuvhBZRphguZSKdeR
	 i1MIS1uS3fEjhkEINqjoZHMwoccpZZkrOtilCJW3x8x2hwMofMBMLPANTaLdsvjEW1
	 YQxw85KHH8V9TKG5y+5lMO1SMw2zMY03yOs7tNgLgDBby7e2GjK3Gj7CHRRcGGARfl
	 x7E+PhqEC80Kn7dNZpkIDZ7V9660oaxGgecXUgTsYnQSkZEzaV6aPmOaZwEMFYDTyP
	 +pUfQM7HmeCAA==
Date: Mon, 18 Mar 2024 21:33:09 -0600 (MDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH 04/10] xen/device_tree: address violations of MISRA
 C Rule 20.7
In-Reply-To: <3845d2a318bdaab242a7fd67473b05198db1b111.1710762555.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2403181811260.853156@ubuntu-linux-20-04-desktop>
References: <cover.1710762555.git.nicola.vetrini@bugseng.com> <3845d2a318bdaab242a7fd67473b05198db1b111.1710762555.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Mar 2024, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
 

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

