Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BEE141184
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 20:15:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isX3R-0005Mc-00; Fri, 17 Jan 2020 19:13:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z7Pq=3G=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1isX3P-0005MO-4p
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 19:13:11 +0000
X-Inumbo-ID: 458c6348-395d-11ea-b833-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 458c6348-395d-11ea-b833-bc764e2007e4;
 Fri, 17 Jan 2020 19:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579288336;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=m1Kfbd9F/ggxTTUe+7ONMYSZlt/HNXHSs0sMcoSK5vE=;
 b=L10SJoLTv8lTuO3sRYL8ffBhw+aToiuwLSvLmRadip4pB49fPK0253wF
 Rn4F5j6r3ww84w2CSTRT4XPOgnyf/Jm1dV8cEj+SFa3QDwY7SWzDl5fC5
 BHguNSHKJm7tZmd8eRqPaP3MhLQRvOArUFYgkwfmL9tz3vIXqqnJdwhP3 E=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: g4oSfyJNt3LUoMBvO8wj3qZgr3PEbw/W7OPHcFllJRkvQLxXKiVKwQ7jx72sOg3mW7czgbaGKM
 2XCpButDeOb6TnntWcO4u9sC9mHAD3arfWvOPn8G4GbT8Ez09ssToG7xMTzjH1ZY4Jm8iEUd0o
 M3WQ+jPqhbeuIlqzhYRcsq07eCMqVfWYNuaoFjColNpzy6jxx4bnMdIiO/359rgxnwa0Z61A1T
 gIHxgs2RHXfzvLF/s2b9Y/vhmpuqkcPg3Irlj5zCWCboIrTfsEMhuVnSDjNz38xvx4RZ9wl3yh
 6hg=
X-SBRS: 2.7
X-MesageID: 11684846
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,331,1574139600"; d="scan'208";a="11684846"
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>, "xen-api@lists.xenproject.org"
 <xen-api@lists.xenproject.org>, "win-pv-devel@lists.xenproject.org"
 <win-pv-devel@lists.xenproject.org>
