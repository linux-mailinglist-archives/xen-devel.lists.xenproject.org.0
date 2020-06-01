Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4B61EA467
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 15:11:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfkD6-0005WK-Lp; Mon, 01 Jun 2020 13:10:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSYU=7O=gmail.com=codewiz2280@srs-us1.protection.inumbo.net>)
 id 1jfji4-0001ra-AR
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 12:38:32 +0000
X-Inumbo-ID: cce7baa6-a404-11ea-9dbe-bc764e2007e4
Received: from mail-wm1-x32b.google.com (unknown [2a00:1450:4864:20::32b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cce7baa6-a404-11ea-9dbe-bc764e2007e4;
 Mon, 01 Jun 2020 12:38:31 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id q25so2288109wmj.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2020 05:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=JtZOOyBRfnaNeKFw/9nMYFP4RFl0d8hwlEyGaKq4ijA=;
 b=p2AJgIp4Fjjn0vShApcpYgz/gPAsSywakUVxzVGIUgDSmMHFgXXbwlKZGW//u3z5PJ
 fgEmBOUnfvLDzBxSinPDc5tGOjhcmc984hBLewRFRZWFv5+YgvgnhruxQpGQuLS5bJyb
 4WnPQmBIiVei2P7klmaQVTc1vsSCiKbXK1IktC1fFaH/QCTC7jHsQT7iz4GXr31f+B1g
 AI9owG8sRGyDfMWOhmFSfq0LZrdAEkMb+hxcoFTD4rlwp7YXAO/T/PVtPmhu8PMwve3+
 gsU1SMUbmZC2DD2mi1saZyuJkL5vco9JoaQvnHap7ri+Ztw9dTJEeawDCnPzIFJUbCDk
 0qwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=JtZOOyBRfnaNeKFw/9nMYFP4RFl0d8hwlEyGaKq4ijA=;
 b=Wbe6iKAZo2UxjWYg+Gz57nbhl7GiXLKhiXgmf6zwA64k4bLY/2DeVJdyK4euO5YiZb
 JU07bTuqJz9hYLJGJjLfcIZsihGFCLZrsG2twu4tP5HaTYdL2hC8pj3BpTBzuxlk3aya
 WICAsj/sBGUXchgFH4WCqxTKgdQMEJwQOlnna5+2gEYm9QGRpLc78zHUml1bTSqT0P0r
 Fz1xIbgHIlCIVmBuZvd89QHbuIxx/hb7D0gV5n02u/5Ihvqs2ulmV6Ke47UpKmzKOdUF
 nKzjm8t2oaBxW07qa4QBmpSggzz5S/uO1rcx2ylZPswrk9DKZnYqEaL/63sdL9GPDGdF
 NYrQ==
X-Gm-Message-State: AOAM533A3uKOTNgrqC4K+KdyMOm89K87m1BAYGjZlri/LIWgNaKA5w05
 La8mBKnble49cs0JIaX7ruQFYwgQnM8Gm1v5Ou+t7qYBa8Z/4Ppm
X-Google-Smtp-Source: ABdhPJwqCLMjrkS1BVMA5U5UzqEHkC/PGAfzzG4TwPqYWpzym+3h7QI/bpj+vAuNGoYtYFCtJV6TVDki2Eu7oUenskg=
X-Received: by 2002:a1c:23d2:: with SMTP id
 j201mr21289447wmj.186.1591015110729; 
 Mon, 01 Jun 2020 05:38:30 -0700 (PDT)
MIME-Version: 1.0
From: CodeWiz2280 <codewiz2280@gmail.com>
Date: Mon, 1 Jun 2020 08:38:16 -0400
Message-ID: <CALYbLDiNtHZusupf8=yhKtw1EA7HjMP3o3+WGdv9Omv9v8yVHg@mail.gmail.com>
Subject: Keystone Issue
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000081e31905a70512b2"
X-Mailman-Approved-At: Mon, 01 Jun 2020 13:10:36 +0000
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

--00000000000081e31905a70512b2
Content-Type: text/plain; charset="UTF-8"

To Whom it May Concern:

Hello, I am using a Texas Instruments K2E Keystone Eval board with Linux
4.19.59.  It has a 32-bit ARM Cortex A15 processor. There is keystone
specific code in the kernel in arch/arm/mm/pv-fixup-asm.s that executes
during early_paging_init for LPAE support.  This causes the kernel to
switch its running 32-bit address space to a 36-bit address space and the
hypervisor traps repeatedly and stops it from booting.  I suspect this is
because Xen only allowed for the original 32-bit memory range specified by
the dom0 device tree. The 36-bit LPAE address is a fixed offset from the
32-bit address and is not physically different memory.  Can you suggest any
way to get through this problem? I am using the master branch of xen from
earlier this year.  Any help is greatly appreciated.

Thanks,
Dave

--00000000000081e31905a70512b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>To Whom it May Concern:</div><div><b=
r></div><div>Hello, I am using a Texas Instruments K2E Keystone Eval board =
with Linux 4.19.59.=C2=A0 It has a 32-bit ARM Cortex A15 processor. There i=
s keystone specific code in the kernel in arch/arm/mm/pv-fixup-asm.s that e=
xecutes during early_paging_init for LPAE support.=C2=A0 This causes the ke=
rnel to switch its running 32-bit address space to a 36-bit address space a=
nd the hypervisor traps repeatedly and stops it from booting.=C2=A0 I suspe=
ct this is because Xen only allowed for the original 32-bit memory range sp=
ecified by the dom0 device tree. The 36-bit LPAE address is a fixed offset =
from the 32-bit address and is not physically different memory.=C2=A0 Can y=
ou suggest any way to get through this problem? I am using the master branc=
h of xen from earlier this year.=C2=A0 Any help is greatly appreciated.</di=
v><div><br></div><div>Thanks,<br>Dave</div></div></div>

--00000000000081e31905a70512b2--

