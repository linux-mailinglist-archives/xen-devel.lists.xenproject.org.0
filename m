Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B3DBDB06
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 11:31:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD3a5-0004UY-PK; Wed, 25 Sep 2019 09:27:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AhIN=XU=gmail.com=katereenart@srs-us1.protection.inumbo.net>)
 id 1iD3a4-0004UT-HV
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 09:27:28 +0000
X-Inumbo-ID: b060ec20-df76-11e9-bf31-bc764e2007e4
Received: from mail-lj1-x22c.google.com (unknown [2a00:1450:4864:20::22c])
 by localhost (Halon) with ESMTPS
 id b060ec20-df76-11e9-bf31-bc764e2007e4;
 Wed, 25 Sep 2019 09:27:27 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id j19so4890826lja.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2019 02:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=uE5zz4Nfm0bKt2TMbBU0ovOSOdXeI8y5jE9/frRnEdQ=;
 b=kx6VeFkcEU0yo6/h3DQxyu0XtSd5AbHOaXHuuc9K85PBu1ayv+0tkBTUscQipvvWRa
 fq/kbuJYek2rHvpJgasEdBUB+Ls7XpGEeNoEE4klC4bvxPaO0U3AeGGRBe+RR9CqeS3N
 S1bDsQI28KNnjrq2AN1xivCyXwLTLqb+0sB6IZXrJhOquBp0PqYDIivGQtfvpEFhMe9i
 +EnPQHILhvnReRnW3kH1+YpuN9ZSB6PHby0SU8tIRed5/pC+2BlZKLOF6dhS5GkWz4yo
 cM7rB0utbZAci86BRmJ7fxdqUoTiZ9JY0JQ6AC30E3JbVLZVeJJmlF2GiY8ysbMZG2/V
 q30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=uE5zz4Nfm0bKt2TMbBU0ovOSOdXeI8y5jE9/frRnEdQ=;
 b=r307qvSl9jsEfhlvJRpBVC8Og7XNPsXfMYYaLhOiHlottQ1CWDG4Z9A2yC2/ud8mJt
 vzAfN+YZHoDjielmgsOnJ48D3BHr6GG0mbWP9rinnCyU58RrZUEnAewBgDNoFZqoK8aZ
 hwYyHYAX03UWrZ4ngh2B9oCzYkvs295Vzv9PgzprXW0Lzqr7tjwjgLjvVRFpJmXy+UZL
 +WdRt7i+dagPk9HcjDMNz1OlsS1FHsxBlbuU686+HMkTGSIU/aHKLBlmWXPa05kyZLky
 lvkdmcNEXuajuUCZKr00sM066yIHrt6i5dDQAMys+kKfhhPZ/Q7AhuxFv0MHj/1mckfT
 RdZw==
X-Gm-Message-State: APjAAAWN5fRrHDaiYcb4I3u6thc3W6iEsmXrhVaj23ZD/cK6LIikBgPq
 hkEJ9EzakbM8OPerwP3bRpU6AOBnFycoDmDlyyFw1v7nX/o=
X-Google-Smtp-Source: APXvYqzTFTZwDgkVN/OHVUvnkZ1WjUSsM4uZFen20u32Wjj4SKTQ0/IxfOypT/SsM2I+w3gjnl1JBUvcxhtSrDZv+QE=
X-Received: by 2002:a05:651c:22a:: with SMTP id
 z10mr5313910ljn.103.1569403646443; 
 Wed, 25 Sep 2019 02:27:26 -0700 (PDT)
MIME-Version: 1.0
From: Kateryna Razumova <katereenart@gmail.com>
Date: Wed, 25 Sep 2019 11:27:15 +0200
Message-ID: <CAFjkr2qCb7ZoOAx2A_oFE1znjpia=2Auk+XePybfWbk8jB-9Nw@mail.gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [Xen-devel] I want to participate in Outreachy with CONFIG_PDX
 related project
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
Content-Type: multipart/mixed; boundary="===============0939502749002853400=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0939502749002853400==
Content-Type: multipart/alternative; boundary="000000000000db04c705935d4286"

--000000000000db04c705935d4286
Content-Type: text/plain; charset="UTF-8"

Hello xen,
I would like to participate in Outreachy. I was registered on the site few
days ago, filled some quite a big form but still can't see tasks'
descriptions.
Since, I like C programming I would like to know more about "Introduce
CONFIG_PDX and use it in Xen hypervisor". What hardware do I need? I think
I can find an old laptop with virtualization support. Also, how can I start
contributing?
I have few years of C programming experience but never had contributed to
open-source projects before.

--000000000000db04c705935d4286
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello xen,</div><div>I would like to participate in O=
utreachy. I was registered on the site few days ago, filled some quite a bi=
g form but still can&#39;t see tasks&#39; descriptions. <br></div><div>Sinc=
e, I like C programming I would like to know more about &quot;Introduce CON=
FIG_PDX and use it in Xen hypervisor&quot;. What hardware do I need? I thin=
k I can find an old laptop with virtualization support. Also, how can I sta=
rt contributing?</div><div>I have few years of C programming experience but=
 never had contributed to open-source projects before.<br></div></div>

--000000000000db04c705935d4286--


--===============0939502749002853400==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0939502749002853400==--

