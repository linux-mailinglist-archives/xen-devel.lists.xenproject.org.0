Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B81B337AC95
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 19:01:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125854.236913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgVkp-0007Uc-O1; Tue, 11 May 2021 17:01:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125854.236913; Tue, 11 May 2021 17:01:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgVkp-0007Rn-Ku; Tue, 11 May 2021 17:01:07 +0000
Received: by outflank-mailman (input) for mailman id 125854;
 Tue, 11 May 2021 17:01:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OZd+=KG=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1lgVko-0007Rh-CC
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 17:01:06 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3928804-92dc-4be8-abb0-787b92627f3e;
 Tue, 11 May 2021 17:01:04 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 14EDB67373; Tue, 11 May 2021 19:01:02 +0200 (CEST)
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
X-Inumbo-ID: c3928804-92dc-4be8-abb0-787b92627f3e
Date: Tue, 11 May 2021 19:01:01 +0200
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Julien Grall <julien@xen.org>,
	f.fainelli@gmail.com,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	linux-kernel@vger.kernel.org,
	osstest service owner <osstest-admin@xenproject.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	iommu@lists.linux-foundation.org
Subject: Re: Regression when booting 5.15 as dom0 on arm64 (WAS: Re:
 [linux-linus test] 161829: regressions - FAIL)]
Message-ID: <20210511170101.GA20936@lst.de>
References: <osstest-161829-mainreport@xen.org> <4ea1e89f-a7a0-7664-470c-b3cf773a1031@xen.org> <20210510084057.GA933@lst.de> <alpine.DEB.2.21.2105101818260.5018@sstabellini-ThinkPad-T480s> <20210511063558.GA7605@lst.de> <alpine.DEB.2.21.2105110925430.5018@sstabellini-ThinkPad-T480s> <20210511164933.GA19775@lst.de> <alpine.DEB.2.21.2105110950580.5018@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2105110950580.5018@sstabellini-ThinkPad-T480s>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, May 11, 2021 at 09:51:20AM -0700, Stefano Stabellini wrote:
> On Tue, 11 May 2021, Christoph Hellwig wrote:
> > On Tue, May 11, 2021 at 09:47:33AM -0700, Stefano Stabellini wrote:
> > > That's a much better plan. It is also not super urgent, so maybe for now
> > > we could add an explicit check for io_tlb_default_mem != NULL at the
> > > beginning of xen_swiotlb_init? So that at least we can fail explicitly
> > > or ignore it explicitly rather than by accident.
> > 
> > Fine with me.  Do you want to take over from here and test and submit
> > your version?
> 
> I can do that. Can I add your signed-off-by for your original fix?

Sure:

Signed-off-by: Christoph Hellwig <hch@lst.de>

