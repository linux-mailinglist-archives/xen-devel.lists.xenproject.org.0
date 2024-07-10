Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2812592CA4E
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 07:56:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756534.1165175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRQIZ-0002Uw-VH; Wed, 10 Jul 2024 05:55:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756534.1165175; Wed, 10 Jul 2024 05:55:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRQIZ-0002Sq-SH; Wed, 10 Jul 2024 05:55:27 +0000
Received: by outflank-mailman (input) for mailman id 756534;
 Wed, 10 Jul 2024 05:55:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l4se=OK=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1sRQIY-0002Sk-MO
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 05:55:26 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff781a9e-3e80-11ef-8776-851b0ebba9a2;
 Wed, 10 Jul 2024 07:55:24 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E662A227A87; Wed, 10 Jul 2024 07:55:20 +0200 (CEST)
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
X-Inumbo-ID: ff781a9e-3e80-11ef-8776-851b0ebba9a2
Date: Wed, 10 Jul 2024 07:55:20 +0200
From: Christoph Hellwig <hch@lst.de>
To: Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
Cc: Christoph Hellwig <hch@lst.de>, mhkelley58@gmail.com,
	mhklinux@outlook.com, robin.murphy@arm.com, joro@8bytes.org,
	will@kernel.org, jgross@suse.com, sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com, m.szyprowski@samsung.com,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 1/1] swiotlb: Reduce swiotlb pool lookups
Message-ID: <20240710055520.GA25305@lst.de>
References: <20240708194100.1531-1-mhklinux@outlook.com> <20240709111013.6103d3f0@mordecai.tesarici.cz> <20240709111812.GB4421@lst.de> <20240709210818.28116c53@meshulam.tesarici.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240709210818.28116c53@meshulam.tesarici.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Jul 09, 2024 at 09:08:18PM +0200, Petr Tesařík wrote:
> I'm confused. If you're not a big fan, why are we effectively adding
> them to more places now than before the patch?

Because I didn't want to second guess the patch author too much.

