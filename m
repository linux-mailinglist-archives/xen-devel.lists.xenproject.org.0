Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8F6416A06
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 04:31:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194761.347030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTazT-0005Ou-JE; Fri, 24 Sep 2021 02:31:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194761.347030; Fri, 24 Sep 2021 02:31:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTazT-0005Ne-Fn; Fri, 24 Sep 2021 02:31:07 +0000
Received: by outflank-mailman (input) for mailman id 194761;
 Fri, 24 Sep 2021 02:31:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CKs0=OO=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1mTazS-0005NY-1r
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 02:31:06 +0000
Received: from mail-ed1-x530.google.com (unknown [2a00:1450:4864:20::530])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13febcb0-fdcc-45dc-b845-9d830e41fcef;
 Fri, 24 Sep 2021 02:31:04 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id x7so15787149edd.6
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 19:31:04 -0700 (PDT)
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
X-Inumbo-ID: 13febcb0-fdcc-45dc-b845-9d830e41fcef
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oo/mxOc5qkAqjzAwodZ8n1OU7XMmawmdUNiILrtwiEU=;
        b=LCQGKQSdQDlCakC56rdLLOUjGn9QXDJwVwC6THANMSM+btqwpgD/1jjMC4cgcrWdCY
         hEJhYr/5aLTIQ5vtJZTZt7YFHncNdz/dwHltphjBI2Rvkyw3C5zv3SHCppQS3na9ZzrN
         d21a+0wwhaUbjGRODZe7D9HsMqFtfroKgkfIFk38DYk6PJ5WXiGZfsjCmy1SUCMQlx0C
         xAPESpITJN8kGumfKfpqp4B1n3ARYFNqSWD2iljRKhQWuQU34YBwyDskvO4pHL40nDMO
         GrDSl+Z7AZ4HVoyNVGuEocjXGJIu3i/APDsjVlGIg84FBFKO7/V8BFsSLpBY6xQV6/tu
         MRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oo/mxOc5qkAqjzAwodZ8n1OU7XMmawmdUNiILrtwiEU=;
        b=BKFLx2An+wbb62Kd4/Nu888j1pGyFM35m3DQYiGRAPh6Y5atIAoz7exVCL0kPPMId8
         zZCc0VWejue5axS04Yf/xnaSKs5RkoOlxlOMA6IvG1l6YI0tDmxfIlTEfShq+aAcKALU
         LDTMtHrhoJNFi2lNYWVsxMXeN1ctVr1d3W1AIF5CwPa/fBkwElkHD9AudAMIGoHr7hr9
         AYP6+5BxrO/MFPtzk9KY3dfInfxhgGU9Wb6n5Y6NT3V8ZqQD6Dw2kxslqOdqHAy8OgSq
         keyOBR3b17eHkApXuNte5D8xhCOBMnOCFGq8lIPvx2/Py9xdCA3TLRWu+QqThBzUDYD7
         aYtw==
X-Gm-Message-State: AOAM533i1sFUAf+lpIqRnAHb6XY8UTBmI77JAWrZcyCYditcyi0WcALc
	Scwr8Vv1PAnzetmd/y4eBT9frEW60bxdFySCoQ8=
X-Google-Smtp-Source: ABdhPJw7ddLpHt2d3wLo4dmeWJDd/4bQSLi/zmGsnM+cDdeYeWkxEUQP6H0Qxuyd13pKdHq+M8HIXZVyElW42ZAd600=
X-Received: by 2002:a17:906:2887:: with SMTP id o7mr8723264ejd.425.1632450663372;
 Thu, 23 Sep 2021 19:31:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210922082123.54374-1-roger.pau@citrix.com> <69208166-2356-cc8a-4e78-2ce8d6cddcac@xen.org>
 <YUr525A3B0cs2rBo@MacBook-Air-de-Roger.local> <b93a13e3-2ad9-aac4-7f87-b290aa4c3953@xen.org>
 <YUxi2DeEXhsnUTi7@MacBook-Air-de-Roger.local>
In-Reply-To: <YUxi2DeEXhsnUTi7@MacBook-Air-de-Roger.local>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Fri, 24 Sep 2021 07:30:51 +0500
Message-ID: <CAJ=z9a1MxDKg3pB0Qq2JvAfDJ6LHsSoYmg-m2Xotxi_EB1jb1g@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] gnttab: add per-domain controls
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, 
	Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>, 
	Juergen Gross <jgross@suse.com>, Christian Lindig <christian.lindig@citrix.com>, 
	David Scott <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: multipart/alternative; boundary="000000000000e75a5e05ccb489d0"

--000000000000e75a5e05ccb489d0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Roger,

On Thu, 23 Sep 2021, 16:20 Roger Pau Monn=C3=A9, <roger.pau@citrix.com> wro=
te:

