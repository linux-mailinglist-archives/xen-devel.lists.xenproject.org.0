Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A769CA369
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 18:17:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iG3ia-00082f-6w; Thu, 03 Oct 2019 16:12:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9R/B=X4=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iG3iY-00082a-1M
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2019 16:12:38 +0000
X-Inumbo-ID: 9c7a1a47-e5f8-11e9-972b-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9c7a1a47-e5f8-11e9-972b-12813bfff9fa;
 Thu, 03 Oct 2019 16:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570119157;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=6ls1Wgv1NlefWdoxzJwbHzxdh7+RBtA4rOi9pRy2Kxw=;
 b=X08W2L4hwZTGbldG6XtZw+CuRRBYSqWLi4F93JvFIzVweyM1ncPlKHpC
 T6ITPon5NuaYwk5kgfEOP7VUSiDX/4ZBzwpC0KK45WsDVk1xbFDtfRNNe
 hSU0Y0THbXhg6RdKfaL68O+raT6OnqsFwqNU3F7bycefrcDUdKuHp56xX 4=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0X8malG1nj8R5gWphEZvbLfQLPBWVlRV6YdgBw97elQVbO+hn5kGrLAwrc7/P6ktfDEwuCh2h9
 oHJTfTN/l8naCrXRAFA2AnNis52/IriQMmx7Ls9KOGjQDRSh5mVjM3oiHNUbUe9MNfqUe21cbo
 crX3ENXrlV0dbKwdtPUZx9qgmIxUyolmHtsjl74af5z+4V2zKbSlwju+2DzJxuYofC5f3wdCqx
 oStRXw/0E90Dfkq5Kj0/hqGYIknQkGlV5d6t6Rf/hPU2xs2C8mf/To7Fw4ZWABxZL0BGsCsy6j
 P0E=
