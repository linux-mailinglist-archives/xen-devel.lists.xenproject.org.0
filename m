Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B660B2CED26
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 12:38:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44585.79897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9PM-0004J8-Fx; Fri, 04 Dec 2020 11:37:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44585.79897; Fri, 04 Dec 2020 11:37:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9PM-0004Ij-CX; Fri, 04 Dec 2020 11:37:52 +0000
Received: by outflank-mailman (input) for mailman id 44585;
 Fri, 04 Dec 2020 11:37:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OO73=FI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kl9PK-0004Ie-Uh
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 11:37:50 +0000
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0096801f-e8dd-4030-959d-9f7713db16a7;
 Fri, 04 Dec 2020 11:37:50 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a3so6716665wmb.5
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 03:37:50 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id a12sm3178214wrq.58.2020.12.04.03.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 03:37:49 -0800 (PST)
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
X-Inumbo-ID: 0096801f-e8dd-4030-959d-9f7713db16a7
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cFZURopZcAIzrqA+B6SryNkbfjCB4Ovz/Lugkvxi3a0=;
        b=JDi4hwy6jo8B4cgtxjNTwC7/q8Pjdbb2PJrWqSxTYC9tDU9NDtPbLBws9SedazHWPY
         csMDZl4RWSqDKI6mulYmtyDZKYGnPXzN/fVB80IoPQUivpMYkG4PrHZ8soHjGHes8MHT
         nrkg8hr40Peg5s0H8YQpin1sHTAmuk3loVyuaa80Rqa+yBitPT8sxlCdsai/cXnGAO86
         FnFJpiHe0xJql2ndp3F3g+ZXkqp7+A+aOpIsitYzvH+y6rpbDlmktIfS1q/rTt8ypRqd
         OcCVbAg7k/Fb2MIW2NEReVqmLYJ6oGQ2jG2NvzoJS7Q/UWyFBeYYF/yBr+BWuduG5Fqm
         czHQ==
X-Gm-Message-State: AOAM532z5OPLbjmkCe3nv1HtEaMMqqgwXoJwSW+tXXI6BCukPNpXUhyW
	aUi7AlUQp1VQwGpHY0aEe3Y=
X-Google-Smtp-Source: ABdhPJydnh21yTEIz/RPzMRWYbNnc813Cqojl5BPWFOtDOIQI5tcfuSrHN/uUYCoiWoMAuyiKlX7UA==
X-Received: by 2002:a1c:bd43:: with SMTP id n64mr3723316wmf.169.1607081869594;
        Fri, 04 Dec 2020 03:37:49 -0800 (PST)
Date: Fri, 4 Dec 2020 11:37:47 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	David Scott <dave@recoil.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v5 21/23] xl / libxl: support naming of assignable devices
Message-ID: <20201204113747.figsnjdsvifdgezl@liuwe-devbox-debian-v2>
References: <20201203142534.4017-1-paul@xen.org>
 <20201203142534.4017-22-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203142534.4017-22-paul@xen.org>
User-Agent: NeoMutt/20180716

On Thu, Dec 03, 2020 at 02:25:32PM +0000, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> This patch modifies libxl_device_pci_assignable_add() to take an optional
> 'name' argument, which (if supplied) is saved into xenstore and can hence be
> used to refer to the now-assignable BDF in subsequent operations. To
> facilitate this, a new libxl_device_pci_assignable_name2bdf() function is
> added.
> 
> The xl code is modified to allow a name to be specified in the
> 'pci-assignable-add' operation and also allow an option to be specified to
> 'pci-assignable-list' requesting that names be displayed. The latter is
> facilitated by a new libxl_device_pci_assignable_bdf2name() function. Finally
> xl 'pci-assignable-remove' is modified to that either a name or BDF can be
> supplied. The supplied 'identifier' is first assumed to be a name, but if
> libxl_device_pci_assignable_name2bdf() fails to find a matching BDF the
> identifier itself will be parsed as a BDF. Names my only include printable
> characters and may not include whitespace.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Acked-by: Christian Lindig <christian.lindig@citrix.com>
> ---
> Cc: Ian Jackson <iwj@xenproject.org>
> Cc: Wei Liu <wl@xen.org>
> Cc: David Scott <dave@recoil.org>
> Cc: Anthony PERARD <anthony.perard@citrix.com>
> 
> v4:
>  - Fix unitialized return value in libxl_device_pci_assignable_name2bdf()
>    that was discovered in CI
> ---
>  tools/include/libxl.h                | 19 +++++-
>  tools/libs/light/libxl_pci.c         | 86 ++++++++++++++++++++++++++--
>  tools/ocaml/libs/xl/xenlight_stubs.c |  3 +-
>  tools/xl/xl_cmdtable.c               | 12 ++--
>  tools/xl/xl_pci.c                    | 80 ++++++++++++++++++--------
>  5 files changed, 164 insertions(+), 36 deletions(-)
> 
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index 5703fdf367c5..4025d3a3d437 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -476,6 +476,14 @@
>   */
>  #define LIBXL_HAVE_PCI_ASSIGNABLE_BDF 1
>  
> +/*
> + * LIBXL_HAVE_PCI_ASSIGNABLE_NAME indicates that the
> + * libxl_device_pci_assignable_add() function takes a 'name' argument
> + * and that the libxl_device_pci_assignable_name2bdf() and
> + * libxl_device_pci_assignable_bdf2name() functions are defined.
> + */
> +#define LIBXL_HAVE_PCI_ASSIGNABLE_NAME 1
> +
>  /*
>   * libxl ABI compatibility
>   *
> @@ -2385,11 +2393,18 @@ int libxl_device_events_handler(libxl_ctx *ctx,
>   * added or is not bound, the functions will emit a warning but return
>   * SUCCESS.
>   */
> -int libxl_device_pci_assignable_add(libxl_ctx *ctx, libxl_pci_bdf *pcibdf, int rebind);
> -int libxl_device_pci_assignable_remove(libxl_ctx *ctx, libxl_pci_bdf *pcibdf, int rebind);
> +int libxl_device_pci_assignable_add(libxl_ctx *ctx, libxl_pci_bdf *pcibdf,
> +                                    const char *name, int rebind);
> +int libxl_device_pci_assignable_remove(libxl_ctx *ctx, libxl_pci_bdf *pcibdf,
> +                                       int rebind);
>  libxl_pci_bdf *libxl_device_pci_assignable_list(libxl_ctx *ctx, int *num);
>  void libxl_device_pci_assignable_list_free(libxl_pci_bdf *list, int num);
>  
> +libxl_pci_bdf *libxl_device_pci_assignable_name2bdf(libxl_ctx *ctx,
> +                                                    const char *name);
> +char *libxl_device_pci_assignable_bdf2name(libxl_ctx *ctx,
> +                                           libxl_pci_bdf *pcibdf);

Again, these function require shims to be backward compatible.

Wei.

