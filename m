Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F82495E8C6
	for <lists+xen-devel@lfdr.de>; Mon, 26 Aug 2024 08:30:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783315.1192627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siTEx-000863-Sa; Mon, 26 Aug 2024 06:30:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783315.1192627; Mon, 26 Aug 2024 06:30:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siTEx-00083d-Oq; Mon, 26 Aug 2024 06:30:11 +0000
Received: by outflank-mailman (input) for mailman id 783315;
 Mon, 26 Aug 2024 06:30:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CvV/=PZ=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1siTEw-00083X-DJ
 for xen-devel@lists.xenproject.org; Mon, 26 Aug 2024 06:30:10 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a35f8f6a-6374-11ef-8776-851b0ebba9a2;
 Mon, 26 Aug 2024 08:30:08 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 8552E68AA6; Mon, 26 Aug 2024 08:30:03 +0200 (CEST)
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
X-Inumbo-ID: a35f8f6a-6374-11ef-8776-851b0ebba9a2
Date: Mon, 26 Aug 2024 08:30:02 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Wang <jasowang@redhat.com>
Cc: Christoph Hellwig <hch@lst.de>, "Michael S . Tsirkin" <mst@redhat.com>,
	iommu@lists.linux.dev, Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-media@vger.kernel.org,
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org
Subject: Re: clearly mark DMA_OPS support as an architecture feasture
Message-ID: <20240826063002.GA30266@lst.de>
References: <20240824035817.1163502-1-hch@lst.de> <CACGkMEsK8k=yX2ZytMJQhdZi4PS9-7KLUYmf2oGLu-UvNEYzug@mail.gmail.com> <CACGkMEu83MjTpkSS1mX02ar8RNDc5T4bsd4kkGHYhkH7LZY-wA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACGkMEu83MjTpkSS1mX02ar8RNDc5T4bsd4kkGHYhkH7LZY-wA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Aug 26, 2024 at 02:27:27PM +0800, Jason Wang wrote:
> Actually I meant, we can extend the virtio_config_ops to allow mapping
> ops there, then simulator and VDUSE can hook the map ops there.

From a quick glance that feels like the right layer of abstraction,
although the config part of the name feels wrong at that point.


