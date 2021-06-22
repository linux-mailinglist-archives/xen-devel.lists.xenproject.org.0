Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C2E3B0A0F
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jun 2021 18:13:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145965.268498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvj20-0003Ql-VB; Tue, 22 Jun 2021 16:13:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145965.268498; Tue, 22 Jun 2021 16:13:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvj20-0003Ob-RX; Tue, 22 Jun 2021 16:13:44 +0000
Received: by outflank-mailman (input) for mailman id 145965;
 Tue, 22 Jun 2021 16:13:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dK4H=LQ=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1lvj1z-0003OV-Pc
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 16:13:43 +0000
Received: from MTA-14-4.privateemail.com (unknown [198.54.118.206])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 40282eeb-9681-41e0-b222-81fd7873ae37;
 Tue, 22 Jun 2021 16:13:43 +0000 (UTC)
Received: from mta-14.privateemail.com (localhost [127.0.0.1])
 by mta-14.privateemail.com (Postfix) with ESMTP id 56BFD80163
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jun 2021 12:13:42 -0400 (EDT)
Received: from mail-wm1-f52.google.com (unknown [10.20.151.244])
 by mta-14.privateemail.com (Postfix) with ESMTPA id 1FA4D80168
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jun 2021 12:13:42 -0400 (EDT)
Received: by mail-wm1-f52.google.com with SMTP id n23so13193330wms.2
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jun 2021 09:13:42 -0700 (PDT)
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
X-Inumbo-ID: 40282eeb-9681-41e0-b222-81fd7873ae37
X-Gm-Message-State: AOAM530IeQ20jwFQvNhChPKEzRIFGWKgci1sahA6VLkcAzlwLPcN7cHn
	FSuwULf3Th/YvCF1jCeJcY/FNA+N41Jxso0xwD8=
X-Google-Smtp-Source: ABdhPJyP/1rJci1YVdsFmGAugekVzVntgX4LKIBtbym5cNwQwUKlBtl4cOswNNeD08+p78ehn4O4nqCHHYt1zldo6Dk=
X-Received: by 2002:a7b:c149:: with SMTP id z9mr5160659wmi.77.1624378420854;
 Tue, 22 Jun 2021 09:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210507152836.20026-1-tamas@tklengyel.com>
In-Reply-To: <20210507152836.20026-1-tamas@tklengyel.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 22 Jun 2021 12:13:05 -0400
X-Gmail-Original-Message-ID: <CABfawhnWJkvq9z1vB2mLwto7GV=xGu181w6LzFh6NeX-qXdbcQ@mail.gmail.com>
Message-ID: <CABfawhnWJkvq9z1vB2mLwto7GV=xGu181w6LzFh6NeX-qXdbcQ@mail.gmail.com>
Subject: Re: [PATCH] tools/misc/xen-vmtrace: handle more signals and install
 by default
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

Patch ping.

On Fri, May 7, 2021 at 11:28 AM Tamas K Lengyel <tamas@tklengyel.com> wrote:
>
> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> ---
>  tools/misc/Makefile      |  2 +-
>  tools/misc/xen-vmtrace.c | 12 +++++++++---
>  2 files changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/tools/misc/Makefile b/tools/misc/Makefile
> index 2b683819d4..c32c42d546 100644
> --- a/tools/misc/Makefile
> +++ b/tools/misc/Makefile
> @@ -25,6 +25,7 @@ INSTALL_SBIN-$(CONFIG_X86)     += xen-lowmemd
>  INSTALL_SBIN-$(CONFIG_X86)     += xen-memshare
>  INSTALL_SBIN-$(CONFIG_X86)     += xen-mfndump
>  INSTALL_SBIN-$(CONFIG_X86)     += xen-ucode
> +INSTALL_SBIN-$(CONFIG_X86)     += xen-vmtrace
>  INSTALL_SBIN                   += xencov
>  INSTALL_SBIN                   += xenhypfs
>  INSTALL_SBIN                   += xenlockprof
> @@ -51,7 +52,6 @@ TARGETS_COPY += xenpvnetboot
>  TARGETS_BUILD := $(filter-out $(TARGETS_COPY),$(TARGETS_ALL))
>
>  # ... including build-only targets
> -TARGETS_BUILD-$(CONFIG_X86)    += xen-vmtrace
>  TARGETS_BUILD += $(TARGETS_BUILD-y)
>
>  .PHONY: all build
> diff --git a/tools/misc/xen-vmtrace.c b/tools/misc/xen-vmtrace.c
> index 35d14c6a9b..5b688a54af 100644
> --- a/tools/misc/xen-vmtrace.c
> +++ b/tools/misc/xen-vmtrace.c
> @@ -44,7 +44,7 @@ static size_t size;
>  static char *buf;
>
>  static sig_atomic_t interrupted;
> -static void int_handler(int signum)
> +static void close_handler(int signum)
>  {
>      interrupted = 1;
>  }
> @@ -78,8 +78,14 @@ int main(int argc, char **argv)
>      int rc, exit = 1;
>      xenforeignmemory_resource_handle *fres = NULL;
>
> -    if ( signal(SIGINT, int_handler) == SIG_ERR )
> -        err(1, "Failed to register signal handler\n");
> +    struct sigaction act;
> +    act.sa_handler = close_handler;
> +    act.sa_flags = 0;
> +    sigemptyset(&act.sa_mask);
> +    sigaction(SIGHUP,  &act, NULL);
> +    sigaction(SIGTERM, &act, NULL);
> +    sigaction(SIGINT,  &act, NULL);
> +    sigaction(SIGALRM, &act, NULL);
>
>      if ( argc != 3 )
>      {
> --
> 2.27.0
>

