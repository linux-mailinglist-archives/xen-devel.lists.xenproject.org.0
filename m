Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E5C1203E1
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 12:28:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igoUu-0005K9-ES; Mon, 16 Dec 2019 11:25:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=L813=2G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1igoUt-0005K4-Dy
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 11:25:07 +0000
X-Inumbo-ID: b0cca328-1ff6-11ea-b6f1-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0cca328-1ff6-11ea-b6f1-bc764e2007e4;
 Mon, 16 Dec 2019 11:24:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 70339AD5E;
 Mon, 16 Dec 2019 11:24:57 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <20191213173742.1960441-1-george.dunlap@citrix.com>
 <20191213173742.1960441-3-george.dunlap@citrix.com>
 <78490080-2639-e4d7-eeb0-a004b76dc9c0@suse.com>
 <cb5f9669-7a69-dbe0-da88-93853ddbc1f6@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <543bb1ec-fb2d-8c5c-3347-2f2be9c90bcd@suse.com>
Date: Mon, 16 Dec 2019 12:25:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <cb5f9669-7a69-dbe0-da88-93853ddbc1f6@citrix.com>
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

T24gMTYuMTIuMjAxOSAxMjoxMywgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAxMi8xNi8xOSAx
MToxMCBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDEzLjEyLjIwMTkgMTg6MzcsIEdlb3Jn
ZSBEdW5sYXAgd3JvdGU6Cj4+PiBSZXBsYWNlIGB1bnNpZ25lZCBsb25nYCB3aXRoIGBtZm5fdGAg
YXMgYXBwcm9wcmlhdGUgdGhyb3VnaG91dAo+Pj4gYWxsb2MvZnJlZV9sTl90YWJsZSwgZ2V0L3B1
dF9wYWdlX2Zyb21fbE5lLCBhbmQKPj4+IGdldF9sTl9saW5lYXJfcGFnZXRhYmxlLiAgVGhpcyBv
YnZpYXRlcyB0aGUgbmVlZCBmb3IgYSBsb2FkIG9mCj4+PiBgbWZuX3goKWAgYW5kIGBfbWZuKClg
IGNhc3RzLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5s
YXBAY2l0cml4LmNvbT4KPj4KPj4gQWgsIGhlcmUgd2UgZ28uIFNvcnJ5IGZvciBub3Qgc3BvdHRp
bmcgYmVmb3JlIGdpdmluZyB0aGUgcmVtYXJrCj4+IG9uIHBhdGNoIDEuCj4+Cj4+PiAtLS0gYS94
ZW4vYXJjaC94ODYvbW0uYwo+Pj4gKysrIGIveGVuL2FyY2gveDg2L21tLmMKPj4+IEBAIC02ODEs
MTAgKzY4MSwxMCBAQCBib29sZWFuX3BhcmFtKCJwdi1saW5lYXItcHQiLCBvcHRfcHZfbGluZWFy
X3B0KTsKPj4+ICAjZGVmaW5lIGRlZmluZV9nZXRfbGluZWFyX3BhZ2V0YWJsZShsZXZlbCkgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+Pj4gIHN0YXRpYyBpbnQgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4+PiAgZ2V0XyMjbGV2ZWwjI19saW5lYXJfcGFnZXRhYmxlKCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4+IC0gICAgbGV2ZWwjI19wZ2VudHJ5X3QgcGRl
LCB1bnNpZ25lZCBsb25nIHBkZV9wZm4sIHN0cnVjdCBkb21haW4gKmQpICAgICAgICAgXAo+Pj4g
KyAgICBsZXZlbCMjX3BnZW50cnlfdCBwZGUsIG1mbl90IHBkZV9wZm4sIHN0cnVjdCBkb21haW4g
KmQpICAgICAgICAgICAgICAgICBcCj4+Cj4+IFBlcmhhcHMgYmV0dGVyIHBkZV9tZm4gdGhlbiBo
ZXJlLCAuLi4KPj4KPj4+ICB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+Pj4gICAgICB1bnNpZ25lZCBs
b25nIHgsIHk7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCj4+PiAtICAgIHVuc2lnbmVkIGxvbmcgcGZuOyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4+ICsgICAgbWZuX3QgcGZuOyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAo+Pgo+PiAuLi4gcGZuIGhlcmUsIGFuZCBsaWtld2lzZSBlbHNld2hlcmU/Cj4gCj4gU29ycnks
IEkgZ2V0IHRoYXQgeW91IG1lYW4gcy9wZGVfcGZuL3BkZV9tZm4vZzsgZm9yIHRoZSBhcmd1bWVu
dCB0byB0aGlzCj4gZnVuY3Rpb247IGJ1dCB3aGF0IGRvIHlvdSB3YW50IGRvbmUgd2l0aCB0aGUg
YHBmbmAgbG9jYWwgdmFyaWFibGU/ICBEaWQKPiB5b3UgbWVhbiB0byBzdWdnZXN0IGBtZm5gIGhl
cmUgYXMgd2VsbD8KCk9vcHMsIHllcywgb2YgY291cnNlIEkgZGlkLiBTb3JyeS4KCkphbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
