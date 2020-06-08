Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9621F132A
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 09:05:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiBqQ-00087V-22; Mon, 08 Jun 2020 07:05:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ohtu=7V=bombadil.srs.infradead.org=batv+c8e86b2099343dd9fc1e+6133+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1jiBqP-00087P-Gj
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 07:05:17 +0000
X-Inumbo-ID: 646a3fba-a956-11ea-9ad7-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 646a3fba-a956-11ea-9ad7-bc764e2007e4;
 Mon, 08 Jun 2020 07:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=S378zGSpOf2f7Q1RRRkaUsWspkKGCnohH5tp/UAp9n0=; b=V56K/fI9pjhCqJKos2pXtAWzdJ
 IphlrsZzSU87eJoW4gUlDxlRMK8XKWdF6sWXg+ABe2d8azTKmXcwo3GsLbp9FC9nri4P7rNoQfK2b
 IHe4yDNGfXzdrzk45+HD73DnopkZDOcgi4mrLQY1pO7RZH5DUj/yPMTXKv+EvylhGDG27C1njPHqC
 z/ZJOu+NCVJl/u+gi+XqqeZYEVos53iiqpz2zEueMKYMSSLPowiJYMS6PYrgS5f467jzZLajCe5vk
 daoFPXBmmeck3KP+RwmUjtAP3gBckUQka4/SFJw6CYanCAUFcruaN0XJQlgaQTGlCkAeotzPRHQDa
 IsErvlQw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jiBqF-0002Ke-SQ; Mon, 08 Jun 2020 07:05:07 +0000
Date: Mon, 8 Jun 2020 00:05:07 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 03/11] swiotlb-xen: add struct device* parameter to
 xen_phys_to_bus
Message-ID: <20200608070507.GB15742@infradead.org>
References: <alpine.DEB.2.21.2006031506590.6774@sstabellini-ThinkPad-T480s>
 <20200603222247.11681-3-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200603222247.11681-3-sstabellini@kernel.org>
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

On Wed, Jun 03, 2020 at 03:22:39PM -0700, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> The parameter is unused in this patch.
> No functional changes.

This looks weird.  I'm pretty sure you are going to use it later, but
why not just add the argument when it actually is used?

