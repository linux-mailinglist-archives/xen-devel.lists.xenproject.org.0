Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8232A28E76E
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 21:37:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6987.18292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSmaL-0006zn-Vx; Wed, 14 Oct 2020 19:37:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6987.18292; Wed, 14 Oct 2020 19:37:17 +0000
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
	id 1kSmaL-0006zO-Sj; Wed, 14 Oct 2020 19:37:17 +0000
Received: by outflank-mailman (input) for mailman id 6987;
 Wed, 14 Oct 2020 19:37:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aNf1=DV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kSmaK-0006zJ-9M
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 19:37:16 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c630df3c-658a-4627-971f-6a46212fdd1c;
 Wed, 14 Oct 2020 19:37:14 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=aNf1=DV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kSmaK-0006zJ-9M
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 19:37:16 +0000
X-Inumbo-ID: c630df3c-658a-4627-971f-6a46212fdd1c
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c630df3c-658a-4627-971f-6a46212fdd1c;
	Wed, 14 Oct 2020 19:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602704235;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=1NquZVhKtHgIfSXsdXr9x93CbiYIcEFDLKC5Qh1YrSE=;
  b=B1WKLAp+2C0MEZVwyYSHRK9noA5XzEpn+IwwGfbhGxb8Z6uf97FI7No+
   NwJYl7hY0PWVwj6it/SsX78bHskgQ8WMvymwrnykSqp/FRi8/fCnakcyh
   LzE03BfrEgFh/envKPe/EBdzNASrk+tusYXl+I/4II12LwYHZgvu2hvnY
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: bNF8p36IWhINFjAdplWDNjC82HQGJ6T8P9UbrPg5fzoF5Xgs/BfMZs0U8j4V310+KGmyMNy+Pg
 oVvIXPELkru50vfUzuSMbMp8EiD/TP1QpNU1xhQZJRl6fLht9x+e7rdUL6rinuoIv+AxUZ8W99
 ffbKxuBvbCNIkVgPWLcSreojgAsqabHuhXMxm68GF9n9JWcKnFK+UXb8/uKOBhrYUB6JV6qOxP
 mtjGdMbN0h1lazGpmokmxrUhIo+9L49JhyP4AenCXqrY6xAqDTp5pT2tBOO6t8iwwJ+4PZ6tAn
 K88=
X-SBRS: 2.5
X-MesageID: 29351929
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,375,1596513600"; 
   d="scan'208";a="29351929"
Subject: Re: i915 dma faults on Xen
To: Jason Andryuk <jandryuk@gmail.com>, <intel-gfx@lists.freedesktop.org>,
	xen-devel <xen-devel@lists.xenproject.org>
References: <CAKf6xpv-LRCuo-qHHWMuukYtvJiR-i+-YhLUOZeqoAFd-=swEQ@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1a3b90f4-564e-84d3-fd6a-3454e8753579@citrix.com>
Date: Wed, 14 Oct 2020 20:37:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKf6xpv-LRCuo-qHHWMuukYtvJiR-i+-YhLUOZeqoAFd-=swEQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 14/10/2020 20:28, Jason Andryuk wrote:
> Hi,
>
> Bug opened at https://gitlab.freedesktop.org/drm/intel/-/issues/2576
>
> I'm seeing DMA faults for the i915 graphics hardware on a Dell
> Latitude 5500. These were captured when I plugged into a Dell
> Thunderbolt dock with two DisplayPort monitors attached.  Xen 4.12.4
> staging and Linux 5.4.70 (and some earlier versions).
>
> Oct 14 18:41:49.056490 kernel:[   85.570347] [drm:gen8_de_irq_handler
> [i915]] *ERROR* Fault errors on pipe A: 0x00000080
> Oct 14 18:41:49.056494 kernel:[   85.570395] [drm:gen8_de_irq_handler
> [i915]] *ERROR* Fault errors on pipe A: 0x00000080
> Oct 14 18:41:49.056589 VM hypervisor: (XEN) [VT-D]DMAR:[DMA Read]
> Request device [0000:00:02.0] fault addr 39b5845000, iommu reg =
> ffff82c00021d000
> Oct 14 18:41:49.056594 VM hypervisor: (XEN) [VT-D]DMAR: reason 06 -
> PTE Read access is not set
> Oct 14 18:41:49.056784 kernel:[   85.570668] [drm:gen8_de_irq_handler
> [i915]] *ERROR* Fault errors on pipe A: 0x00000080
> Oct 14 18:41:49.056789 kernel:[   85.570687] [drm:gen8_de_irq_handler
> [i915]] *ERROR* Fault errors on pipe A: 0x00000080
> Oct 14 18:41:49.056885 VM hypervisor: (XEN) [VT-D]DMAR:[DMA Read]
> Request device [0000:00:02.0] fault addr 4238d0a000, iommu reg =
> ffff82c00021d000
> Oct 14 18:41:49.056890 VM hypervisor: (XEN) [VT-D]DMAR: reason 06 -
> PTE Read access is not set
>
> They repeat. In the log attached to
> https://gitlab.freedesktop.org/drm/intel/-/issues/2576, they start at
> "Oct 14 18:41:49.056589" and continue until I unplug the dock around
> "Oct 14 18:41:54.801802".
>
> I've also seen similar messages when attaching the laptop's HDMI port
> to a 4k monitor. The eDP display by itself seems okay.
>
> I tried Fedora 31 & 32 live images with intel_iommu=on, so no Xen, and
> didn't see any errors
>
> This is a kernel & xen log with drm.debug=0x1e. It also includes some
> application (glass) logging when it changes resolutions which seems to
> set off the DMA faults. 5500-igfx-messages-kern-xen-glass
>
> Running xen with iommu=no-igfx disables the iommu for the i915
> graphics and no faults are reported. However, that breaks some other
> devices (Dell Latitude 7200 and 5580) giving a black screen with:
>
> Oct 10 13:24:37.022117 kernel:[   14.884759] i915 0000:00:02.0: Failed
> to idle engines, declaring wedged!
> Oct 10 13:24:37.022118 kernel:[   14.964794] i915 0000:00:02.0: Failed
> to initialize GPU, declaring it wedged!
>
> Any suggestions welcome.

Presumably this is with a PV dom0.  What are 39b5845000 and 4238d0a000
in the machine memory map?

This smells like a missing RMRR in the ACPI tables.

~Andrew

