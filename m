Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D10364245D4
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 20:15:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203114.358178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYBRx-0007iB-3k; Wed, 06 Oct 2021 18:15:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203114.358178; Wed, 06 Oct 2021 18:15:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYBRw-0007f4-WD; Wed, 06 Oct 2021 18:15:29 +0000
Received: by outflank-mailman (input) for mailman id 203114;
 Wed, 06 Oct 2021 18:15:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RZr5=O2=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mYBRv-0007ey-7Z
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 18:15:27 +0000
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6de185d7-75f8-4bb7-a08d-daead4cdc0d3;
 Wed, 06 Oct 2021 18:15:25 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id s15so11450067wrv.11
 for <xen-devel@lists.xenproject.org>; Wed, 06 Oct 2021 11:15:25 -0700 (PDT)
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
X-Inumbo-ID: 6de185d7-75f8-4bb7-a08d-daead4cdc0d3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=In+CPk9Y9hRsGCu4EI/YiOGsZmiwADtJ3T86NdTx2nk=;
        b=GSMTYVd5VZ8fFfYwEiw9pSospUHXDci+OKQ9KLq/Sz5zYRPb1sDIcQRP+D2vMetb/u
         GVwPTnXKrzaXGIAVs3CYFXInRYKwJOal9+wXeMapy+If/0ygBfyYnet5z/ozO/p7ujSG
         B2whru24XPqNXsgaDsM4ON5pUaGNCoTjEA4MgHahx9OSvrub1wkZayRdgA+y9BBU4cEV
         avZPyp/LlOXKzmpTE3yxKuw+JoLeuwVe6++cMNXFGgP77CzasAmU0QODBgG/MQ7nZIz+
         lJ/QqgEhR9T3H+weRoMukY3kyEte7kY4BRGWt/3kMnguCqDpRaVzeD36cStP8UhtcZnA
         0Yrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=In+CPk9Y9hRsGCu4EI/YiOGsZmiwADtJ3T86NdTx2nk=;
        b=4dhkh2XSZEFCKSHRdMAyQ3pYtxIqyIZ5WfSSgaDa96vO/zSWPNgRogyn9o9tyGd4v9
         DTJ9RbiJXyBbvc2cHaNdDouotiV3QqWpgBET7lf4VYlHP6ff398LI/GIHf8SH+JmCaXx
         jfaPSFuMEHT6jUb6pM1FWTy/MfugeH+Wdy9LDP10LTnd4EhOjf8+3h/6O978hu87QXiN
         TxT8ZKWwDKc5oTFVNW1zfigz4ilGz3mZW4n7LgPwzZKZz8QdDs/jcZkmKkXLa2Tt7CW3
         OHs4po5PT+TdLKPlrtcBiYKuHT5vMiqJEQobVSCbUw6E8KdLT3pN4CuRvyBEv7uyyKIm
         bw9Q==
X-Gm-Message-State: AOAM532ZzgkyCd/6DGYUjSGogkFVahAGVuysOtOiIcWtNN5mDv9Q5ofX
	7h4g9XwT+eE4dj+D2VBiTqrRuwLCgcFPPyMWIqU=
X-Google-Smtp-Source: ABdhPJwyyJ9AiSJwionp2qYKV6mUf2jdnVHRqPXQhaf/5/9tHXh31Q256mUAFonNtEYhWs2ftJpcP/keKmRMS6Kn0nU=
X-Received: by 2002:a5d:4882:: with SMTP id g2mr29905801wrq.399.1633544124993;
 Wed, 06 Oct 2021 11:15:24 -0700 (PDT)
MIME-Version: 1.0
References: <1632955927-27911-1-git-send-email-olekstysh@gmail.com>
 <1632955927-27911-3-git-send-email-olekstysh@gmail.com> <8318a7b0-80fa-ccd6-75c5-c3135b82235d@xen.org>
 <20f00d52-76c8-2afe-6544-6f1396e121e9@gmail.com> <bea0e4a3-90fe-79f0-ab4e-44d3b2d93c7f@xen.org>
In-Reply-To: <bea0e4a3-90fe-79f0-ab4e-44d3b2d93c7f@xen.org>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Wed, 6 Oct 2021 21:15:14 +0300
Message-ID: <CAPD2p-mLM-JjfKh6U+A_UTJostXvYDCJ68ac-V3teSeKjmaXTA@mail.gmail.com>
Subject: Re: [PATCH V4 2/3] xen/arm: Add handling of extended regions for Dom0
To: Julien Grall <julien@xen.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
	Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: multipart/alternative; boundary="0000000000004b93a005cdb321ce"

--0000000000004b93a005cdb321ce
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 6, 2021 at 9:11 PM Julien Grall <julien@xen.org> wrote:

> Hi Oleksandr,
>

Hi Julien

[Sorry for the possible format issues]



