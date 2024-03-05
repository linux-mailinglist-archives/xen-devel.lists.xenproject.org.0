Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8861087127E
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 02:52:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688561.1072849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhJyh-0001FA-E3; Tue, 05 Mar 2024 01:52:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688561.1072849; Tue, 05 Mar 2024 01:52:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhJyh-0001Dd-BW; Tue, 05 Mar 2024 01:52:23 +0000
Received: by outflank-mailman (input) for mailman id 688561;
 Tue, 05 Mar 2024 01:52:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=49dx=KL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rhJyg-0001DX-Au
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 01:52:22 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffbf1b41-da92-11ee-a1ee-f123f15fe8a2;
 Tue, 05 Mar 2024 02:52:20 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B53ABCE176C;
 Tue,  5 Mar 2024 01:52:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34FBAC433C7;
 Tue,  5 Mar 2024 01:52:15 +0000 (UTC)
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
X-Inumbo-ID: ffbf1b41-da92-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709603536;
	bh=yXTpxcHXVjCfHzE6Bw1Bh5Jx7YQUuR2HQaPwIuPASS8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qpK4/s3R7aypOCRD6pa1X7W7pFUQPFhXBrHttoPX0swnwuXCDuXZ5BVhi+x6Cq17B
	 uMVjqE6iIp5j6Vu2EIaqApBQXb2WAkEL308KXgCLAnQv6jgQRMa2qI/VkSz5AbF5Z5
	 rlRNUat7xX3LRcYbV5bSC9suaSIJsNAgzXfU+0FW3cOQJJMlMPF6m2KykK2/4j8DdQ
	 b3mqtT19oIRlRrvnPrltR2iLMhXiXxNOeBfzQwVsXRyMvzBxi/E2GSxnlQ/aXgFa2G
	 cl4vB3cowYWwkhBnxhXxT4YxgaL7MeOiVKAIEbbdOJGZ5avFlkcfCHpZ2L2b1dIm9r
	 s27sbmBmPkIrQ==
Date: Mon, 4 Mar 2024 17:52:13 -0800 (PST)
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
Subject: Re: [XEN PATCH] automation/eclair: add deviation for MISRA C:2012
 Rule 16.6
In-Reply-To: <c50660973e090b854447b439424a0c2e18559513.1709547523.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2403041752070.853156@ubuntu-linux-20-04-desktop>
References: <c50660973e090b854447b439424a0c2e18559513.1709547523.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 4 Mar 2024, Federico Serafini wrote:
> Update ECLAIR configuration to take into account the deviations
> agreed during MISRA meetings.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


