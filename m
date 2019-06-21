Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E594E7E3
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 14:17:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heIRf-0004z1-4H; Fri, 21 Jun 2019 12:15:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4J1g=UU=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1heIRc-0004yu-W1
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 12:15:05 +0000
X-Inumbo-ID: 30a89c56-941e-11e9-ab49-df89949172df
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 30a89c56-941e-11e9-ab49-df89949172df;
 Fri, 21 Jun 2019 12:15:01 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /RZmClrOsp+mBxCGC7cnabDCAb6PRdW3LPokOMXKQRDKQOe3N7epRWP6ymQd087ZQKwRrCOueY
 4vdDmjM+1oXYjfLUqiQnH12VyRkxYmftI7oea8Jfui1ZWT8HDF7OwAuEne9M7zb1hdeVL/KLou
 WdqFyIYBp4zbGyMLgblA9nlH1ihwgXjVSs1+j4meSlKb5MDjJvhKf9h+NRru85u0fdxPFHWTJ/
 yX82+9UVeF7f2UkUAKQRN8drin8E83AZ9qOZekhs/xoHjXyvaQdecpXD6lcr5OAkyPyidCf4sg
 Q1Y=
X-SBRS: 2.7
X-MesageID: 2045453
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,400,1557201600"; 
   d="scan'208";a="2045453"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Thread-Topic: [PATCH v3 1/2] Revert xen/io/ring.h of "Clean up a few header
 guard symbols"
Thread-Index: AQHVKB+8PXviWMIA4kSc6gZab1Pu36amBXGg
Date: Fri, 21 Jun 2019 12:14:56 +0000
Message-ID: <145f8547b1ae465e8a8d7c37855a3203@AMSPEX02CL03.citrite.net>
References: <20190621105441.3025-1-anthony.perard@citrix.com>
 <20190621105441.3025-2-anthony.perard@citrix.com>
