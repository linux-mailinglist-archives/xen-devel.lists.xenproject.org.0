Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3D94ECA69
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 19:15:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296454.504616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZbul-00039Q-Do; Wed, 30 Mar 2022 17:15:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296454.504616; Wed, 30 Mar 2022 17:15:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZbul-000377-AL; Wed, 30 Mar 2022 17:15:23 +0000
Received: by outflank-mailman (input) for mailman id 296454;
 Wed, 30 Mar 2022 17:15:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D/pr=UJ=citrix.com=prvs=081612a10=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nZbuj-00036z-G7
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 17:15:21 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f946aacf-b04c-11ec-8fbc-03012f2f19d4;
 Wed, 30 Mar 2022 19:15:20 +0200 (CEST)
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
X-Inumbo-ID: f946aacf-b04c-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648660520;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+BcRBjRck8hNsP8DdjvPcI+Ml8VL7xiW/6SqBiO1tWs=;
  b=OfjKABC3/pbPfGxFmfzw1+3vesmJXe2FcSO46/NhnPqi7TofpfTPzpxv
   sX2kvOxCmbP2wEHHbqQeS2UPR7/Wm2Tmdtn+zpMqEyxkYk6gPKWPoj80z
   sP/mSFyhitBfvUpqNOiiVzrjdRds7rHWH4C0MUvwvW5RbVSLDJmgz5Mnr
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 67013688
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:N/vPk65zEreesiqwzR+fHwxRtBrHchMFZxGqfqrLsTDasY5as4F+v
 mseUD+OaK7ZNDDyftx3bN+/p0wHsJ7QndBqSgRprXsxHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YPiW1vR0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSPFUAvPLSLvN87TgVXFAElMYFXyaHudC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsWvG1gyjfIS+4rW5nZT43B5MNC3Sd2jcdLdRrbT
 5RGMWM0MkSQC/FJEmVUIZ0DmuOBvWL2K2UCinDS/o0cyXeGmWSd15CyaYGIK7RmX/59nEmCo
 Xnd13/kGRxcP9uaoRKH+H+xgu7EnQvgRZkfUra/85ZCn1m71mEVThoMWjOTq+OyilO1WMB3L
 UEI4SEntaV08kG3JvHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpVTA9nJZoH3pwj
 AbPxo63Q2w02FGIdZ6D3ojI6jWwIG8xFkkfeSADbVAJz8jSvqhm23ojUe1fOKKyi9T0HxT5z
 DaLsDUyit0vsCIb60mo1QuZ2mzx//AlWiZwv1yKBTz9smuVcab/P+SVBU7nAeGsxWpzZn2Ip
 zA6lseX94ji5rndxXXWEI3h8FxEjstp0QEwY3YyR/HNFBz3ohZPmLy8Bhkkfi+F1e5eJFfUj
 Lf741852XOqFCLCgVVLS4ywEd826qPrCM7oUPvZBvIXPMQhKV/dpXs2PxbMt4wIrKTKuftlU
 Xt8WZzxZUv29Iw9lGbmLwvj+eFDKt8CKZP7GsmgkkXPPUu2b3+JU7YVWGZinchihJ5oVD79q
 o4FX+PTkk03eLSnPkH/rN5CRXhXfCNTLc2n9KRqmhurf1MO9JcJUKSKn9vMuuVNwsxoqws/1
 izkAhYDkgum3xUq62yiMxheVV8mZr4nxVpTAMDmFQzAN6QLCWp30JoiSg==
IronPort-HdrOrdr: A9a23:4Ym56K475pf6tahSFQPXwMrXdLJyesId70hD6qhwISY1TiW9rb
 HIoB17726RtN9/Yh0dcLy7V5VoBEmsk6KdgrNhWItKPjOW21dARbsKheCJrgEIWReOlNK1vZ
 0QCpSWY+eRMbEVt6jH3DU=
X-IronPort-AV: E=Sophos;i="5.90,223,1643691600"; 
   d="scan'208";a="67013688"
