Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8342A065
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 23:30:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hUHiJ-0005Gn-Kk; Fri, 24 May 2019 21:26:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Sh8e=TY=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1hUHiH-0005Gi-6j
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 21:26:53 +0000
X-Inumbo-ID: a5608a9d-7e6a-11e9-8980-bc764e045a96
Received: from mail-vs1-xe2e.google.com (unknown [2607:f8b0:4864:20::e2e])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a5608a9d-7e6a-11e9-8980-bc764e045a96;
 Fri, 24 May 2019 21:26:52 +0000 (UTC)
Received: by mail-vs1-xe2e.google.com with SMTP id d128so6810020vsc.10
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2019 14:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
 :references; bh=JGdc1dyqSNd2cee8KSvz9tIrfR0VCjFjhv0qY8IgRbg=;
 b=stnx4Nh3npAmobQJD2x/VgOKWX7gyXWDJU/CbEAtwnzwAnsOmn99xHGRTm+0PRcXlk
 WNsg6hyy2LQ3KKvDzmZIgJ6nbMypxHlC+fy3oARbByCi1+usMzGEsiYFlub86QkT1/D8
 zM65KjKjeO3RGsaYExsgHhyEEoo1zdK5FTeOir3/3xjZpZgLHulCnFZ0vQtJIy5vpqoQ
 OqQfYj8kPkNOqBvc5faQafdmdWHZiYgl+ls03m1ai3DcvqT6ldsZtZJsy4kRXZkSWSy6
 +PLk5In8GCFX/r6bt7Sk7nYkWt2Yn4M5q8F7iLrNVgB8EzYCzPOKLm65vJmR7V907Vke
 7MPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:message-id:mime-version:subject:date
 :in-reply-to:cc:to:references;
 bh=JGdc1dyqSNd2cee8KSvz9tIrfR0VCjFjhv0qY8IgRbg=;
 b=PRdBrh57GwYa0gIjIvDfDcvwLdPi+hsAyF74v3B4gfRmw7iUCTmDL/k5TwVIoLja1J
 R2l2rarkjDbnm4z9cPWjVNniW9SH01d65bx3Rps++XZJIOG0niPzdgQDTGo1IJMW7gf5
 ettkFKihj/bW8owWjZUFmll9ztMyyt8jUtVyQZeEKbG3DEQlLiIcRoZ3PtqlPWZ75SQF
 FhzpXEr1Oj6WhB/Nsk5sRXx7A5r+DG51H+2+LnJ/pcXsTPY8IICSRjhpY3zQh4e9e641
 KDuY9xKCZy5Zfs9qIRdxWXaGl/K4F9bhtYxOfTK94fsh53zCdG4WhBnTsAtoZvG3Ni9X
 TCLg==
X-Gm-Message-State: APjAAAX1Htp9upNHC1QVa6TPEoeoj5J6X7oqUHu7xt9+EcsrkebhdH/d
 a3YPMJmPyVDkFP/XuQurqJ8=
X-Google-Smtp-Source: APXvYqygfC9nPM/89oNu7wyoT48DleSABUzI6nxXtA91v7lZqZ/huL0woRZyqQGUmmUFEWycSAnleg==
X-Received: by 2002:a67:bc01:: with SMTP id t1mr17900226vsn.102.1558733210993; 
 Fri, 24 May 2019 14:26:50 -0700 (PDT)
Received: from [192.168.0.104] ([190.106.78.158])
 by smtp.gmail.com with ESMTPSA id m199sm2197462vkf.7.2019.05.24.14.26.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 May 2019 14:26:49 -0700 (PDT)
From: Lars Kurth <lars.kurth.xen@gmail.com>
Message-Id: <3E953F72-A7B5-40B6-9974-FD1B99788439@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Date: Fri, 24 May 2019 15:26:47 -0600
In-Reply-To: <E687A54C-0781-4674-A7F9-F62064E9B310@gmail.com>
To: Rich Persaud <persaur@gmail.com>
References: <9FCB2022-A547-4FA2-88E7-91DA3C023438@gmail.com>
 <E687A54C-0781-4674-A7F9-F62064E9B310@gmail.com>
