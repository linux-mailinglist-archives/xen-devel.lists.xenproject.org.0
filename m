Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C22885BC22
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 14:50:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhvgp-0002Ly-Tk; Mon, 01 Jul 2019 12:45:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KqvE=U6=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1hhvgo-0002Ls-5r
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 12:45:46 +0000
X-Inumbo-ID: 2462cc42-9bfe-11e9-8980-bc764e045a96
Received: from mail-ot1-x330.google.com (unknown [2607:f8b0:4864:20::330])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2462cc42-9bfe-11e9-8980-bc764e045a96;
 Mon, 01 Jul 2019 12:45:44 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id s20so13325469otp.4
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2019 05:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vNULVTyS8QRU64W9OGAFoDYvPCYVmncs1V+CJp7tdcw=;
 b=Uotv01UFxZwsigr8zAIOacfXoSywqeMPMwKq8Hc1pXfK69TAuLy2slC7JQ68etIlD6
 FygOO45ZHSw6KRAR841Gi7Hcg43n8kCXmWCqXXc7+unB5Tr0xdOPYhncJzkF4Py8+APe
 4TSrzcW76SQWctY3Rzs2mrtwFpswcYHSjlB54xZIYEKhrz2BsYwsD+fMsGyx6MsrgZRP
 kxpYsdFXpRcNGTArSqB/Xiq+5TA9nElXdWPkMK00WeuE2N7mRuybxZ4gDAfP9wTtBg/Q
 HxATjjpFNMBRWFOrwYa4CvDqe3nuS57IOuG4TvpxqAqY/5rn4lMhBc+oHt7GxYrPx6Qs
 jLGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vNULVTyS8QRU64W9OGAFoDYvPCYVmncs1V+CJp7tdcw=;
 b=qnhdFCgFK7rftBTvsySRx426kg6ny1NlfupkS3A1uBj6If0Kj5G6om3ZytgkYF3Axd
 FrAGqmfC9DW882a3JULqZntwxMXXoUgvre6yGmEePfdsXQNiQ7KqnhCkp5uLsetV+yl8
 JAlLZVixdYWeZZOJnnZ8+ckz4PywLvxcgcLisKxJsaYxpAP7v9JWGb9imxQrZdx5oUP0
 46EeT5i5frWmAgf+VmQ4LfXkXzW+foAtcyXiYGg7Mz4nYRZDZDmDk1xzZW1yo3pj1mf5
 iWTxSAdmR0yU62UqOy6nOEZUWYuVP2vHpirmzAzdPcHXe92iCXfRspZPPBoDe4Wdkhvg
 sT2w==
X-Gm-Message-State: APjAAAUS4+dNYX+jblOYlObOwZ4lXU5Phw+/QoEpNURRYP32+CpsFbtE
 ClHljAmXnsj7oJR/9oXRKkaaA5kKfNQuNc3hHszWCJwFD0M=
X-Google-Smtp-Source: APXvYqxDKwEIQMQv8w42wMlw9v1FhRMAGB7u7Fm9vBkmNyr1pF9j9r1YRRLra+Ck2cwd1WO/CGKxfgVbvSiW+0TwFr0=
X-Received: by 2002:a9d:7245:: with SMTP id a5mr20392190otk.232.1561985144341; 
 Mon, 01 Jul 2019 05:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190624153257.20163-1-anthony.perard@citrix.com>
In-Reply-To: <20190624153257.20163-1-anthony.perard@citrix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jul 2019 13:45:33 +0100
Message-ID: <CAFEAcA9xH4DU45bRSbA267a3rvH96RLQ+jrjH9QeemXL-7bosA@mail.gmail.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [Xen-devel] [PULL 0/8] xen queue 2019-06-24
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
Cc: "open list:X86" <xen-devel@lists.xenproject.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyNCBKdW4gMjAxOSBhdCAxNjozMywgQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVy
YXJkQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNv
bW1pdCA0NzRmMzkzOGQ3OWFiMzZiOTIzMWM5YWQzYjVhOTMxNGMyYWVhY2RlOgo+Cj4gICBNZXJn
ZSByZW1vdGUtdHJhY2tpbmcgYnJhbmNoICdyZW1vdGVzL2FtYXJrb3ZpYy90YWdzL21pcHMtcXVl
dWUtanVuLTIxLTIwMTknIGludG8gc3RhZ2luZyAoMjAxOS0wNi0yMSAxNTo0MDo1MCArMDEwMCkK
Pgo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Ogo+Cj4gICBodHRwczov
L3hlbmJpdHMueGVuLm9yZy9naXQtaHR0cC9wZW9wbGUvYXBlcmFyZC9xZW11LWRtLmdpdCB0YWdz
L3B1bGwteGVuLTIwMTkwNjI0Cj4KPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gYTM0
MzRhMmQ1NmFlZTMwMThmNGEwZjU1YzdlMGYwY2RhMTFmM2Q5ZToKPgo+ICAgeGVuOiBJbXBvcnQg
b3RoZXIgeGVuL2lvLyouaCAoMjAxOS0wNi0yNCAxMDo0MjozMCArMDEwMCkKPgo+IC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
PiBYZW4gcXVldWUKPgo+ICogRml4IGJ1aWxkCj4gKiB4ZW4tYmxvY2s6IHN1cHBvcnQgZmVhdHVy
ZS1sYXJnZS1zZWN0b3Itc2l6ZQo+ICogeGVuLWJsb2NrOiBTdXBwb3J0IElPVGhyZWFkIHBvbGxp
bmcgZm9yIFBWIHNoYXJlZCByaW5ncwo+ICogQXZvaWQgdXNhZ2Ugb2YgYSBWTEEKPiAqIENsZWFu
dXAgWGVuIGhlYWRlcnMgdXNhZ2UKPgoKCkFwcGxpZWQsIHRoYW5rcy4KClBsZWFzZSB1cGRhdGUg
dGhlIGNoYW5nZWxvZyBhdCBodHRwczovL3dpa2kucWVtdS5vcmcvQ2hhbmdlTG9nLzQuMQpmb3Ig
YW55IHVzZXItdmlzaWJsZSBjaGFuZ2VzLgoKLS0gUE1NCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
