Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE91C1529E8
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 12:30:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izIqE-0003Mq-TU; Wed, 05 Feb 2020 11:27:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=n2Y8=3Z=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1izIqD-0003Mk-Py
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 11:27:33 +0000
X-Inumbo-ID: 8080f2a0-480a-11ea-b211-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8080f2a0-480a-11ea-b211-bc764e2007e4;
 Wed, 05 Feb 2020 11:27:33 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1izIqB-0003Vw-O9; Wed, 05 Feb 2020 11:27:31 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1izIqB-0003qk-Dl; Wed, 05 Feb 2020 11:27:31 +0000
Date: Wed, 5 Feb 2020 11:27:28 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <pdurrant@amazon.com>
Message-ID: <20200205112728.cowk4uobzfu5cfrc@debian>
References: <20200205112412.19414-1-pdurrant@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200205112412.19414-1-pdurrant@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v2] libxl: fix assertion failure in stub
 domain creation
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMDUsIDIwMjAgYXQgMTE6MjQ6MTJBTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IEFuIGFzc2VydGlvbiBpbiBsaWJ4bF9fZG9tYWluX21ha2UoKToKPiAKPiAnc29mdF9y
ZXNldCB8fCAqZG9taWQgPT0gSU5WQUxJRF9ET01JRCcKPiAKPiBkb2VzIG5vdCBob2xkIHRydWUg
Zm9yIHN0dWIgZG9tYWluIGNyZWF0aW9uLCB3aGVyZSBzb2Z0X3Jlc2V0IGlzIGZhbHNlCj4gYnV0
IHRoZSBwYXNzZWQgaW4gZG9taWQgPT0gMC4gVGhpcyBpcyBlYXNpbHkgZml4ZWQgYnkgY2hhbmdp
bmcgdGhlCj4gaW5pdGlhbGl6ZXIgaW4gbGlieGxfX3NwYXduX3N0dWJfZG0oKS4KPiAKPiBOT1RF
OiBUaGUgY29tbWVudCBmb3IgWEVOX0RPTUNUTF9jcmVhdGVkb21haW4gaW4gZG9tY3RsLmggaXMg
Y2hhbmdlZCB0bwo+ICAgICAgIHJlZmxlY3QgcmVhbGl0eS4KPiAKPiBGaXhlczogNzUyNTkyMzlk
ODVkICgibGlieGxfY3JlYXRlOiBtYWtlICdzb2Z0IHJlc2V0JyBleHBsaWNpdCIpCj4gU2lnbmVk
LW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgoKQWNrZWQtYnk6IFdl
aSBMaXUgPHdsQHhlbi5vcmc+CgpJIHdpbGwgd2FpdCB1bnRpbCBlbmQgb2YgdG9kYXkgaW4gY2Fz
ZSBvdGhlcnMgd2FudCB0byBjb21tZW50IG9uIHRoZQpkb21jdGwuaCBjaGFuZ2UuCgpJIHdpbGwg
YWxzbyBjYXJyeSBvdmVyIEFudGhvbnkncyBhY2sgZnJvbSB2MSB3aGlsZSBjb21taXR0aW5nLgoK
V2VpLgoKPiAtLS0KPiBDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+
Cj4gQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gQ2M6IEFudGhvbnkgUEVSQVJEIDxhbnRob255
LnBlcmFyZEBjaXRyaXguY29tPgo+IENjOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4KPiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
PiBDYzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgo+IENjOiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVu
QHhlbi5vcmc+Cj4gQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xl
LmNvbT4KPiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+
IAo+IEFuIGV4YW1wbGUgb2YgdGhlIGFzc2VydGlvbiBmYWlsdXJlIGNhbiBiZSBzZWVuIGF0Ogo+
IAo+IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDY3
MjYvdGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11dC1zdHViZG9tLWRlYmlhbmh2bS1hbWQ2NC14c20v
MTAudHMtZGViaWFuLWh2bS1pbnN0YWxsLmxvZwo+IC0tLQo+ICB0b29scy9saWJ4bC9saWJ4bF9k
bS5jICAgICAgfCAyICstCj4gIHhlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaCB8IDMgKystCj4g
IDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9kbS5jIGIvdG9vbHMvbGlieGwvbGlieGxfZG0u
Ywo+IGluZGV4IGY3NThkYWYzYjYuLjNiMWRhOTAxNjcgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvbGli
eGwvbGlieGxfZG0uYwo+ICsrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKPiBAQCAtMjEyNyw3
ICsyMTI3LDcgQEAgdm9pZCBsaWJ4bF9fc3Bhd25fc3R1Yl9kbShsaWJ4bF9fZWdjICplZ2MsIGxp
YnhsX19zdHViX2RtX3NwYXduX3N0YXRlICpzZHNzKQo+ICAgICAgICAgIGdvdG8gb3V0Owo+ICAg
ICAgfQo+ICAKPiAtICAgIHNkc3MtPnB2cWVtdS5ndWVzdF9kb21pZCA9IDA7Cj4gKyAgICBzZHNz
LT5wdnFlbXUuZ3Vlc3RfZG9taWQgPSBJTlZBTElEX0RPTUlEOwo+ICAKPiAgICAgIGxpYnhsX2Rv
bWFpbl9jcmVhdGVfaW5mb19pbml0KCZkbV9jb25maWctPmNfaW5mbyk7Cj4gICAgICBkbV9jb25m
aWctPmNfaW5mby50eXBlID0gTElCWExfRE9NQUlOX1RZUEVfUFY7Cj4gZGlmZiAtLWdpdCBhL3hl
bi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaAo+
IGluZGV4IDJiYjczOTc5MjMuLmZlYzZmNmZkZDEgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUv
cHVibGljL2RvbWN0bC5oCj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oCj4gQEAg
LTQyLDcgKzQyLDggQEAKPiAgCj4gIC8qCj4gICAqIE5CLiB4ZW5fZG9tY3RsLmRvbWFpbiBpcyBh
biBJTi9PVVQgcGFyYW1ldGVyIGZvciB0aGlzIG9wZXJhdGlvbi4KPiAtICogSWYgaXQgaXMgc3Bl
Y2lmaWVkIGFzIHplcm8sIGFuIGlkIGlzIGF1dG8tYWxsb2NhdGVkIGFuZCByZXR1cm5lZC4KPiAr
ICogSWYgaXQgaXMgc3BlY2lmaWVkIGFzIGFuIGludmFsaWQgdmFsdWUgKDAgb3IgPj0gRE9NSURf
RklSU1RfUkVTRVJWRUQpLAo+ICsgKiBhbiBpZCBpcyBhdXRvLWFsbG9jYXRlZCBhbmQgcmV0dXJu
ZWQuCj4gICAqLwo+ICAvKiBYRU5fRE9NQ1RMX2NyZWF0ZWRvbWFpbiAqLwo+ICBzdHJ1Y3QgeGVu
X2RvbWN0bF9jcmVhdGVkb21haW4gewo+IC0tIAo+IDIuMjAuMQo+IAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
