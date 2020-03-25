Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4E41925D6
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 11:38:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH3Nb-0003Le-U2; Wed, 25 Mar 2020 10:35:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BV3s=5K=gmail.com=charles.fg@srs-us1.protection.inumbo.net>)
 id 1jH3Na-0003L6-Ev
 for xen-devel@lists.xen.org; Wed, 25 Mar 2020 10:35:22 +0000
X-Inumbo-ID: 50cd7fd8-6e84-11ea-b34e-bc764e2007e4
Received: from mail-pg1-x52e.google.com (unknown [2607:f8b0:4864:20::52e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50cd7fd8-6e84-11ea-b34e-bc764e2007e4;
 Wed, 25 Mar 2020 10:35:16 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id x7so960463pgh.5;
 Wed, 25 Mar 2020 03:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=enUiDYfKl4IMjhlAGbn7n8Oqogygg0MPSXfbg51sX04=;
 b=WxU39zNXdcTt/u2HHm7Ktqc4MJerEuHiuIikTZ7+MM6EA1b7g0GGHzONxbReb1bjTF
 XwtwxTwf/1o2rChEeKD0v+mvI0R9WGn3OzI55Rq6u9cLP4+VzRaNDq/kEcFqHRiW9xfK
 66Ta3rw5qJa7y18X4pXM+skuw1LeQU1peZexI5aFIL80RINqFf7cA3gZbIVN4birN2a+
 vmLGE0C4WZmWWypJlLZZEgHDV5LuHoN9jNiX5cyM4QcZq68Lx+5ROL9s0BlqXrKJ54Ia
 CC+DCGhFubr3LqFG8NQYhQQluco+eFq4QJrUEQVhBFL15z7o1kUdQ8xPGNE+Oq3dnWUy
 fv0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=enUiDYfKl4IMjhlAGbn7n8Oqogygg0MPSXfbg51sX04=;
 b=EyGYNg2pgB5aSwdk3hzfzrU72nGTDdtVIB5/JnxSW0nfYzh4gvASm+r01qJDuQ78UN
 oyU6+ZpfucWfoAamy6H8zAf1dX+PKONhIvUqKNFxmRqewXuMZhaDWAFJ5elZEeyVtTMH
 tJsXzRfspV1UfNI/q7xokdzObGzVqD9XwkIuUgni5oQlQxLjK0lrXInzA8vYL1yiLoow
 t3CRIDMupFA7gK6zSmWdNn0RMBOhFU3XtB78umxD/CWEgkOw13AMmGD/Au60NpHXz6H+
 vhr/PXVuYMcQFX4gYJqdUK+0fCXY12ZGXeaJWk05fw15lk6cO7NtEeYBlCA43NjOJNCs
 oYBA==
X-Gm-Message-State: ANhLgQ0WmCgo2ZmQaTch7RVodvZVBuOioJGM+rs99s0nsiE/efny4gip
 Jv2tGgjAemYuIUmBrFTMkSYif3vhbACz2Cmz7W3tnO8x9O+Q6w==
X-Google-Smtp-Source: ADFU+vskNcHbHxXNOsplZ/cU71mEs4wT3P5P+/eS0XGKcfiij5T0j0Ni5TKss+YJ3iBDD0jm4Btpcn59SW/7iA7byYg=
X-Received: by 2002:a63:257:: with SMTP id 84mr2457726pgc.304.1585132515138;
 Wed, 25 Mar 2020 03:35:15 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Charles_Gon=C3=A7alves?= <charles.fg@gmail.com>
Date: Wed, 25 Mar 2020 10:34:38 +0000
Message-ID: <CAAQRGoAmeYpsDuBFf=6=vS=hcgK-EGCd79jq2bPhbEf43MNfgA@mail.gmail.com>
To: xen-devel@lists.xen.org, xen-users@lists.xen.org
Content-Type: multipart/alternative; boundary="0000000000007ca07505a1ab6cfa"
Subject: [Xen-devel] Vulnerability disclosure vs discovery
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

--0000000000007ca07505a1ab6cfa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I'm a Ph.D. candidate in UC (Portugal) working with Xen's vulnerability
discovery process, right now focusing on modeling, and I'd like to
understand the process before the disclosure (by XSA or CVE/NVD).

It would be nice to have a more precise date that traces a vulnerability
(XSA) to its discovery rather than the public release date.

Currently,  I'm parsing any references from NVD/CVE and analyzing the
dates. For older XSA, this works better than from newer ones.

Is there any other place that I could find this information?

Atenciosamente,
*Charles Ferreira Gon=C3=A7alves *

--0000000000007ca07505a1ab6cfa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>Hello, <br><br>I&#39;m a Ph.D. candidate in UC (Portug=
al) working with Xen&#39;s vulnerability discovery process, right now focus=
ing on modeling, and I&#39;d like to understand the process before the disc=
losure (by XSA or CVE/NVD). =C2=A0<br><br>It would be nice to have a more p=
recise date that traces a vulnerability (XSA) to its discovery rather than =
the public release date. <br><br>Currently, =C2=A0I&#39;m parsing any refer=
ences from NVD/CVE and analyzing the dates. For older XSA, this works bette=
r than from newer ones. <br><br>Is there any other place that I could find =
this information?<br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><br></div>=
<div>Atenciosamente,</div><b>Charles Ferreira Gon=C3=A7alves </b><br><font =
color=3D"#666666"><br></font><font color=3D"#666666" size=3D"1"><br></font>=
</div></div></div></div>

--0000000000007ca07505a1ab6cfa--

