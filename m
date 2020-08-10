Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19248240654
	for <lists+xen-devel@lfdr.de>; Mon, 10 Aug 2020 15:06:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k57V6-0000PF-Bk; Mon, 10 Aug 2020 13:06:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eXML=BU=iittp.ac.in=cs17b006@srs-us1.protection.inumbo.net>)
 id 1k576N-0006wE-JT
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2020 12:40:31 +0000
X-Inumbo-ID: f0982355-bf7a-46ca-8f47-c95c6b6325f1
Received: from mail-wr1-x42e.google.com (unknown [2a00:1450:4864:20::42e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0982355-bf7a-46ca-8f47-c95c6b6325f1;
 Mon, 10 Aug 2020 12:40:29 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id f7so8036612wrw.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2020 05:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=iittp-ac-in.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=6RI9ge20MGwyQDF/q+D13QX8FqQS5DG75aexxfmIIus=;
 b=CUvUy+/HbzjMNa3L+c0Sb05/HonofISu/AZopp9MtVAsrUM+R77cXjsDIgsa+8kAaQ
 iBX7G+8FRHeZspfG0zPtQzVHlCF6hku1lnhIdFP/ykjfMmh6v4jXj+erMS28B4SCR5DV
 sn0z9KHcz9Wuo02vGliR9h2aSmJjxdibHWtrneqSPFAdsYMQlpD6bH4MCmiE+NN8In2e
 a+T2Bysh2Vn3grgZGQh7fZkkBeCOOipUl9O4JynRif/xdJeCOZbjn3ZyXMN9Thb/ndY9
 QXcGWztozPIIFj3MaKeK/ewoIT/WtQS2gF9zxdKd1g5l+O7I9/8GablVihIA9KAg9b2i
 TXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=6RI9ge20MGwyQDF/q+D13QX8FqQS5DG75aexxfmIIus=;
 b=sWKpXXACl0tbizHPwUSA5olAxPub8IBoCenIoxJROUsUmb2YtasYjhPDwWNHTJE95b
 fVY0J3lzmWHKphztcR3OxxrUVMMq8tS157LgrdPigF1F3gZNmGKVw48uuXY6caeM8ChZ
 qAg9c5ZEm5XdVvV6PbL0TAO7YKmRM2QIhSXp03h3Moci913oGLAwy2v9s+6IN5XTVpXh
 npkRzNAa3iVOvPgzZdjkoKMCyB4qXdNb1AVEUegrnsHQL0sQaw7DPDXkCYEW3+cEiOkp
 vxkN0zsb96ofoO6uuOOCp+cBgC74Q1G+40t9xMS55DEYvVr2l5HS9A77UX7e1hA4YyAW
 +NVw==
X-Gm-Message-State: AOAM533QFQF3iXYkJEq/Iay121PSbmjfrhTN/e/UTgvpi31BhHpjlQrJ
 lQrd1bPhc/VIMUn8fcGxz1F2hmrCykVfLllqazjjoTHMk55paA==
X-Google-Smtp-Source: ABdhPJxdjdUEEWqrFiCEvsNGbXTUMu/gjazRjRZbo3UHJaYxy39H6Xlo0vyt5b5ncut0XJQ5o+yhyYHM0h6KCeDp2P4=
X-Received: by 2002:adf:df08:: with SMTP id y8mr26127825wrl.152.1597063228049; 
 Mon, 10 Aug 2020 05:40:28 -0700 (PDT)
MIME-Version: 1.0
From: CS17B006 ARNAB DUTTA <cs17b006@iittp.ac.in>
Date: Mon, 10 Aug 2020 18:10:17 +0530
Message-ID: <CA+_ggFiM+1i9BH2m5+WCgEjjzLXLS6x8823FyuL1JBBO3wc4RA@mail.gmail.com>
Subject: Xen VMI APIs
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000645def05ac85425d"
X-Mailman-Approved-At: Mon, 10 Aug 2020 13:06:03 +0000
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

--000000000000645def05ac85425d
Content-Type: text/plain; charset="UTF-8"

Respected Sir/Ma'm
I am Arnab and I am currently writing rust bindings for xen vmi APIs for a
project known as Libmicrovmi which aims to provide unified vmi APIs for
various hypervisors. I am facing some difficulty regarding setting up the
event system in the sense that after enabling monitoring for events, on
polling I get a return value of 1, but xenevtchn_pending() returns a value
-1, which probably means it cannot get a port with pending events. I am
really confused and need help here.

Thanking you

With regards
Arnab Dutta
Computer Science and Engineering Department
Indian Institute of Technology, Tirupati, India
Ph no. 8420771531

--000000000000645def05ac85425d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><font size=3D"2"><span style=3D"background-color:rgb(255,2=
55,255)"><span style=3D"color:rgb(0,0,0)">Respected Sir/Ma&#39;m <span styl=
e=3D"font-family:&quot;source sans pro&quot;,helvetica,sans-serif;white-spa=
ce:pre-wrap"><br></span></span></span></font><div><font size=3D"2"><span st=
yle=3D"background-color:rgb(255,255,255)"><span style=3D"color:rgb(0,0,0)">=
<span style=3D"font-family:&quot;source sans pro&quot;,helvetica,sans-serif=
;white-space:pre-wrap">I am Arnab and I am currently writing rust bindings =
for xen vmi APIs for a project known as Libmicrovmi which aims to provide u=
nified vmi APIs for various hypervisors. I am facing some difficulty regard=
ing setting up the event system in the sense that after enabling monitoring=
 for events, on polling I get a return value of 1, but xenevtchn_pending() =
returns a value -1, which probably means it cannot get a port with pending =
events. I am really confused and need help here. <br></span></span></span><=
/font></div><div><font size=3D"2"><span style=3D"background-color:rgb(255,2=
55,255)"><span style=3D"color:rgb(0,0,0)"><span style=3D"font-family:&quot;=
source sans pro&quot;,helvetica,sans-serif;white-space:pre-wrap"><br></span=
></span></span></font></div><div><font size=3D"2"><span style=3D"background=
-color:rgb(255,255,255)"><span style=3D"color:rgb(0,0,0)"><span style=3D"fo=
nt-family:&quot;source sans pro&quot;,helvetica,sans-serif;white-space:pre-=
wrap">Thanking you</span></span></span></font></div><div><font size=3D"2"><=
span style=3D"background-color:rgb(255,255,255)"><span style=3D"color:rgb(0=
,0,0)"><span style=3D"font-family:&quot;source sans pro&quot;,helvetica,san=
s-serif;white-space:pre-wrap"><br></span></span></span></font></div><div><f=
ont size=3D"2"><span style=3D"background-color:rgb(255,255,255)"><span styl=
e=3D"color:rgb(0,0,0)"><span style=3D"font-family:&quot;source sans pro&quo=
t;,helvetica,sans-serif;white-space:pre-wrap">With regards</span></span></s=
pan></font></div><div><font size=3D"2"><span style=3D"background-color:rgb(=
255,255,255)"><span style=3D"color:rgb(0,0,0)"><span style=3D"font-family:&=
quot;source sans pro&quot;,helvetica,sans-serif;white-space:pre-wrap">Arnab=
 Dutta</span></span></span></font></div><div><font size=3D"2"><span style=
=3D"background-color:rgb(255,255,255)"><span style=3D"color:rgb(0,0,0)"><sp=
an style=3D"font-family:&quot;source sans pro&quot;,helvetica,sans-serif;wh=
ite-space:pre-wrap">Computer Science and Engineering Department</span></spa=
n></span></font></div><div><font size=3D"2"><span style=3D"background-color=
:rgb(255,255,255)"><span style=3D"color:rgb(0,0,0)"><span style=3D"font-fam=
ily:&quot;source sans pro&quot;,helvetica,sans-serif;white-space:pre-wrap">=
Indian Institute of Technology, Tirupati, India</span></span></span></font>=
</div><div><span style=3D"background-color:rgb(255,255,255)"><span style=3D=
"color:rgb(0,0,0)"><span style=3D"font-family:&quot;source sans pro&quot;,h=
elvetica,sans-serif;font-size:15.12px;white-space:pre-wrap"><font size=3D"2=
">Ph no. 8420771531</font><br></span></span></span></div></div>

--000000000000645def05ac85425d--

