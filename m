Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6D8345E3E
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 13:35:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100666.191922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOgEp-0000Gk-VO; Tue, 23 Mar 2021 12:34:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100666.191922; Tue, 23 Mar 2021 12:34:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOgEp-0000GL-SC; Tue, 23 Mar 2021 12:34:23 +0000
Received: by outflank-mailman (input) for mailman id 100666;
 Tue, 23 Mar 2021 12:34:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I/Uj=IV=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lOgEo-0000GG-DL
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 12:34:22 +0000
Received: from mail-lf1-x12d.google.com (unknown [2a00:1450:4864:20::12d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 84368010-1fb5-4c2c-b23b-6b936b65f2a7;
 Tue, 23 Mar 2021 12:34:21 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id 75so26342166lfa.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Mar 2021 05:34:21 -0700 (PDT)
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
X-Inumbo-ID: 84368010-1fb5-4c2c-b23b-6b936b65f2a7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bAcSmwImGHdkSenTnDxBwKVNvLOW9c5Ag/ydDowOjV4=;
        b=p65tc17uSiIUgVFjmJReKl6m3Nwh7jj0J99tA5H7MGqV+K4p1RL8jUAGv/Itlih6v+
         SLp66V60zHGRtLO64Zk7bR2SV7G7eHam1Hn3bECl1OmGKXWnVVsmqHFf91LvU+jaSyAi
         tPRPt7K2Tpw2zKQhiKTqredJ1Le6UncYpRlkoxguzUOOaC/8iixeBtEQvOttvKp3OzLD
         Yz+8NTB1nDcA1c3gsms/twIniX/eG1SI/fo2SOWX3B2jgfp40GmQwXaq5CnhANNeKcSR
         J9LMwrgp4QPdj/frvr3W8FMJLoDPoN7+sbaNMP1SAI7+niMVxYrup4qxXjfBR1gFL5Xt
         loyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bAcSmwImGHdkSenTnDxBwKVNvLOW9c5Ag/ydDowOjV4=;
        b=TjLaFkY+2GmBhUaYbQND7VTmBKuFPSIzF7MqCtU/mDPEjg6q3jseUJaCWIdqrhpZ7V
         8BwFjXc24NeqjGaJewRZUqAwxW7im8WFhXd5fa90nvCqO5N9DSqYMojKx46gM0G3ZGfs
         iIaCdZoF9DBdlCqFDxb6UUb7J1thohMumfIRBCwEJMcSQySaq4dQyqkM0EH28SL6EFgP
         desXUMeFA/rYcaHtXllkcicwFrT7l2GDKB6kS3wzjQJRtrue0EVCMeMBqZWhqE65TdMs
         7+OZed2Z1ZEdcGvsFZTjoDPiAthyqLEPOYKuxHMgD0b9NKnfZhsCGY8EawFPHiXI8D8x
         PCIg==
X-Gm-Message-State: AOAM531q+QEiIDZhi64D11rNtyZz0T2qBmoqRdGn6QQNR3p/QsIMH1/l
	DFVQLqCwm0hSV8trvqBwihrR+IWQzYLIL+cRV2s=
X-Google-Smtp-Source: ABdhPJziy19QZGQpF/kdTnR7krtD4lO7eUOQ3qTWV/KfZngKO2tTXnWd96kN8ctjrd2oPUxNbCFNGycfKKTLsJvx99w=
X-Received: by 2002:a05:6512:243:: with SMTP id b3mr2535336lfo.529.1616502859950;
 Tue, 23 Mar 2021 05:34:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210322133301.11308-1-jandryuk@gmail.com> <c5736ca0-de24-bac7-f1d9-3f90df997454@suse.com>
 <d410d743-5479-bbf6-676b-c8749ab07c06@citrix.com> <f53db67e-8344-8da7-6658-c521d2e3c527@suse.com>
 <09b5e7ee-b44b-a8ab-f29d-6617b6af93a0@citrix.com> <9b071192-a443-4bdc-8dac-107bbd4a0481@suse.com>
In-Reply-To: <9b071192-a443-4bdc-8dac-107bbd4a0481@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 23 Mar 2021 08:34:08 -0400
Message-ID: <CAKf6xpvGit4YiuTfGuX2iZ1qPi-a+oNK2bassUxGd8qJADEXyQ@mail.gmail.com>
Subject: Re: [PATCH] xen: Create EFI_VENDOR directory
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 23, 2021 at 3:23 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 22.03.2021 18:08, Andrew Cooper wrote:
> > On 22/03/2021 15:15, Jan Beulich wrote:
> >> On 22.03.2021 15:59, Andrew Cooper wrote:
> >>> On 22/03/2021 14:52, Jan Beulich wrote:
> >>>> On 22.03.2021 14:33, Jason Andryuk wrote:
> >>>>> make install-xen fails when EFI_VENDOR is set (=fedora) with:
> >>>>> install: cannot create regular file '/home/user/xen/dist/install/boot/efi/efi/fedora/xen-4.15.0-rc.efi': No such file or directory
> >>>>>
> >>>>> Create the EFI_VENDOR directory so xen.efi can be installed within.
> >>>>>
> >>>>> This removes the need for Fedora and Qubes xen.spec files to manually
> >>>>> create the directory in advance.
> >>>> While I'm not strictly against, I'd like to point out that it was
> >>>> deliberate to not create this directory here. I also didn't expect
> >>>> anyone's xen.spec to do so. Instead I'd expect the distro to create
> >>>> it during OS installation. If this was a bad assumption, I'd prefer
> >>>> if the commit message here could point out why such an expectation
> >>>> won't hold in general.
> >>> This reasoning is broken for anything other `make install DESTDIR=/` on
> >>> a live system.
> >>>
> >>> It is incompatible with how RPM, deb, etc packages work.
> >> I'm afraid I don't understand, for both of your statements. If distro
> >> installation put in place the designated directory, there wouldn't be
> >> any live system lacking it, and there wouldn't be any concern in the
> >> packaging of any software.
> >>
> >> To take a perhaps too extreme example - packages typically expect e.g.
> >> /usr to exist as well, don't they?
> >
> > No.  A buildroot starts out fully empty, by design.
> >
> > The packaging environment (usually a chroot) invokes `make install
> > DESTDIR=/path/to/staging/root` so you don't interfere with any of the
> > tools inside the environment, and the resulting tar/cpio has the
> > buildroot stripped out of paths.
> >
> > The failure being discussed here is the build within the packaging
> > environment, not the metadata which forms the final package.  Installing
> > a deb/rpm/etc will make directories as applicable.
>
> Ah, I see. But then this _still_ isn't the right thing to do. In fact,
> the package build and installation shouldn't put xen.efi in the EFI
> partition _at all_. The build system doing so is for developers only,
> so they don't need to invoke boot loader configuration every time they
> rebuild and re-install. Hence the packaging build shouldn't set
> EFI_VENDOR in the first place. There it instead should be a subsequent
> boot loader re-configuration which picks up xen.efi from its install
> location (under $(EFI_DIR)) and places it on the EFI partition.

On Fedora, RPMs drop EFI binaries directly into /boot/efi/EFI/fedora/.
grub, shim, fwupdate and xen are all packaged that way.  It seems
reasonable to have those important binaries tracked by the package
manager.

Does SuSE populate EFI_VENDOR from EFI_DIR when some boot loader
script is called?

I think Xen's population of EFI_VENDOR is sensible and fine.  Plus
it's *used*.  I don't see why it needs to be removed.  I was just
trying to fix a bug.

Regards,
Jason

