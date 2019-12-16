Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3909612036E
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 12:13:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igoGS-0003zz-Rs; Mon, 16 Dec 2019 11:10:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=L813=2G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1igoGQ-0003zo-RK
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 11:10:10 +0000
X-Inumbo-ID: 9abf8fc0-1ff4-11ea-b6f1-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9abf8fc0-1ff4-11ea-b6f1-bc764e2007e4;
 Mon, 16 Dec 2019 11:10:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 73ECBACE3;
 Mon, 16 Dec 2019 11:10:01 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <20191213173742.1960441-1-george.dunlap@citrix.com>
 <20191213173742.1960441-3-george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <78490080-2639-e4d7-eeb0-a004b76dc9c0@suse.com>
Date: Mon, 16 Dec 2019 12:10:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191213173742.1960441-3-george.dunlap@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/3] x86/mm: Use mfn_t in type get / put
 call tree
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTIuMjAxOSAxODozNywgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBSZXBsYWNlIGB1bnNp
Z25lZCBsb25nYCB3aXRoIGBtZm5fdGAgYXMgYXBwcm9wcmlhdGUgdGhyb3VnaG91dAo+IGFsbG9j
L2ZyZWVfbE5fdGFibGUsIGdldC9wdXRfcGFnZV9mcm9tX2xOZSwgYW5kCj4gZ2V0X2xOX2xpbmVh
cl9wYWdldGFibGUuICBUaGlzIG9idmlhdGVzIHRoZSBuZWVkIGZvciBhIGxvYWQgb2YKPiBgbWZu
X3goKWAgYW5kIGBfbWZuKClgIGNhc3RzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEdlb3JnZSBEdW5s
YXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KCkFoLCBoZXJlIHdlIGdvLiBTb3JyeSBmb3Ig
bm90IHNwb3R0aW5nIGJlZm9yZSBnaXZpbmcgdGhlIHJlbWFyawpvbiBwYXRjaCAxLgoKPiAtLS0g
YS94ZW4vYXJjaC94ODYvbW0uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS5jCj4gQEAgLTY4MSwx
MCArNjgxLDEwIEBAIGJvb2xlYW5fcGFyYW0oInB2LWxpbmVhci1wdCIsIG9wdF9wdl9saW5lYXJf
cHQpOwo+ICAjZGVmaW5lIGRlZmluZV9nZXRfbGluZWFyX3BhZ2V0YWJsZShsZXZlbCkgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICBzdGF0aWMgaW50ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICBn
ZXRfIyNsZXZlbCMjX2xpbmVhcl9wYWdldGFibGUoICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+IC0gICAgbGV2ZWwjI19wZ2VudHJ5X3QgcGRlLCB1bnNpZ25l
ZCBsb25nIHBkZV9wZm4sIHN0cnVjdCBkb21haW4gKmQpICAgICAgICAgXAo+ICsgICAgbGV2ZWwj
I19wZ2VudHJ5X3QgcGRlLCBtZm5fdCBwZGVfcGZuLCBzdHJ1Y3QgZG9tYWluICpkKSAgICAgICAg
ICAgICAgICAgXAoKUGVyaGFwcyBiZXR0ZXIgcGRlX21mbiB0aGVuIGhlcmUsIC4uLgoKPiAgeyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKPiAgICAgIHVuc2lnbmVkIGxvbmcgeCwgeTsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAtICAgIHVuc2lnbmVk
IGxvbmcgcGZuOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKPiArICAgIG1mbl90IHBmbjsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKCi4uLiBwZm4gaGVyZSwgYW5kIGxpa2V3
aXNlIGVsc2V3aGVyZT8gSWYgeW91IGFncmVlLApBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgp3aXRoIHRoaXMgcmVuYW1pbmcuCgpKYW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
