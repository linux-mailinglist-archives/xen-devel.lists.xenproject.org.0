Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA11A34666C
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 18:32:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100766.192204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOktK-00082w-9u; Tue, 23 Mar 2021 17:32:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100766.192204; Tue, 23 Mar 2021 17:32:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOktK-00082a-6V; Tue, 23 Mar 2021 17:32:30 +0000
Received: by outflank-mailman (input) for mailman id 100766;
 Tue, 23 Mar 2021 17:32:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1RZV=IV=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1lOktI-00082U-Rc
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 17:32:28 +0000
Received: from mail-qt1-x831.google.com (unknown [2607:f8b0:4864:20::831])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fff9517f-a686-4ba0-9e1e-9d2a09028b8a;
 Tue, 23 Mar 2021 17:32:27 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id x9so15515743qto.8
 for <xen-devel@lists.xenproject.org>; Tue, 23 Mar 2021 10:32:27 -0700 (PDT)
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
X-Inumbo-ID: fff9517f-a686-4ba0-9e1e-9d2a09028b8a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zededa.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5ibikCj7Cfxaf3tLmSEXncsgA4OJVtmozcYWsgiEAPc=;
        b=ASkZrGczMiuqhgiQVnCjHlEYUTYYi4t/6al8SjzfupKMlybAM+Tv077euMkJ+ZS/yX
         uVdM1vrf7BCkbYr/BhBHNs68cb/pWzyPqBzFWs7wfSGvkqP+qqzOZZQP///uX5y8K2TK
         9pyRu/N+QTIP+3nYjHD18tbQp5ln5fda+/ZQRYAqTVUNqOpAAgrlIN3bFUvhqpP/+IZ0
         he99RjcFEeYQ0LRvtpp1B/tvZADsHDnEh6MbC4PP+L0sWfbhmTm2Zi9c7r6l3z1bLWho
         IvzFHIbeyMdF5MWmfaI8vZMnJb4pn9KlLX0SWREXYKmpDM6HysOYnTHyXrtuMM3uudjP
         kEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5ibikCj7Cfxaf3tLmSEXncsgA4OJVtmozcYWsgiEAPc=;
        b=b1hh4r+e9jPipz1RukKWIjsRZx7Cg7M2N2y59kbwNTmaItB/8DVCDwWe8or6X+9hwH
         xY6c18bbwWm3l4tsre2MZpxmsc8Hrk8+Tz0iJw/I4MfwGPFdWF9S8ahfx5+xMISRMftN
         gQSOyPKZl6S/Eo8AwckJ+BYzRf3Onrp1UIwywi5M7pQu56L7RiGzmbaWvPyWoYci5q/1
         A0BRDvtjknnxRciHqJW8OGHdO3//WI/ZyNx2LDhlpeZ//o5ELAr67blnifJQSKzuXQfn
         /2dUsR3OISH6r1i/8ifRVkYSnI6vwaeT+FdazMMXUxr3Egyk+zV7DPBPlI0wVxeRAUYD
         N5zg==
X-Gm-Message-State: AOAM533ilXnG6/KqE6/dYG4v1DKYlm884Tzyo7lE43e3rxpUwhYKYgxY
	cH+SHE1dhCHsctx0iZGhddj2mISgA/dY8yO4JLU+GA==
X-Google-Smtp-Source: ABdhPJy/Ydqu58YjxW6D/BIP2Anu6BE+kXpG8lK3VaRscazBfGGopfuLR3WeDI9XufokNnGpXKwnJaM/jKCWh+fxOZA=
X-Received: by 2002:ac8:1093:: with SMTP id a19mr5383020qtj.365.1616520746903;
 Tue, 23 Mar 2021 10:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210322133301.11308-1-jandryuk@gmail.com> <c5736ca0-de24-bac7-f1d9-3f90df997454@suse.com>
 <d410d743-5479-bbf6-676b-c8749ab07c06@citrix.com> <f53db67e-8344-8da7-6658-c521d2e3c527@suse.com>
 <09b5e7ee-b44b-a8ab-f29d-6617b6af93a0@citrix.com> <9b071192-a443-4bdc-8dac-107bbd4a0481@suse.com>
 <CAKf6xpvGit4YiuTfGuX2iZ1qPi-a+oNK2bassUxGd8qJADEXyQ@mail.gmail.com>
 <4b0ac6fa-cbe2-5b3c-fa61-52d743e07390@suse.com> <24665.61470.964721.635678@mariner.uk.xensource.com>
 <f13cc06f-3f1f-12ae-fad2-adcdb3726e96@algedi.dur.ac.uk>
In-Reply-To: <f13cc06f-3f1f-12ae-fad2-adcdb3726e96@algedi.dur.ac.uk>
From: Roman Shaposhnik <roman@zededa.com>
Date: Tue, 23 Mar 2021 10:32:16 -0700
Message-ID: <CAMmSBy9-bEN+5ZFYA+-y4G0HP==V+b2B8f0XWvUh4sp04AdGJw@mail.gmail.com>
Subject: Re: [PATCH] xen: Create EFI_VENDOR directory
To: Michael Young <m.a.young@durham.ac.uk>
Cc: Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	Jason Andryuk <jandryuk@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000e440d605be37907c"

--000000000000e440d605be37907c
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 23, 2021 at 8:59 AM Michael Young <m.a.young@durham.ac.uk>
wrote:

