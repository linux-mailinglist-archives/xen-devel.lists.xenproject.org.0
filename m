Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0103E416CD4
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 09:30:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194963.347381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTff1-0003DT-Od; Fri, 24 Sep 2021 07:30:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194963.347381; Fri, 24 Sep 2021 07:30:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTff1-0003B3-KP; Fri, 24 Sep 2021 07:30:19 +0000
Received: by outflank-mailman (input) for mailman id 194963;
 Fri, 24 Sep 2021 07:30:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CKs0=OO=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1mTff0-0003Ax-MU
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 07:30:18 +0000
Received: from mail-ed1-x529.google.com (unknown [2a00:1450:4864:20::529])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2029eedd-bd8a-4673-ade1-7261e8fec038;
 Fri, 24 Sep 2021 07:30:16 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id x7so18069805edd.6
 for <xen-devel@lists.xenproject.org>; Fri, 24 Sep 2021 00:30:16 -0700 (PDT)
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
X-Inumbo-ID: 2029eedd-bd8a-4673-ade1-7261e8fec038
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R+8UTVFE+U8I1rxxBt0QNZ0Q3ZF9T77NQxVWTO7O2tk=;
        b=Kbogy6wFwhR5I9me9bGnHOeo/qHTQBi18rCkTv1kK55jeY8MeAoGfdMgj5T39tI4y7
         6wqfEgJnz3fUZusKH5paIB5DX7Pa37Sl+CnIjz159DGWJ35SnOrAUXLp7hOiHh6OMnIN
         AlRFYmm7966VH4ai5E/zd67okgbYpOaRJOAn5+W/YxdOAfD5FjdvfTRlPvwqEbm8HSDK
         Sev8nsG0D5Er/Qgz4i3ePm/9xs3b6wdA+ck4ZVDMOYZfynb1/nCw3zAv4xCfrmkleX6m
         0dzo7RF1cBqOBy1N0NS9uGwcSAHm74sl5UHgVm5Xcahf+r9LJaA2K8IJtLW085u4ps8N
         tWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R+8UTVFE+U8I1rxxBt0QNZ0Q3ZF9T77NQxVWTO7O2tk=;
        b=fAZar7VGJtLXbHr4O1L495jK4y75pbrM3MSdRPqA8QI4ojHVmJPH1H+dA4612ca4oa
         VEHaMqRKk0dAa+N1ncbsVEgUfS1pRupQGTtV3zNnPQPmHlA9SI7dCunO7AoLlAw6MmiU
         b06OkQIbdAW7nfTVLM9CnR5tT9W17XWNYFLp9H2lFdVn+dF7RE/LRdydWz7i4U5GE5v1
         /EVZ0n7O0y3AIyGtbU7SyQtUGF1ybGlNm/dCxpZI42K1oqDKDngtyCcLysETEh530TvN
         wtqEhPqRA8b5OwHOF7uIxjH0cYZSqMwiIRUuAoLXwfUZetPEa0txT7tYvkzMEn/GFaD1
         DaHA==
X-Gm-Message-State: AOAM531se+xNSo9IEEI8YCnL74tavFXYtIaaTsk9Z3oNDxP36JakkLwu
	Nbm8LhEUHb6x4Rp1jkiaunNq5XddWZ9Rd2QXz/A=
X-Google-Smtp-Source: ABdhPJx34xPauPGB8H4Lh541nZ81+tZgUtHo9oCDQXkMUrmivUqZjs3qoJrtMz0cMI3wcH2DJSvzr04lOrivYwjVxls=
X-Received: by 2002:a05:6402:2cd:: with SMTP id b13mr3377863edx.267.1632468615719;
 Fri, 24 Sep 2021 00:30:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210922082123.54374-1-roger.pau@citrix.com> <69208166-2356-cc8a-4e78-2ce8d6cddcac@xen.org>
 <YUr525A3B0cs2rBo@MacBook-Air-de-Roger.local> <b93a13e3-2ad9-aac4-7f87-b290aa4c3953@xen.org>
 <YUxi2DeEXhsnUTi7@MacBook-Air-de-Roger.local> <CAJ=z9a1MxDKg3pB0Qq2JvAfDJ6LHsSoYmg-m2Xotxi_EB1jb1g@mail.gmail.com>
 <d3a314ae-a2bb-58da-b98e-bc03a049bc1d@suse.com>
In-Reply-To: <d3a314ae-a2bb-58da-b98e-bc03a049bc1d@suse.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Fri, 24 Sep 2021 12:30:04 +0500
Message-ID: <CAJ=z9a2gub_Dn6P3T2H05kwB6TUHf-y=rBvxcXpYaiGNrAXqyw@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] gnttab: add per-domain controls
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, 
	Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000f26cf705ccb8b726"

