Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5122541FD87
	for <lists+xen-devel@lfdr.de>; Sat,  2 Oct 2021 19:57:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201087.355506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWjEf-0008El-17; Sat, 02 Oct 2021 17:55:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201087.355506; Sat, 02 Oct 2021 17:55:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWjEe-0008CL-UE; Sat, 02 Oct 2021 17:55:44 +0000
Received: by outflank-mailman (input) for mailman id 201087;
 Sat, 02 Oct 2021 17:55:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+enT=OW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mWjEd-0008CF-49
 for xen-devel@lists.xenproject.org; Sat, 02 Oct 2021 17:55:43 +0000
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb6ae533-aec7-41fb-aa02-5116749ef5e4;
 Sat, 02 Oct 2021 17:55:40 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id e12so865637wra.4
 for <xen-devel@lists.xenproject.org>; Sat, 02 Oct 2021 10:55:40 -0700 (PDT)
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
X-Inumbo-ID: fb6ae533-aec7-41fb-aa02-5116749ef5e4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dGngKMFKjPa3XOQmsnwRlPEwLV/SMPNEraEuuXUBR+Y=;
        b=VaD604MIZtcUU+dz0a7QMfUoYaOkkqkxtXje+TMg6U5JYhxBI2HlE/wKafZPxFaeq9
         rX2Q5+6IXm7LEPGSACTLHaE0YMefhZohXkLZvK8zuuFYOaezRGQYFh+4XFG94oZfuy8X
         F4cNt6BQo7SGfVhlLkMESiQwS4NG96aXfsopktY+merkhc9aHpwqU7WUbtt51jK41qym
         RcfZUpJRjhWDp05rzdWll9WBgyycC3FWFi6R6iygvujxDRHJhYYV9XmFilVS6CKyZ2mE
         iILVjtvnJ/+yQq8KCJgRt+tzcOBSADUEjd0an1uzdW2LGN2Zo56hSUTIfJx92WVXUqYR
         oiRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dGngKMFKjPa3XOQmsnwRlPEwLV/SMPNEraEuuXUBR+Y=;
        b=f52HMMX6m6gWzZHzEeNwaQMKk61pMC5F4b5qCdeN0PJB/NiJ2E4RAsZ5zQyeKQ9ZEb
         FH3HAttO8zoKil+0YOkKd9i8xNrup6P/dguG/Gd3OKCYMHzVcbDS5jVAOKK3ZIt4Ah4Z
         MN0MKh46scHOhpxUCJC+NNvIvPUz16etaVspFqHSUCG5gPhpBKBTvNQthVy5UmqZLK/x
         yS2sWAS3Owe9AST9TYnNQV2GlcT2nfII5h6LdLFX8Dd6N9SPcqfI2FCsnOnoxHcXB8Hf
         01Iz7EdrToZeZ7e31b5+bv51Tf7wVoBWdokFZhQAlsflA8SUZ2dBwKzl78DSOg24FsrB
         43bQ==
X-Gm-Message-State: AOAM531aOOULrQcqxiXpHnqaMwxoQ1vcw3AKB4nIRlsUZjMHXGykLhSa
	PlIptdnjCdREpoJGcdnERCuQpxuOL9omPDvvxko=
X-Google-Smtp-Source: ABdhPJxeZ05uzvzfMnZZ8T3qniKSC5fkVQ+eJ6gLzDs/dkJkBIKbPHC8xlD699miunEqPLBln5s9iUBH6XHCpUMVV64=
X-Received: by 2002:a5d:4882:: with SMTP id g2mr4282753wrq.399.1633197339442;
 Sat, 02 Oct 2021 10:55:39 -0700 (PDT)
