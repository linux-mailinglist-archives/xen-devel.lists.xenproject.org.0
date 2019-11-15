Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86871FD30B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 03:44:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVRWo-0000jp-Jd; Fri, 15 Nov 2019 02:40:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Un46=ZH=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1iVRWm-0000Uj-6V
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 02:40:04 +0000
X-Inumbo-ID: 3a096c98-0751-11ea-9631-bc764e2007e4
Received: from mail-qk1-x72f.google.com (unknown [2607:f8b0:4864:20::72f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3a096c98-0751-11ea-9631-bc764e2007e4;
 Fri, 15 Nov 2019 02:40:03 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id m4so6925653qke.9
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2019 18:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=U3sczeSojktCVrD7zGFYl0/8wZoWewrbVnHOstR+Dj4=;
 b=kY9pPqYc3vE8YTTouWzULVpimJY1lukaFsOdjdkOg2Czx9FoG3DbUt34b1DrFi8mjx
 NVUbg98NU7ymQqJChOuEKrA8fHwZXqENrIe+bt5upvtqC8JAKVQkyr50qB4hsaOzZl44
 YlWxTIiPXQGVjIed1lg2+42yOw97i2EHpdQQY+45/rdrjCI240rDFLTEil7JHk6fi8bx
 ++lCg172Bbc8bp2SW4SmNgPtT22kNcG3n4Bq3y6b9PROw6RC6Ke1UQlqmIaeImAccOEw
 SX9ivgYsL32PQQ77M9UKYKbDCDUHoiyEPqjDJUZGN1j8iDJpizx/8wT83HJf8Udtf5w0
 RDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=U3sczeSojktCVrD7zGFYl0/8wZoWewrbVnHOstR+Dj4=;
 b=BmZCB4SYQxOkw11ERcZJhlWBVUEIbNGpDX3q5G1BxBYeXmEKQe6NidNrTB0LCo2fDP
 0YHzRy0lr70zQtqcB/YGjKM7QdOD6QkGLQNHgqGDigg+dBA6V6AX2g9i/+IHSXtxmkou
 7/EoV5aOYJl7Cyc0SBbRVz5AUKACtlDWEeRhXRhVfC7klo0c8nMUjXm8poYLPkMRbLIb
 gxXTFBcQRWvx5y+FcKp+hdcUY4s+Ib1yrTuAXhu5LnsWRGNz4Tj9lEz6tZioajKrJaSh
 5QlKVohFzVLCb3APlxXb8CbtTciMf1thvJFukQ3RwH6oJP/JvBmGiWg271I/skCjGi2v
 8sbQ==
X-Gm-Message-State: APjAAAVeuzX+H2tlkFnCQAaU2bPaR9BVRE9u02UCSGV3c2oBXuSXX12k
 kjyeDBSbbzZljLhqTDVaFgdCzOY0duvmTxXEkD6nQa/HVK0Tbw==
X-Google-Smtp-Source: APXvYqwTaQU5Twey5kHXXQs2PCmScX9qxJoioXLMMXBozTQXWk4YWCcT6MOVSXdRMg3maxvB2Bqk9pSV31FlQkzQ+ts=
X-Received: by 2002:ae9:ed89:: with SMTP id
 c131mr10719852qkg.267.1573785602487; 
 Thu, 14 Nov 2019 18:40:02 -0800 (PST)
MIME-Version: 1.0
From: Roman Shaposhnik <roman@zededa.com>
Date: Thu, 14 Nov 2019 18:39:50 -0800
Message-ID: <CAMmSBy_RrrjWdH1-4F97K7AxW8+r9BPVJ0uxfvOqtANhdwbXVg@mail.gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [Xen-devel] [TESTDAY] Test report
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KiBTb2Z0d2FyZTogWGVuIDQuMTMgUkMyCiogSGFyZHdhcmU6IERlbGwgSW9UIEdhdGV3YXkgMzAw
MCBzZXJpZXMKKiBTb2Z0d2FyZTogUHJvamVjdCBFVkUKKiBHdWVzdCBvcGVyYXRpbmcgc3lzdGVt
czogQWxwaW5lIExpbnV4CiogRnVuY3Rpb25hbGl0eSB0ZXN0ZWQ6IGNvbXBpbGluZywgaW5zdGFs
bGluZywgQm9vdGluZyB3aXRoIGRvbTA9cHYKKiBDb21tZW50czogQWxsIHdvcmtzLCBhc2lkZSBm
cm9tIHhsIGNyZWF0ZSBvZnRlbiB0aW1pbmcgb3V0CgpUaGUgdGltZW91dCBoYXBwZW5zIHdoZW4g
ZWl0aGVyIGRvaW5nIHhsIGNyZWF0ZSBvcgp4bCBjcmVhdGluZyBpbiBhIHBhdXNlZCBzdGF0ZSAo
d2l0aCAtcCkgYW5kIGxhdGVyIHJlc3VtaW5nLgpUaGUgZXJyb3IgbWVzc2FnZSBpcyBiZWxvdzoK
ICAgbGlieGw6IGVycm9yOiBsaWJ4bF9kb21fc3VzcGVuZC5jOjYwOTpkbV9yZXN1bWVfZG9uZTog
RG9tYWluCjM6RmFpbGVkIHRvIHJlc3VtZSBkZXZpY2UgbW9kZWw6IHJjPS05CgpXZSd2ZSBhY3R1
YWxseSB0cmFja2VkIHRoaXMgaXNzdWUgZG93biB0byB0aGlzIHBpZWNlIG9mIGNvZGU6CiAgICBo
dHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9YmxvYjtmPXRvb2xzL2xp
YnhsL2xpYnhsX2RvbV9zdXNwZW5kLmM7aD0yNDhkYmMzM2UzODRhZTAwOGU0YWI5Y2U4ZmI1NzNi
ZTA2ZGRkZDcyO2hiPUhFQUQjbDUxNQoKQ3VyaW91c2x5IGVub3VnaCBpdCBzZWVtcyB0byBiZSB0
aGUgb25seSBwbGFjZSAoYXNpZGUgZnJvbQpsaWJ4bF9fd2FpdF9mb3JfZGV2aWNlX21vZGVsX2Rl
cHJlY2F0ZWQpIHRoYXQgdXNlcyB0aGUKdGltZW91dCB2YWx1ZSB0aGF0IGxvdy4gRXZlcnl3aGVy
ZSBlbHNlIGl0IHNlZW1zIHRvIGJlCiAgICBMSUJYTF9ERVZJQ0VfTU9ERUxfU1RBUlRfVElNRU9V
VCAqIDEwMDAKCgouL2xpYnhsL2xpYnhsX2RvbV9zdXNwZW5kLmM6CkxJQlhMX0RFVklDRV9NT0RF
TF9TVEFSVF9USU1FT1VUKTsKLi9saWJ4bC9saWJ4bF9kbS5jOiAgICBzcGF3bi0+dGltZW91dF9t
cyA9CkxJQlhMX0RFVklDRV9NT0RFTF9TVEFSVF9USU1FT1VUICogMTAwMDsKLi9saWJ4bC9saWJ4
bF9kbS5jOiAgICBkbXNzLT5zcGF3bi50aW1lb3V0X21zID0KTElCWExfREVWSUNFX01PREVMX1NU
QVJUX1RJTUVPVVQgKiAxMDAwOwouL2xpYnhsL2xpYnhsX3BjaS5jOiAgICAgICAgICAgICAgICBw
YXMtPnhzd2FpdC50aW1lb3V0X21zID0KTElCWExfREVWSUNFX01PREVMX1NUQVJUX1RJTUVPVVQg
KiAxMDAwOwouL2xpYnhsL2xpYnhsX3BjaS5jOiAgICAgICAgICAgIExJQlhMX0RFVklDRV9NT0RF
TF9TVEFSVF9USU1FT1VUICogMTAwMCk7Ci4vbGlieGwvbGlieGxfcGNpLmM6ICAgICAgICAgICAg
cHJzLT54c3dhaXQudGltZW91dF9tcyA9CkxJQlhMX0RFVklDRV9NT0RFTF9TVEFSVF9USU1FT1VU
ICogMTAwMDsKLi9saWJ4bC9saWJ4bF9kZXZpY2UuYzoKTElCWExfREVWSUNFX01PREVMX1NUQVJU
X1RJTUVPVVQsCi4vbGlieGwvbGlieGxfaW50ZXJuYWwuaDojZGVmaW5lIExJQlhMX0RFVklDRV9N
T0RFTF9TVEFSVF9USU1FT1VUIDYwCi4vbGlieGwvbGlieGVubGlnaHRfdGVzdC5zbzpMSUJYTF9E
RVZJQ0VfTU9ERUxfU1RBUlRfVElNRU9VVCA2MAouL2xpYnhsL2xpYnhlbmxpZ2h0LnNvLjQuMTM6
TElCWExfREVWSUNFX01PREVMX1NUQVJUX1RJTUVPVVQgNjAKLi9saWJ4bC9saWJ4ZW5saWdodC5z
bzpMSUJYTF9ERVZJQ0VfTU9ERUxfU1RBUlRfVElNRU9VVCA2MAouL2xpYnhsL2xpYnhlbmxpZ2h0
LnNvLjQuMTMuMDpMSUJYTF9ERVZJQ0VfTU9ERUxfU1RBUlRfVElNRU9VVCA2MAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
