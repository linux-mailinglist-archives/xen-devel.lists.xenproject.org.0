Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0CE734F80
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 11:20:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550903.860122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBB37-0001OD-E9; Mon, 19 Jun 2023 09:19:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550903.860122; Mon, 19 Jun 2023 09:19:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBB37-0001Lp-BW; Mon, 19 Jun 2023 09:19:49 +0000
Received: by outflank-mailman (input) for mailman id 550903;
 Mon, 19 Jun 2023 09:19:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3PVq=CH=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1qBB35-0001Lj-Kx
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 09:19:47 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e18ec18-0e82-11ee-8611-37d641c3527e;
 Mon, 19 Jun 2023 11:19:45 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id AFC556732D; Mon, 19 Jun 2023 11:19:41 +0200 (CEST)
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
X-Inumbo-ID: 6e18ec18-0e82-11ee-8611-37d641c3527e
Date: Mon, 19 Jun 2023 11:19:41 +0200
From: Christoph Hellwig <hch@lst.de>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: unexport swiotlb_active v2
Message-ID: <20230619091941.GA17034@lst.de>
References: <20230612142542.111581-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612142542.111581-1-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)

Any comments?  I'd really like to finish this off this merge window..

