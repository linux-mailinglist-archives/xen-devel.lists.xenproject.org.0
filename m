Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A548336DF35
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 20:51:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119560.226090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbpGa-0004Lx-IU; Wed, 28 Apr 2021 18:50:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119560.226090; Wed, 28 Apr 2021 18:50:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbpGa-0004LY-Em; Wed, 28 Apr 2021 18:50:32 +0000
Received: by outflank-mailman (input) for mailman id 119560;
 Wed, 28 Apr 2021 18:50:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G7It=JZ=gmail.com=charles.fg@srs-us1.protection.inumbo.net>)
 id 1lbpGY-0004LT-VY
 for xen-devel@lists.xen.org; Wed, 28 Apr 2021 18:50:31 +0000
Received: from mail-wr1-x42f.google.com (unknown [2a00:1450:4864:20::42f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 02d0d920-b83e-4976-b7c9-272c5c3e8da3;
 Wed, 28 Apr 2021 18:50:30 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id h15so11930095wre.11
 for <xen-devel@lists.xen.org>; Wed, 28 Apr 2021 11:50:29 -0700 (PDT)
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
X-Inumbo-ID: 02d0d920-b83e-4976-b7c9-272c5c3e8da3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=Vx263jBtX2kkYoq9sW5vOyFgpPN7Y2dvpLTzvCBCUPM=;
        b=E8x5WaIg15Jv+fEawwrMFXDK+jTAKZXkb4wRdUjNen9XzRZy/9+Lf8Lv97j4sGyxRt
         DZ4oLbABBbnVqkpYPNoRzattXTjM4c1ekfXe9S5Rp3077TaTRyUxyOwHdT65Z7ML20JI
         VPlwOf7cYXDcDqaKu5gVFx8FDjav/jRhgYzXNDNpIEZpD/xqPuOrc/YUL10NQWVqt8go
         WbzqjV0XwL8jWSacCUq2sfA56aeY4kZ5cfLp85WLoUYTx1WQLnf8J6prsHQNnBonM+cV
         4ixH8OLa5eqFiA3AvTGzNZFA57bPsSpcQN7hGFs/5DJtpidaRHkDZs+BBB11POg5P6zc
         nPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Vx263jBtX2kkYoq9sW5vOyFgpPN7Y2dvpLTzvCBCUPM=;
        b=e75b08BUt5UngYdYTsL1HTZMAQ9PcoLB8bjOdBRVjW04egtmtBFri1gOyYIO5nBG8D
         BWgpnX0sAZsp+44cDxWoydQmTc64lRRprkyXluK5dFnLgwvPR0/pxi3kLbT4RWPzWcHk
         bypdsuBXA/7oLL7hnFqr7VHgvNsOaDKJkWuCrcmuRp7P71eFRbVDPsmBUNFrzlcxOJX8
         hInzN2AfHX/OMIc5tqJB/SrQ+S3TroXYxJj0VMBIdoloJz+BvdWql1gmJkH5gCYGtoiG
         hzAZdQ0L4O7Mw0sMc0/RzGZAq/cBC34nBQVNHbqiA27OitX16sh75SIQHyotsPuQ+9D/
         Sj7A==
X-Gm-Message-State: AOAM531Ns0mmIyV42C8voLguL/DrNHUUqagMT4cMBlcX3lOa4LoQJ8sN
	pgdSatvD0qntznVIymzdo0NqdChHr+J3+QX78KWIdo7MUms=
X-Google-Smtp-Source: ABdhPJxojyihSVikYF+E2TGx9ahF4ICIczqLF+gZhcg1JNgPRYWVKSPlJgTBNviM3YGY0f008vp70x6Za0EMlpPUtNU=
X-Received: by 2002:a05:6000:180a:: with SMTP id m10mr30751975wrh.215.1619635828777;
 Wed, 28 Apr 2021 11:50:28 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Charles_Gon=C3=A7alves?= <charles.fg@gmail.com>
Date: Wed, 28 Apr 2021 19:49:53 +0100
Message-ID: <CAAQRGoBi4tC+K_FHJceXxEqC6wy79qX0aE60OOeBWSo8tTEbjg@mail.gmail.com>
Subject: Serial Console : SOL vs Physical Port
To: xen-devel@lists.xen.org
Content-Type: multipart/alternative; boundary="0000000000003d686105c10cda56"

--0000000000003d686105c10cda56
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Guys,

Is there any difference between both?
I'm trying to debug an issue using a SOL but the host crashes before any
meaningful message.

The SOL is working properly when I can debug some crashes perfectly. But
for a specific case I'm wondering if I could be losing some messages.

Atenciosamente,
*Charles Ferreira Gon=C3=A7alves *

--0000000000003d686105c10cda56
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Guys,<div><br></div><div>Is there any difference bet=
ween both?</div><div>I&#39;m trying to debug an issue using a SOL but the h=
ost crashes before any meaningful message.</div><div><br></div><div>The SOL=
 is working properly when I can debug some crashes perfectly. But for a spe=
cific case I&#39;m wondering if I could be losing some messages.<br clear=
=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"=
gmail_signature"><div dir=3D"ltr"><div><br></div><div>Atenciosamente,</div>=
<b>Charles Ferreira Gon=C3=A7alves </b><br><font color=3D"#666666"><br></fo=
nt><font color=3D"#666666" size=3D"1"><br></font></div></div></div></div></=
div>

--0000000000003d686105c10cda56--

