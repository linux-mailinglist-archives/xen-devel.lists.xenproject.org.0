Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC4331FDDE
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 18:30:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87015.163915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD9by-00005x-RV; Fri, 19 Feb 2021 17:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87015.163915; Fri, 19 Feb 2021 17:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD9by-00005a-OP; Fri, 19 Feb 2021 17:30:38 +0000
Received: by outflank-mailman (input) for mailman id 87015;
 Fri, 19 Feb 2021 17:30:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fNr7=HV=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lD9bx-00005U-EG
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 17:30:37 +0000
Received: from mail-lj1-x234.google.com (unknown [2a00:1450:4864:20::234])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b652378e-a0e8-4c78-bbc8-aec455d1bad4;
 Fri, 19 Feb 2021 17:30:36 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id r23so24008668ljh.1
 for <xen-devel@lists.xenproject.org>; Fri, 19 Feb 2021 09:30:36 -0800 (PST)
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
X-Inumbo-ID: b652378e-a0e8-4c78-bbc8-aec455d1bad4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5BN6yFN3Scp/K0nK6nNparAeMOeN/nnletLBanC+Jo0=;
        b=aur0rNQW2QglIi5GcgWvWIfCVnZ7mE7oeKteZpRAJLxe9hss6/wUCjCbuoPzY7eSkX
         KC6Gvkvl38yYzSKl/TC5pcTHQnqn9KqoAXOHhnkcJnm2J0Yli/JISjTFcLkYerHkRdVJ
         QQZ598atgMtuKZ4NuZhzAZpAj7a4AO7Vj0OSJE9TAA9Qq5HAsg/upSIu25djKP11cKt1
         KBskMLYGq7Ayb0YdxxhhUEVXaAo3HL8bpsGxcrf927Fax+jdPvNc74zV62cAJ/uxj7Wy
         4kykj4toFLA97g2gaV8rpsA2hrW8SWbgKQdbgtBiRrN7NfjDNDjmOjorEmkly7zkDUyE
         YqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5BN6yFN3Scp/K0nK6nNparAeMOeN/nnletLBanC+Jo0=;
        b=E1N2Ui78CGdsjKFysA7jeeeTMl8gPMW+eNnqZaIPjq3WeIHbEL5AluKWpydd9Ead3n
         MpSyXcxUEoaw2gRqtyQSvYXoPYl7wOWKPCLuv5nzUBPoOxpGomKQTfaV0pyV0EYV6H0+
         LsiXYn1MqpMR5ux5pmtlVnJhOmdA8H8v9o2Ryp7HL68HcxwUP24E84slUfwXz8PsqL/a
         ImPcaL++DejoprfE13yr7KJuSHTUSNW/ntXr4Bht9hVLrruHkAcwcaF0DFFPSG3urOFN
         rSAL8GQiGLVQO3IM2srIUSG/3uCs5fHwDeqDuyVi5nqUvYz7kZ5VQtx+vYq4Gm5LuL++
         OhMg==
X-Gm-Message-State: AOAM533Bma+GBJ6rMdna0VMf6Bs+03L4Qe/MvuFTYeOfSwkbQX87Tkrm
	nvaJ66gxm/m4nXtBFuFJ5CXK550DAULldrdq/rs=
X-Google-Smtp-Source: ABdhPJztR6MYwIGS8IqcewEUT0iHoAzfku2FAHPHSy9mUnKPTTZ8wczqXeiaTyxl+eriOdxytrV3mPhEbWG2EyPuFbw=
X-Received: by 2002:a19:7f95:: with SMTP id a143mr5955108lfd.419.1613755835524;
 Fri, 19 Feb 2021 09:30:35 -0800 (PST)
