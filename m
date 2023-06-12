Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E20472B849
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 08:48:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546849.853914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8bL8-0002A2-GT; Mon, 12 Jun 2023 06:47:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546849.853914; Mon, 12 Jun 2023 06:47:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8bL8-00027h-DV; Mon, 12 Jun 2023 06:47:46 +0000
Received: by outflank-mailman (input) for mailman id 546849;
 Mon, 12 Jun 2023 06:47:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SKQl=CA=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1q8bL6-00027Z-9m
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 06:47:44 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 074a221d-08ed-11ee-8611-37d641c3527e;
 Mon, 12 Jun 2023 08:47:42 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C601568AFE; Mon, 12 Jun 2023 08:47:38 +0200 (CEST)
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
X-Inumbo-ID: 074a221d-08ed-11ee-8611-37d641c3527e
Date: Mon, 12 Jun 2023 08:47:38 +0200
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
Message-ID: <20230612064738.GA19518@lst.de>
References: <20230518134253.909623-1-hch@lst.de> <20230518134253.909623-3-hch@lst.de> <ZGZr/xgbUmVqpOpN@mail-itl> <20230519040405.GA10818@lst.de> <ZGdLErBzi9MANL3i@mail-itl> <c5defff8-882e-3482-0de1-e50a4bcdfa99@suse.com> <20230607131257.GB19206@lst.de> <79b26dac-b507-1c05-b499-784ca6ee3db0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79b26dac-b507-1c05-b499-784ca6ee3db0@suse.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Jun 09, 2023 at 05:38:28PM +0200, Juergen Gross wrote:
>>> guest started with e820_host=1 even if no PCI passthrough was planned.
>>> But this should be rather rare (at least I hope so).
>>
>> So is this an ACK for the patch and can we go ahead with it?
>
> As long as above mentioned check of the E820 map is done, yes.
>
> If you want I can send a diff to be folded into your patch on Monday.

Yes, that would be great!


