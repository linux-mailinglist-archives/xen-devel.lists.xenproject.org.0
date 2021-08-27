Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 363D53FA05B
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 22:13:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173957.317414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJiDH-0001ON-9s; Fri, 27 Aug 2021 20:12:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173957.317414; Fri, 27 Aug 2021 20:12:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJiDG-00012w-Qr; Fri, 27 Aug 2021 20:12:30 +0000
Received: by outflank-mailman (input) for mailman id 173957;
 Fri, 27 Aug 2021 19:19:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8NxO=NS=infradead.org=mcgrof@srs-us1.protection.inumbo.net>)
 id 1mJhO3-0001O8-EG
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 19:19:35 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id de0f8296-b8cc-488b-bdff-b5f11bfad954;
 Fri, 27 Aug 2021 19:19:34 +0000 (UTC)
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mJhNr-00D5om-W1; Fri, 27 Aug 2021 19:19:24 +0000
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
X-Inumbo-ID: de0f8296-b8cc-488b-bdff-b5f11bfad954
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8+JTx2QtJKu1nzu/fi4s9YgHPPdIhi0U0aDc5hOafyE=; b=DmLUkoPiySq9BrvK1jaaJXWx0d
	4oEOxLjKBZFeObZMhOh8sXY1k9im/R0uUMkC798SPMVqTN8z7b346uM78ptLFFh7ODfY2ePOWraOr
	4EONWQeoBcZMd6EX5GAGMU3xHzWM3D7svkZsMOHZ8OzOXcIrul5xc+JcgzFeUWPXxSMiT4v30J2mV
	2VMfemsc0kth5aUdZPQrJPpoqW9sacn9jiLcOpS6HC7RQjlCVUH91Xx18A8JwNcV21q1iTlzeLfgX
	t4+CykU+NT2SpiQkmzwM6uOiWwKyIrce5Pnz+akrSNGRf4y8IYvb9KAKu1zKykq3QUfwrSIOlBPS+
	IdaBQL9w==;
Date: Fri, 27 Aug 2021 12:19:23 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, colyli@suse.de, kent.overstreet@gmail.com,
	kbusch@kernel.org, sagi@grimberg.me, vishal.l.verma@intel.com,
	dan.j.williams@intel.com, dave.jiang@intel.com, ira.weiny@intel.com,
	konrad.wilk@oracle.com, roger.pau@citrix.com,
	boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
	minchan@kernel.org, ngupta@vflare.org, senozhatsky@chromium.org
Cc: xen-devel@lists.xenproject.org, nvdimm@lists.linux.dev,
	linux-nvme@lists.infradead.org, linux-bcache@vger.kernel.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/10] block: first batch of add_disk() error handling
 conversions
Message-ID: <YSk6uyyuhDvFiqLJ@bombadil.infradead.org>
References: <20210827191809.3118103-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210827191809.3118103-1-mcgrof@kernel.org>
Sender: Luis Chamberlain <mcgrof@infradead.org>


Botched the subject. Sorry. this is the *second* batch :)

  Luis

