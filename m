Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB58E80160
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 21:51:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htdY6-0001AP-VT; Fri, 02 Aug 2019 19:49:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Z7k9=V6=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1htdY4-0001AK-Kq
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 19:49:08 +0000
X-Inumbo-ID: 964df279-b55e-11e9-8980-bc764e045a96
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 964df279-b55e-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 19:49:07 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id s15so46030210wmj.3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2019 12:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Vw6BjbjMd1IZgbXXbKqoCaufg2/2VQ2MiAy5qarucag=;
 b=bQHgTP6n9ZxuKgQ4DGen+bln/Ipat6pudM+isRmHOyIi3mWwsIDd9UEsg4RPekaH6W
 5Iwt/b7KumwB1QNZukkmlCYVO8OTkmAbYzGMSYvq3v4h/OM5Moi4vP5VEKR1OStTiy4S
 flLF8dxeRBQowtW1czDZL210p7ha1v9Up1zl3VEmbjSqFHePcY7Lmg9V6EHVU6+pYxzN
 co/RIT5q3vVxrGxGLpEy2FTIyQw4ipKPSdZLY8zdTJQiuyO4RuB8yUR2TicWYffyyZ5y
 P83s3jkOy+r5ZVpExFV49DIxxB2ofbPE3rZlQg7iMrvOpx/H4RIJpvSdnFev477VWR2h
 3W9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Vw6BjbjMd1IZgbXXbKqoCaufg2/2VQ2MiAy5qarucag=;
 b=gfYt9xCaTI46aOdd3fIE+2xhZKPihhPM4tDJUNCLmqS7PQnmtiOcf/mrOb2McCjkia
 iSEY1gK5bwCAc/v6LE90m9XvmZ5zfS50vADba0q84jMhaENJXuE60PP4G0Sj3CG8+7Ux
 d1t9wVnaP8M8z8nh2mZ4yMJGhs2toEF3m4KhrxTrAfjFCrBirGp4/LYdFPgkgz76+zLb
 ApqeiDEv8Jmbd7gxMX8IKUbbH/gHQ3eCpKp04elGSvol5jLGLSr/W4my/BDMeVxpyu44
 B+xeKY3+5iJXrKqhfCy+YYGlGbynLL8HjdeTHsPVRFIJQo9Jv484NtzCKVswMkkGvEAR
 LY7A==
X-Gm-Message-State: APjAAAX49vMKe2ac4Y+Gmt10p/YXplXUbSQFqA9VxGoJ8mpdlcAp0kw8
 05WerJ54wFWZVuNWqPAF4UT2dxeEeSzxyRzS
X-Google-Smtp-Source: APXvYqzqA7Mfg8PY3n0If95sqnCXoo6e5BoYRXZMp3onMV4f6mCfRVGnxsLA27F1gwGe/HGIZHo1xw==
X-Received: by 2002:a1c:1f06:: with SMTP id f6mr5769510wmf.60.1564775345942;
 Fri, 02 Aug 2019 12:49:05 -0700 (PDT)
Received: from [192.168.50.2] (cpe-24-90-150-194.nyc.res.rr.com.
 [24.90.150.194])
 by smtp.gmail.com with ESMTPSA id o6sm162513848wra.27.2019.08.02.12.49.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 02 Aug 2019 12:49:05 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Rich Persaud <persaur@gmail.com>
X-Mailer: iPad Mail (16G77)
In-Reply-To: <82c8247b-8793-e08b-979f-26dac70631a0@suse.com>
Date: Fri, 2 Aug 2019 15:49:02 -0400
Message-Id: <E2F507AC-FB80-405B-9D95-3A20402690A0@gmail.com>
References: <20190725005326.3553-1-christopher.w.clark@gmail.com>
 <6166d236-b3ae-e3d6-3a3c-101063d07701@suse.com>
 <5e1fadcd-e383-3142-e39b-56bae19c87fb@citrix.com>
 <eb67ee53b467f292a3f8986b6fc77d23c3d1727f.camel@suse.com>
 <82c8247b-8793-e08b-979f-26dac70631a0@suse.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH] tests/cpu-policy: fix format-overflow
 warning by null terminating strings
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
Cc: Wei Liu <wl@xen.org>, Oleksandr Andrushchenko <andr2000@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Roman Shaposhnik <roman@zededa.com>,
 IanJackson <ian.jackson@eu.citrix.com>,
 "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
 Jeff.Kubascik@dornerworks.com, Dario Faggioli <dfaggioli@suse.com>,
 Lars Kurth <lars.kurth.xen@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============2191623227258606627=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2191623227258606627==
