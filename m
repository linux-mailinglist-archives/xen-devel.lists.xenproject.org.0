Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA766CEC5
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 15:21:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho6JQ-00088G-FS; Thu, 18 Jul 2019 13:19:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z8IZ=VP=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1ho6JO-00087z-9M
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 13:19:06 +0000
X-Inumbo-ID: 9dd3324a-a95e-11e9-8980-bc764e045a96
Received: from mail-io1-xd42.google.com (unknown [2607:f8b0:4864:20::d42])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9dd3324a-a95e-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 13:19:05 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id j6so19054570ioa.5
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2019 06:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UpO3L7ynkwrLW+/eR3dKKD3s0tcKWxbswTMTOGj6XO8=;
 b=JF9vWhVWl9gc63I130BpOumIi2hess/g8DVBtpyqY97N0sRi/fJ5eqLMwrKIznXRrn
 n1XkXJ+kT8hK1S/KTdSqdYW64U+vfvCQPrSvwbM7olT79bg6T7Kj7tn33pplR1mvPLKA
 HG6gRg4g2FgBEvk0EJtYHSYbnd14x8lnZqqVPykyGCoBkoJJWLdD/LT83kuMHmYuJ+R8
 qGIjLZzIaUjABRLLia4XdoeAoVLvS31dVifUBkkEBUXc/T/RY5MKtfePoPDhWpTIncGC
 krpiqUYe81BurEQcJVJ7L8HRVYfx0rKFLqIclbACc2JfL2wjzyJVfjvjTjVi6SkBokXh
 m2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UpO3L7ynkwrLW+/eR3dKKD3s0tcKWxbswTMTOGj6XO8=;
 b=i7OAy3pb2MblaM3EtSQCAFYkyMQUElRWHS4mU1mhwczB8mp9n3kDhzZAZLurfUJbUl
 +D+pa1hBvcGBfYogffAiD/DtxxiYDK9ZrLzhzrx7iz8d+edyQ7UtXw47iDEaaytaeLPj
 Uieb3nPcZf5NgRP5slqQuJysSZ3l2hOyCTe2KgqYl7C3y1DIHNlWbyc1auhcbb+C+A8A
 nngMPkAvdAR41HOAKFVvdJFwVM9fHvK1Hl6L5hFggnaTG1vs3zohxgnCKiixbDusxVr+
 Fe3eHjx6WRjYgwyUKq8r+pZTksMMqxpY34EYeLjFP4OIn2/xFcajK1meT5LiUrGfwHD1
 5TRg==
X-Gm-Message-State: APjAAAVyIcFOCla+gbGhQgasOrtOLslNWYIBUfg8q1TCB1E5C1UNY3W8
 numAUPQgzTNGiqTl848Fv88omciIbaTIfzrVJKI=
X-Google-Smtp-Source: APXvYqyN+vJM2lrOXKYukG22bTnh2Mlzclw40O/QNx8AowM4H3PCV0l5tIavXMbvfQJi3Im3+rg6mFBU4ft9bWp8a+8=
X-Received: by 2002:a02:b016:: with SMTP id p22mr1957379jah.121.1563455944721; 
 Thu, 18 Jul 2019 06:19:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190618085851.22902-1-viktor.mitin.19@gmail.com>
 <c9fd6e90-e5bc-0665-4c46-9c86ad0511a2@arm.com>
In-Reply-To: <c9fd6e90-e5bc-0665-4c46-9c86ad0511a2@arm.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Thu, 18 Jul 2019 16:18:53 +0300
Message-ID: <CAOcoXZYRAxyR93aqST4gSG12BcsiUop-4L+xNghaH9TaKG2bdw@mail.gmail.com>
To: Julien Grall <julien.grall@arm.com>
Subject: Re: [Xen-devel] [PATCH] xen/arm: remove unused dt_device_node
 parameter
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Viktor Mitin <viktor_mitin@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVsaWVuLAoKSSd2ZSBjaGVja2VkIGxhdGVzdCBYZW4gc3RhZ2luZywgdGhlIHBhdGNoIGhh
cyBub3QgYmVlbiBpbnRlZ3JhdGVkIHlldC4KUGxlYXNlIGludGVncmF0ZSB0aGUgcGF0Y2ggaWYg
bm8gb2JqZWN0aW9ucy4KClRoYW5rcwoKT24gTW9uLCBKdWwgOCwgMjAxOSBhdCAzOjEyIFBNIEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+Cj4gSGkgVmlrdG9yLAo+
Cj4gT24gNi8xOC8xOSA5OjU4IEFNLCBWaWt0b3IgTWl0aW4gd3JvdGU6Cj4gPiBTb21lIG9mIHRo
ZSBmdW5jdGlvbiBnZW5lcmF0aW5nIG5vZGVzIChlLmcgbWFrZV90aW1lcl9ub2RlKQo+ID4gdGFr
ZSBpbiBhIGR0X2RldmljZV9ub2RlIHBhcmFtZXRlciwgYnV0IG5ldmVyIHVzZWQgaXQuCj4gPiBJ
dCBpcyBhY3R1YWxseSBtaXN1c2VkIHdoZW4gY3JlYXRpbmcgRFQgZm9yIERvbVUuCj4gPiBTbyBp
dCBpcyB0aGUgYmVzdCB0byByZW1vdmUgdGhlIHBhcmFtZXRlci4KPiA+Cj4gPiBTdWdnZXN0ZWQt
Ynk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBWaWt0b3IgTWl0aW4gPHZpa3Rvcl9taXRpbkBlcGFtLmNvbT4KPgo+IFJldmlld2VkLWJ5OiBK
dWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+Cj4gQ2hlZXJzLAo+Cj4gLS0KPiBK
dWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
