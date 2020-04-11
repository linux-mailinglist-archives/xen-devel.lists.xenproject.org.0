Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 324301A5276
	for <lists+xen-devel@lfdr.de>; Sat, 11 Apr 2020 16:12:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jNGqX-0005mB-8V; Sat, 11 Apr 2020 14:10:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=u1+c=53=gmail.com=asaffisher.dev@srs-us1.protection.inumbo.net>)
 id 1jNGqW-0005m6-3G
 for xen-devel@lists.xen.org; Sat, 11 Apr 2020 14:10:56 +0000
X-Inumbo-ID: 423f145e-7bfe-11ea-b58d-bc764e2007e4
Received: from mail-io1-xd32.google.com (unknown [2607:f8b0:4864:20::d32])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 423f145e-7bfe-11ea-b58d-bc764e2007e4;
 Sat, 11 Apr 2020 14:10:55 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id w1so4504408iot.7
 for <xen-devel@lists.xen.org>; Sat, 11 Apr 2020 07:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=SYnSHfrgOF4GTQDV7WSKSR4bvytGSvXB2i4xtH3btGo=;
 b=UEmKtAEcsl9IuijxoyXMCF603F3Vm5a3mWJZghqQEL2JmXsCP4fmZbpHT4TF2Nv+9f
 fKGJo94Y6bWYHdKktWryBFyETiVmd0y7ckS67uxmnq+ZuKSMiKZcp3Oqm0gUtfPpqhvy
 Avvm7ax9mfd/1DAbETJTx5ZdKeSuWtRO2tLp8AUSDmSun8vJNHFbSqUslX9WfDUaA2Yw
 l5oBy5jHva4Zj8LXlSFD9bE1CvDnWc6EF2ak2e9/pxIXdTWaz1sjzfq1Io0E8kWVWy1W
 Fi0apuXgsVebpWfLR6U5ebDMxrqbegvWaEMMrgIp7FO1IzB7IGvEW8rHHnmn96SfBZ/s
 LqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=SYnSHfrgOF4GTQDV7WSKSR4bvytGSvXB2i4xtH3btGo=;
 b=D8ZwfGFeA0g/3iItS39DMnR7ppanFHKZpkyMa3sTUMeRZJJJ/tam73gKtzM5KjcuZB
 R+Uiil6oILzx2z0Q2kjrEM0Wbp0hMdhJ1lj0GXIFjCfWYNFW/ZmiMAij3xix/5ezEaI2
 VBBjbgMoMALP+gkG+OfpdDCwdPEJUXWcB1Azhb/vYtwg9I27orNlvj7+FRg97OH1GgJC
 O0iURUPXXgUUGu1VQY3s9ridbzVBsO2YOA/WI55BBvC3EOb8CA9m44p1TjwxRrnBsEdj
 c1nThWXFiroBxr1QXAiTBeLxL9rQmZC4xwyFeTSoRqXWcpThKtlaHpRzmWou5i3hYYMj
 8Fcw==
X-Gm-Message-State: AGi0Pua32ZKDSDPBXhkd2BVeWM6jKFTLStUHrCw0k/jR/cv1h52I+96I
 ZdxM5crI7Dj1p7NxF3CE11c4+n0uEs5MkOTWLmo3pZfk
X-Google-Smtp-Source: APiQypJqwxYBftsQ4oNxMiCWHIZBpPHog176jHLFzRSFutM0IXyuVLu0qM07K2x9o1Ga/Fd7qg3N8zdI3UiOoxY4Bn4=
X-Received: by 2002:a05:6602:2402:: with SMTP id
 s2mr8702559ioa.69.1586614254552; 
 Sat, 11 Apr 2020 07:10:54 -0700 (PDT)
MIME-Version: 1.0
From: Asaf Fisher <asaffisher.dev@gmail.com>
Date: Sat, 11 Apr 2020 17:10:43 +0300
Message-ID: <CAHmESttxVE+E93svHBEwCE1pNYc9Lxkb+L2vm2jGwbBwOEMOXA@mail.gmail.com>
Subject: XEN 4.11 PV questions
To: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Content-Type: multipart/alternative; boundary="00000000000009cf9105a3046b51"
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--00000000000009cf9105a3046b51
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,
In general I have a intel family 6 model 94 and xen does not support so I
want to add support to it.
For the question:

I=E2=80=99m trying to understand exactly how and when dom0=E2=80=99s vCPU g=
ets a runtime
and where in the code is like the =E2=80=9Cvmenter=E2=80=9D(I know there is=
 no such a thing
in pv..)

So:
1. I got 2 pCPUs and I see that after the secondary cpu gets setup it goes
into and idle loop and wait for a task.

2. When primary cpu finishes init xen, it unpauses dom0 and therefore
schedule it=E2=80=99s vCPU and call the wake function on the credit schedul=
er.
I=E2=80=99m getting a hard time understanding what the wake do... does it p=
ut a
tasklet in the percpu section and then the pCPU see it in its tasklet on
the idle loop? If not what really happens? If yes, how what is the code
flow that causes the dom0 code to be executed? Is it a context switch? If
so where? Or is it just a function call?(I think it=E2=80=99s highly unlike=
ly)

Another hypothesis of mine is that the tasklet is just for callbacks and
not for guests? And do_softirq actually causes scheduling and eventually
causes the cpu to run dom0? I REALLY want to know where the hell is the
last line before a cpu gets into the dom0 context xD

Thanks! I will appreciate the help so much!

--00000000000009cf9105a3046b51
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello,</div><div dir=3D"auto">In general I have a intel f=
amily 6 model 94 and xen does not support so I want to add support to it.</=
div><div dir=3D"auto">For the question:</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">I=E2=80=99m trying to understand exactly how and when dom0=
=E2=80=99s vCPU gets a runtime and where in the code is like the =E2=80=9Cv=
menter=E2=80=9D(I know there is no such a thing in pv..)=C2=A0</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">So:</div><div dir=3D"auto">1. I got =
2 pCPUs and I see that after the secondary cpu gets setup it goes into and =
idle loop and wait for a task.=C2=A0</div><div dir=3D"auto"><br></div><div =
dir=3D"auto">2. When primary cpu finishes init xen, it unpauses dom0 and th=
erefore schedule it=E2=80=99s vCPU and call the wake function on the credit=
 scheduler.</div><div dir=3D"auto">I=E2=80=99m getting a hard time understa=
nding what the wake do... does it put a tasklet in the percpu section and t=
hen the pCPU see it in its tasklet on the idle loop? If not what really hap=
pens? If yes, how what is the code flow that causes the dom0 code to be exe=
cuted? Is it a context switch? If so where? Or is it just a function call?(=
I think it=E2=80=99s highly unlikely)=C2=A0</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Another hypothesis of mine is that the tasklet is just =
for callbacks and not for guests? And do_softirq actually causes scheduling=
 and eventually causes the cpu to run dom0? I REALLY want to know where the=
 hell is the last line before a cpu gets into the dom0 context xD=C2=A0</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks! I will appreciate t=
he help so much!</div>

--00000000000009cf9105a3046b51--

