Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5F16B0C5
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 23:10:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnUgK-0006Tu-0D; Tue, 16 Jul 2019 21:08:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0oM/=VN=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hnUgJ-0006Tp-CR
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 21:08:15 +0000
X-Inumbo-ID: d359d6a9-a80d-11e9-8980-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d359d6a9-a80d-11e9-8980-bc764e045a96;
 Tue, 16 Jul 2019 21:08:14 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1563311294; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=84799Q7elu6R4Fx/BOfZJRfKfLiFXJ+YThFRrAnoH4o=;
 b=sHqTbqm8fesz0twvCRDGwh+zZSCZr5ylBQWbaSqACC44Mlgt4nWhg3ELNnRX1CZY1dDj4a0v
 0uIE2kqdw9mj9lJqpjfaPslwt+cyD90AKrWRGq3Si7Vjw6CrQJUlV+7HJ+AiMw5COgUP54tA
 C28lXQ86NqPkuIwRo9+o9j2D5FE=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mxa.mailgun.org with ESMTP id 5d2e3cbd.7fc583a5aeb0-smtp-out-n03;
 Tue, 16 Jul 2019 21:08:13 -0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id p74so20008778wme.4
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jul 2019 14:08:13 -0700 (PDT)
X-Gm-Message-State: APjAAAUxFY6EShv75MgNr+MHZesUV5SJGKtcp2ZAUh/WJGWN4j2SqFi4
 9z8sY7jKvMRu4yBNQGNxZnCt0vUDFHGtGeD9ums=
X-Google-Smtp-Source: APXvYqxjrB3WA+hRS9XSVYBkEyi4CJnBpfgd+VQOvCVWz274/oi3oezo/RVhL1Jx3BCIsI2K6I6d+rSztvAeyEveJ20=
X-Received: by 2002:a7b:cf0b:: with SMTP id l11mr33958653wmg.143.1563311292256; 
 Tue, 16 Jul 2019 14:08:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
 <96ce48a99eb224291d99c946d19f051b4ab668b6.1563293545.git.ppircalabu@bitdefender.com>
In-Reply-To: <96ce48a99eb224291d99c946d19f051b4ab668b6.1563293545.git.ppircalabu@bitdefender.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 16 Jul 2019 15:07:35 -0600
X-Gmail-Original-Message-ID: <CABfawhn3OYoy_NNmCVU__mbRV+XdzXdzwK0AKje1YgLPv1Pi8g@mail.gmail.com>
Message-ID: <CABfawhn3OYoy_NNmCVU__mbRV+XdzXdzwK0AKje1YgLPv1Pi8g@mail.gmail.com>
To: Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: Re: [Xen-devel] [PATCH v2 09/10] xen-access: Code cleanup
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
Cc: Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMTE6MDYgQU0gUGV0cmUgUGlyY2FsYWJ1CjxwcGlyY2Fs
YWJ1QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4KPiBDbGVhbnVwIHhlbi1hY2Nlc3MgY29kZSBp
biBhY2NvcmRhbmNlIHdpdGggdGhlIFhFTiBzdHlsZSBndWlkZS4KPgo+IFNpZ25lZC1vZmYtYnk6
IFBldHJlIFBpcmNhbGFidSA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+CgpBY2tlZC1ieTog
VGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
