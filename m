Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2557524AE07
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 06:47:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8cTK-00064E-1I; Thu, 20 Aug 2020 04:46:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f+yo=B6=gmail.com=jedix81@srs-us1.protection.inumbo.net>)
 id 1k8cSb-00062Z-0A
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 04:45:57 +0000
X-Inumbo-ID: 1a2d7d28-0087-4e8e-9c65-a07be373834b
Received: from mail-yb1-xb31.google.com (unknown [2607:f8b0:4864:20::b31])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a2d7d28-0087-4e8e-9c65-a07be373834b;
 Thu, 20 Aug 2020 04:45:56 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id q16so449944ybk.6
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2020 21:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=rK6he8VFFuAxbhK+nNAfxjYPJ8xUtbIuv2XgJclWE1Y=;
 b=SAi5B3ZgmkVv/Tj7FQHRi6FCbsvcHAuvhSv8MMk7PzQMwXIar0S9o/xzBAcGqA/Uup
 /Jpm84xldwTVheOQZtxICgJM4lvTayYnKG40s7DUQul7OEcTUNkagHZOb3Nhb7JygWpM
 5+3Gw7NjH3dNScEINbAVeA7luqEa3UUbWEeJJzPwjSWQrNe3pSVP331Jc7KtFmx0hMXt
 0KBw3Kjq/F/GyC9CVAXYSe46IwH+l9ZIGDXekgXI3MfyXl7ILqSIPgEq9CQZ8XMqEHs2
 ErCkIfJ+a9ikKkAE6DU+AR5XP1fHceUsiursdPGbL3A4hXZreh7hr0N09FvjTAK3ezwe
 F+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=rK6he8VFFuAxbhK+nNAfxjYPJ8xUtbIuv2XgJclWE1Y=;
 b=GhuRWMQvTTP/pQ+ID2zGksgO1RQCKbMhWg8ioCOvlOwrheaFrRxW708YBj9AUPKxg9
 mAt7UbGKK+Hamn6k739mLe+6Fus36tpJtJ+ITnkxxP8ySSXAXbNQZiuHTNz8JTXlXvme
 ++A7Ojw18lBbb1M2Erd7cwhmdPx1PuqJe3xz932AG7/d88nedHJWQm0FdRiJXOKer2eL
 U6y31WeyEGhXiGIlyv5Hqxi2SUTDZp5lUoKyXju+1yykatCTBoSJSxCP8mH0pwYNuwbY
 YXr9R6GSJz988Y8JrX+E0rja/nawemKCuo2BDzCbN38d+YA/WPD9hVqHb3eLehMQ2+v5
 QrRA==
X-Gm-Message-State: AOAM530mPbuJ/ePtkx7gVExK8CZ8JKaS3u+Dg7dCVGn4JuPyMeeEnprn
 4+mH1xSKtChO2dpxkJl7hL+s60irahdYswg+kQgkXgx8zLI=
X-Google-Smtp-Source: ABdhPJxSDBlEdRPG+IeG880vvrX12F3rsBItJoZ4G6U5xcFlwT1Q4FDh4Is4BKSriKb2MYyi3OrRrPBIEMZaaaOwSfs=
X-Received: by 2002:a25:2415:: with SMTP id k21mr2575347ybk.156.1597898755280; 
 Wed, 19 Aug 2020 21:45:55 -0700 (PDT)
MIME-Version: 1.0
From: Jedi Chen <jedix81@gmail.com>
Date: Thu, 20 Aug 2020 12:45:44 +0800
Message-ID: <CAK-iXTF3F05+RH=ttOhwpOfcngfPY_bAp73fYprxg__QB+fD2w@mail.gmail.com>
Subject: About VIRTIO support on Xen
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000b212b505ad47cb5a"
X-Mailman-Approved-At: Thu, 20 Aug 2020 04:46:40 +0000
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

--000000000000b212b505ad47cb5a
Content-Type: text/plain; charset="UTF-8"

Hi xen-devel,

I am very interesting about the VIRTIO on Xen. And from one meeting report
of AGL Virtualization Expert Group (EG-VIRT)
https://wiki.automotivelinux.org/eg-virt-meetings#pm_cest_meeting4, I got
the information that ARM and Linaro are
upstreaming XEN work incorporating VirtIO. But I can't find any information
in the mailing list. Is there any
architecture overview or design doc about it?

Thanks,

--000000000000b212b505ad47cb5a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr">Hi xen-devel,<div><br></div><div>I am very inter=
esting=C2=A0about the VIRTIO on Xen. And from one meeting report of AGL Vir=
tualization Expert Group (EG-VIRT)=C2=A0</div><div><a href=3D"https://wiki.=
automotivelinux.org/eg-virt-meetings#pm_cest_meeting4">https://wiki.automot=
ivelinux.org/eg-virt-meetings#pm_cest_meeting4</a><span style=3D"color:rgb(=
51,51,51);font-family:Arial,sans-serif;font-size:14px">, I got the informat=
ion that ARM and Linaro are</span></div><div><span style=3D"color:rgb(51,51=
,51);font-family:Arial,sans-serif;font-size:14px">upstreaming XEN work inco=
rporating VirtIO. But I can&#39;t find any information in the mailing list.=
 Is there any</span></div><div><span style=3D"color:rgb(51,51,51);font-fami=
ly:Arial,sans-serif;font-size:14px">architecture overview or design doc abo=
ut it?</span></div><div><span style=3D"color:rgb(51,51,51);font-family:Aria=
l,sans-serif;font-size:14px"><br></span></div><div><span style=3D"color:rgb=
(51,51,51);font-family:Arial,sans-serif;font-size:14px">Thanks,</span></div=
><div><span style=3D"color:rgb(51,51,51);font-family:Arial,sans-serif;font-=
size:14px"><br></span></div><div><span style=3D"color:rgb(51,51,51);font-fa=
mily:Arial,sans-serif;font-size:14px"><br></span></div><div><br></div></div=
></div></div></div></div></div>

--000000000000b212b505ad47cb5a--