MIME-Version: 1.0
References: <87pmsylywy.fsf@linaro.org> <YU5mW396S04IsCBr@mail-itl>
 <874ka68h96.fsf@linaro.org> <CACMJ4GbgnQVQbH1N3Duxmx10n-Qv+zzncqarNyuhmKhE-wqdqA@mail.gmail.com>
 <alpine.DEB.2.21.2109272323160.5022@sstabellini-ThinkPad-T480s>
 <CAPD2p-=MdGB_a+oEsFrPQpLo7GeKkMwYyAWcQt3z0qrGr3vR7w@mail.gmail.com> <alpine.DEB.2.21.2110011649220.3209@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2110011649220.3209@sstabellini-ThinkPad-T480s>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Sat, 2 Oct 2021 20:55:28 +0300
Message-ID: <CAPD2p-m=hYbG1YjPZ9yZ7Qzs6KjCT2jSHpaDUPB0sFJoZfY4uw@mail.gmail.com>
Subject: Re: [Stratos-dev] Xen Rust VirtIO demos work breakdown for Project Stratos
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Christopher Clark <christopher.w.clark@gmail.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Artem Mygaiev <Artem_Mygaiev@epam.com>, Sergio Lopez <slp@redhat.com>, Wei Liu <wl@xen.org>, 
	Stefan Hajnoczi <stefanha@gmail.com>, Rust-VMM Mailing List <rust-vmm@lists.opendev.org>, 
	Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Arnd Bergmann <arnd.bergmann@linaro.org>, David Woodhouse <dwmw2@infradead.org>, 
	Stratos Mailing List <stratos-dev@op-lists.linaro.org>, Rich Persaud <persaur@gmail.com>, 
	Daniel Smith <dpsmith@apertussolutions.com>, Paul Durrant <paul@xen.org>, 
	openxt <openxt@googlegroups.com>, Julien Grall <julien@xen.org>
Content-Type: multipart/alternative; boundary="0000000000004401fb05cd6263d8"

--0000000000004401fb05cd6263d8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 2, 2021 at 2:58 AM Stefano Stabellini <sstabellini@kernel.org>
wrote:

Hi Stefano, all

[Sorry for the possible format issues]
[I have CCed Julien]