>
> On 04/10/2021 14:08, Oleksandr wrote:
> >
> > On 04.10.21 09:59, Julien Grall wrote:
> >> Hi Oleksandr,
> >
> > Hi Julien
>
> Hi Oleksandr,
>
> >
> >
> >>
> >> I saw Stefano committed this patch on Friday. However, I didn't have a
> >> chance go to through a second time and would like to request some
> >> follow-up changes.
> >
> > ok, do you prefer the follow-up patch to be pushed separately or within
> > the rest patches of this series (#1 and #3)?  If the former, I will try
> > to push it today to close this question.
>
> I don't mind. My main ask is they are addressed for 4.16.
>
> >
> >
> >>
> >>
> >> On 30/09/2021 00:52, Oleksandr Tyshchenko wrote:
> >>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> >>>
> >>> The extended region (safe range) is a region of guest physical
> >>> address space which is unused and could be safely used to create
> >>> grant/foreign mappings instead of wasting real RAM pages from
> >>> the domain memory for establishing these mappings.
> >>>
> >>> The extended regions are chosen at the domain creation time and
> >>> advertised to it via "reg" property under hypervisor node in
> >>> the guest device-tree. As region 0 is reserved for grant table
> >>> space (always present), the indexes for extended regions are 1...N.
> >>> If extended regions could not be allocated for some reason,
> >>> Xen doesn't fail and behaves as usual, so only inserts region 0.
> >>>
> >>> Please note the following limitations:
> >>> - The extended region feature is only supported for 64-bit domain
> >>>    currently.
> >>> - The ACPI case is not covered.
> >>>
> >>> ***
> >>>
> >>> As Dom0 is direct mapped domain on Arm (e.g. MFN == GFN)
> >>> the algorithm to choose extended regions for it is different
> >>> in comparison with the algorithm for non-direct mapped DomU.
> >>> What is more, that extended regions should be chosen differently
> >>> whether IOMMU is enabled or not.
> >>>
> >>> Provide RAM not assigned to Dom0 if IOMMU is disabled or memory
> >>> holes found in host device-tree if otherwise. Make sure that
> >>> extended regions are 2MB-aligned and located within maximum possible
> >>> addressable physical memory range. The minimum size of extended
> >>> region is 64MB.
> >>
> >> You explained below why the 128 limits, but I don't see any
> >> explanation on why 2MB and 64MB.
> >>
> >> IIRC, 2MB was to potentally allow superpage mapping. I am not entirely
> >> sure for 64MB.
> >>
> >> Could you add an in-code comment explaining the two limits?
> >
> > Yes. There was a discussion at [1]. 64MB was chosen as a reasonable
> > value to deal with between initial 2MB (we might end up having a lot of
> > small ranges which are not quite useful but increase bookkeeping) and
> > suggested 1GB (we might not be able find a suitable regions at all).
>
> Ok. Please document in the code. Note that I don't think this choice
> should be advertised to the OS. This would give us some flexibility to
> change the size in the future (e.g. if we have platform where chunk of
> less than 64MB is beneficial).
>
> >> The code below looks like an open-coding version of
> >> dt_for_each_range(). Can you try to re-use it please? This will help
> >> to reduce the complexity of this function.
> >
> > You are right, it makes sense, will definitely reuse. If I was aware of
> > that function before I would safe some time I spent on the investigation
> > how to parse that)
>
> I have only skimmed through the diff below. This looks fine to me.
> Please submit a formal patch.
>

Already submitted, please take a look at [1].

 [1]
https://lore.kernel.org/xen-devel/1633519346-3686-4-git-send-email-olekstysh@gmail.com/

-- 
Regards,

Oleksandr Tyshchenko

--0000000000004b93a005cdb321ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 6, 2021 at 9:11 PM Julien=
 Grall &lt;<a href=3D"mailto:julien@xen.org" target=3D"_blank">julien@xen.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Hi Oleksandr,<br></blockquote><div><br></div><div>Hi Julien</div><div><br=
