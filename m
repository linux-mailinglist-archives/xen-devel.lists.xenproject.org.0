Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E05B12D53A
	for <lists+xen-devel@lfdr.de>; Tue, 31 Dec 2019 01:24:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1im5Gj-0002rC-5S; Tue, 31 Dec 2019 00:20:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bTfa=2V=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1im5Gh-0002r7-PM
 for xen-devel@lists.xenproject.org; Tue, 31 Dec 2019 00:20:15 +0000
X-Inumbo-ID: 50fcd9a4-2b63-11ea-88e7-bc764e2007e4
Received: from mail-vk1-xa42.google.com (unknown [2607:f8b0:4864:20::a42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50fcd9a4-2b63-11ea-88e7-bc764e2007e4;
 Tue, 31 Dec 2019 00:20:15 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id h13so8662554vkn.10
 for <xen-devel@lists.xenproject.org>; Mon, 30 Dec 2019 16:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3arR0DOcV+9qhbHAEToQbyXm01Rz3V2ZDkrqB8ArDrg=;
 b=Hw0L9u167W8PcPGqJMGvnAXN8jyl1lrx+lJBFZJROVA38lsWyAow0RhPj4ZXaf+Wno
 zhQuc/fj6zvCI/ld3xji6mh6GFusvwU8w1id1/shyxYxWTpJULWrUUoad24VWUkiDsqR
 8X0Oy8pzq9x1NOMaCOqHXXEe/1wMwQ0doUcbBYLmwvj5oNXdxdCKt1GZnJXFr07j0He2
 IFdpi4E+I29MzMfPqvZEnx404Ww2y4a1wH/cFvv1Ol1HfPYSyjZgCivw1IxXsLEt7U1G
 9D1mdLFkYUaQuFTatsygl9hcPaasr8Ad4gk4ybQhBsEYuTdPrlGpD5F+HWBmDNbV+pea
 lokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3arR0DOcV+9qhbHAEToQbyXm01Rz3V2ZDkrqB8ArDrg=;
 b=lVmXvI5bA+mLGOLzCax6xCCufDAACSbTYnaU1bKhZDfkl5o/kxxHyBM+e26J8wnclF
 3KqXqbDrJOWXq5FZ2kPs80wZL5QUYGA+Wejc7NR53Hdu7akJNg2TYlOVo+c6oUfv3JqW
 RvkjR01YzrUKVOGDnrYIr0rQK6Hv6MDmeG4UPmTAu89rpCvPqcp23jMl5fXF68GCRwGJ
 TnpvPYmyfO5rT+ohfsJBYqfb83nNoJZh2WmVzUGX7kqpcEFHt5jZsOSQt8A86FQRzn4K
 bfH/SACo7+NPcnJDYKIjyBAx3mqxvLThSznCt1VZ2yXMyOmvpW3dyjS0I/kj6FSKtYFk
 Cdgg==
X-Gm-Message-State: APjAAAVgB1suConpFUEYWwNe9Y9HZ08OnenIn+HIa6/h+2adetGLaWBA
 WC+Df2kL6ATCmotXhI9WzE7y+VKbn1yiy+20Zhk=
X-Google-Smtp-Source: APXvYqzYNUjIMV08wu7ZTEi1G5T132DFfEQYJa/aNOLiNZNgV+dP7LCh68r9PvRgi+vIZSAAUwunoSjQUi6UryhBaCE=
X-Received: by 2002:a1f:9684:: with SMTP id y126mr39467517vkd.84.1577751614540; 
 Mon, 30 Dec 2019 16:20:14 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576697796.git.tamas.lengyel@intel.com>
 <20191219094814.GB11756@Air-de-Roger>
 <CABfawhnVZmYOZb=wuc2TVDewH9nNtJBTBvJYUk-RDHLCGRVzPw@mail.gmail.com>
 <20191230175900.GF11756@Air-de-Roger>
 <CABfawhkiB=6zvTo6TBCE6y_-to65DFGDVRcqk7ANpSGdwwveFQ@mail.gmail.com>
 <3ff918fc-02a3-1413-4135-a378d65a19ab@xen.org>
 <CABfawh=Wvn16sWp8_MPy0kGAp-OhkCmug4nY272igyg+u4PKBw@mail.gmail.com>
In-Reply-To: <CABfawh=Wvn16sWp8_MPy0kGAp-OhkCmug4nY272igyg+u4PKBw@mail.gmail.com>
From: Julien Grall <julien.grall@gmail.com>
Date: Tue, 31 Dec 2019 00:20:02 +0000
Message-ID: <CAF3u54B2+3q90jFftH+ZcuhdH6i8cOEpjiOjrVdNJCiBSzBtng@mail.gmail.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [Xen-devel] [PATCH v2 00/20] VM forking
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============4519322573465482192=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============4519322573465482192==
Content-Type: multipart/alternative; boundary="000000000000874eba059af4ec43"

--000000000000874eba059af4ec43
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, 30 Dec 2019, 20:49 Tamas K Lengyel, <tamas@tklengyel.com> wrote:

> On Mon, Dec 30, 2019 at 11:43 AM Julien Grall <julien@xen.org> wrote:
> But keep in mind that the "fork-vm" command even with this update
> would still not produce for you a "fully functional" VM on its own.
> The user still has to produce a new VM config file, create the new
> disk, save the QEMU state, etc.


 If you fork then the configuration should be very similar. Right?

So why does the user requires to provide a new config rather than the
command to update the existing one? To me, it feels this is a call to make
mistake when forking.

How is the new config different from the original VM?

As a side note, I can't see any patch adding documentation.

Cheers,

--000000000000874eba059af4ec43
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi,</div><div dir=3D"auto"><br><div class=3D"gmail_q=
uote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 30 Dec 201=
9, 20:49 Tamas K Lengyel, &lt;<a href=3D"mailto:tamas@tklengyel.com" rel=3D=
"noreferrer noreferrer noreferrer" target=3D"_blank">tamas@tklengyel.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Mon, Dec 30, 2019 a=
t 11:43 AM Julien Grall &lt;<a href=3D"mailto:julien@xen.org" rel=3D"norefe=
rrer noreferrer noreferrer noreferrer" target=3D"_blank">julien@xen.org</a>=
&gt; wrote:<br>
But keep in mind that the &quot;fork-vm&quot; command even with this update=
<br>
would still not produce for you a &quot;fully functional&quot; VM on its ow=
n.<br>
The user still has to produce a new VM config file, create the new<br>
disk, save the QEMU state, etc.</blockquote></div></div><div dir=3D"auto"><=
/div><div dir=3D"auto"></div><div dir=3D"auto"></div><div dir=3D"auto"></di=
v><div dir=3D"auto"></div><div dir=3D"auto"><br></div><div dir=3D"auto">=C2=
=A0If you fork then the configuration should be very similar. Right?<br></d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">So why does the user requi=
res to provide a new config rather than the command to update the existing =
one? To me, it feels this is a call to make mistake when forking.</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">How is the new config different f=
rom the original VM?</div><div dir=3D"auto"><br></div><div dir=3D"auto">As =
a side note, I can&#39;t see any patch adding documentation.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Cheers,</div><div dir=3D"auto"><br></=
div></div>

--000000000000874eba059af4ec43--


--===============4519322573465482192==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4519322573465482192==--

