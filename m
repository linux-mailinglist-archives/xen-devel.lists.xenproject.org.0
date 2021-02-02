Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD6E30C833
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 18:45:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80674.147707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6zit-0000o0-QU; Tue, 02 Feb 2021 17:44:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80674.147707; Tue, 02 Feb 2021 17:44:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6zit-0000nb-N3; Tue, 02 Feb 2021 17:44:19 +0000
Received: by outflank-mailman (input) for mailman id 80674;
 Tue, 02 Feb 2021 17:44:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gsWk=HE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l6zis-0000nW-GR
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 17:44:18 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e46cfcb1-616d-4c9d-9b1b-592c69505ea2;
 Tue, 02 Feb 2021 17:44:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 95D3464DA3;
 Tue,  2 Feb 2021 17:44:16 +0000 (UTC)
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
X-Inumbo-ID: e46cfcb1-616d-4c9d-9b1b-592c69505ea2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612287856;
	bh=kAPUxvEPOSjvbzuW7d4DzlEofbmKMDPLH5RHl5JCa84=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Lu0lpEgV2tbCP2WhvEk4HQCnDd1OKYESzDAjRt3K1UzWBjFRtKQy3lGZxdSPyi89h
	 oTDZUViaWM5dL2jx3jf8yfdoueiAknt5W8HNI1sQl1Sr6WjiCevhlRQ7DKcu5mntRu
	 qYyxGK27EGZN4WCp3VCPWOsMnVctYqOxS+2daD0pX1UrkQgVPfq7gOI0GVDOyUuU9T
	 qL/2ZFIHyQh3OWVKe9KGcXO5ynV2ZevXYUm2cpC1j7v0f+Cldy2Xe56j2k/XzkNmDp
	 qE7BgjhzdoHOwdPh2Ffw71ZNh0I5W/opq8wIbX0oWScdKNhIOquDLln0D8ya5L+rtO
	 Y8c1+JHpD/QDA==
Date: Tue, 2 Feb 2021 09:44:15 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <Rahul.Singh@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, 
    "brian.woods@xilinx.com" <brian.woods@xilinx.com>
Subject: Re: [PATCH v3 0/3] Generic SMMU Bindings
In-Reply-To: <C094E054-885F-4363-ABF3-E0FB4DDD7A2A@arm.com>
Message-ID: <alpine.DEB.2.21.2102020937480.29047@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2101261435550.2568@sstabellini-ThinkPad-T480s> <C094E054-885F-4363-ABF3-E0FB4DDD7A2A@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 2 Feb 2021, Rahul Singh wrote:
> Hello Stefano,
> 
> > On 26 Jan 2021, at 10:58 pm, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > Hi all,
> > 
> > This series introduces support for the generic SMMU bindings to
> > xen/drivers/passthrough/arm/smmu.c.
> > 
> > The last version of the series was
> > https://marc.info/?l=xen-devel&m=159539053406643
> > 
> > I realize that it is late for 4.15 -- I think it is OK if this series
> > goes in afterwards.
> 
> I tested the series on the Juno board it is woking fine.  
> I found one issue in SMMU driver while testing this series that is not related to this series but already existing issue in SMMU driver.
> 
> If there are more than one device behind SMMU and they share the same Stream-Id, SMMU driver is creating the new SMR entry without checking the already configured SMR entry if SMR entry correspond to stream-id is already configured.  Because of this I observed the stream match conflicts on Juno board.
> 
> (XEN) smmu: /iommu@7fb30000: Unexpected global fault, this could be serious
> (XEN) smmu: /iommu@7fb30000: 	GFSR 0x00000004, GFSYNR0 0x00000006, GFSYNR1 0x00000000, GFSYNR2 0x00000000
> 
> 
> Below two patches is required to be ported to Xen to fix the issue from Linux driver.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/iommu/arm-smmu.c?h=linux-5.8.y&id=1f3d5ca43019bff1105838712d55be087d93c0da
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/iommu/arm-smmu.c?h=linux-5.8.y&id=21174240e4f4439bb8ed6c116cdbdc03eba2126e


Good catch and thanks for the pointers! Do you have any interest in
backporting these two patches or should I put them on my TODO list?

Unrelated to who does the job, we should discuss if it makes sense to
try to fix the bug for 4.15. The patches don't seem trivial so I am
tempted to say that it might be best to leave the bug unfixed for 4.15
and fix it later.