--000000000000f26cf705ccb8b726
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 24 Sep 2021, 11:21 Jan Beulich, <jbeulich@suse.com> wrote:

> On 24.09.2021 04:30, Julien Grall wrote:
> > Hi Roger,
> >
> > On Thu, 23 Sep 2021, 16:20 Roger Pau Monn=C3=A9, <roger.pau@citrix.com>
> wrote:
> >
> >> On Thu, Sep 23, 2021 at 01:47:37PM +0500, Julien Grall wrote:
> >>> Hi Roger,
> >>>
> >>> On 22/09/2021 14:39, Roger Pau Monn=C3=A9 wrote:
> >>>> On Wed, Sep 22, 2021 at 01:57:02PM +0500, Julien Grall wrote:
> >>>>>
> >>>>>
> >>>>> On 22/09/2021 13:21, Roger Pau Monne wrote:
> >>>>>> Hello,
> >>>>>
> >>>>> Hi Roger,
> >>>>>
> >>>>>> First patch on the series is a trivial change to xenconsoled in
> >> order to
> >>>>>> use xenforeignmemory stable library in order to map the shared
> >> console
> >>>>>> ring instead of the unstable libxc interface. It's reviewed and
> >> ready to
> >>>>>> go in.
> >>>>>>
> >>>>>> Patches 2 and 3 allow setting the host wide command line `gnttab`
> >> option
> >>>>>> on a per domain basis. That means selecting the max allowed grant
> >> table
> >>>>>> version and whether transitive grants are allowed.
> >>>>>>
> >>>>>> The last 3 patches attempt to implement support for creating guest=
s
> >>>>>> without a grant table. This requires some changes to xenstored in
> >> order
> >>>>>> to partially support guests without a valid ring interface, as the
> >> lack
> >>>>>> of grant table will prevent C xenstored from mapping the shared
> >> ring.
> >>>>>> Note this is not an issue for Ocaml xenstored, as it still uses th=
e
> >>>>>> foreign memory interface to map the shared ring, and thus won't
> >> notice
> >>>>>> the lack of grant table support on the domain.
> >>>>>
> >>>>> I find a bit odd that the Xenstore support is conditional to whethe=
r
> >> grant
> >>>>> table is available. Are you expecting domains with no grant table t=
o
> >> have no
> >>>>> PV drivers (including PV shutdown)?
> >>>>
> >>>> I don't really expect much, as having guests without grant table is =
a
> >>>> developer option right now, if someone wants to make use of them for
> >>>> any reason it would need some thought.
> >>>>
> >>>> The other option would be my first proposal to restore foreign mappi=
ng
> >>>> of the xenstore ring on that case:
> >>>>
> >>>>
> >>
> https://lore.kernel.org/xen-devel/20210917154625.89315-6-roger.pau@citrix=
.com/
> >>>>
> >>>> But it's also arguable that a guest not having a grant table should
> >>>> also likely prevent foreign mapping attempts. Plus such foreign
> >>>> mapping won't work from stubdomains.
> >>>
> >>> There is another option: extend the acquire hypercall to allow
> xenstored
> >>> domain to map the xenstore interface. This would require more work, b=
ut
> >> at
> >>> least it would avoid the interesting dependency on the grant table.
> >>
> >> Xen isn't aware of the shared xenstore ring page currently, so that
> >> would mean introducing more knowledge to the hypervisor that what's
> >> strictly required IMO, as Xen has no business in knowing such details.
> >>
> >
> > Well Xen already knows the page for HVM/PVH because the guest retrieve =
it
> > through an HMV param.
>
> To be honest using this in such a way would feel like an abuse / layering
> violation to me.
>

I can see how it can be seen like this. Do you have a better suggestion to
be able to map mapping without the foreign mapping interface and the grant
table?

Jan
>
>

