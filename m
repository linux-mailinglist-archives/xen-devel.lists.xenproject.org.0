Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9674A22B2CD
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 17:42:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jydMr-0005bb-Mp; Thu, 23 Jul 2020 15:42:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9d01=BC=yujala.com=srini@srs-us1.protection.inumbo.net>)
 id 1jydMq-0005bW-GG
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 15:42:44 +0000
X-Inumbo-ID: 25dec45a-ccfb-11ea-a2c5-12813bfff9fa
Received: from gproxy4-pub.mail.unifiedlayer.com (unknown [69.89.23.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 25dec45a-ccfb-11ea-a2c5-12813bfff9fa;
 Thu, 23 Jul 2020 15:42:43 +0000 (UTC)
Received: from cmgw11.unifiedlayer.com (unknown [10.9.0.11])
 by gproxy4.mail.unifiedlayer.com (Postfix) with ESMTP id BF775175C80
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2020 09:42:42 -0600 (MDT)
Received: from md-71.webhostbox.net ([204.11.58.143]) by cmsmtp with ESMTP
 id ydMoj60MUpSV4ydMoja8xk; Thu, 23 Jul 2020 09:42:42 -0600
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=U8K889ju c=1 sm=1 tr=0
 a=yS0qNmEK8ed8yKyeR8R6rg==:117 a=yS0qNmEK8ed8yKyeR8R6rg==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=IkcTkHD0fZMA:10:nop_charset_1
 a=_RQrkK6FrEwA:10:nop_rcvd_month_year
 a=o-A10e_uY_YA:10:endurance_base64_authed_username_1 a=0f1Y9JmXAAAA:8
 a=avzA5_SeES9-e_Xt0w8A:9 a=QEXdDO2ut3YA:10:nop_charset_2
 a=It28mvvgxjsq2WIeNnUB:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=yujala.com; 
 s=default;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:In-Reply-To:References:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=84sN1gvnMp1/xhymVvxBMEiT8VikLruqSb1mykT0lsM=; b=Hd5EDdLWI9DYieAQbzZad9hn/I
 NaVfZwwox1oQuU///vbfZseg/+Y8eteKN3m4Xq4XWZIrmGQZ/I+4IDwmh8XwNnToKEmcBCC7qgsZT
 9+jpSpqmqsjFVz5S/SerYgdV5seLX7QSwfOiPze7BsYQ2hkONTDKF0ZnnAJlOfZ6napvuaMCyJlz3
 AZyUsRvJ2UmSphPb0lvhNXn8hTYgwNHpVfvCp/F6QkbgR2GNPg1qr7WaszlciD13g/5949dDYYg1u
 +lQe7cxHFqga8a7ijIOthJuvO2ei3wfevaUsGD309z0Ys24XFMEW6Oy6c85ez5uszVobsLwprNbax
 NlabTd3A==;
Received: from 162-231-240-210.lightspeed.sntcca.sbcglobal.net
 ([162.231.240.210]:62823 helo=SRINIASUSLAPTOP)
 by md-71.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <srini@yujala.com>)
 id 1jydMn-003IUp-P0; Thu, 23 Jul 2020 15:42:41 +0000
From: "Srinivas Bangalore" <srini@yujala.com>
To: "'Christopher Clark'" <christopher.w.clark@gmail.com>
References: <002801d66051$90fe2300$b2fa6900$@yujala.com>
 <CACMJ4GYQUXNGrqq_6wFLX4actMgTat-i5ThhS21Bjy3HO52bUQ@mail.gmail.com>
In-Reply-To: <CACMJ4GYQUXNGrqq_6wFLX4actMgTat-i5ThhS21Bjy3HO52bUQ@mail.gmail.com>
Subject: RE: Porting Xen to Jetson Nano
Date: Thu, 23 Jul 2020 08:42:39 -0700
Message-ID: <001c01d66107$e60263f0$b2072bd0$@yujala.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIl7jaf5+ZLFToUYJ/P44Ycp83hwAHyJKyOqGafTTA=
Content-Language: en-us
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-71.webhostbox.net
X-AntiAbuse: Original Domain - lists.xenproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - yujala.com
X-BWhitelist: no
X-Source-IP: 162.231.240.210
X-Source-L: No
X-Exim-ID: 1jydMn-003IUp-P0
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 162-231-240-210.lightspeed.sntcca.sbcglobal.net
 (SRINIASUSLAPTOP) [162.231.240.210]:62823
X-Source-Auth: srini@yujala.com
X-Email-Count: 2
X-Source-Cap: c3JpbmlxbGw7c3JpbmlxbGw7bWQtNzEud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
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
Cc: 'xen-devel' <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Christopher,

Thanks for those encouraging words!=20
I did in fact try to apply the Tegra patches to 4.13 but there were =
other issues and Xen wouldn't boot up. I felt that working with 4.8 =
would minimize the unknowns. I am also using the Linux Image from the =
Linux_for_Tegra build.=20

Let me work with your suggestions and see if I can make further =
progress.

Thanks,
Srini


On Wed, Jul 22, 2020 at 10:59 AM Srinivas Bangalore <srini@yujala.com> =
wrote:
> Dear Xen experts,
>
> Would greatly appreciate some hints on how to move forward with this=20
> one=E2=80=A6

Hi Srini,

I don't have any strong recommendations for you, but I do want to say =
that I'm very happy to see you taking this project on and I am hoping =
for your success. I have a newly-arrived Jetson Nano sitting on my desk =
here, purchased with the intention of getting Xen up and running on it, =
that I just haven't got to work on yet. I'm also familiar with Chris =
Patterson, Kyle Temkin and Ian Campbell's previous Tegra Jetson patches =
and it would be great to see some further progress made from those.

In my recent experience with the Raspberry Pi 4, one basic observation =
with ARM kernel bringup is that if your device tree isn't good, your
dom0 kernel can be missing the configuration it needs to use the serial =
port correctly and you don't get any diagnostics from it after Xen =
attempts to launch it, so I would just patch the right serial port =
config directly into your Linux kernel (eg. hardcode specific things =
onto the kernel command line) so you're not messing about with that any =
more.

The other thing I would recommend is patching in some printks into the =
earliest part of the Xen parts of the Dom0 Linux kernel start code.
Others who are more familar with Xen on ARM may have some better =
recommendations, but linux/arch/arm/xen/enlighten.c has a function =
xen_guest_init that looks like a good place to stuff some extra printks =
for some early proof-of-entry from your kernel, and that way you'll have =
some indication whether execution has actually commenced in there.

I don't think you're going to get a great deal of enthusiasm on this =
list for Xen 4.8.5, unfortunately; most people around here work off =
Xen's staging branch, and I'd be surprised to hear of anyone having =
tried a 5.7 Linux kernel with Xen 4.8.5. I can understand why you might =
start there from the existing patch series though.

Best of luck,

Christopher