X-SBRS: 2.7
X-MesageID: 6501113
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,253,1566878400"; 
   d="scan'208";a="6501113"
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH for-4.13] docs: update all URLs in man pages
Thread-Index: AQHVegVbVDevXTtO/kiOWKJCl1znyw==
Date: Thu, 3 Oct 2019 16:12:30 +0000
Message-ID: <EABA07C5-13F3-4D78-BDB9-21A4B5C5772E@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.e.190909
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <504DBFFAEE8501418CAB1177C06F6A33@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13] docs: update all URLs in man pages
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
Cc: "jgross@suse.com" <jgross@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3BlY2lmaWNhbGx5DQoqIHhlbi5vcmcgdG8geGVucHJvamVjdC5vcmcNCiogaHR0cCB0byBodHRw
cw0KKiBSZXBsYWNlZCBwYWdlcyB3aGVyZSBwYWdlIGhhcyBtb3ZlZA0KICAoaW5jbHVkaW5nIG9u
IHhlbiBwYWdlcyBhcyB3ZWxsIGFzIGV4dGVybmFsIHBhZ2VzKQ0KKiBSZW1vdmVkIHNvbWUgVVJM
cyAoZS5nLiBkb3dubG9hZHMgZm9yIExpbnV4IFBWIGRyaXZlcnMpDQoNClRlc3RlZC1ieTogTGFy
cyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPg0KU2lnbmVkLW9mZi1ieTogTGFycyBLdXJ0
aCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPg0KLS0tDQogZG9jcy9tYW4veGVuLXBjaS1kZXZpY2Ut
cmVzZXJ2YXRpb25zLjcucG9kIHwgIDIgKy0NCiBkb2NzL21hbi94ZW4tcHYtY2hhbm5lbC43LnBv
ZCAgICAgICAgICAgICAgfCAgMiArLQ0KIGRvY3MvbWFuL3hlbi12dHBtLjcucG9kICAgICAgICAg
ICAgICAgICAgICB8ICAyICstDQogZG9jcy9tYW4veGVuc3RvcmUtY2htb2QuMS5wb2QgICAgICAg
ICAgICAgIHwgIDQgKystLQ0KIGRvY3MvbWFuL3hlbnN0b3JlLWxzLjEucG9kICAgICAgICAgICAg
ICAgICB8ICA0ICsrLS0NCiBkb2NzL21hbi94ZW5zdG9yZS1yZWFkLjEucG9kICAgICAgICAgICAg
ICAgfCAgNCArKy0tDQogZG9jcy9tYW4veGVuc3RvcmUtd3JpdGUuMS5wb2QgICAgICAgICAgICAg
IHwgIDQgKystLQ0KIGRvY3MvbWFuL3hlbnN0b3JlLjEucG9kICAgICAgICAgICAgICAgICAgICB8
ICA0ICsrLS0NCiBkb2NzL21hbi94ZW50b3AuMS5wb2QgICAgICAgICAgICAgICAgICAgICAgfCAg
MiArLQ0KIGRvY3MvbWFuL3hsLWRpc2stY29uZmlndXJhdGlvbi41LnBvZCAgICAgICB8ICA0ICsr
LS0NCiBkb2NzL21hbi94bC1uZXR3b3JrLWNvbmZpZ3VyYXRpb24uNS5wb2QgICAgfCAgOCArKysr
LS0tLQ0KIGRvY3MvbWFuL3hsLW51bWEtcGxhY2VtZW50LjcucG9kICAgICAgICAgICB8ICA0ICsr
LS0NCiBkb2NzL21hbi94bC4xLnBvZC5pbiAgICAgICAgICAgICAgICAgICAgICAgfCAyMiArKysr
KysrKysrKy0tLS0tLS0tLS0tDQogZG9jcy9tYW4veGwuY2ZnLjUucG9kLmluICAgICAgICAgICAg
ICAgICAgIHwgMjAgKysrKysrKysrKy0tLS0tLS0tLS0NCiBkb2NzL21hbi94bC5jb25mLjUucG9k
ICAgICAgICAgICAgICAgICAgICAgfCAgNCArKy0tDQogZG9jcy9tYW4veGxjcHVwb29sLmNmZy41
LnBvZCAgICAgICAgICAgICAgIHwgIDQgKystLQ0KIDE2IGZpbGVzIGNoYW5nZWQsIDQ3IGluc2Vy
dGlvbnMoKyksIDQ3IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZG9jcy9tYW4veGVuLXBj
aS1kZXZpY2UtcmVzZXJ2YXRpb25zLjcucG9kIGIvZG9jcy9tYW4veGVuLXBjaS1kZXZpY2UtcmVz
ZXJ2YXRpb25zLjcucG9kDQppbmRleCAwZGY0MWJjZDI5Li5iYzczOTg0MDljIDEwMDY0NA0KLS0t
IGEvZG9jcy9tYW4veGVuLXBjaS1kZXZpY2UtcmVzZXJ2YXRpb25zLjcucG9kDQorKysgYi9kb2Nz
L21hbi94ZW4tcGNpLWRldmljZS1yZXNlcnZhdGlvbnMuNy5wb2QNCkBAIC0yOSw3ICsyOSw3IEBA
IG11bHRpcGxlIFhlbiB2ZW5kb3JzIHVzaW5nIGNvbmZsaWN0aW5nIElEcy4NCiANCiA9aXRlbSAz
LiBUaGUgdmVuZG9yIGlzIHJlc3BvbnNpYmxlIGZvciBhbGxvY2F0aW9ucyB3aXRoaW4gdGhlIHJh
bmdlIGFuZCBzaG91bGQNCiAgICAgICAgICB0cnkgdG8gcmVjb3JkIHNwZWNpZmljIGRldmljZSBJ
RHMgaW4gUENJIElEIGRhdGFiYXNlcyBzdWNoIGFzDQotICAgICAgICAgaHR0cDovL3BjaWlkcy5z
b3VyY2Vmb3JnZS5uZXQgYW5kIGh0dHAvL3d3dy5wY2lkYXRhYmFzZS5jb20NCisgICAgICAgICBo
dHRwOi8vcGNpLWlkcy51Y3cuY3ogYW5kIGh0dHBzOi8vZGV2aWNlaHVudC5jb20NCiANCiA9YmFj
aw0KIA0KZGlmZiAtLWdpdCBhL2RvY3MvbWFuL3hlbi1wdi1jaGFubmVsLjcucG9kIGIvZG9jcy9t
YW4veGVuLXB2LWNoYW5uZWwuNy5wb2QNCmluZGV4IDA3ODk4ZjZkZGUuLmFiNDU3N2QxZGEgMTAw
NjQ0DQotLS0gYS9kb2NzL21hbi94ZW4tcHYtY2hhbm5lbC43LnBvZA0KKysrIGIvZG9jcy9tYW4v
eGVuLXB2LWNoYW5uZWwuNy5wb2QNCkBAIC0xODYsNCArMTg2LDQgQEAgdGhhdCBuby1vbmUncyBu
YW1lIGNsYXNoZXMgd2l0aCB5b3VycywgcGxlYXNlIGFkZCB5b3VycyB0byB0aGlzIGxpc3QuDQog
ICAgIE46IG9yZy54ZW5wcm9qZWN0Lmd1ZXN0LmNsaXBib2FyZC4wLjENCiAgICAgQzogRGF2aWQg
U2NvdHQgPGRhdmUuc2NvdHRAY2l0cml4LmNvbT4NCiAgICAgRDogU2hhcmUgY2xpcGJvYXJkIGRh
dGEgdmlhIGFuIGluLWd1ZXN0IGFnZW50LiBTZWU6DQotICAgICAgIGh0dHA6Ly93aWtpLnhlbnBy
b2plY3Qub3JnL3dpa2kvQ2xpcGJvYXJkX3NoYXJpbmdfcHJvdG9jb2wNCisgICAgICAgaHR0cHM6
Ly93aWtpLnhlbnByb2plY3Qub3JnL3dpa2kvQ2xpcGJvYXJkX3NoYXJpbmdfcHJvdG9jb2wNCmRp
ZmYgLS1naXQgYS9kb2NzL21hbi94ZW4tdnRwbS43LnBvZCBiL2RvY3MvbWFuL3hlbi12dHBtLjcu
cG9kDQppbmRleCAxZDgxODU2MTZhLi5kMDMzMDcyNTg0IDEwMDY0NA0KLS0tIGEvZG9jcy9tYW4v
eGVuLXZ0cG0uNy5wb2QNCisrKyBiL2RvY3MvbWFuL3hlbi12dHBtLjcucG9kDQpAQCAtMzgwLDQg
KzM4MCw0IEBAIEM8aHdpbml0cGNycz01LDEyLTE2PiB3aWxsIGNvcHkgcGNycyA1LCAxMiwgMTMs
IDE0LCAxNSwgYW5kIDE2Lg0KIA0KID1oZWFkMSBSRUZFUkVOQ0VTDQogDQotQmVybGlvcyBUUE0g
RW11bGF0b3I6IEw8aHR0cDovL3RwbS1lbXVsYXRvci5iZXJsaW9zLmRlLz4NCitCZXJsaW9zIFRQ
TSBFbXVsYXRvcjogTDxodHRwczovL2dpdGh1Yi5jb20vUGV0ZXJIdWV3ZS90cG0tZW11bGF0b3I+
DQpkaWZmIC0tZ2l0IGEvZG9jcy9tYW4veGVuc3RvcmUtY2htb2QuMS5wb2QgYi9kb2NzL21hbi94
ZW5zdG9yZS1jaG1vZC4xLnBvZA0KaW5kZXggY2IxZGMyZWY4Mi4uZDc2ZjM0NzIzZCAxMDA2NDQN
Ci0tLSBhL2RvY3MvbWFuL3hlbnN0b3JlLWNobW9kLjEucG9kDQorKysgYi9kb2NzL21hbi94ZW5z
dG9yZS1jaG1vZC4xLnBvZA0KQEAgLTU4LDUgKzU4LDUgQEAgQXBwbHkgdGhlIHBlcm1pc3Npb25z
IHRvIHRoZSBrZXkgYW5kIGFsbCBpdHMgSTxwYXJlbnRzPi4NCiANCiA9aGVhZDEgQlVHUw0KIA0K
LVNlbmQgYnVncyB0byB4ZW4tZGV2ZWxAbGlzdHMueGVuLm9yZywgc2VlDQotaHR0cDovL3dpa2ku
eGVuLm9yZy94ZW53aWtpL1JlcG9ydGluZ0J1Z3Mgb24gaG93IHRvIHNlbmQgYnVnIHJlcG9ydHMu
DQorU2VuZCBidWdzIHRvIHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZywgc2VlDQoraHR0
cHM6Ly93aWtpLnhlbnByb2plY3Qub3JnL3dpa2kvUmVwb3J0aW5nX0J1Z3NfYWdhaW5zdF9YZW5f
UHJvamVjdCBvbiBob3cgdG8gc2VuZCBidWcgcmVwb3J0cy4NCmRpZmYgLS1naXQgYS9kb2NzL21h
bi94ZW5zdG9yZS1scy4xLnBvZCBiL2RvY3MvbWFuL3hlbnN0b3JlLWxzLjEucG9kDQppbmRleCBl
MDRhNTA5ZmE3Li44ZGFjOTMxZTk0IDEwMDY0NA0KLS0tIGEvZG9jcy9tYW4veGVuc3RvcmUtbHMu
MS5wb2QNCisrKyBiL2RvY3MvbWFuL3hlbnN0b3JlLWxzLjEucG9kDQpAQCAtNTgsNSArNTgsNSBA
QCBDb25uZWN0IHRvIHRoZSBYZW5zdG9yZSBkYWVtb24gdXNpbmcgYSBsb2NhbCBzb2NrZXQgb25s
eS4NCiANCiA9aGVhZDEgQlVHUw0KIA0KLVNlbmQgYnVncyB0byB4ZW4tZGV2ZWxAbGlzdHMueGVu
Lm9yZywgc2VlDQotaHR0cDovL3dpa2kueGVuLm9yZy94ZW53aWtpL1JlcG9ydGluZ0J1Z3Mgb24g
aG93IHRvIHNlbmQgYnVnIHJlcG9ydHMuDQorU2VuZCBidWdzIHRvIHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZywgc2VlDQoraHR0cHM6Ly93aWtpLnhlbnByb2plY3Qub3JnL3dpa2kvUmVw
b3J0aW5nX0J1Z3NfYWdhaW5zdF9YZW5fUHJvamVjdCBvbiBob3cgdG8gc2VuZCBidWcgcmVwb3J0
cy4NCmRpZmYgLS1naXQgYS9kb2NzL21hbi94ZW5zdG9yZS1yZWFkLjEucG9kIGIvZG9jcy9tYW4v
eGVuc3RvcmUtcmVhZC4xLnBvZA0KaW5kZXggNTQ5NmRlMTdhOC4uZjVhN2JiN2U0NiAxMDA2NDQN
Ci0tLSBhL2RvY3MvbWFuL3hlbnN0b3JlLXJlYWQuMS5wb2QNCisrKyBiL2RvY3MvbWFuL3hlbnN0
b3JlLXJlYWQuMS5wb2QNCkBAIC0yOCw1ICsyOCw1IEBAIFJlYWQgcmF3IHZhbHVlLCBza2lwIGVz
Y2FwaW5nIG5vbi1wcmludGFibGUgY2hhcmFjdGVycyAoXHguLikuDQogDQogPWhlYWQxIEJVR1MN
CiANCi1TZW5kIGJ1Z3MgdG8geGVuLWRldmVsQGxpc3RzLnhlbi5vcmcsIHNlZQ0KLWh0dHA6Ly93
aWtpLnhlbi5vcmcveGVud2lraS9SZXBvcnRpbmdCdWdzIG9uIGhvdyB0byBzZW5kIGJ1ZyByZXBv
cnRzLg0KK1NlbmQgYnVncyB0byB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcsIHNlZQ0K
K2h0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL1JlcG9ydGluZ19CdWdzX2FnYWluc3Rf
WGVuX1Byb2plY3Qgb24gaG93IHRvIHNlbmQgYnVnIHJlcG9ydHMuDQpkaWZmIC0tZ2l0IGEvZG9j
cy9tYW4veGVuc3RvcmUtd3JpdGUuMS5wb2QgYi9kb2NzL21hbi94ZW5zdG9yZS13cml0ZS4xLnBv
ZA0KaW5kZXggNzhjYmJlMWE2OS4uZDFiMDExMjM2YSAxMDA2NDQNCi0tLSBhL2RvY3MvbWFuL3hl
bnN0b3JlLXdyaXRlLjEucG9kDQorKysgYi9kb2NzL21hbi94ZW5zdG9yZS13cml0ZS4xLnBvZA0K
QEAgLTI1LDUgKzI1LDUgQEAgV3JpdGUgcmF3IHZhbHVlLCBza2lwIHBhcnNpbmcgZXNjYXBlZCBj
aGFyYWN0ZXJzIChceC4uKS4NCiANCiA9aGVhZDEgQlVHUw0KIA0KLVNlbmQgYnVncyB0byB4ZW4t
ZGV2ZWxAbGlzdHMueGVuLm9yZywgc2VlDQotaHR0cDovL3dpa2kueGVuLm9yZy94ZW53aWtpL1Jl
cG9ydGluZ0J1Z3Mgb24gaG93IHRvIHNlbmQgYnVnIHJlcG9ydHMuDQorU2VuZCBidWdzIHRvIHhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZywgc2VlDQoraHR0cHM6Ly93aWtpLnhlbnByb2pl
Y3Qub3JnL3dpa2kvUmVwb3J0aW5nX0J1Z3NfYWdhaW5zdF9YZW5fUHJvamVjdCBvbiBob3cgdG8g
c2VuZCBidWcgcmVwb3J0cy4NCmRpZmYgLS1naXQgYS9kb2NzL21hbi94ZW5zdG9yZS4xLnBvZCBi
L2RvY3MvbWFuL3hlbnN0b3JlLjEucG9kDQppbmRleCBkZDhmODA2NDdkLi5hYjlmYjRhNzljIDEw
MDY0NA0KLS0tIGEvZG9jcy9tYW4veGVuc3RvcmUuMS5wb2QNCisrKyBiL2RvY3MvbWFuL3hlbnN0
b3JlLjEucG9kDQpAQCAtNDgsNSArNDgsNSBAQCBBZGQgb3IgbW9kaWZ5IGtleXMgYW5kIHZhbHVl
cy4NCiANCiA9aGVhZDEgQlVHUw0KIA0KLVNlbmQgYnVncyB0byB4ZW4tZGV2ZWxAbGlzdHMueGVu
Lm9yZywgc2VlDQotaHR0cDovL3dpa2kueGVuLm9yZy94ZW53aWtpL1JlcG9ydGluZ0J1Z3Mgb24g
aG93IHRvIHNlbmQgYnVnIHJlcG9ydHMuDQorU2VuZCBidWdzIHRvIHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZywgc2VlDQoraHR0cHM6Ly93aWtpLnhlbnByb2plY3Qub3JnL3dpa2kvUmVw
b3J0aW5nX0J1Z3NfYWdhaW5zdF9YZW5fUHJvamVjdCBvbiBob3cgdG8gc2VuZCBidWcgcmVwb3J0
cy4NCmRpZmYgLS1naXQgYS9kb2NzL21hbi94ZW50b3AuMS5wb2QgYi9kb2NzL21hbi94ZW50b3Au
MS5wb2QNCmluZGV4IDFkMGViNTA0ZjYuLjEyNmY0M2QyZjMgMTAwNjQ0DQotLS0gYS9kb2NzL21h
bi94ZW50b3AuMS5wb2QNCisrKyBiL2RvY3MvbWFuL3hlbnRvcC4xLnBvZA0KQEAgLTEwMSw3ICsx
MDEsNyBAQCBXcml0dGVuIGJ5IEp1ZHkgRmlzY2hiYWNoLCBEYXZpZCBIZW5kcmlja3MsIGFuZCBK
b3NoIFRyaXBsZXR0DQogDQogPWhlYWQxIFJFUE9SVElORyBCVUdTDQogDQotUmVwb3J0IGJ1Z3Mg
dG8gPHhlbi1kZXZlbEBsaXN0cy54ZW4ub3JnPi4NCitSZXBvcnQgYnVncyB0byA8eGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnPi4NCiANCiA9aGVhZDEgQ09QWVJJR0hUDQogDQpkaWZmIC0t
Z2l0IGEvZG9jcy9tYW4veGwtZGlzay1jb25maWd1cmF0aW9uLjUucG9kIGIvZG9jcy9tYW4veGwt
ZGlzay1jb25maWd1cmF0aW9uLjUucG9kDQppbmRleCA3OTY1ZDVkZDczLi40NmZlZWRiOTVlIDEw
MDY0NA0KLS0tIGEvZG9jcy9tYW4veGwtZGlzay1jb25maWd1cmF0aW9uLjUucG9kDQorKysgYi9k
b2NzL21hbi94bC1kaXNrLWNvbmZpZ3VyYXRpb24uNS5wb2QNCkBAIC0yOTIsNyArMjkyLDcgQEAg
bmV0d29ya2luZyBzdWJzeXN0ZW0uICBUaGlzIGNhbiBjYXVzZSBjcmFzaGVzIHdoZW4gdXNpbmcg
Y2VydGFpbg0KIGJhY2tlbmRzIHdpdGggY2VydGFpbiB1bmRlcmx5aW5nIHN0b3JhZ2UuDQogDQog
U2VlOg0KLSBMPGh0dHA6Ly9saXN0cy54ZW4ub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIw
MTItMTIvbXNnMDExNTQuaHRtbD4NCisgTDxodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2Fy
Y2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTItMTIvbXNnMDExNTQuaHRtbD4NCiANCiBGb3IgdGhp
cyByZWFzb24sICh0aGlzIHZlcnNpb24gb2YpIHRoZSBYZW4gbGlieGwgdG9vbHN0YWNrIGRpc2Fi
bGVzDQogT19ESVJFQ1Qgd2hlbiB1c2luZyB0aGUgcWVtdS1iYXNlZCBYZW4gUFYgYmFja2VuZCAo
QzxxZGlzaz4pLg0KQEAgLTM1NCw3ICszNTQsNyBAQCBmaWxlLg0KID1pdGVtIEI8Y29sbz4NCiAN
CiBFbmFibGUgQ09MTyBIQSBmb3IgZGlzay4gRm9yIGJldHRlciB1bmRlcnN0YW5kaW5nIGJsb2Nr
IHJlcGxpY2F0aW9uIG9uDQotUUVNVSwgcGxlYXNlIHJlZmVyIHRvOiBMPGh0dHA6Ly93aWtpLnFl
bXUub3JnL0ZlYXR1cmVzL0Jsb2NrUmVwbGljYXRpb24+DQorUUVNVSwgcGxlYXNlIHJlZmVyIHRv
OiBMPGh0dHBzOi8vd2lraS5xZW11Lm9yZy9GZWF0dXJlcy9CbG9ja1JlcGxpY2F0aW9uPg0KIE5v
dGUgdGhhdCB0aGUgQ09MTyBjb25maWd1cmF0aW9uIHNldHRpbmdzIHNob3VsZCBiZSBjb25zaWRl
cmVkIHVuc3RhYmxlLg0KIFRoZXkgbWF5IGNoYW5nZSBpbmNvbXBhdGlibHkgaW4gZnV0dXJlIHZl
cnNpb25zIG9mIFhlbi4NCiANCmRpZmYgLS1naXQgYS9kb2NzL21hbi94bC1uZXR3b3JrLWNvbmZp
Z3VyYXRpb24uNS5wb2QgYi9kb2NzL21hbi94bC1uZXR3b3JrLWNvbmZpZ3VyYXRpb24uNS5wb2QN
CmluZGV4IGU5YWMzYzViOWUuLjBhYzI0YzRhMTggMTAwNjQ0DQotLS0gYS9kb2NzL21hbi94bC1u
ZXR3b3JrLWNvbmZpZ3VyYXRpb24uNS5wb2QNCisrKyBiL2RvY3MvbWFuL3hsLW5ldHdvcmstY29u
ZmlndXJhdGlvbi41LnBvZA0KQEAgLTQzLDcgKzQzLDcgQEAgc2l4IGdyb3VwcyBvZiB0d28gaGV4
YWRlY2ltYWwgZGlnaXRzLCBzZXBhcmF0ZWQgYnkgY29sb25zICg6KS4NCiANCiBUaGUgZGVmYXVs
dCBpZiB0aGlzIGtleXdvcmQgaXMgbm90IHNwZWNpZmllZCBpcyB0byBiZSBhdXRvbWF0aWNhbGx5
DQogZ2VuZXJhdGUgYSBNQUMgYWRkcmVzcyBpbnNpZGUgdGhlIHNwYWNlIGFzc2lnbmVkIHRvIFhl
bidzDQotTDxPcmdhbml6YXRpb25hbGx5IFVuaXF1ZSBJZGVudGlmaWVyfGh0dHA6Ly9lbi53aWtp
cGVkaWEub3JnL3dpa2kvT3JnYW5pemF0aW9uYWxseV9VbmlxdWVfSWRlbnRpZmllcj4gKDAwOjE2
OjNlKS4NCitMPE9yZ2FuaXphdGlvbmFsbHkgVW5pcXVlIElkZW50aWZpZXJ8aHR0cHM6Ly9lbi53
aWtpcGVkaWEub3JnL3dpa2kvT3JnYW5pemF0aW9uYWxseV9VbmlxdWVfSWRlbnRpZmllcj4gKDAw
OjE2OjNlKS4NCiANCiBJZiB5b3UgYXJlIGNob29zaW5nIGEgTUFDIGFkZHJlc3MgdGhlbiBpdCBp
cyBzdHJvbmdseSByZWNvbW1lbmQgdG8NCiBmb2xsb3cgb25lIG9mIHRoZSBmb2xsb3dpbmcgc3Ry
YXRlZ2llczoNCkBAIC01Nyw3ICs1Nyw3IEBAIGJpdCAoYml0IDIgb2YgdGhlIGZpcnN0IGJ5dGUp
IGFuZCBjbGVhciB0aGUgbXVsdGljYXN0IGJpdCAoYml0IDENCiBvZiB0aGUgZmlyc3QgYnl0ZSku
IEluIG90aGVyIHdvcmRzIHRoZSBmaXJzdCBieXRlIHNob3VsZCBoYXZlIHRoZQ0KIGJpdCBwYXR0
ZXJuIHh4eHh4eDEwICh3aGVyZSB4IGlzIGEgcmFuZG9tbHkgZ2VuZXJhdGVkIGJpdCkgYW5kIHRo
ZQ0KIHJlbWFpbmluZyA1IGJ5dGVzIGFyZSByYW5kb21seSBnZW5lcmF0ZWQgU2VlDQotW2h0dHA6
Ly9lbi53aWtpcGVkaWEub3JnL3dpa2kvTUFDX2FkZHJlc3NdIGZvciBtb3JlIGRldGFpbHMgdGhl
DQorW2h0dHBzOi8vZW4ud2lraXBlZGlhLm9yZy93aWtpL01BQ19hZGRyZXNzXSBmb3IgbW9yZSBk
ZXRhaWxzIHRoZQ0KIHN0cnVjdHVyZSBvZiBhIE1BQyBhZGRyZXNzLg0KIA0KIA0KQEAgLTg3LDcg
Kzg3LDcgQEAgYml0cyBvZiByYW5kb21uZXNzIHRoYW4gdXNpbmcgdGhlIFhlbiBPVUkuDQogDQog
U3BlY2lmaWVzIHRoZSBuYW1lIG9mIHRoZSBuZXR3b3JrIGJyaWRnZSB3aGljaCB0aGlzIFZJRiBz
aG91bGQgYmUNCiBhZGRlZCB0by4gVGhlIGRlZmF1bHQgaXMgQzx4ZW5icjA+LiBUaGUgYnJpZGdl
IG11c3QgYmUgY29uZmlndXJlZCB1c2luZw0KLXlvdXIgZGlzdHJpYnV0aW9uJ3MgbmV0d29yayBj
b25maWd1cmF0aW9uIHRvb2xzLiBTZWUgdGhlIEw8d2lraXxodHRwOi8vd2lraS54ZW4ub3JnL3dp
a2kvSG9zdENvbmZpZ3VyYXRpb24vTmV0d29ya2luZz4NCit5b3VyIGRpc3RyaWJ1dGlvbidzIG5l
dHdvcmsgY29uZmlndXJhdGlvbiB0b29scy4gU2VlIHRoZSBMPHdpa2l8aHR0cHM6Ly93aWtpLnhl
bnByb2plY3Qub3JnL3dpa2kvTmV0d29ya19Db25maWd1cmF0aW9uX0V4YW1wbGVzXyhYZW5fNC4x
JTJCKT4NCiBmb3IgZ3VpZGFuY2UgYW5kIGV4YW1wbGVzLg0KIA0KIA0KQEAgLTk1LDcgKzk1LDcg
QEAgZm9yIGd1aWRhbmNlIGFuZCBleGFtcGxlcy4NCiANCiBTcGVjaWZpZXMgdGhlIG5hbWUgb2Yg
dGhlIG5ldHdvcmsgaW50ZXJmYWNlIHdoaWNoIGhhcyBhbiBJUCBhbmQgd2hpY2gNCiBpcyBpbiB0
aGUgbmV0d29yayB0aGUgVklGIHNob3VsZCBjb21tdW5pY2F0ZSB3aXRoLiBUaGlzIGlzIHVzZWQg
aW4gdGhlIGhvc3QNCi1ieSB0aGUgdmlmLXJvdXRlIGhvdHBsdWcgc2NyaXB0LiBTZWUgTDx3aWtp
fGh0dHA6Ly93aWtpLnhlbi5vcmcvd2lraS9WaWYtcm91dGU+IGZvciBndWlkYW5jZSBhbmQNCiti
eSB0aGUgdmlmLXJvdXRlIGhvdHBsdWcgc2NyaXB0LiBTZWUgTDx3aWtpfGh0dHBzOi8vd2lraS54
ZW5wcm9qZWN0Lm9yZy93aWtpL1ZpZi1yb3V0ZT4gZm9yIGd1aWRhbmNlIGFuZA0KIGV4YW1wbGVz
Lg0KIA0KIE5PVEU6IG5ldGRldiBpcyBhIGRlcHJlY2F0ZWQgYWxpYXMgb2YgdGhpcyBvcHRpb24u
DQpkaWZmIC0tZ2l0IGEvZG9jcy9tYW4veGwtbnVtYS1wbGFjZW1lbnQuNy5wb2QgYi9kb2NzL21h
bi94bC1udW1hLXBsYWNlbWVudC43LnBvZA0KaW5kZXggYWU4MzMwMjA3ZS4uODAyZjMzMDYwYiAx
MDA2NDQNCi0tLSBhL2RvY3MvbWFuL3hsLW51bWEtcGxhY2VtZW50LjcucG9kDQorKysgYi9kb2Nz
L21hbi94bC1udW1hLXBsYWNlbWVudC43LnBvZA0KQEAgLTIzLDcgKzIzLDcgQEAgcnVubmluZyBt
ZW1vcnktaW50ZW5zaXZlIHdvcmtsb2FkcyBvbiBhIHNoYXJlZCBob3N0LiBJbiBmYWN0LCB0aGUg
Y29zdA0KIG9mIGFjY2Vzc2luZyBub24gbm9kZS1sb2NhbCBtZW1vcnkgbG9jYXRpb25zIGlzIHZl
cnkgaGlnaCwgYW5kIHRoZQ0KIHBlcmZvcm1hbmNlIGRlZ3JhZGF0aW9uIGlzIGxpa2VseSB0byBi
ZSBub3RpY2VhYmxlLg0KIA0KLUZvciBtb3JlIGluZm9ybWF0aW9uLCBoYXZlIGEgbG9vayBhdCB0
aGUgTDxYZW4gTlVNQSBJbnRyb2R1Y3Rpb258aHR0cDovL3dpa2kueGVuLm9yZy93aWtpL1hlbl9O
VU1BX0ludHJvZHVjdGlvbj4NCitGb3IgbW9yZSBpbmZvcm1hdGlvbiwgaGF2ZSBhIGxvb2sgYXQg
dGhlIEw8WGVuIE5VTUEgSW50cm9kdWN0aW9ufGh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93
aWtpL1hlbl9vbl9OVU1BX01hY2hpbmVzPg0KIHBhZ2Ugb24gdGhlIFdpa2kuDQogDQogDQpAQCAt
NTgsNyArNTgsNyBAQCBhbHNvIGdvZXMgdW5kZXIgdGhlIG5hbWUgb2YgdkNQVSBwaW5uaW5nLCBh
bmQgY2FuIGJlIGRvbmUgdGhyb3VnaCB0aGUNCiAiY3B1cz0iIG9wdGlvbiBpbiB0aGUgY29uZmln
IGZpbGUgKG1vcmUgYWJvdXQgdGhpcyBiZWxvdykuIEFub3RoZXIgb3B0aW9uDQogaXMgdG8gcG9v
bCB0b2dldGhlciB0aGUgcENQVXMgc3Bhbm5pbmcgdGhlIG5vZGUgYW5kIHB1dCB0aGUgZG9tYWlu
IGluDQogc3VjaCBhIEk8Y3B1cG9vbD4gd2l0aCB0aGUgInBvb2w9IiBjb25maWcgb3B0aW9uIChh
cyBkb2N1bWVudGVkIGluIG91cg0KLUw8V2lraXxodHRwOi8vd2lraS54ZW4ub3JnL3dpa2kvQ3B1
cG9vbHNfSG93dG8+KS4NCitMPFdpa2l8aHR0cHM6Ly93aWtpLnhlbnByb2plY3Qub3JnL3dpa2kv
Q3B1cG9vbHNfSG93dG8+KS4NCiANCiBJbiBib3RoIHRoZSBhYm92ZSBjYXNlcywgdGhlIGRvbWFp
biB3aWxsIG5vdCBiZSBhYmxlIHRvIGV4ZWN1dGUgb3V0c2lkZQ0KIHRoZSBzcGVjaWZpZWQgc2V0
IG9mIHBDUFVzIGZvciBhbnkgcmVhc29ucywgZXZlbiBpZiBhbGwgdGhvc2UgcENQVXMgYXJlDQpk
aWZmIC0tZ2l0IGEvZG9jcy9tYW4veGwuMS5wb2QuaW4gYi9kb2NzL21hbi94bC4xLnBvZC5pbg0K
aW5kZXggMmY3Mzc1ZWQwYS4uODM4ZWUwNTgyZiAxMDA2NDQNCi0tLSBhL2RvY3MvbWFuL3hsLjEu
cG9kLmluDQorKysgYi9kb2NzL21hbi94bC4xLnBvZC5pbg0KQEAgLTg3OSw3ICs4NzksNyBAQCBD
bGVhcnMgWGVuJ3MgbWVzc2FnZSBidWZmZXIuDQogDQogUHJpbnQgaW5mb3JtYXRpb24gYWJvdXQg
dGhlIFhlbiBob3N0IGluIEk8bmFtZSA6IHZhbHVlPiBmb3JtYXQuICBXaGVuDQogcmVwb3J0aW5n
IGEgWGVuIGJ1ZywgcGxlYXNlIHByb3ZpZGUgdGhpcyBpbmZvcm1hdGlvbiBhcyBwYXJ0IG9mIHRo
ZQ0KLWJ1ZyByZXBvcnQuIFNlZSBJPGh0dHA6Ly93aWtpLnhlbi5vcmcveGVud2lraS9SZXBvcnRp
bmdCdWdzPiBvbiBob3cgdG8NCitidWcgcmVwb3J0LiBTZWUgSTxodHRwczovL3dpa2kueGVucHJv
amVjdC5vcmcvd2lraS9SZXBvcnRpbmdfQnVnc19hZ2FpbnN0X1hlbl9Qcm9qZWN0PiBvbiBob3cg
dG8NCiByZXBvcnQgWGVuIGJ1Z3MuDQogDQogU2FtcGxlIG91dHB1dCBsb29rcyBhcyBmb2xsb3dz
Og0KQEAgLTE3MjEsNyArMTcyMSw3IEBAIHBlcm1pdHRlZC4gU29tZSBleGFtcGxlIG9mIHdoYXQg
eW91IGNhbiBkbyB1c2luZyBYU00vRkxBU0s6DQogICAgZG9tYWlucy4NCiANCiBZb3UgY2FuIGZp
bmQgbW9yZSBkZXRhaWxzIG9uIGhvdyB0byB1c2UgRkxBU0sgYW5kIGFuIGV4YW1wbGUgc2VjdXJp
dHkNCi1wb2xpY3kgaGVyZTogTDxodHRwOi8veGVuYml0cy54ZW4ub3JnL2RvY3MvdW5zdGFibGUv
bWlzYy94c20tZmxhc2sudHh0Pg0KK3BvbGljeSBoZXJlOiBMPGh0dHBzOi8veGVuYml0cy54ZW5w
cm9qZWN0Lm9yZy9kb2NzL3Vuc3RhYmxlL21pc2MveHNtLWZsYXNrLnR4dD4NCiANCiA9b3ZlciA0
DQogDQpAQCAtMTc0OSw3ICsxNzQ5LDcgQEAgSW50ZWwgSGFzd2VsbCBhbmQgbGF0ZXIgc2VydmVy
IHBsYXRmb3JtcyBvZmZlciBzaGFyZWQgcmVzb3VyY2UgbW9uaXRvcmluZw0KIGFuZCBjb250cm9s
IHRlY2hub2xvZ2llcy4gVGhlIGF2YWlsYWJpbGl0eSBvZiB0aGVzZSB0ZWNobm9sb2dpZXMgYW5k
IHRoZQ0KIGhhcmR3YXJlIGNhcGFiaWxpdGllcyBjYW4gYmUgc2hvd24gd2l0aCBCPHBzci1od2lu
Zm8+Lg0KIA0KLVNlZSBMPGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZG9jcy91bnN0YWJsZS9taXNj
L3hsLXBzci5odG1sPiBmb3IgbW9yZQ0KK1NlZSBMPGh0dHBzOi8veGVuYml0cy54ZW5wcm9qZWN0
Lm9yZy9kb2NzL3Vuc3RhYmxlL21pc2MveGwtcHNyLmh0bWw+IGZvciBtb3JlDQogaW5mb3JtYXRp
b24uDQogDQogPW92ZXIgNA0KQEAgLTE4MzQsNyArMTgzNCw3IEBAIGFuZCBkYXRhKSBhcmUgbXV0
dWFsbHkgZXhjbHVzaXZlLiBUaGVyZSBpcyBubyBDRFAgc3VwcG9ydCBvbiBMMiBzbyBmYXIuDQog
PWl0ZW0gQjxwc3ItY2F0LXNldD4gW0k8T1BUSU9OUz5dIEk8ZG9tYWluLWlkPiBJPGNibT4NCiAN
CiBTZXQgY2FjaGUgY2FwYWNpdHkgYml0bWFza3MoQ0JNKSBmb3IgYSBkb21haW4uIEZvciBob3cg
dG8gc3BlY2lmeSBJPGNibT4NCi1wbGVhc2UgcmVmZXIgdG8gTDxodHRwOi8veGVuYml0cy54ZW4u
b3JnL2RvY3MvdW5zdGFibGUvbWlzYy94bC1wc3IuaHRtbD4uDQorcGxlYXNlIHJlZmVyIHRvIEw8
aHR0cHM6Ly94ZW5iaXRzLnhlbnByb2plY3Qub3JnL2RvY3MvdW5zdGFibGUvbWlzYy94bC1wc3Iu
aHRtbD4uDQogDQogQjxPUFRJT05TPg0KIA0KQEAgLTE4OTAsNyArMTg5MCw3IEBAIHRocm90dGxp
bmcgdmFsdWUgKFRIUlRMKSBmb3IgdGhlIGRvbWFpbi4NCiA9aXRlbSBCPHBzci1tYmEtc2V0PiBb
STxPUFRJT05TPl0gSTxkb21haW4taWQ+IEk8dGhydGw+DQogDQogU2V0IHRocm90dGxpbmcgdmFs
dWUgKFRIUlRMKSBmb3IgYSBkb21haW4uIEZvciBob3cgdG8gc3BlY2lmeSBJPHRocnRsPg0KLXBs
ZWFzZSByZWZlciB0byBMPGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZG9jcy91bnN0YWJsZS9taXNj
L3hsLXBzci5odG1sPi4NCitwbGVhc2UgcmVmZXIgdG8gTDxodHRwczovL3hlbmJpdHMueGVucHJv
amVjdC5vcmcvZG9jcy91bnN0YWJsZS9taXNjL3hsLXBzci5odG1sPi4NCiANCiBCPE9QVElPTlM+
DQogDQpAQCAtMTk0MCwxNiArMTk0MCwxNiBAQCBUaGUgZm9sbG93aW5nIG1hbiBwYWdlczoNCiBM
PHhsLmNmZyg1KT4sIEw8eGxjcHVwb29sLmNmZyg1KT4sIEw8eGVudG9wKDEpPiwgTDx4bC1kaXNr
LWNvbmZpZ3VyYXRpb24oNSk+DQogTDx4bC1uZXR3b3JrLWNvbmZpZ3VyYXRpb24oNSk+DQogDQot
QW5kIHRoZSBmb2xsb3dpbmcgZG9jdW1lbnRzIG9uIHRoZSB4ZW4ub3JnIHdlYnNpdGU6DQorQW5k
IHRoZSBmb2xsb3dpbmcgZG9jdW1lbnRzIG9uIHRoZSB4ZW5wcm9qZWN0Lm9yZyB3ZWJzaXRlOg0K
IA0KLUw8aHR0cDovL3hlbmJpdHMueGVuLm9yZy9kb2NzL3Vuc3RhYmxlL21pc2MveHNtLWZsYXNr
LnR4dD4NCi1MPGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZG9jcy91bnN0YWJsZS9taXNjL3hsLXBz
ci5odG1sPg0KK0w8aHR0cHM6Ly94ZW5iaXRzLnhlbnByb2plY3Qub3JnL2RvY3MvdW5zdGFibGUv
bWlzYy94c20tZmxhc2sudHh0Pg0KK0w8aHR0cHM6Ly94ZW5iaXRzLnhlbnByb2plY3Qub3JnL2Rv
Y3MvdW5zdGFibGUvbWlzYy94bC1wc3IuaHRtbD4NCiANCiBGb3Igc3lzdGVtcyB0aGF0IGRvbid0
IGF1dG9tYXRpY2FsbHkgYnJpbmcgdGhlIENQVSBvbmxpbmU6DQogDQotTDxodHRwOi8vd2lraS54
ZW4ub3JnL3dpa2kvUGFyYXZpcnRfTGludXhfQ1BVX0hvdHBsdWc+DQorTDxodHRwczovL3dpa2ku
eGVucHJvamVjdC5vcmcvd2lraS9QYXJhdmlydF9MaW51eF9DUFVfSG90cGx1Zz4NCiANCiA9aGVh
ZDEgQlVHUw0KIA0KLVNlbmQgYnVncyB0byB4ZW4tZGV2ZWxAbGlzdHMueGVuLm9yZywgc2VlDQot
aHR0cDovL3dpa2kueGVuLm9yZy94ZW53aWtpL1JlcG9ydGluZ0J1Z3Mgb24gaG93IHRvIHNlbmQg
YnVnIHJlcG9ydHMuDQorU2VuZCBidWdzIHRvIHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
Zywgc2VlDQoraHR0cHM6Ly93aWtpLnhlbnByb2plY3Qub3JnL3dpa2kvUmVwb3J0aW5nX0J1Z3Nf
YWdhaW5zdF9YZW5fUHJvamVjdCBvbiBob3cgdG8gc2VuZCBidWcgcmVwb3J0cy4NCmRpZmYgLS1n
aXQgYS9kb2NzL21hbi94bC5jZmcuNS5wb2QuaW4gYi9kb2NzL21hbi94bC5jZmcuNS5wb2QuaW4N
CmluZGV4IGU3MWIzYjQxMWQuLmYxYTJkNDEyODYgMTAwNjQ0DQotLS0gYS9kb2NzL21hbi94bC5j
ZmcuNS5wb2QuaW4NCisrKyBiL2RvY3MvbWFuL3hsLmNmZy41LnBvZC5pbg0KQEAgLTY5MSw3ICs2
OTEsNyBAQCBTcGVjaWZ5IHRoZSBiYWNrZW5kIGRvbWFpbiBuYW1lIG9yIGlkLCBkZWZhdWx0cyB0
byBkb20wLg0KIENyZWF0ZXMgYSBYZW4gcHZjYWxscyBjb25uZWN0aW9uIHRvIGhhbmRsZSBwdmNh
bGxzIHJlcXVlc3RzIGZyb20NCiBmcm9udGVuZCB0byBiYWNrZW5kLiBJdCBjYW4gYmUgdXNlZCBh
cyBhbiBhbHRlcm5hdGl2ZSBuZXR3b3JraW5nIG1vZGVsLg0KIEZvciBtb3JlIGluZm9ybWF0aW9u
IGFib3V0IHRoZSBwcm90b2NvbCwgc2VlDQotaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZG9jcy91
bnN0YWJsZS9taXNjL3B2Y2FsbHMuaHRtbC4NCitodHRwczovL3hlbmJpdHMueGVucHJvamVjdC5v
cmcvZG9jcy91bnN0YWJsZS9taXNjL3B2Y2FsbHMuaHRtbC4NCiANCiA9aXRlbSBCPHZmYj1bICJW
RkJfU1BFQ19TVFJJTkciLCAiVkZCX1NQRUNfU1RSSU5HIiwgLi4uXT4NCiANCkBAIC0xMTM5LDcg
KzExMzksNyBAQCB0byBpbml0aWFsaXplIHRoZSBncmFwaGljcyBjYXJkLg0KIA0KIE1vc3QgZ3Jh
cGhpY3MgYWRhcHRlcnMgcmVxdWlyZSB2ZW5kb3Igc3BlY2lmaWMgdHdlYWtzIGZvciBwcm9wZXJs
eQ0KIHdvcmtpbmcgZ3JhcGhpY3MgcGFzc3Rocm91Z2guIFNlZSB0aGUgWGVuVkdBUGFzc3Rocm91
Z2hUZXN0ZWRBZGFwdGVycw0KLUw8aHR0cDovL3dpa2kueGVuLm9yZy93aWtpL1hlblZHQVBhc3N0
aHJvdWdoVGVzdGVkQWRhcHRlcnM+IHdpa2kgcGFnZQ0KK0w8aHR0cHM6Ly93aWtpLnhlbnByb2pl
Y3Qub3JnL3dpa2kvWGVuVkdBUGFzc3Rocm91Z2hUZXN0ZWRBZGFwdGVycz4gd2lraSBwYWdlDQog
Zm9yIGdyYXBoaWNzIGNhcmRzIGN1cnJlbnRseSBzdXBwb3J0ZWQgYnkgQjxnZnhfcGFzc3RocnU+
Lg0KIA0KIEI8Z2Z4X3Bhc3N0aHJ1PiBpcyBjdXJyZW50bHkgc3VwcG9ydGVkIGJvdGggd2l0aCB0
aGUgcWVtdS14ZW4tdHJhZGl0aW9uYWwNCkBAIC0xMTgyLDcgKzExODIsNyBAQCBncmFwaGljcyBj
YXJkLCBhbmQgVk5DIG91dHB1dCBpcyBhdmFpbGFibGUgZnJvbSB0aGUgUUVNVS1lbXVsYXRlZA0K
IHByaW1hcnkgYWRhcHRlci4NCiANCiBNb3JlIGluZm9ybWF0aW9uIGFib3V0IHRoZSBYZW4gQjxn
ZnhfcGFzc3RocnU+IGZlYXR1cmUgaXMgYXZhaWxhYmxlDQotb24gdGhlIFhlblZHQVBhc3N0aHJv
dWdoIEw8aHR0cDovL3dpa2kueGVuLm9yZy93aWtpL1hlblZHQVBhc3N0aHJvdWdoPg0KK29uIHRo
ZSBYZW5WR0FQYXNzdGhyb3VnaCBMPGh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL1hl
blZHQVBhc3N0aHJvdWdoPg0KIHdpa2kgcGFnZS4NCiANCiA9aXRlbSBCPHJkbV9tZW1fYm91bmRh
cnk9TUJZVEVTPg0KQEAgLTE1NjUsNyArMTU2NSw3IEBAIGNvbmN1cnJlbnRseSB1c2UgaXQuIFRo
aXMgcmVxdWlyZXMgYSB2aXJ0dWFsaXphdGlvbi1hd2FyZSBPUC1URUUgZm9yDQogdGhpcyB0byB3
b3JrLg0KIA0KIFlvdSBjYW4gcmVmZXIgdG8NCi1MPE9QLVRFRSBkb2N1bWVudGF0aW9ufGh0dHBz
Oi8vb3B0ZWUucmVhZHRoZWRvY3MuaW8vYXJjaGl0ZWN0dXJlL3ZpcnR1YWxpemF0aW9uLmh0bWw+
DQorTDxPUC1URUUgZG9jdW1lbnRhdGlvbnxodHRwczovL29wdGVlLnJlYWR0aGVkb2NzLmlvL2Vu
L2xhdGVzdC9hcmNoaXRlY3R1cmUvdmlydHVhbGl6YXRpb24uaHRtbD4NCiBmb3IgbW9yZSBpbmZv
cm1hdGlvbiBhYm91dCBob3cgdG8gZW5hYmxlIGFuZCBjb25maWd1cmUgdmlydHVhbGl6YXRpb24g
c3VwcG9ydA0KIGluIE9QLVRFRS4NCiANCkBAIC0xOTUxLDcgKzE5NTEsNyBAQCB4ZW5kOiBbICIx
OmVjeD14eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4MCxlZHg9eHgweHh4eHh4eHh4eHh4
eHh4eHh4eHh4eHh4eA0KIGxpYnhsOiAiaG9zdCx0bT0wLHNzZTM9MCINCiANCiBNb3JlIGluZm8g
YWJvdXQgdGhlIENQVUlEIGluc3RydWN0aW9uIGNhbiBiZSBmb3VuZCBpbiB0aGUgcHJvY2Vzc29y
IG1hbnVhbHMsDQotYW5kIG9uIFdpa2lwZWRpYTogTDxodHRwOi8vZW4ud2lraXBlZGlhLm9yZy93
aWtpL0NQVUlEPg0KK2FuZCBvbiBXaWtpcGVkaWE6IEw8aHR0cHM6Ly9lbi53aWtpcGVkaWEub3Jn
L3dpa2kvQ1BVSUQ+DQogDQogPWl0ZW0gQjxhY3BpX2Zpcm13YXJlPSJTVFJJTkciPg0KIA0KQEAg
LTIwMDAsNyArMjAwMCw3IEBAIERvIG5vdCBwcm92aWRlIGEgVk0gZ2VuZXJhdGlvbiBJRC4NCiA9
YmFjaw0KIA0KIFNlZSBhbHNvICJWaXJ0dWFsIE1hY2hpbmUgR2VuZXJhdGlvbiBJRCIgYnkgTWlj
cm9zb2Z0Og0KLUw8aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL2VuLXVzL2Rvd25sb2FkL2RldGFp
bHMuYXNweD9pZD0zMDcwNz4NCitMPGh0dHBzOi8vZG9jcy5taWNyb3NvZnQuY29tL2VuLXVzL3dp
bmRvd3Mvd2luMzIvaHlwZXJ2X3YyL3ZpcnR1YWwtbWFjaGluZS1nZW5lcmF0aW9uLWlkZW50aWZp
ZXI+DQogDQogPWJhY2sgDQogDQpAQCAtMjEzNCw4ICsyMTM0LDggQEAgYXZhaWxhYmlsaXR5IG9m
IHN1aXRhYmxlIGRyaXZlcnMpIHRvIG1ha2UgdXNlIG9mIHBhcmF2aXJ0dWFsaXNhdGlvbg0KIGZl
YXR1cmVzIHN1Y2ggYXMgZGlzayBhbmQgbmV0d29yayBkZXZpY2VzIGV0Yy4gRW5hYmxpbmcgdGhl
c2UgZHJpdmVycw0KIGltcHJvdmVzIHBlcmZvcm1hbmNlIGFuZCBpcyBzdHJvbmdseSByZWNvbW1l
bmRlZCB3aGVuIGF2YWlsYWJsZS4gUFYNCiBkcml2ZXJzIGFyZSBhdmFpbGFibGUgZm9yIHZhcmlv
dXMgT3BlcmF0aW5nIFN5c3RlbXMgaW5jbHVkaW5nIEhWTQ0KLUxpbnV4IEw8aHR0cDovL3dpa2ku
eGVuLm9yZy93aWtpL1hlbkxpbnV4UFZvbkhWTWRyaXZlcnM+IGFuZCBNaWNyb3NvZnQNCi1XaW5k
b3dzIEw8aHR0cDovL3dpa2kueGVuLm9yZy93aWtpL1hlbldpbmRvd3NHcGxQdj4uDQorTGludXgg
KG91dC1vZi10aGUtYm94KSBhbmQgTWljcm9zb2Z0DQorV2luZG93cyBMPGh0dHBzOi8veGVucHJv
amVjdC5vcmcvd2luZG93cy1wdi1kcml2ZXJzLz4uDQogDQogU2V0dGluZyBCPHhlbl9wbGF0Zm9y
bV9wY2k9MD4gd2l0aCB0aGUgZGVmYXVsdCBkZXZpY2VfbW9kZWwgInFlbXUteGVuIg0KIHJlcXVp
cmVzIGF0IGxlYXN0IFFFTVUgMS42Lg0KQEAgLTI4MDAsNyArMjgwMCw3IEBAIEY8QFhFTl9EVU1Q
X0RJUkAvTkFNRT4NCiANCiBUaGlzIGRvY3VtZW50IG1heSBjb250YWluIGl0ZW1zIHdoaWNoIHJl
cXVpcmUgZnVydGhlcg0KIGRvY3VtZW50YXRpb24uIFBhdGNoZXMgdG8gaW1wcm92ZSBpbmNvbXBs
ZXRlIGl0ZW1zIChvciBhbnkgb3RoZXIgaXRlbSkNCi1hcmUgZ3JhdGVmdWxseSByZWNlaXZlZCBv
biB0aGUgeGVuLWRldmVsQGxpc3RzLnhlbi5vcmcgbWFpbGluZw0KLWxpc3QuIFBsZWFzZSBzZWUg
TDxodHRwOi8vd2lraS54ZW4ub3JnL3dpa2kvU3VibWl0dGluZ1hlblBhdGNoZXM+IGZvcg0KK2Fy
ZSBncmF0ZWZ1bGx5IHJlY2VpdmVkIG9uIHRoZSB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcgbWFpbGluZw0KK2xpc3QuIFBsZWFzZSBzZWUgTDxodHRwczovL3dpa2kueGVucHJvamVjdC5v
cmcvd2lraS9TdWJtaXR0aW5nX1hlbl9Qcm9qZWN0X1BhdGNoZXM+IGZvcg0KIGluZm9ybWF0aW9u
IG9uIGhvdyB0byBzdWJtaXQgYSBwYXRjaCB0byBYZW4uDQogDQpkaWZmIC0tZ2l0IGEvZG9jcy9t
YW4veGwuY29uZi41LnBvZCBiL2RvY3MvbWFuL3hsLmNvbmYuNS5wb2QNCmluZGV4IGIxYmRlN2Q2
NTcuLjRjYzA1ZDg2MDcgMTAwNjQ0DQotLS0gYS9kb2NzL21hbi94bC5jb25mLjUucG9kDQorKysg
Yi9kb2NzL21hbi94bC5jb25mLjUucG9kDQpAQCAtMTMzLDcgKzEzMyw3IEBAIERlZmF1bHQ6IEM8
L2V0Yy94ZW4vc2NyaXB0cy9jb2xvLXByb3h5LXNldHVwPg0KIA0KIENvbmZpZ3VyZXMgdGhlIGRl
ZmF1bHQgb3V0cHV0IGZvcm1hdCB1c2VkIGJ5IHhsIHdoZW4gcHJpbnRpbmcgIm1hY2hpbmUNCiBy
ZWFkYWJsZSIgaW5mb3JtYXRpb24uIFRoZSBkZWZhdWx0IGlzIHRvIHVzZSB0aGUgQzxKU09OPg0K
LUw8aHR0cDovL3d3dy5qc29uLm9yZy8+IHN5bnRheC4gSG93ZXZlciBmb3IgY29tcGF0aWJpbGl0
eSB3aXRoIHRoZQ0KK0w8aHR0cHM6Ly93d3cuanNvbi5vcmcvPiBzeW50YXguIEhvd2V2ZXIgZm9y
IGNvbXBhdGliaWxpdHkgd2l0aCB0aGUNCiBwcmV2aW91cyBDPHhtPiB0b29sc3RhY2sgdGhpcyBj
YW4gYmUgY29uZmlndXJlZCB0byB1c2UgdGhlIG9sZCBDPFNYUD4NCiAoUy1FeHByZXNzaW9uLWxp
a2UpIHN5bnRheCBpbnN0ZWFkLg0KIA0KQEAgLTIxMiw2ICsyMTIsNiBAQCBjaGVjayB0aGF0IHRo
ZSByZXF1aXJlZCBhZmZpbml0eSBoYXMgdGFrZW4gZWZmZWN0Lg0KIA0KID1pdGVtIEw8eGwuY2Zn
KDUpPg0KIA0KLT1pdGVtIGh0dHA6Ly93d3cuanNvbi5vcmcvDQorPWl0ZW0gaHR0cHM6Ly93d3cu
anNvbi5vcmcvDQogDQogPWJhY2sNCmRpZmYgLS1naXQgYS9kb2NzL21hbi94bGNwdXBvb2wuY2Zn
LjUucG9kIGIvZG9jcy9tYW4veGxjcHVwb29sLmNmZy41LnBvZA0KaW5kZXggNzkyY2Y0ZjQyNS4u
M2M5ZGRmNzk1OCAxMDA2NDQNCi0tLSBhL2RvY3MvbWFuL3hsY3B1cG9vbC5jZmcuNS5wb2QNCisr
KyBiL2RvY3MvbWFuL3hsY3B1cG9vbC5jZmcuNS5wb2QNCkBAIC0xMjcsNyArMTI3LDcgQEAgWFhY
KS4gIEhvd2V2ZXIgYWxsIG9wdGlvbnMgYXJlIGluY2x1ZGVkIGhlcmUgd2hldGhlciBvciBub3Qg
dGhleSBhcmUNCiBmdWxseSBkb2N1bWVudGVkLg0KIA0KIFBhdGNoZXMgdG8gaW1wcm92ZSBpbmNv
bXBsZXRlIGl0ZW1zIChvciBhbnkgb3RoZXIgaXRlbSkgd291bGQgYmUNCi1ncmF0ZWZ1bGx5IHJl
Y2VpdmVkIG9uIHRoZSB4ZW4tZGV2ZWxAbGlzdHMueGVuLm9yZyBtYWlsaW5nDQotbGlzdC4gUGxl
YXNlIHNlZSBMPGh0dHA6Ly93aWtpLnhlbi5vcmcvd2lraS9TdWJtaXR0aW5nWGVuUGF0Y2hlcz4g
Zm9yDQorZ3JhdGVmdWxseSByZWNlaXZlZCBvbiB0aGUgeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnIG1haWxpbmcNCitsaXN0LiBQbGVhc2Ugc2VlIEw8aHR0cHM6Ly93aWtpLnhlbnByb2pl
Y3Qub3JnL3dpa2kvU3VibWl0dGluZ19YZW5fUHJvamVjdF9QYXRjaGVzPiBmb3INCiBpbmZvcm1h
dGlvbiBvbiBob3cgdG8gc3VibWl0IGEgcGF0Y2ggdG8gWGVuLg0KIA0KLS0gDQoyLjEzLjANCg0K
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
