Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B742E7F8D
	for <lists+xen-devel@lfdr.de>; Thu, 31 Dec 2020 12:03:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.60511.106213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuvjK-0008Ft-Qn; Thu, 31 Dec 2020 11:02:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 60511.106213; Thu, 31 Dec 2020 11:02:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuvjK-0008FU-Me; Thu, 31 Dec 2020 11:02:54 +0000
Received: by outflank-mailman (input) for mailman id 60511;
 Thu, 31 Dec 2020 11:02:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dAqn=GD=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1kuvjJ-0008FP-MH
 for xen-devel@lists.xenproject.org; Thu, 31 Dec 2020 11:02:53 +0000
Received: from mail-wr1-x42c.google.com (unknown [2a00:1450:4864:20::42c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ebe8e422-2334-4798-9250-f90471252faf;
 Thu, 31 Dec 2020 11:02:52 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id i9so19830315wrc.4
 for <xen-devel@lists.xenproject.org>; Thu, 31 Dec 2020 03:02:52 -0800 (PST)
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
X-Inumbo-ID: ebe8e422-2334-4798-9250-f90471252faf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xvYCiRm40T+IOndfILisAAlIvqeZAGx2ftumdhEjG58=;
        b=liXJ/Hhfcmaymy/3WHUZRo3qF9uEUdg1iPeGW+uSCirhhPUeuq7DjMoiSQ8ulwhEul
         H8/Q6aR5diKgAHj2sNu/F0sr7SJIvvdyRA4cyaanntdOM0z0/61M9qe4kX4Jj30SGINQ
         s8JG3TR2PYu4R0nBDdMAr/4KP6WQdIK2uJZERGSkmHs8KkXYDC7P9ZH/sqBaMn/rlxUw
         ycQdw29byDJwBPMXLOaDAi9BiQJf66MCY2Tvz8gtvkdFqq3tp+ms59V/KZvCBr6jWAYo
         mTkeK8VDsTEeHe4Y4qGaWtD0zsyQsTp4Pn/J+g5kf/8kQj2tUAQzDueMEZDqJ/m7zvQA
         sz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xvYCiRm40T+IOndfILisAAlIvqeZAGx2ftumdhEjG58=;
        b=LiJ42MtCvr4Ml6h6HxVmGgbCajShhnaOBlRiiV43f6gfFDSNVRZBezwFDYWyTJK8S7
         NZVLXVQib8MIFl/2YxiVEO54m2lrcUk/U5NjPpP8v2EjFx8Zp4HHsnjZ8VuFmnJn5Mlj
         49Md1Hv+5abO2hP0y5pBjVEJYugSA4Ymk04zme4EY1cDv+mi1SOfR7DydRNcrXwLBvxX
         SGtoXpSWhK52hUuRjQTbD/WoQXn12seEbktaf+pS63YDRnsh9n7v/FYCIlmIMCbEZx0j
         ORqR/tIR8iSLrvp4UADY7AMTOmphSQ+M1EPurCd3jeYS/G5SSuCUMIE9w7vO4r1Em6hT
         5+ZQ==
X-Gm-Message-State: AOAM5333ArASD4O6aThxIwaKU0FI+kIxchIXyKGIljsUIfTaoSJSkVRV
	/WcvuSniSpWnDdA1JDsy8np0qSm3qP7+Na7LSTk=
X-Google-Smtp-Source: ABdhPJwzgh3ckWmJJYQkSbenwffHePG+RSFmUgjh2OCViwgB7Y03yquEOlAC8V11OBDBgUpyBFXIJtsDS1WL5r9v1Jg=
X-Received: by 2002:a5d:43d2:: with SMTP id v18mr64418085wrr.326.1609412571831;
 Thu, 31 Dec 2020 03:02:51 -0800 (PST)
MIME-Version: 1.0
References: <DBCC8190-7228-483E-AE8A-09880B28F516@gmail.com>
 <20201229091730.owgpdeekb7pcex7t@Air-de-Roger> <eac811f4-51fd-9198-446a-230dc6915f62@xen.org>
 <20201231084556.ogvltixgd6ovlja2@Air-de-Roger>
In-Reply-To: <20201231084556.ogvltixgd6ovlja2@Air-de-Roger>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Thu, 31 Dec 2020 11:02:40 +0000
Message-ID: <CAJ=z9a2xJ2g_UL2oMzyQBGB1cA3nqdOrDYMPg2urHesHs0Dk5A@mail.gmail.com>
Subject: Re: [openxt-dev] VirtIO-Argo initial development proposal
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Rich Persaud <persaur@gmail.com>, Jean-Philippe Ouellet <jpo@vt.edu>, 
	Christopher Clark <christopher.w.clark@gmail.com>, openxt <openxt@googlegroups.com>, 
	xen-devel <xen-devel@lists.xenproject.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>, 
	Julien Grall <jgrall@amazon.com>, James McKenzie <james@bromium.com>, 
	Andrew Cooper <Andrew.Cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 31 Dec 2020 at 08:46, Roger Pau Monn=C3=A9 <roger.pau@citrix.com> w=
rote:
>
> On Wed, Dec 30, 2020 at 11:30:03AM +0000, Julien Grall wrote:
> > Hi Roger,
> >
> > On 29/12/2020 09:17, Roger Pau Monn=C3=A9 wrote:
> > > On Wed, Dec 23, 2020 at 04:32:01PM -0500, Rich Persaud wrote:
> > > > =EF=BB=BFOn Dec 17, 2020, at 07:13, Jean-Philippe Ouellet <jpo@vt.e=
du> wrote:
> > > > > =EF=BB=BFOn Wed, Dec 16, 2020 at 2:37 PM Christopher Clark
> > > > > <christopher.w.clark@gmail.com> wrote:
> > > > > > Hi all,
> > > > > >
> > > > > > I have written a page for the OpenXT wiki describing a proposal=
 for
> > > > > > initial development towards the VirtIO-Argo transport driver, a=
nd the
> > > > > > related system components to support it, destined for OpenXT an=
d
> > > > > > upstream projects:
> > > > > >
> > > > > > https://openxt.atlassian.net/wiki/spaces/~cclark/pages/16961699=
85/VirtIO-Argo+Development+Phase+1
> > >
> > > Thanks for the detailed document, I've taken a look and there's indee=
d
> > > a lot of work to do listed there :). I have some suggestion and
> > > questions.
> > >
> > > Overall I think it would be easier for VirtIO to take a new transport
> > > if it's not tied to a specific hypervisor. The way Argo is implemente=
d
> > > right now is using hypercalls, which is a mechanism specific to Xen.
> > The concept of hypervisor call is not Xen specific. Any other hyperviso=
r can
> > easily implement them. At least this is the case on Arm because we have=
 an
> > instruction 'hvc' that acts the same way as a syscall but for the
> > hypervisor.
> >
> > What we would need to do is reserving a range for Argos. It should be
> > possible to do it on Arm thanks to the SMCCC (see [1]).
> >
> > I am not sure whether you have something similar on x86.
>
> On x86 Intel has vmcall and AMD vmmcall, but those are only available
> to HVM guests.

Right, as it would for other architecture if one decided to implement
PV (or binary translated) guests.
While it may be possible to use a different way to communicate on x86
(see more below), I am not sure this would be the case for other
architectures.
The closest thing to MSR on Arm would be the System Registers. But I
am not aware of a range of IDs that could be used by the software.

>
> > > IMO it might be easier to start by having an Argo interface using
> > > MSRs, that all hypervisors can implement, and then base the VirtIO
> > > implementation on top of that interface.
> > My concern is the interface would need to be arch-specific. Would you m=
ind
> > to explain what's the problem to implement something based on vmcall?
>
> More of a recommendation than a concern, but I think it would be more
> attractive for upstream if we could provide an interface to Argo (or
> hypervisor mediated data exchange) that's no too tied into Xen
> specifics.

I agree with this statement. We also need an interface that is ideally
not to arch-specific otherwise it will be more complicated to get
adopted on other arch.
For instance, at the moment, I don't really see what else can be used
on Arm (other that MMIO and PCI) if you want to care about PV (or
binary translated) guests.

> My suggestion for using MSRs was because I think every x86 hypervisor
> must have the logic to trap and handle some of those, and also every
> OS has the helpers to read/write MSRs, and those instructions are not
> vendor specific.

In order to use MSRs, you would need to reserve a range of IDs. Do x86
have a range of ID that can be used for software purposes (i.e. the
current and future processors will not use it)?

Cheers,

