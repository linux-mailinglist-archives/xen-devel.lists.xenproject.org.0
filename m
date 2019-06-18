Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F8D4A369
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 16:06:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdEhN-00010s-0q; Tue, 18 Jun 2019 14:02:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/6v3=UR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hdEhL-00010n-6U
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 14:02:55 +0000
X-Inumbo-ID: c4515468-91d1-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c4515468-91d1-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 14:02:54 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 18 Jun 2019 08:02:53 -0600
Message-Id: <5D08EF0902000078002394DF@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 18 Jun 2019 08:02:49 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5D024C500200007800237DD8@prv1-mh.provo.novell.com>
 <5D024F500200007800237E31@prv1-mh.provo.novell.com>
 <5f1290fa-6698-2f34-8c18-9b2d8854e64b@citrix.com>
In-Reply-To: <5f1290fa-6698-2f34-8c18-9b2d8854e64b@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 8/9] AMD/IOMMU: enable x2APIC mode when
 available
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
 Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE4LjA2LjE5IGF0IDE1OjQwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTMvMDYvMjAxOSAxNDoyNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEBAIC0xMzQ2
LDcgKzEzOTksNyBAQCBpbnQgX19pbml0IGFtZF9pb21tdV9pbml0KHZvaWQpCj4+ICAgICAgLyog
cGVyIGlvbW11IGluaXRpYWxpemF0aW9uICAqLwo+PiAgICAgIGZvcl9lYWNoX2FtZF9pb21tdSAo
IGlvbW11ICkKPj4gICAgICB7Cj4+IC0gICAgICAgIHJjID0gYW1kX2lvbW11X2luaXRfb25lKGlv
bW11KTsKPj4gKyAgICAgICAgcmMgPSBhbWRfaW9tbXVfaW5pdF9vbmUoaW9tbXUsICF4dCk7Cj4g
Cj4gVGhpcyBsb2dpYyBpcyB2ZXJ5IHN1YnRsZSwgYW5kIGlzIGEgY29uc2VxdWVuY2Ugb2YgdGhl
IGJpZnVyY2F0ZWQgc2V0dXAKPiBBRkFJQ1QuICBJIHRoaW5rIGl0IGRlc2VydmVzIGEgY29tbWVu
dC4KCldpbGwgZG8uCgo+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVf
aW50ci5jCj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbnRyLmMK
Pj4gQEAgLTc5Niw2ICs3OTYsNDAgQEAgdm9pZCogX19pbml0IGFtZF9pb21tdV9hbGxvY19pbnRy
ZW1hcF90YQo+PiAgICAgIHJldHVybiB0YjsKPj4gIH0KPj4gIAo+PiArYm9vbCBfX2luaXQgaW92
X3N1cHBvcnRzX3h0KHZvaWQpCj4+ICt7Cj4+ICsgICAgdW5zaWduZWQgaW50IGFwaWM7Cj4+ICsg
ICAgc3RydWN0IGFtZF9pb21tdSAqaW9tbXU7Cj4+ICsKPj4gKyAgICBpZiAoICFpb21tdV9lbmFi
bGUgfHwgIWlvbW11X2ludHJlbWFwIHx8ICFjcHVfaGFzX2N4MTYgKQo+PiArICAgICAgICByZXR1
cm4gZmFsc2U7Cj4+ICsKPj4gKyAgICBpZiAoIGFtZF9pb21tdV9wcmVwYXJlKCkgKQo+PiArICAg
ICAgICByZXR1cm4gZmFsc2U7Cj4+ICsKPj4gKyAgICBmb3JfZWFjaF9hbWRfaW9tbXUgKCBpb21t
dSApCj4+ICsgICAgICAgIGlmICggIWlvbW11LT5mZWF0dXJlcy5mbGRzLmdhX3N1cCB8fCAhaW9t
bXUtPmZlYXR1cmVzLmZsZHMueHRfc3VwICkKPiAKPiBXaHkgZ2Ffc3VwPyAgSSBkb24ndCBzZWUg
YW55dGhpbmcgaW4gdGhlIG1hbnVhbCB3aGljaCBsaW5rcyB4dF9zdXAgd2l0aAo+IGdhX3N1cCwg
b3RoZXIgdGhhbiB0aGUgY2hyb25vbG9neSBvZiBzcGVjIHVwZGF0ZWQuCgpUaGVyZSBpcyBhbiAo
aW5kaXJlY3QgY29ubmVjdGlvbiksIGFuZCBJIGxlYXJuZWQgdGhpcyB0aGUgaGFyZCB3YXkgLQpJ
IHRvbyB3YXMgYXNzdW1pbmcgdGhhdCBYVEVuIGFsb25lIG91Z2h0IHRvIGJlIHN1ZmZpY2llbnQg
Zm9yIHRoZQpJT01NVSB0byB1c2UgMTI4LWJpdCBJUlRFcy4gQnV0IG5vLCB0YWJsZSAyMiBpbiB0
aGUgMy4wNCBkb2MKbWFrZXMgcXVpdGUgY2xlYXIgdGhhdCBpdCBpcyBHQUVuIGFsb25lIHdoaWNo
IGNvbnRyb2xzIGVudHJ5IHNpemUuCkdBTUVuIHdvdWxkIGFsc28gbmVlZCB0byBiZSBzZXQgdG8g
YWN0dWFsbHkgZG8gd2hhdCBJIHdvdWxkIGhhdmUKdGhvdWdodCBzaG91bGQgYmUgY29udHJvbGxl
ZCBieSBHQUVuIGFsb25lLgoKPiBJbiBwYXJ0aWN1bGFyLCBpdCBpcyBleHBsaWNpdGx5IHN0YXRl
ZCB0byBiZSBvayB0byB1c2UgeHQgd2l0aG91dCBnYSwKPiBhbmQgdGhlIGZvcm1hdCBvZiBpbnRl
cnJ1cHRzIGdlbmVyYXRlZCBieSB0aGUgSU9NTVUgaXMgY29udHJvbGxlZCBieSB0aGUKPiBYVEVu
IGJpdC4KCldoZXJlIGRpZCB5b3UgZmluZCB0aGlzPyBEZXBlbmRpbmcgaG93IGl0J3Mgd29yZGVk
IHRoaXMgbWF5CmRlc2VydmUgY2xhcmlmeWluZy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
