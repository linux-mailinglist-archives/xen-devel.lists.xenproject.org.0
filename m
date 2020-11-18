Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0DF2B79B4
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 09:58:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29527.59031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfJI6-0001Dj-1G; Wed, 18 Nov 2020 08:58:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29527.59031; Wed, 18 Nov 2020 08:58:13 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfJI5-0001DI-Sh; Wed, 18 Nov 2020 08:58:13 +0000
Received: by outflank-mailman (input) for mailman id 29527;
 Wed, 18 Nov 2020 08:58:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VXpI=EY=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1kfJI4-0001Ag-CO
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 08:58:12 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a59a809c-5e52-44df-9133-83bf144e326c;
 Wed, 18 Nov 2020 08:58:07 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E406367357; Wed, 18 Nov 2020 09:58:04 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VXpI=EY=lst.de=hch@srs-us1.protection.inumbo.net>)
	id 1kfJI4-0001Ag-CO
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 08:58:12 +0000
X-Inumbo-ID: a59a809c-5e52-44df-9133-83bf144e326c
Received: from verein.lst.de (unknown [213.95.11.211])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a59a809c-5e52-44df-9133-83bf144e326c;
	Wed, 18 Nov 2020 08:58:07 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id E406367357; Wed, 18 Nov 2020 09:58:04 +0100 (CET)
Date: Wed, 18 Nov 2020 09:58:04 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: Christoph Hellwig <hch@lst.de>, Tejun Heo <tj@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Coly Li <colyli@suse.de>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com, Richard Weinberger <richard@nod.at>,
	Jan Kara <jack@suse.com>, linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, Jens Axboe <axboe@kernel.dk>
Subject: Re: merge struct block_device and struct hd_struct
Message-ID: <20201118085804.GA20384@lst.de>
References: <20201118084800.2339180-1-hch@lst.de> <22ca5396-0253-f286-9eab-d417b2e0b3ad@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22ca5396-0253-f286-9eab-d417b2e0b3ad@suse.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Nov 18, 2020 at 09:56:11AM +0100, Jan Beulich wrote:
> since this isn't the first series from you recently spamming
> xen-devel, may I ask that you don't Cc entire series to lists
> which are involved with perhaps just one out of the many patches?
> IMO Cc lists should be compiled on a per-patch basis; the cover
> letter may of course be sent to the union of all of them.

No way.  Individual CCs are completely broken as they don't provide
the reviewer a context.  If you don't want xen-blkfront patches to
go to xen-devel remove it from MAINTAINERS.

