Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD7A1BA48D
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 15:25:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT3kO-00023W-Hx; Mon, 27 Apr 2020 13:24:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ku7H=6L=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1jT3kM-00023R-8A
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 13:24:30 +0000
X-Inumbo-ID: 6c34ed18-888a-11ea-9887-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c34ed18-888a-11ea-9887-bc764e2007e4;
 Mon, 27 Apr 2020 13:24:29 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id s10so13410575edy.9
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2020 06:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umich.edu; s=google-2016-06-03;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WlBltR0rEF03k7xkTSaqZHk68lS67ZBdaAH6vyJV058=;
 b=o2/G6uxdtI8Tp1vMhgc8VqL4utKm7mZKffwOvQvlQ7zAm0yGFrXgPWNhLTiIsDdRuf
 D5N3P/aQ6kYuy6be9JpDJa0mzxZSg0ZDwpIKA9k7l7T9fNOAbJC8isCO6U9Ov9i2qAkY
 09OSXp6vKPgtTxXr99T2DJayi0mMRWTs3YJslflKQ0BvmJyqZE/6Rpj1jITwVfL1vMct
 rGLBdeR9+ONIK7UsoOmPZev9rU+K2AAeSlPGDLIJxIBpheJqVnU623/LqINb7qaeYkxo
 N3o7VDQ9wt7wH59A0xhIzz2liEAedx25SNLb3i83NpuIS6M5Vnab68iH89SFytdjPaEO
 pB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WlBltR0rEF03k7xkTSaqZHk68lS67ZBdaAH6vyJV058=;
 b=Q16KVfgsz4Y6ivf91xxdi+HsyYafvnRBfEA0eBdncJ/XNXUM0UQMHTvVSRnz2YkVvL
 S0zDfa2JV6d+qm5hWiQIJMOhkvuOFpm1eTn3ayaqEP6D1EBxy76ywBxn2hrycf7pFXUq
 DO73kmdpPETwAld04Vl4+tlcQSURbuI/2TuteJPKz7Ned5q4+4wVB5uYjgxbNXX7izCa
 KBNlEw+pZlowOEvGGJDQq53eSiWqez0pMYyhHFCUueJ5CQOpoTMfQClM6P4sALmHM9Tn
 j1AZ/uUeykVmbqcIXdvX/pf6gcVHRvtAMx8uPKGtK+t8SQEXR6OH3CQ28iRiFyjIP6Or
 B4vw==
X-Gm-Message-State: AGi0PuY3n6IrYXsY373GSGi25GzZ9HjI9GJSmT0LFypfc5ooyAVwFW+y
 xJMew3O4m4cqaWvREr6YM5yRea1Dcx2aoARwNX8=
X-Google-Smtp-Source: APiQypKgcdsaIUIbxSJbmjbCj3JjvyT+M/mQtGUqrOGBK4LLoFE78D+niHyID1BSkNhlejCaReMzQNuCv4dKQ97SnsQ=
X-Received: by 2002:a50:d90f:: with SMTP id t15mr18115503edj.209.1587993868740; 
 Mon, 27 Apr 2020 06:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1587695896.git.rosbrookn@ainfosec.com>
 <4dbde331aa6a0f8a78d93b86ffaa396c367fc57f.1587695896.git.rosbrookn@ainfosec.com>
In-Reply-To: <4dbde331aa6a0f8a78d93b86ffaa396c367fc57f.1587695896.git.rosbrookn@ainfosec.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Mon, 27 Apr 2020 14:24:17 +0100
Message-ID: <CAFLBxZZ_HpaTxbk6eOg_xQ7OjYUR4TJB3nKCh7BZEru3ewzqXQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] tools: build golang tools if go compiler is present
To: Nick Rosbrook <rosbrookn@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000073acbe05a445a2d7"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--00000000000073acbe05a445a2d7
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 24, 2020 at 4:11 AM Nick Rosbrook <rosbrookn@gmail.com> wrote:

> By default, if the go compiler is found by the configure script, build
> the golang tools. If the compiler is not found, and --enable-golang was
> not explicitly set, do not build to the golang tools.
>
> The corresponding make variable is CONFIG_GOLANG. Remove CONFIG_GOLANG
> from tools/Rules.mk since the variable is now set by configure in
> config/Tools.mk.
>
> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
> Acked-by: Wei Liu <wl@xen.org>
>

LGTM:

Acked-by: George Dunlap <george.dunlap@citrix.com>

--00000000000073acbe05a445a2d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 24, 2020 at 4:11 AM Nick =
Rosbrook &lt;<a href=3D"mailto:rosbrookn@gmail.com">rosbrookn@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">By d=
efault, if the go compiler is found by the configure script, build<br>
the golang tools. If the compiler is not found, and --enable-golang was<br>
not explicitly set, do not build to the golang tools.<br>
<br>
The corresponding make variable is CONFIG_GOLANG. Remove CONFIG_GOLANG<br>
from tools/Rules.mk since the variable is now set by configure in<br>
config/Tools.mk.<br>
<br>
Signed-off-by: Nick Rosbrook &lt;<a href=3D"mailto:rosbrookn@ainfosec.com" =
target=3D"_blank">rosbrookn@ainfosec.com</a>&gt;<br>
Acked-by: Wei Liu &lt;<a href=3D"mailto:wl@xen.org" target=3D"_blank">wl@xe=
n.org</a>&gt;<br></blockquote><div><br></div><div>LGTM:</div><div><br></div=
><div>Acked-by: George Dunlap &lt;<a href=3D"mailto:george.dunlap@citrix.co=
m">george.dunlap@citrix.com</a>&gt;</div><br></div></div>

--00000000000073acbe05a445a2d7--

