Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBD23CA37E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 19:00:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156863.289433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m44ig-00063N-CR; Thu, 15 Jul 2021 17:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156863.289433; Thu, 15 Jul 2021 17:00:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m44ig-00061Y-8l; Thu, 15 Jul 2021 17:00:18 +0000
Received: by outflank-mailman (input) for mailman id 156863;
 Thu, 15 Jul 2021 17:00:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aGUF=MH=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1m44ie-00061M-5D
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 17:00:16 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1f6a7d42-e58e-11eb-890b-12813bfff9fa;
 Thu, 15 Jul 2021 17:00:14 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id D5DD667373; Thu, 15 Jul 2021 19:00:11 +0200 (CEST)
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
X-Inumbo-ID: 1f6a7d42-e58e-11eb-890b-12813bfff9fa
Date: Thu, 15 Jul 2021 19:00:11 +0200
From: Christoph Hellwig <hch@lst.de>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Roman Skakun <rm.skakun@gmail.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Roman Skakun <roman_skakun@epam.com>,
	Andrii Anisov <andrii_anisov@epam.com>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2] dma-mapping: use vmalloc_to_page for vmalloc
 addresses
Message-ID: <20210715170011.GA17324@lst.de>
References: <20210616154436.GA7619@lst.de> <20210622133414.132754-1-rm.skakun@gmail.com> <YO4si0to/XYximwM@fedora> <CADu_u-OMx6Pj4DQDoOsdh6aNAzYys-+R=o+OzHYtLm=nECgkyQ@mail.gmail.com> <fb262a14-a69c-030b-1f39-d924553ddbd2@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb262a14-a69c-030b-1f39-d924553ddbd2@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Jul 15, 2021 at 12:58:53PM -0400, Boris Ostrovsky wrote:
> 
> On 7/15/21 3:39 AM, Roman Skakun wrote:
> >> This looks like it wasn't picked up? Should it go in rc1?
> > Hi, Konrad!
> >
> > This looks like an unambiguous bug, and should be in rc1.
> 
> 
> Looks like you didn't copy Christoph which could be part of the problem. Adding him.

Can someone just send a clean patch that I can review and hopefully
apply?