></div><div>[Sorry for the possible format issues]</div><div><br></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
On 04/10/2021 14:08, Oleksandr wrote:<br>
&gt; <br>
&gt; On 04.10.21 09:59, Julien Grall wrote:<br>
&gt;&gt; Hi Oleksandr,<br>
&gt; <br>
&gt; Hi Julien<br>
<br>
Hi Oleksandr,<br>
<br>
&gt; <br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt; I saw Stefano committed this patch on Friday. However, I didn&#39;=
t have a <br>
&gt;&gt; chance go to through a second time and would like to request some =
<br>
&gt;&gt; follow-up changes.<br>
&gt; <br>
&gt; ok, do you prefer the follow-up patch to be pushed separately or withi=
n <br>
&gt; the rest patches of this series (#1 and #3)?=C2=A0 If the former, I wi=
ll try <br>
&gt; to push it today to close this question.<br>
<br>
I don&#39;t mind. My main ask is they are addressed for 4.16.<br>
<br>
&gt; <br>
&gt; <br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On 30/09/2021 00:52, Oleksandr Tyshchenko wrote:<br>
&gt;&gt;&gt; From: Oleksandr Tyshchenko &lt;<a href=3D"mailto:oleksandr_tys=
hchenko@epam.com" target=3D"_blank">oleksandr_tyshchenko@epam.com</a>&gt;<b=
r>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The extended region (safe range) is a region of guest physical=
<br>
&gt;&gt;&gt; address space which is unused and could be safely used to crea=
te<br>
&gt;&gt;&gt; grant/foreign mappings instead of wasting real RAM pages from<=
br>
&gt;&gt;&gt; the domain memory for establishing these mappings.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The extended regions are chosen at the domain creation time an=
d<br>
&gt;&gt;&gt; advertised to it via &quot;reg&quot; property under hypervisor=
 node in<br>
&gt;&gt;&gt; the guest device-tree. As region 0 is reserved for grant table=
<br>
&gt;&gt;&gt; space (always present), the indexes for extended regions are 1=
...N.<br>
&gt;&gt;&gt; If extended regions could not be allocated for some reason,<br=
>
&gt;&gt;&gt; Xen doesn&#39;t fail and behaves as usual, so only inserts reg=
ion 0.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Please note the following limitations:<br>
&gt;&gt;&gt; - The extended region feature is only supported for 64-bit dom=
ain<br>
&gt;&gt;&gt; =C2=A0=C2=A0 currently.<br>
&gt;&gt;&gt; - The ACPI case is not covered.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; ***<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; As Dom0 is direct mapped domain on Arm (e.g. MFN =3D=3D GFN)<b=
r>
&gt;&gt;&gt; the algorithm to choose extended regions for it is different<b=
r>
&gt;&gt;&gt; in comparison with the algorithm for non-direct mapped DomU.<b=
r>
&gt;&gt;&gt; What is more, that extended regions should be chosen different=
ly<br>
&gt;&gt;&gt; whether IOMMU is enabled or not.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Provide RAM not assigned to Dom0 if IOMMU is disabled or memor=
y<br>
&gt;&gt;&gt; holes found in host device-tree if otherwise. Make sure that<b=
r>
&gt;&gt;&gt; extended regions are 2MB-aligned and located within maximum po=
ssible<br>
&gt;&gt;&gt; addressable physical memory range. The minimum size of extende=
d<br>
&gt;&gt;&gt; region is 64MB. <br>
&gt;&gt;<br>
&gt;&gt; You explained below why the 128 limits, but I don&#39;t see any <b=
r>
&gt;&gt; explanation on why 2MB and 64MB.<br>
&gt;&gt;<br>
&gt;&gt; IIRC, 2MB was to potentally allow superpage mapping. I am not enti=
rely <br>
&gt;&gt; sure for 64MB.<br>
&gt;&gt;<br>
&gt;&gt; Could you add an in-code comment explaining the two limits?<br>
&gt; <br>
&gt; Yes. There was a discussion at [1]. 64MB was chosen as a reasonable <b=
r>
&gt; value to deal with between initial 2MB (we might end up having a lot o=
f <br>
&gt; small ranges which are not quite useful but increase bookkeeping) and =
<br>
&gt; suggested 1GB (we might not be able find a suitable regions at all).<b=
r>
<br>
Ok. Please document in the code. Note that I don&#39;t think this choice <b=
r>
should be advertised to the OS. This would give us some flexibility to <br>
change the size in the future (e.g. if we have platform where chunk of <br>
less than 64MB is beneficial).<br>
<br>
&gt;&gt; The code below looks like an open-coding version of <br>
&gt;&gt; dt_for_each_range(). Can you try to re-use it please? This will he=
lp <br>
&gt;&gt; to reduce the complexity of this function.<br>
&gt; <br>
&gt; You are right, it makes sense, will definitely reuse. If I was aware o=
f <br>
&gt; that function before I would safe some time I spent on the investigati=
on <br>
&gt; how to parse that)<br>
<br>
I have only skimmed through the diff below. This looks fine to me. <br>
Please submit a formal patch.<br></blockquote><div><br></div><div>Already s=
ubmitted, please take a look at [1].</div><div><br></div><div>=C2=A0[1]=C2=
=A0<a href=3D"https://lore.kernel.org/xen-devel/1633519346-3686-4-git-send-=
email-olekstysh@gmail.com/">https://lore.kernel.org/xen-devel/1633519346-36=
86-4-git-send-email-olekstysh@gmail.com/</a></div></div><div><br></div>-- <=
br><div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D=
"ltr"><span style=3D"background-color:rgb(255,255,255)"><font size=3D"2"><s=
pan style=3D"color:rgb(51,51,51);font-family:Arial,sans-serif">Regards,</sp=
an></font></span></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div><sp=
an style=3D"background-color:rgb(255,255,255)"><font size=3D"2">Oleksandr T=
yshchenko</font></span></div></div></div></div></div></div></div></div>

--0000000000004b93a005cdb321ce--

