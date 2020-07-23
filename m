Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A63322B351
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 18:18:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jydv9-0001nr-GA; Thu, 23 Jul 2020 16:18:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vequ=BC=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1jydv7-0001nm-IA
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 16:18:09 +0000
X-Inumbo-ID: 187ca354-cd00-11ea-8745-bc764e2007e4
Received: from mail-qk1-x735.google.com (unknown [2607:f8b0:4864:20::735])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 187ca354-cd00-11ea-8745-bc764e2007e4;
 Thu, 23 Jul 2020 16:18:08 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id 11so5910259qkn.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2020 09:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:mime-version:subject:from:in-reply-to:cc
 :date:message-id:references:to;
 bh=rh4PNVBS5aRFXO4gV/z7qaN2ZLLGeNIuB2mmYHsU0QY=;
 b=Gfn/FARY/k588k4Nx7/cewSBhPDDTGxip8k+D/QrvQIcuWtkysc2wmHjYlVKzwiTxg
 O4fu+RQfMBYk7CA/0UcFUMxKNmv+/uIms9cJqYHhxRRx3q0GatpwcU6OUdScyf9Ls5cd
 F8rpnzwVCwG9m2vJX2xV0IvlpIwwdUaemMNfm0o00ppn4ZYSU3LDQ3zN53i78URC69v1
 G8QdzzMNjjaXjujV05Kcxwh9XxC0o66L12OwXF1BtKu+1JinZ8ojb/RDmoBJbgdKC+ae
 lixbcECir240yJ6m4uC0IaVJnecpOqFPi/Mo5Y7F5UYEHx0FwZEBQJg0t86/UOL75LlK
 atag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:mime-version:subject
 :from:in-reply-to:cc:date:message-id:references:to;
 bh=rh4PNVBS5aRFXO4gV/z7qaN2ZLLGeNIuB2mmYHsU0QY=;
 b=H9HCwSA78KuxA4VsSjTfBpsZNO6kRR4qn3ad+esHbweCY0S1coN6Pr/90//qbWdAzr
 Vg9Bjmw3fZv34eTe4MrlFpI7q86jvnnNIplQeyJEouBEzvIndglJJCSiv345KoRonTD9
 dy0jDYUORQ+HYLhBGsYzAR/cKJE8lhcn+Ezq5oAj9qa3DoJgkjy9H16CIeDn3grfhHS4
 49AOURo6wIHpZtjbnr1M1Z/JGrmAultKBoEmND5B1FXTtl11sFc/KdDqWEk9Wsqh+QyM
 iAQtbUPwyrU0jIZ/1lks6WVax7MSczBk26GgStUtsSNTAK2g9CveWOAeQE0VrFnvTuAx
 sPDg==
X-Gm-Message-State: AOAM532NI9ARistBydZpJowwChBsmGXJb+lVXZNkVLtmqOubDlCoGwYX
 eM0rBblGtR2xG13q3pfQkFowLowE
X-Google-Smtp-Source: ABdhPJxEifcMrPlIsaZg5MQaVp5aEIGiJ2V/tAH39Pcyt/lIW8StUu/CQL504+yXBxiE+KAzSKw+Gg==
X-Received: by 2002:a37:614:: with SMTP id 20mr5789671qkg.456.1595521087961;
 Thu, 23 Jul 2020 09:18:07 -0700 (PDT)
Received: from ?IPv6:2607:fb90:768:3cd8:f051:f0cd:aac9:1c5d?
 ([2607:fb90:768:3cd8:f051:f0cd:aac9:1c5d])
 by smtp.gmail.com with ESMTPSA id z197sm3102598qkb.66.2020.07.23.09.18.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2020 09:18:07 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary=Apple-Mail-005F301A-5711-4DF3-91AD-8515E7DD9438
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (1.0)
Subject: Re: Saved notes for design sessions
From: Rich Persaud <persaur@gmail.com>
In-Reply-To: <8D97F48E-1948-4C1D-965F-0B42797516DD@citrix.com>
Date: Thu, 23 Jul 2020 12:18:05 -0400
Message-Id: <3C024D1E-3E29-4163-BA5C-958E7E4DC1E5@gmail.com>
References: <8D97F48E-1948-4C1D-965F-0B42797516DD@citrix.com>
To: George Dunlap <george.dunlap@citrix.com>
X-Mailer: iPhone Mail (17G68)
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


--Apple-Mail-005F301A-5711-4DF3-91AD-8515E7DD9438
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

> On Jul 16, 2020, at 07:55, George Dunlap <george.dunlap@citrix.com> wrote:=

> =EF=BB=BFHey all,
>=20
> PDFs of the saved shared notes for the design sessions can be found in thi=
s zipfile:
>=20
> https://cryptpad.fr/file/#/2/file/LoJZpSq+vHKNoisVqdsPj3Z9/
>=20
> The files are labeled with the start/end time and the room in which they w=
ere held; that should help you find out the notes which are pertinent to you=
.
>=20
> Please remember to post a summary of your design session to xen-devel for p=
osterity.
>=20
> Thanks!
>=20
> -George

After 2020 design session notes are published on xen-devel, they can be inde=
xed on a wiki page similar to the 2019 index:=20

  https://wiki.xenproject.org/wiki/Design_Sessions_2019

Rich



--Apple-Mail-005F301A-5711-4DF3-91AD-8515E7DD9438
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"><meta http-equiv=3D"conten=
t-type" content=3D"text/html; charset=3Dutf-8"><div dir=3D"ltr">On Jul 16, 2=
020, at 07:55, George Dunlap &lt;george.dunlap@citrix.com&gt; wrote:</div><d=
iv dir=3D"ltr"><blockquote type=3D"cite"><br></blockquote></div><blockquote t=
ype=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span>Hey all,</span><br><span></span=
><br><span>PDFs of the saved shared notes for the design sessions can be fou=
nd in this zipfile:</span><br><span></span><br><span>https://cryptpad.fr/fil=
e/#/2/file/LoJZpSq+vHKNoisVqdsPj3Z9/</span><br><span></span><br><span>The fi=
les are labeled with the start/end time and the room in which they were held=
; that should help you find out the notes which are pertinent to you.</span>=
<br><span></span><br><span>Please remember to post a summary of your design s=
ession to xen-devel for posterity.</span><br><span></span><br><span>Thanks!<=
/span><br><span></span><br><span> -George</span><br></div></blockquote><br><=
div>After 2020 design session notes are published on xen-devel, they can be i=
ndexed on a wiki page similar to the 2019 index:&nbsp;</div><div><br></div><=
div>&nbsp;&nbsp;<a href=3D"https://wiki.xenproject.org/wiki/Design_Sessions_=
2019">https://wiki.xenproject.org/wiki/Design_Sessions_2019</a></div><div><b=
r></div><div>Rich</div><div><br></div><div><br></div></div></body></html>=

--Apple-Mail-005F301A-5711-4DF3-91AD-8515E7DD9438--

