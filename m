Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 592A07E5109
	for <lists+xen-devel@lfdr.de>; Wed,  8 Nov 2023 08:33:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629207.981231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0d2j-0004zI-Hr; Wed, 08 Nov 2023 07:32:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629207.981231; Wed, 08 Nov 2023 07:32:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0d2j-0004wo-FG; Wed, 08 Nov 2023 07:32:05 +0000
Received: by outflank-mailman (input) for mailman id 629207;
 Wed, 08 Nov 2023 07:32:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vAl1=GV=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1r0d2h-0004wS-De
 for xen-devel@lists.xenproject.org; Wed, 08 Nov 2023 07:32:03 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7269cc9-7e08-11ee-98da-6d05b1d4d9a1;
 Wed, 08 Nov 2023 08:32:02 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
 id A3BAD6732D; Wed,  8 Nov 2023 08:31:57 +0100 (CET)
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
X-Inumbo-ID: e7269cc9-7e08-11ee-98da-6d05b1d4d9a1
Date: Wed, 8 Nov 2023 08:31:57 +0100
From: Christoph Hellwig <hch@lst.de>
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: Mike Snitzer <snitzer@kernel.org>, Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, iommu@lists.linux.dev,
	Marek Marczykowski-G'orecki <marmarek@invisiblethingslab.com>,
	Jens Axboe <axboe@fb.com>, Sagi Grimberg <sagi@grimberg.me>,
	Jan Kara <jack@suse.cz>, Vlastimil Babka <vbabka@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Michal Hocko <mhocko@suse.com>, stable@vger.kernel.org,
	regressions@lists.linux.dev, Alasdair Kergon <agk@redhat.com>,
	dm-devel@lists.linux.dev, linux-mm@kvack.org
Subject: Re: [PATCH v2] swiotlb-xen: provide the "max_mapping_size" method
Message-ID: <20231108073157.GB5277@lst.de>
References: <ZUUlqJoS6_1IznzT@kbusch-mbp.dhcp.thefacebook.com> <ZUVYT1Xp4+hFT27W@mail-itl> <ZUV3TApYYoh_oiRR@kbusch-mbp.dhcp.thefacebook.com> <11a9886d-316c-edcd-d6da-24ad0b9a2b4@redhat.com> <ZUZOKitOAqqKiJ4n@kbusch-mbp.dhcp.thefacebook.com> <20231106071008.GB17022@lst.de> <928b5df7-fada-cf2f-6f6a-257a84547c3@redhat.com> <ZUkDUXDF6g4P86F3@kbusch-mbp.dhcp.thefacebook.com> <ZUkGpblDX637QV9y@redhat.com> <151bef41-e817-aea9-675-a35fdac4ed@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <151bef41-e817-aea9-675-a35fdac4ed@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

