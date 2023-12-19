Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3644817F43
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 02:27:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656430.1024566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFOt2-0001eK-LH; Tue, 19 Dec 2023 01:27:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656430.1024566; Tue, 19 Dec 2023 01:27:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFOt2-0001cc-IR; Tue, 19 Dec 2023 01:27:08 +0000
Received: by outflank-mailman (input) for mailman id 656430;
 Tue, 19 Dec 2023 01:27:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ry3N=H6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rFOt0-0001cW-BH
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 01:27:06 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7565379-9e0d-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 02:27:05 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EE019611EC;
 Tue, 19 Dec 2023 01:27:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BA6DC433C7;
 Tue, 19 Dec 2023 01:27:02 +0000 (UTC)
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
X-Inumbo-ID: b7565379-9e0d-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702949223;
	bh=7KhVpe6G3aakIxLXIlQLeNh7sADxuXkb+h+rRI1ufe8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CGPxC0iu4MVj7yojxRtDE/aEhFNH5gfToWs/3xKACK25UVEy13I62JElt95FNarUC
	 1XLul+GL6wRaNYxQbiXMnwQiSGq1p983ARXyvLt8bvz98ShK+Z9wvNNcyNYl3pEMi1
	 R6ts7lXafueaiEHoZqdZTqXJtfZLbb/YkXwjSDtd+f9bJWedgy4Vc05FAi+wUigVol
	 1Dvqd687eDsfffdRMyxtsl+PmAcUjHZqYWQondnR3Thmo2Xqu/R3+abNnaBPyrkuEz
	 vQbAx2LNYQNq9di5Vgmfs0ENmC4v6M5XKT1O9ei73gE5jGXXqNwV3F6U4RSgIo4hRy
	 BBMpcLjoLDpoA==
Date: Mon, 18 Dec 2023 17:27:00 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v3] automation/eclair: add deviations for MISRA C:2012
 Rule 16.3
In-Reply-To: <23f4bf337883f1d6b67f7bd8466a9c299713e9d4.1702889534.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312181726531.3175268@ubuntu-linux-20-04-desktop>
References: <23f4bf337883f1d6b67f7bd8466a9c299713e9d4.1702889534.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Dec 2023, Federico Serafini wrote:
> MISRA C:2012 Rule 16.3 states that an unconditional break statement
> shall terminate every switch-clause.
> 
> Update ECLAIR configuration to take into account:
>   - continue, goto, return statements;
>   - functions with attribute noreturn;
>   - pseudo-keyword fallthrough;
>   - macro BUG();
>   - comments.
> 
> Update docs/misra/deviations.rst accordingly.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