On Tue, 28 Sep 2021, Oleksandr Tyshchenko wrote:
> > On Tue, Sep 28, 2021 at 9:26 AM Stefano Stabellini <
> sstabellini@kernel.org> wrote:
> >
> > Hi Stefano, all
> >
> > [Sorry for the possible format issues]
> >
> >
> >       On Mon, 27 Sep 2021, Christopher Clark wrote:
> >       > On Mon, Sep 27, 2021 at 3:06 AM Alex Benn=C3=A9e via Stratos-de=
v <
> stratos-dev@op-lists.linaro.org> wrote:
> >       >
> >       >       Marek Marczykowski-G=C3=B3recki <
> marmarek@invisiblethingslab.com> writes:
> >       >
> >       >       > [[PGP Signed Part:Undecided]]
> >       >       > On Fri, Sep 24, 2021 at 05:02:46PM +0100, Alex Benn=C3=
=A9e
> wrote:
> >       >       >> Hi,
> >       >       >
> >       >       > Hi,
> >       >       >
> >       >       >> 2.1 Stable ABI for foreignmemory mapping to non-dom0
> ([STR-57])
> >       >       >>
> =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
> >       >       >>
> >       >       >>   Currently the foreign memory mapping support only
> works for dom0 due
> >       >       >>   to reference counting issues. If we are to support
> backends running in
> >       >       >>   their own domains this will need to get fixed.
> >       >       >>
> >       >       >>   Estimate: 8w
> >       >       >>
> >       >       >>
> >       >       >> [STR-57] <https://linaro.atlassian.net/browse/STR-57>
> >       >       >
> >       >       > I'm pretty sure it was discussed before, but I can't
> find relevant
> >       >       > (part of) thread right now: does your model assumes the
> backend (running
> >       >       > outside of dom0) will gain ability to map (or access in
> other way)
> >       >       > _arbitrary_ memory page of a frontend domain? Or worse:
> any domain?
> >       >
> >       >       The aim is for some DomU's to host backends for other
> DomU's instead of
> >       >       all backends being in Dom0. Those backend DomU's would
> have to be
> >       >       considered trusted because as you say the default memory
> model of VirtIO
> >       >       is to have full access to the frontend domains memory map=
.
> >       >
> >       >
> >       > I share Marek's concern. I believe that there are Xen-based
> systems that will want to run guests using VirtIO devices without
> >       extending
> >       > this level of trust to the backend domains.
> >
> >       >From a safety perspective, it would be challenging to deploy a
> system
> >       with privileged backends. From a safety perspective, it would be =
a
> lot
> >       easier if the backend were unprivileged.
> >
> >       This is one of those times where safety and security requirements
> are
> >       actually aligned.
> >
> >
> > Well, the foreign memory mapping has one advantage in the context of
> Virtio use-case
> > which is that Virtio infrastructure in Guest doesn't require any
> modifications to run on top Xen.
> > The only issue with foreign memory here is that Guest memory actually
> mapped without its agreement
> > which doesn't perfectly fit into the security model. (although there is
> one more issue with XSA-300,
> > but I think it will go away sooner or later, at least there are some
> attempts to eliminate it).
> > While the ability to map any part of Guest memory is not an issue for
> the backend running in Dom0
> > (which we usually trust), this will certainly violate Xen security mode=
l
> if we want to run it in other
> > domain, so I completely agree with the existing concern.
>
> Yep, that's what I was referring to.
>
>
> > It was discussed before [1], but I couldn't find any decisions regardin=
g
> that. As I understand,
> > the one of the possible ideas is to have some entity in Xen (PV
> IOMMU/virtio-iommu/whatever)
> > that works in protection mode, so it denies all foreign mapping request=
s
> from the backend running in DomU
> > by default and only allows requests with mapping which were *implicitly=
*
> granted by the Guest before.
> > For example, Xen could be informed which MMIOs hold the queue PFN and
> notify registers
> > (as it traps the accesses to these registers anyway) and could
> theoretically parse the frontend request
> > and retrieve descriptors to make a decision which GFNs are actually
> *allowed*.
> >
> > I can't say for sure (sorry not familiar enough with the topic), but
> implementing the virtio-iommu device
> > in Xen we could probably avoid Guest modifications at all. Of course,
> for this to work
> > the Virtio infrastructure in Guest should use DMA API as mentioned in
> [1].
> >
> > Would the =E2=80=9Crestricted foreign mapping=E2=80=9D solution retain =
the Xen security
> model and be accepted
> > by the Xen community? I wonder, has someone already looked in this
> direction, are there any
> > pitfalls here or is this even feasible?
> >
> > [1]
> https://lore.kernel.org/xen-devel/464e91ec-2b53-2338-43c7-a018087fc7f6@ar=
m.com/
>
> The discussion that went further is actually one based on the idea that
> there is a pre-shared memory area and the frontend always passes
> addresses from it. For ease of implementation, the pre-shared area is
> the virtqueue itself so this approach has been called "fat virtqueue".
> But it requires guest modifications and it probably results in
> additional memory copies.
>

I got it. Although we would need to map that pre-shared area anyway (I
presume it could be done at once during initialization), I think it much
better than
map arbitrary pages at runtime. If there is a way for Xen to know the
pre-shared area location in advance it will be able to allow mapping this
region only and deny other attempts.




>
> I am not sure if the approach you mentioned could be implemented
> completely without frontend changes. It looks like Xen would have to
> learn how to inspect virtqueues in order to verify implicit grants
> without frontend changes.


I looked through the virtio-iommu specification and corresponding Linux
driver but I am sure I don't see all the challenges and pitfalls. Having a
limited knowledge of IOMMU infrastructure in Linux, below is just my guess,
which might be wrong.