--000000000000f26cf705ccb8b726
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, 24 Sep 2021, 11:21 Jan Beulich, &lt;<a href=3D=
"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">On 24.09.2021 04:30, Julien Grall wrote:<br>
&gt; Hi Roger,<br>
&gt; <br>
&gt; On Thu, 23 Sep 2021, 16:20 Roger Pau Monn=C3=A9, &lt;<a href=3D"mailto=
:roger.pau@citrix.com" target=3D"_blank" rel=3D"noreferrer">roger.pau@citri=
x.com</a>&gt; wrote:<br>
&gt; <br>
&gt;&gt; On Thu, Sep 23, 2021 at 01:47:37PM +0500, Julien Grall wrote:<br>
&gt;&gt;&gt; Hi Roger,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 22/09/2021 14:39, Roger Pau Monn=C3=A9 wrote:<br>
&gt;&gt;&gt;&gt; On Wed, Sep 22, 2021 at 01:57:02PM +0500, Julien Grall wro=
te:<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; On 22/09/2021 13:21, Roger Pau Monne wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt; Hello,<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Hi Roger,<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; First patch on the series is a trivial change to x=
enconsoled in<br>
&gt;&gt; order to<br>
&gt;&gt;&gt;&gt;&gt;&gt; use xenforeignmemory stable library in order to ma=
p the shared<br>
&gt;&gt; console<br>
&gt;&gt;&gt;&gt;&gt;&gt; ring instead of the unstable libxc interface. It&#=
39;s reviewed and<br>
&gt;&gt; ready to<br>
&gt;&gt;&gt;&gt;&gt;&gt; go in.<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Patches 2 and 3 allow setting the host wide comman=
d line `gnttab`<br>
&gt;&gt; option<br>
&gt;&gt;&gt;&gt;&gt;&gt; on a per domain basis. That means selecting the ma=
x allowed grant<br>
&gt;&gt; table<br>
&gt;&gt;&gt;&gt;&gt;&gt; version and whether transitive grants are allowed.=
<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; The last 3 patches attempt to implement support fo=
r creating guests<br>
&gt;&gt;&gt;&gt;&gt;&gt; without a grant table. This requires some changes =
to xenstored in<br>
&gt;&gt; order<br>
&gt;&gt;&gt;&gt;&gt;&gt; to partially support guests without a valid ring i=
nterface, as the<br>
&gt;&gt; lack<br>
&gt;&gt;&gt;&gt;&gt;&gt; of grant table will prevent C xenstored from mappi=
ng the shared<br>
&gt;&gt; ring.<br>
&gt;&gt;&gt;&gt;&gt;&gt; Note this is not an issue for Ocaml xenstored, as =
it still uses the<br>
&gt;&gt;&gt;&gt;&gt;&gt; foreign memory interface to map the shared ring, a=
nd thus won&#39;t<br>
&gt;&gt; notice<br>
&gt;&gt;&gt;&gt;&gt;&gt; the lack of grant table support on the domain.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; I find a bit odd that the Xenstore support is conditio=
nal to whether<br>
&gt;&gt; grant<br>
&gt;&gt;&gt;&gt;&gt; table is available. Are you expecting domains with no =
grant table to<br>
&gt;&gt; have no<br>
&gt;&gt;&gt;&gt;&gt; PV drivers (including PV shutdown)?<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I don&#39;t really expect much, as having guests without g=
rant table is a<br>
&gt;&gt;&gt;&gt; developer option right now, if someone wants to make use o=
f them for<br>
&gt;&gt;&gt;&gt; any reason it would need some thought.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; The other option would be my first proposal to restore for=
eign mapping<br>
&gt;&gt;&gt;&gt; of the xenstore ring on that case:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt; <a href=3D"https://lore.kernel.org/xen-devel/20210917154625.89315-=
6-roger.pau@citrix.com/" rel=3D"noreferrer noreferrer" target=3D"_blank">ht=
tps://lore.kernel.org/xen-devel/20210917154625.89315-6-roger.pau@citrix.com=
/</a><br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; But it&#39;s also arguable that a guest not having a grant=
 table should<br>
&gt;&gt;&gt;&gt; also likely prevent foreign mapping attempts. Plus such fo=
reign<br>
&gt;&gt;&gt;&gt; mapping won&#39;t work from stubdomains.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; There is another option: extend the acquire hypercall to allow=
 xenstored<br>
&gt;&gt;&gt; domain to map the xenstore interface. This would require more =
work, but<br>
&gt;&gt; at<br>
&gt;&gt;&gt; least it would avoid the interesting dependency on the grant t=
able.<br>
&gt;&gt;<br>
&gt;&gt; Xen isn&#39;t aware of the shared xenstore ring page currently, so=
 that<br>
&gt;&gt; would mean introducing more knowledge to the hypervisor that what&=
#39;s<br>
&gt;&gt; strictly required IMO, as Xen has no business in knowing such deta=
ils.<br>
&gt;&gt;<br>
&gt; <br>
&gt; Well Xen already knows the page for HVM/PVH because the guest retrieve=
 it<br>
&gt; through an HMV param.<br>
<br>
To be honest using this in such a way would feel like an abuse / layering<b=
r>
violation to me.<br></blockquote></div></div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">I can see how it can be seen like this. Do you have a bette=
r suggestion to be able to map mapping without the foreign mapping interfac=
e and the grant table?</div><div dir=3D"auto"><br></div><div dir=3D"auto"><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Jan<br>
<br>
</blockquote></div></div></div>

--000000000000f26cf705ccb8b726--

