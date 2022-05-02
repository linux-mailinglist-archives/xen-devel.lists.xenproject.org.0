Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 403495174DF
	for <lists+xen-devel@lfdr.de>; Mon,  2 May 2022 18:46:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319012.539064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlZBy-0006jB-7M; Mon, 02 May 2022 16:46:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319012.539064; Mon, 02 May 2022 16:46:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlZBy-0006hD-3K; Mon, 02 May 2022 16:46:34 +0000
Received: by outflank-mailman (input) for mailman id 319012;
 Mon, 02 May 2022 16:46:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M0/j=VK=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1nlZBw-0006dS-KE
 for xen-devel@lists.xenproject.org; Mon, 02 May 2022 16:46:32 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b4673d3-ca37-11ec-a405-831a346695d4;
 Mon, 02 May 2022 18:46:31 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6CCEA68B05; Mon,  2 May 2022 18:46:26 +0200 (CEST)
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
X-Inumbo-ID: 6b4673d3-ca37-11ec-a405-831a346695d4
Date: Mon, 2 May 2022 18:46:25 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Richard Weinberger <richard@nod.at>,
	Johannes Berg <johannes@sipsolutions.net>,
	Josef Bacik <josef@toxicpanda.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Mike Snitzer <snitzer@kernel.org>, Song Liu <song@kernel.org>,
	Stefan Haberland <sth@linux.ibm.com>,
	Jan Hoeppner <hoeppner@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-um@lists.infradead.org, linux-block@vger.kernel.org,
	nbd@other.debian.org, virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org, linux-raid@vger.kernel.org,
	linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
	dm-devel@redhat.com
Subject: Re: fix and cleanup discard_alignment handling
Message-ID: <20220502164625.GA21569@lst.de>
References: <20220418045314.360785-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220418045314.360785-1-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)

ping?

