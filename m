Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E111BE500
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 19:19:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTqLb-0008TF-W4; Wed, 29 Apr 2020 17:18:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PJZR=6N=gmail.com=ayushdosaj2313@srs-us1.protection.inumbo.net>)
 id 1jTqLa-0008TA-Gk
 for xen-devel@lists.xen.org; Wed, 29 Apr 2020 17:18:10 +0000
X-Inumbo-ID: 65e8daa0-8a3d-11ea-ae69-bc764e2007e4
Received: from mail-oi1-x229.google.com (unknown [2607:f8b0:4864:20::229])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65e8daa0-8a3d-11ea-ae69-bc764e2007e4;
 Wed, 29 Apr 2020 17:18:09 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id 19so2483646oiy.8
 for <xen-devel@lists.xen.org>; Wed, 29 Apr 2020 10:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=pRcvpi37jJZmtN/lvIL5Lo9a2UxvC2fhXJil7fmcwi0=;
 b=PNp95T4iv3qJGMcIajDyfhDo7y6S5C0cfeNWd86PJSdGzxr4m47eLG4fzuNv58o8jD
 Qfmt7Lfy+W8LyOlDgGFQ31xHFG3EhDwxbCyQkt6IKuQ/+XTAGuWs+w383mU4hsnJWVh0
 gFeWGQTHrcb4DU5qRo0ApXVuHl6DYSus0eTqhMObJ5rQnTRU7fFakF7d8EwaGFa+3foC
 SFET43BLcqVBFiBMqNCYESvGbAMU1gWQB7pUvUWyfhmjrH9ydYc+esZy9QI2yhcR6zDN
 g62CJGAeMjN7rCn/4d2P7aVlpR1ydBG2XEiYMTNzy4nWRc2YCEvynoxBrRR3Bp4xH25+
 4Y6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=pRcvpi37jJZmtN/lvIL5Lo9a2UxvC2fhXJil7fmcwi0=;
 b=HwOcAPVwYiSltM1qWvgGo90jSOXmyXJvSXC+jArr0uuvzDbQ8e/gBrex5xZnf0gWCS
 Dw+5keXwfyVf0aZyGgr6/rm64bR3PL8UWjmEkZg0uTjvccVKrN8fO6WBa1vKRVXjJf5t
 DojgsDQh4NJZG7sFttkGr6bqG52vl5pBhzP0GZwE/HDgX2fLDKNxRDUfqZ/lDTImMKeF
 naWKw/Uakwe0Ubt5r+xN1LyBCcxDHlz/6CYU+yQzz1V9xeTl4pYMFLlUPK/OT+mQ0L3n
 SKGQ/ocwXviaQROzAj7RdYj4X+REBonUwtEMktTXiV133MYab5ckt+MLjqfkqkaiAp+L
 CuLg==
X-Gm-Message-State: AGi0PuZFgRQ7D8DtXjUorGzAoOIXTcYTFlZ+kReIZcvkyOxYUkqUR9sj
 Q6+/p4hira8vTVUPeyYNBG7kK4C1TBKl05NPpm/Tsv3ydN8=
X-Google-Smtp-Source: APiQypL4HVbQtW3CmTMgllhOzv6HKjGIcXxiVG/c7nHl+jiI1xqc6LlG1CQyWXInKmwjcibEbnczFF6/Y+VKWkg9RCo=
X-Received: by 2002:aca:5716:: with SMTP id l22mr2331785oib.43.1588180688822; 
 Wed, 29 Apr 2020 10:18:08 -0700 (PDT)
MIME-Version: 1.0
From: Ayush Dosaj <ayushdosaj2313@gmail.com>
Date: Wed, 29 Apr 2020 22:47:57 +0530
Message-ID: <CAOCxVi0s5X+=Hug2_M-AyXvYpiwqfkf7G2Y66kp44MQ-xgO+KA@mail.gmail.com>
Subject: Xen Compilation Error on Ubuntu 20.04
To: xen-devel@lists.xen.org
Content-Type: multipart/alternative; boundary="000000000000cbfdf305a4712183"
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--000000000000cbfdf305a4712183
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xen development team,

