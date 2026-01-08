Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF692D0284C
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 13:01:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197622.1515104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdohX-0003gs-9D; Thu, 08 Jan 2026 12:01:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197622.1515104; Thu, 08 Jan 2026 12:01:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdohX-0003dl-6H; Thu, 08 Jan 2026 12:01:15 +0000
Received: by outflank-mailman (input) for mailman id 1197622;
 Thu, 08 Jan 2026 12:01:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1vdohV-0003de-4J
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 12:01:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1vdohU-00Eym4-2W
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 12:01:13 +0000
Received: from mail-vk1-f173.google.com ([209.85.221.173])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <cody.zuschlag@xenproject.org>) id 1vdohU-00Dx91-37
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 12:01:12 +0000
Received: by mail-vk1-f173.google.com with SMTP id
 71dfb90a1353d-563497c549cso1185580e0c.3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Jan 2026 04:01:12 -0800 (PST)
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Type:To:Subject:Message-ID:Date:
	From:MIME-Version; bh=FlhLzpNBstRsxucMILxjs6BP+12x/tGiPqPKf+WmCIc=; b=HW2g075
	XPWWqCyNDdGqGW3Nf0g9EiIrL+jG6bCij2QIfXV1eJYOawnkxhyHt7CVRxpzKPH+XbrdA9k0AQmSP
	yMjaef2LGOO2Qam0i3RMrbzuuvlzWITIxbqXxndoKAy8NkjYSqd5EvvG4eQfh/G0ojBpai52mXABR
	mueZuOAb0U=;
X-Forwarded-Encrypted: i=1; AJvYcCUCFaI+FcyJq8MkVIul/3y9UtvTA5KA2hYNIimwieRx3A4wyt9V7ahhIkPqziZL+mXdx0PECJ/LSD0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKymeyJUR6d7UwwJHxAIzPriJEMQWVDguFjZXQW1X4UlY0CgC8
	C0RVYxY/VllyTCLkDj+q5kq15H7rMiiT6jyYHqiW9BvNx2ZlgttwHKRuk5gUP27IDNo/a0VZRX5
	w97Qf39VDORbeDiV8lh/nM27L6Nj8fek=
X-Google-Smtp-Source: AGHT+IEM1TKg/HMXA0/cxC/dhQ811GQ9NFtnttIPBoFW5uPVxwVclIXlCHkllLgTlpaNduKhfgJXnTa0XK6FjepdwK0=
X-Received: by 2002:a05:6122:17aa:b0:557:cbc5:ce0f with SMTP id
 71dfb90a1353d-56347e8ed8amr1856528e0c.8.1767873672102; Thu, 08 Jan 2026
 04:01:12 -0800 (PST)
MIME-Version: 1.0
From: Cody Zuschlag <cody.zuschlag@xenproject.org>
Date: Thu, 8 Jan 2026 13:00:00 +0100
X-Gmail-Original-Message-ID: <CAJbE=KzqW5jTusFytW9yK5c2Ps791YYJKohHrVPRENKUEJ+O8w@mail.gmail.com>
X-Gm-Features: AQt7F2qvu1M01nXcX-hnp-zEFrCVKsF18n6skVx0Bidaw4CwzNa5rJCu9j4x3A8
Message-ID: <CAJbE=KzqW5jTusFytW9yK5c2Ps791YYJKohHrVPRENKUEJ+O8w@mail.gmail.com>
Subject: [ANNOUNCE] Xen Spring Meetup details & CFP
To: xen-announce@lists.xenprojet.org, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000003bcb460647df2a73"

--0000000000003bcb460647df2a73
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 Hello Xen community =F0=9F=91=8B

We=E2=80=99re happy to share that the *Xen Spring Meetup 2026* will take pl=
ace
on *April
2-3, 2026* in *Grenoble, France =F0=9F=87=AB=F0=9F=87=B7, hosted at Univers=
it=C3=A9 Grenoble Alpes.*

This is a two-day, in-person community event focused on technical exchange,
real-world experience, and open discussion across the Xen ecosystem.
Whether you=E2=80=99re developing Xen, running it in production or research=
, or
exploring new areas like embedded, safety-critical, or automotive use
cases, we=E2=80=99d love to have you there.


*=F0=9F=8E=A4 The Call for Proposals is now open.*We=E2=80=99re looking for=
 technical,
experience-driven talks. This is not a sales or marketing event.

What to do now:

   - =F0=9F=93=85 Save the date and block your calendar
   - =F0=9F=8E=99=EF=B8=8F Submit a talk
   - =F0=9F=91=A5 Share this with others in the Xen community who should be=
 involved


Event details and CFP:
=F0=9F=91=89 https://xenproject.org/resources/spring-meetup-2026/

More updates coming soon! We=E2=80=99re really looking forward to bringing =
the
community together in Grenoble next spring =F0=9F=90=BC =F0=9F=A5=90

Cody Zuschlag
Xen Project - Community Manager

--0000000000003bcb460647df2a73
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>





Hello Xen community =F0=9F=91=8B<br><br>We=E2=80=99re happy to share that t=
he <b>Xen Spring Meetup 2026</b> will take place on <b>April 2-3, 2026</b> =
in <b>Grenoble, France =F0=9F=87=AB=F0=9F=87=B7, hosted at Universit=C3=A9 =
Grenoble Alpes.</b><br><br>This is a two-day, in-person community event foc=
used on technical exchange, real-world experience, and open discussion acro=
ss the Xen ecosystem. Whether you=E2=80=99re developing Xen, running it in =
production or research, or exploring new areas like embedded, safety-critic=
al, or automotive use cases, we=E2=80=99d love to have you there.<br><br><b=
>=F0=9F=8E=A4 The Call for Proposals is now open.<br></b>We=E2=80=99re look=
ing for technical, experience-driven talks. This is not a sales or marketin=
g event.<br><br>What to do now:<br><ul><li>=F0=9F=93=85 Save the date and b=
lock your calendar</li><li>=F0=9F=8E=99=EF=B8=8F=C2=A0Submit a talk</li><li=
>=F0=9F=91=A5 Share this with others in the Xen community who should be inv=
olved</li></ul><br>Event details and CFP:<br>=F0=9F=91=89 <a href=3D"https:=
//xenproject.org/resources/spring-meetup-2026/">https://xenproject.org/reso=
urces/spring-meetup-2026/</a><br><br>More updates coming soon! We=E2=80=99r=
e really looking forward to bringing the community together in Grenoble nex=
t spring =F0=9F=90=BC=C2=A0=F0=9F=A5=90</div><div><br><p class=3D"gmail-p1"=
><img src=3D"https://ci3.googleusercontent.com/mail-sig/AIorK4x5nkRDCOFJDJA=
v9aMXdZ0mghItsp3D36JrwBCQtitBSW_0NeDS6mBmJ2F4vZVE2oBOqnY6IaJUrl12"></p></di=
v><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_s=
ignature"><div dir=3D"ltr"><div>Cody Zuschlag</div><div>Xen Project - Commu=
nity Manager</div></div></div></div></div>

--0000000000003bcb460647df2a73--

