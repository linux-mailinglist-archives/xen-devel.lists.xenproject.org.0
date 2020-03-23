Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B79E018F4B4
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 13:35:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGMGY-0003si-Q2; Mon, 23 Mar 2020 12:33:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1UMm=5I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jGMGX-0003sd-2k
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 12:33:13 +0000
X-Inumbo-ID: 7574da58-6d02-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7574da58-6d02-11ea-bec1-bc764e2007e4;
 Mon, 23 Mar 2020 12:33:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1D9FBAEC4;
 Mon, 23 Mar 2020 12:33:11 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200323101724.15655-1-andrew.cooper3@citrix.com>
 <20200323101724.15655-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3a2b459d-2d44-55fc-d72f-3f65afaf02af@suse.com>
Date: Mon, 23 Mar 2020 13:33:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200323101724.15655-2-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/7] x86/ucode: Document the behaviour of
 the microcode_ops hooks
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDMuMjAyMCAxMToxNywgQW5kcmV3IENvb3BlciB3cm90ZToKPiAuLi4gYW5kIHN0cnVj
dCBjcHVfc2lnbmF0dXJlIGZvciBnb29kIG1lYXN1cmUuCj4gCj4gTm8gY29tbWVudCBpcyBwYXNz
ZWQgb24gdGhlIHN1aXRhYmlsaXR5IG9mIHRoZSBiZWhhdmlvdXIuLi4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IC0tLQo+IEND
OiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+Cj4gQ0M6IFdlaSBMaXUgPHdsQHhlbi5v
cmc+Cj4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IC0tLQo+
ICB4ZW4vYXJjaC94ODYvY3B1L21pY3JvY29kZS9wcml2YXRlLmggfCA0NiArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysKPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9taWNyb2NvZGUu
aCAgICAgIHwgIDUgKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDUxIGluc2VydGlvbnMoKykKPiAK
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2NwdS9taWNyb2NvZGUvcHJpdmF0ZS5oIGIveGVu
L2FyY2gveDg2L2NwdS9taWNyb2NvZGUvcHJpdmF0ZS5oCj4gaW5kZXggZTY0MTY4YTUwMi4uYTJh
ZWM1MzA0NyAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvY3B1L21pY3JvY29kZS9wcml2YXRl
LmgKPiArKysgYi94ZW4vYXJjaC94ODYvY3B1L21pY3JvY29kZS9wcml2YXRlLmgKPiBAQCAtMTQs
MTQgKzE0LDYwIEBAIGVudW0gbWljcm9jb2RlX21hdGNoX3Jlc3VsdCB7Cj4gIHN0cnVjdCBtaWNy
b2NvZGVfcGF0Y2g7IC8qIE9wYXF1ZSAqLwo+ICAKPiAgc3RydWN0IG1pY3JvY29kZV9vcHMgewo+
ICsgICAgLyoKPiArICAgICAqIFBhcnNlIGEgbWljcm9jb2RlIGNvbnRhaW5lci4gIEZvcm1hdCBp
cyB2ZW5kb3Itc3BlY2lmaWMuCj4gKyAgICAgKgo+ICsgICAgICogU2VhcmNoIHdpdGhpbiB0aGUg
Y29udGFpbmVyIGZvciB0aGUgcGF0Y2gsIHN1aXRhYmxlIGZvciB0aGUgY3VycmVudAo+ICsgICAg
ICogQ1BVLCB3aGljaCBoYXMgdGhlIGhpZ2hlc3QgcmV2aXNpb24uICAoTm90ZTogTWF5IGJlIGEg
cGF0Y2ggd2hpY2ggaXMKPiArICAgICAqIG9sZGVyIHRoYXQgd2hhdCBpcyBydW5uaW5nIGluIHRo
ZSBDUFUuICBUaGlzIGlzIGEgZmVhdHVyZSwgdG8gYmV0dGVyCj4gKyAgICAgKiBjb3BlIHdpdGgg
Y29ybmVyIGNhc2VzIGZyb20gYnVnZ3kgZmlybXdhcmUuKQo+ICsgICAgICoKPiArICAgICAqIElm
IG9uZSBpcyBmb3VuZCwgYWxsb2NhdGUgYW5kIHJldHVybiBhIHN0cnVjdCBtaWNyb2NvZGVfcGF0
Y2gKPiArICAgICAqIGVuY2Fwc3VsYXRpbmcgdGhlIGFwcHJvcHJpYXRlIG1pY3JvY29kZSBwYXRj
aC4gIERvZXMgbm90IGFsaWFzIHRoZQo+ICsgICAgICogb3JpZ2luYWwgYnVmZmVyLgo+ICsgICAg
ICoKPiArICAgICAqIElmIG9uZSBpcyBub3QgZm91bmQsIChub3RoaW5nIG1hdGNoZXMgdGhlIGN1
cnJlbnQgQ1BVKSwgcmV0dXJuIE5VTEwuCj4gKyAgICAgKiBBbHNvIG1heSByZXR1cm4gRVJSX1BU
UigtZXJyKSwgZS5nLiBiYWQgY29udGFpbmVyLCBvdXQgb2YgbWVtb3J5Lgo+ICsgICAgICovCj4g
ICAgICBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICooKmNwdV9yZXF1ZXN0X21pY3JvY29kZSkoY29u
c3Qgdm9pZCAqYnVmLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHNpemVfdCBzaXplKTsKPiArCj4gKyAgICAvKiBPYnRhaW4gbWljcm9jb2Rl
LXJlbGV2YW50IGRldGFpbHMgZm9yIHRoZSBjdXJyZW50IENQVS4gKi8KPiAgICAgIGludCAoKmNv
bGxlY3RfY3B1X2luZm8pKHN0cnVjdCBjcHVfc2lnbmF0dXJlICpjc2lnKTsKPiArCj4gKyAgICAv
Kgo+ICsgICAgICogQXR0ZW1wdCB0byBsb2FkIHRoZSBwcm92aWRlZCBwYXRjaCBpbnRvIHRoZSBD
UFUuICBSZXR1cm5zIC1FSU8gaWYKPiArICAgICAqIGFueXRoaW5nIGRpZG4ndCBnbyBhcyBleHBl
Y3RlZC4KPiArICAgICAqLwo+ICAgICAgaW50ICgqYXBwbHlfbWljcm9jb2RlKShjb25zdCBzdHJ1
Y3QgbWljcm9jb2RlX3BhdGNoICpwYXRjaCk7CgpXaGlsZSBhdCBwcmVzZW50IC1FSU8gbWF5IGJl
IHRoZSBvbmx5IGVycm9yIHRoYXQgbWF5IGNvbWUgYmFjayBoZXJlLCBkbwp3ZSB3YW50IHRvIHJp
c2sgdGhlIGNvbW1lbnQgZ29pbmcgc3RhbGUgd2hlbiBhbm90aGVyIGVycm9yIHJldHVybiBnZXRz
CmFkZGVkPyBJT1cgLSBwZXJoYXBzIGFkZCAiZS5nLiIgb3Igc29tZSBzdWNoPwoKPiAtLS0gYS94
ZW4vaW5jbHVkZS9hc20teDg2L21pY3JvY29kZS5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4
Ni9taWNyb2NvZGUuaAo+IEBAIC03LDggKzcsMTMgQEAKPiAgI2luY2x1ZGUgPHB1YmxpYy94ZW4u
aD4KPiAgCj4gIHN0cnVjdCBjcHVfc2lnbmF0dXJlIHsKPiArICAgIC8qIENQVSBzaWduYXR1cmUg
KENQVUlELjEuRUFYKS4gIE9ubHkgd3JpdHRlbiBvbiBJbnRlbC4gKi8KPiAgICAgIHVuc2lnbmVk
IGludCBzaWc7Cj4gKwo+ICsgICAgLyogUGxhdGZvcm0gRmxhZ3MgKG9ubHkgYWN0dWFsbHkgMSBi
aXQpLiAgT25seSBhcHBsaWNhYmxlIHRvIEludGVsLiAqLwo+ICAgICAgdW5zaWduZWQgaW50IHBm
OwoKVG8gbWUgIm9ubHkgYWN0dWFsbHkgMSBiaXQiIG1ha2VzIGl0IGFuIGltcGxpY2F0aW9uIHRo
YXQgdGhpcyBpcyB0aGUKbG93ZXN0IGJpdCAobGlrZSBpbiBhIGJvb2wgcmVwcmVzZW50ZWQgaW4g
YSAzMi1iaXQgbWVtb3J5IGxvY2F0aW9uKS4KSSBkaWRuJ3QgdGhpbmsgdGhpcyB3YXMgdGhlIGNh
c2UgdGhvdWdoLCBzbyB1bmxlc3MgSSdtIHdyb25nLCBjb3VsZAp5b3UgY2xhcmlmeSB0aGlzIGEg
bGl0dGxlPwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
