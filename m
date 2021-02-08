Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDA23141A7
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 22:25:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83067.153823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9E0g-0000kF-Ge; Mon, 08 Feb 2021 21:23:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83067.153823; Mon, 08 Feb 2021 21:23:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9E0g-0000jq-DH; Mon, 08 Feb 2021 21:23:54 +0000
Received: by outflank-mailman (input) for mailman id 83067;
 Mon, 08 Feb 2021 21:23:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C6zY=HK=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1l9E0e-0000jl-IH
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 21:23:52 +0000
Received: from mail-ej1-x635.google.com (unknown [2a00:1450:4864:20::635])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab5f131a-5490-4627-9b4b-42ebac14542f;
 Mon, 08 Feb 2021 21:23:51 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id y9so27680413ejp.10
 for <xen-devel@lists.xenproject.org>; Mon, 08 Feb 2021 13:23:51 -0800 (PST)
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
X-Inumbo-ID: ab5f131a-5490-4627-9b4b-42ebac14542f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v1ZuOx2gp/cNkIxL2LILsvUXrDaY2isqlU5IhoGVUD0=;
        b=TqBaOO6xNX/iudZQU71vPeUqahRHOLvkgAqRFrkhgr/00t2z9zdIdgZWRJUqAXfBw2
         yhdI9YbDHfTE0vzKKvyYfewLkY0KlMvXRnPIydcLE5DwMbEEz+n3MNzogzPOmGIP/Svh
         Rp8F3V+qc5/tM/T8JVLbNe5JsyrZC/Jid6te3LjEB5MZqWIZjQJoc/qAEYf7Pxc0HoyT
         2PyIG0fO0WpBl1ESJDVLMdsHcJIs+dg8RSC7bNTiI2P6TNHsNj9vxl4p0YsFyqjNr19z
         4SSdF5tWL3wj1kTIlcTSp6txTMcmys/8njznPA0uRJGSFxkazLw72JCXO3jDZILsOwEa
         ictA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v1ZuOx2gp/cNkIxL2LILsvUXrDaY2isqlU5IhoGVUD0=;
        b=nSCkHic9xFDZAOV+CQK5ETfX9FjhKd3invym9047ols/krPXFZfjkytpcGAuDjJPe1
         abCM50+oJDUuscYagV5zBNu/YQfQjaXuCBxUIhXn+y0iVCNLPJoHWl3VgTJMmo9+gxyC
         H7KJ1Q/qDVyNZUWoeWkUwygTNrYA/IoYb2yro5o0ZV/uRjA4LjIXNKWbCP9Ex+/JEA4n
         5nVFaHBR9kT69eolblA0dB+yEST6vEE8bseTWkTFKY/NHsfvzj2ESq5snrjBLTHXFjBh
         FSA100ObNMJ2DW+ZMhCtqAOrQNKCc5eUCJ9tXFbhvbkeaiR9ONZzITxyh6rbiM81hBvL
         vy4w==
X-Gm-Message-State: AOAM530Je+QLUsJJj/wdTb9Cpy0klEZ6WryfI/Wcd8/kGd/UivXOfGjT
	+grJXlUmlFIfB0DCspABeZTBarrmbWaGRC4gLdo=
X-Google-Smtp-Source: ABdhPJy2p7f9LGP0+iO6NkxAcrM49vDk/utYgPwwfUhir9l5pQWZD6PQi87Q38XJcvwD9vw57sB69bTo9P8JKJiHTuc=
X-Received: by 2002:a17:906:b082:: with SMTP id x2mr18365035ejy.100.1612819430538;
 Mon, 08 Feb 2021 13:23:50 -0800 (PST)
MIME-Version: 1.0
References: <20210208184932.23468-1-sstabellini@kernel.org>
 <173ed75a-94cf-26a5-9271-a687bf201578@xen.org> <alpine.DEB.2.21.2102081214010.8948@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2102081214010.8948@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Mon, 8 Feb 2021 21:23:39 +0000
Message-ID: <CAJ=z9a3uhiFKE6gepaPvWZxqRErCyLiv2CTDSx3Sihef7CaMtQ@mail.gmail.com>
Subject: Re: [PATCH v2] xen/arm: fix gnttab_need_iommu_mapping
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: lucmiccio@gmail.com, xen-devel <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Rahul Singh <Rahul.Singh@arm.com>, Stefano Stabellini <stefano.stabellini@xilinx.com>, 
	Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Feb 2021 at 20:24, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > @Ian, I think this wants to go in 4.15. Without it, Xen may receive an IOMMU
> > fault for DMA transaction using granted page.
> >
> > > Backport: 4.12+
> > >
> > > ---
> > >
> > > Given the severity of the bug, I would like to request this patch to be
> > > backported to 4.12 too, even if 4.12 is security-fixes only since Oct
> > > 2020.
> >
> > I would agree that the bug is bad, but it is not clear to me why this would be
> > warrant for an exception for backporting. Can you outline what's the worse
> > that can happen?
> >
> > Correct me if I am wrong, if one can hit this error, then it should be pretty
> > reliable. Therefore, anyone wanted to use 4.12 in production should have seen
> > if the error on there setup by now (4.12 has been out for nearly two years).
> > If not, then they are most likely not affected.
> >
> > Any new users of Xen should use the latest stable rather than starting with an
> > old version.
>
> Yes, the bug reproduces reliably but it takes more than a smoke test to
> find it. That's why it wasn't found by OSSTest and also our internal
> CI-loop at Xilinx.

Ok. So a user should be able to catch it during testing, is that correct?

>
> Users can be very slow at upgrading, so I am worried that 4.12 might still
> be picked by somebody, especially given that it is still security
> supported for a while.

Don't tell me about upgrading Xen... ;) But I am a bit confused, are
you worried about existing users or new users?

>
> > Other than the seriousness of the bug, I think there is also a fairness
> > concern.
> >
> > So far our rules says there is only security support backport allowed. If we
> > start granting exception, then we need a way to prevent abuse of it. To take
> > an extreme example, why one couldn't ask backport for 4.2?
> >
> > That said, I vaguely remember this topic was brought up a few time on
> > security@. So maybe it is time to have a new discussion about stable tree.
>
> I wouldn't consider a backport for a tree that is closed even for
> security backports. So in your example, I'd say no to a backport to 4.2
> or 4.10.
>
> I think there is a valid question for trees that are still open to
> security fixes but not general backports.
>
> For these cases, I would just follow a simple rule of thumb:

Aren't those rules already used for stable trees?

> - is the submitter willing to provide the backport?
> - is the backport low-risk?
> - is the underlying bug important?

You wrote multiple times that this is serious but it is still not
clear what's the worse that can happen...

>
> If the answer to all is "yes" then I'd go with it.
>
>
> In this case, given that the fix is a one-liner, and obviously correct,

I have seen one-liners that introduced XSA in the past ;).

Cheers,

