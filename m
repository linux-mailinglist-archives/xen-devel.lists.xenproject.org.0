Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9D71CE516
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 22:09:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYEjj-0006Ge-CX; Mon, 11 May 2020 20:09:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7br7=6Z=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1jYEjh-0006GW-6j
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 20:09:13 +0000
X-Inumbo-ID: 47e6995e-93c3-11ea-9887-bc764e2007e4
Received: from mail-qk1-x729.google.com (unknown [2607:f8b0:4864:20::729])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47e6995e-93c3-11ea-9887-bc764e2007e4;
 Mon, 11 May 2020 20:09:12 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id g185so11211912qke.7
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2020 13:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=F4bkj/28xd+PhlgWdwkIBOf4x6G5mIF4O897eian0TA=;
 b=Crl27/u0PjgeyhfocQ82pnyfEvnEyuKnHfF5Nopjdb5nQ496rDIovgOuTdi6wN6V92
 je4VfqffJCcSvu4Aa5KgbNllMbypGSes4ogkQOs3YJ9+ZWYssMvDVudR9BlGjL/RmhT3
 CCTR5B4EJKoeLgGTtbF6SJV9XWeUO9BlQkUFa7bUoVn+LKcXlogyZACJP9FYafYiRo5h
 TMpThI7YvIL/nXByYjvpWSwUacKMs1iJZHQvoFKFrsvP8Fk7BdPfae84lMOAyEfwyzx+
 Zn6fE6oHhgijys4A1BCExf0Fu22lTokJUQtYALZQ+UliiaKpgIjA70z1W95hIwVCCTu8
 XqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=F4bkj/28xd+PhlgWdwkIBOf4x6G5mIF4O897eian0TA=;
 b=qk+FJvwJLQjX2vDV89oCofYcXnQma7FCi9w69XD/GuKUiAxCigXGkOgAbzkOQp31UR
 bXPsVieCZUVKU17MFZjtJnrRCYtjz35P2AG5bdDiVjU8Qn1zlPWREEQ1EErhruAeslVp
 FOsoj/V7GLSNEndfVlGxjbTczoN2yhixuNrrPak6KwG8jv3gtsxTkcAPWgYC8qJEQzDz
 gLk9wJC/WGWSV56vSu21SReCrlGQElbTc/VoJB+/PauhGollmuju2baoYOP2pPkiIO7y
 gdwVUF0hycPKM6lklGfUmZGTKSI1pWt/lkmm7ysmjRW+hqVdEmHORApsmpynYqNjoh/j
 sdmw==
X-Gm-Message-State: AGi0PuauX500VVsfiqcxxdyaSfp+Id0ro0H2SlT2HpkMf/QUGmCIBHaT
 wYOZgt1WIOa1wxewNo2Yb0c=
X-Google-Smtp-Source: APiQypJb6wJJzXiCuo0y5BjFpzVTj71BhNnQqwhKN1ZuJpd9xQYRbBbAPs0s/Z+OfIJbZMves9lJuA==
X-Received: by 2002:a37:a0d5:: with SMTP id
 j204mr17571901qke.128.1589227751820; 
 Mon, 11 May 2020 13:09:11 -0700 (PDT)
Received: from [100.64.72.249] ([173.245.215.240])
 by smtp.gmail.com with ESMTPSA id p68sm9140371qka.56.2020.05.11.13.07.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2020 13:08:25 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary=Apple-Mail-790DACCD-FD2E-48C3-A81C-734C3B2439C2
Content-Transfer-Encoding: 7bit
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: XenSummit 2020 *will* be held virtuaully in June!
Date: Mon, 11 May 2020 16:07:56 -0400
Message-Id: <FFE251E7-4DFD-414F-8E14-7B814956E7A4@gmail.com>
References: <562E87BB-FAEE-42B3-BEF4-6E7A4D65269D@citrix.com>
In-Reply-To: <562E87BB-FAEE-42B3-BEF4-6E7A4D65269D@citrix.com>
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


--Apple-Mail-790DACCD-FD2E-48C3-A81C-734C3B2439C2
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

On May 7, 2020, at 18:50, George Dunlap <George.Dunlap@citrix.com> wrote:
>=20
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

--Apple-Mail-790DACCD-FD2E-48C3-A81C-734C3B2439C2
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr">On May 7, 2020, at 18:50, G=
eorge Dunlap &lt;George.Dunlap@citrix.com&gt; wrote:</div><div dir=3D"ltr"><=
blockquote type=3D"cite"><br></blockquote></div><blockquote type=3D"cite"><d=
iv dir=3D"ltr">=EF=BB=BF<span>We=E2=80=99re still ironing out all the detail=
s, but it=E2=80=99s absolutely confirmed that XenSummit 2020 will be held vi=
rtually in June.</span><br><span></span><br><span>In addition, the new versi=
on of the Design Sessions website is now live:</span><br><span></span><br><s=
pan>https://design-sessions.xenproject.org</span><br><span></span><br><span>=
Make space on your calendars, and submit your design sessions, and watch thi=
s space for further information!</span></div></blockquote><br><div>Thanks fo=
r the update. &nbsp;Might be worth adding the above note and expected pricin=
g to one of the public status pages and Twitter, while the new schedule is b=
eing worked out:</div><div><br></div><div><a href=3D"https://events.linuxfou=
ndation.org/xen-summit/attend/novel-coronavirus-update/">https://events.linu=
xfoundation.org/xen-summit/attend/novel-coronavirus-update/</a></div><div><a=
 href=3D"https://xenproject.org/2020/03/26/xenproject-developer-and-design-s=
ummit-update-in-light-of-covid-19/">https://xenproject.org/2020/03/26/xenpro=
ject-developer-and-design-summit-update-in-light-of-covid-19/</a></div><div>=
<a href=3D"https://events.linuxfoundation.org/xen-summit/">https://events.li=
nuxfoundation.org/xen-summit/</a></div><div><br></div><div>Rich</div></body>=
</html>=

--Apple-Mail-790DACCD-FD2E-48C3-A81C-734C3B2439C2--

