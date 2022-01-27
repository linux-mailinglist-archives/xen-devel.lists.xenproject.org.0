Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1203049EE6F
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 00:07:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261779.453523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDDqo-00022f-Q0; Thu, 27 Jan 2022 23:06:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261779.453523; Thu, 27 Jan 2022 23:06:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDDqo-000200-Lc; Thu, 27 Jan 2022 23:06:46 +0000
Received: by outflank-mailman (input) for mailman id 261779;
 Thu, 27 Jan 2022 23:06:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F3iz=SL=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1nDDqn-0001ZC-Hs
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 23:06:45 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cbacba37-7fc5-11ec-8eb8-a37418f5ba1a;
 Fri, 28 Jan 2022 00:06:44 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso6931982wmj.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jan 2022 15:06:44 -0800 (PST)
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
X-Inumbo-ID: cbacba37-7fc5-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dbraYYMiRiczT/Ho84MUyk24oR1IuMOPK/STodgWYuk=;
        b=RBWiA6wwRGVbL1Okl2lC4alfAO5ma5rnFGkadco39YEMKi/wnnQAjjXPhEymOujU2d
         uE0Wb1Vh+R5ClHpMd9BtZyyyXbPFBlYHcMN9mgy3aC6pt61JX3fKWzYCmBw9givnN+oH
         fLnm+q0Qohm/J1egGPTc1OOrEn5o3ydc6ragZLqbv2XMM2//fbTFATxgJWgNvDIapJJo
         nGOmVLDIHYmANgHxh8O4RfZH1fAsqzriQ+litflkwwYCbJtLba8YjDh5EpEbR+viEIbJ
         giKpMePLwkjgLEqHs7Yh3JyXQZpdYvM0N3sxDbNoHGsnZLTYFdK7kM2Bcc7S9X5Av+cJ
         Pk5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dbraYYMiRiczT/Ho84MUyk24oR1IuMOPK/STodgWYuk=;
        b=586gF69dxNHXnRvQzHG4ek0r2+QHI08LLIkpLUsWA+sLuFX/5+C7BQKmXW+8XBk3HR
         XqcHbeJnA1F5sz1RI1DxB8K4WhXluUZa3M5aFTrEmQ4DzQ05OYOQNFpv0AktNASIABp+
         +IqTjsbzoGRcWtVkYLZPPzRjDxoEj63slBgRx1rBo5S341dqi3CjbuNbVKEOdJdoxTA6
         r+xr2Vy93GYMRaQZBmZc5bH9nhMGQPqZ1aNE8QA9wTQlf1SCRD4bceenPea0UaKvgFE5
         knYqOtzMbruPP/lQiLJLtl7qqxZoGms7HfJ3PFn7OMZMPuRqipeF4zJtPpq/aK0LT2jM
         SA7g==
X-Gm-Message-State: AOAM533scoA04d+UoGkqVISccvURsZ40M+gZcYMBAWK6C0hIc10ikI12
	R5Y5EOhpY3N34n0j65LhEisT2/caTZP8lu122Cg=
X-Google-Smtp-Source: ABdhPJwysP9AZhbuHukIfUluOTbiDu3jyKjAsglXdydmAhO+Kh+/HNC+qUlQUBEC/IZtqCOUrGtNfM055bzzKYBDWmM=
X-Received: by 2002:a05:600c:491:: with SMTP id d17mr6628829wme.130.1643324804183;
 Thu, 27 Jan 2022 15:06:44 -0800 (PST)
MIME-Version: 1.0
References: <20220126165827.61168-1-ayankuma@xilinx.com> <CAJ=z9a1KjOAeR4vpRQGA_sYSvx1h331NKim2bgG8jyru94Beow@mail.gmail.com>
 <eeedbb72-d881-363d-c862-234b705eaec7@xilinx.com> <CAJ=z9a0VEqr_ODQZvdsO82PiOpHt5-TVc4JWE5pJCeNYPh+XHg@mail.gmail.com>
 <bee7ea7a-6d3d-bf3c-4b5f-d40deb601867@xilinx.com> <2064878e-4ef1-f0a3-1476-7175c2c8d29e@xen.org>
 <bcd28a18-80ea-0987-6867-5c6fc634a8a5@xilinx.com> <f6853134-8b65-5ffb-b39a-62ed26b3f499@xen.org>
 <alpine.DEB.2.22.394.2201271327430.27308@ubuntu-linux-20-04-desktop> <CAJ=z9a2Sp6w0b21p96YHx4w_m0jAbYJ4v=cVar-1nPeL7SotZw@mail.gmail.com>
In-Reply-To: <CAJ=z9a2Sp6w0b21p96YHx4w_m0jAbYJ4v=cVar-1nPeL7SotZw@mail.gmail.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Thu, 27 Jan 2022 23:06:32 +0000
Message-ID: <CAJ=z9a1HML30aGn52GY34g-QbvLPHep7j=H-UDxsH1+B0CEb3Q@mail.gmail.com>
Subject: Re: [XEN v1] xen/arm: io: Check ESR_EL2.ISV != 0 before searching for
 a MMIO handler
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>, 
	xen-devel <xen-devel@lists.xenproject.org>, stefanos@xilinx.com, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Jan 2022 at 23:05, Julien Grall <julien.grall.oss@gmail.com> wrote:
>
> On Thu, 27 Jan 2022 at 22:40, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > I am with you on both points.
> >
> > One thing I noticed is that the code today is not able to deal with
> > IO_UNHANDLED for MMIO regions handled by IOREQ servers or Xen MMIO
> > emulator handlers. p2m_resolve_translation_fault and try_map_mmio are
> > called after try_handle_mmio returns IO_UNHANDLED but try_handle_mmio is
> > not called a second time (or am I mistaken?)
>
> Why would you need it? If try_mmio_fault() doesn't work the first time, then

Sorry I meant try_handle_mmio().

> it will not work the second it.
>
> >
> > Another thing I noticed is that currently find_mmio_handler and
> > try_fwd_ioserv expect dabt to be already populated and valid so it would
> > be better if we could get there only when dabt.valid.
> >
> > With these two things in mind, I think maybe the best thing to do is to
> > change the code in do_trap_stage2_abort_guest slightly so that
> > p2m_resolve_translation_fault and try_map_mmio are called first when
> > !dabt.valid.
>
> An abort will mostly likely happen because of emulated I/O. If we call
> p2m_resolve_translation_fault() and try_map_mmio() first, then it means
> the processing will take longer than necessary for the common case.
>
> So I think we want to keep the order as it is. I.e first trying the MMIO
> and then falling back to the less likely reason for a trap.
>
> >
> > Patch below only for explaning; it doesn't build as is and I am not sure
> > it is 100% correct. For instance, if try_map_mmio succeeds, should we
> > return or goto again?
>
> If try_map_mmio() succeeds then it means we create a valid entry
> in the stage-2. Therefore, we want to return to the guest and
> try to execute the instruction.
>
> The same is valid for p2m_resolve_translation_fault(). If it works
> then it means we successfully set the valid bit in an entry. So
> we want to re-try directly.
>
> Cheers,

