Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B63E82C581A
	for <lists+xen-devel@lfdr.de>; Thu, 26 Nov 2020 16:29:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38644.71408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiJC7-0001Ke-6A; Thu, 26 Nov 2020 15:28:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38644.71408; Thu, 26 Nov 2020 15:28:27 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiJC7-0001KF-2y; Thu, 26 Nov 2020 15:28:27 +0000
Received: by outflank-mailman (input) for mailman id 38644;
 Thu, 26 Nov 2020 15:28:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LKT8=FA=gmail.com=geert.uytterhoeven@srs-us1.protection.inumbo.net>)
 id 1kiJC6-0001KA-1K
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 15:28:26 +0000
Received: from mail-ot1-f65.google.com (unknown [209.85.210.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab7e3f94-68da-488e-bb6c-4353ec84fe44;
 Thu, 26 Nov 2020 15:28:24 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id 79so2156912otc.7
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2020 07:28:24 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=LKT8=FA=gmail.com=geert.uytterhoeven@srs-us1.protection.inumbo.net>)
	id 1kiJC6-0001KA-1K
	for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 15:28:26 +0000
X-Inumbo-ID: ab7e3f94-68da-488e-bb6c-4353ec84fe44
Received: from mail-ot1-f65.google.com (unknown [209.85.210.65])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ab7e3f94-68da-488e-bb6c-4353ec84fe44;
	Thu, 26 Nov 2020 15:28:24 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id 79so2156912otc.7
        for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2020 07:28:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kP9MspVOPl/NnVl8oGn1EIC/+F8CcK5+OXo+jY56Nno=;
        b=P8jJ8LPDzZu00Cs7zmm6NkeXye2k+pTbCKake39qiyx5HBWziWWAQCFThcE2XZcbwp
         IDr4qif/UHnpNZ4dTGWWsM4Gw2wDGnxUat1hmJKidY5UE0bqnuX83hVHAThcHLnK99B/
         746noz0PTfJINeUGeodUWBZ+L7B1T/wasn8PNANwBe02V9zCmCUFsPHZ9QEAq7SITelw
         NPV/xINz0ImsZsAfh2HgXregN+DAmi8Ai0nTtKqh/zaqVN3Pwy2KiluPPpwnQW4n4IzY
         snBF1+1bBUiTCB62CxaWfQc+ngrxSzggRdbxie6SFTeN0S0JMhDfNOpRS7S76yQ8UBFG
         +WUA==
X-Gm-Message-State: AOAM530HbTgkWN1TA9Ob5AqKhGHZxvREDGMQ9hiCcD4fkHqyDYQMpsO3
	nwek6XYijubVL807tX8znt6yHgekl4gdpqF82yY=
X-Google-Smtp-Source: ABdhPJyYtol6dSfaI6WhgTcuunq7fhBuSULViECyA4Z+K27bCejCuaia55DZ/aziu9dD69JTQZlYwW/4z6Mu7Di+rU4=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr2551843otc.145.1606404504116;
 Thu, 26 Nov 2020 07:28:24 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605896059.git.gustavoars@kernel.org> <20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011201129.B13FDB3C@keescook> <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011220816.8B6591A@keescook> <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
 <CANiq72nZrHWTA4_Msg6MP9snTyenC6-eGfD27CyfNSu7QoVZbw@mail.gmail.com>
 <1c7d7fde126bc0acf825766de64bf2f9b888f216.camel@HansenPartnership.com>
 <CANiq72m22Jb5_+62NnwX8xds2iUdWDMAqD8PZw9cuxdHd95W0A@mail.gmail.com>
 <fc45750b6d0277c401015b7aa11e16cd15f32ab2.camel@HansenPartnership.com>
 <CANiq72k5tpDoDPmJ0ZWc1DGqm+81Gi-uEENAtvEs9v3SZcx6_Q@mail.gmail.com>
 <4993259d01a0064f8bb22770503490f9252f3659.camel@HansenPartnership.com>
 <CANiq72kqO=bYMJnFS2uYRpgWATJ=uXxZuNUsTXT+3aLtrpnzvQ@mail.gmail.com>
 <44005bde-f6d4-5eaa-39b8-1a5efeedb2d3@gmail.com> <CANiq72nobq=ptWK-qWxU91JHqkKhMcRtJNnw2XJd5-vSJWZd8Q@mail.gmail.com>
In-Reply-To: <CANiq72nobq=ptWK-qWxU91JHqkKhMcRtJNnw2XJd5-vSJWZd8Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Nov 2020 16:28:12 +0100
Message-ID: <CAMuHMdV5kOakvZJMWLxbpigFPS+Xuw6DVYsWCWZy7wGsv3idcw@mail.gmail.com>
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Edward Cree <ecree.xilinx@gmail.com>, 
	ALSA Development Mailing List <alsa-devel@alsa-project.org>, linux-atm-general@lists.sourceforge.net, 
	reiserfs-devel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-wireless <linux-wireless@vger.kernel.org>, 
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, linux-ide@vger.kernel.org, 
	dm-devel@redhat.com, keyrings@vger.kernel.org, 
	MTD Maling List <linux-mtd@lists.infradead.org>, GR-everest-linux-l2@marvell.com, 
	wcn36xx@lists.infradead.org, samba-technical@lists.samba.org, 
	linux-i3c@lists.infradead.org, linux1394-devel@lists.sourceforge.net, 
	linux-afs@lists.infradead.org, usb-storage@lists.one-eyed-alien.net, 
	Lars Ellenberg <drbd-dev@lists.linbit.com>, driverdevel <devel@driverdev.osuosl.org>, 
	linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com, 
	Nick Desaulniers <ndesaulniers@google.com>, scsi <linux-scsi@vger.kernel.org>, 
	Nathan Chancellor <natechancellor@gmail.com>, linux-rdma <linux-rdma@vger.kernel.org>, 
	oss-drivers@netronome.com, bridge@lists.linux-foundation.org, 
	linux-security-module <linux-security-module@vger.kernel.org>, 
	amd-gfx list <amd-gfx@lists.freedesktop.org>, linux-stm32@st-md-mailman.stormreply.com, 
	cluster-devel@redhat.com, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, 
	coreteam@netfilter.org, intel-wired-lan@lists.osuosl.org, 
	linux-input <linux-input@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Ext4 Developers List <linux-ext4@vger.kernel.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Kees Cook <keescook@chromium.org>, 
	selinux@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>, linux-geode@lists.infradead.org, 
	linux-can@vger.kernel.org, linux-block@vger.kernel.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, op-tee@lists.trustedfirmware.org, 
	linux-mediatek@lists.infradead.org, xen-devel@lists.xenproject.org, 
	Nouveau Dev <nouveau@lists.freedesktop.org>, linux-hams@vger.kernel.org, 
	ceph-devel <ceph-devel@vger.kernel.org>, virtualization@lists.linux-foundation.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org, 
	Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>, 
	"open list:NFS, SUNRPC, AND..." <linux-nfs@vger.kernel.org>, GR-Linux-NIC-Dev@marvell.com, 
	tipc-discussion@lists.sourceforge.net, Linux-MM <linux-mm@kvack.org>, 
	Network Development <netdev@vger.kernel.org>, linux-decnet-user@lists.sourceforge.net, 
	Linux MMC List <linux-mmc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	linux-sctp@vger.kernel.org, USB list <linux-usb@vger.kernel.org>, 
	NetFilter <netfilter-devel@vger.kernel.org>, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, patches@opensource.cirrus.com, 
	Joe Perches <joe@perches.com>, linux-integrity <linux-integrity@vger.kernel.org>, 
	target-devel <target-devel@vger.kernel.org>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Miguel,

On Thu, Nov 26, 2020 at 3:54 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Wed, Nov 25, 2020 at 11:44 PM Edward Cree <ecree.xilinx@gmail.com> wrote:
> > To make the intent clear, you have to first be certain that you
> >  understand the intent; otherwise by adding either a break or a
> >  fallthrough to suppress the warning you are just destroying the
> >  information that "the intent of this code is unknown".
>
> If you don't know what the intent of your own code is, then you
> *already* have a problem in your hands.

The maintainer is not necessarily the owner/author of the code, and
thus may not know the intent of the code.

> > or does it flag up code
> >  that can be mindlessly "fixed" (in which case the warning is
> >  worthless)?  Proponents in this thread seem to be trying to
> >  have it both ways.
>
> A warning is not worthless just because you can mindlessly fix it.
> There are many counterexamples, e.g. many
> checkpatch/lint/lang-format/indentation warnings, functional ones like
> the `if (a = b)` warning...

BTW, you cannot mindlessly fix the latter, as you cannot know if
"(a == b)" or "((a = b))" was intended, without understanding the code
(and the (possibly unavailable) data sheet, and the hardware, ...).

P.S. So far I've stayed out of this thread, as I like it if the compiler
     flags possible mistakes.  After all I was the one fixing new
     "may be used uninitialized" warnings thrown up by gcc-4.1, until
     (a bit later than) support for that compiler was removed...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

