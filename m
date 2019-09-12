Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E0FB0EC8
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 14:19:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8O2I-0007YB-JI; Thu, 12 Sep 2019 12:17:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xhiL=XH=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i8O2G-0007XR-BU
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 12:17:16 +0000
X-Inumbo-ID: 41ed0914-d557-11e9-b299-bc764e2007e4
Received: from mail-ua1-x931.google.com (unknown [2607:f8b0:4864:20::931])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 41ed0914-d557-11e9-b299-bc764e2007e4;
 Thu, 12 Sep 2019 12:17:15 +0000 (UTC)
Received: by mail-ua1-x931.google.com with SMTP id k12so7886984uan.13
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2019 05:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kEQI5gpLfHA1zgfNFNIBQHRUCV9nFAxuq8RrV71MvXk=;
 b=OIYo3WAdTIAA/ewurCiDqTLtxKHDPOXs5SLADa9SxE8pRgdWIUe/skUdnhC8Va+Sy7
 jTKpGKYbffKBC+Hzx+eJyBmQvYx7w4YS2AHIDm7HmlJC1hXp/EGi3BJAoESoFW6bb1pw
 0BB/+0oZ8eiqT6FAaMuNpnEqRU3clmqh0jrSgq6d5wj0zG4TV+6KVXwKefbk6RyYdAwH
 LmYYsbdOFT1mOXS/qICG73THfxq5nBBLBQjrlIUO0rnNb4fCTzj+A5QplDCPLddleaau
 mUY3XuD789Y8+iy/NjfshZU8wWCFNYNzNRjO9RbKA/D4+NWIgf9W6IF0VtLDsM+a+Thy
 P57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kEQI5gpLfHA1zgfNFNIBQHRUCV9nFAxuq8RrV71MvXk=;
 b=A4igYSfWgULgbhEu66gpQ6yAfoEVx9Kbj4tT8mb6mMoVgdsmz4vQ2mByAGSCLwLMHb
 PJlpSvhJh7nFQRIlLh6gVjcYCqW9IPuHoRTqYEJW8+1nVFzGDA6gxvqRBc1ZZ5F2h4J8
 IMsi147P00F2O0P0A3WMjHEIWP6gdmWaFmKpH4PYhy0M1hUTvA9XfMT+NF1cZIg0Igau
 SJQpYcQPw0dRNdZrsN5Bphf0DhB1dvavJzINxn+nC9gNz/l4/cONjiuaKtarCxY8S3P0
 NNCzkqzhTCP8k20q8vVR96ZzY6GyY/9W/vFx5RvThwNaPY+DbCLVVkDNi3xrsL9wPi5A
 vbQw==
X-Gm-Message-State: APjAAAVkgA4JvmNmYTjLkFCv+zJA9U5sVytc/4WfWVAYiL9LoxlKdDL3
 l06tav427lkqAe32xos4vUU1kR7/aUMIKCKgMLc=
X-Google-Smtp-Source: APXvYqxl2+1IUBCCVu4VuT3qr/tteNwNOhIy94gF9E3kFClW4HpInQW2KOIwqqqJ95VyiHb7kkVNmaY1xjAgKQzjXSQ=
X-Received: by 2002:ab0:61c6:: with SMTP id m6mr19471364uan.113.1568290635143; 
 Thu, 12 Sep 2019 05:17:15 -0700 (PDT)
MIME-Version: 1.0
References: <1568197942-15374-1-git-send-email-andrii.anisov@gmail.com>
 <1568197942-15374-5-git-send-email-andrii.anisov@gmail.com>
 <87pnk6g1vz.fsf@epam.com> <3d39ee7e-f63a-0fa6-c323-ff4742627ea4@gmail.com>
In-Reply-To: <3d39ee7e-f63a-0fa6-c323-ff4742627ea4@gmail.com>
From: Julien Grall <julien.grall@gmail.com>
Date: Thu, 12 Sep 2019 13:17:02 +0100
Message-ID: <CAF3u54BG4F-10UOCqAdTWgAHkB-sYdZUupbr0VrEZD8fjOda+Q@mail.gmail.com>
To: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [Xen-devel] [RFC 4/9] arm64: utilize time accounting
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Andrii Anisov <Andrii_Anisov@epam.com>
Content-Type: multipart/mixed; boundary="===============9173551396887890971=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============9173551396887890971==
Content-Type: multipart/alternative; boundary="000000000000365e1c05925a1e5c"

--000000000000365e1c05925a1e5c
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Sep 2019, 13:10 Andrii Anisov, <andrii.anisov@gmail.com> wrote:

> Hello Volodymyr,
>
> On 11.09.19 20:48, Volodymyr Babchuk wrote:
> >
> > Hi Andrii,
> >
>
> As we agreed, I'll wipe out debugging remains as well as cleanup coding
> style nits and resend the series.


This an RFC and I am sure there current state is enough to spark a
discussion. There are no need to waste time resending it and use filling up
inboxes.

Please wait for more time.

Cheers,


> --
> Sincerely,
> Andrii Anisov.
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--000000000000365e1c05925a1e5c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, 12 Sep 2019, 13:10 Andrii Anisov, &lt;<a href=
=3D"mailto:andrii.anisov@gmail.com" target=3D"_blank" rel=3D"noreferrer">an=
drii.anisov@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">Hello Volodymyr,<br>
<br>
On 11.09.19 20:48, Volodymyr Babchuk wrote:<br>
&gt; <br>
&gt; Hi Andrii,<br>
&gt; <br>
<br>
As we agreed, I&#39;ll wipe out debugging remains as well as cleanup coding=
 style nits and resend the series.</blockquote></div></div><div dir=3D"auto=
"></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">This an RFC and I am sure there current state is enough to spark a dis=
cussion. There are no need to waste time resending it and use filling up in=
boxes.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Please wait for m=
ore time.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Cheers,</div><=
div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">
<br>
-- <br>
Sincerely,<br>
Andrii Anisov.<br>
<br>
_______________________________________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org" rel=3D"noreferrer norefer=
rer" target=3D"_blank">Xen-devel@lists.xenproject.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer noreferrer noreferrer" target=3D"_blank">https://lists.xenprojec=
t.org/mailman/listinfo/xen-devel</a></blockquote></div></div></div>

--000000000000365e1c05925a1e5c--


--===============9173551396887890971==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9173551396887890971==--