> On Thu, Sep 23, 2021 at 01:47:37PM +0500, Julien Grall wrote:
> > Hi Roger,
> >
> > On 22/09/2021 14:39, Roger Pau Monn=C3=A9 wrote:
> > > On Wed, Sep 22, 2021 at 01:57:02PM +0500, Julien Grall wrote:
> > > >
> > > >
> > > > On 22/09/2021 13:21, Roger Pau Monne wrote:
> > > > > Hello,
> > > >
> > > > Hi Roger,
> > > >
> > > > > First patch on the series is a trivial change to xenconsoled in
> order to
> > > > > use xenforeignmemory stable library in order to map the shared
> console
> > > > > ring instead of the unstable libxc interface. It's reviewed and
> ready to
> > > > > go in.
> > > > >
> > > > > Patches 2 and 3 allow setting the host wide command line `gnttab`
> option
> > > > > on a per domain basis. That means selecting the max allowed grant
> table
> > > > > version and whether transitive grants are allowed.
> > > > >
> > > > > The last 3 patches attempt to implement support for creating gues=
ts
> > > > > without a grant table. This requires some changes to xenstored in
> order
> > > > > to partially support guests without a valid ring interface, as th=
e
> lack
> > > > > of grant table will prevent C xenstored from mapping the shared
> ring.
> > > > > Note this is not an issue for Ocaml xenstored, as it still uses t=
he
> > > > > foreign memory interface to map the shared ring, and thus won't
> notice
> > > > > the lack of grant table support on the domain.
> > > >
> > > > I find a bit odd that the Xenstore support is conditional to whethe=
r
> grant
> > > > table is available. Are you expecting domains with no grant table t=
o
> have no
> > > > PV drivers (including PV shutdown)?
> > >
> > > I don't really expect much, as having guests without grant table is a
> > > developer option right now, if someone wants to make use of them for
> > > any reason it would need some thought.
> > >
> > > The other option would be my first proposal to restore foreign mappin=
g
> > > of the xenstore ring on that case:
> > >
> > >
> https://lore.kernel.org/xen-devel/20210917154625.89315-6-roger.pau@citrix=
.com/
> > >
> > > But it's also arguable that a guest not having a grant table should
> > > also likely prevent foreign mapping attempts. Plus such foreign
> > > mapping won't work from stubdomains.
> >
> > There is another option: extend the acquire hypercall to allow xenstore=
d
> > domain to map the xenstore interface. This would require more work, but
> at
> > least it would avoid the interesting dependency on the grant table.
>
> Xen isn't aware of the shared xenstore ring page currently, so that
> would mean introducing more knowledge to the hypervisor that what's
> strictly required IMO, as Xen has no business in knowing such details.
>

Well Xen already knows the page for HVM/PVH because the guest retrieve it
through an HMV param.

We only miss (?) the PV part.


> The grant table slot used by the xenstore shared page is just an
> agreement at the toolstack level, but not known to the hypervisor so
> far.
>

Right, we need to find a different way to provide/map the shared page if
the grant table is not present.

To me the acquire hypercall is the best way to resolve it as Xen knows
whether the domain will run Xenstored (at least we used to have a flag) and
we can do the permission control easily.

Do you have another alternative?


> > >
> > > I'm fine with dropping those patches if they turn out to be too
> > > controversial, I think it's an interesting option to be able to
> > > disable the grant table, but I don't have a full picture of how that
> > > could be used in practice. Maybe others have and would be willing to
> > > pick this up.
> >
> > I think the current approach is probably OK as a developper option.
> However,
> > we should at least document in the option that disabling the grant-tabl=
e
> > will also disable Xenstore (anything else?) support when using C
> Xenstored.
> >
> > It might also be worth to clearly state in the doc that this is only
> > intended for developer use and not supported.
>
> Sure, adding it to xl.cfg man page is likely the best place. Will do
> when updating the patches.
>
> Thanks, Roger.
>

--000000000000e75a5e05ccb489d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Roger,<br><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, 23 Sep 2021, 16:20 Roger Pau Monn=C3=
=A9, &lt;<a href=3D"mailto:roger.pau@citrix.com">roger.pau@citrix.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, Sep 23, 2021 at 0=
1:47:37PM +0500, Julien Grall wrote:<br>
&gt; Hi Roger,<br>
&gt; <br>
&gt; On 22/09/2021 14:39, Roger Pau Monn=C3=A9 wrote:<br>
&gt; &gt; On Wed, Sep 22, 2021 at 01:57:02PM +0500, Julien Grall wrote:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; On 22/09/2021 13:21, Roger Pau Monne wrote:<br>
&gt; &gt; &gt; &gt; Hello,<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Hi Roger,<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; First patch on the series is a trivial change to xencon=
soled in order to<br>
&gt; &gt; &gt; &gt; use xenforeignmemory stable library in order to map the=
 shared console<br>
