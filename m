Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75164546932
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 17:12:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346502.572319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzgJF-0001Zu-Pg; Fri, 10 Jun 2022 15:12:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346502.572319; Fri, 10 Jun 2022 15:12:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzgJF-0001Xe-M5; Fri, 10 Jun 2022 15:12:25 +0000
Received: by outflank-mailman (input) for mailman id 346502;
 Fri, 10 Jun 2022 15:12:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FaZi=WR=citrix.com=prvs=15310cb4b=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nzgJD-0001XY-V0
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 15:12:23 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b898bafb-e8cf-11ec-8901-93a377f238d6;
 Fri, 10 Jun 2022 17:12:22 +0200 (CEST)
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
X-Inumbo-ID: b898bafb-e8cf-11ec-8901-93a377f238d6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654873942;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z5G5XG2PyEjAN59F561TtSE7MIpzTyd/w3HSrsxR6tg=;
  b=DIXpr4IvmdtvB+tSLzpLYALoHcqaUkeLD27nOhhk+DO8/wyY7Gj2ewG8
   IksaNJPrn4oNBePubKBznRMGEW/HZa2fmcMjnYY7+zOms73TaD6M+E9kc
   NrzxSQqRc6lU8Ja/dwSyAGWw+VNXOdfhUUlWsIXiGXo/QVzyRgHZzNiqC
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 73740176
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:38XcNa+YQqNBEXtkTJxsDrUDf36TJUtcMsCJ2f8bNWPcYEJGY0x3z
 mIZWGGAaPnfYDP3eNkibI228E8OvJSBz9RhHAo4rXw8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ44f5fs7Rh2NQw34HhW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnd+xUghuIvGUoe0AdABGOHFxM6JA9oaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFIoZpnFnyyCfFfs8SIrPa67L+cVZzHE7gcUm8fP2O
 JFGNWI2M0qojxtnMU8yWK4wwOiU12DRSWV8jl2/gZQ97D2GpOB2+Oe0a4eEEjCQfu1OhVqRr
 G/C+2X/AzkZOcaZxD7D9Wij7sfNkjn8Q5k6D6Cj+7hhh1j77m4ODBwbU3OrrP//jVSxM/pVJ
 lYI4CMooe43/VayU9jmdxSipTiPuRt0c+RXF+o2+QSc0J3+6gySBnUHZjNZYdlgv8gzLRQ62
 1nMk973CDhHtLyOVWnb5rqStSm1OyUeMSkFfyBsZQwB7tr4vJAojjrAS99iFOi+ididMTb0z
 jORpS4ynYIPnNUL3KW2+1PAqz+0r52PRQkwji3NWXmv9AR+Z4iNaImh6Fyd5vFFRK6GSnGRs
 X5CnNKRhN3iFrnUynbLGr9UWuj0ubDVa1UwnGKDAbFi9i+ivGL/JblZ/RZnOmw5PcgLfzHQN
 Rq7VRxq2HNDAJe7RfYpPt7hUZlxkfaI+cfNDa6NMIcXCnRlXErepXw1OxbNt4z4uBJ0+ZzTL
 6t3ZipF4ZwyLa18hAS7SO4GuVPA7nBvnDiDLXwXIvnO7FZ/WJJ2Ye1cWLd2RrplhJ5oWS2Mm
 zqlC+OEyg9ETMr1aTTN/IgYIDgidCZmWc+n+pIILLXZfGKK/V3N7NeAqY7NhqQ/x/gF/gs21
 irVtrBkJKrX2iScdFTihoFLY7LzR5dvxU8G0dgXFQ/wgRALON/3hI9GLsdfVeR2r4RLkK8rJ
 8Tpju3dW5yjvByco2RDBXQ8xaQ/HCmWafWmZXP4OGZuJsA5HWQkOLbMJ2PSycXHNQLv3eNWn
 lFq/lqGKXbfb2yO1PrrVc8=
IronPort-HdrOrdr: A9a23:1UZIrqhVEGNWSbbW7CmXn0IFZnBQXtgji2hC6mlwRA09TySZ//
 rOoB0+726StN9xYgBFpTnuAsW9qB/nmqKdpLNhW4tKPzOW3VdATrsSjrcKqgeIc0aVm9K1l5
 0QEZSWYOeAdGSS5vyb3ODXKbgd/OU=
X-IronPort-AV: E=Sophos;i="5.91,290,1647316800"; 
   d="scan'208";a="73740176"
Date: Fri, 10 Jun 2022 16:12:11 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, "Juergen
 Gross" <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"Julien Grall" <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH V9 1/2] libxl: Add support for Virtio disk configuration
