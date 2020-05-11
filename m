Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 600701CE517
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 22:09:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYEk6-0006K4-LR; Mon, 11 May 2020 20:09:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7br7=6Z=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1jYEk5-0006Jn-4H
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 20:09:37 +0000
X-Inumbo-ID: 56609eee-93c3-11ea-9887-bc764e2007e4
Received: from mail-qt1-x82a.google.com (unknown [2607:f8b0:4864:20::82a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 56609eee-93c3-11ea-9887-bc764e2007e4;
 Mon, 11 May 2020 20:09:36 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id x12so9146311qts.9
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2020 13:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:message-id:date
 :cc:to; bh=oz5AXjOGQthPcUXOgDz1OHf+zg0JkhY7kehWPRBVgxY=;
 b=kmFRIHRRfr4Ani0a7IxTXopzQuWHfzuzuea8x/jQrhyeG1n0nx2gzOG2HFrhBXT5mF
 H0hkdN5IAVTgMXSyVsQkDm35mo4lRLyO4FbbJt9BUNLpRNKMLxNREYJtqZoH4LmE5n+N
 oxSLkpiWzZHocp7mceH8Ycx4Ed94LHkADVsgCL3ImvaAD94dua8f9OC1k20zggVFPqc7
 7ahK3ASIArI8cShnxwc5fU/qKcWaa4azZVk6ZP7gza6WHxNCpsb0xFb9ZN6tHjSrNbeW
 1ohcH4J96yHrA2oZYf0cRkTJQ686PfEc7SSlFAyJoY/s0T9O7O/oTvVWDMeJzwmiJxcO
 zR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:message-id:date:cc:to;
 bh=oz5AXjOGQthPcUXOgDz1OHf+zg0JkhY7kehWPRBVgxY=;
 b=W4hMsFhylTwdAh+cCSp0h6HQ8NWvH7+h5aUj4i2gTmPl/VWTa9QCW/G66K/BKpHHN1
 2KBZwHA5v8NEXVsRftIzd5hENmMRtbBF4brdQMxmIevaPS9pU4qu2PqW5QelXHa04KAW
 QVH3qDYwbubbLC6ez6WdMI8QeY3/BrRG/PV3Z2mrOfpxVmv7i9QynIZxSdv7lrjKLD5s
 8u8Km2eNnzCYERdvMH/eg0hk910N/KGxsuHUfNXhwXNITShPIHKw9ZsqHwjcKV/am+lR
 UvHpwcZ5AfpDqOLwl6A6/ED2MhgOHlUgqWwqGbysagtywi6VJmS2k/2bymM6okSD3Ry5
 MEcg==
X-Gm-Message-State: AOAM530fgdhbWJWL0F9hBDlxQL/+7VRTzCCjzqKDuHC7mNPFobzHx/8r
 pYO9R6XS7//HG47mOQBsE9s=
X-Google-Smtp-Source: ABdhPJw3d2dAvzuoTxsyRxbYLjPccq/1z6acL7WAUnaM5GcMrTs+tYzQicFYNvDWTwYpmRpJFq5XaQ==
X-Received: by 2002:ac8:554c:: with SMTP id o12mr2372434qtr.89.1589227776294; 
 Mon, 11 May 2020 13:09:36 -0700 (PDT)
Received: from [100.64.72.249] ([173.245.215.240])
 by smtp.gmail.com with ESMTPSA id n9sm9160921qkn.10.2020.05.11.13.09.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2020 13:09:16 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary=Apple-Mail-99C10892-B47C-4B47-8C56-CA777856C245
Content-Transfer-Encoding: 7bit
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re:  XenSummit 2020 *will* be held virtuaully in June!
Message-Id: <DD52C1F7-DD4B-4718-8EB6-6A18047B8A10@gmail.com>
Date: Mon, 11 May 2020 16:08:29 -0400
To: George Dunlap <George.Dunlap@citrix.com>
X-Mailer: iPad Mail (17E262)
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--Apple-Mail-99C10892-B47C-4B47-8C56-CA777856C245
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

=EF=BB=BF
>=20
> On May 7, 2020, at 18:50, George Dunlap <George.Dunlap@citrix.com> wrote:
> =EF=BB=BFWe=E2=80=99re still ironing out all the details, but it=E2=80=99s=
 absolutely confirmed that XenSummit 2020 will be held virtually in June.
>=20
> In addition, the new version of the Design Sessions website is now live:
>=20
> https://design-sessions.xenproject.org
>=20
> Make space on your calendars, and submit your design sessions, and watch t=
his space for further information!

Thanks for the update.  Might be worth adding the above note and expected pr=
icing to one of the public status pages and Twitter, while the new schedule i=
s being worked out:

https://events.linuxfoundation.org/xen-summit/attend/novel-coronavirus-updat=
e/
https://xenproject.org/2020/03/26/xenproject-developer-and-design-summit-upd=
ate-in-light-of-covid-19/
https://events.linuxfoundation.org/xen-summit/

Rich=

--Apple-Mail-99C10892-B47C-4B47-8C56-CA777856C245
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr">=EF=BB=BF<meta http-equiv=3D=
"content-type" content=3D"text/html; charset=3Dutf-8"><div dir=3D"ltr">On Ma=
y 7, 2020, at 18:50, George Dunlap &lt;George.Dunlap@citrix.com&gt; wrote:</=
div><div dir=3D"ltr"><blockquote type=3D"cite"><br></blockquote></div><block=
quote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span>We=E2=80=99re still iron=
ing out all the details, but it=E2=80=99s absolutely confirmed that XenSummi=
t 2020 will be held virtually in June.</span><br><span></span><br><span>In a=
ddition, the new version of the Design Sessions website is now live:</span><=
br><span></span><br><span>https://design-sessions.xenproject.org</span><br><=
span></span><br><span>Make space on your calendars, and submit your design s=
essions, and watch this space for further information!</span></div></blockqu=
ote><br><div>Thanks for the update. &nbsp;Might be worth adding the above no=
te and expected pricing to one of the public status pages and Twitter, while=
 the new schedule is being worked out:</div><div><br></div><div><a href=3D"h=
ttps://events.linuxfoundation.org/xen-summit/attend/novel-coronavirus-update=
/">https://events.linuxfoundation.org/xen-summit/attend/novel-coronavirus-up=
date/</a></div><div><a href=3D"https://xenproject.org/2020/03/26/xenproject-=
developer-and-design-summit-update-in-light-of-covid-19/">https://xenproject=
.org/2020/03/26/xenproject-developer-and-design-summit-update-in-light-of-co=
vid-19/</a></div><div><a href=3D"https://events.linuxfoundation.org/xen-summ=
it/">https://events.linuxfoundation.org/xen-summit/</a></div><div><br></div>=
<div>Rich</div></div></body></html>=

--Apple-Mail-99C10892-B47C-4B47-8C56-CA777856C245--