X-Mailer: Apple Mail (2.3445.9.1)
Subject: Re: [Xen-devel] Guest Testing in OSSTEST - What distros and
 versions should we test against
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Committers <committers@xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============3431160473706314494=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============3431160473706314494==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_CC831ED8-8FE2-4789-9250-C7EB1A9EEDC2"


--Apple-Mail=_CC831ED8-8FE2-4789-9250-C7EB1A9EEDC2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 9 May 2019, at 19:43, Rich Persaud <persaur@gmail.com> wrote:
>=20
> On May 9, 2019, at 21:28, Lars Kurth <lars.kurth.xen@gmail.com =
<mailto:lars.kurth.xen@gmail.com>> wrote:
>=20
>> With regards to Windows testing we have some restrictions. We have =
tried several times to buy additional test licenses, but this never went =
anywhere (some of the VM licenses are not available for our environment, =
unless you bulk buy, which is very expensive). The only approach that =
would allow us to test against different windows versions would be to =
require everyone who may touch OSSTEST which is not doable.
>=20
> Are the 90-day test/eval versions of Windows incompatible with =
OSSTEST?
>=20
>   =
https://www.microsoft.com/en-us/evalcenter/evaluate-windows-10-enterprise =
<https://www.microsoft.com/en-us/evalcenter/evaluate-windows-10-enterprise=
>
>   https://www.microsoft.com/en-us/evalcenter/ =
<https://www.microsoft.com/en-us/evalcenter/>
>=20

Actually, that's a possibility. Our use may not be compatible with the =
T&D's of the eval license though. It wasn't when we checked last time. =
But that can be checked.
Lars


--Apple-Mail=_CC831ED8-8FE2-4789-9250-C7EB1A9EEDC2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 9 May 2019, at 19:43, Rich Persaud &lt;<a =
href=3D"mailto:persaur@gmail.com" class=3D"">persaur@gmail.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><meta =
http-equiv=3D"content-type" content=3D"text/html; charset=3Dutf-8" =
class=3D""><div dir=3D"auto" class=3D""><div dir=3D"ltr" class=3D""><span =
class=3D""></span></div><div dir=3D"ltr" class=3D""><div dir=3D"ltr" =
class=3D""></div><div dir=3D"ltr" class=3D"">On May 9, 2019, at 21:28, =
Lars Kurth &lt;<a href=3D"mailto:lars.kurth.xen@gmail.com" =
class=3D"">lars.kurth.xen@gmail.com</a>&gt; wrote:</div><div dir=3D"ltr" =
class=3D""><br class=3D""></div><blockquote type=3D"cite" class=3D""><div =
dir=3D"ltr" class=3D""><span class=3D"">With regards to Windows testing =
we have some restrictions. We have tried several times to buy additional =
test licenses, but this never went anywhere (some of the VM licenses are =
not available for our environment, unless you bulk buy, which is very =
expensive). The only approach that would allow us to test against =
different windows versions would be to require everyone who may touch =
OSSTEST which is not doable.</span><br class=3D""></div></blockquote><br =
class=3D""><div class=3D"">Are the 90-day test/eval versions of Windows =
incompatible with OSSTEST?</div><div class=3D""><br class=3D""></div><div =
class=3D"">&nbsp;&nbsp;<a =
href=3D"https://www.microsoft.com/en-us/evalcenter/evaluate-windows-10-ent=
erprise" =
class=3D"">https://www.microsoft.com/en-us/evalcenter/evaluate-windows-10-=
enterprise</a></div><div class=3D"">&nbsp;&nbsp;<a =
href=3D"https://www.microsoft.com/en-us/evalcenter/" =
class=3D"">https://www.microsoft.com/en-us/evalcenter/</a></div><div =
class=3D""><br class=3D""></div></div></div></div></blockquote><br =
class=3D""></div><div>Actually, that's a possibility. Our use may not be =
compatible with the T&amp;D's of the eval license though. It wasn't when =
we checked last time. But that can be checked.</div><div>Lars</div><br =
class=3D""></body></html>=

--Apple-Mail=_CC831ED8-8FE2-4789-9250-C7EB1A9EEDC2--


--===============3431160473706314494==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3431160473706314494==--