1. I think, if we want to avoid frontend changes the backend in Xen would
need to fully conform to the specification, I am afraid that besides just
inspecting virtqueues, the backend needs to properly and completely emulate
the virtio device, handle shadow page tables, etc. Otherwise we might break
the guest. I expect a huge amount of work to implement this properly.

2. Also, if I got the things correctly, it looks like when enabling
virtio-iommu, all addresses passed in requests to the virtio devices behind
the virtio-iommu will be in guest virtual address space (IOVA). So we would
need to find a way for userspace (if the backend is IOREQ server) to
translate them to guest physical addresses (IPA) via these shadow page
tables in the backend in front of mapping them via foreign memory map
calls. So I expect Xen, toolstack and Linux privcmd driver changes and
additional complexity taking into account how the data structures could be
accessed (data structures being continuously in IOVA, could be
discontinuous in IPA, indirect table descriptors, etc).
I am wondering, would it be possible to have identity IOMMU mapping (IOVA
=3D=3D GPA) at the guest side but without bypassing an IOMMU, as we need th=
e
virtio-iommu frontend to send map/unmap requests, can we control this
behaviour somehow?
I think this would simplify things.

3. Also, we would probably want to have a single virtio-iommu device
instance per guest, so all virtio devices which belong to this guest will
share the IOMMU mapping for the optimization purposes. For this to work all
virtio devices inside a guest should be attached to the same IOMMU domain.
Probably, we could control that, but I am not 100% sure.





> With or without guest modifications, I am not
> aware of anyone doing research and development on this approach.





--=20
Regards,

Oleksandr Tyshchenko

--0000000000004401fb05cd6263d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Oct 2, 2021 at 2:58 AM Stefan=
o Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabellini@kern=
el.org</a>&gt; wrote:<br></div><div dir=3D"ltr" class=3D"gmail_attr"><br></=
div><div class=3D"gmail_attr">Hi Stefano, all</div><div class=3D"gmail_attr=
"><br></div><div class=3D"gmail_attr">[Sorry for the possible format issues=
]</div><div class=3D"gmail_attr">[I have CCed Julien]</div><div dir=3D"ltr"=
 class=3D"gmail_attr"><br></div><div dir=3D"ltr" class=3D"gmail_attr"><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 28 Sep 2021,=
 Oleksandr Tyshchenko wrote:<br>
&gt; On Tue, Sep 28, 2021 at 9:26 AM Stefano Stabellini &lt;<a href=3D"mail=
to:sstabellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;=
 wrote:<br>
&gt; <br>
&gt; Hi Stefano, all<br>
&gt; <br>
&gt; [Sorry for the possible format issues]<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On Mon, 27 Sep 2021, Christopher Clark wrote=
:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; On Mon, Sep 27, 2021 at 3:06 AM Alex Be=
nn=C3=A9e via Stratos-dev &lt;<a href=3D"mailto:stratos-dev@op-lists.linaro=
.org" target=3D"_blank">stratos-dev@op-lists.linaro.org</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Marek Marczyk=
owski-G=C3=B3recki &lt;<a href=3D"mailto:marmarek@invisiblethingslab.com" t=
arget=3D"_blank">marmarek@invisiblethingslab.com</a>&gt; writes:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [[PGP Si=
gned Part:Undecided]]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; On Fri, =
Sep 24, 2021 at 05:02:46PM +0100, Alex Benn=C3=A9e wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; Hi,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Hi,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; 2.1 =
Stable ABI for foreignmemory mapping to non-dom0 ([STR-57])<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; =E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=
=A0 =C2=A0Currently the foreign memory mapping support only works for dom0 =
due<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=
=A0 =C2=A0to reference counting issues. If we are to support backends runni=
ng in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=
=A0 =C2=A0their own domains this will need to get fixed.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=
=A0 =C2=A0Estimate: 8w<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; [STR=
-57] &lt;<a href=3D"https://linaro.atlassian.net/browse/STR-57" rel=3D"nore=
ferrer" target=3D"_blank">https://linaro.atlassian.net/browse/STR-57</a>&gt=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I&#39;m =
pretty sure it was discussed before, but I can&#39;t find relevant<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; (part of=
) thread right now: does your model assumes the backend (running<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; outside =
of dom0) will gain ability to map (or access in other way)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; _arbitra=
ry_ memory page of a frontend domain? Or worse: any domain?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0The aim is fo=
r some DomU&#39;s to host backends for other DomU&#39;s instead of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0all backends =
being in Dom0. Those backend DomU&#39;s would have to be<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0considered tr=
usted because as you say the default memory model of VirtIO<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0is to have fu=
ll access to the frontend domains memory map.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I share Marek&#39;s concern. I believe =
that there are Xen-based systems that will want to run guests using VirtIO =
devices without<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0extending<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; this level of trust to=C2=A0the backend=
 domains.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;From a safety perspective, it would be c=
