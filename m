Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A181851E94A
	for <lists+xen-devel@lfdr.de>; Sat,  7 May 2022 20:53:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323815.545679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnPXS-0007kN-Tr; Sat, 07 May 2022 18:52:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323815.545679; Sat, 07 May 2022 18:52:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnPXS-0007gy-Q1; Sat, 07 May 2022 18:52:22 +0000
Received: by outflank-mailman (input) for mailman id 323815;
 Sat, 07 May 2022 18:52:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jUmW=VP=kernel.org=cmarinas@srs-se1.protection.inumbo.net>)
 id 1nnPXR-0007gs-46
 for xen-devel@lists.xenproject.org; Sat, 07 May 2022 18:52:21 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1cfae4c-ce36-11ec-8fc4-03012f2f19d4;
 Sat, 07 May 2022 20:52:19 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C4C086143F;
 Sat,  7 May 2022 18:52:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E04C385A5;
 Sat,  7 May 2022 18:52:14 +0000 (UTC)
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
X-Inumbo-ID: d1cfae4c-ce36-11ec-8fc4-03012f2f19d4
Date: Sat, 7 May 2022 19:52:11 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH V2 1/7] arm/xen: Introduce xen_setup_dma_ops()
Message-ID: <Yna/204BkqV8/vfG@arm.com>
References: <1651947548-4055-1-git-send-email-olekstysh@gmail.com>
 <1651947548-4055-2-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1651947548-4055-2-git-send-email-olekstysh@gmail.com>

On Sat, May 07, 2022 at 09:19:02PM +0300, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> This patch introduces new helper and places it in new header.
> The helper's purpose is to assign any Xen specific DMA ops in
> a single place. For now, we deal with xen-swiotlb DMA ops only.
> The one of the subsequent commits in current series will add
> xen-grant DMA ops case.
> 
> Also re-use the xen_swiotlb_detect() check on Arm32.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

For arm64:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

