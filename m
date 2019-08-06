Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ACE82C36
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 09:03:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hutSF-0002l3-0X; Tue, 06 Aug 2019 07:00:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=v3x5=WC=gmail.com=xenserver.boy@srs-us1.protection.inumbo.net>)
 id 1husF5-00061M-6P
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 05:42:39 +0000
X-Inumbo-ID: ff39f9a2-b80c-11e9-8980-bc764e045a96
Received: from mail-oi1-x22c.google.com (unknown [2607:f8b0:4864:20::22c])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ff39f9a2-b80c-11e9-8980-bc764e045a96;
 Tue, 06 Aug 2019 05:42:37 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id a127so64778775oii.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Aug 2019 22:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=u2eLEOB5MVV2NjtYDiEkddpztUxMsfLAQWyuvHezVUk=;
 b=HsdLxYDH9uEqONw3OQeL/xMKS+odHOcuHpT81vMeV/T7Zd65Rnx0jn34NJsl+GOM6w
 BA+d9XLfve0wEpfJ/P83cD47bDu09rcb9T84dp94w4ngYyuGRHFJaS+Q/KwLnnETBP2a
 RTd49BR/OJuSSG8Pb3dUyqEKGTOVXbASqCTf9m2nS263i0CZQQn3mnvaeNEQxfRlKQ14
 spgp1APJM+PvwyPDHHHlaE4vw1gDnaNjmtvw7skpRFD4MY8ufYrmuXlzErm1OP59YvhV
 Jf59ThpLsIKG7QnVpyHO0oRw2ELpWESystoLKiakp5NNXxfIYxJdL4JwxAnWZwWfqfoV
 kzlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=u2eLEOB5MVV2NjtYDiEkddpztUxMsfLAQWyuvHezVUk=;
 b=YpIPMS9V/0AJ2zV9tfPjl9B0VVrszhwAgZbyAeMnFRDyajdgGSKcEjZR2cgXLShnjR
 H6ykOacnrIQ1am+A4THJqt3Bk6r1Vlj2CPgtZ3mPaO0Yq+pUmhvgNQNBywTm35NMvOAk
 lO3sX7ALaui/m/2ZSs2GSYORbx2DOvIYMv/6JepWXGRhgA/AbMt0Vwjj4oavUYTVdR1t
 fgvK3LApIGvWrmpgp96mw/laYvX1QTyL0A6UhC4TaveYsbBH82yX0uzBv9HCmUilIQJ8
 BiuIGA0d08BWypzmIrHcYKFOFOjik0KcTaS8e1+An7e2jTnTiHsXMLs7hoB3Oj7ayj9M
 lvQQ==
X-Gm-Message-State: APjAAAUUNp/b1WdN8Ka+KDSJRXfVb9leRc4g17QmgCnmF34HKRaDPHD5
 VR26SAXYLaVRFI+s8hGTzKRxhzZlSkfFvucKyHIxZhHN
X-Google-Smtp-Source: APXvYqzTdDRMqzlEf9s5nL82I6Ps4+8KO/o1BpRa69o1VWO4nxRVNu2Sk0tsVCW9tF1vHF/HE53+c7BylxbemFGC5SY=
X-Received: by 2002:aca:f003:: with SMTP id o3mr558230oih.59.1565070156858;
 Mon, 05 Aug 2019 22:42:36 -0700 (PDT)
MIME-Version: 1.0
From: Citrix Boy <xenserver.boy@gmail.com>
Date: Tue, 6 Aug 2019 10:12:25 +0430
Message-ID: <CAAvJE4Se=CpK1=R1yFhxfYLTuA-JGFwRTx0wf041w7Fqjt219g@mail.gmail.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
X-Mailman-Approved-At: Tue, 06 Aug 2019 07:00:17 +0000
Subject: [Xen-devel] Developing Xen for beginners.
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
Content-Type: multipart/mixed; boundary="===============1049398714350293611=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============1049398714350293611==
Content-Type: multipart/alternative; boundary="000000000000bf8cef058f6c4a2e"

--000000000000bf8cef058f6c4a2e
Content-Type: text/plain; charset="UTF-8"

Hello,
I have a question and I'm sure it is a question of many users. A beginner
that wants to develop Xen, which skills he/she needed and which file is
good for start? The Xen Project is a big project and have a lot of files
and codes. Where is the best point to start? I see that in the "
xenproject.org" website and part for beginners existed, but it never said
how we can start or where is the best point.

Thank you.

--000000000000bf8cef058f6c4a2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br>I have a question and I&#39;m sure it is a quest=
ion of many users. A beginner that wants to develop Xen, which skills he/sh=
e needed and which file is good for start? The Xen Project is a big project=
 and have a lot of files and codes. Where is the best point to start? I see=
 that in the &quot;<a href=3D"http://xenproject.org">xenproject.org</a>&quo=
t; website and part for beginners existed, but it never said how we can sta=
rt or where is the best point.<br><br>Thank you.<br></div>

--000000000000bf8cef058f6c4a2e--


--===============1049398714350293611==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1049398714350293611==--

