Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 200BF2DB67C
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 23:24:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54891.95457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpIiW-0001v5-AA; Tue, 15 Dec 2020 22:22:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54891.95457; Tue, 15 Dec 2020 22:22:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpIiW-0001uk-6i; Tue, 15 Dec 2020 22:22:48 +0000
Received: by outflank-mailman (input) for mailman id 54891;
 Tue, 15 Dec 2020 22:22:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GCyV=FT=gmail.com=crogers122@srs-us1.protection.inumbo.net>)
 id 1kpIiU-0001uf-QK
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 22:22:46 +0000
Received: from mail-qk1-x72d.google.com (unknown [2607:f8b0:4864:20::72d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9014b889-5974-44f0-b9aa-017223c1e4cf;
 Tue, 15 Dec 2020 22:22:45 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id c7so20831068qke.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Dec 2020 14:22:45 -0800 (PST)
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
X-Inumbo-ID: 9014b889-5974-44f0-b9aa-017223c1e4cf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wA0NS6LYMdsQ75agvCmT0E+X2ITs6qTXBs67m6lU3U4=;
        b=SamdIYmE09sby8EOWZ2uy7CskOJNNL/aFUy2sUdpWqB76z+RjpAtFrbC4Dax8yE94O
         dJOUCTwPCs7wz9LEW4KLEnJkU8xFTMOEu4lDmiS+MCSghBUQjSZerh1/lSlGKnECMSFN
         Jof8LLQHMPP6V8UdEQ3N+RGbpAT/NtM/JWcUXOidoE/m0ZpWVZ0P0EPGQ8KQt63kTF0A
         /BlereSFNYHYlWLF1ZzhttUzhc60Cgo4GA4W++khagvY6DOF60J2/2E/FjiBvI1jCwu9
         6yrYsY4msS2KzqfNmHwCSI5emXSCjBoxH6XnqRfIfgbJ5UBBnZT4i80oX6njGpkNqYVn
         z1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wA0NS6LYMdsQ75agvCmT0E+X2ITs6qTXBs67m6lU3U4=;
        b=KnaKytzkN33/qE7W3QLO2y7lwsMR3qA6igMbDPRq/lc6fjiYyzQYoQc4wWqxF42w8x
         93q56vGcj5e0c/QtCiimczzCRLako5bYjNW+QRcu5i8BQ5GGzX2Usdl20v+g5cHK/mFy
         NDvDKHwAExKzhi+7I+xPbSmpqWBwS3fwzbD5nfsI54s28CSGMq1ZYlJRKnCWmvA+Ei2U
         j8Yy1JQHTizTnLNJQl91jt0QCTr/lEzL4wUajluGM6ZEONtUJ6x0dyrI6ioFkSegE1c0
         0fVtTSA93Y4YMIqaAkyhdMjxEJc0Ev6wy6ybnXzAa571GV8bNRX1qYxyNY8XGNcijC99
         1BuA==
X-Gm-Message-State: AOAM531zY3X5b0PSegSAtqdL7YycAdAkpmqFRU2A20BM/P0qwoWftdBX
	Gm+tHvLcpIRUo8a1tnopPEVDrKBpznuobB+qlxg=
X-Google-Smtp-Source: ABdhPJzpaf1KS/3u9aEsVJ6JCo3oOKSQDcucIyRGGWeRU4nIHtNWIUi5ZnoSNTm4fA58GtzH+zQ8o/LCEBBj1i72UDc=
X-Received: by 2002:a05:620a:1265:: with SMTP id b5mr40488098qkl.27.1608070965041;
 Tue, 15 Dec 2020 14:22:45 -0800 (PST)
MIME-Version: 1.0
References: <CAKf6xps-nM13E19SVS3NJwq6LwOJLUwN+FC6k_Sp9-_YaRt-EA@mail.gmail.com>
 <3ACCFEC6-A8B7-48E6-AA3F-48D4CDE75FA4@gmail.com> <alpine.DEB.2.21.2012141632020.4040@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2012141632020.4040@sstabellini-ThinkPad-T480s>
From: Chris Rogers <crogers122@gmail.com>
Date: Tue, 15 Dec 2020 17:22:33 -0500
Message-ID: <CAC4Yorgk89vaDsbygvebiBOan-3OWE=D9xKiri_JwQAVWZ19GQ@mail.gmail.com>
Subject: Re: [openxt-dev] Re: Follow up on libxl-fix-reboot.patch
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Rich Persaud <persaur@gmail.com>, openxt <openxt@googlegroups.com>, 
	xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@citrix.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Olivier Lambert <olivier.lambert@vates.fr>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Jason Andryuk <jandryuk@gmail.com>, wl@xen.org, jbeulich@suse.com, roger.pau@citrix.com
Content-Type: multipart/alternative; boundary="000000000000a51de505b6883228"

--000000000000a51de505b6883228
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hopefully I can provide a little more context.  Here is a link to the patch=
:

https://github.com/OpenXT/xenclient-oe/blob/master/recipes-extended/xen/fil=
es/libxl-fix-reboot.patch

The patch is a bit mis-named.  It does not implement
XEN_DOMCTL_SENDTRIGGER_RESET.  It's just a workaround to handle the missing
RESET implementation.

Its purpose is to make an HVM guest "reboot" regardless of whether PV tools
have been installed and the xenstore interface is listening or not.  From
the client perspective that OpenXT is concerned with, this is for
ease-of-use for working with HVM guests before PV tools are installed.  To
summarize the flow of the patch:

- User input causes high level toolstack, xenmgr, to do xl reboot <domid>
- libxl hits "PV interface not available", so it tries the fallback ACPI
reset trigger (but that's not implemented in domctl)
- therefore, the patch changes the RESET trigger to POWER trigger, and sets
a 'reboot' flag
- when the xl create process handles the domain_death event for
LIBXL_SHUTDOWN_REASON_POWEROFF, we check for our 'reboot' flag.
- It's set, so we set "action" as if we came from a real restart, which
makes the xl create process take the 'goto start' codepath to rebuild the
domain.

I think we'd like to get rid of this patch, but at the moment I don't have
any code or a design to propose that would implement the
XEN_DOMCTL_SENDTRIGGER_RESET.

On Mon, Dec 14, 2020 at 7:42 PM Stefano Stabellini <sstabellini@kernel.org>
wrote:

> On Mon, 14 Dec 2020, Rich Persaud wrote:
> > (adding xen-devel & toolstack devs)
> >
> > On Dec 14, 2020, at 16:12, Jason Andryuk <jandryuk@gmail.com> wrote:
> > >
> > > =EF=BB=BFOn Fri, Dec 11, 2020 at 3:56 PM Chris Rogers <crogers122@gma=
il.com>
> wrote:
> > >>
> > >> This is a follow up to a request during our roadmapping meeting to
> clarify the purpose of libxl-fix-reboot.patch on the current version of X=
en
> in OpenXT (4.12).  It's pretty simple.  While the domctl API does define =
a
> trigger for reset in xen/include/public/domctl.h:
> > >>
> > >
> > >> The call stack looks like this:
> > >>> libxl_send_trigger(ctx, domid, LIBXL_TRIGGER_RESET, 0);
> > >>> xc_domain_send_trigger(ctx->xch, domid,
> XEN_DOMCTL_SENDTRIGGER_RESET, vcupid);
> > >>> do_domctl()
> > >>> arch_do_domctl()
> > >> and reaching the case statement in arch_do_domctl() for
> XEN_DOMCTL_sendtrigger, with RESET, we get -ENOSYS as illustrated above.
> > >
> > > Thanks, Chris.  It's surprising that xl trigger reset exists, but
> > > isn't wired through to do anything.  And that reboot has a fallback
> > > command to something that doesn't work.
>
> I miss some of the context of this thread -- let me try to understand
> the issue properly.
>
> It looks like HVM reboot doesn't work properly, or is it HVM reset
> (in-guest reset)? It looks like it is implemented by calling "xl trigger
> reset", which is implemented by libxl_send_trigger. The call chain leads
> to a XEN_DOMCTL_sendtrigger domctl with XEN_DOMCTL_SENDTRIGGER_RESET as
> a parameter that is not implemented on x86.
>
> That looks like a pretty serious bug :-)
>
>
> I imagine the reason why it is in that state is that the main way to
> reboot would be to call "xl reboot" which is implemented with the PV
> protocol "reboot" write to xenstore?  Either way, the bug should be
> fixed.
>
> What does your libxl-fix-reboot.patch patch do? Does it add an
> implementation of XEN_DOMCTL_SENDTRIGGER_RESET?

--000000000000a51de505b6883228
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hopefully I can provide a little more context.=C2=A0 =
Here is a link to the patch:<br></div><div><br></div><div><a href=3D"https:=
//github.com/OpenXT/xenclient-oe/blob/master/recipes-extended/xen/files/lib=
xl-fix-reboot.patch">https://github.com/OpenXT/xenclient-oe/blob/master/rec=
ipes-extended/xen/files/libxl-fix-reboot.patch</a></div><div><br></div><div=
>The patch is a bit mis-named.=C2=A0 It does not implement XEN_DOMCTL_SENDT=
RIGGER_RESET.=C2=A0 It&#39;s just a workaround to handle the missing RESET =
implementation.<br></div><div><br></div><div>Its purpose is to make an HVM =
guest &quot;reboot&quot; regardless of whether PV tools have been installed=
 and the xenstore interface is listening or not.=C2=A0 From the client pers=
pective that OpenXT is concerned with, this is for ease-of-use for working =
with HVM guests before  PV tools are installed.=C2=A0 To summarize the flow=
 of the patch:</div><div><br></div><div>- User input causes high level tool=
stack, xenmgr, to do xl reboot &lt;domid&gt; <br></div><div>- libxl hits &q=
uot;PV interface not available&quot;, so it tries the fallback ACPI reset t=
rigger (but that&#39;s not implemented in domctl)<br></div><div>- therefore=
, the patch changes the RESET trigger to POWER trigger, and sets a &#39;reb=
oot&#39; flag<br></div><div>- when the xl create process handles the domain=
_death event for LIBXL_SHUTDOWN_REASON_POWEROFF, we check for our &#39;rebo=
ot&#39; flag.<br>- It&#39;s set, so we set &quot;action&quot; as if we came=
 from a real restart, which makes the xl create process take the &#39;goto =
start&#39; codepath to rebuild the domain. </div><div><br></div><div>I thin=
k we&#39;d like to get rid of this patch, but at the moment I don&#39;t hav=
e any code or a design to propose that would implement the XEN_DOMCTL_SENDT=
RIGGER_RESET.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Mon, Dec 14, 2020 at 7:42 PM Stefano Stabellini &lt;<=
a href=3D"mailto:sstabellini@kernel.org">sstabellini@kernel.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, 14 D=
ec 2020, Rich Persaud wrote:<br>
&gt; (adding xen-devel &amp; toolstack devs)<br>
&gt; <br>
&gt; On Dec 14, 2020, at 16:12, Jason Andryuk &lt;<a href=3D"mailto:jandryu=
k@gmail.com" target=3D"_blank">jandryuk@gmail.com</a>&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt; =EF=BB=BFOn Fri, Dec 11, 2020 at 3:56 PM Chris Rogers &lt;<a href=
=3D"mailto:crogers122@gmail.com" target=3D"_blank">crogers122@gmail.com</a>=
&gt; wrote:<br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt; This is a follow up to a request during our roadmapping meeti=
ng to clarify the purpose of libxl-fix-reboot.patch on the current version =
of Xen in OpenXT (4.12).=C2=A0 It&#39;s pretty simple.=C2=A0 While the domc=
tl API does define a trigger for reset in xen/include/public/domctl.h:<br>
&gt; &gt;&gt; <br>
&gt; &gt; <br>
&gt; &gt;&gt; The call stack looks like this:<br>
&gt; &gt;&gt;&gt; libxl_send_trigger(ctx, domid, LIBXL_TRIGGER_RESET, 0);<b=
r>
&gt; &gt;&gt;&gt; xc_domain_send_trigger(ctx-&gt;xch, domid, XEN_DOMCTL_SEN=
DTRIGGER_RESET, vcupid);<br>
&gt; &gt;&gt;&gt; do_domctl()<br>
&gt; &gt;&gt;&gt; arch_do_domctl()<br>
&gt; &gt;&gt; and reaching the case statement in arch_do_domctl() for XEN_D=
OMCTL_sendtrigger, with RESET, we get -ENOSYS as illustrated above.<br>
&gt; &gt; <br>
&gt; &gt; Thanks, Chris.=C2=A0 It&#39;s surprising that xl trigger reset ex=
ists, but<br>
&gt; &gt; isn&#39;t wired through to do anything.=C2=A0 And that reboot has=
 a fallback<br>
&gt; &gt; command to something that doesn&#39;t work.<br>
<br>
I miss some of the context of this thread -- let me try to understand<br>
the issue properly.<br>
<br>
It looks like HVM reboot doesn&#39;t work properly, or is it HVM reset<br>
(in-guest reset)? It looks like it is implemented by calling &quot;xl trigg=
er<br>
reset&quot;, which is implemented by libxl_send_trigger. The call chain lea=
ds<br>
to a XEN_DOMCTL_sendtrigger domctl with XEN_DOMCTL_SENDTRIGGER_RESET as<br>
a parameter that is not implemented on x86.<br>
<br>
That looks like a pretty serious bug :-)<br>
<br>
<br>
I imagine the reason why it is in that state is that the main way to<br>
reboot would be to call &quot;xl reboot&quot; which is implemented with the=
 PV<br>
protocol &quot;reboot&quot; write to xenstore?=C2=A0 Either way, the bug sh=
ould be<br>
fixed.<br>
<br>
What does your libxl-fix-reboot.patch patch do? Does it add an<br>
implementation of XEN_DOMCTL_SENDTRIGGER_RESET?</blockquote></div>

--000000000000a51de505b6883228--

