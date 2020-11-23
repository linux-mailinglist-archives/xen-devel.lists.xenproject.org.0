Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E06D12C1013
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 17:25:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34833.66079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khEeI-0006it-Cq; Mon, 23 Nov 2020 16:25:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34833.66079; Mon, 23 Nov 2020 16:25:06 +0000
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
	id 1khEeI-0006iU-9I; Mon, 23 Nov 2020 16:25:06 +0000
Received: by outflank-mailman (input) for mailman id 34833;
 Mon, 23 Nov 2020 16:25:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Zne=E5=gmail.com=rjwysocki@srs-us1.protection.inumbo.net>)
 id 1khEeG-0006iP-Cw
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 16:25:04 +0000
Received: from mail-ot1-f67.google.com (unknown [209.85.210.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f7fd4e75-15da-47d6-a01e-dff62d973210;
 Mon, 23 Nov 2020 16:25:03 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id n11so16428742ota.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2020 08:25:03 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+Zne=E5=gmail.com=rjwysocki@srs-us1.protection.inumbo.net>)
	id 1khEeG-0006iP-Cw
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 16:25:04 +0000
X-Inumbo-ID: f7fd4e75-15da-47d6-a01e-dff62d973210
Received: from mail-ot1-f67.google.com (unknown [209.85.210.67])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f7fd4e75-15da-47d6-a01e-dff62d973210;
	Mon, 23 Nov 2020 16:25:03 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id n11so16428742ota.2
        for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2020 08:25:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SWzdE85KMSmQ5K6aYMgWVQjn8/tst2VI3dLUnv/55SM=;
        b=hjSIx2MRHiQ5/pfgGNPQdO9DTATY345/PLpLEi9jq+6oWscmJWtdxCCNHVf+e5vZMe
         yaYm1c5YF74vxb5AggaoW5WmgaXiUfhIP8Y6+9FqXgUGyLG8e9X1CoDcvEkKv6dFsA2P
         5mZucN20icZ3K3xnanZ48CR5LvQ4sP5hs3FMQPocCy4dpG7LHd3sWsONS06lcxfQ9QqR
         W0L+35IEOe4lhFCAfAhM74b4pipVd8lhgeGlZYn9KjVhAolL3AuIJ2sPoJ4Emwy3L0Iz
         Ck8ancE5wh3IW7ggJV8iUXqp5nOOF0VjDZsCySxWEmecHnX/wPItJ+/DJshuQJzAsNWn
         3Elg==
X-Gm-Message-State: AOAM531oquS/Bn7NjrTnByKFdLxFGveziGO2O11djz3j6tBMyjAhRrGU
	1pBl7EeIhX2TR3xMN02VoA8mnN5soePloGsRgeM=
X-Google-Smtp-Source: ABdhPJxW9u67TbnPp8ObIChv5a6F+ncd8SoV+BFvs894Bl4MJzyAX0TVAjkpawJr+z1OvIzzPyEcIsCefAg0WelXSFg=
X-Received: by 2002:a9d:16f:: with SMTP id 102mr68959otu.206.1606148702991;
 Mon, 23 Nov 2020 08:25:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605896059.git.gustavoars@kernel.org> <20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011201129.B13FDB3C@keescook> <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011220816.8B6591A@keescook> <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
 <CANiq72nZrHWTA4_Msg6MP9snTyenC6-eGfD27CyfNSu7QoVZbw@mail.gmail.com>
 <1c7d7fde126bc0acf825766de64bf2f9b888f216.camel@HansenPartnership.com>
 <CANiq72m22Jb5_+62NnwX8xds2iUdWDMAqD8PZw9cuxdHd95W0A@mail.gmail.com> <fc45750b6d0277c401015b7aa11e16cd15f32ab2.camel@HansenPartnership.com>
In-Reply-To: <fc45750b6d0277c401015b7aa11e16cd15f32ab2.camel@HansenPartnership.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 23 Nov 2020 17:24:51 +0100
Message-ID: <CAJZ5v0jJ6GFm4LFCR2V3qvD9rZrVw=pXyXSjSWPYtQudg-F3xg@mail.gmail.com>
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Kees Cook <keescook@chromium.org>, 
	Jakub Kicinski <kuba@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	"moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	bridge@lists.linux-foundation.org, ceph-devel@vger.kernel.org, 
	cluster-devel@redhat.com, coreteam@netfilter.org, devel@driverdev.osuosl.org, 
	dm-devel@redhat.com, drbd-dev@lists.linbit.com, 
	dri-devel <dri-devel@lists.freedesktop.org>, GR-everest-linux-l2@marvell.com, 
	GR-Linux-NIC-Dev@marvell.com, intel-gfx <intel-gfx@lists.freedesktop.org>, 
	intel-wired-lan@lists.osuosl.org, keyrings@vger.kernel.org, 
	linux1394-devel@lists.sourceforge.net, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, linux-afs@lists.infradead.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-atm-general@lists.sourceforge.net, 
	linux-block@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-cifs@vger.kernel.org, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, linux-decnet-user@lists.sourceforge.net, 
	Ext4 Developers List <linux-ext4@vger.kernel.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, linux-geode@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-hams@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org, 
	"open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" <linux-ide@vger.kernel.org>, linux-iio@vger.kernel.org, 
	linux-input <linux-input@vger.kernel.org>, linux-integrity@vger.kernel.org, 
	"moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, linux-mmc <linux-mmc@vger.kernel.org>, 
	Linux-MM <linux-mm@kvack.org>, linux-mtd@lists.infradead.org, 
	linux-nfs@vger.kernel.org, linux-rdma@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:TARGET SUBSYSTEM" <linux-scsi@vger.kernel.org>, linux-sctp@vger.kernel.org, 
	linux-security-module@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	"open list:ULTRA-WIDEBAND (UWB) SUBSYSTEM:" <linux-usb@vger.kernel.org>, linux-watchdog@vger.kernel.org, 
	linux-wireless <linux-wireless@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, netfilter-devel@vger.kernel.org, 
	nouveau <nouveau@lists.freedesktop.org>, op-tee@lists.trustedfirmware.org, 
	oss-drivers@netronome.com, patches@opensource.cirrus.com, 
	rds-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org, 
	samba-technical@lists.samba.org, selinux@vger.kernel.org, 
	target-devel@vger.kernel.org, tipc-discussion@lists.sourceforge.net, 
	usb-storage@lists.one-eyed-alien.net, 
	virtualization@lists.linux-foundation.org, wcn36xx@lists.infradead.org, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, xen-devel@lists.xenproject.org, 
	linux-hardening@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, 
	Nathan Chancellor <natechancellor@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 23, 2020 at 4:58 PM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> On Mon, 2020-11-23 at 15:19 +0100, Miguel Ojeda wrote:
> > On Sun, Nov 22, 2020 at 11:36 PM James Bottomley
> > <James.Bottomley@hansenpartnership.com> wrote:

[cut]

> >
> > Maintainers routinely review 1-line trivial patches, not to mention
> > internal API changes, etc.
>
> We're also complaining about the inability to recruit maintainers:
>
> https://www.theregister.com/2020/06/30/hard_to_find_linux_maintainers_says_torvalds/
>
> And burn out:
>
> http://antirez.com/news/129

Right.

> The whole crux of your argument seems to be maintainers' time isn't
> important so we should accept all trivial patches ... I'm pushing back
> on that assumption in two places, firstly the valulessness of the time
> and secondly that all trivial patches are valuable.
>
> > If some company does not want to pay for that, that's fine, but they
> > don't get to be maintainers and claim `Supported`.
>
> What I'm actually trying to articulate is a way of measuring value of
> the patch vs cost ... it has nothing really to do with who foots the
> actual bill.
>
> One thesis I'm actually starting to formulate is that this continual
> devaluing of maintainers is why we have so much difficulty keeping and
> recruiting them.

Absolutely.

This is just one of the factors involved, but a significant one IMV.

