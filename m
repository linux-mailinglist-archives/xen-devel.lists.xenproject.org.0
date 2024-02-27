Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59575869AF5
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 16:46:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686244.1068041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rezf6-00036A-8m; Tue, 27 Feb 2024 15:46:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686244.1068041; Tue, 27 Feb 2024 15:46:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rezf6-00034e-5r; Tue, 27 Feb 2024 15:46:32 +0000
Received: by outflank-mailman (input) for mailman id 686244;
 Tue, 27 Feb 2024 15:46:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KGmn=KE=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1rezf4-00033c-TI
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 15:46:30 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f843f12-d587-11ee-afd6-a90da7624cb6;
 Tue, 27 Feb 2024 16:46:29 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9F0FA68C4E; Tue, 27 Feb 2024 16:46:27 +0100 (CET)
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
X-Inumbo-ID: 5f843f12-d587-11ee-afd6-a90da7624cb6
Date: Tue, 27 Feb 2024 16:46:27 +0100
From: Christoph Hellwig <hch@lst.de>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>, xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org
Subject: Re: convert xen-blkfront to atomic queue limit updates v2
Message-ID: <20240227154627.GA15446@lst.de>
References: <20240221125845.3610668-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221125845.3610668-1-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)

Jens,

can you pick this up with the Xen maintainer review in place?


