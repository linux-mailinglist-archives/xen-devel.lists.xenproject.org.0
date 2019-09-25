Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F925BDE21
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 14:35:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD6Rs-0004Sj-JZ; Wed, 25 Sep 2019 12:31:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EZ+8=XU=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1iD6Rr-0004SV-3z
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 12:31:11 +0000
X-Inumbo-ID: 5ae1c804-df90-11e9-97fb-bc764e2007e4
Received: from mail-oi1-x22e.google.com (unknown [2607:f8b0:4864:20::22e])
 by localhost (Halon) with ESMTPS
 id 5ae1c804-df90-11e9-97fb-bc764e2007e4;
 Wed, 25 Sep 2019 12:31:10 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id w144so4719697oia.6
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2019 05:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JD/G3xyu7ck667XKg07CJ2MCor9MMFPsSPUFz2++nd4=;
 b=l8T7gBIF6T6gDbN7Efpwk2MhPX8xBNoQaMs+Kx7yGh7BRbR3/ETxzZlek7HxAshiae
 iKYzCbrQkocw8W4eC7ynIjS1Hvflg8jgJ/kHvZ7tMKtHgOrezit0xpKDKGcRWCIBinkS
 eyfQY2/MZ9l/d2jr7Q9+1H2zlAOy5oKW6SBsvIOQKG6HWJGKci5o3IQIb6Kj57RQlDXu
 ZuMPQdCt/mICE7TPEkli8WVqsQPN3yO9vg+xy4a+qZxP4mXHHmFdnqWwOyhBJYR7ydv5
 BRan9rVlgN0ODIyu+spjx8dLdUDWtw6WzarGVPICzVy1FN3Jqn4JZI5+9L9cagKSEdFl
 x3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JD/G3xyu7ck667XKg07CJ2MCor9MMFPsSPUFz2++nd4=;
 b=Dw1RlC1C18GQFNWHawM3jKgLqN3B3lC312wnQiyDzKC84PnzxuYjRCt6IGKt+yQ0Rw
 OsSN0+A5rd7b8VNZQ3EeL1HPHBMVeg370fBA0ORdcit83SAHMizGOzVYQNaYuPmnI6VX
 BtE8B0mP5zyuqi3Ctj7y6QIEUmf0n6Sd3H2r4COQLVaBsB8E/eNSSruYdbVzpYr8zqt7
 8kELrgH/y2O72XLcV4568WYRF/407S7Oo1OOZlhvVV1n+mXbt979A2BTi9hA3hmT9hRd
 mpu1ToGgdcMEy6eBD5LFEZ1x4v3tFleyF1+uBIBszq8LpfeBHWrXxZfY7OrSNQs8LNf1
 SJig==
X-Gm-Message-State: APjAAAXgVA812YM1W9bm27FZi2j9Ffi74zwlqv+ud0jg7SLFA0caJXgj
 0EliWW7sp1leWbOTvNeTGLbnfJNHZdai9w/NfykwoA==
X-Google-Smtp-Source: APXvYqwBAjRHS/4aO/LZF0ot3ssMAJZDYhPggKfwmwAHh8NIK2B7omgoaBkf0xJo2bYXEpeqC8+iyo/RfszczFx5quk=
X-Received: by 2002:aca:b48a:: with SMTP id d132mr4482949oif.98.1569414670073; 
 Wed, 25 Sep 2019 05:31:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190924113026.255634-1-anthony.perard@citrix.com>
In-Reply-To: <20190924113026.255634-1-anthony.perard@citrix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 25 Sep 2019 13:30:58 +0100
Message-ID: <CAFEAcA8PXEHRV6Wbh2rSEGKACgNw3tT1TnD=y4eF1yYGzx7j5A@mail.gmail.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [Xen-devel] [PULL 0/7] xen queue 2019-09-24
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

T24gVHVlLCAyNCBTZXAgMjAxOSBhdCAxMjozMSwgQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVy
YXJkQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNv
bW1pdCAyZjkzYTNlY2RkM2JiMDYwYmQwNGY2OThjY2FmZTY2ZWZkOTg1NjNhOgo+Cj4gICBNZXJn
ZSByZW1vdGUtdHJhY2tpbmcgYnJhbmNoICdyZW1vdGVzL2RhdmlkaGlsZGVuYnJhbmQvdGFncy9z
MzkweC10Y2ctMjAxOS0wOS0yMycgaW50byBzdGFnaW5nICgyMDE5LTA5LTIzIDE1OjQ0OjUyICsw
MTAwKQo+Cj4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4KPiAgIGh0
dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdC1odHRwL3Blb3BsZS9hcGVyYXJkL3FlbXUtZG0uZ2l0
IHRhZ3MvcHVsbC14ZW4tMjAxOTA5MjQKPgo+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0
byA2YmQ2Yjk1NWMwYjI2NjYyNjM3MDBkMzlkYjE1M2FiNDNjNWUwYzllOgo+Cj4gICB4ZW4tYnVz
OiBvbmx5IHNldCB0aGUgeGVuIGRldmljZSBmcm9udGVuZCBzdGF0ZSBpZiBpdCBpcyBtaXNzaW5n
ICgyMDE5LTA5LTI0IDEyOjIxOjI5ICswMTAwKQo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IFhlbiBxdWV1ZQo+Cj4g
KiBVcGRhdGUgb2YgbWFpbnRhaW5lciBlbWFpbCBhZGRyZXNzCj4gKiBGaXhlcyBmb3IgeGVuLWJ1
cyBhbmQgeGVuLWJsb2NrCj4KCgpBcHBsaWVkLCB0aGFua3MuCgpQbGVhc2UgdXBkYXRlIHRoZSBj
aGFuZ2Vsb2cgYXQgaHR0cHM6Ly93aWtpLnFlbXUub3JnL0NoYW5nZUxvZy80LjIKZm9yIGFueSB1
c2VyLXZpc2libGUgY2hhbmdlcy4KCi0tIFBNTQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
