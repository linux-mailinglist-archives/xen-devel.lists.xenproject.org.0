Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B273F1C0A7C
	for <lists+xen-devel@lfdr.de>; Fri,  1 May 2020 00:43:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUHtU-0006Bb-7X; Thu, 30 Apr 2020 22:43:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=42Rk=6O=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1jUHtT-0006BW-0A
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 22:42:59 +0000
X-Inumbo-ID: f04a3da0-8b33-11ea-9887-bc764e2007e4
Received: from mail-oi1-x244.google.com (unknown [2607:f8b0:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f04a3da0-8b33-11ea-9887-bc764e2007e4;
 Thu, 30 Apr 2020 22:42:58 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id i13so1173739oie.9
 for <xen-devel@lists.xenproject.org>; Thu, 30 Apr 2020 15:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MVvggUdC+lfONDYt34ZfGtwVCXwzsEurzu/RkkC0IzM=;
 b=l7te+lWwnHpQEpzauV9lpzSvgRZpYdjWGPFeqVKIyupuzpJ2rXdzF+c6TN5h9LAWhv
 SKO28ik/sxG4CMrO6Zuxz/TJ7raDHd9Czy9nFipNZtdKxZfni5kRuiz11NKs0hFZL1b+
 lgqDAXZmSjptGcE9wEIGz0svrVgOUSvzIYuxQHVgvsjUTo090E5TF1Hyf25Fj/ebABjB
 4vAgMv4/Xdh9IxRY+euiLn7LAU9v+SPyxxVWP0fJZD7vEmzgcOgm8LEWuStWmMG6S8IX
 qGwBjOJhHoFk1jdeDdKmzH4WKSUYUwG3tV7JUVz7IpqlMlz2TRNsGOmpF8v8sdIfBm8q
 FYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MVvggUdC+lfONDYt34ZfGtwVCXwzsEurzu/RkkC0IzM=;
 b=JbWFqb3uXgRZONhG6zUkmVanUOfI7chGXprZUv3+NaVPvL9/ipHFfAR2bjf+7pTEnD
 yLqFATMDJKO9FrsikI7Zi9uUqvo4g+d2WMri15zhydZRWTZYg7Q07K0resfBepA42dY9
 eLyZvf2aez/eQvgWNSIAvChEwfo0N9ikfPVAafIBv0mfN3Hcu5b1UKzUFnJpdQShfu32
 cTM6NYotIxO4obPjuxMtTD00h+RJu/keQwAdyzIxj0mJ0ON2VOnMkb2CD4euVDE0C28o
 ejVXDTHLlgEhmnHW1NbBkIS5g1qAZ5nSjqK0GQHgcqpAeFqUD4qa2mWyOa+5imX6d4Ib
 +rvg==
X-Gm-Message-State: AGi0PuYLVr2ZuEsYZoH11xeab/WpLy1OmIOFtwLTWXLk1WVbhnRsV42G
 umBqF2wuqA6/fB1AN9qJZiBPfpcl0Sb0fovXLec=
X-Google-Smtp-Source: APiQypI5EyFu44yb+E/KEIAdgA9ftS6JPXP3EEAIaa18e9Jc/xMlZefsjgcuV95f7dfGCP5VRtYPwsbGdoShF63lXig=
X-Received: by 2002:aca:f4d0:: with SMTP id s199mr996204oih.161.1588286577507; 
 Thu, 30 Apr 2020 15:42:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200429225108.GA54201@bobbye-pc> <20200430222717.GA6364@mail-itl>
In-Reply-To: <20200430222717.GA6364@mail-itl>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Thu, 30 Apr 2020 15:42:46 -0700
Message-ID: <CACMJ4GY+qb3qGFYNwpH9acL3HSR7rr6qeqtsSToL-BWHEghLnQ@mail.gmail.com>
Subject: Re: [RFC] UEFI Secure Boot on Xen Hosts
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, 
 Bobby Eshleman <bobbyeshleman@gmail.com>
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
Cc: michal.zygowski@3mdeb.com, Daniel Smith <dpsmith@apertussolutions.com>,
 daniel.kiper@oracle.com, krystian.hebel@3mdeb.com,
 xen-devel <xen-devel@lists.xenproject.org>,
 Olivier Lambert <olivier.lambert@vates.fr>, piotr.krol@3mdeb.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 30, 2020 at 3:28 PM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Wed, Apr 29, 2020 at 05:51:08PM -0500, Bobby Eshleman wrote:
> > # Option #3: Lean on Grub2's LoadFile2() Verification
> >
> > Grub2 will provide a LoadFile2() method to subsequent programs that sup=
ports
> > signature verification of arbitrary files.  Linux is moving in the
> > direction of using LoadFile2() for loading the initrd [2], and Grub2 wi=
ll
> > support verifying the signatures of files loaded via LoadFile2().
>
> This description gives me flashbacks to how xen.efi loads dom0
> kernel+initramfs (Loaded Image Protocol). Practical issues encountered:
>
> 1. It works only when xen.efi is loaded via appropriate EFI boot
> service directly. If xen.efi is loaded by a filesystem driver in
> grub/other bootloader, it can't load dom0 kernel+initramfs.
>
> 2. Given variety of UEFI implementations and boot medias, it was almost
> impossible to force bootloader to use the right file loading method
> (cases like the same file accessible both via UEFI fs0: and via grub's
> filesystem driver). Which means loading xen.efi via a bootloader (as
> opposed to directly from UEFI) was hit or miss (mostly miss).
>
> 3. To avoid the above issue, one was forced to load xen.efi directly
> from EFI. This gave up any possibility to manipulate xen cmdline, or
> even choose system to boot in case of some EFI implementations.
>
> 4. Even if one is lucky to boot xen.efi via grub2-efi, then still only
> xen options could be modified. But not those for dom0.
>
> 5. It was impossible to load xen/kernel/initrd using fancy grub/ipxe
> features like HTTP.
>
> In practice the above points mean:
>
> * To get a usable product, one is forced to enable all kind of
>   workarounds (not only related to EFI) _in default configuration_,
>   because otherwise there is very little chance to enable them only when
>   needed.
>
> * If something goes wrong, in most cases you need to boot from
>   alternative media (to edit xen.cfg, or efi variables). If you happen
>   to forget your rescue usb stick, you are out of luck.
>
> So, please, can someone confirm the LoadFile2() approach wouldn't have
> any of the above issues?
>
> > This is set
> > for release in GRUB 2.06 sometime in the latter half of 2020.
> >
> > In Xen, this approach could be used for loading dom0 as well, offering =
a very
> > simple verified load interface.
> >
> > Currently the initrd argument passed from Linux to LoadFile2() is a ven=
dor
> > media device path GUID [3].
> >
> > Changes to Xen:
> > - Xen would need to pass these device paths to Grub
> > - Xen would be changed to load dom0 with the LoadFile2() interface via =
boot services
> >
> > Changes to Grub:
> > - Xen dom0 kernel/initrd device paths would need to be introduced to Gr=
ub
> >
> > Potential Issues:
> > - How will Xen handle more boot modules than just a dom0 and dom0
> >   initrd?
> > - Would each boot module need a unique vendor guid?
>
> Both above points applies for example to loading dom0
> kernel+initrd+microcode update+xsm.

I agree with this point.

>
> > - Would this interfere with the DomB proposal?

Yes, it looks like it would.

> > I suspect not because
> > the DomB proposal suggests launching DomUs from an already booted
> > DomB, at which point other means could be used.
>
> domB probably not, but what about dom0less, where multiple domains are
> loaded by Xen itself? I know dom0less currently is ARM only (not sure
> how that relates to EFI, if at all), but I think in general it would be
> good to plan for supporting more modules.

I'd better clarify this about DomB since it is not quite accurate for
the current work in progress: We're aiming to implement it as a
dom0less mode for x86, where the initial domains are loaded by Xen
itself from the modules provided by the bootloader. A single domain,
(DomB), will then run first, alone, with the opportunity to measure or
validate and then unpause the other initial domains if it chooses to
do so.
So that will mean that support for more modules will be needed.

thanks

Christopher

