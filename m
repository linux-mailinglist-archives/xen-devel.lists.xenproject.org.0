Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5CD514A7A
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 15:26:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317307.536580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkQdg-0003Ri-2p; Fri, 29 Apr 2022 13:26:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317307.536580; Fri, 29 Apr 2022 13:26:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkQdf-0003P5-Vk; Fri, 29 Apr 2022 13:26:27 +0000
Received: by outflank-mailman (input) for mailman id 317307;
 Fri, 29 Apr 2022 13:26:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xZxz=VH=citrix.com=prvs=111f028e5=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nkQde-0003Oz-CG
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 13:26:26 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6c8713c-c7bf-11ec-8fc4-03012f2f19d4;
 Fri, 29 Apr 2022 15:26:24 +0200 (CEST)
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
X-Inumbo-ID: f6c8713c-c7bf-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651238784;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=FsRfEudeWOVVBwaVoaNrZWypJ2Ns2oqixSfA9Jj1aOY=;
  b=XyoC0VMs3E+bBkFrlqMq2Fvb0L2gThLNKKIeci4hiAIsJvcE4HYTPWWz
   C8u1lPUTm9FNxqy8ycWMzJwQv/WRjN1l9jrYd8zyV/eM4SxoV0iUm1GKH
   qAZeroZmoJExQydrT+P6M2iJE33uUkBtvXjkKVk0bZCq8ZTOot4qatJsx
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 70114345
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:xQGhy6vVUid0CYYY4oVH7P78V+fnVMVeMUV32f8akzHdYApBsoF/q
 tZmKTqPM/2OYGumLdsgbNy/9hgP657dx9MyTANpqXhnEisb+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywobVvqYy2YLjW1/X6
 IupyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8uLIPUt8oRCyN6MCAvHJRLyK/MAn6g5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllpyy3ZCvA3B4jOWazQ6fdT3Ssqh9AIFvHbD
 yYcQWU3NU2cOEESUrsRIJRkgtrvnl/ySABZuUqWoYQ4zTHV0hMkhdABN/KKI4fXFK25hH2wm
 GXC+GjoBwAAA/aWwzGF73GEi/fGmGXwX4d6PKaj6vdgjVmXx2oSIB4bT122pb++kEHWc9hSM
 VAO8ywi66077lW2T8LVVge95nWDu3Y0WNdOEut89ACEzILV5RqUAi4PSTspQN47sokwTD8j1
 F6MlvvoAyBitPueTnf13qiQhSO/P24SN2BqTT8JS04J7sfupKk3jwnTVZBzHaitlNr3FDrsh
 TeQo0AWhboJitUQ/76m5l2BiDWpzrDLUwo06wP/Tm+jqARja+aNZYal9Fza5vZoN5uCQx+Ku
 31spiSFxLlQV9fXznXLGbhTWuHyjxqYDNHCqVl9MYEO2Tj1wVyAfNFx2TxONExKNNlRLFcFf
 3TvkQ9W4ZZSOl6jYql2f5+9BqwW8ETwKTj2fquKN4QTO/CdYCfCpXgzPhDIgwgBhWB2yckC1
 YGnndFA5JrwIYBu13KISugUytfHLQhulDqIFfgXI/lKuIdyhUJ5q59YaDNijchjtctoRTk5F
 P4FaqO3J+13CrGWX8Uu2dd7wao2BXY6H4vqjMdca/SOJAFrcEl4VaKImOt7ItU+xf0I/gstw
 p1bchYJoLYYrSeaQThml1g5MO+/NXqBhS9T0dMQ0aaAhCF4PNfHAFY3fJorZ7g3nNGPPtYvJ
 8Tpj/6oW6wVIhyeomx1RcCk/ORKKUT67SrTbnHNSGVuIPZdq/nhp4aMkv3Hr3JVUEJadKIW/
 tWd6+8sacddF1k6UJaKOZpCDTqZ5BAgpQ67ZGOQSvE7Rakm2NECx/DZ5hPvH/wxFA==
IronPort-HdrOrdr: A9a23:D1f8JqnHxccSqaEHTlEJBzqwRLfpDfIU3DAbv31ZSRFFG/Fxl6
 iV/cjz8SWE7wr5P0tQ/+xoWZPwJU80mqQY3WB8B9iftUzdyRKVxeJZnO7fKl/bak7DH4dmvM
 8KGcVD4Z/LfDpHZK7BkXGF+r0boOVvnprHudvj
X-IronPort-AV: E=Sophos;i="5.91,185,1647316800"; 
   d="scan'208";a="70114345"
Date: Fri, 29 Apr 2022 14:26:07 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jane Malalane <jane.malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v10 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Message-ID: <Ymvnb9la58CzrGaZ@perard.uk.xensource.com>
References: <20220413112111.30675-1-jane.malalane@citrix.com>
 <20220413112111.30675-2-jane.malalane@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220413112111.30675-2-jane.malalane@citrix.com>

On Wed, Apr 13, 2022 at 12:21:10PM +0100, Jane Malalane wrote:
> Add XEN_SYSCTL_PHYSCAP_X86_ASSISTED_XAPIC and
> XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X2APIC to report accelerated xAPIC and
> x2APIC, on x86 hardware. This is so that xAPIC and x2APIC virtualization
> can subsequently be enabled on a per-domain basis.
> No such features are currently implemented on AMD hardware.
> 
> HW assisted xAPIC virtualization will be reported if HW, at the
> minimum, supports virtualize_apic_accesses as this feature alone means
> that an access to the APIC page will cause an APIC-access VM exit. An
> APIC-access VM exit provides a VMM with information about the access
> causing the VM exit, unlike a regular EPT fault, thus simplifying some
> internal handling.
> 
> HW assisted x2APIC virtualization will be reported if HW supports
> virtualize_x2apic_mode and, at least, either apic_reg_virt or
> virtual_intr_delivery. This also means that
> sysctl follows the conditionals in vmx_vlapic_msr_changed().
> 
> For that purpose, also add an arch-specific "capabilities" parameter
> to struct xen_sysctl_physinfo.
> 
> Note that this interface is intended to be compatible with AMD so that
> AVIC support can be introduced in a future patch. Unlike Intel that
> has multiple controls for APIC Virtualization, AMD has one global
> 'AVIC Enable' control bit, so fine-graining of APIC virtualization
> control cannot be done on a common interface.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
> Reviewed-by: "Roger Pau Monné" <roger.pau@citrix.com>

No changes in the tools since v9, so my tag still stand:
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com> # tools

-- 
Anthony PERARD