I am Ayush. I compiled Xen Hypervisor from source on Ubuntu 20.04 machine
running on an intel-i9 CPU.
I am getting compilation error due to the following two flags.
Error: error: =E2=80=98-mindirect-branch=E2=80=99 and =E2=80=98-fcf-protect=
ion=E2=80=99 are not compatible.

Complete Error logs can be found at https://paste.ubuntu.com/p/xvvyPnhW5c/

And when I compiled Xen commenting the two flags in Rules.mk file, it
compiles and installs properly but on boot-up i see a blank black screen
and i am stuck there.


Best,
Ayush Dosaj

--000000000000cbfdf305a4712183
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default"><font size=3D"2"><span style=
=3D"font-family:georgia,serif">Hi Xen development team,</span></font></div>=
<div class=3D"gmail_default"><font size=3D"2"><span style=3D"font-family:ge=
orgia,serif"><br></span></font></div><div class=3D"gmail_default"><font siz=
e=3D"2"><span style=3D"font-family:georgia,serif">I am Ayush. I compiled Xe=
n Hypervisor from source on Ubuntu 20.04 machine running on an intel-i9 CPU=
.</span></font></div><div class=3D"gmail_default"><font size=3D"2"><span st=
yle=3D"font-family:georgia,serif">I am getting compilation error due to the=
 following two flags.</span></font></div><div class=3D"gmail_default"><font=
 size=3D"2"><span style=3D"font-family:georgia,serif">Error: error: =E2=80=
=98-mindirect-branch=E2=80=99 and =E2=80=98-fcf-protection=E2=80=99 are not=
 compatible.</span></font></div><div class=3D"gmail_default"><font size=3D"=
2"><span style=3D"font-family:georgia,serif"><br></span></font></div><div c=
lass=3D"gmail_default"><div class=3D"gmail_default"><font size=3D"2"><span =
style=3D"font-family:georgia,serif">Complete Error logs can be found at <a =
href=3D"https://paste.ubuntu.com/p/xvvyPnhW5c/">https://paste.ubuntu.com/p/=
xvvyPnhW5c/</a></span></font></div><div class=3D"gmail_default"><font size=
=3D"2"><span style=3D"font-family:georgia,serif"></span></font></div><font =
size=3D"2"><span style=3D"font-family:georgia,serif"></span></font></div><d=
iv class=3D"gmail_default"><font size=3D"2"><span style=3D"font-family:geor=
gia,serif"><br></span></font></div><div class=3D"gmail_default"><font size=
=3D"2"><span style=3D"font-family:georgia,serif">And when I compiled Xen co=
mmenting the two flags in Rules.mk file, it compiles and installs properly =
but on boot-up i see a blank black screen and i am stuck there.<br></span><=
/font></div><div class=3D"gmail_default"><font size=3D"2"><span style=3D"fo=
nt-family:georgia,serif"><br></span></font></div><div class=3D"gmail_defaul=
t"><font size=3D"2"><span style=3D"font-family:georgia,serif"><br></span></=
font></div><div class=3D"gmail_default"><font size=3D"2"><span style=3D"fon=
t-family:georgia,serif">Best,<br></span></font></div><div dir=3D"ltr" class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><d=
iv><div dir=3D"ltr"><div style=3D"text-align:left"><div><font size=3D"2"><s=
pan style=3D"font-family:georgia,serif">Ayush Dosaj<span class=3D"gmail_def=
ault" style=3D"font-family:arial,helvetica,sans-serif"></span></span></font=
></div><div><font size=3D"2"><span style=3D"font-family:monospace"><br></sp=
an></font></div><div><font size=3D"2"><br></font></div></div></div></div></=
div></div></div>

--000000000000cbfdf305a4712183--

