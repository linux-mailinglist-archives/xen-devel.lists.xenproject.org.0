Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D777E347A
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 05:19:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628557.980168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0DYR-0007an-Up; Tue, 07 Nov 2023 04:19:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628557.980168; Tue, 07 Nov 2023 04:19:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0DYR-0007XV-Rh; Tue, 07 Nov 2023 04:19:07 +0000
Received: by outflank-mailman (input) for mailman id 628557;
 Tue, 07 Nov 2023 04:19:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FGpL=GU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r0DYQ-0006dK-57
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 04:19:06 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8e00f0b-7d24-11ee-9b0e-b553b5be7939;
 Tue, 07 Nov 2023 05:19:04 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 630D661157;
 Tue,  7 Nov 2023 04:19:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A184C433C8;
 Tue,  7 Nov 2023 04:19:01 +0000 (UTC)
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
X-Inumbo-ID: c8e00f0b-7d24-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699330743;
	bh=vEuthZicR3zSH1913e+4VzvcAWfkDMQWB8v9FopXls4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qwe0Q6y4J1HbSdoCvmmFD+hnHKklMB/Bc1JLNSpHYCI52/nepml8i9YuvmrGgvX1b
	 wYErWAEEbh9C9VFdPgZnA9f4vvP9w2nfA6SgG7wHoKaw/kWG5cuj4ugPC4miRLYiVg
	 uhVg4WW74d3gZiG9Gu51pNYbmgqh/htDH18gFRtH21+N9kNjFgbVAMpolZhRQx8KvZ
	 /VvZcnaz7c7PJuKYRSyoNfb3FOCHBjHdnYGVJgWc0QMWk8GkXWN++WVqv/WZ9ZtfM/
	 iXzeaeLymjn6rQTyD+inuw32S8YU4G3nWeO9Pn+FT3ONsJkMthMNkr0FuA34z7nR1/
	 8M2GVf8twEbhA==
Date: Mon, 6 Nov 2023 20:18:59 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19 v6] xen: Add deviations for MISRA C:2012
 Rule 7.1
In-Reply-To: <3646e75ebfc8b78d44578e3303bfa1660e0b684b.1699022991.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2311061649260.3478774@ubuntu-linux-20-04-desktop>
References: <3646e75ebfc8b78d44578e3303bfa1660e0b684b.1699022991.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 3 Nov 2023, Nicola Vetrini wrote:
> As specified in rules.rst, these constants can be used
> in the code.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
 
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

