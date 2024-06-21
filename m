Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA85891173E
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 02:22:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744940.1152061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKS33-0005Sn-Dz; Fri, 21 Jun 2024 00:22:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744940.1152061; Fri, 21 Jun 2024 00:22:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKS33-0005QK-Ax; Fri, 21 Jun 2024 00:22:37 +0000
Received: by outflank-mailman (input) for mailman id 744940;
 Fri, 21 Jun 2024 00:22:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B+dc=NX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sKS31-0005Q8-9f
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 00:22:35 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5929fb50-2f64-11ef-b4bb-af5377834399;
 Fri, 21 Jun 2024 02:22:32 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2D6D9620A2;
 Fri, 21 Jun 2024 00:22:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC81C2BD10;
 Fri, 21 Jun 2024 00:22:29 +0000 (UTC)
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
X-Inumbo-ID: 5929fb50-2f64-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718929350;
	bh=Et+fvGblFJjieSt8EwlBNkOFHYccy8U5mpnF5U2edsg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=meFuUnmW7aniIkmV0xuZINLXRmKUGGBx18b+NedGmwf1nBA+LMKZJwLK4nduwy6hP
	 O7GHgiLVN9AmTB/F2EIwgUUBALjYOYvO+kFC0gGo7vikugp0o4wvJktr09mBoQ+5bJ
	 SBDPTns54/5E7bSyI9B2HG74t4hkFrwlbrk505IOLDfuiMdNHOhtXtCh/MxvSlzZcp
	 G7XTQzw3Z/hdKTE8a/skr3jVTV4b3qwNhIAvjzHNi5DT2l4m8sF4J+kFDYYhCE9elf
	 37W2+AvYw/fyPY6JHqs/HWQ0hEwZnvpcfabZ5W879u/eW+kVFQ5IyukpWHiyivPFkj
	 qOwRFueQqVBcA==
Date: Thu, 20 Jun 2024 17:22:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH] automation/eclair: add deviations of MISRA C Rule
 5.5
In-Reply-To: <dbd34e37b5d757ff7ae2a7318ad12b159970604c.1718887298.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406201722100.2572888@ubuntu-linux-20-04-desktop>
References: <dbd34e37b5d757ff7ae2a7318ad12b159970604c.1718887298.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 20 Jun 2024, Federico Serafini wrote:
> MISRA C Rule 5.5 states that "Identifiers shall be distinct from macro
> names".
> 
> Update ECLAIR configuration to deviate:
> - macros expanding to their own name;
> - clashes between macros and non-callable entities;
> - clashes related to the selection of specific implementations of string
>   handling functions.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


