Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FBF4DCD71
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 19:19:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291721.495358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUuiC-0001ge-PV; Thu, 17 Mar 2022 18:19:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291721.495358; Thu, 17 Mar 2022 18:19:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUuiC-0001dz-Lm; Thu, 17 Mar 2022 18:19:00 +0000
Received: by outflank-mailman (input) for mailman id 291721;
 Thu, 17 Mar 2022 18:18:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H+7p=T4=citrix.com=prvs=06815c04c=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nUuiB-0001dt-O5
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 18:18:59 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b56eb452-a61e-11ec-853c-5f4723681683;
 Thu, 17 Mar 2022 19:18:58 +0100 (CET)
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
X-Inumbo-ID: b56eb452-a61e-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647541138;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H0krJZQCUjhshiW2Tsye1oKIZEcxBlTVD5mRv3wbdOg=;
  b=X7Ppf3xmSpn4SifseoLEG5Jq4BVF8dsVuMpkyhCK4iGb6VmYXdqWsiIA
   Dx2xZsIFZdyil1GinQFZK0UKW9WrImBnvQMiwgLCVmqS2/Y63CDAXWE+A
   exQqUgEkIoGaS+Be4URin2oaMjQg+VMh9Gg5eVFZsXM1RUDlky1Kek5iP
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 66458419
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:pZqywq0vjjTBn95dUfbD5TRxkn2cJEfYwER7XKvMYLTBsI5bpzdVy
 zMfUWDTOquMYDHwLdh+bd+0oxwE6JXdyodiSQdrpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tUx3oDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /13uL+SGCp0GpeTxvxMEDADITkmN7xJreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHiOp8fvXdxiynUF/88TbjIQrnQ5M8e1zA17ixLNaiAO
 5dJNWM+BPjGSzRmPFQ4C8M5p6C11yHYIwNl83+Vi6VitgA/yyQuieOwYbI5YOeiT8hPglyRo
 G6A+m3jGwwbL/SW0z/D+XWp7sfRmif8VJMXBaeP/Pdgi12OxUQeEBQTE1C8pJGRlUqWS99Zb
 UsO9UIGr7U29UGtZsnwWVu/unHslhAaRpxOEu4g4QSl2qvQ4gCJQGMDS1ZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9UQAONnMLbyIASQoD4vHgrZs1gxaJScxseJNZlfWsR2u2m
 WrT6nFj2fND1qbnyplX43j9jhGO97WUajRquB2GHUv+3Bshbp+qMtnABUfg0d5MK4OQT1+kt
 XcCmtSD4O1mMaxhhBBhU81WQuj3uq/t3Cn0xAc2QsJ/r2jFF2uLJ9g43d1oGKt+3i/okxfNa
 VSbhw5e7YQ70JCCPf4uONLZ5yjHIMHd+TXZuhL8M4ImjntZLlbvEMRSiai4hTyFfK8Ey/1XB
 HtjWZzwZUv28Iw+pNZMe88T0KUw2gc1zn7JSJbwwnyPiOTCOyLIFu5fbgPRM4jVCZ9oRi2Pr
 76z0OPQl31ivBDWOHGLoeb/03hXRZTEOXwGg5MOLbPSSuaXMGogF+XQ0dscl39NxMxoehPz1
 ijlACdwkQOn7VWecFniQi0zOdvHAMckxVpmbHNEALpd8yV6CWpZxPxELMVfkHhO3LEL8MOYu
 NFeIpTeWKsTEmqbk9nfBLGkxLFfmN2QrVrmF0KYjPIXJPaMmyShFgfYQzbS
IronPort-HdrOrdr: A9a23:CzVGTakMy14PofXPSf1fu9l5V/3pDfIs3DAbv31ZSRFFG/Fxl6
 iV8sjz8SWE7Ar5OUtQ/OxoV5PsfZqxz/JICMwqTNCftWrdyQmVxeNZjbcKqgeIc0aVygce79
 YCT0EXMqyXMbEQt6fHCWeDfOod/A==
X-IronPort-AV: E=Sophos;i="5.90,188,1643691600"; 
   d="scan'208";a="66458419"
Date: Thu, 17 Mar 2022 18:18:52 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Vikram Garhwal <fnu.vikram@xilinx.com>
CC: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>, <bertrand.marquis@arm.com>, <volodymyr_babchuk@epam.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [XEN][RFC PATCH v3 14/14] tools/xl: Add new xl command overlay
 for device tree overlay support
Message-ID: <YjN7jJldNceEU2uq@perard.uk.xensource.com>
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
 <20220308194704.14061-15-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220308194704.14061-15-fnu.vikram@xilinx.com>

