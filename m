Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B0E72BA5E
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 10:25:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546915.854013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8cpm-0001GC-8I; Mon, 12 Jun 2023 08:23:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546915.854013; Mon, 12 Jun 2023 08:23:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8cpm-0001EX-0y; Mon, 12 Jun 2023 08:23:30 +0000
Received: by outflank-mailman (input) for mailman id 546915;
 Mon, 12 Jun 2023 08:23:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SKQl=CA=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1q8cpj-0001ER-L8
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 08:23:27 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 662509e9-08fa-11ee-8611-37d641c3527e;
 Mon, 12 Jun 2023 10:23:24 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id AFD2468BFE; Mon, 12 Jun 2023 10:23:20 +0200 (CEST)
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
X-Inumbo-ID: 662509e9-08fa-11ee-8611-37d641c3527e
Date: Mon, 12 Jun 2023 10:23:20 +0200
From: Christoph Hellwig <hch@lst.de>
To: Juergen Gross <jgross@suse.com>
Cc: Christoph Hellwig <hch@lst.de>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Ben Skeggs <bskeggs@redhat.com>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	xen-devel@lists.xenproject.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH 2/4] x86: always initialize xen-swiotlb when
 xen-pcifront is enabling
Message-ID: <20230612082320.GA27052@lst.de>
References: <20230518134253.909623-1-hch@lst.de> <20230518134253.909623-3-hch@lst.de> <ZGZr/xgbUmVqpOpN@mail-itl> <20230519040405.GA10818@lst.de> <ZGdLErBzi9MANL3i@mail-itl> <c5defff8-882e-3482-0de1-e50a4bcdfa99@suse.com> <20230607131257.GB19206@lst.de> <79b26dac-b507-1c05-b499-784ca6ee3db0@suse.com> <afc27bd9-5426-d837-dbb2-ec9083bec240@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afc27bd9-5426-d837-dbb2-ec9083bec240@suse.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Thank you.  I'll queue it up as a separate patch.


