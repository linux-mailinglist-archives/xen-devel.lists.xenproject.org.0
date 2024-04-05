Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9901F899283
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 02:13:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701043.1095079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsXD4-0001sl-4O; Fri, 05 Apr 2024 00:13:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701043.1095079; Fri, 05 Apr 2024 00:13:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsXD4-0001q2-1Y; Fri, 05 Apr 2024 00:13:34 +0000
Received: by outflank-mailman (input) for mailman id 701043;
 Fri, 05 Apr 2024 00:13:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GKl/=LK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rsXD2-0001pu-PZ
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 00:13:32 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54ce45ea-f2e1-11ee-a1ef-f123f15fe8a2;
 Fri, 05 Apr 2024 02:13:30 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7ED3F60C40;
 Fri,  5 Apr 2024 00:13:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ADD9C433C7;
 Fri,  5 Apr 2024 00:13:27 +0000 (UTC)
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
X-Inumbo-ID: 54ce45ea-f2e1-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712276009;
	bh=Pk7c874I9b3T2WhZZc9vZGzn5Wd5G/q7UVglQhSyr4U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sefhStTKWWhmAW6buARtMrSeQY0g68IXi5F8v96WCFCmpwjFZVTf/F7sHRKbH3zK/
	 TJXzLhHw+7E5PF3kunFcjgYumofkPnReGoJ4ka3m+aBVbz2sqRzRP53nCDTamjI5qd
	 ei2MBmWbAKZP5lm98El8b7qz4zodQaZULyVEJ1+P8vEFRoC9bWWhcHPb47rSZFWRWA
	 e6SKO6g27CrncsO/vGLaSTtIuyap+opyu7emZGV/yUX9WY4TMh6NAJWuKq57qxJoW0
	 aMIkwxY6Ui3K1kjrAN7VOeJUywYKrmjGJxLw0GG+OFqIr8Qgb50y9tpS7qgSVIL4LW
	 mLMnBBkL8KLsQ==
Date: Thu, 4 Apr 2024 17:13:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, bertrand.marquis@arm.com, julien@xen.org, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH v3 5/7] automation/eclair: add deviations for Rule
 20.7
In-Reply-To: <f20c06179dcdaff7c4e1246ed49a685d4d25497b.1711700095.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2404041713190.2245130@ubuntu-linux-20-04-desktop>
References: <cover.1711700095.git.nicola.vetrini@bugseng.com> <f20c06179dcdaff7c4e1246ed49a685d4d25497b.1711700095.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 29 Mar 2024, Nicola Vetrini wrote:
> These deviations deal with the following cases:
> - macro arguments used directly as initializer list arguments;
> - uses of the __config_enabled macro, that can't be brought
>   into compliance without breaking its functionality;
> - exclude files that are out of scope (efi headers and cpu_idle);
> - uses of alternative_{call,vcall}[0-9] macros.
> 
> The existing configuration for R20.7 is reordered so that it matches the
> cases listed in its documentation comment.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

