Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D59A1648720
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 17:59:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458122.715992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3gii-00052E-7X; Fri, 09 Dec 2022 16:59:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458122.715992; Fri, 09 Dec 2022 16:59:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3gii-0004zw-4L; Fri, 09 Dec 2022 16:59:32 +0000
Received: by outflank-mailman (input) for mailman id 458122;
 Fri, 09 Dec 2022 16:59:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nv8v=4H=citrix.com=prvs=3352c5006=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1p3gif-0004rD-W9
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 16:59:30 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6c35152-77e2-11ed-8fd2-01056ac49cbb;
 Fri, 09 Dec 2022 17:59:28 +0100 (CET)
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
X-Inumbo-ID: d6c35152-77e2-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670605168;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=htIAO2coBShrEeIUMq+vM/qAykLaw22tkEuGWRwZTjg=;
  b=HkuOIWE12TkCeuK1PfHlNWQNaVgqHRuUxYyZ+gSwo30vfIOIgHofWfid
   uc7L85LdrbsyAjywd3ulyXN4Z3UC7tOSTVa0wQv1zW26rbwlvL7PR040X
   RHjLHq1TtQgm9gl8f5XHb1EZ0eJhtFef84EM/h5TJ1Q6o0gTAjr35Zx8U
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 87123243
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:oA+OhKAunKPpPBVW/8njw5YqxClBgxIJ4kV8jS/XYbTApGwi0GcEy
 GcaC2jQafuMZzT8fY13bt60p0gC65DcydNlQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6o4WlA7wRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwoOxFJn9Dq
 OIieRchbRGxqKG5mJuKc7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2o0BPjDS0Qn1lM/AZQinOCulz/nfidRsl69rqsr+WnDigd21dABNfKFJYXQHp8JxS50o
 ErGvFuhGC4CHea89giBtVWRhvORoC3SDdd6+LqQqacx3Qz7KnYoIDkLXlL9j/C/gUO6X893I
 lYRvCEpqMAa60iDXtT7GRqirxasvBEGXMFLO/Yn8wzLwa3Riy6bG2wFQzhpeNEg8sgsSlQCy
 F6KhdrsQzNmqr2KQHa1/7KY6zi1PEA9PWIEICMJUwYBy93iu50oyALCSM55F6y4hcGzHiv/q
 xiRtzQ3jbgXic8N1o248ErBjjbqoYLGJjPZ/S2OADjjtFkgItf4Ocr4sjA38MqsMq7DRGumo
 nVZhfLPy8wNDKOi1yPVadQ0SeTBC+m+DBXQhltmHp8E/jur+mK+cY043AySNHuFIe5fJ2a3P
 Ra7VRd5ocYKYSD0NfMfj5eZUZxC8ET2KTjyuhk4hPJqa4M5SgKI9ToGiaW4jzG0yxhEfU3S1
 P6mnSeQ4ZQyU/wPINmeHb11PVoXKscWmwvuqWjTlUjP7FZnTCf9pU05GFWPdPsly6iPvR/Y9
 d1SX+PTlUoHDbeiPnGGq9VKRbzvEZTcLcmnw/G7i8bZelY2cI3fI6C5LUwdl3xNwP0Oy7agE
 oCVUU5E0lvv7UAr2i3TAk2PnIjHBM4lxVpiZHxEALpd8yR7CWpZxPtFJsRfkHhO3LAL8MOYu
 NFfIJ3QWaUSGmuak9nfBLGkxLFfmN2QrVrmF0KYjPIXJPaMmyShFgfYQzbS
IronPort-HdrOrdr: A9a23:D4J0v6/RtLQuJ9h5YZZuk+AcI+orL9Y04lQ7vn2ZKSY5TiX4rb
 HKoB1/73XJYVkqN03I9ervBEDiewK/yXcW2+ks1N6ZNWGLhILBFupfBODZsl7d8kPFl9K01c
 1bAtJD4N+bNykGsS4tijPIb+rJw7O8gd+Vbf+19QYIcenzAZsQlzuQDGygYypLbTgDP7UVPr
 yG6PFKojKxEE5nFfhSVhE+Lo7+T8SgruOeXSI7
X-IronPort-AV: E=Sophos;i="5.96,230,1665460800"; 
   d="scan'208";a="87123243"
Date: Fri, 9 Dec 2022 16:59:18 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Vikram Garhwal <vikram.garhwal@amd.com>
CC: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>, <Luca.Fancellu@arm.com>, Wei Liu <wl@xen.org>, Juergen
 Gross <jgross@suse.com>
Subject: Re: [XEN][RFC PATCH v4 15/16] tools/libs/light: Implement new libxl
 functions for device tree overlay ops
Message-ID: <Y5NpZiWZOssDwX5Z@perard.uk.xensource.com>
References: <20221207061815.7404-1-vikram.garhwal@amd.com>
 <20221207061815.7404-9-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221207061815.7404-9-vikram.garhwal@amd.com>

On Tue, Dec 06, 2022 at 10:18:14PM -0800, Vikram Garhwal wrote:
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index 2321a648a5..82fc7ce6b9 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -245,6 +245,11 @@
>   */
>  #define LIBXL_HAVE_DEVICETREE_PASSTHROUGH 1
>  
> +/**
> + * This means Device Tree Overlay is supported.
> + */
> +#define LIBXL_HAVE_DT_OVERLAY 1
> +
>  /*
>   * libxl_domain_build_info has device_model_user to specify the user to
>   * run the device model with. See docs/misc/qemu-deprivilege.txt.
> @@ -2448,6 +2453,9 @@ libxl_device_pci *libxl_device_pci_list(libxl_ctx *ctx, uint32_t domid,
>                                          int *num);
>  void libxl_device_pci_list_free(libxl_device_pci* list, int num);
>  
> +int libxl_dt_overlay(libxl_ctx *ctx, void *overlay,
> +                     uint32_t overlay_size, uint8_t overlay_op);
> +

Could you guard both the LIBXL_HAVE_* macro and this prototype with "#if
arm"? Since the dt_overlay operation to libxl built on arm.

>  /*
>   * Turns the current process into a backend device service daemon
>   * for a driver domain.
> diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
> index 374be1cfab..2fde58246e 100644
> --- a/tools/libs/light/Makefile
> +++ b/tools/libs/light/Makefile
> @@ -111,6 +111,9 @@ OBJS-y += _libxl_types.o
>  OBJS-y += libxl_flask.o
>  OBJS-y += _libxl_types_internal.o
>  
> +# Device tree overlay is enabled only for ARM architecture.
> +OBJS-$(CONFIG_ARM) += libxl_dt_overlay.o
> +
>  ifeq ($(CONFIG_LIBNL),y)
>  CFLAGS_LIBXL += $(LIBNL3_CFLAGS)
>  endif
> diff --git a/tools/libs/light/libxl_dt_overlay.c b/tools/libs/light/libxl_dt_overlay.c
> new file mode 100644
> index 0000000000..38cab880a0
> --- /dev/null
> +++ b/tools/libs/light/libxl_dt_overlay.c
> +#include "libxl_osdeps.h" /* must come before any other headers */
> +#include "libxl_internal.h"
> +#include <libfdt.h>
> +#include <xenguest.h>
> +#include <xenctrl.h>

Don't you need just xenctrl.h and not xenguest.h? (They both already are
libxl_internal.h so I'm not sure if xenguest.h is needed., but
xc_dt_overlay() is in xenctrl.h)


Thanks,

-- 
Anthony PERARD