>
>
> On Tue, 23 Mar 2021, Ian Jackson wrote:
>
> > Jan Beulich writes ("Re: [PATCH] xen: Create EFI_VENDOR directory"):
> >> On 23.03.2021 13:34, Jason Andryuk wrote:
> > ...
> >>> On Fedora, RPMs drop EFI binaries directly into /boot/efi/EFI/fedora/.
> >>> grub, shim, fwupdate and xen are all packaged that way.  It seems
> >>> reasonable to have those important binaries tracked by the package
> >>> manager.
> >>>
> >>> Does SuSE populate EFI_VENDOR from EFI_DIR when some boot loader
> >>> script is called?
> >>
> >> Yes. And back at the time, when I consulted our EFI person, I was left
> >> with the impression that this is the only reasonable approach. The
> >> primary reason, as said, was that the EFI partition as a whole may get
> >> rebuilt perhaps even from scratch at any point. Hence it's not
> >> reasonable to expect package-managed files to live there.
> >
> > I agree with this analysis but it is for people like Fedora to decide
> > how they want to build their packages.
> >
> > There is also the case of ad-hoc packages (eg our "make debball")
> > which the user might reasonably choose to have dump things in the EFI
> > system partition.
> >
> > Conversely, I see no downside to the mkdir.  Jan, is there some actual
> > harm in it ?  If not, we should be accomodating to people's build and
> > packaging strategies even if we don't entirely approve of them.
>
> There is a request in https://bugzilla.redhat.com/show_bug.cgi?id=1750733
> for xen on Fedora to install the efi file elsewhere and then copy it to
> /boot/efi post install. I could change the current Fedora set up for
> Fedora 35 (which should have xen-4.15) if there is a good reason to do so.
> I am not sure how useful the xen.efi file in /boot/efi is anyway for the
> the Fedora set up as it will generally use a xen*.gz file in /boot via
> grub.
>

FWIW: /boot as the source of truth and EFI partition as a cache for that is
also what we've settled on in EVE distro.

As a somewhat unrelated side-note: on ARM at least, with u-boot playing the
role of UEFI more and more -- we can actually pick EFI payloads straight
from source of truth and completely by-pass EFI partition altogether (which
is fine -- it is, after all, only a cache).

Thanks,
Roman.

--000000000000e440d605be37907c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Mar 23, 2021 at 8:59 AM Michael Y=
oung &lt;<a href=3D"mailto:m.a.young@durham.ac.uk">m.a.young@durham.ac.uk</=
a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-lef=
t-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex"><br>
<br>
On Tue, 23 Mar 2021, Ian Jackson wrote:<br>
<br>
&gt; Jan Beulich writes (&quot;Re: [PATCH] xen: Create EFI_VENDOR directory=
&quot;):<br>
&gt;&gt; On 23.03.2021 13:34, Jason Andryuk wrote:<br>
&gt; ...<br>
&gt;&gt;&gt; On Fedora, RPMs drop EFI binaries directly into /boot/efi/EFI/=
fedora/.<br>
&gt;&gt;&gt; grub, shim, fwupdate and xen are all packaged that way.=C2=A0 =
It seems<br>
&gt;&gt;&gt; reasonable to have those important binaries tracked by the pac=
kage<br>
&gt;&gt;&gt; manager.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Does SuSE populate EFI_VENDOR from EFI_DIR when some boot load=
er<br>
&gt;&gt;&gt; script is called?<br>
&gt;&gt;<br>
&gt;&gt; Yes. And back at the time, when I consulted our EFI person, I was =
left<br>
&gt;&gt; with the impression that this is the only reasonable approach. The=
<br>
&gt;&gt; primary reason, as said, was that the EFI partition as a whole may=
 get<br>
&gt;&gt; rebuilt perhaps even from scratch at any point. Hence it&#39;s not=
<br>
&gt;&gt; reasonable to expect package-managed files to live there.<br>
&gt;<br>
&gt; I agree with this analysis but it is for people like Fedora to decide<=
br>
&gt; how they want to build their packages.<br>
&gt;<br>
&gt; There is also the case of ad-hoc packages (eg our &quot;make debball&q=
uot;)<br>
&gt; which the user might reasonably choose to have dump things in the EFI<=
br>
&gt; system partition.<br>
&gt;<br>
&gt; Conversely, I see no downside to the mkdir.=C2=A0 Jan, is there some a=
ctual<br>
&gt; harm in it ?=C2=A0 If not, we should be accomodating to people&#39;s b=
uild and<br>
&gt; packaging strategies even if we don&#39;t entirely approve of them.<br=
>
<br>
There is a request in <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?i=
d=3D1750733" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.c=
om/show_bug.cgi?id=3D1750733</a> <br>
for xen on Fedora to install the efi file elsewhere and then copy it to <br=
>
/boot/efi post install. I could change the current Fedora set up for <br>
Fedora 35 (which should have xen-4.15) if there is a good reason to do so. =
<br>
I am not sure how useful the xen.efi file in /boot/efi is anyway for the <b=
r>
the Fedora set up as it will generally use a xen*.gz file in /boot via <br>
grub.<br></blockquote><div><br></div><div>FWIW: /boot as the source of trut=
h and EFI partition as a cache for that is also what we&#39;ve settled on i=
n EVE distro.</div><div><br></div><div>As a somewhat unrelated side-note: o=
n ARM at least, with u-boot playing the role of UEFI more and more -- we ca=
n actually pick EFI payloads straight from source of truth and completely b=
y-pass EFI partition altogether (which is fine -- it is, after all, only a =
cache).</div><div><br></div><div>Thanks,</div><div>Roman.=C2=A0</div></div>=
</div>

--000000000000e440d605be37907c--

