Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4EC68BC8B
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 13:13:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490315.758945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP0Mp-0007Zf-9Z; Mon, 06 Feb 2023 12:13:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490315.758945; Mon, 06 Feb 2023 12:13:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP0Mp-0007XI-6D; Mon, 06 Feb 2023 12:13:03 +0000
Received: by outflank-mailman (input) for mailman id 490315;
 Mon, 06 Feb 2023 12:13:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PSnb=6C=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1pP0Mn-0007XC-8q
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 12:13:01 +0000
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [2607:f8b0:4864:20::e30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98df9227-a617-11ed-933c-83870f6b2ba8;
 Mon, 06 Feb 2023 13:13:00 +0100 (CET)
Received: by mail-vs1-xe30.google.com with SMTP id s24so12384998vsi.12
 for <xen-devel@lists.xenproject.org>; Mon, 06 Feb 2023 04:13:00 -0800 (PST)
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
X-Inumbo-ID: 98df9227-a617-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hnrQtIEEU+7ze7l7ZQEZnhcc5uc+DBDXvxux78MGYMA=;
        b=TqN5QPcGMttgNtiBd6sV/hj+HGRVUX3x7+d1wnhunVyNUshNLX+sQvZ/5fpfD20HiR
         GOoI85X5a7oImnfwvaPUVxK8tr6QbNcH3pLSd/1jXZRruHhxwOvtjNJ5UlU7sRGBOtET
         aTSFjg21EtkzNCzTGWA7Se6Ptt/B2tvX5vMi/QWEF815ydsJiLu6071NGRvGfgs99NCz
         70YJNG3+4jQ2iuxgbTvPkV5C1v55Rbm1K8hO6yPCeTG/UArcCBQJWyipwJgBQoEbFPX1
         Xr8PURzBbsXfII2bTZ/L2wdGGbnr78PywHzlvHvGyA44g5ajD4WSLfevRUAmOuM07S+3
         lLrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hnrQtIEEU+7ze7l7ZQEZnhcc5uc+DBDXvxux78MGYMA=;
        b=IUfhd9WIDAJ5/TuWeSK5d+Y95amw13LAXI7o8hwp/dbwdyX38+kkAhiqmCAotuUSP4
         VnMvHpgZZ2h7nsjMmzLNyUeOyck+3smf0uG+Wj+KeSJYzlHFyyxZo+l1p1xZejZk14h7
         DamsKf8+cEzLjFWAFPljEfpKNw9CFvvaJSnZyPByqNuFQc0PerdiGYNqSDrQ7gAm/TMU
         RVPYK4s5VlBnQTkBnZqWiIdLr1EDSnsfq8D+WmpK84XUhk6OdfxzWdm47qKvztmMxIY8
         EcNHOoDuL8mhTYpNZ6DvmzVDEEselBJoVPx0rdUQzPCMJaLi4kYjSWu82YkMSsmSLfpl
         uZnA==
X-Gm-Message-State: AO0yUKXxpABu/pvz3SjzDBI9KU6kCvGTkLWUfQFtzpPhT2Gv69G+Q+Qv
	Q91ihmdcmbK52aBBkdpS7Mw5gz/7LyhCwLDyrIs=
X-Google-Smtp-Source: AK7set9TzkSvoulAkqG/X+6ql1sxHWFIXaE72ejGNV8n9SqrZXXDCRO67SGleU02+jRa/cjb8zDVXJh7ybOSSOUmVGg=
X-Received: by 2002:a05:6102:1276:b0:3ee:4ef8:45d3 with SMTP id
 q22-20020a056102127600b003ee4ef845d3mr2498543vsg.64.1675685579305; Mon, 06
 Feb 2023 04:12:59 -0800 (PST)
MIME-Version: 1.0
References: <1eaa4cce-2ef2-ca38-56d2-5d551c9c1ae9@suse.com> <509f24de-a34e-7702-4579-b27bcb86ce70@suse.com>
In-Reply-To: <509f24de-a34e-7702-4579-b27bcb86ce70@suse.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Feb 2023 22:12:33 +1000
Message-ID: <CAKmqyKMyTfhiReORzbQwUeGn=rW1YNq68YM6S0v8CxRfT7-LCw@mail.gmail.com>
Subject: Re: Ping: [PATCH] tools/symbols: drop asm/types.h inclusion
To: Jan Beulich <jbeulich@suse.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Connor Davis <connojdavis@gmail.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 6, 2023 at 5:40 PM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 20.01.2023 09:40, Jan Beulich wrote:
> > While this has been there forever, it's not clear to me what it was
> > (thought to be) needed for. In fact, all three instances of the header
> > already exclude their entire bodies when __ASSEMBLY__ was defined.
> > Hence, with no other assembly files including this header, we can at the
> > same time get rid of those conditionals.
> >
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> May I please ask for a RISC-V side ack (or otherwise) here?
>
> Thanks, Jan
>
> > --- a/xen/arch/arm/include/asm/types.h
> > +++ b/xen/arch/arm/include/asm/types.h
> > @@ -1,9 +1,6 @@
> >  #ifndef __ARM_TYPES_H__
> >  #define __ARM_TYPES_H__
> >
> > -#ifndef __ASSEMBLY__
> > -
> > -
> >  typedef __signed__ char __s8;
> >  typedef unsigned char __u8;
> >
> > @@ -54,8 +51,6 @@ typedef u64 register_t;
> >  #define PRIregister "016lx"
> >  #endif
> >
> > -#endif /* __ASSEMBLY__ */
> > -
> >  #endif /* __ARM_TYPES_H__ */
> >  /*
> >   * Local variables:
> > --- a/xen/arch/riscv/include/asm/types.h
> > +++ b/xen/arch/riscv/include/asm/types.h
> > @@ -1,8 +1,6 @@
> >  #ifndef __RISCV_TYPES_H__
> >  #define __RISCV_TYPES_H__
> >
> > -#ifndef __ASSEMBLY__
> > -
> >  typedef __signed__ char __s8;
> >  typedef unsigned char __u8;
> >
> > @@ -57,8 +55,6 @@ typedef u64 register_t;
> >
> >  #endif
> >
> > -#endif /* __ASSEMBLY__ */
> > -
> >  #endif /* __RISCV_TYPES_H__ */
> >  /*
> >   * Local variables:
> > --- a/xen/arch/x86/include/asm/types.h
> > +++ b/xen/arch/x86/include/asm/types.h
> > @@ -1,8 +1,6 @@
> >  #ifndef __X86_TYPES_H__
> >  #define __X86_TYPES_H__
> >
> > -#ifndef __ASSEMBLY__
> > -
> >  typedef __signed__ char __s8;
> >  typedef unsigned char __u8;
> >
> > @@ -32,6 +30,4 @@ typedef unsigned long paddr_t;
> >  #define INVALID_PADDR (~0UL)
> >  #define PRIpaddr "016lx"
> >
> > -#endif /* __ASSEMBLY__ */
> > -
> >  #endif /* __X86_TYPES_H__ */
> > --- a/xen/tools/symbols.c
> > +++ b/xen/tools/symbols.c
> > @@ -302,7 +302,6 @@ static void write_src(void)
> >               return;
> >       }
> >       printf("#include <xen/config.h>\n");
> > -     printf("#include <asm/types.h>\n");
> >       printf("#if BITS_PER_LONG == 64 && !defined(SYMBOLS_ORIGIN)\n");
> >       printf("#define PTR .quad\n");
> >       printf("#define ALGN .align 8\n");
> >
>
>

