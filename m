Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C73BA50E2B
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 22:50:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902753.1310735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpwbq-0002uG-Ts; Wed, 05 Mar 2025 21:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902753.1310735; Wed, 05 Mar 2025 21:48:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpwbq-0002s0-QM; Wed, 05 Mar 2025 21:48:58 +0000
Received: by outflank-mailman (input) for mailman id 902753;
 Wed, 05 Mar 2025 21:48:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gbs/=VY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tpwbp-0002rs-8F
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 21:48:57 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b38de9a-fa0b-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 22:48:43 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3C17E5C6ACF;
 Wed,  5 Mar 2025 21:46:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB5DAC4CED1;
 Wed,  5 Mar 2025 21:48:40 +0000 (UTC)
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
X-Inumbo-ID: 9b38de9a-fa0b-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741211321;
	bh=fJblui19P/uqvVqGokEBeBu7+iiLd0mS9gUrmwOQ/9w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=C6hV/iOiZFiqr9Crr9o3NKjJgm37mG/qKUbgGbLfY91+q1CV6mdeMQUcqigx9jPU5
	 MfKXa7JpiWVa+khh/7y1BNhLx+qM4JrFL45d1FnEQMfy8jw8pspcuIw1T9YDAKPMC1
	 dEYRuqhH3R6pA6tdz6hnMGbPrYnRHc5XpmOoccqWRHOn+FeWHDemR8JuM698DbKqUX
	 jf8J2BTVc2Ahpi4AUmFGu9u6GzBtJUnBV+3wTY1vWw2bCTlZVeFTbx0HolX0I0HJZf
	 coL7nv8z0BW/E1nlsUueRoGDjEcSv1OJXYWWPiomkB8iJnYZGo+g+nychvQYkBkuXg
	 hX1qjp1iroTmg==
Date: Wed, 5 Mar 2025 13:48:40 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 0/7] Add support for R-Car Gen4 PCI host controller
In-Reply-To: <cover.1740382735.git.mykyta_poturai@epam.com>
Message-ID: <alpine.DEB.2.22.394.2503051346270.1303386@ubuntu-linux-20-04-desktop>
References: <cover.1740382735.git.mykyta_poturai@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Feb 2025, Mykyta Poturai wrote:
> This series adds support for R-Car Gen4 PCI host controller.
> 
> To fully support the controller, the following changes were made:
> - Generic mechanism to support PCI child buses is added.
> - Private data for PCI host bridge and means to access it are added.
> 
> The series also includes a workaround for proper ATU propramming and
> optimizations to lessen the performance impact of that workaround.
> 
> The series was tested both as a part of the pci-passthrough patches[1] and
> standalone on S4 and V4H boards.
> 
> [1] https://github.com/Deedone/xen/tree/pci_passthrough_wip

Hi Mykyta,

I understand the need for this patch series in the context of vPCI and
PCI Passthrough.  

You also mentioned that you tested it as a standalone, meaning without
the PCI Passthrough patches. What is the purpose of this patch series
without PCI Passthrough?

Cheers,

Stefano




> Oleksandr Andrushchenko (4):
>   xen/arm: allow PCI host bridge to have private data
>   xen/arm: make pci_host_common_probe return the bridge
>   xen/arm: add support for PCI child bus
>   xen/arm: add support for R-Car Gen4 PCI host controller
> 
> Volodymyr Babchuk (3):
>   xen/arm: rcar4: add delay after programming ATU
>   xen/arm: rcar4: add simple optimization to avoid ATU reprogramming
>   xen/arm: rcar4: program ATU to accesses to all functions
> 
>  xen/arch/arm/include/asm/pci.h      |  16 +-
>  xen/arch/arm/pci/Makefile           |   1 +
>  xen/arch/arm/pci/ecam.c             |  17 +-
>  xen/arch/arm/pci/pci-access.c       |  37 +-
>  xen/arch/arm/pci/pci-host-common.c  | 106 +++++-
>  xen/arch/arm/pci/pci-host-generic.c |   2 +-
>  xen/arch/arm/pci/pci-host-rcar4.c   | 542 ++++++++++++++++++++++++++++
>  xen/arch/arm/pci/pci-host-zynqmp.c  |   2 +-
>  xen/arch/arm/vpci.c                 |  91 ++++-
>  9 files changed, 764 insertions(+), 50 deletions(-)
>  create mode 100644 xen/arch/arm/pci/pci-host-rcar4.c
> 
> -- 
> 2.34.1
> 

