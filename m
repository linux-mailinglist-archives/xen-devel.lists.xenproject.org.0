Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3465AB70A
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 19:00:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397867.638574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oUA0w-0005Lr-OC; Fri, 02 Sep 2022 16:59:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397867.638574; Fri, 02 Sep 2022 16:59:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oUA0w-0005J8-L6; Fri, 02 Sep 2022 16:59:30 +0000
Received: by outflank-mailman (input) for mailman id 397867;
 Fri, 02 Sep 2022 16:59:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AfvD=ZF=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1oUA0v-0005J1-OL
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 16:59:29 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 993af3dc-2ae0-11ed-82f2-63bd783d45fa;
 Fri, 02 Sep 2022 18:59:26 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 76959621A6;
 Fri,  2 Sep 2022 16:59:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF84C433C1;
 Fri,  2 Sep 2022 16:59:23 +0000 (UTC)
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
X-Inumbo-ID: 993af3dc-2ae0-11ed-82f2-63bd783d45fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662137963;
	bh=DGrp9ol7B2fcIuUbZg7Ryi5vbk3GSCvjRzXLRLhagJc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=VsoJYHVYCxuH9OeEdmFUSU6JUMq3+qm/agKa2mDB297wYG3ajJFAztMFqB4BJlRAL
	 ZQBQym/PhDcFs2+7N4sMgIpisQN/RmxpsiWajH4fp4IX1l0SbYMdfXrGcpzoe8+sG5
	 FW0TJ/FBY9+sdzDB7IC1a+1N+qQsTQjr/XvPyFN8ZHK1HGh96nYy2WXJ2Xe2vKhFst
	 Lbb1m+ssGgPalRPKK20TMZwPyVxWn/pkF7Ke1wnq2GeydIkygxI1SSntDBU1XtsrF6
	 UWEQmWGMkeQTaRFPpaYuPtgHDXKaPBj6MBzpUhPX87odsEaKNVRq8IQZgkmE9KrcIx
	 5V8+wdAFdEtMw==
Date: Fri, 2 Sep 2022 11:59:21 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Bjorn Helgaas <bhelgaas@google.com>, xen-devel@lists.xenproject.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xen-pcifront: Handle missed Connected state
Message-ID: <20220902165921.GA354189@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220829151536.8578-1-jandryuk@gmail.com>

The conventional style for subject (from "git log --oneline") is:

  xen/pcifront: Handle ...

On Mon, Aug 29, 2022 at 11:15:36AM -0400, Jason Andryuk wrote:
> An HVM guest with linux stubdom and 2 PCI devices failed to start as

"stubdom" might be handy shorthand in the Xen world, but I think
it would be nice to consistently spell out "stubdomain" since you use
both forms randomly in this commit log and newbies like me have to
wonder whether they're the same or different.

> libxl timed out waiting for the PCI devices to be added.  It happens
> intermittently but with some regularity.  libxl wrote the two xenstore
> entries for the devices, but then timed out waiting for backend state 4
> (Connected) - the state stayed at 7 (Reconfiguring).  (PCI passthrough
> to an HVM with stubdomain is PV passthrough to the stubdomain and then
> HVM passthrough with the QEMU inside the stubdomain.)
> 
> The stubdom kernel never printed "pcifront pci-0: Installing PCI
> frontend", so it seems to have missed state 4 which would have
> called pcifront_try_connect -> pcifront_connect_and_init_dma

Add "()" after function names for clarity.

> Have pcifront_detach_devices special-case state Initialised and call
> pcifront_connect_and_init_dma.  Don't use pcifront_try_connect because
> that sets the xenbus state which may throw off the backend.  After
> connecting, skip the remainder of detach_devices since none have been
> initialized yet.  When the backend switches to Reconfigured,
> pcifront_attach_devices will pick them up again.

Bjorn

