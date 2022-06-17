Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 002E454F829
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jun 2022 15:08:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.351423.578023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2BhM-00025k-Kh; Fri, 17 Jun 2022 13:07:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 351423.578023; Fri, 17 Jun 2022 13:07:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2BhM-00022y-Hh; Fri, 17 Jun 2022 13:07:40 +0000
Received: by outflank-mailman (input) for mailman id 351423;
 Fri, 17 Jun 2022 13:07:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rI7C=WY=citrix.com=prvs=160677330=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o2BhK-00022s-Fz
 for xen-devel@lists.xenproject.org; Fri, 17 Jun 2022 13:07:38 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 742f51cd-ee3e-11ec-bd2d-47488cf2e6aa;
 Fri, 17 Jun 2022 15:07:36 +0200 (CEST)
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
X-Inumbo-ID: 742f51cd-ee3e-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655471256;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=43DOepLpiA6dAclzX6XEZibIuvrKwywcq/eObv9mD9M=;
  b=PtN5gWuphf7cXSvTfjUBJn9Tkz22pcL26/whB39eR4rFWxjAF1IcziZl
   xE0yyIFeMalw5a2fRRMMWKViZcrhtMojl3iAfAppHAljjX2d7Bn1AAPTI
   LhwEY5h/bzFD++MVKNBrHwxMkEXZK7oAz4VW4E1ovzTm/seagXJA1yUhJ
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 73699563
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:65xIEqCvzCqKSxVW/w7jw5YqxClBgxIJ4kV8jS/XYbTApDMr1DwCn
 GAdWWmAb67eZWDyeNxwO9y3/U0E6peGnIVmQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgH2eIdA970Ug5w7Bg3NY06TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPha9
 9FipaKRWTsGfbHVm95efEREMgVhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp8VQ6ePO
 pRCAdZpRCrMUUx9NQ81McMVk9ijlGfFUDsG813A8MLb5ECMlVcsgdABKuH9Y9GPWIBJhEeGp
 2vC12L+BB4cKZqY0zXt2mm3mubFkCf/WYQTPL617PhnhBuU3GN7IAUfSF+TsfS/zEmkVLp3I
 VYf+jclrroa/UuvCNL6WnWQuXOBo1sQVsRdF8U87weCzLeS5ByWbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8kN+pEXFLdylYP3ZCFFZbpYm4yG0usv7RZv1cFIGlsPzlJR6z3
 ymJlmsR2qkyqdFegs1X4mv7byKQSonhF1Bou1mMBjj9s2uVd6b+OdX2tAGzAeJoad/AEwLf5
 CVsd922trhmMH2bqMCarAzh9pmN7u3NDjDTiEUH83IJp2X0oC7LkWy9DVhDyKZV3iUsI2aBj
 Lf741852XOqFCLCgVVLS4ywEd826qPrCM7oUPvZBvIXPMUsKFfboHw2PBPKt4wIrKTLufBXB
 HtmWZz0USZy5VpPl1JauNvxIZd0n3tjlAs/tLjwzgi90Kr2WUN5vYwtaQPUBshgtfvsiFyMr
 753apvboz0CAbaWSnSGruYuwaUicCFT6Wbe8JcMKIZu42NORQkcNhMm6ep5I9I9xP8Jx7igE
 7PUchYw9WcTTEbvcW2iAk2Popu2NXqjhRrX5RARAGs=
IronPort-HdrOrdr: A9a23:a6XODK4eXS8yIRbciwPXwMjXdLJyesId70hD6qhwISY6TiW9rb
 HLoB17726QtN9/YhwdcLy7VJVoBEmskqKdgrNhX4tKPjOHhILAFugLhuHfKn/bak7DH4ZmpM
 FdmsNFaeEYY2IUsfrH
X-IronPort-AV: E=Sophos;i="5.92,306,1650945600"; 
   d="scan'208";a="73699563"
Date: Fri, 17 Jun 2022 14:07:18 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Chuck Zmudzinski <brchuckz@aol.com>
CC: <qemu-devel@nongnu.org>, <xen-devel@lists.xenproject.org>,
	<qemu-trivial@nongnu.org>, Stefano Stabellini <sstabellini@kernel.org>, Paul
 Durrant <paul@xen.org>
Subject: Re: [PATCH] xen/pass-through: don't create needless register group
Message-ID: <Yqx8ht2teAoRJF4b@perard.uk.xensource.com>
References: <a2e946dfb45260a5e29cec3b2195e4c1385b0d63.1654876622.git.brchuckz.ref@aol.com>
 <a2e946dfb45260a5e29cec3b2195e4c1385b0d63.1654876622.git.brchuckz@aol.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a2e946dfb45260a5e29cec3b2195e4c1385b0d63.1654876622.git.brchuckz@aol.com>

On Fri, Jun 10, 2022 at 12:23:35PM -0400, Chuck Zmudzinski wrote:
> Currently we are creating a register group for the Intel IGD OpRegion
> for every device we pass through, but the XEN_PCI_INTEL_OPREGION
> register group is only valid for an Intel IGD. Add a check to make
> sure the device is an Intel IGD and a check that the administrator has
> enabled gfx_passthru in the xl domain configuration. Require both checks
> to be true before creating the register group. Use the existing
> is_igd_vga_passthrough() function to check for a graphics device from
> any vendor and that the administrator enabled gfx_passthru in the xl
> domain configuration, but further require that the vendor be Intel,
> because only Intel IGD devices have an Intel OpRegion. These are the
> same checks hvmloader and libxl do to determine if the Intel OpRegion
> needs to be mapped into the guest's memory.
> 
> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
> ---
>  hw/xen/xen_pt_config_init.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
> index c5c4e943a8..ffd915654c 100644
> --- a/hw/xen/xen_pt_config_init.c
> +++ b/hw/xen/xen_pt_config_init.c
> @@ -2037,6 +2037,10 @@ void xen_pt_config_init(XenPCIPassthroughState *s, Error **errp)
>           * therefore the size should be 0xff.
>           */

Could you move that comment? I think it would make more sense to comment
the "reg_grp_offset=XEN_PCI_INTEL_OPREGION" line now that the `if` block
also skip setting up the group on non-intel devices.

>          if (xen_pt_emu_reg_grps[i].grp_id == XEN_PCI_INTEL_OPREGION) {
> +            if (!is_igd_vga_passthrough(&s->real_device) ||
> +                s->real_device.vendor_id != PCI_VENDOR_ID_INTEL) {
> +                continue;
> +            }
>              reg_grp_offset = XEN_PCI_INTEL_OPREGION;
>          }

Thanks,

-- 
Anthony PERARD