Message-ID: <YqNbwtWrIdYWRG9c@perard.uk.xensource.com>
References: <1654106261-28044-1-git-send-email-olekstysh@gmail.com>
 <1654106261-28044-2-git-send-email-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1654106261-28044-2-git-send-email-olekstysh@gmail.com>

On Wed, Jun 01, 2022 at 08:57:40PM +0300, Oleksandr Tyshchenko wrote:
> diff --git a/tools/libs/light/libxl_disk.c b/tools/libs/light/libxl_disk.c
> index a5ca778..e90bc25 100644
> --- a/tools/libs/light/libxl_disk.c
> +++ b/tools/libs/light/libxl_disk.c
> @@ -163,6 +163,25 @@ static int libxl__device_disk_setdefault(libxl__gc *gc, uint32_t domid,
>      rc = libxl__resolve_domid(gc, disk->backend_domname, &disk->backend_domid);
>      if (rc < 0) return rc;
>  
> +    if (disk->specification == LIBXL_DISK_SPECIFICATION_UNKNOWN)
> +        disk->specification = LIBXL_DISK_SPECIFICATION_XEN;
> +
> +    if (disk->specification == LIBXL_DISK_SPECIFICATION_XEN &&
> +        disk->transport != LIBXL_DISK_TRANSPORT_UNKNOWN) {
> +        LOGD(ERROR, domid, "Transport is only supported for specification virtio");
> +        return ERROR_FAIL;

Could you return ERROR_INVAL instead?

> +    }
> +
> +    /* Force transport mmio for specification virtio for now */
> +    if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO) {
> +        if (!(disk->transport == LIBXL_DISK_TRANSPORT_UNKNOWN ||
> +              disk->transport == LIBXL_DISK_TRANSPORT_MMIO)) {
> +            LOGD(ERROR, domid, "Unsupported transport for specification virtio");
> +            return ERROR_FAIL;

Same here.

> +        }
> +        disk->transport = LIBXL_DISK_TRANSPORT_MMIO;
> +    }
> +
>      /* Force Qdisk backend for CDROM devices of guests with a device model. */
>      if (disk->is_cdrom != 0 &&
>          libxl__domain_type(gc, domid) == LIBXL_DOMAIN_TYPE_HVM) {
> @@ -575,6 +660,41 @@ cleanup:
>      return rc;
>  }
>  
> +static int libxl__device_disk_get_path(libxl__gc *gc, uint32_t domid,
> +                                       char **path)
> +{
> +    const char *dir;
> +    int rc;
> +
> +    /*
> +     * As we don't know exactly what device kind to be used here, guess it
> +     * by checking the presence of the corresponding path in Xenstore.
> +     * First, try to read path for vbd device (default) and if not exists
> +     * read path for virtio_disk device. This will work as long as both Xen PV
> +     * and Virtio disk devices are not assigned to the same guest.
> +     */
> +    *path = GCSPRINTF("%s/device/%s",
> +                      libxl__xs_libxl_path(gc, domid),
> +                      libxl__device_kind_to_string(LIBXL__DEVICE_KIND_VBD));
> +
> +    rc = libxl__xs_read_checked(gc, XBT_NULL, *path, &dir);
> +    if (rc)
> +        return rc;
> +
> +    if (dir)
> +        return 0;
> +
> +    *path = GCSPRINTF("%s/device/%s",
> +                      libxl__xs_libxl_path(gc, domid),
> +                      libxl__device_kind_to_string(LIBXL__DEVICE_KIND_VIRTIO_DISK));
> +
> +    rc = libxl__xs_read_checked(gc, XBT_NULL, *path, &dir);
> +    if (rc)
> +        return rc;
> +
> +    return 0;

I still don't like this implementation of get_path() which return a
different answer depending on the environment which can change from one
call to the next. I think get_path() was introduced when the path for
the kind of device didn't correspond to the common path which other kind
of devices uses. And when get_path() is implemented, it always returns
the same answer (see libxl_pci.c for the only implementation).

I don't really know how to deal with a type of device that have two
different frontend kind at the moment. (But maybe there's something in
libxl_usb.c which could be useful as a potential example, but one of the
kind doesn't use xenstore so is probably easier to deal with.). So I
guess we are stuck with an implementation of get_path() which may return
a different answer depending on thing outside of libxl's full control.

So, could you at least make it much harder to have libxl's view of a
guest in a weird state? I mean:
- always check both xenstore paths
  -> if both exist, return an error
  -> if only one exist, return that one.
  -> default to the "vbd" kind, otherwise.

That would be better than the current implementation which returns the
"virtio" path by default.

Thanks,

-- 
Anthony PERARD

