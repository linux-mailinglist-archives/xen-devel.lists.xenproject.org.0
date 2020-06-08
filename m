Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DED1F1339
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 09:09:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiBud-0008TH-9D; Mon, 08 Jun 2020 07:09:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ohtu=7V=bombadil.srs.infradead.org=batv+c8e86b2099343dd9fc1e+6133+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1jiBub-0008T4-Ke
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 07:09:37 +0000
X-Inumbo-ID: 031227cc-a957-11ea-ba62-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 031227cc-a957-11ea-ba62-bc764e2007e4;
 Mon, 08 Jun 2020 07:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=riTlVvjTBVFVzOBQ14vr3osfjEjXKYJJb4irFAZraug=; b=mrrf00JD+nWPYE2DUp6aInWaGN
 a0TxqMgzuk/LZrKik9Im/aZcH6eN6HqEQ6SXpJb1qToyKWPK/mAAx6+qceEklRjCStr6sT9NR15iC
 G7zApsVtqHeNiJLCkNz/l/f3NxMiEJWdWykEdvN17+3WrJmZ37+O4628h8PIkyaTbI6dyc4WpeS7w
 /CvBKq3CoXFkMGqT8kq6RGDfyyGSqG9B735Rq17SHasqFOmkkWHaOJJgPzhNxGk2HMBsdqDvWOL8X
 KixbEX6rwCAMRY9fmWt8XRMo5f6s2AsghXmBgqFVATH/dejo6gIXS5Uuonc7MSsGYPgNwsGeoeC2q
 1wRSFvkQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jiBuY-0003VP-6I; Mon, 08 Jun 2020 07:09:34 +0000
Date: Mon, 8 Jun 2020 00:09:34 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 09/11] swiotlb-xen: rename xen_phys_to_bus to
 xen_phys_to_dma and xen_bus_to_phys to xen_dma_to_phys
Message-ID: <20200608070934.GE15742@infradead.org>
References: <alpine.DEB.2.21.2006031506590.6774@sstabellini-ThinkPad-T480s>
 <20200603222247.11681-9-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200603222247.11681-9-sstabellini@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: jgross@suse.com, tamas@tklengyel.com, konrad.wilk@oracle.com,
 roman@zededa.com, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 boris.ostrovsky@oracle.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 03, 2020 at 03:22:45PM -0700, Stefano Stabellini wrote:
> so that their names can better describe their behavior.
> 
> No functional changes.

I think this should go with the actual change, and adding the
parameters.  Touching this function piecemail in three patches for
what really is a single logical change is rather strange.