Date: Wed, 30 Mar 2022 18:15:14 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Chuck Zmudzinski <brchuckz@netscape.net>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH] tools/libs/light/libxl_pci.c: explicitly grant
 access to Intel IGD opregion
Message-ID: <YkSQIoYhomhNKpYR@perard.uk.xensource.com>
References: <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz.ref@netscape.net>
 <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz@netscape.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz@netscape.net>

Hi Chuck,

On Sun, Mar 13, 2022 at 11:41:37PM -0400, Chuck Zmudzinski wrote:
> When gfx_passthru is enabled for the Intel IGD, hvmloader maps the IGD
> opregion to the guest but libxl does not grant the guest permission to

I'm not reading the same thing when looking at code in hvmloader. It
seems that hvmloader allocate some memory for the IGD opregion rather
than mapping it.


tools/firmware/hvmloader/pci.c:184
    if ( vendor_id == 0x8086 )
    {
        igd_opregion_pgbase = mem_hole_alloc(IGD_OPREGION_PAGES);
        /*
         * Write the the OpRegion offset to give the opregion
         * address to the device model. The device model will trap
         * and map the OpRegion at the give address.
         */
        pci_writel(vga_devfn, PCI_INTEL_OPREGION,
                   igd_opregion_pgbase << PAGE_SHIFT);
    }

I think this write would go through QEMU, does it do something with it?
(I kind of replying to this question at the end of the mail.)

Is this code in hvmloader actually run in your case?

> Currently, because of another bug in Qemu upstream, this crash can
> only be reproduced using the traditional Qemu device model, and of

qemu-traditional is a bit old... What is the bug in QEMU? Do you have a
link to a patch/mail?

> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> index 4bbbfe9f16..a4fc473de9 100644
> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -2531,6 +2572,37 @@ int libxl__grant_vga_iomem_permission(libxl__gc *gc, const uint32_t domid,
>                    domid, vga_iomem_start, (vga_iomem_start + 0x20 - 1));
>              return ret;
>          }
> +
> +        /* If this is an Intel IGD, allow access to the IGD opregion */
> +        if (!libxl__is_igd_vga_passthru(gc, d_config)) return 0;
> +
> +        uint32_t igd_opregion = sysfs_dev_get_igd_opregion(gc, pci);
> +        uint32_t error = 0xffffffff;
> +        if (igd_opregion == error) break;
> +
> +        vga_iomem_start = ( (uint64_t) igd_opregion ) >> XC_PAGE_SHIFT;
> +        ret = xc_domain_iomem_permission(CTX->xch, stubdom_domid,
> +                                         vga_iomem_start,
> +                                         IGD_OPREGION_PAGES, 1);
> +        if (ret < 0) {
> +            LOGED(ERROR, domid,
> +                  "failed to give stubdom%d access to iomem range "
> +                  "%"PRIx64"-%"PRIx64" for IGD passthru",
> +                  stubdom_domid, vga_iomem_start, (vga_iomem_start +
> +                                                IGD_OPREGION_PAGES - 1));
> +            return ret;
> +        }
> +        ret = xc_domain_iomem_permission(CTX->xch, domid,
> +                                         vga_iomem_start,
> +                                         IGD_OPREGION_PAGES, 1);

Here, you seems to add permission to an address that is read from the
pci config space of the device, but as I've pointed above hvmloader
seems to overwrite this address. It this call to
xc_domain_iomem_permission() does actually anything useful?
Or is it by luck that the address returned by
sysfs_dev_get_igd_opregion() happened to be the address that hvmloader
is going to write?

Or maybe hvmloader doesn't actually do anything?


Some more though on that, looking at QEMU, it seems that there's already
a call to xc_domain_iomem_permission(), in igd_write_opregion(). So
adding one in libxl would seems redundant, or maybe it the one for the
device model's domain that's needed  (named 'stubdom_domid' here)?

Thanks,

-- 
Anthony PERARD