&gt; &gt; &gt; &gt; ring instead of the unstable libxc interface. It&#39;s =
reviewed and ready to<br>
&gt; &gt; &gt; &gt; go in.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Patches 2 and 3 allow setting the host wide command lin=
e `gnttab` option<br>
&gt; &gt; &gt; &gt; on a per domain basis. That means selecting the max all=
owed grant table<br>
&gt; &gt; &gt; &gt; version and whether transitive grants are allowed.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; The last 3 patches attempt to implement support for cre=
ating guests<br>
&gt; &gt; &gt; &gt; without a grant table. This requires some changes to xe=
nstored in order<br>
&gt; &gt; &gt; &gt; to partially support guests without a valid ring interf=
ace, as the lack<br>
&gt; &gt; &gt; &gt; of grant table will prevent C xenstored from mapping th=
e shared ring.<br>
&gt; &gt; &gt; &gt; Note this is not an issue for Ocaml xenstored, as it st=
ill uses the<br>
&gt; &gt; &gt; &gt; foreign memory interface to map the shared ring, and th=
us won&#39;t notice<br>
&gt; &gt; &gt; &gt; the lack of grant table support on the domain.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; I find a bit odd that the Xenstore support is conditional to=
 whether grant<br>
&gt; &gt; &gt; table is available. Are you expecting domains with no grant =
table to have no<br>
&gt; &gt; &gt; PV drivers (including PV shutdown)?<br>
&gt; &gt; <br>
&gt; &gt; I don&#39;t really expect much, as having guests without grant ta=
ble is a<br>
&gt; &gt; developer option right now, if someone wants to make use of them =
for<br>
&gt; &gt; any reason it would need some thought.<br>
&gt; &gt; <br>
&gt; &gt; The other option would be my first proposal to restore foreign ma=
pping<br>
&gt; &gt; of the xenstore ring on that case:<br>
&gt; &gt; <br>
&gt; &gt; <a href=3D"https://lore.kernel.org/xen-devel/20210917154625.89315=
-6-roger.pau@citrix.com/" rel=3D"noreferrer noreferrer" target=3D"_blank">h=
ttps://lore.kernel.org/xen-devel/20210917154625.89315-6-roger.pau@citrix.co=
m/</a><br>
&gt; &gt; <br>
&gt; &gt; But it&#39;s also arguable that a guest not having a grant table =
should<br>
&gt; &gt; also likely prevent foreign mapping attempts. Plus such foreign<b=
r>
&gt; &gt; mapping won&#39;t work from stubdomains.<br>
&gt; <br>
&gt; There is another option: extend the acquire hypercall to allow xenstor=
ed<br>
&gt; domain to map the xenstore interface. This would require more work, bu=
t at<br>
&gt; least it would avoid the interesting dependency on the grant table.<br=
>
<br>
Xen isn&#39;t aware of the shared xenstore ring page currently, so that<br>
would mean introducing more knowledge to the hypervisor that what&#39;s<br>
strictly required IMO, as Xen has no business in knowing such details.<br><=
/blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Well =
Xen already knows the page for HVM/PVH because the guest retrieve it throug=
h an HMV param.</div><div dir=3D"auto"><br></div><div dir=3D"auto">We only =
miss (?) the PV part.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><d=
iv class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
The grant table slot used by the xenstore shared page is just an<br>
agreement at the toolstack level, but not known to the hypervisor so<br>
far.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"au=
to">Right, we need to find a different way to provide/map the shared page i=
f the grant table is not present.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">To me the acquire hypercall is the best way to resolve it as Xen =
knows whether the domain will run Xenstored (at least we used to have a fla=
g) and we can do the permission control easily.</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Do you have another alternative?</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">
<br>
&gt; &gt; <br>
&gt; &gt; I&#39;m fine with dropping those patches if they turn out to be t=
oo<br>
&gt; &gt; controversial, I think it&#39;s an interesting option to be able =
to<br>
&gt; &gt; disable the grant table, but I don&#39;t have a full picture of h=
ow that<br>
&gt; &gt; could be used in practice. Maybe others have and would be willing=
 to<br>
&gt; &gt; pick this up.<br>
&gt; <br>
&gt; I think the current approach is probably OK as a developper option. Ho=
wever,<br>
&gt; we should at least document in the option that disabling the grant-tab=
le<br>
&gt; will also disable Xenstore (anything else?) support when using C Xenst=
ored.<br>
&gt; <br>
&gt; It might also be worth to clearly state in the doc that this is only<b=
r>
&gt; intended for developer use and not supported.<br>
<br>
Sure, adding it to xl.cfg man page is likely the best place. Will do<br>
when updating the patches.<br>
<br>
Thanks, Roger.<br>
</blockquote></div></div></div>

--000000000000e75a5e05ccb489d0--

