Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C1D5C053D
	for <lists+xen-devel@lfdr.de>; Wed, 21 Sep 2022 19:26:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409870.652865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ob3TC-0000Go-Ql; Wed, 21 Sep 2022 17:25:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409870.652865; Wed, 21 Sep 2022 17:25:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ob3TC-0000Ee-Nk; Wed, 21 Sep 2022 17:25:10 +0000
Received: by outflank-mailman (input) for mailman id 409870;
 Wed, 21 Sep 2022 17:25:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9cOZ=ZY=gmail.com=vsuneja63@srs-se1.protection.inumbo.net>)
 id 1ob3TB-0000EY-IR
 for xen-devel@lists.xenproject.org; Wed, 21 Sep 2022 17:25:09 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5686373f-39d2-11ed-9647-05401a9f4f97;
 Wed, 21 Sep 2022 19:25:07 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id y8so9722017edc.10
 for <xen-devel@lists.xenproject.org>; Wed, 21 Sep 2022 10:25:07 -0700 (PDT)
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
X-Inumbo-ID: 5686373f-39d2-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=4EIU4Hy+tQ0GDed0xnb5Zti954ckG/5IBPdVDQ/JjaQ=;
        b=JPLjcQ+/q/woVokAwYy0bJjXAAy9+J2NbQg7rKeMMmjz+HocG17qbS0GmBsAaiCF9I
         rBIdsiFNZhFFdenY25Xxz2whvMHaihy0mKo0ygmLMUqvYG9wcV0iAFYlHjNxR5ae1CWM
         GohNGr2TTdC1lPCD7YjRElhrVMHK9gJDpeRnXaVkxQB+W3HlG4Io5QWWhrtAc3WeQe01
         ti2PDuw1M5z2cNw4E7bpyM+Y/jPwIUAGFVZIOm0ii7qxXnO6KLXLxsHBzHckGjucwPqZ
         4vg1lq3IDmtbGtooAy/f0f5taooh2R+5KQBxfzMuOoo+9L9nXcputOKlzg5A7gW0+N1/
         sd1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=4EIU4Hy+tQ0GDed0xnb5Zti954ckG/5IBPdVDQ/JjaQ=;
        b=fQLAhhY8gIq9LrvVtGc14OYPqcNe++BfdNdRw+Fqo7yZoZMM/qNOSTi0AIdgqaA8MZ
         GZ54LH8r+Ll1CsTxevSlcA9IVdzS7fXn3oAvOlU9IOX76UlKWgJTaFBvbDaRnxogAHJL
         j0kWGZ1UKN2mWWdK0+zLLimKF1Cave4prqypK2JG3MQ3nJa4gieEwBK9+B1nX7VnF7A2
         XGdRBdSnD0bb3URmTLLe7PkNyV8Xlpc3oH+tcc+Dh5Levu8rQvQRV/vrsZ5NYbp1aVOh
         MQ+/F96FEproXiiPVV+o0Zj7VeRx5BSIjK9ZFoSUiCYFdaBsuwflQ1c3Hlp7IAqNMGtO
         Uxzg==
X-Gm-Message-State: ACrzQf14Ie2qKOixuJuNB/7k/Li7CL1u5vMBwX/MK0bKG5vlCzdEFlaO
	WA3Ee+hqFznjZQYg7A7z77LRnCVlrE3qtY4WeRjqWPm8
X-Google-Smtp-Source: AMsMyM5Z7E+saMNuzbVXY+5eMmtutOIUQtlA7+V3R4xxnIcswtWWvj8xds3RciE1H5vbtj5Q0uO2zrJj3gjG7mBQnhA=
X-Received: by 2002:a05:6402:5188:b0:452:5395:a271 with SMTP id
 q8-20020a056402518800b004525395a271mr26230211edd.383.1663781106717; Wed, 21
 Sep 2022 10:25:06 -0700 (PDT)
MIME-Version: 1.0
From: Vipul Suneja <vsuneja63@gmail.com>
Date: Wed, 21 Sep 2022 22:54:55 +0530
Message-ID: <CALAP8f91s0h0gjd_qsmJDz01SKdC8Rmut5KPiG-CKaov740m_Q@mail.gmail.com>
Subject: How to do display sharing between guests or bring up guests display
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>
Content-Type: multipart/alternative; boundary="000000000000d9997205e9333978"

--000000000000d9997205e9333978
Content-Type: text/plain; charset="UTF-8"

Hi,

Thanks!

I am porting xen on raspberry pi 4B. I could build & port
"xen-image-minimal" DOM0 on rpi4 & could port "xen-guest-image-minimal" as
guest1(DOMU1). DOM0 & DOMU1 are working fine as consoles, even the network
is also up.

Now I have built a custom image with GUI & ported it as a guest2(DOMU2),
guest2 came up as a console & couldn't see the GUI screen(Display screen
connected to rpi4 via HDMI) coming up.

Can you please guide me on display sharing or how to bring up guests
display?

Regards
Vipul Kumar

--000000000000d9997205e9333978
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Thanks!</div><div><br></div><div>I =
am porting xen on raspberry pi=C2=A04B. I could build &amp; port &quot;xen-=
image-minimal&quot; DOM0 on rpi4 &amp; could port &quot;xen-guest-image-min=
imal&quot; as guest1(DOMU1). DOM0 &amp; DOMU1 are working fine as consoles,=
 even the network is also up.</div><div><br></div><div>Now I have built a c=
ustom image with GUI &amp; ported it as a guest2(DOMU2), guest2 came up as =
a console &amp; couldn&#39;t see the GUI screen(Display screen connected to=
 rpi4 via HDMI) coming up.=C2=A0</div><div><br></div><div>Can you please gu=
ide me on display sharing or how to bring up guests display?</div><div><br>=
</div><div>Regards</div><div>Vipul Kumar</div></div>

--000000000000d9997205e9333978--

