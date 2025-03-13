Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A16A5EBC0
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 07:31:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911217.1317675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsc5L-0001XQ-GK; Thu, 13 Mar 2025 06:30:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911217.1317675; Thu, 13 Mar 2025 06:30:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsc5L-0001W0-Di; Thu, 13 Mar 2025 06:30:27 +0000
Received: by outflank-mailman (input) for mailman id 911217;
 Thu, 13 Mar 2025 06:30:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PjYM=WA=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1tsc5K-0001Vu-0D
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 06:30:26 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5623dfc-ffd4-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 07:30:24 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
 id DBF1768C4E; Thu, 13 Mar 2025 07:30:19 +0100 (CET)
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
X-Inumbo-ID: a5623dfc-ffd4-11ef-9ab9-95dc52dad729
Date: Thu, 13 Mar 2025 07:30:19 +0100
From: Christoph Hellwig <hch@lst.de>
To: Anuj Gupta <anuj20.g@samsung.com>
Cc: Jens Axboe <axboe@kernel.dk>, "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
	James Smart <james.smart@broadcom.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH] block: remove unused parameter
Message-ID: <20250313063019.GB9789@lst.de>
References: <CGME20250313040150epcas5p347f94dac34fd2946dea51049559ee1de@epcas5p3.samsung.com> <20250313035322.243239-1-anuj20.g@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313035322.243239-1-anuj20.g@samsung.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

