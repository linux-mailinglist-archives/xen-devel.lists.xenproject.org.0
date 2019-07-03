Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EFE5E968
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 18:41:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiiHW-0007iW-9b; Wed, 03 Jul 2019 16:38:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=roNQ=VA=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hiiHU-0007iR-VJ
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 16:38:52 +0000
X-Inumbo-ID: 0963485c-9db1-11e9-97a7-331da9e3646d
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0963485c-9db1-11e9-97a7-331da9e3646d;
 Wed, 03 Jul 2019 16:38:50 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: pMRAkuJ84fYSyIIjkElmL+P80iaq9G/510ucmBNoBiAjv5aSr79vGZWaQWj1Ksr4wU3ejQrCiu
 QlPhG12kfMEndtQjMIV8BnayUhR63cNN/px9ENdZBONaXiMZdeALiKNc7Xpj5IfqadVV8dfkeW
 xB1lnQ3x72gfwFQjQChuTfIbLmsGj7yoN1ImDmW5a5X4VAJUm4hJITZ7yyzfIAI2YTrGHzYTH7
 D8mEORj67BFbwjGj05HA/5SWQtxhlCmO2Uoq5Q4GxMT9ELGMm8T20RF2x8/xmQEqdKO1AFOxRe
 /90=
X-SBRS: 2.7
X-MesageID: 2581982
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,446,1557201600"; 
   d="scan'208";a="2581982"
