Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E4C20FB50
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2020 20:04:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqKbt-0003aS-0N; Tue, 30 Jun 2020 18:03:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s2es=AL=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jqKbr-0003aN-HX
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 18:03:55 +0000
X-Inumbo-ID: 0f91b268-bafc-11ea-b7bb-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f91b268-bafc-11ea-b7bb-bc764e2007e4;
 Tue, 30 Jun 2020 18:03:54 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id o8so19667447wmh.4
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2020 11:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9M1CDfK/H2cl9/qGX30wrOtT6hGs97JvaCKGnxd5S70=;
 b=YItEk2D7psW7cr5wyH/lVxKXLVq/wwkkYdensuGwK4RQolGup6xCQRRPNIBiBQ1fJx
 fwL0MYLpxa0EkAmkhttNNbbpgtsul4t4gEq55FKmGDD7TG1nFRAba0VnnPr8otaxJ9uV
 uTUL48J4fRhRfHJR9LOT8+7aBdGkZTLSfzf8nSEXmhGO5UcqHA/bk1D+PkHBr/MkeHBD
 WsKenlK0KidZf2oXvOnzo36HSAjj2Bhabs9H/rsbzfLSUjGAI3NjYrHbJQN5jSa5o/IO
 1S4cBwHb3fU1RpGfPBBR+ODr4/ic2zZGopSotaj2h2s+Xd/qf3KOOvTZ5LhoqkXpd7YE
 zU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9M1CDfK/H2cl9/qGX30wrOtT6hGs97JvaCKGnxd5S70=;
 b=NXvfXw/XOz+jwRGr1FWMpJq2j7KUitzv+fHZMXsDUUL0Wm/YRZCnWBJkOqqq2kxjFY
 qBKSLFkBg84AwiBdzh5ta/b6NAtMDM93s7A7F/Fmlt5/oflatQpPOc+yHFOY6mLFCzAo
 HtXUpYRlaRGWVdirsxziw6Q2pmvQsMpCtq5kblDmfdEJKC8pmCdPkvjE/0QXI0h+pnmt
 YJtgb3HG1AUCyXv2qkVButXZxnin2s2baXzOZRaGnVyux2DkjNEMupOvhBdVdpW1r1Up
 BF3wDFb4DcmpirGj05S/UlFtJuL4wJe/iGel8vcPp9mVUUmfaX6iFeH6x5Nl6iI4JwDC
 Iqdg==
X-Gm-Message-State: AOAM533XPM1b4OTRwDhiSMcC6spdobF8zeRmRNW8fbq/VmZ8pCx5FKKp
 sCnAjEjA9n0V4vs4ScJPrN5LacmHf3iihTuy7+Y=
X-Google-Smtp-Source: ABdhPJyTsRreoepnB3x4IosE1ZWCrvEFCF/ygbRyfqS85KQD0WrHaKBzwBRTsbweG0fA5wJWZy8jQ4PcTS4sA+b3NIQ=
X-Received: by 2002:a1c:b103:: with SMTP id a3mr22448753wmf.186.1593540233987; 
 Tue, 30 Jun 2020 11:03:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <2ff9ecee8367e814a29b17a34203bda0e3c48d74.1593519420.git.michal.leszczynski@cert.pl>
 <b1d4177d-8a00-06fb-97fd-bf5f1ba42319@citrix.com>
In-Reply-To: <b1d4177d-8a00-06fb-97fd-bf5f1ba42319@citrix.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Tue, 30 Jun 2020 12:03:17 -0600
Message-ID: <CABfawh=N-PVmxDWa=QR5ttt=rZ7gmh148ZsjRV+EX7Td525Wuw@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] x86/vmx: add Intel PT MSR definitions
To: Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?B?TWljaGHFgiBMZXN6Y3p5xYRza2k=?= <michal.leszczynski@cert.pl>, "Kang,
 Luwei" <luwei.kang@intel.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 30, 2020 at 11:39 AM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> On 30/06/2020 13:33, Micha=C5=82 Leszczy=C5=84ski wrote:
> > diff --git a/xen/include/asm-x86/msr-index.h b/xen/include/asm-x86/msr-=
index.h
> > index b328a47ed8..0203029be9 100644
> > --- a/xen/include/asm-x86/msr-index.h
> > +++ b/xen/include/asm-x86/msr-index.h
> > @@ -69,6 +69,43 @@
> >  #define MSR_MCU_OPT_CTRL                    0x00000123
> >  #define  MCU_OPT_CTRL_RNGDS_MITG_DIS        (_AC(1, ULL) <<  0)
> >
> > +/* Intel PT MSRs */
> > +#define MSR_RTIT_OUTPUT_BASE                0x00000560
> > +
> > +#define MSR_RTIT_OUTPUT_MASK                0x00000561
> > +
> > +#define MSR_RTIT_CTL                        0x00000570
> > +#define  RTIT_CTL_TRACEEN                    (_AC(1, ULL) <<  0)
> > +#define  RTIT_CTL_CYCEN                      (_AC(1, ULL) <<  1)
>
> In addition to what Jan has said, please can we be consistent with an
> underscore (or not) before EN.  Preferably with, so these would become
> TRACE_EN and CYC_EN.
>
> That said, there are a lot of bit definitions which aren't used at all.
> IMO, it would be better to introduce defines when you use them.

In the past I found it very valuable when this type of plumbing was
already present in Xen instead of me having to go into the SDM to digg
out the magic numbers. So while some of the bits might not be used
right now I also don't see any downside in having them, just in case.

Tamas

