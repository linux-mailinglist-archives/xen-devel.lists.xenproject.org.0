Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE9D231132
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 20:01:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0Tuy-0007j8-5M; Tue, 28 Jul 2020 18:01:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LJbi=BH=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1k0Tuw-0007j0-Na
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 18:01:34 +0000
X-Inumbo-ID: 5f760002-d0fc-11ea-8baf-bc764e2007e4
Received: from mail-qv1-xf33.google.com (unknown [2607:f8b0:4864:20::f33])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f760002-d0fc-11ea-8baf-bc764e2007e4;
 Tue, 28 Jul 2020 18:01:34 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id m9so9539372qvx.5
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2020 11:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=qKkvr51SWK/oV5l7w0J8nJzLQWGszvMg6NFOQAuY5/s=;
 b=vP2zR02Lvcq118Lgiq+yYIzDPX1NTgapIF6REAgDlJsF8XKlnzxYdLOPuwmYVI0YKe
 c4BZTajC75XUKUJUKCCivQqM+Qa+tYBt/F+ZgGqiOdUYvHQnWuQynG8cf7xmLZtyGtwx
 NXUIzY/huydsRx2zypF7/zwMPE2xEExkA5azqE3G1W/JWFYt0lDWTkvCKEvxzgj3byif
 dO5Qf3+4uJrPB96YvG6rRgVXO4MjJO4fPzfE5IfcsHF5DBuIIV7sLdsnpGQ4nH9zvRYB
 lC+8Lkp2nhrDwJ1GxB3rZwk25L7U8HL+Ze6ZFY86MHp2Kd3deLRmwWdjd4RTx/d2iDWK
 BccQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=qKkvr51SWK/oV5l7w0J8nJzLQWGszvMg6NFOQAuY5/s=;
 b=BuyPChRb2As8cEPS9UHjrP8tQwQShmT+N+zeS3H8xowNLK8iYhgJqVGZvCsLO2ZMbH
 Dmjg5PBWdfTKuK4B6EqpQVvKNIeXqUJZ7PixsI0DEj1YwmrTYoufulpIvU+hLTxCz2Gm
 TTCdKYEAX5JKth9ATVaqe/thEWnN1lTow0qlIWV/qB8wDQJLjiPasYlnDxXm0b/AgXER
 QnLrQTeysYVfXNXK02YE9ajGZ3UU8HXLm1ggIZof+q69tvQ7NelJXnj5CT3o2zroaXoG
 LUb2V3tNWMofCByT1OBhRyxEI+xpHEEEGYZ8blZH1SF9VhAFvngpuZ63k5erUqT8FALO
 mfPg==
X-Gm-Message-State: AOAM533A7V7D1rqA3Qf9YmnJA9Xhypn9UDLMoqGObvribfQjck3VGzxD
 HMjTnn9z9TQ6SxiLAC/5VEQ96ns+NOA=
X-Google-Smtp-Source: ABdhPJx5lhlFNbzcp8o/ph19ZB6mDryP8WY1ZjO2NJWccvsLkC6/kssdiIlgtkKtaiRIJMSumK2vcw==
X-Received: by 2002:ad4:5768:: with SMTP id r8mr29249407qvx.213.1595959293649; 
 Tue, 28 Jul 2020 11:01:33 -0700 (PDT)
Received: from [100.64.72.40] ([173.245.215.240])
 by smtp.gmail.com with ESMTPSA id t93sm18999793qtd.97.2020.07.28.11.01.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2020 11:01:33 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary=Apple-Mail-85897A5B-98E5-4512-98C6-744C7CA7FF3D
Content-Transfer-Encoding: 7bit
From: Rich Persaud <persaur@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: Porting Xen to Jetson Nano
Date: Tue, 28 Jul 2020 14:01:32 -0400
Message-Id: <129D8F3A-91B1-4F27-B9F0-F804B21260EB@gmail.com>
References: <003501d66503$125388e0$36fa9aa0$@yujala.com>
In-Reply-To: <003501d66503$125388e0$36fa9aa0$@yujala.com>
To: Srinivas Bangalore <srini@yujala.com>
X-Mailer: iPad Mail (17G68)
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>,
 Christopher Clark <christopher.w.clark@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--Apple-Mail-85897A5B-98E5-4512-98C6-744C7CA7FF3D
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Jul 28, 2020, at 13:19, Srinivas Bangalore <srini@yujala.com> wrote:
>=20
> =EF=BB=BF
>>=20
>> I struggled to find your comment inline as your e-mail client doesn't=20
>> quote my answer. Please configure your e-mail client to use some form=20
>> of quoting (the usual is '>').
>>=20
>> [<SB>] Done! Sorry about that.
>=20
> Thanks this is a good start. Unfortunately, it doesn't fully help it when y=
ou have a reply split accross multiple line. This is become more proeminent a=
fter a few back and forth. Which e-mail client are you using?
>=20
> [<SB>] I'm using Microsoft Outlook

Might be worth trying these instructions:
https://www.slipstick.com/outlook/email/to-use-internet-style-quoting/

Rich


--Apple-Mail-85897A5B-98E5-4512-98C6-744C7CA7FF3D
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr">On Jul 28, 2020, at 13:19,=
 Srinivas Bangalore &lt;srini@yujala.com&gt; wrote:</div><div dir=3D"ltr"><b=
lockquote type=3D"cite"><br></blockquote></div><blockquote type=3D"cite"><di=
v dir=3D"ltr">=EF=BB=BF<blockquote type=3D"cite"><span>I struggled to find y=
our comment inline as your e-mail client doesn't </span><br></blockquote><bl=
ockquote type=3D"cite"><span>quote my answer. Please configure your e-mail c=
lient to use some form </span><br></blockquote><blockquote type=3D"cite"><sp=
an>of quoting (the usual is '&gt;').</span><br></blockquote><blockquote type=
=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span>[&lt=
;SB&gt;] Done! Sorry about that.</span><br></blockquote><span></span><br><sp=
an>Thanks this is a good start. Unfortunately, it doesn't fully help it when=
 you have a reply split accross multiple line. This is become more proeminen=
t after a few back and forth. Which e-mail client are you using?</span><br><=
span></span><br><span>[&lt;SB&gt;] I'm using Microsoft Outlook</span><br></d=
iv></blockquote><br><div>Might be worth trying these instructions:</div><div=
><a href=3D"https://www.slipstick.com/outlook/email/to-use-internet-style-qu=
oting/">https://www.slipstick.com/outlook/email/to-use-internet-style-quotin=
g/</a></div><div><br></div><div>Rich</div><div><br></div></body></html>=

--Apple-Mail-85897A5B-98E5-4512-98C6-744C7CA7FF3D--

