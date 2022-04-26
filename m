Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B551050FB4C
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 12:45:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313774.531515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njIhU-0008HY-2l; Tue, 26 Apr 2022 10:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313774.531515; Tue, 26 Apr 2022 10:45:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njIhT-0008Ex-Vu; Tue, 26 Apr 2022 10:45:43 +0000
Received: by outflank-mailman (input) for mailman id 313774;
 Tue, 26 Apr 2022 10:45:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1SWQ=VE=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1njIhR-0007XV-Sa
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 10:45:42 +0000
Received: from MTA-06-4.privateemail.com (mta-06-4.privateemail.com
 [198.54.122.146]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02fce9c0-c54e-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 12:45:40 +0200 (CEST)
Received: from mta-06.privateemail.com (localhost [127.0.0.1])
 by mta-06.privateemail.com (Postfix) with ESMTP id 4234218000A7
 for <xen-devel@lists.xenproject.org>; Tue, 26 Apr 2022 06:45:38 -0400 (EDT)
Received: from mail-oa1-f51.google.com (unknown [10.20.151.196])
 by mta-06.privateemail.com (Postfix) with ESMTPA id 165A818000AE
 for <xen-devel@lists.xenproject.org>; Tue, 26 Apr 2022 06:45:38 -0400 (EDT)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-e68392d626so13865154fac.4
 for <xen-devel@lists.xenproject.org>; Tue, 26 Apr 2022 03:45:38 -0700 (PDT)
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
X-Inumbo-ID: 02fce9c0-c54e-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1650969938;
	bh=nlcZFBj/6nclOGGfSsnO6KzzvshtblHXrPlXqt2RQ4s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gnQksIipZW0zNS5d9+KpQ1wBHl/SdcstUkvRE6CpzLgkuIELsrDLUv0DAkf8OyrlZ
	 G3HO3iYsLoG+3PWyQhMMJz7kZmWJJYWylIOH6/iEFT7EMumnU+syq8iGY3EdaROtZG
	 s8CwBqnpZ/cuw8IrgQht5Zwf/TpTFG4Zzt1MQTTAtNKRbRX4sDI8SmOItXn75fPRJq
	 wehvG0+rrbc0CzeHtVDlOD6lqGIYpFaJ+S5Wfn3tVeFmaqjriN/ZYhyQbJaJ02AX1J
	 8/l2sjgTCUF8GtIkaylO2/jQpV43PjQ4XPG2fOLmC7tY0imJ8SDs/qOuXHrJiVnnvr
	 skNcv04yXFfRw==
X-Gm-Message-State: AOAM5335wWMuWocP/Vi7XUDXAXdsolpq9iMPR0q7ClqhnotcdnVMR1gl
	2zMMMpKGfYrYrB8+r9ZSggDIL0wOQF7IdQxsrck=
X-Google-Smtp-Source: ABdhPJy4tz+rhYYRXIj7a050byoO+TuVX3OmhzfsKiFg4b/ChYKYW2btPr+kDdvsTD07g6Om4JIMoEkIBbo7Kemyt94=
X-Received: by 2002:a05:6870:b295:b0:e9:1c84:3671 with SMTP id
 c21-20020a056870b29500b000e91c843671mr5770214oao.128.1650969937362; Tue, 26
 Apr 2022 03:45:37 -0700 (PDT)
MIME-Version: 1.0
References: <bc13e07cdb651afc2c8a97dde1be9c2158160307.1649857162.git.tamas.lengyel@intel.com>
 <YmasHAT0YkeJVMbv@Air-de-Roger> <CABfawhn=6KVVPZD6AVRH2=NJFd5ZwtPpxDn__LdEFJQx6bhCXA@mail.gmail.com>
 <Ymeqg+UmOl2mN5Dz@Air-de-Roger> <bce39358-9739-c39d-c97f-6bae216da89b@xen.org>
In-Reply-To: <bce39358-9739-c39d-c97f-6bae216da89b@xen.org>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 26 Apr 2022 06:45:26 -0400
X-Gmail-Original-Message-ID: <CABfawhnbo-Yy1Se8sz-RKveRes-z_wTdfznzsBbQ0tAXkuN=vg@mail.gmail.com>
Message-ID: <CABfawhnbo-Yy1Se8sz-RKveRes-z_wTdfznzsBbQ0tAXkuN=vg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] x86/mem_sharing: make fork_reset more configurable
To: Julien Grall <julien@xen.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Tamas K Lengyel <tamas.lengyel@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>
Content-Type: multipart/alternative; boundary="000000000000a6c43f05dd8c6482"
X-Virus-Scanned: ClamAV using ClamSMTP