hallenging to deploy a system<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0with privileged backends. From a safety pers=
pective, it would be a lot<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0easier if the backend were unprivileged.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0This is one of those times where safety and =
security requirements are<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0actually aligned.<br>
&gt; <br>
&gt; <br>
&gt; Well, the foreign memory mapping has one advantage in the context of V=
irtio use-case<br>
&gt; which is that Virtio infrastructure in Guest doesn&#39;t require any m=
odifications to run on top Xen.<br>
&gt; The only issue with foreign memory here is that Guest memory actually =
mapped without its agreement<br>
&gt; which doesn&#39;t perfectly fit into=C2=A0the security model. (althoug=
h there is one more issue with XSA-300,<br>
&gt; but I think it will go away sooner or later, at least there are some a=
ttempts to eliminate it).<br>
&gt; While the ability to map any part of Guest memory is not an issue for =
the backend running in Dom0<br>
&gt; (which we usually trust), this will certainly violate Xen security mod=
el if we want to run it in other<br>
&gt; domain, so I completely agree with the existing concern.<br>
<br>
Yep, that&#39;s what I was referring to.<br>
<br>
<br>
&gt; It was discussed before [1], but I couldn&#39;t find any decisions reg=
arding that. As I understand,<br>
&gt; the one of the possible ideas is to have some entity in Xen (PV IOMMU/=
virtio-iommu/whatever)<br>
&gt; that works in protection mode, so it denies all foreign mapping reques=
ts from the backend running in DomU<br>
&gt; by default and only allows requests with mapping which were *implicitl=
y* granted by the Guest before.<br>
&gt; For example, Xen could be informed which MMIOs hold the queue PFN and =
notify registers<br>
&gt; (as it traps the accesses to these registers anyway) and could theoret=
ically parse the frontend request<br>
&gt; and retrieve descriptors to make a decision which GFNs are actually *a=
llowed*.<br>
&gt; <br>
&gt; I can&#39;t say for sure (sorry not familiar enough with the topic), b=
ut implementing the virtio-iommu device<br>
&gt; in Xen we could probably avoid Guest modifications at all. Of course, =
for this to work<br>
&gt; the Virtio infrastructure in Guest should use DMA API as mentioned in =
[1].<br>
&gt; <br>
&gt; Would the =E2=80=9Crestricted foreign mapping=E2=80=9D solution retain=
 the Xen security model and be accepted<br>
&gt; by the Xen community? I wonder, has someone already looked in this dir=
ection, are there any<br>
&gt; pitfalls here or is this even feasible?<br>
&gt; <br>
&gt; [1] <a href=3D"https://lore.kernel.org/xen-devel/464e91ec-2b53-2338-43=
c7-a018087fc7f6@arm.com/" rel=3D"noreferrer" target=3D"_blank">https://lore=
.kernel.org/xen-devel/464e91ec-2b53-2338-43c7-a018087fc7f6@arm.com/</a><br>
<br>
The discussion that went further is actually one based on the idea that<br>
there is a pre-shared memory area and the frontend always passes<br>
addresses from it. For ease of implementation, the pre-shared area is<br>
the virtqueue itself so this approach has been called &quot;fat virtqueue&q=
uot;.<br>
But it requires guest modifications and it probably results in<br>
additional memory copies.<br></blockquote><div>=C2=A0</div><div>I got it. A=
lthough we would need to map that=C2=A0pre-shared area anyway (I presume it=
 could be done at once during initialization), I think it much better than<=