On Tue, Mar 08, 2022 at 11:47:04AM -0800, Vikram Garhwal wrote:
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> ---
>  tools/xl/xl.h           |  4 ++++
>  tools/xl/xl_cmdtable.c  |  6 ++++++
>  tools/xl/xl_vmcontrol.c | 45 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 55 insertions(+)
> 
> diff --git a/tools/xl/xl.h b/tools/xl/xl.h
> index c5c4bedbdd..604fd5bb94 100644
> --- a/tools/xl/xl.h
> +++ b/tools/xl/xl.h
> @@ -97,6 +97,9 @@ struct save_file_header {
>  
>  #define SAVEFILE_BYTEORDER_VALUE ((uint32_t)0x01020304UL)
>  
> +#define XL_DT_OVERLAY_ADD                   1
> +#define XL_DT_OVERLAY_REMOVE                2

These value would need to be part of libxl's API, rather than been
defined here. Could you create a new enum with both operation in
"libxl_types.idl", then have the libxl function convert them to the
hypercall operation? (So to be done in the previous patch.)

>  void save_domain_core_begin(uint32_t domid,
>                              int preserve_domid,
>                              const char *override_config_file,
> @@ -139,6 +142,7 @@ int main_shutdown(int argc, char **argv);
>  int main_reboot(int argc, char **argv);
>  int main_list(int argc, char **argv);
>  int main_vm_list(int argc, char **argv);
> +int main_dt_overlay(int argc, char **argv);
>  int main_create(int argc, char **argv);
>  int main_config_update(int argc, char **argv);
>  int main_button_press(int argc, char **argv);
> diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
> index 661323d488..5812d19db8 100644
> --- a/tools/xl/xl_cmdtable.c
> +++ b/tools/xl/xl_cmdtable.c
> @@ -20,6 +20,12 @@
>  #include "xl.h"
>  
>  const struct cmd_spec cmd_table[] = {
> +    { "overlay",
> +      &main_dt_overlay, 1, 1,

I think the first "1" needs to be a "0", because it doesn't seems that
the command can do a "dry-run".

> +      "Add/Remove a device tree overlay",
> +      "add/remove <.dtbo>"
> +      "-h print this help\n"
> +    },

I don't think "overlay" is a good name for the command. Maybe
"dt-overlay" ? But we seem to mostly have "*-add" "*-remove" command (or
attach/detach), so maybe two new commands would be better:
"dt-overlay-add" and "dt-overlay-remove" rather than using a subcommand
for add/remove.


Also, could you add this/those commands later in "cmd_table"? I'd rather
keep "create" first when running `xl help`. So maybe at the end, or
some other place that kind of make sens?

>      { "create",
>        &main_create, 1, 1,
>        "Create a domain from config file <filename>",
> diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
> index 435155a033..76b969dc33 100644
> --- a/tools/xl/xl_vmcontrol.c
> +++ b/tools/xl/xl_vmcontrol.c
> @@ -1262,6 +1262,51 @@ int main_create(int argc, char **argv)
>      return 0;
>  }
>  
> +int main_dt_overlay(int argc, char **argv)
> +{
> +    const char *overlay_ops = argv[1];
> +    const char *overlay_config_file = argv[2];
> +    void *overlay_dtb = NULL;
> +    int rc;
> +    uint8_t op;
> +    int overlay_dtb_size = 0;
> +
> +    if (overlay_ops == NULL) {
> +        fprintf(stderr, "No overlay operation mode provided\n");
> +        return ERROR_FAIL;
> +    }
> +
> +    if (strcmp(overlay_ops, "add") == 0)
> +        op = XL_DT_OVERLAY_ADD;
> +    else if (strcmp(overlay_ops, "remove") == 0)
> +        op = XL_DT_OVERLAY_REMOVE;
> +    else {
> +        fprintf(stderr, "Invalid dt overlay operation\n");
> +        return ERROR_FAIL;
> +    }
> +
> +    if (overlay_config_file) {
> +        rc = libxl_read_file_contents(ctx, overlay_config_file,
> +                                      &overlay_dtb, &overlay_dtb_size);
> +
> +        if (rc) {
> +            fprintf(stderr, "failed to read the overlay device tree file %s\n",
> +                    overlay_config_file);
> +            free(overlay_dtb);
> +            return ERROR_FAIL;
> +        }
> +    } else {
> +        fprintf(stderr, "overlay dtbo file not provided\n");

Instead of making out of bound access to "argv", you could check that
"argc" have the expected value, and if not, print the help of the
command. If you look at main_save() for example, there is: "if(argc is
wrong value){help("save");} which would print the help for the
command.

> +        return ERROR_FAIL;
> +    }
> +
> +    rc = libxl_dt_overlay(ctx, overlay_dtb, overlay_dtb_size, op);
> +    if (rc)
> +        fprintf(stderr, "Overlay operation failed\n");

I'm not sure that this error message would be useful, as libxl should
already have printed something.

> +
> +    free(overlay_dtb);
> +    return rc;
> +}

Thanks,

-- 
Anthony PERARD

