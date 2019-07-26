Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2AD76910
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 15:49:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr0ZM-0007y9-GA; Fri, 26 Jul 2019 13:47:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvJk=VX=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hr0ZK-0007xs-Pf
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 13:47:34 +0000
X-Inumbo-ID: eae8fc40-afab-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id eae8fc40-afab-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 13:47:33 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: fWZNRQydfqg3lHIDm4pSRsvchdiKoHjCxAwxuZ3aGYUX4mrhsQJcDDVHxVo79GV9mjn92UMoYq
 EI2rHg2q6Jxty2p1TDquoyKWHCu0xDzaiZZj6jNdREhTRRn+Bxn0lvk+HKcFUOOOaTisdeUGP8
 DkoQjgqakn+So5R7+JlAbXmD6r9+7+Av0ELzw7+ybPk8y5X1P+fYIPPAfVjd1v4pygCb/ubasl
 +04qWIZh7ql3ii71Z4u6qCFFcpkuNKfh6MYN7yA4UiIwF/Cn6SWQn9vp2myZz/HRbpwT+/MX15
 Tj8=
X-SBRS: 2.7
X-MesageID: 3590688
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,311,1559534400"; 
   d="scan'208";a="3590688"
Date: Fri, 26 Jul 2019 14:47:30 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Zhang Chen <chen.zhang@intel.com>
Message-ID: <20190726134730.GE1242@perard.uk.xensource.com>
References: <20190726064300.27530-1-chen.zhang@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726064300.27530-1-chen.zhang@intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH V2] tools/libxl: Add iothread support for
 COLO
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Zhang Chen <zhangckid@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMDI6NDM6MDBQTSArMDgwMCwgWmhhbmcgQ2hlbiB3cm90
ZToKPiBGcm9tOiBaaGFuZyBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT4KPiAKPiBYZW4gQ09M
TyBhbmQgS1ZNIENPTE8gc2hhcmVkIGxvdHMgb2YgY29kZSBpbiBRZW11Lgo+IEtWTSBDT0xPIGhh
cyBhZGRlZCB0aGUgaW90aHJlYWQgc3VwcG9ydCwgc28gd2UgYWRkIGl0IG9uIFhlbi4KCkl0IHdv
dWxkIGJlIHVzZWZ1bCB0byBleHBhbmQgdGhlIGNvbW1lbnQgb2YgdGhlIGNvbW1pdCBhbmQgZXhw
bGFpbiB3aHkgdGhlCmNoYW5nZSBpcyByZXF1aXJlZC4gSSB3b3VsZCBhZGQgdGhlIGZvbGxvd2lu
ZzoKCiAgICBUaGUgY29sby1jb21wYXJlIG9iamVjdCBpbiBRRU1VIG5vdyByZXF1aXJlcyBhbiBg
aW90aHJlYWQnIHByb3BlcnR5CiAgICBzaW5jZSBRRU1VIDIuMTEuCgo+IERldGFpbDoKPiBodHRw
czovL3dpa2kucWVtdS5vcmcvRmVhdHVyZXMvQ09MTwo+IAo+IFNpZ25lZC1vZmYtYnk6IFpoYW5n
IENoZW4gPGNoZW4uemhhbmdAaW50ZWwuY29tPgo+IC0tLQoKPiBkaWZmIC0tZ2l0IGEvdG9vbHMv
bGlieGwvbGlieGxfdHlwZXMuaWRsIGIvdG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsCj4gaW5k
ZXggYjYxMzk5Y2UzNi4uZWRhOTU4ZWI0YiAxMDA2NDQKPiAtLS0gYS90b29scy9saWJ4bC9saWJ4
bF90eXBlcy5pZGwKPiArKysgYi90b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwKPiBAQCAtNzI3
LDYgKzcyNyw3IEBAIGxpYnhsX2RldmljZV9uaWMgPSBTdHJ1Y3QoImRldmljZV9uaWMiLCBbCj4g
ICAgICAoImNvbG9fZmlsdGVyX3JlZGlyZWN0b3IxX3F1ZXVlIiwgc3RyaW5nKSwKPiAgICAgICgi
Y29sb19maWx0ZXJfcmVkaXJlY3RvcjFfaW5kZXYiLCBzdHJpbmcpLAo+ICAgICAgKCJjb2xvX2Zp
bHRlcl9yZWRpcmVjdG9yMV9vdXRkZXYiLCBzdHJpbmcpLAo+ICsgICAgKCJjb2xvX2lvdGhyZWFk
Iiwgc3RyaW5nKSwKPiAgICAgICgiY29sb19jb21wYXJlX3ByaV9pbiIsIHN0cmluZyksCj4gICAg
ICAoImNvbG9fY29tcGFyZV9zZWNfaW4iLCBzdHJpbmcpLAo+ICAgICAgKCJjb2xvX2NvbXBhcmVf
b3V0Iiwgc3RyaW5nKSwKPiBkaWZmIC0tZ2l0IGEvdG9vbHMveGwveGxfcGFyc2UuYyBiL3Rvb2xz
L3hsL3hsX3BhcnNlLmMKPiBpbmRleCBlMTA1YmRhMmJiLi4wYjgxODlmMzc1IDEwMDY0NAo+IC0t
LSBhL3Rvb2xzL3hsL3hsX3BhcnNlLmMKPiArKysgYi90b29scy94bC94bF9wYXJzZS5jCj4gQEAg
LTUyMSw2ICs1MjEsOCBAQCBpbnQgcGFyc2VfbmljX2NvbmZpZyhsaWJ4bF9kZXZpY2VfbmljICpu
aWMsIFhMVV9Db25maWcgKipjb25maWcsIGNoYXIgKnRva2VuKQo+ICAgICAgICAgIHJlcGxhY2Vf
c3RyaW5nKCZuaWMtPmNvbG9fZmlsdGVyX3JlZGlyZWN0b3IxX2luZGV2LCBvcGFyZyk7Cj4gICAg
ICB9IGVsc2UgaWYgKE1BVENIX09QVElPTigiY29sb19maWx0ZXJfcmVkaXJlY3RvcjFfb3V0ZGV2
IiwgdG9rZW4sIG9wYXJnKSkgewo+ICAgICAgICAgIHJlcGxhY2Vfc3RyaW5nKCZuaWMtPmNvbG9f
ZmlsdGVyX3JlZGlyZWN0b3IxX291dGRldiwgb3BhcmcpOwo+ICsgICAgfSBlbHNlIGlmIChNQVRD
SF9PUFRJT04oImNvbG9faW90aHJlYWQiLCB0b2tlbiwgb3BhcmcpKSB7Cj4gKyAgICAgICAgcmVw
bGFjZV9zdHJpbmcoJm5pYy0+Y29sb19pb3RocmVhZCwgb3BhcmcpOwo+ICAgICAgfSBlbHNlIGlm
IChNQVRDSF9PUFRJT04oImNvbG9fY29tcGFyZV9wcmlfaW4iLCB0b2tlbiwgb3BhcmcpKSB7Cj4g
ICAgICAgICAgcmVwbGFjZV9zdHJpbmcoJm5pYy0+Y29sb19jb21wYXJlX3ByaV9pbiwgb3Bhcmcp
Owo+ICAgICAgfSBlbHNlIGlmIChNQVRDSF9PUFRJT04oImNvbG9fY29tcGFyZV9zZWNfaW4iLCB0
b2tlbiwgb3BhcmcpKSB7CgpXaGF0IEkgaGFkIGluIG1pbmQgd2hpbGUgcmV2aWV3aW5nIHRoZSB2
MSBvZiB0aGUgcGF0Y2ggd2FzIHRvIHJlbW92ZQpib3RoIGBjb2xvX2lvdGhyZWFkJyBhbmQgYGNv
bG9fY29tcGFyZV9pb3RocmVhZCcgZnJvbSB0aGUgbGlieGwgQVBJIGFuZAp4bCBjb25maWcgb3B0
aW9uLiBJIGRvbid0IHRoaW5rIHRoZXJlIGFyZSB1c2VmdWwuIFdoeSBkaWQgeW91IGtlZXAKYGNv
bG9faW90aHJlYWQnPwoKVGhhbmtzLAoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
