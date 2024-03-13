Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A844787B46D
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 23:37:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692808.1080290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkXD5-0002ym-JG; Wed, 13 Mar 2024 22:36:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692808.1080290; Wed, 13 Mar 2024 22:36:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkXD5-0002w1-Gc; Wed, 13 Mar 2024 22:36:31 +0000
Received: by outflank-mailman (input) for mailman id 692808;
 Wed, 13 Mar 2024 22:36:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EqwV=KT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rkXD4-0002vv-BX
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 22:36:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 212895e4-e18a-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 23:36:28 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EF1BD61476;
 Wed, 13 Mar 2024 22:36:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E525C433F1;
 Wed, 13 Mar 2024 22:36:25 +0000 (UTC)
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
X-Inumbo-ID: 212895e4-e18a-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710369386;
	bh=2bhy0KpQCUdsqpzVvwAMwVTCEyAPBiPR1v62GkCGL8k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aV8USHzX0FnrlECDHXY5BaAgBEdmLy7sFTSSoWUz9vZMJ8YPpp48I6BAnoPYmRDAc
	 03s+3+6WJoZOxlgx4QB3/G2OITmP01ViSopr0zkJcQH0BGbaVlWx0kOp6YIX4aCm05
	 I8xitejxNptdEdVF2Rv9X/M9pqb6JuQKkIzp5G2ohKvC9pmSvnJ6SW8UjjfT4Cl9DZ
	 irs4OpnzuJtEQTPVTSlOixWJpfn2MhxUdviul8syCSkBjBu899tsU3s9wf4VSdYV0b
	 7hxjoFxYAMK75RMCchggFG6KvaAcXJHj1BTrLJBy/vlW8DCyN1D9N4j4sW8Srl73aT
	 /NmYW+ybKWRAQ==
Date: Wed, 13 Mar 2024 15:36:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Paul Durrant <paul@xen.org>
cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH] MAINTAINERS: Remove myself from several subsystems
In-Reply-To: <20240313184125.39185-1-paul@xen.org>
Message-ID: <alpine.DEB.2.22.394.2403131535550.853156@ubuntu-linux-20-04-desktop>
References: <20240313184125.39185-1-paul@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 13 Mar 2024, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> I am not as actively involved with the Xen project as I once was so I need
> to relinquish some of my maintainer responsibilities: IOMMU and I/O
> emulation.
> 
> NOTE: Since I am sole maintainer for I/O EMULATION (IOREQ) and
>       X86 I/O EMULATION, these sections are removed.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