--000000000000a6c43f05dd8c6482
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 26, 2022, 4:33 AM Julien Grall <julien@xen.org> wrote:

> Hi,
>
> On 26/04/2022 09:17, Roger Pau Monn=C3=A9 wrote:
> > On Mon, Apr 25, 2022 at 11:24:37AM -0400, Tamas K Lengyel wrote:
> >> On Mon, Apr 25, 2022 at 10:12 AM Roger Pau Monn=C3=A9 <roger.pau@citri=
x.com>
> wrote:
> >>>> diff --git a/xen/common/vm_event.c b/xen/common/vm_event.c
> >>>> index 84cf52636b..d26a6699fc 100644
> >>>> --- a/xen/common/vm_event.c
> >>>> +++ b/xen/common/vm_event.c
> >>>> @@ -28,6 +28,11 @@
> >>>>   #include <asm/p2m.h>
> >>>>   #include <asm/monitor.h>
> >>>>   #include <asm/vm_event.h>
> >>>> +
> >>>> +#ifdef CONFIG_MEM_SHARING
> >>>> +#include <asm/mem_sharing.h>
> >>>> +#endif
> >>>> +
> >>>>   #include <xsm/xsm.h>
> >>>>   #include <public/hvm/params.h>
> >>>>
> >>>> @@ -394,6 +399,16 @@ static int vm_event_resume(struct domain *d,
> struct vm_event_domain *ved)
> >>>>               if ( rsp.reason =3D=3D VM_EVENT_REASON_MEM_PAGING )
> >>>>                   p2m_mem_paging_resume(d, &rsp);
> >>>>   #endif
> >>>> +#ifdef CONFIG_MEM_SHARING
> >>>> +            if ( mem_sharing_is_fork(d) )
> >>>> +            {
> >>>> +                bool reset_state =3D rsp.flags &
> VM_EVENT_FLAG_RESET_FORK_STATE;
> >>>> +                bool reset_mem =3D rsp.flags &
> VM_EVENT_FLAG_RESET_FORK_MEMORY;
> >>>> +
> >>>> +                if ( reset_state || reset_mem )
> >>>> +                    ASSERT(!mem_sharing_fork_reset(d, reset_state,
> reset_mem));
> >>>
> >>> Might be appropriate to destroy the domain in case fork reset fails?
> >>> ASSERT will only help in debug builds.
> >>
> >> No, I would prefer not destroying the domain here. If it ever becomes
> >> necessary the right way would be to introduce a new monitor event to
> >> signal an error and let the listener decide what to do. At the moment
> >> I don't see that being necessary as there are no known scenarios where
> >> we would be able to setup a fork but fail to reset is.
> >
> > My concern for raising this was what would happen on non-debug
> > builds if mem_sharing_fork_reset() failed, and hence my request to
> > crash the domain.  I would have used something like:
> >
> > if ( (reset_state || reset_mem) &&
> >       mem_sharing_fork_reset(d, reset_state, reset_mem) )
> > {
> >      ASSERT_UNREACHABLE();
> >      domain_crash(d);
> >      break;
> > }
> >
> > But if you and other vm_event maintainers are fine with the current
> > approach and don't think it's a problem that's OK with me.
>
> The current approach is actually not correct. On production build,
> ASSERT() will turn to NOP. IOW mem_sharing_fork_reset() *will* not be
> called.
>
> So the call needs to move outside of the ASSERT() and use a construct
> similar to what you suggested:
>
> if ( .... && mem_sharing_fork_reset(...) )
> {
>    ASSERT_UNREACHABLE();
>    break;
> }
>

Ah, good call. Thanks!

Tamas

>

--000000000000a6c43f05dd8c6482
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Apr 26, 2022, 4:33 AM Julien Grall &lt;<a href=
=3D"mailto:julien@xen.org">julien@xen.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">Hi,<br>
<br>
On 26/04/2022 09:17, Roger Pau Monn=C3=A9 wrote:<br>
&gt; On Mon, Apr 25, 2022 at 11:24:37AM -0400, Tamas K Lengyel wrote:<br>
&gt;&gt; On Mon, Apr 25, 2022 at 10:12 AM Roger Pau Monn=C3=A9 &lt;<a href=
=3D"mailto:roger.pau@citrix.com" target=3D"_blank" rel=3D"noreferrer">roger=
.pau@citrix.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt; diff --git a/xen/common/vm_event.c b/xen/common/vm_event.c=
<br>
&gt;&gt;&gt;&gt; index 84cf52636b..d26a6699fc 100644<br>
&gt;&gt;&gt;&gt; --- a/xen/common/vm_event.c<br>
&gt;&gt;&gt;&gt; +++ b/xen/common/vm_event.c<br>
&gt;&gt;&gt;&gt; @@ -28,6 +28,11 @@<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#include &lt;asm/p2m.h&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#include &lt;asm/monitor.h&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#include &lt;asm/vm_event.h&gt;<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +#ifdef CONFIG_MEM_SHARING<br>
&gt;&gt;&gt;&gt; +#include &lt;asm/mem_sharing.h&gt;<br>
&gt;&gt;&gt;&gt; +#endif<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#include &lt;xsm/xsm.h&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#include &lt;public/hvm/params.h&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; @@ -394,6 +399,16 @@ static int vm_event_resume(struct dom=
ain *d, struct vm_event_domain *ved)<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (=
 rsp.reason =3D=3D VM_EVENT_REASON_MEM_PAGING )<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0p2m_mem_paging_resume(d, &amp;rsp);<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0#endif<br>
