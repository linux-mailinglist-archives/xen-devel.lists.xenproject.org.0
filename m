Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C97B5B9C88
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 16:06:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407400.649913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYpVL-0005oJ-66; Thu, 15 Sep 2022 14:06:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407400.649913; Thu, 15 Sep 2022 14:06:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYpVL-0005kq-2H; Thu, 15 Sep 2022 14:06:11 +0000
Received: by outflank-mailman (input) for mailman id 407400;
 Thu, 15 Sep 2022 14:06:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iaaQ=ZS=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1oYpVJ-0005kh-S5
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 14:06:10 +0000
Received: from MTA-06-3.privateemail.com (mta-06-3.privateemail.com
 [198.54.127.59]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89f865b6-34ff-11ed-9761-273f2230c3a0;
 Thu, 15 Sep 2022 16:06:06 +0200 (CEST)
Received: from mta-06.privateemail.com (localhost [127.0.0.1])
 by mta-06.privateemail.com (Postfix) with ESMTP id 531BA18000AA
 for <xen-devel@lists.xenproject.org>; Thu, 15 Sep 2022 10:06:04 -0400 (EDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by mta-06.privateemail.com (Postfix) with ESMTPA id 2E1D418000A8
 for <xen-devel@lists.xenproject.org>; Thu, 15 Sep 2022 10:06:04 -0400 (EDT)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-3378303138bso221596477b3.9
 for <xen-devel@lists.xenproject.org>; Thu, 15 Sep 2022 07:06:04 -0700 (PDT)
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
X-Inumbo-ID: 89f865b6-34ff-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1663250764;
	bh=qa36mZLG4em6SsJOyNBocR7jBqxYwA5Hthf9k1r+Alw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Gg4zWw6fEK7/WBkTb2cEIiFi9ymEG84IqselKLyJI75h5QWuJB1i7l64rNdtZc8Iw
	 ryDCpi2l1de4n9o6ZHexHf8c9Huyx5d0BR4k/VTEakOpqHoObMnhZ6R6OD2EN/dTXH
	 /GSBpcLI56Ufv2qAjWOapKL4BBDZg5yNDudt4wZk8+gBsaiXJHf45pslkCQq33OypO
	 53F5OIv1ac0M4c37P5DXdOjg07GQMeo3eRMIVnGckRTz6Nu0s2tD9RZZ0+1lE8TXTB
	 1glWdsvZKaEKyTfbxMeIwS8qYO3LMeq1USA0McalevGevmdx5Zi+MFN8qqb0nvZI0T
	 e2Y2pTSvRCeDQ==
X-Gm-Message-State: ACgBeo0KWCufRhv6yld5kcSA9RxhcXnxGTaFf0aOIUYO5HZfhZzmChyz
	IfqGqTfixaOghV7U+Ns1zkc00UmEy0lAX1Bee4k=
X-Google-Smtp-Source: AA6agR6Al1bODeSVvdcHbGpCO8eiE81OHEMPbwVtHMDDFC9tdYiItWaHvrhV81rbON/pZWrN/zLMo+CwCKXjpmld/i0=
X-Received: by 2002:a0d:f201:0:b0:335:4933:6683 with SMTP id
 b1-20020a0df201000000b0033549336683mr33302344ywf.23.1663250763453; Thu, 15
 Sep 2022 07:06:03 -0700 (PDT)
MIME-Version: 1.0
References: <CABfawhmXWouFVRVrtX82Dh+8maaJqnDSDL=Me7_fzBGdM4oE2Q@mail.gmail.com>
 <YyJOWDWYVpShtAU9@mail-itl> <CABfawhnLzmBLjeVGAFVMy27MCGMrddaic_31FvuJ3sCevsvXww@mail.gmail.com>
 <32e97d9a-a5b6-05bb-5cb2-bf9a1461c851@suse.com>
In-Reply-To: <32e97d9a-a5b6-05bb-5cb2-bf9a1461c851@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 15 Sep 2022 10:05:27 -0400
X-Gmail-Original-Message-ID: <CABfawhmdja_qkomOq=8HLGAW1MWA6rcG=Aqo+frM6eYrgUYkSw@mail.gmail.com>
Message-ID: <CABfawhmdja_qkomOq=8HLGAW1MWA6rcG=Aqo+frM6eYrgUYkSw@mail.gmail.com>
Subject: Re: Console output stops on dbgp=xhci
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Thu, Sep 15, 2022 at 3:56 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 15.09.2022 02:41, Tamas K Lengyel wrote:
> >>> Do you have any idea what might be going on and preventing the output
> >>> from showing over USB3 afterwards? The /dev/ttyUSB0 device is still
> >>> present on the receiving side, just nothing is being received over it.
> >>
> >> There are few more patches in the series that are de facto required.
> >> Especially those about IOMMU, otherwise it can only possibly work with
> >> iommu=0 (which I'm not sure if even is enough).
> >
> > Unfortunately with iommu=0 Xen doesn't boot at all for me. I see this
> > on the console:
> >
> > (XEN) Panic on CPU 0:
> > (XEN) FATAL PAGE FAULT
> > (XEN) [error_code=0011]
> > (XEN) Faulting linear address: 00000000328b3a54
>
> Perhaps in another thread, could you post details about this? I guess
> we want to address this independent of your XHCI issue. That's an
> attempt to execute code outside of the Xen image - the only reason I
> can think of for this would be an EFI boot services or runtime
> services call, with (possibly but not necessarily) quirky EFI firmware.
> Any other context this is appearing in would quite certainly require a
> fix in Xen, and I don't see how "iommu=0" could affect the set of EFI
> calls we make.

This was indeed observed with a xen.efi booted directly from UEFI.
Beside the limited boot log I get through xhci I don't have more
insight but happy to send that (and anything else you think would be
useful).

Tamas

