Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D73E059A845
	for <lists+xen-devel@lfdr.de>; Sat, 20 Aug 2022 00:28:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390533.628045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPAT4-0003u6-0o; Fri, 19 Aug 2022 22:27:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390533.628045; Fri, 19 Aug 2022 22:27:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oPAT3-0003qx-U5; Fri, 19 Aug 2022 22:27:53 +0000
Received: by outflank-mailman (input) for mailman id 390533;
 Fri, 19 Aug 2022 22:27:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c1Kg=YX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oPAT2-0003qr-Td
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 22:27:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 293c86c1-200e-11ed-9250-1f966e50362f;
 Sat, 20 Aug 2022 00:27:51 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CB6D8617DA;
 Fri, 19 Aug 2022 22:27:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A70D9C433D7;
 Fri, 19 Aug 2022 22:27:49 +0000 (UTC)
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
X-Inumbo-ID: 293c86c1-200e-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660948070;
	bh=hZ/CNVEbUOfa2NhBtfpZPdbq+UKJtJN7sL8OPH7yINA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nD4rFsAbXNNeI1S3A8EEFtc2OXHQBDZvzAn+M9Tp1+NuKMqM+IxbJJSw0mRV69ZT8
	 mvKTpaSLmUFddzqcQKbEZexy2ojvoHnlIwgXDrTKpRwHvxmNdRFp9IGeFcGncVWkNs
	 vvgZvWVs2A8AJzK7RUJ17ZKVwi5sk/e1bpIwQSwWsJcCu1otJAD3gSh4xZFB5am4oC
	 KxdY76cLwth4cLiqSdVX26zEUK4vBWu7Mr+3hbg8NC+PeeQmJyGNjT6ORugufyVpC+
	 yGKkbddaCqzUiSeCD6QIYAtQz/+Sqtedfg189Rm/6Z/E/QL+JC5U00AqYw5LJ14jRQ
	 bht9d2fYIyqEg==
Date: Fri, 19 Aug 2022 15:27:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, 
    xen-devel@lists.xenproject.org, sstabellini@kernel.org, wl@xen.org, 
    jbeulich@suse.com, george.dunlap@citrix.com, andrew.cooper3@citrix.com, 
    bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com, roger.pau@citrix.com
Subject: Re: [PATCH v2 2/3] Add licenses under LICENSES
In-Reply-To: <835a1093-1280-1442-9e11-f9f5bbf9f635@xen.org>
Message-ID: <alpine.DEB.2.22.394.2208191524590.3790@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2208181453530.3790@ubuntu-linux-20-04-desktop> <20220818220320.2538705-2-stefano.stabellini@amd.com> <835a1093-1280-1442-9e11-f9f5bbf9f635@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 19 Aug 2022, Julien Grall wrote:
> Hi Stefano,
> 
> On 18/08/2022 23:03, Stefano Stabellini wrote:
> > Add the individual licenses under a new top-level directory named
> > "LICENSES". Each license file includes its related SPDX tags.
> 
> We already have a copy of the licenses in COPYING/CONTRIBUTING. I don't
> particularly mind where you want to keep the licenses but I don't want them
> duplicated.

Yes I think it makes sense to remove as part of this series:
- the "COMMON COPYRIGHT NOTICES" section from CONTRIBUTING
- the full copy of the GPL at the bottom of COPYING

Let me know if you think I am missing anything.