MIME-Version: 1.0
References: <CAKf6xpv-LRCuo-qHHWMuukYtvJiR-i+-YhLUOZeqoAFd-=swEQ@mail.gmail.com>
 <1a3b90f4-564e-84d3-fd6a-3454e8753579@citrix.com> <20201015113109.GA68032@Air-de-Roger>
 <CAKf6xpsJYT7VCeaf6TxPNK1QD+3U9E8ST7E+mWtfDjw0k9L9dA@mail.gmail.com>
 <CAKf6xps1q9zMBeFg7C7ZhD-JcwQ6EG6+bYvvA9QT8PzzxKqMNg@mail.gmail.com>
 <20201021095809.o53b6hpvjl2lbqsi@Air-de-Roger> <CAKf6xpuTE4gBNe4YXPYh_hAMLaJduDuKL5_6aC4H=y6DRxaxvw@mail.gmail.com>
 <a4dd7778-9bd4-00c1-3056-96d435b70d70@suse.com> <CAKf6xpvKiWiU5Wsv2C1EiEFr77nMZTd+VHgkdk7qcKw1OFD8Vg@mail.gmail.com>
 <9bbf6768-a39e-2b3c-c4de-fd883cc9ef85@suse.com>
In-Reply-To: <9bbf6768-a39e-2b3c-c4de-fd883cc9ef85@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 19 Feb 2021 12:30:23 -0500
Message-ID: <CAKf6xpuTbvGtTRHPK9Ock7rxJk4DfCumgTW7-2_PADm9cSaUBg@mail.gmail.com>
Subject: Re: i915 dma faults on Xen
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, intel-gfx@lists.freedesktop.org, 
	xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2020 at 9:59 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 21.10.2020 15:36, Jason Andryuk wrote:
> > On Wed, Oct 21, 2020 at 8:53 AM Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 21.10.2020 14:45, Jason Andryuk wrote:
> >>> On Wed, Oct 21, 2020 at 5:58 AM Roger Pau Monn=C3=A9 <roger.pau@citri=
x.com> wrote:
> >>>> Hm, it's hard to tell what's going on. My limited experience with
> >>>> IOMMU faults on broken systems there's a small range that initially
> >>>> triggers those, and then the device goes wonky and starts accessing =
a
> >>>> whole load of invalid addresses.
> >>>>
> >>>> You could try adding those manually using the rmrr Xen command line
> >>>> option [0], maybe you can figure out which range(s) are missing?
> >>>
> >>> They seem to change, so it's hard to know.  Would there be harm in
> >>> adding one to cover the end of RAM ( 0x04,7c80,0000 ) to (
> >>> 0xff,ffff,ffff )?  Maybe that would just quiet the pointless faults
> >>> while leaving the IOMMU enabled?
> >>
> >> While they may quieten the faults, I don't think those faults are
> >> pointless. They indicate some problem with the software (less
> >> likely the hardware, possibly the firmware) that you're using.
> >> Also there's the question of what the overall behavior is going
> >> to be when devices are permitted to access unpopulated address
> >> ranges. I assume you did check already that no devices have their
> >> BARs placed in that range?
> >
> > Isn't no-igfx already letting them try to read those unpopulated addres=
ses?
>
> Yes, and it is for the reason that the documentation for the
> option says "If specifying `no-igfx` fixes anything, please
> report the problem." I imply from in in particular that one
> better wouldn't use it for non-development purposes of whatever
> kind.

I stopped seeing these DMA faults, but I didn't know what made them go
away.  Then when working with an older 5.4.64 kernel, I saw them
again.  Eric bisected down to the 5.4.y version of mainline linux
commit:

commit 8195400f7ea95399f721ad21f4d663a62c65036f
Author: Chris Wilson <chris@chris-wilson.co.uk>
Date:   Mon Oct 19 11:15:23 2020 +0100

    drm/i915: Force VT'd workarounds when running as a guest OS

    If i915.ko is being used as a passthrough device, it does not know if
    the host is using intel_iommu. Mixing the iommu and gfx causes a few
    issues (such as scanout overfetch) which we need to workaround inside
    the driver, so if we detect we are running under a hypervisor, also
    assume the device access is being virtualised.

Regards,
Jason

