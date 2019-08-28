Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2D0A099C
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2019 20:35:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i32jr-000407-Hu; Wed, 28 Aug 2019 18:32:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vJI4=WY=gmail.com=komlodija@srs-us1.protection.inumbo.net>)
 id 1i32jq-000402-J0
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2019 18:32:10 +0000
X-Inumbo-ID: 25289d0c-c9c2-11e9-b95f-bc764e2007e4
Received: from mail-oi1-x22a.google.com (unknown [2607:f8b0:4864:20::22a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 25289d0c-c9c2-11e9-b95f-bc764e2007e4;
 Wed, 28 Aug 2019 18:32:09 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id b25so498510oib.4
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2019 11:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=6rbVn88YlA7iPh63QBUGqN6kMFloHgAsiNBDaXP70yE=;
 b=fW/EDPxePnrvuoiUZ02+H8MGvBvkNvL8u4jSaujv9I8J1s4kQWm/Niu+rOZOlbV3/H
 B0nCz6meo/cAPOQhAmMff17uRo/OhwIeH7cKMonNsAJf0Zhu4ASXJQuxdHdikuiqXgqj
 gCZNz0E4lk2ySeesCYpX0x/v5G1OGTxOC/Iasr7HbjTrswguHfzzxx1v4n35UzlgGU8r
 DiYu/20OgeUKQcIaf5Gmbxq7/5Nc2ofKw+isws6/J7qyMEDgUpIoufsWYfA+oYkfkkDL
 bG/awgEk6Yah38CGQcp8UXBAvgy1CK+gx7giDEwv13MNl5ntd31JV7k67RDrOs3u/N5u
 M2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=6rbVn88YlA7iPh63QBUGqN6kMFloHgAsiNBDaXP70yE=;
 b=GL9Hs3AeMO/KVAYKHEzi2y7PpoU6YZNPqS3dv+DDKYM9434emTeoFCUwM8UgDuWsbQ
 wlqu4rDQHpCqCJp2RlvT4mEo8SmbAGjfmU+uRyYkttz9cucfI5uHGeg9Tu9zh1FRArMw
 DPbi8DnE/m1ymh/JReM58eEUz4Me6fwLEHl41ijNoWZPp0e+5R0sItd7oau9uzpOwcbK
 ire3nvjTVua+Vwwz1hRmMgnP6y6Urrfgmt1rg51nwcCTrrk8zFH/9S/+t7Yv9GbBQYyH
 Orwhi9hWwvugZnUXwUb2BACtMEt6jxi7T+zfkPa7tWG/HtOV5x+prD6c/kfxkZhjrcAs
 LeNw==
X-Gm-Message-State: APjAAAVlhtmpz2zpRk/iXRTUksTrnysoPFJSGBWj+d7KC2V4ATPA9r0h
 cTkFRSRKBGtze3Cc54rS3hnLUOxp7FQy5+qSTnU=
X-Google-Smtp-Source: APXvYqyaRihFLJPleI/GJM8gc7eQgH+LBEwy0V6Al+8k/vWXC3ZPO6ek4D83+8Cd0zEMZyUxGu6q1xHPFYz9xfD0rCs=
X-Received: by 2002:aca:cc56:: with SMTP id c83mr3752886oig.75.1567017129289; 
 Wed, 28 Aug 2019 11:32:09 -0700 (PDT)
MIME-Version: 1.0
From: Joseph Komlodi <komlodija@gmail.com>
Date: Wed, 28 Aug 2019 11:31:58 -0700
Message-ID: <CANv5CpvepXe-2MEivExcX3CyGH1B1MqXeone_hBu=_xFF3SSOw@mail.gmail.com>
To: wl@xen.org, cardoe@cardoe.com
Subject: [Xen-devel] Xilinx ARM64 Xen testing
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
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org
Content-Type: multipart/mixed; boundary="===============2363689477264031215=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============2363689477264031215==
Content-Type: multipart/alternative; boundary="0000000000005953530591319b96"

--0000000000005953530591319b96
Content-Type: text/plain; charset="UTF-8"

Hi all,

I'm working on ARM64 Xen testing with Xilinx, and I have a few
quick questions to ask.

How is success vs failure determined with testing using Gitlab CI?
It looks like everything goes into a log, but is there parsing
done afterwards to make the output easier to go through?

If I have a container on Docker Hub with a QEMU binary in it, could
I use it in the Dockerfile for Xen testing as one of the FROM containers?

What are the best ways to get a binary for Xen?
Do we download it, or should we build from source?

Thanks!

Joe

--0000000000005953530591319b96
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<br><br><div>I&#39;m working on ARM64 Xen testing w=
ith Xilinx, and I have a few</div><div> quick questions to ask.</div><br><d=
iv>How is success vs failure determined with testing using Gitlab CI?</div>=
<div>It looks like everything goes into a log, but is there parsing <br></d=
iv><div>done afterwards to make the output easier to go through?</div><br><=
div>If I have a container on Docker Hub with a QEMU binary in it, could</di=
v><div> I use it in the Dockerfile for Xen testing as one of the FROM conta=
iners?</div><br><div>What are the best ways to get a binary for Xen?=C2=A0 =
<br></div><div>Do we download it, or should we build from source?</div><div=
><br></div><div>Thanks!</div><div><br></div><div>Joe<br></div><div><br></di=
v></div>

--0000000000005953530591319b96--


--===============2363689477264031215==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2363689477264031215==--

