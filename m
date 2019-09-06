Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F829ABD3F
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 18:04:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6Gf8-0002lT-GH; Fri, 06 Sep 2019 16:00:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=P4o3=XB=gmail.com=arndbergmann@srs-us1.protection.inumbo.net>)
 id 1i6Gf7-0002lK-4Z
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 16:00:37 +0000
X-Inumbo-ID: 7630950d-d0bf-11e9-abf7-12813bfff9fa
Received: from mail-qk1-f193.google.com (unknown [209.85.222.193])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7630950d-d0bf-11e9-abf7-12813bfff9fa;
 Fri, 06 Sep 2019 16:00:36 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id 4so6075532qki.6
 for <xen-devel@lists.xenproject.org>; Fri, 06 Sep 2019 09:00:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ES4SaHURAaJC01GAaptDev9SfTdpvqyq6m4yX4fQcB8=;
 b=F8mR/e2aW6pNczdhN7a/vmiA9NHKTgWHbC7epmNcWJiHq7ybT0ToI2xlz2wF6SAOGf
 1Dv53fQNOPH8GXg6+QHfmq66GpN15fgAJvMusm1T2ZqohLnlD6VTVu56t8AIlb4Z+LTO
 i3nj1K8hafl4/S4e9noJF4ixNHu3xfaB3vsegtzY1c1yIyNZKKfpYkMjfGWcRLdFtgcD
 kcqgp0ZTwj9tA4ZKd60B63fvNq3tyoH9+3+A+ZyRWCk+wsdQYeJqMDvVn2LWqeBw+Izo
 m7z2nHV/QsCZn4RFLfRVRbrRSMbgs5+JBIjr7jlmKOzQDqqF1Nl0zoufM2AEr40HZ6GL
 Xg6Q==
X-Gm-Message-State: APjAAAXu72SCcOVfaM7o37yh7QxokzE0tWOy9MZZJSKaYgeWGsuRRQko
 3Zriwdj28lo9e54z+q3AulDeM+vGzOh0Ppbax1E=
X-Google-Smtp-Source: APXvYqz3LSRyVLYYD4QDIyXNudChhzjqkuMLsRlKHB4VakqREofKG/STxaa6LfsgS6WjUsYS6TRljEVwYTs6CmUAbq0=
X-Received: by 2002:a37:4b0d:: with SMTP id y13mr9297353qka.3.1567785635669;
 Fri, 06 Sep 2019 09:00:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190906153948.2160342-1-arnd@arndb.de>
 <7abad95e-ea47-c068-d91c-ba503f2530b9@citrix.com>
In-Reply-To: <7abad95e-ea47-c068-d91c-ba503f2530b9@citrix.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 6 Sep 2019 18:00:19 +0200
Message-ID: <CAK8P3a1qkMLW_Wnn-N0seUw4N5bPwTU7Dy7CwOWxzS6NTnTmiQ@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH] ARM: xen: unexport HYPERVISOR_platform_op
 function
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Emil Velikov <emil.l.velikov@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Denis Efremov <efremov@linux.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBTZXAgNiwgMjAxOSBhdCA1OjU1IFBNIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gT24gMDYvMDkvMjAxOSAxNjozOSwgQXJuZCBCZXJn
bWFubiB3cm90ZToKPiA+IEhZUEVSVklTT1JfcGxhdGZvcm1fb3AoKSBpcyBhbiBpbmxpbmUgZnVu
Y3Rpb24gYW5kIHNob3VsZCBub3QKPiA+IGJlIGV4cG9ydGVkLiBTaW5jZSBjb21taXQgMTViZmMy
MzQ4ZDU0ICgibW9kcG9zdDogY2hlY2sgZm9yCj4gPiBzdGF0aWMgRVhQT1JUX1NZTUJPTCogZnVu
Y3Rpb25zIiksIHRoaXMgY2F1c2VzIGEgd2FybmluZzoKPiA+Cj4gPiBXQVJOSU5HOiAiSFlQRVJW
SVNPUl9wbGF0Zm9ybV9vcCIgW3ZtbGludXhdIGlzIGEgc3RhdGljIEVYUE9SVF9TWU1CT0xfR1BM
Cj4gPgo+ID4gUmVtb3ZlIHRoZSBleHRyYW5lb3VzIGV4cG9ydC4KPiA+Cj4gPiBGaXhlczogMTVi
ZmMyMzQ4ZDU0ICgibW9kcG9zdDogY2hlY2sgZm9yIHN0YXRpYyBFWFBPUlRfU1lNQk9MKiBmdW5j
dGlvbnMiKQo+ID4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4K
Pgo+IFNvbWV0aGluZyBpcyB3b25reS4gIFRoYXQgc3ltYm9sIGlzICgvIHJlYWxseSBvdWdodCB0
byBiZSkgaW4gdGhlCj4gaHlwZXJjYWxsIHBhZ2UgYW5kIG1vc3QgZGVmaW5pdGVseSBub3QgaW5s
aW5lLgo+Cj4gV2hpY2ggdHJlZSBpcyB0aGF0IGNoYW5nZXNldCBmcm9tPyAgSSBjYW4ndCBmaW5k
IHRoZSBTSEEuCgpUaGlzIGlzIGZyb20gbGludXgtbmV4dCwgSSB0aGluayBmcm9tIHRoZSBrYnVp
bGQgdHJlZS4KCiAgICAgICBBcm5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
