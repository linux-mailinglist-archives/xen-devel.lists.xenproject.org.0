Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 921B9539BDE
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 06:01:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340190.565159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwFWp-0008D9-Sr; Wed, 01 Jun 2022 04:00:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340190.565159; Wed, 01 Jun 2022 04:00:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwFWp-0008AH-P5; Wed, 01 Jun 2022 04:00:15 +0000
Received: by outflank-mailman (input) for mailman id 340190;
 Wed, 01 Jun 2022 04:00:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KQRm=WI=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1nwFWo-0008AB-B5
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 04:00:14 +0000
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [2607:f8b0:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5479d1fa-e15f-11ec-837f-e5687231ffcc;
 Wed, 01 Jun 2022 06:00:12 +0200 (CEST)
Received: by mail-oi1-x22e.google.com with SMTP id i66so1072447oia.11
 for <xen-devel@lists.xenproject.org>; Tue, 31 May 2022 21:00:10 -0700 (PDT)
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
X-Inumbo-ID: 5479d1fa-e15f-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lkj/pxsJKw5W6oOFVXk/4v6PgU4wBSeI5wzKgRHDoP8=;
        b=iUZPqmIQeDatA5enBUNPteuPrcSMOC7wGcXRP945ChvRQNCbKx3Gpm++vqJtXyj3AH
         4yDkmo0TslxXKTnD/F7sJYc74pcS7P0zawr2PkC71SIoz1kVlSuSjHbTVaPHhMpHnP9W
         lmuXXbKy1o/iV9m/dTsI1/uf+agIOLDU21IEwim/dEHfImhns6T3Zw0flNtgO8VDr4Ns
         kTNAAI0f3KJi2v/qiF2d80S7ixgiLNEc3yGGC/Xgiz0utxHIO+QtztqPdGPBZkBkWPV2
         h1tISSFnVSvERQJh44dk77/OQX6BSfvW4VG9ZTp6XZ4UU+bGjsUgPIGQqL8hMzeSjIRx
         mbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lkj/pxsJKw5W6oOFVXk/4v6PgU4wBSeI5wzKgRHDoP8=;
        b=OoC1MDFTMKLQ04LcOyyK+u9oXJJXJdA+zmrmWmumqYZcCIuiBiJJQpPTgb3HGX+Wyp
         rAKmtUQ/9A3/2Pk6papechk9ew0p8GVFuMfwiL11rIhFJGQZfca1A53MyH2PGCD6nC+9
         rBZ7qkz4a9/tE1TJ5CqLp69RPSX7AXGUK1TAhjDet0b03mZQ2AJtW8tP5rvLDnQzCy9F
         tNFyeD1mVyt+HobdSJr1lkWx4qmObynxCe9PVJkAGjuKHnhpSAcGpgQPVXg0lHLM7aM7
         s1wID3fNBtOPmk/iNkaX9+esS7Rjv7u1EtVKo1RN3wliI5/OaFNCFKhrsdyU5jlevsKN
         tOGA==
X-Gm-Message-State: AOAM530tpQvt6oFBbFJXZH3u2WqJ2lBR/Dcc7rsdnueE1GUqtl+dXkss
	0elYS/mCiykFAh4eYU3ss6aUfTvhKM3wmj685v0=
X-Google-Smtp-Source: ABdhPJxmAruo9Jh+aWKYEs0zkramUZyakqjCmhFteFpqOLXZ/09jJcTrUsMGVnf817+4G228+epVYVihf2CQHXOKgCw=
X-Received: by 2002:a05:6808:19a6:b0:32b:90c4:d1af with SMTP id
 bj38-20020a05680819a600b0032b90c4d1afmr14287045oib.64.1654056009315; Tue, 31
 May 2022 21:00:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1653977696.git.xiexun162534@gmail.com> <016c56548eee75c2b713ef90e4069690c0ae11cb.1653977696.git.xiexun162534@gmail.com>
In-Reply-To: <016c56548eee75c2b713ef90e4069690c0ae11cb.1653977696.git.xiexun162534@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 1 Jun 2022 13:59:43 +1000
Message-ID: <CAKmqyKNQJsUSLAgsMB0arkT3zAXzzm6QF46ZpwDN1GdpvRQMSw@mail.gmail.com>
Subject: Re: [RFC PATCH 5/6] xen/riscv: Add early_printk
To: Xie Xun <xiexun162534@gmail.com>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 31, 2022 at 5:09 PM Xie Xun <xiexun162534@gmail.com> wrote:
>
> Signed-off-by: Xie Xun <xiexun162534@gmail.com>
> ---
>  xen/arch/riscv/Makefile                   |  1 +
>  xen/arch/riscv/early_printk.c             | 48 +++++++++++++++++++++++
>  xen/arch/riscv/include/asm/early_printk.h | 10 +++++
>  3 files changed, 59 insertions(+)
>  create mode 100644 xen/arch/riscv/early_printk.c
>  create mode 100644 xen/arch/riscv/include/asm/early_printk.h
>
> diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> index c61349818f..f9abc8401b 100644
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -3,6 +3,7 @@ obj-y += lib/
>  obj-y   += domctl.o
>  obj-y   += domain.o
>  obj-y   += delay.o
> +obj-y   += early_printk.o
>  obj-y   += guestcopy.o
>  obj-y   += irq.o
>  obj-y   += p2m.o
> diff --git a/xen/arch/riscv/early_printk.c b/xen/arch/riscv/early_printk.c
> new file mode 100644
> index 0000000000..81d69add01
> --- /dev/null
> +++ b/xen/arch/riscv/early_printk.c

This should be named differently. This file should be called
`sbi_console_early_printk.c` to better indicate that it's using the
sbi_console

The SBI print functions are useful, but they have been marked as
deprecated with no future replacement (see
https://github.com/riscv-non-isa/riscv-sbi-doc/blob/659950dc57f9840cf8242c1cff138c2ee67634bb/riscv-sbi.adoc#5-legacy-extensions-eids-0x00---0x0f)

For the initial port I think it's ok to use these, but this isn't a
long term solution, we should aim to migrate to using the standard
hardware UART.

I'm sure Xen already has a driver for the ns16550 UART so it might be
worth just using that directly and not worrying with the sbi_console.

Alistair

> @@ -0,0 +1,48 @@
> +/*
> + * RISC-V early printk using SBI
> + *
> + * Copyright (C) 2021 Bobby Eshleman <bobbyeshleman@gmail.com>
> + */
> +#include <asm/sbi.h>
> +#include <asm/early_printk.h>
> +#include <xen/stdarg.h>
> +#include <xen/lib.h>
> +
> +void _early_puts(const char *s, size_t nr)
> +{
> +    while ( nr-- > 0 )
> +    {
> +        if (*s == '\n')
> +            sbi_console_putchar('\r');
> +        sbi_console_putchar(*s);
> +        s++;
> +    }
> +}
> +
> +static void vprintk_early(const char *prefix, const char *fmt, va_list args)
> +{
> +    char buf[128];
> +    int sz;
> +
> +    early_puts(prefix);
> +
> +    sz = vscnprintf(buf, sizeof(buf), fmt, args);
> +
> +    if ( sz < 0 ) {
> +        early_puts("(XEN) vprintk_early error\n");
> +        return;
> +    }
> +
> +    if ( sz == 0 )
> +        return;
> +
> +    _early_puts(buf, sz);
> +}
> +
> +void early_printk(const char *fmt, ...)
> +{
> +    va_list args;
> +    va_start(args, fmt);
> +    vprintk_early("(XEN) ", fmt, args);
> +    va_end(args);
> +}
> diff --git a/xen/arch/riscv/include/asm/early_printk.h b/xen/arch/riscv/include/asm/early_printk.h
> new file mode 100644
> index 0000000000..0d9928b333
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/early_printk.h
> @@ -0,0 +1,10 @@
> +#ifndef __EARLY_PRINTK_H__
> +#define __EARLY_PRINTK_H__
> +
> +#include <xen/string.h>
> +
> +#define early_puts(s) _early_puts((s), strlen((s)))
> +void _early_puts(const char *s, size_t nr);
> +void early_printk(const char *fmt, ...);
> +
> +#endif /* __EARLY_PRINTK_H__ */
> --
> 2.30.2
>
>