&gt;&gt;&gt;&gt; +#ifdef CONFIG_MEM_SHARING<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( mem_sharin=
g_is_fork(d) )<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
ool reset_state =3D rsp.flags &amp; VM_EVENT_FLAG_RESET_FORK_STATE;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b=
ool reset_mem =3D rsp.flags &amp; VM_EVENT_FLAG_RESET_FORK_MEMORY;<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
f ( reset_state || reset_mem )<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ASSERT(!mem_sharing_fork_reset(d, reset_state, reset_mem));<b=
r>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Might be appropriate to destroy the domain in case fork reset =
fails?<br>
&gt;&gt;&gt; ASSERT will only help in debug builds.<br>
&gt;&gt;<br>
&gt;&gt; No, I would prefer not destroying the domain here. If it ever beco=
mes<br>
&gt;&gt; necessary the right way would be to introduce a new monitor event =
to<br>
&gt;&gt; signal an error and let the listener decide what to do. At the mom=
ent<br>
&gt;&gt; I don&#39;t see that being necessary as there are no known scenari=
os where<br>
&gt;&gt; we would be able to setup a fork but fail to reset is.<br>
&gt; <br>
&gt; My concern for raising this was what would happen on non-debug<br>
&gt; builds if mem_sharing_fork_reset() failed, and hence my request to<br>
&gt; crash the domain.=C2=A0 I would have used something like:<br>
&gt; <br>
&gt; if ( (reset_state || reset_mem) &amp;&amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mem_sharing_fork_reset(d, reset_state, reset=
_mem) )<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ASSERT_UNREACHABLE();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 domain_crash(d);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; }<br>
&gt; <br>
&gt; But if you and other vm_event maintainers are fine with the current<br=
>
&gt; approach and don&#39;t think it&#39;s a problem that&#39;s OK with me.=
<br>
<br>
The current approach is actually not correct. On production build, <br>
ASSERT() will turn to NOP. IOW mem_sharing_fork_reset() *will* not be <br>
called.<br>
<br>
So the call needs to move outside of the ASSERT() and use a construct <br>
similar to what you suggested:<br>
<br>
if ( .... &amp;&amp; mem_sharing_fork_reset(...) )<br>
{<br>
=C2=A0 =C2=A0ASSERT_UNREACHABLE();<br>
=C2=A0 =C2=A0break;<br>
}<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Ah, good call. Thanks!</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Tamas</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
</blockquote></div></div></div>

--000000000000a6c43f05dd8c6482--