Thread-Topic: [Vote] For Xen Project Code of Conduct (deadline March 31st)
Thread-Index: AQHVzWoFYs8FGD9/QUu11lcL/Sdp7A==
Date: Fri, 17 Jan 2020 19:12:11 +0000
Message-ID: <63005C11-CF8C-4794-B9E4-C3856CCF41C1@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.12.200112
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <B8E45CE63EFBE149ABF0F86D39DAA76E@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [Vote] For Xen Project Code of Conduct (deadline March
 31st)
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
Cc: "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "mirageos-devel@lists.xenproject.org" <mirageos-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLA0KDQpmb3Igc29tZSB0aW1lIG5vdyB3ZSBoYXZlIGJlZW4gZGlzY3Vzc2luZyB0aGUg
WGVuIFByb2plY3QgQ29kZSBvZg0KQ29uZHVjdC4gVGhlIG1vc3QgcmVjZW50IHNldCBvZiBmZWVk
YmFjayBoYXMgYmVlbiBwcmltYXJpbHkgYXJvdW5kDQptaW5vciBsYW5ndWFnZSBpc3N1ZXMgKFVT
IHZzIFVMIEVuZ2xpc2gsIGV0Yy4pLCB3aGljaCBpbmRpY2F0ZXMgdG8gbWUgDQp0aGF0IHRoZSBw
cm9wb3NhbCBpcyByZWFkeSB0byBiZSB2b3RlZCBvbg0KDQpUaGUgZmluYWwgdmVyc2lvbiB3aGlj
aCBhZGRyZXNzZXMgYWxsIHRoZSBsYXRlc3QgbWlub3IgZmVlZGJhY2sgY2FuIGJlDQpmb3VuZCBh
dCBodHRwOi8veGVuYml0cy54ZW5wcm9qZWN0Lm9yZy9naXR3ZWIvP3A9cGVvcGxlL2xhcnNrL2Nv
ZGUtb2YtY29uZHVjdC5naXQ7YT10cmVlO2g9cmVmcy9oZWFkcy9Db0MtdjUgDQoNCkl0IHNob3Vs
ZCBiZSByZWFkIGluIHRoZSBmb2xsb3dpbmcgb3JkZXINCiogaHR0cDovL3hlbmJpdHMueGVucHJv
amVjdC5vcmcvZ2l0d2ViLz9wPXBlb3BsZS9sYXJzay9jb2RlLW9mLWNvbmR1Y3QuZ2l0O2E9Ymxv
YjtmPWNvZGUtb2YtY29uZHVjdC5tZCANCiogaHR0cDovL3hlbmJpdHMueGVucHJvamVjdC5vcmcv
Z2l0d2ViLz9wPXBlb3BsZS9sYXJzay9jb2RlLW9mLWNvbmR1Y3QuZ2l0O2E9YmxvYjtmPWNvbW11
bmljYXRpb24tZ3VpZGUubWQNCiogaHR0cDovL3hlbmJpdHMueGVucHJvamVjdC5vcmcvZ2l0d2Vi
Lz9wPXBlb3BsZS9sYXJzay9jb2RlLW9mLWNvbmR1Y3QuZ2l0O2E9YmxvYjtmPWNvZGUtcmV2aWV3
LWd1aWRlLm1kDQoqIGh0dHA6Ly94ZW5iaXRzLnhlbnByb2plY3Qub3JnL2dpdHdlYi8/cD1wZW9w
bGUvbGFyc2svY29kZS1vZi1jb25kdWN0LmdpdDthPWJsb2I7Zj1jb21tdW5pY2F0aW9uLXByYWN0
aWNlLm1kIA0KKiBodHRwOi8veGVuYml0cy54ZW5wcm9qZWN0Lm9yZy9naXR3ZWIvP3A9cGVvcGxl
L2xhcnNrL2NvZGUtb2YtY29uZHVjdC5naXQ7YT1ibG9iO2Y9cmVzb2x2aW5nLWRpc2FncmVlbWVu
dC5tZCANCg0KSW4gYWNjb3JkYW5jZSB3aXRoIGh0dHBzOi8veGVucHJvamVjdC5vcmcvZGV2ZWxv
cGVycy9nb3Zlcm5hbmNlLywgSSBuZWVkIHRoZQ0KbGVhZGVyc2hpcCB0ZWFtcyBvZiB0aGUgdGhy
ZWUgbWF0dXJlIHByb2plY3RzOiB0aGUgSHlwZXJ2aXNvciwgdGhlIFhBUEkNCnByb2plY3QgYW5k
IHRoZSBXaW5kb3dzIFBWIERyaXZlciBwcm9qZWN0IHRvIHZvdGUgb24gdGhpcyBwcm9wb3NhbC4N
Cg0KVGhlIHNwZWNpZmljIHZvdGluZyBydWxlcyBpbiB0aGlzIGNhc2UgYXJlIG91dGxpbmVkIGlu
IHNlY3Rpb24NCmh0dHBzOi8vd3d3LnhlbnByb2plY3Qub3JnL2dvdmVybmFuY2UuaHRtbCNwcm9q
ZWN0LWRlY2lzaW9ucyANCg0KUGVvcGxlIGFsbG93ZWQgdG8gdm90ZSBvbiBiZWhhbGYgb2YgdGhl
IEh5cGVydmlzb3IgcHJvamVjdCBhcmU6DQpKdWxpZW4gR3JhbGwsIEFuZHkgQ29vcGVyLCBHZW9y
Z2UgRHVubGFwLCBJYW4gSmFja3NvbiwgSmFuIEJldWxpY2gsIEtvbnJhZCBSDQpXaWxrLCBTdGVm
YW5vIFN0YWJlbGxpbmksIFdlaSBMaXUgYW5kIFBhdWwgRHVycmFudCAoYXMgUmVsZWFzZSBNYW5h
Z2VyKS4NCg0KUGVvcGxlIGFsbG93ZWQgdG8gdm90ZSBvbiBiZWhhbGYgb2YgdGhlIFhBUEkgcHJv
amVjdCBhcmU6DQpDaGFuZHJpa2EgU3Jpbml2YXNhbiwgQ2hyaXN0aWFuIExpbmRpZywgS29uc3Rh
bnRpbmEgQ2hyZW1tb3UsDQpSb2IgSG9lcywgWmhhbmcgTGkNCg0KUGVvcGxlIGFsbG93ZWQgdG8g
dm90ZSBvbiBiZWhhbGYgb2YgdGhlIFdpbmRvd3MgUFYgRHJpdmVyIFByb2plY3QgYXJlOg0KUGF1
bCBEdXJyYW50LCBCZW4gQ2hhbG1lcnMsIE93ZW4gU21pdGgNCg0KSSBwcm9wb3NlIHRvIHRhbGx5
IHRoZSB2b3RlcyBhZnRlciBNYXJjaCAzMXN0LiBZb3UgY2FuIHJlcGx5IHZpYQ0KKzE6IGZvciBw
cm9wb3NhbA0KLTE6IGFnYWluc3QgcHJvcG9zYWwNCmluIHB1YmxpYyBvciBwcml2YXRlLg0KDQpW
b3RlcyB3aWxsIGJlIHRhbGxpZWQgYnkgc3VicHJvamVjdCDigJMgYWthIHRoZSBIeXBlcnZpc29y
IGFuZCBYQVBJIHByb2plY3QgYnkgJQ0KZm9yIHRoZSBwcm9wb3NhbCAtIGFuZCB0aGVuIGF2ZXJh
Z2VkIGFjcm9zcyBzdWItcHJvamVjdHMgdGhhdCBhY2hpZXZlZCB0aGUNCnF1b3J1bS4gVGhlIHZv
dGUgbmVlZHMgdG8gYWNoaWV2ZSBhIDIvMyBtYWpvcml0eSB0byBwYXNzLg0KDQpTdWItcHJvamVj
dCBuZWVkcyB0byBhY2hpZXZlIHRoZSBmb2xsb3dpbmcgcXVvcnVtIG9mIHZvdGVzIGluIGZhdm91
ciBmb3IgdGhlDQpzdWItcHJvamVjdOKAmXMgdm90ZSB0byBjb3VudA0KSHlwZXJ2aXNvcjogMyAr
IHZvdGVzDQpYQVBJOiAyICsgdm90ZXMNCldpbmRvd3MgUFYgRHJpdmVyczogMSArIHZvdGVzDQoN
ClJlZ2FyZHMNCkxhcnMNCg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
