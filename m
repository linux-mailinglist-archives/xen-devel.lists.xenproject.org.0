Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FCD2CD31
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 19:09:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVfZP-00045s-Km; Tue, 28 May 2019 17:07:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ExCW=T4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hVfZN-00045i-EV
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 17:07:25 +0000
X-Inumbo-ID: 0faa2dd2-816b-11e9-91fc-870511fab041
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 0faa2dd2-816b-11e9-91fc-870511fab041;
 Tue, 28 May 2019 17:07:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5386BA78;
 Tue, 28 May 2019 10:07:23 -0700 (PDT)
Received: from [10.37.8.196] (unknown [10.37.8.196])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A079A3F59C;
 Tue, 28 May 2019 10:07:21 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
References: <1558949370-14331-1-git-send-email-andrii.anisov@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <d63ff1d7-963a-bd1a-7835-ee5b30504628@arm.com>
Date: Tue, 28 May 2019 18:07:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1558949370-14331-1-git-send-email-andrii.anisov@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] gic: drop interrupts enabling on
 interrupts processing
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
Cc: Andre Przywara <andre.przywara@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KCsgQW5kcmUpCgpIaSwKClRpdGxlOiBJbnRlcnJ1cHRzIGFyZSBzdGlsbCB1bm1hc2tlZCB3aGVu
IGV4ZWN1dGluZyBhY3Rpb24gZm9yIGludGVycnVwdCAKcm91dGVkIHRvIFhlbi4gU28geW91IG5l
ZWQgdG8gYmUgbW9yZSBzcGVjaWZpYy4gSG93IGFib3V0CiJ4ZW4vYXJtOiBnaWM6IERlZmVyIHRo
ZSBkZWNpc2lvbiB0byB1bm1hc2sgaW50ZXJydXB0cyB0byBkb197TFBJLCBJUlF9KCkiPwoKT24g
NS8yNy8xOSAxMDoyOSBBTSwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiBGcm9tOiBBbmRyaWkgQW5p
c292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgo+IAo+IFRoaXMgcmVkdWNlcyB0aGUgbnVtYmVy
IG9mIGNvbnRleHQgc3dpdGNoZXMgaW4gY2FzZSB3ZSBoYXZlIGNvbWluZyBndWVzdAo+IGludGVy
cnVwdHMgZnJvbSBkaWZmZXJlbnQgc291cmNlcyBhdCBhIGhpZ2ggcmF0ZS4gV2hhdCBpcyBsaWtl
bHkgZm9yCgpzL1doYXQvVGhpcy8KCj4gbXVsdGltZWRpYSB1c2UtY2FzZXMuCj4gSGF2aW5nIGly
cXMgdW5sb2NrZWQgaGVyZSBtYWtlcyB1cyBnbyB0aHJvdWdoIHRyYXAgcGF0aCBhZ2FpbiBpbiBj
YXNlIHdlCgp3aGF0IGRvIHlvdSBtZWFuIGJ5ICJ1bmxvY2tlZCI/Cgo+IGhhdmUgYSBuZXcgZ3Vl
c3QgaW50ZXJydXB0IGFycml2ZWQgKGV2ZW4gd2l0aCB0aGUgc2FtZSBwcmlvcml0eSwgYWZ0ZXIK
PiBgZGVzYy0+aGFuZGxlci0+ZW5kKGRlc2MpYCBpbiBgZG9fSVJRKClgKSwgd2hhdCBpcyBqdXN0
IGEgcHJvY2Vzc29yCj4gY3ljbGVzIHdhc3RpbmcuCmFmdGVyIGBkZXNjLT4uLi4uYC4gVGhpcyBp
cyBqdXN0IGEgd2FzdGUgYSBwcm9jZXNzb3IgY3ljbGUgYXMgd2Ugd2lsbCAKY2F0Y2ggdGhlbSBh
bGwgaW4gdGhlIGZ1bmN0aW9uIGdpY19pbnRlcnJ1cHQoKSBsb29wLgoKICBXZSB3aWxsIGNhdGNo
IHRoZW0gYWxsIGluIHRoZSBgZ2ljX2ludGVycnVwdCgpIGZ1bmN0aW9uCj4gbG9vcCBhbnl3YXku
IEFuZCB0aGUgZ3Vlc3QgaXJxcyBhcnJpdmFsIHByaW9yaXRpemF0aW9uIGlzIG1lYW5pbmdsZXNz
Cj4gaGVyZSwgaXQgaXMgb25seSBlZmZlY3RpdmUgYXQgZ3Vlc3QncyBsZXZlbC4KCkkgYW0gbm90
IHN1cmUgd2h5IHlvdSBzcGVhayBhYm91dCBndWVzdCBwcmlvcml0aXphdGlvbiBoZXJlLiBUaGUg
bWFpbiAKaXNzdWUgd291bGQgYmUgYW4gaW50ZXJydXB0IHRvIFhlbiAoaS5lIHRpbWVyKSB0aGF0
IHdvdWxkIGdldCBkZWxheWVkIApiZWNhdXNlIG9mIGxvbmdlciBwZXJpb2Qgd2l0aG91dCBpbnRl
cnJ1cHQgZW5hYmxlZC4gSSB3b3VsZCBhbHNvIG5vdCAKcnVsZSBvdXQgdGhlIHBvc3NpYmlsaXR5
IHRvIHByaW9yaXRpemUgZ3Vlc3QgaW50ZXJydXB0IGF0IGhhcmR3YXJlIGxldmVsLgoKSSBrbm93
IHdlIGhhdmUgYmVlbiBkaXNjdXNzaW5nIG9uIHRoZSBwcm9ibGVtIGluIHRoZSBwYXN0LCBidXQg
YSBzdW1tYXJ5IAppbiB0aGUgY29tbWl0IG1lc3NhZ2UgaXMgcXVpdGUgaW1wb3J0YW50IHRvIG5v
dCBtaXNzIG91dCBhbGwgdGhlIHByb2JsZW1zLgoKVGhlIHJlYWwgcHJvYmxlbSBoZXJlIGlzIGZv
ciBpbnRlcnJ1cHQgcm91dGVkIHRvIGd1ZXN0IHRoZSBpbnRlcnJ1cHQgCndpbGwgYmUga2VwdCB1
bm1hc2tlZCB3aGVuIGNhbGxpbmcgZGVzYy0+aGFuZGxlci0+ZW5kKGRlc2MpLiBUaGlzIHdpbGwg
CnJlc3VsdCB0byByZWNlaXZlIHRoZSBuZXh0IGludGVycnVwdCBhcyBzb29uIGFzIGRlc2MtPmhh
bmRsZXItPmVuZChkZXNjKSAKaXMgY2FsbGVkLgoKSW4gdGhlIGNhc2Ugb2YgaW50ZXJydXB0IHJv
dXRlZCB0byBYZW4sIGludGVycnVwdHMgd2lsbCBiZSBrZXB0IGVuYWJsZWQgCndoaWxlIGV4ZWN1
dGluZyB0aGUgYWN0aW9uIGJ1dCB0aGVuIGRpc2FibGVkIGJlZm9yZSBjYWxsaW5nIApkZXNjLT5o
YW5kbGVyLT5lbmQoZGVzYykuCgpJdCB3b3VsZCBiZSBmaW5lIHRvIGtlZXAgdGhlIGludGVycnVw
dHMgbWFza2VkIGZvciBpbnRlcnJ1cHRzIHJvdXRlZCB0byAKdGhlIGd1ZXN0IGJlY2F1c2Ugdmdp
Y19pbmplY3RfaXJxKC4uLikgd2lsbCBiZSBtYXNraW5nIHRoZSBpbnRlcnJ1cHQgaW4gCm1vc3Qg
b2YgdGhlIGNhc2VzLgoKVGhlIGNvZGUgYmVsb3cgbG9va3MgZ29vZCB0byBtZS4gSSBhbSBoYXBw
eSB0byBoZWxwIHJld29yZGluZyB0aGUgY29tbWl0IAptZXNzYWdlIGlmIG5lY2Vzc2FyeS4KCldo
aWxlIGxvb2tpbmcgYXQgdGhlIGNvZGUsIEkgbm90aWNlZCB0aGF0IGluIHRoZSBuZXcgdmdpYyB2
Z2ljX2dldF9pcnEoKSAKbG9va3MgdW5zYWZlIHRvIGJlIGNhbGxlZCB3aXRoIGludGVycnVwdCB1
bm1hc2tlZC4gVGhpcyBpcyBiZWNhdXNlIG9uZSAKb2YgdGhlIGNhbGxlZSAodmdpY19nZXRfbHBp
KCkpIHRha2VzIGEgc3BpbmxvY2sgYW5kIG5vdCBhIHNwaW5sb2NrX2lycS4gCkFuZHJlLCB3aGF0
IGRvIHlvdSB0aGluaz8KCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlp
X2FuaXNvdkBlcGFtLmNvbT4KPiAtLS0KPiAKPiBDaGFuZ2VzOgo+IAo+ICAgICAgaW4gdjI6IERy
b3AgaXJxIGVuYWJsaW5nIGZvciBscGkgcHJvY2Vzc2luZyBhcyB3ZWxsLgo+IAo+IAo+IC0tLQo+
ICAgeGVuL2FyY2gvYXJtL2dpYy5jIHwgNCAtLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2dpYy5jIGIveGVuL2FyY2gv
YXJtL2dpYy5jCj4gaW5kZXggNmNjN2RlYy4uMTEzNjU1YSAxMDA2NDQKPiAtLS0gYS94ZW4vYXJj
aC9hcm0vZ2ljLmMKPiArKysgYi94ZW4vYXJjaC9hcm0vZ2ljLmMKPiBAQCAtMzg2LDE3ICszODYs
MTMgQEAgdm9pZCBnaWNfaW50ZXJydXB0KHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzLCBpbnQg
aXNfZmlxKQo+ICAgCj4gICAgICAgICAgIGlmICggbGlrZWx5KGlycSA+PSAxNiAmJiBpcnEgPCAx
MDIwKSApCj4gICAgICAgICAgIHsKPiAtICAgICAgICAgICAgbG9jYWxfaXJxX2VuYWJsZSgpOwo+
ICAgICAgICAgICAgICAgaXNiKCk7Cj4gICAgICAgICAgICAgICBkb19JUlEocmVncywgaXJxLCBp
c19maXEpOwo+IC0gICAgICAgICAgICBsb2NhbF9pcnFfZGlzYWJsZSgpOwo+ICAgICAgICAgICB9
Cj4gICAgICAgICAgIGVsc2UgaWYgKCBpc19scGkoaXJxKSApCj4gICAgICAgICAgIHsKPiAtICAg
ICAgICAgICAgbG9jYWxfaXJxX2VuYWJsZSgpOwo+ICAgICAgICAgICAgICAgaXNiKCk7Cj4gICAg
ICAgICAgICAgICBnaWNfaHdfb3BzLT5kb19MUEkoaXJxKTsKPiAtICAgICAgICAgICAgbG9jYWxf
aXJxX2Rpc2FibGUoKTsKPiAgICAgICAgICAgfQo+ICAgICAgICAgICBlbHNlIGlmICggdW5saWtl
bHkoaXJxIDwgMTYpICkKPiAgICAgICAgICAgewo+IAoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFs
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
