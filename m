Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E66393535
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 19:59:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133618.248992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmKHE-0006pz-DV; Thu, 27 May 2021 17:58:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133618.248992; Thu, 27 May 2021 17:58:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmKHE-0006nW-A2; Thu, 27 May 2021 17:58:36 +0000
Received: by outflank-mailman (input) for mailman id 133618;
 Thu, 27 May 2021 17:55:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5/6H=KW=linuxfoundation.org=dgiles@srs-us1.protection.inumbo.net>)
 id 1lmKE0-0006jp-O6
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 17:55:16 +0000
Received: from mail-ed1-x52f.google.com (unknown [2a00:1450:4864:20::52f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57f32af1-bf08-41f4-b642-69feeb514de6;
 Thu, 27 May 2021 17:55:15 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id t3so1833590edc.7
 for <xen-devel@lists.xenproject.org>; Thu, 27 May 2021 10:55:15 -0700 (PDT)
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
X-Inumbo-ID: 57f32af1-bf08-41f4-b642-69feeb514de6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=NAQh85zqlrqU3U8Zet/U5O161m4aLohptXwLJ00vp7M=;
        b=LEZ5WDtaYWfo4c5/fjjSdp8o/RM39v3dXUbduKnqVKj0W4BsEaW2HGs1teXN46+DW5
         2deKKjTLmvZDv+kpPZqbSs4+cb7pdCp73DkxAoCrgf1yj2ElHLcd4NwNyDK8qFnwNZMH
         q0IYfR0+pnMB/zHhWVieulior6q/xK3diG0qA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=NAQh85zqlrqU3U8Zet/U5O161m4aLohptXwLJ00vp7M=;
        b=YyRX63yb4Z1tW4NtZ2XJaJfA4nvZ86kbwGAJ18uJ9ACvGAFjMRtaplO7ivpJMEPkne
         Ix79e7UqhQzKjrUURo9efIlViliGDQySxjDei7KuzU4qxmG2xDlKp8Pi3BEK8pWQVMYT
         HqMlShPxUF7XjiEUm+mulr9yTao6btSlqIHXPZmI798cV7nbhVpIX6c6JALs4IVpdsy/
         P2N/qr9lrC5G2In3KO/V9/JfiP7GEMX8XYZnPG90GjvzzkkDjumgErCubS7h/r3D5v/d
         B/rgJ3qEunXpMjyTqrvojVUzdqil4ivcA97XFI/ymqq92FEo+H5uHoYDfYxj0US93JTC
         TZqQ==
X-Gm-Message-State: AOAM531LzfWx43RR9fsjDPbRbSN69gPlJ1lyDj6Z+tdwtqERzYcn/fc9
	FJETj0GqH2K/srCDbp/2QHhesb7P++N6pA8FQuWGr5djvI9ccA==
X-Google-Smtp-Source: ABdhPJyNe1DId2Qqz0Zt91JvVDkPgAInkZ2THy9mjnoTgqpTFEk58e5V2gz2I5olzrfEkwn7FJJucKd4gN638pg1WT4=
X-Received: by 2002:a05:6402:1344:: with SMTP id y4mr1860287edw.285.1622138114211;
 Thu, 27 May 2021 10:55:14 -0700 (PDT)
MIME-Version: 1.0
From: Deb Giles <dgiles@linuxfoundation.org>
Date: Thu, 27 May 2021 12:54:37 -0500
Message-ID: <CAFcyGRrEHTd-ZMsSkML67Om-uukiSfhYLyp0Ddza7pmo1Jz-2w@mail.gmail.com>
Subject: Design Session Notes
To: xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="000000000000133f0205c35376c8"

--000000000000133f0205c35376c8
Content-Type: multipart/alternative; boundary="000000000000133f0105c35376c6"

--000000000000133f0105c35376c6
Content-Type: text/plain; charset="UTF-8"

Hi Everyone,

Attached are the notes from the Design Session on VirtuIO Cross-Project BoF
(Birds of a Feather) for Xen and Guest OS (Linux, Windows, FreeBSD)
developers.

Thanks,

Deb

Deb Giles
Event Manager
The Linux Foundation
+1.503.807.1876 (Time Zone: Central Time)

*Schedule a Meeting with Me* <https://calendly.com/debgiles>

--000000000000133f0105c35376c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:tahoma,s=
ans-serif">Hi Everyone,</div><div class=3D"gmail_default" style=3D"font-fam=
ily:tahoma,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font=
-family:tahoma,sans-serif">Attached are the notes from the Design Session o=
n VirtuIO Cross-Project BoF (Birds of a Feather) for Xen and Guest OS (Linu=
x, Windows, FreeBSD) developers.</div><div class=3D"gmail_default" style=3D=
"font-family:tahoma,sans-serif"><br></div><div class=3D"gmail_default" styl=
e=3D"font-family:tahoma,sans-serif">Thanks,</div><div class=3D"gmail_defaul=
t" style=3D"font-family:tahoma,sans-serif"><br></div><div class=3D"gmail_de=
fault" style=3D"font-family:tahoma,sans-serif">Deb</div><div class=3D"gmail=
_default" style=3D"font-family:tahoma,sans-serif"><br></div><div><div dir=
=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div =
dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"lt=
r"><div><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"=
><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><font color=3D"#888888"=
>Deb Giles</font><br style=3D"color:rgb(136,136,136);font-size:12.8px"><spa=
n style=3D"color:rgb(136,136,136);font-size:12.8px">Event Manager</span><br=
 style=3D"color:rgb(136,136,136);font-size:12.8px"><span style=3D"color:rgb=
(136,136,136);font-size:12.8px">The Linux Foundation</span></div><div><a hr=
ef=3D"tel:%2B1.503.807.1876" value=3D"+14153684840" style=3D"font-size:12.8=
px;color:rgb(17,85,204)" target=3D"_blank">+1.503.807.1876</a>=C2=A0<span s=
tyle=3D"color:rgb(136,136,136);font-size:12.8px">(Time Zone: Central Time)<=
/span></div><div><span style=3D"color:rgb(136,136,136);font-size:12.8px"><b=
r></span></div><div><span style=3D"font-size:12.8px"><a href=3D"https://cal=
endly.com/debgiles" target=3D"_blank"><font color=3D"#000000"><b>Schedule a=
 Meeting with Me</b></font></a></span></div><div dir=3D"ltr"><div style=3D"=
color:rgb(136,136,136);font-size:12.8px"></div></div></div></div></div></di=
v></div></div></div></div></div></div></div></div></div></div></div></div><=
/div>

--000000000000133f0105c35376c6--
--000000000000133f0205c35376c8
Content-Type: application/vnd.openxmlformats-officedocument.wordprocessingml.document; 
	name="xl interface.docx"
Content-Disposition: attachment; filename="xl interface.docx"
Content-Transfer-Encoding: base64
Content-ID: <f_kp77046z0>
X-Attachment-Id: f_kp77046z0

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
--000000000000133f0205c35376c8--

