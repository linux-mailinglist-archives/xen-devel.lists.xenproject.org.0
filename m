Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AED98602E1
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 11:07:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjK8v-00066r-KR; Fri, 05 Jul 2019 09:04:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LVWj=VC=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hjK8u-00066g-Hz
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 09:04:32 +0000
X-Inumbo-ID: e6948861-9f03-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e6948861-9f03-11e9-8980-bc764e045a96;
 Fri, 05 Jul 2019 09:04:31 +0000 (UTC)
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
IronPort-SDR: Tg2EjvaRmbaX6EP2O8MgGpbPPKo78oIyk2QQ4YVjNVMnXWe0kaO5EhEruNzc/FkkoG9Hb/q4k1
 8iVkoUIeyGE1vvzuaJ7BNsXaj9eevohoJ/HPC3QXD+eatNNmc7ykifeGY7DPCFkLIDobRAwcEj
 hcWKMvIoove5lIPHQ13p+1IvzHl4brcrXC15dkFXolTiDXKC0eC11c4J93pr4FDgN7N6ZROTDd
 HiRz7BBQ6XTW1uN6S8x7bfJoRFvRBzpCraDc1XuIfF9PksxGzVu/A9LZsPWPElUhTUx+79ACqG
 F1s=
X-SBRS: 2.7
X-MesageID: 2609293
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,454,1557201600"; 
   d="scan'208";a="2609293"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 0/2] xmalloc patches
Thread-Index: AQHVMxBuvTkUFZtPY0mRiUqt4sRVKaa7ut/Q
Date: Fri, 5 Jul 2019 09:04:27 +0000
Message-ID: <96c815e4b2cd420facb0eaa72325f858@AMSPEX02CL03.citrite.net>
References: <20190705090249.1935-1-paul.durrant@citrix.com>
In-Reply-To: <20190705090249.1935-1-paul.durrant@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 0/2] xmalloc patches
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "Tim \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFBhdWwgRHVycmFudCA8cGF1bC5k
dXJyYW50QGNpdHJpeC5jb20+Cj4gU2VudDogMDUgSnVseSAyMDE5IDEwOjAzCj4gVG86IHhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IENjOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFu
dEBjaXRyaXguY29tPjsgQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47
IEdlb3JnZSBEdW5sYXAKPiA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgSWFuIEphY2tzb24g
PElhbi5KYWNrc29uQGNpdHJpeC5jb20+OyBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
Owo+IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+OyBLb25yYWQgUnplc3p1dGVr
IFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBTdGVmYW5vCj4gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz47IFRpbSAoWGVuLm9yZykgPHRpbUB4ZW4ub3JnPjsgV2VpIExp
dSA8d2xAeGVuLm9yZz4KPiBTdWJqZWN0OiBbUEFUQ0ggdjIgMC8yXSB4bWFsbG9jIHBhdGNoZXMK
PiAKPiBUaGVzZSBhcmUgdGhlIHJlbWFpbmluZyBwYXRjaGVzIHRvIHhtYWxsb2NfdGxzZi5jIHRo
YXQgc3RlbSBmcm9tIGRlYnVnZ2luZwo+IHRoZSBwcm9ibGVtIHRoYXQgbGVkIHRvIGNvbW1pdCA1
NmFkNjI2NSAieDg2L21zaTogZml4IGxvb3AgdGVybWluYXRpb24KPiBjb25kaXRpb24gaW4gcGNp
X21zaV9jb25mX3dyaXRlX2ludGVyY2VwdCgpIi4KPiAKPiBQYXVsIER1cnJhbnQgKDIpOgo+ICAg
eG1hbGxvYzogcmVtb3ZlIHN0cnVjdCB4bWVtX3Bvb2wgaW5pdF9yZWdpb24KPiAgIHhtYWxsb2M6
IGFkZCBhIEtjb25maWcgb3B0aW9uIHRvIHBvaXNvbiBmcmVlIHBvb2wgbWVtb3J5Cj4gCj4gIHhl
bi9LY29uZmlnLmRlYnVnICAgICAgICAgfCAgNyArKysrKysrCj4gIHhlbi9jb21tb24vc3RyaW5n
LmMgICAgICAgfCAyMCArKysrKysrKysrKysrKysrKysKPiAgeGVuL2NvbW1vbi94bWFsbG9jX3Rs
c2YuYyB8IDQ0ICsrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICB4ZW4v
aW5jbHVkZS94ZW4vc3RyaW5nLmggIHwgIDIgKysKPiAgeGVuL2luY2x1ZGUveGVuL3htYWxsb2Mu
aCB8ICAyIC0tCj4gIDUgZmlsZXMgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKSwgMzIgZGVsZXRp
b25zKC0pCj4gLS0tCj4gIHYyOgo+ICAgLSBQYXRjaCAjMSBvZiB2MSBvZiB0aGUgc2VyaWVzIGFs
cmVhZHkgY29tbW1pdHRlZCwgc28gZHJvcHBlZAo+ICAgLSBQYXRjaCAjMiBub3cgcmVtb3ZlcyB0
aGUgaW5pdF9yZWdpb24KCl4gRm9yIGNsYXJpdHkgdGhhdCdzIG9sZCBwYXRjaCAjMiwgbmV3IHBh
dGNoICMxLgoKICBQYXVsCgo+IAo+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgo+IENjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5j
b20+Cj4gQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+IENjOiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVu
LmdyYWxsQGFybS5jb20+Cj4gQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtA
b3JhY2xlLmNvbT4KPiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPgo+IENjOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KPiBDYzogV2VpIExpdSA8d2xAeGVu
Lm9yZz4KPiAtLQo+IDIuMjAuMS4yLmdiMjFlYmI2NzEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