In-Reply-To: <20190621105441.3025-2-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 1/2] Revert xen/io/ring.h of "Clean up a
 few header guard symbols"
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?iso-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFudGhvbnkgUEVSQVJEIDxhbnRo
b255LnBlcmFyZEBjaXRyaXguY29tPgo+IFNlbnQ6IDIxIEp1bmUgMjAxOSAxMTo1NQo+IFRvOiBx
ZW11LWRldmVsQG5vbmdudS5vcmcKPiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPjsgUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IEFu
dGhvbnkKPiBQZXJhcmQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+OyB4ZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmc7IERhbmllbCBQLiBCZXJyYW5nw6kKPiA8YmVycmFuZ2VAcmVkaGF0
LmNvbT47IE1hcmt1cyBBcm1icnVzdGVyIDxhcm1icnVAcmVkaGF0LmNvbT4KPiBTdWJqZWN0OiBb
UEFUQ0ggdjMgMS8yXSBSZXZlcnQgeGVuL2lvL3JpbmcuaCBvZiAiQ2xlYW4gdXAgYSBmZXcgaGVh
ZGVyIGd1YXJkIHN5bWJvbHMiCj4gCj4gVGhpcyByZXZlcnRzIGNoYW5nZXMgdG8gaW5jbHVkZS9o
dy94ZW4vaW8vcmluZy5oIGZyb20gY29tbWl0Cj4gMzc2NzdkN2RiMzlhM2MyNTBhZDY2MWQwMGZi
N2MzYjU5ZDA0N2IxZi4KPiAKPiBGb2xsb3dpbmcgMzc2NzdkN2RiMyAiQ2xlYW4gdXAgYSBmZXcg
aGVhZGVyIGd1YXJkIHN5bWJvbHMiLCBRRU1VIHN0YXJ0Cj4gdG8gZmFpbCB0byBidWlsZDoKPiAK
PiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gfi94ZW4vdG9vbHMvLi4vdG9vbHMvaW5jbHVkZS94ZW4v
aW8vYmxraWYuaDozMTowLAo+ICAgICAgICAgICAgICAgICAgZnJvbSB+L3hlbi90b29scy9xZW11
LXhlbi1kaXIvaHcvYmxvY2sveGVuX2Jsa2lmLmg6NSwKPiAgICAgICAgICAgICAgICAgIGZyb20g
fi94ZW4vdG9vbHMvcWVtdS14ZW4tZGlyL2h3L2Jsb2NrL3hlbi1ibG9jay5jOjIyOgo+IH4veGVu
L3Rvb2xzLy4uL3Rvb2xzL2luY2x1ZGUveGVuL2lvL3JpbmcuaDo2ODowOiBlcnJvcjogIl9fQ09O
U1RfUklOR19TSVpFIiByZWRlZmluZWQgWy1XZXJyb3JdCj4gICNkZWZpbmUgX19DT05TVF9SSU5H
X1NJWkUoX3MsIF9zeikgXAo+IAo+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSB+L3hlbi90b29scy9x
ZW11LXhlbi1kaXIvaHcvYmxvY2sveGVuX2Jsa2lmLmg6NDowLAo+ICAgICAgICAgICAgICAgICAg
ZnJvbSB+L3hlbi90b29scy9xZW11LXhlbi1kaXIvaHcvYmxvY2sveGVuLWJsb2NrLmM6MjI6Cj4g
fi94ZW4vdG9vbHMvcWVtdS14ZW4tZGlyL2luY2x1ZGUvaHcveGVuL2lvL3JpbmcuaDo2NjowOiBu
b3RlOiB0aGlzIGlzIHRoZSBsb2NhdGlvbiBvZiB0aGUgcHJldmlvdXMKPiBkZWZpbml0aW9uCj4g
ICNkZWZpbmUgX19DT05TVF9SSU5HX1NJWkUoX3MsIF9zeikgXAo+IAo+IFRoZSBpc3N1ZSBpcyB0
aGF0IHNvbWUgcHVibGljIHhlbiBoZWFkZXJzIGhhdmUgYmVlbiBpbXBvcnRlZCAoYnkKPiBmNjVl
YWRiNjM5ICJ4ZW46IGltcG9ydCByaW5nLmggZnJvbSB4ZW4iKSBidXQgbm90IGFsbC4gV2l0aCB0
aGUgY2hhbmdlCj4gaW4gdGhlIGd1YXJkcyBzeW1ib2xlLCB0aGUgcmluZy5oIGhlYWRlciBzdGFy
dCB0byBiZSBpbXBvcnRlZCB0d2ljZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFS
RCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQg
PHBhdWwuZHVycmFudEBjaXRyaXguY29tPgoKPiAtLS0KPiBDQzogTWFya3VzIEFybWJydXN0ZXIg
PGFybWJydUByZWRoYXQuY29tPgo+IC0tLQo+IAo+IE5vdGVzOgo+ICAgICB2MzoKPiAgICAgLSBu
ZXcgcGF0Y2gsIHJlcGxhY2UgInhlbjogRml4IGJ1aWxkIHdpdGggcHVibGljIGhlYWRlcnMiIGZy
b20gcHJldmlvdXMKPiAgICAgICBwYXRjaCBzZXJpZXMgdmVyc2lvbgo+ICAgICAtIFJldmVydCBw
cm9ibGVtYXRpYyBjaGFuZ2UgaW5zdGVhZC4KPiAKPiAgaW5jbHVkZS9ody94ZW4vaW8vcmluZy5o
IHwgNiArKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody94ZW4vaW8vcmluZy5oIGIvaW5jbHVk
ZS9ody94ZW4vaW8vcmluZy5oCj4gaW5kZXggNjJhYmZkN2E2ZS4uMWFkYWNmMDlmOSAxMDA2NDQK
PiAtLS0gYS9pbmNsdWRlL2h3L3hlbi9pby9yaW5nLmgKPiArKysgYi9pbmNsdWRlL2h3L3hlbi9p
by9yaW5nLmgKPiBAQCAtMjQsOCArMjQsOCBAQAo+ICAgKiBUaW0gRGVlZ2FuIGFuZCBBbmRyZXcg
V2FyZmllbGQgTm92ZW1iZXIgMjAwNC4KPiAgICovCj4gCj4gLSNpZm5kZWYgWEVOX1BVQkxJQ19J
T19SSU5HX0gKPiAtI2RlZmluZSBYRU5fUFVCTElDX0lPX1JJTkdfSAo+ICsjaWZuZGVmIF9fWEVO
X1BVQkxJQ19JT19SSU5HX0hfXwo+ICsjZGVmaW5lIF9fWEVOX1BVQkxJQ19JT19SSU5HX0hfXwo+
IAo+ICAvKgo+ICAgKiBXaGVuICNpbmNsdWRlJ2luZyB0aGlzIGhlYWRlciwgeW91IG5lZWQgdG8g
cHJvdmlkZSB0aGUgZm9sbG93aW5nCj4gQEAgLTQ2OSw3ICs0NjksNyBAQCBzdHJ1Y3QgbmFtZSMj
X2RhdGFfaW50ZiB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4gIH07ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgREVGSU5FX1hFTl9GTEVYX1JJ
TkcobmFtZSkKPiAKPiAtI2VuZGlmIC8qIFhFTl9QVUJMSUNfSU9fUklOR19IICovCj4gKyNlbmRp
ZiAvKiBfX1hFTl9QVUJMSUNfSU9fUklOR19IX18gKi8KPiAKPiAgLyoKPiAgICogTG9jYWwgdmFy
aWFibGVzOgo+IC0tCj4gQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
