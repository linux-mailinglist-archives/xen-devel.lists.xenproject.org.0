Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E54C52BDA7
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 17:03:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332333.556019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrLCP-0001VR-7n; Wed, 18 May 2022 15:02:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332333.556019; Wed, 18 May 2022 15:02:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrLCP-0001Ry-4x; Wed, 18 May 2022 15:02:53 +0000
Received: by outflank-mailman (input) for mailman id 332333;
 Wed, 18 May 2022 15:02:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G9Z3=V2=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1nrLCN-0000tx-FH
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 15:02:51 +0000
Received: from MTA-08-3.privateemail.com (mta-08-3.privateemail.com
 [198.54.127.61]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94f1c1ae-d6bb-11ec-bd2c-47488cf2e6aa;
 Wed, 18 May 2022 17:02:50 +0200 (CEST)
Received: from mta-08.privateemail.com (localhost [127.0.0.1])
 by mta-08.privateemail.com (Postfix) with ESMTP id 336A718000B4
 for <xen-devel@lists.xenproject.org>; Wed, 18 May 2022 11:02:48 -0400 (EDT)
Received: from mail-oi1-f179.google.com (unknown [10.20.151.174])
 by mta-08.privateemail.com (Postfix) with ESMTPA id 0E5CA18000B3
 for <xen-devel@lists.xenproject.org>; Wed, 18 May 2022 11:02:48 -0400 (EDT)
Received: by mail-oi1-f179.google.com with SMTP id j12so2979598oie.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 May 2022 08:02:47 -0700 (PDT)
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
X-Inumbo-ID: 94f1c1ae-d6bb-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1652886168;
	bh=LW4XxqWXz+2GnryvG/NbA7hfXZFNFa+imz9uW0VVUnI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mOLHv8kSFT08Ob4vvzTjRwOpDwbvi+lfn4S6IsI33BhwOMZsaQ+KzGar1s6foZCvM
	 fOGx5YpiqGqeuh4ZcbXRhfL9RDSQAfd3j5kbiSFlsN4u/tgHMwtl6kb5+5ZT0PoMN9
	 VQSeYR/uTkYP+bVgm52c41/R1vDNN/X9JvB3PLqcxb3bci83htzxT2JbyHs92mc+xa
	 flvDzCfBakzWPUtWObdrxoiKjoDCH1g97ZRhFCqTyrCW4mKZ9EWek57ou607cS7w0K
	 IK2cjDwXWRhu3wOl9o5qRQWeI7kZ8XfTw3XO3N19RLZe6+ELIUzSHWoWM2OWklEFF2
	 bpkyFjc3+KVKg==
X-Gm-Message-State: AOAM532wQX4RgXro5Kte6oU8WQn8yugeJ+mye5iUIiWHb0XrIATq+uLK
	RhK0e25qORxKUaSu+niWiaC671lilhM8F6HD9Uc=
X-Google-Smtp-Source: ABdhPJzT0VjETOi6gcpFlHgSbtJYA8Qo0XHWJv8+lEvwsPWSDTubNzv4+sWNtKjZOuKwseSzWPWX27V3tLENMs5VgFs=
X-Received: by 2002:a05:6808:249:b0:326:5ccd:1688 with SMTP id
 m9-20020a056808024900b003265ccd1688mr209874oie.9.1652886167368; Wed, 18 May
 2022 08:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <7f03387eebf9de474f404ef661f80133e3725365.1651073086.git.tamas.lengyel@intel.com>
 <65645a9d2ada525c9ffc07dce594eeff5891b5a7.1651073086.git.tamas.lengyel@intel.com>
 <CABfawhmqnCXBBMsjJ1OUsiZQ2S+bAHXq_cuhi5GqKw8qKMBtGw@mail.gmail.com> <CABfawh=pwDVCW9HYNK7+5gAh1+MPzCGxePyzUE7G1JgrOrj1=A@mail.gmail.com>
In-Reply-To: <CABfawh=pwDVCW9HYNK7+5gAh1+MPzCGxePyzUE7G1JgrOrj1=A@mail.gmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 18 May 2022 11:02:11 -0400
X-Gmail-Original-Message-ID: <CABfawhm9ZbeXWxc0Gxsg4ztbH-v27gxuQ+PqfeVNyV51tWoK8w@mail.gmail.com>
Message-ID: <CABfawhm9ZbeXWxc0Gxsg4ztbH-v27gxuQ+PqfeVNyV51tWoK8w@mail.gmail.com>
Subject: Re: [PATCH 3/3] x86/monitor: Add new monitor event to catch all vmexits
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Thu, May 12, 2022 at 9:47 AM Tamas K Lengyel <tamas@tklengyel.com> wrote:
>
> On Wed, May 4, 2022 at 9:12 AM Tamas K Lengyel <tamas@tklengyel.com> wrote:
> >
> > On Wed, Apr 27, 2022 at 11:51 AM Tamas K Lengyel
> > <tamas.lengyel@intel.com> wrote:
> > >
> > > Add monitor event that hooks the vmexit handler allowing for both sync and
> > > async monitoring of events. With async monitoring an event is placed on the
> > > monitor ring for each exit and the rest of the vmexit handler resumes normally.
> > > If there are additional monitor events configured those will also place their
> > > respective events on the monitor ring.
> > >
> > > With the sync version an event is placed on the monitor ring but the handler
> > > does not get resumed, thus the sync version is only useful when the VM is not
> > > expected to resume normally after the vmexit. Our use-case is primarily with
> > > the sync version with VM forks where the fork gets reset after sync vmexit
> > > event, thus the rest of the vmexit handler can be safely skipped. This is
> > > very useful when we want to avoid Xen crashing the VM under any circumstance,
> > > for example during fuzzing. Collecting all vmexit information regardless of
> > > the root cause makes it easier to reason about the state of the VM on the
> > > monitor side, hence we opt to receive all events, even for external interrupt
> > > and NMI exits and let the monitor agent decide how to proceed.
> > >
> > > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> > > ---
> > > v5: wrap vmexit fields in arch.vmx structures in the public vm_event ABI
> >
> > Patch ping. Could a toolstack maintainer please take a look at this?
> > The hypervisor side already has a Reviewed-by.
>
> Patch ping.

Patch ping.

Tamas