Date: Wed, 3 Jul 2019 17:38:47 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: "Zhang, Chen" <chen.zhang@intel.com>
Message-ID: <20190703163847.GN13449@perard.uk.xensource.com>
References: <20190610083336.18235-1-chen.zhang@intel.com>
 <20190702115214.GA22182@perard.uk.xensource.com>
 <9CFF81C0F6B98A43A459C9EDAD400D78061B32DB@shsmsx102.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9CFF81C0F6B98A43A459C9EDAD400D78061B32DB@shsmsx102.ccr.corp.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH] tools/libxl: Add iothread support for COLO
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Zhang Chen <zhangckid@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdWwgMDIsIDIwMTkgYXQgMDI6MDc6MjdQTSArMDAwMCwgWmhhbmcsIENoZW4gd3Jv
dGU6Cj4gPiBPbiBNb24sIEp1biAxMCwgMjAxOSBhdCAwNDozMzozNlBNICswODAwLCBaaGFuZyBD
aGVuIHdyb3RlOgo+ID4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfZG0uYyBiL3Rv
b2xzL2xpYnhsL2xpYnhsX2RtLmMgaW5kZXgKPiA+ID4gZjRmYzk2NDE1ZC4uNmJiNDAwZWZkZiAx
MDA2NDQKPiA+ID4gLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfZG0uYwo+ID4gPiArKysgYi90b29s
cy9saWJ4bC9saWJ4bF9kbS5jCj4gPiA+IEBAIC0xNjI5LDE3ICsxNjI5LDI1IEBAIHN0YXRpYyBp
bnQKPiA+IGxpYnhsX19idWlsZF9kZXZpY2VfbW9kZWxfYXJnc19uZXcobGlieGxfX2djICpnYywK
PiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBuaWNzW2ldLmNvbG9f
ZmlsdGVyX3JlZGlyZWN0b3IxX3F1ZXVlLAo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIG5pY3NbaV0uY29sb19maWx0ZXJfcmVkaXJlY3RvcjFfb3V0ZGV2KSk7Cj4g
PiA+ICAgICAgICAgICAgICAgICAgICAgIH0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgaWYg
KG5pY3NbaV0uY29sb19pb3RocmVhZCkgewo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ZmxleGFycmF5X2FwcGVuZChkbV9hcmdzLCAiLW9iamVjdCIpOwo+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgZmxleGFycmF5X2FwcGVuZChkbV9hcmdzLAo+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgR0NTUFJJTlRGKCJpb3RocmVhZCxpZD0lcyIsCj4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbmljc1tpXS5jb2xvX2lvdGhyZWFkKSk7Cj4g
PiAKPiA+IFRoaXMgY3JlYXRlcyBhbiBpb3RocmVhZCBvYmplY3QsIGJ1dCBpdCBpc24ndCB1c2Vk
IGFueXdoZXJlLiBXaGF0IHRoZSBwdXJwb3NlIG9mCj4gPiBpdD8KPiAKPiBObywgY29sbyBjb21w
YXJlIHVzZSB0aGUgaW90aHJlYWQgYnkgdGhlICJjb2xvX2NvbXBhcmVfaW90aHJlYWQiLgo+IAo+
ID4gCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgIH0KPiA+ID4gICAgICAgICAgICAgICAgICAg
ICAgaWYgKG5pY3NbaV0uY29sb19jb21wYXJlX3ByaV9pbiAmJgo+ID4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgbmljc1tpXS5jb2xvX2NvbXBhcmVfc2VjX2luICYmCj4gPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICBuaWNzW2ldLmNvbG9fY29tcGFyZV9vdXQgJiYKPiA+ID4gLSAgICAg
ICAgICAgICAgICAgICAgICAgIG5pY3NbaV0uY29sb19jb21wYXJlX25vdGlmeV9kZXYpIHsKPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIG5pY3NbaV0uY29sb19jb21wYXJlX25vdGlmeV9k
ZXYgJiYKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIG5pY3NbaV0uY29sb19jb21wYXJl
X2lvdGhyZWFkKSB7Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICBmbGV4YXJyYXlfYXBw
ZW5kKGRtX2FyZ3MsICItb2JqZWN0Iik7Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICBm
bGV4YXJyYXlfYXBwZW5kKGRtX2FyZ3MsCj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICBHQ1NQUklOVEYoImNvbG8tCj4gPiBjb21wYXJlLGlkPWMxLHByaW1hcnlfaW49JXMsc2Vjb25k
YXJ5X2luPSVzLG91dGRldj0lcyxub3RpZnlfZGV2PSVzIiwKPiA+ID4gKwo+ID4gPiArIEdDU1BS
SU5URigiY29sby1jb21wYXJlLGlkPWMxLHByaW1hcnlfaW49JXMsc2Vjb25kYXJ5X2luPSVzLG91
dGRldj0lCj4gPiA+ICsgcyxub3RpZnlfZGV2PSVzLGlvdGhyZWFkPSVzIiwKPiA+IAo+ID4gU28s
IG5vdyBpb3RocmVhZCBhcmUgbWFuZGF0b3J5PyBJdCB3b3VsZCBhbHNvIG1lYW4gdGhhdCBsaWJ4
bCBjYW5uJ3QgdXNlCj4gPiBRRU1VIG9sZGVyIHRoYXQgMi4xMSwgSSB0aGluay4KPiA+IENhbid0
IFFFTVUgY3JlYXRlcyBhbiBpb3RocmVhZCBhdXRvbWF0aWNhbGx5IGlmIG5vbmUgYXJlIHByb3Zp
ZGVkPwo+IAo+IEluIGN1cnJlbnQgQ09MTyBkZXNpZ24sIGlvdGhyZWFkIGFyZSBtYW5kYXRvcnks
IGl0J3MgZnJvbSBRZW11IG1haW50YWluZXIncyBjb21tZW50cyB0byBtYWtlCj4gQ29sby1jb21w
YXJlIHRocmVhZCBpbmRlcGVuZGVudCB3aXRoIFFlbXUgbWFpbiBsb29wIGZvciBiZXR0ZXIgcGVy
Zm9ybWFuY2UuCj4gSSB0aGluayBsaWJ4bCBjYW4gdXNlIHVwc3RyZWFtIFFlbXUgdG8gcnVuIENP
TE8uCj4gUWVtdSBjYW4ndCBjcmVhdGVzIGlvdGhyZWFkIGF1dG9tYXRpY2FsbHksIGJlY2F1c2Ug
aXQgbmVlZHMgdXNlciBpbnB1dCBJRCBmb3IgaW90aHJlYWQsIHRoZW4gaXQgd2lsbCBiZSB1c2Vk
IHRvIG90aGVyIHFlbXUgbW9kdWxlKG5lZWQgdGhlIElEKS4KPiAKPiA+IAo+ID4gQWxzbywgaXQg
bG9va3MgbGlrZSB0aGF0IGlmIG9uZSBvZiB0aGUgY29sby1jb21wYXJlIG9wdGlvbiBpcyBtaXNz
aW5nLCB0aGUgY29sby0KPiA+IGNvbXBhcmUgb2JqZWN0IGlzbid0IGNyZWF0ZWQgYXQgYWxsIHdp
dGggbm8gd2FybmluZyBmb3IgdGhlIHVzZXJzIG9mIGxpYnhsLgo+ID4gCj4gPiBXaGF0J3MgdGhl
IGRpZmZlcmVuY2UgYmV0d2VlbiBgY29sb19pb3RocmVhZCcgYW5kIGBjb2xvX2NvbXBhcmVfaW90
aHJlYWQnID8KPiA+IAo+IAo+ICJDb2xvX2lvdGhyZWFkIiBpcyBpb3RocmVhZCBJRCwgImNvbG9f
Y29tcGFyZV9pb3RocmVhZCIgaXMgY29sbyBjb21wYXJlIHVzZWQgaW90aHJlYWQncyBJRC4KPiBJ
biBjdXJyZW50IENPTE8gY2FzZSwgdHdvIElEIG11c3Qgc2FtZS4KPiBCdXQgZm9yIGZ1dHVyZSBv
ciBvdGhlciBjYXNlLCBpdCBjYW4gZGlmZmVyZW50KG1heWJlIFJYL1RYIHVzZSB0d28gaW90aHJl
YWQgaW4gZnV0dXJlKS4gCj4gCj4gPiBJZiBhIHVzZXIgb25seSBhcyB0aGUgY2hvaWNlIG9mIGEg
aW90aHJlYWQgaWQsIHdoeSBub3QgaGF2ZSBsaWJ4bCBjcmVhdGUgb25lIG9uIGl0cwo+ID4gb3du
IGluc3RlYWQ/Cj4gCj4gQmVjYXVzZSB1c2VyIGFsc28gbmVlZCBpbnB1dCB0aGUgaW90aHJlYWQg
SUQgdG8gY29sby1jb21wYXJlIG1vZHVsZS4KCldoYXQncyBhICJjb2xvLWNvbXBhcmUgbW9kdWxl
Ij8gSXMgaXQgc29tZXRoaW5nIG91dHNpZGUgb2YgUUVNVT8KSWYgbm90LCB0aGVuIEkgZG9uJ3Qg
dGhpbmsgdXNlcnMgb2YgbGlieGwgbmVlZHMgdG8gcHJvdmlkZSBhIG5hbWUgZm9yCnRoaXMgaW90
aHJlYWQuIEluc3RlYWQgb2YgYWRkaW5nICJjb2xvKl9pb3RocmVhZCIgY291bGQgeW91IGRvIHNv
bWV0aGluZwpsaWtlIHRoZSBmb2xsb3dpbmc/CgpjaGFyICpjb2xvX2NvbXBhcmVfaW90aHJlYWRf
aWQgPSBHQ1NQUklOVEYoImNvbG8tY29tcGFyZS1pb3RocmVhZC0lZCIsIGkpOwpmbGV4YXJyYXlf
YXBwZW5kX3BhaXIoZG1fYXJncywgIi1vYmplY3QiLAogICAgICAgICAgICAgICAgICAgICAgR0NT
UFJJTlRGKCJpb3RocmVhZCxpZD0lcyIsIGNvbG9fY29tcGFyZV9pb3RocmVhZF9pZCk7Ci8vIHRo
ZW4gdXNlIGBjb2xvX2NvbXBhcmVfaW90aHJlYWRfaWQnIHdoZW4gZ2VuZXJhdGluZyB0aGUKLy8g
ImNvbG8tY29tcGFyZSIgb3B0aW9uIGxpc3Q6CmZsZXhhcnJheV9hcHBlbmQoZG1fYXJncywgR0NT
UFJJTlRGKCJjb2xvLWNvbXBhcmUsLi4uLGlvdGhyZWFkPSVzIiwKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgLi4uLCBjb2xvX2NvbXBhcmVfaW90aHJlYWRfaWQpKTsKCkkgdGhp
bmsgdGhhdCB3aWxsIGJlIG1vcmUgdGhhbiBlbm91Z2ggZm9yIG5vdy4gaW90aHJlYWQgY2FuJ3Qg
YmUgcmV1c2VkCmJ5IHNvbWV0aGluZyBlbHNlIHRoYXQgbGlieGwgY3JlYXRlLCBhbmQgdGhlcmUg
Y2FuIGJlIG9ubHkgb25lCiJjb2xvLWNvbXBhcmUiIG9iamVjdCBpbiBRRU1VIGJlY2F1c2UgdGhl
IGlkIGlzIGhhcmQtY29kZWQgaW4gbGlieGwuCgpXaGF0IGRvIHlvdSB0aGluZz8KCihJJ20gdHJ5
aW5nIHRvIG1ha2UgdXNpbmcgQ09MTyB3aXRoIGxpYnhsIGEgbGl0dGxlIGJpdCBlYXNpZXIuIGxp
YnhsIGNhbgpiZSB1c2UgdG8gaGlkZSBhbGwgdGhlIGdsb3J5IGRldGFpbHMgb2YgYSBRRU1VIGNv
bW1hbmQgbGluZS4pCgpUaGFua3MsCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