Content-Type: multipart/alternative;
	boundary=Apple-Mail-B8C0B944-200C-4946-9767-729074751790
Content-Transfer-Encoding: 7bit


--Apple-Mail-B8C0B944-200C-4946-9767-729074751790
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

> On Jul 31, 2019, at 04:11, Jan Beulich <JBeulich@suse.com> wrote:
>=20
>> On 31.07.2019 02:22, Dario Faggioli wrote:
>> Jan's example above, seem to compile **without any warnings** for me as
>> well. If I add a main(), I can even get the code above to print the
>> content of the array.
>>=20
>> And yet, building the tools without a patch like Christoper's one
>> (which was also what I was using locally, and raised to Andy), I get:
>=20
> Sure - I'm aware that we're using a (potentially heavily) patched gcc.
> Hence my question to Christopher whether he's using a plain one.

The Xen test-cpu-policy.c build error and workaround reported by Christopher=
 can be reproduced by building Xen staging against upstream OpenEmbedded/Yoc=
to meta-virtualization master and GCC.  I've tested on Devuan Ascii with "oe=
-build-xen x86-64 staging master":

  http://github.com/dozylynx/oe-build-xen

If there is an upstream GCC compiler issue, Xen will not be the only affecte=
d project.  We can expect new data as other projects start building with rec=
ent GCC versions.  In the meantime, the workaround can unblock Xen builds.

Rich=

--Apple-Mail-B8C0B944-200C-4946-9767-729074751790
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"><span></span></div><div di=
r=3D"ltr"><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"><div dir=3D"ltr"><span></span></div><div dir=3D"ltr"><meta http-equiv=
=3D"content-type" content=3D"text/html; charset=3Dutf-8"><div dir=3D"ltr"></=
div><div dir=3D"ltr">On Jul 31, 2019, at 04:11, Jan Beulich &lt;<a href=3D"m=
ailto:JBeulich@suse.com">JBeulich@suse.com</a>&gt; wrote:</div><div dir=3D"l=
tr"><br></div><blockquote type=3D"cite"><div dir=3D"ltr"><span>On 31.07.2019=
 02:22, Dario Faggioli wrote:</span><br><blockquote type=3D"cite"><span>Jan'=
s example above, seem to compile **without any warnings** for me as</span><b=
r></blockquote><blockquote type=3D"cite"><span>well. If I add a main(), I ca=
n even get the code above to print the</span><br></blockquote><blockquote ty=
pe=3D"cite"><span>content of the array.</span><br></blockquote><blockquote t=
ype=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span>A=
nd yet, building the tools without a patch like Christoper's one</span><br><=
/blockquote><blockquote type=3D"cite"><span>(which was also what I was using=
 locally, and raised to Andy), I get:</span><br></blockquote><span></span><b=
r><span>Sure - I'm aware that we're using a (potentially heavily) patched gc=
c.</span><br><span>Hence my question to Christopher whether he's using a pla=
in one.</span><br></div></blockquote><br><div>The Xen test-cpu-policy.c buil=
d error and workaround reported by Christopher can be reproduced by building=
 Xen staging against upstream OpenEmbedded/Yocto meta-virtualization master a=
nd GCC. &nbsp;I've tested on Devuan Ascii with "oe-build-xen x86-64 staging m=
aster":</div><div><br></div><div>&nbsp;&nbsp;<a href=3D"http://github.com/do=
zylynx/oe-build-xen">http://github.com/dozylynx/oe-build-xen</a></div><div><=
br></div><div>If there is an upstream GCC compiler issue, Xen will not be th=
e only affected project. &nbsp;We can expect new data as other projects star=
t building with recent GCC versions. &nbsp;In the meantime, the workaround c=
an unblock Xen builds.</div><div><br></div><div>Rich</div></div></div></body=
></html>=

--Apple-Mail-B8C0B944-200C-4946-9767-729074751790--


--===============2191623227258606627==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2191623227258606627==--

