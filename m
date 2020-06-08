Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E831F132E
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 09:05:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiBqv-0008Bt-DX; Mon, 08 Jun 2020 07:05:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ohtu=7V=bombadil.srs.infradead.org=batv+c8e86b2099343dd9fc1e+6133+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1jiBqt-0008Bc-P7
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 07:05:47 +0000
X-Inumbo-ID: 77b8184e-a956-11ea-9b55-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77b8184e-a956-11ea-9b55-bc764e2007e4;
 Mon, 08 Jun 2020 07:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=7U+YuzUXCE0mJTp+dzDjktj85iFXgfVb4+sX78AimxA=; b=t9ZtB8KrPobjfP37mn9PfXTOLL
 hbJ48V3TGx/y1Ob8pefkO7PtqfJ1GhdVdawR2fBv9Nnt6Ry1l4i7RCTDpanqbn0543t5inWZpSiLJ
 MBHirWUVu4Bj4gjeitX3d0Xcy0BUMqCIZlJ5TDTPYSTPsW4rD20mPGeOqXhefVsDad/4p/uwXN9ts
 BFJQazZwUt8iQOhbgVV/u98RhSgAFQz/xYRyVbBHhUWpeupPcuahDUY4dQ/huAv/k521Tu0htnB8W
 TwuxXAuLOZC3LvaKs7g9iYJQEUwkUH+Xcw1g2E4xW7kCZdhElaGQyarktIVMkReqigHZQuuhY3uZv
 XaMSveiw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jiBqm-0003E7-8a; Mon, 08 Jun 2020 07:05:40 +0000
Date: Mon, 8 Jun 2020 00:05:40 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 04/11] swiotlb-xen: add struct device* parameter to
 xen_bus_to_phys
Message-ID: <20200608070540.GC15742@infradead.org>
References: <alpine.DEB.2.21.2006031506590.6774@sstabellini-ThinkPad-T480s>
 <20200603222247.11681-4-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200603222247.11681-4-sstabellini@kernel.org>
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

Same comment as for the last one.  Also in the subject a whitespace
is missing after "device" and before "*".

