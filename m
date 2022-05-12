Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FA9524EA0
	for <lists+xen-devel@lfdr.de>; Thu, 12 May 2022 15:47:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327674.550515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np9AP-0003l0-7s; Thu, 12 May 2022 13:47:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327674.550515; Thu, 12 May 2022 13:47:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np9AP-0003iU-4a; Thu, 12 May 2022 13:47:45 +0000
Received: by outflank-mailman (input) for mailman id 327674;
 Thu, 12 May 2022 13:47:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1xTb=VU=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1np9AN-0003B0-8O
 for xen-devel@lists.xenproject.org; Thu, 12 May 2022 13:47:43 +0000
Received: from MTA-06-4.privateemail.com (mta-06-4.privateemail.com
 [198.54.122.146]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1076fb6d-d1fa-11ec-8fc4-03012f2f19d4;
 Thu, 12 May 2022 15:47:30 +0200 (CEST)
Received: from mta-06.privateemail.com (localhost [127.0.0.1])
 by mta-06.privateemail.com (Postfix) with ESMTP id 653CA1802967
 for <xen-devel@lists.xenproject.org>; Thu, 12 May 2022 09:47:39 -0400 (EDT)
Received: from mail-ot1-f47.google.com (unknown [10.20.151.147])
 by mta-06.privateemail.com (Postfix) with ESMTPA id 3F365180295E
 for <xen-devel@lists.xenproject.org>; Thu, 12 May 2022 09:47:39 -0400 (EDT)
Received: by mail-ot1-f47.google.com with SMTP id
 l9-20020a056830268900b006054381dd35so2715577otu.4
 for <xen-devel@lists.xenproject.org>; Thu, 12 May 2022 06:47:39 -0700 (PDT)
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
X-Inumbo-ID: 1076fb6d-d1fa-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1652363259;
	bh=rFDMYj2IlgGvJB/lwHo5lL4pB5ukzaALgOMe2/BY1nk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=x0TRRWzn8RHNrB6qesOY5mewb5Pp7cuLKw5Ik/s+FzbLImM1qEc0zrAr2m//gPq3X
	 4ZrUlnAIwoar1GHe6JHqVwROmA/tT5pgJGeXFBR5GACgtNHBpQYfO3OKVCmljc+lnc
	 SbeN7HBoQt0z16ApOzDyu0dEiWt+a2ZZLZNAfBIzHyBhYS85QeikS5taqUIdEMyt+m
	 HMojWg70x8JyO0rz2aKt4mP6/t/ed7EJgQicfSutyjg/eZY5b4GYQasgRQZsHQrvKm
	 HlqOBt9bDYuDhFa5KFmEnTXlVFzogq/8ZcmVvoSQoV1+W3IsxiAPNvm15QmGqEt7vA
	 /xeUq/Voiq2Rg==
X-Gm-Message-State: AOAM532oyjxy7HW7z2fmfm+F2KgdOtrWZxAWISNCx9wdg9yFFpfPPtDj
	od/Z0PFb7HbHfaPIslLJDoGUD+WSUECo9jnTK5E=
X-Google-Smtp-Source: ABdhPJwHpMCXstenmKKxWh6QuaYeIhHDwRMUI/7MYtEQPt8Lxt49dlSygTbIGUYLWA9g2aa4LPqUQVHNO454OQGn+/Q=
X-Received: by 2002:a05:6830:1e86:b0:606:48b8:252c with SMTP id
 n6-20020a0568301e8600b0060648b8252cmr7603otr.204.1652363258562; Thu, 12 May
 2022 06:47:38 -0700 (PDT)
MIME-Version: 1.0
References: <7f03387eebf9de474f404ef661f80133e3725365.1651073086.git.tamas.lengyel@intel.com>
 <65645a9d2ada525c9ffc07dce594eeff5891b5a7.1651073086.git.tamas.lengyel@intel.com>
 <CABfawhmqnCXBBMsjJ1OUsiZQ2S+bAHXq_cuhi5GqKw8qKMBtGw@mail.gmail.com>
In-Reply-To: <CABfawhmqnCXBBMsjJ1OUsiZQ2S+bAHXq_cuhi5GqKw8qKMBtGw@mail.gmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 12 May 2022 09:47:03 -0400
X-Gmail-Original-Message-ID: <CABfawh=pwDVCW9HYNK7+5gAh1+MPzCGxePyzUE7G1JgrOrj1=A@mail.gmail.com>
Message-ID: <CABfawh=pwDVCW9HYNK7+5gAh1+MPzCGxePyzUE7G1JgrOrj1=A@mail.gmail.com>
Subject: Re: [PATCH 3/3] x86/monitor: Add new monitor event to catch all vmexits
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Wed, May 4, 2022 at 9:12 AM Tamas K Lengyel <tamas@tklengyel.com> wrote:
>
> On Wed, Apr 27, 2022 at 11:51 AM Tamas K Lengyel
> <tamas.lengyel@intel.com> wrote:
> >
> > Add monitor event that hooks the vmexit handler allowing for both sync and
> > async monitoring of events. With async monitoring an event is placed on the
> > monitor ring for each exit and the rest of the vmexit handler resumes normally.
> > If there are additional monitor events configured those will also place their
> > respective events on the monitor ring.
> >
> > With the sync version an event is placed on the monitor ring but the handler
> > does not get resumed, thus the sync version is only useful when the VM is not
> > expected to resume normally after the vmexit. Our use-case is primarily with
> > the sync version with VM forks where the fork gets reset after sync vmexit
> > event, thus the rest of the vmexit handler can be safely skipped. This is
> > very useful when we want to avoid Xen crashing the VM under any circumstance,
> > for example during fuzzing. Collecting all vmexit information regardless of
> > the root cause makes it easier to reason about the state of the VM on the
> > monitor side, hence we opt to receive all events, even for external interrupt
> > and NMI exits and let the monitor agent decide how to proceed.
> >
> > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> > ---
> > v5: wrap vmexit fields in arch.vmx structures in the public vm_event ABI
>
> Patch ping. Could a toolstack maintainer please take a look at this?
> The hypervisor side already has a Reviewed-by.

Patch ping.

Tamas

