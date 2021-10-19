Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C053F433473
	for <lists+xen-devel@lfdr.de>; Tue, 19 Oct 2021 13:12:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213020.371109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcn2o-0007dS-IG; Tue, 19 Oct 2021 11:12:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213020.371109; Tue, 19 Oct 2021 11:12:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcn2o-0007av-ET; Tue, 19 Oct 2021 11:12:34 +0000
Received: by outflank-mailman (input) for mailman id 213020;
 Tue, 19 Oct 2021 11:12:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mcn2m-0007ap-J7
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 11:12:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mcn2m-0008Jh-E7
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 11:12:32 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mcn2m-0005h6-Cy
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 11:12:32 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mcn2h-0000HA-5X; Tue, 19 Oct 2021 12:12:27 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=LUe2Ak75LytPlP8rpM0g533w8devNdiFA5X4cNaR5GA=; b=48SzX5AzfpOAH6b2zo7LvmhI0Q
	MjpDK/BnIaGHDIkmPsosXbdbA9UPiIITrhw6Na+eKTSczhPDhHJLS+cc++YTizyzoXH2xtWdhbUwk
	VZXcexk8jCnK1VsQIOOwOOG+ziL6U2Y6AA+/2s7k8URH9mftMQolk2cM2QdtLuzhjiss=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24942.43034.758402.850001@mariner.uk.xensource.com>
Date: Tue, 19 Oct 2021 12:12:26 +0100
To: jbeulich@suse.com,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
    Bertrand Marquis <bertrand.marquis@arm.com>,
    sstabellini@kernel.org,
    Oleksandr_Andrushchenko@epam.com,
    Paul Durrant <paul@xen.org>
Subject: Re: [PATCH 0/3] Fixes: PCI devices passthrough on Arm
In-Reply-To: <cover.1634639117.git.bertrand.marquis@arm.com>
References: <cover.1634639117.git.bertrand.marquis@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Bertrand Marquis writes ("[PATCH 0/3] Fixes: PCI devices passthrough on Arm"):
> This patch serie is a follow-up after various findings on d59168dc05
> ("xen/arm: Enable the existing x86 virtual PCI support for ARM") as of
> agreed in [1].
> 
> It does the following:
> - enable vpci_add_handlers on x86 and not only on arm
> - remove __hwdom_init flag for vpci_add_handlers
> - add missing vpci handler cleanup in error path during pci_device_add
>   and pci_device_remove

Thanks.  Roger, Jan, what do you think of this ?

I have no qualms from my RM POV other than that I want a fix
resolves the concenrs previously expressed by maintainers.

Thanks,
Ian.