/div><div>map arbitrary pages at runtime. If there is a way for Xen to know=
 the pre-shared area location in advance it will be able to allow mapping t=
his region only and deny other attempts.</div><div><br></div><div><br></div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I am not sure if the approach you mentioned could be implemented<br>
completely without frontend changes. It looks like Xen would have to<br>
learn how to inspect virtqueues in order to verify implicit grants<br>
without frontend changes.</blockquote><div>=C2=A0</div><div>I looked throug=
h the virtio-iommu specification and corresponding Linux driver but I am su=
re I don&#39;t see all the challenges=C2=A0and pitfalls. Having a limited k=
nowledge of IOMMU infrastructure=C2=A0in Linux, below is just my guess, whi=
ch might be wrong.</div><div><br></div><div>1. I think, if we want to avoid=
=C2=A0frontend changes the backend in Xen would need to fully conform to th=
e specification, I am afraid that besides just inspecting virtqueues, the b=
ackend needs to properly and completely emulate the virtio device, handle s=
hadow page tables, etc. Otherwise we might=C2=A0break the guest. I expect a=
 huge amount of work to=C2=A0implement this properly.</div><div><br></div><=
div>2. Also, if I got the things correctly, it looks like when enabling vir=
tio-iommu, all addresses passed in=C2=A0requests to the virtio devices behi=
nd the virtio-iommu will be in guest virtual address space (IOVA). So we wo=
uld need to find a way for userspace (if the backend is IOREQ server) to tr=
anslate them to guest physical addresses (IPA) via these shadow page tables=
 in the backend in front of mapping them via foreign memory map calls. So I=
 expect Xen, toolstack and Linux privcmd driver changes and additional comp=
lexity taking into account how the data structures could be accessed (data =
structures=C2=A0being continuously in IOVA, could be discontinuous in IPA, =
indirect table descriptors, etc).=C2=A0</div><div>I am wondering, would it =
be possible to have identity IOMMU mapping (IOVA =3D=3D GPA) at the guest s=
ide but without bypassing an IOMMU, as we need the virtio-iommu frontend to=
 send map/unmap requests, can we control this behaviour somehow?</div><div>=
I think this would simplify things.</div><div><br></div><div>3. Also, we wo=
uld probably want to have a single virtio-iommu device instance per guest, =
so all virtio devices which belong to this guest will share the IOMMU mappi=
ng for the optimization purposes. For this to work all virtio devices insid=
e a guest should be attached to the same IOMMU domain. Probably, we could=
=C2=A0control=C2=A0that, but I am not 100% sure.=C2=A0=C2=A0</div><div><br>=
</div><div><br></div><div><br></div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">With or without guest modifications, I am not<b=
r>
aware of anyone doing research and development on this approach.</blockquot=
e><div><br></div><div>=C2=A0</div></div><br clear=3D"all"><div><br></div>--=
 <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div><div =
dir=3D"ltr"><div><div dir=3D"ltr"><span style=3D"background-color:rgb(255,2=
55,255)"><font size=3D"2"><span style=3D"color:rgb(51,51,51);font-family:Ar=
ial,sans-serif">Regards,</span></font></span></div><div dir=3D"ltr"><br></d=
iv><div dir=3D"ltr"><div><span style=3D"background-color:rgb(255,255,255)">=
<font size=3D"2">Oleksandr Tyshchenko</font></span></div></div></div></div>=
</div></div></div></div>

--0000000000004401fb05cd6263d8--

