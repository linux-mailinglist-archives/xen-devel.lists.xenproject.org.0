Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 685902B79FC
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 10:09:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29602.59139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfJSU-0003NQ-Eu; Wed, 18 Nov 2020 09:08:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29602.59139; Wed, 18 Nov 2020 09:08:58 +0000
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
	id 1kfJSU-0003N1-Bj; Wed, 18 Nov 2020 09:08:58 +0000
Received: by outflank-mailman (input) for mailman id 29602;
 Wed, 18 Nov 2020 09:08:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VXpI=EY=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1kfJSS-0003Mw-9M
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 09:08:56 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fc9316e9-9347-4cad-a3e3-51cfa1b52cc3;
 Wed, 18 Nov 2020 09:08:55 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3A46F67357; Wed, 18 Nov 2020 10:08:53 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VXpI=EY=lst.de=hch@srs-us1.protection.inumbo.net>)
	id 1kfJSS-0003Mw-9M
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 09:08:56 +0000
X-Inumbo-ID: fc9316e9-9347-4cad-a3e3-51cfa1b52cc3
Received: from verein.lst.de (unknown [213.95.11.211])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id fc9316e9-9347-4cad-a3e3-51cfa1b52cc3;
	Wed, 18 Nov 2020 09:08:55 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 3A46F67357; Wed, 18 Nov 2020 10:08:53 +0100 (CET)
Date: Wed, 18 Nov 2020 10:08:53 +0100
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
Message-ID: <20201118090853.GA21243@lst.de>
References: <20201118084800.2339180-1-hch@lst.de> <22ca5396-0253-f286-9eab-d417b2e0b3ad@suse.com> <20201118085804.GA20384@lst.de> <1ded2079-f1be-6d5d-01df-65754447df78@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ded2079-f1be-6d5d-01df-65754447df78@suse.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Nov 18, 2020 at 10:04:04AM +0100, Jan Beulich wrote:
> That's the view of some people, but not all. Context can be easily
> established by those who care going to one of the many archives on
> which the entire series lands. Getting spammed, however, can't be
> avoided by the dozens or hundreds of list subscribers.

No, that is simply a completely broken model.  Mails a are trivial
to ignore, finding them OTOH is everything but.  Learn how to ignore
a few mails, it isn't hard at all.

