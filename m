Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FB64E7D2
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 14:09:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heIK0-0003un-QB; Fri, 21 Jun 2019 12:07:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LFBF=UU=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1heIJz-0003ug-9E
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 12:07:11 +0000
X-Inumbo-ID: 18481e90-941d-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 18481e90-941d-11e9-8980-bc764e045a96;
 Fri, 21 Jun 2019 12:07:09 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ALzB/SSiIuSVSP4Q/E2IUEL+d6w6xBjygG35eOpKrRM0YYRce62/rT8Dn/NW+dHpdULnm3suf7
 f6/H2W9sfy3d0c2rsVPx29h3TzIpIYsXcOKW/K4zuMH2ckbQH6JYmMprl+DCQyWQG4QldyeWnp
 5IQmlpvEwGcNIARPfF58CafrleuMNjBOb9aMyHNZvZYUIFCU1DqkzNfGJvbYLhK7ku9B+IPvNJ
 0xotUHlmEB2cjQL3NwWIGJTNp0qmE2D4JtZNXOsdW7phVZkFHyakD82lk920kHRakJTtgzn4sa
 QzQ=
X-SBRS: 2.7
X-MesageID: 2045151
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,400,1557201600"; 
   d="scan'208";a="2045151"
From: Lars Kurth <lars.kurth@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH v3] Add TRACKING.IMPORTS to xen.git to more easily manage
 imported files that need to be kept in sync with an upstream
Thread-Index: AQHVElhW7iPUPZ7iREGo8RmthMIcN6Z+mlKAgCYWLgCAAPpWgIAAc2MA
Date: Fri, 21 Jun 2019 12:07:04 +0000
Message-ID: <797D0DBA-03B3-4E9E-BE6D-FF34FB1D96F0@citrix.com>
References: <6250372b05e95412cfd0f8e6f558f2376c4f3d94.1558719481.git.lars.kurth@citrix.com>
 <5CEBB0A30200007800232BBE@prv1-mh.provo.novell.com>
 <EFBDC501-4BF5-49FA-B313-111DBF30CE9C@citrix.com>
 <5D0C75AD0200007800239EC2@prv1-mh.provo.novell.com>
In-Reply-To: <5D0C75AD0200007800239EC2@prv1-mh.provo.novell.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.b.190609
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <0D094B6EB31B7243B56E6E53DBB5E193@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3] Add TRACKING.IMPORTS to xen.git to more
 easily manage imported files that need to be kept in sync with an upstream
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
Cc: Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>, Ian
 Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDIxLzA2LzIwMTksIDA3OjE0LCAiSmFuIEJldWxpY2giIDxKQmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQoNCiAgICA+Pj4gT24gMjAuMDYuMTkgYXQgMTY6MTgsIDxsYXJzLmt1cnRo
QGNpdHJpeC5jb20+IHdyb3RlOg0KICAgID4gT24gMjcvMDUvMjAxOSwgMTA6NDEsICJKYW4gQmV1
bGljaCIgPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCiAgICA+IA0KICAgID4gICAgID4+PiBP
biAyNC4wNS4xOSBhdCAxOTo0NCwgPGxhcnMua3VydGhAY2l0cml4LmNvbT4gd3JvdGU6DQogICAg
PiAgICAgPiBGb2xsb3dpbmcgdGhlIHJlY2VudCBkaXNjdXNzaW9uLCB3ZSBoYWQgb24gSVJDIGFu
ZCB0aGUgYWN0aW9uIEkgaGFkIGluIA0KICAgID4gICAgID4gdGhlIE1hcmNoIGNvbW11bml0eSBj
YWxsLCB0aGlzIGZpbGUgcHJvdmlkZXMgYSBmaWxlIGZvcm1hdCB0aGF0IA0KICAgID4gICAgID4g
ZW5hYmxlcyB3cml0aW5nIGFuIGF1dG9tYXRlZCB0ZXN0IHRvIGNoZWNrIHdoZXRoZXIgZmlsZXMg
YXJlIG91dCBvZiBzeW5jLiANCiAgICA+ICAgICA+IA0KICAgID4gICAgID4gQW4gZXhhbXBsZSwg
d2hhdCBmaWxlIGNvbnRlbnQgbWF5IGxvb2sgbGlrZSBpcyBlbWJlZGRlZCBiZWxvdw0KICAgID4g
ICAgID4gcmVwbzogbGludXgtdG9ydmFsZHMgZ2l0IA0KICAgID4gICAgID4gaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0IA0K
ICAgID4gICAgID4gZmlsZTogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUuYyBsaW51
eC10b3J2YWxkcyANCiAgICA+ICAgICA+IGxpbnV4L2RyaXZlcnMvaW9tbXUvYXJtLXNtbXUuYyBi
NzdjZjExZjA5NDEzNg0KICAgID4gICAgID4gDQogICAgPiAgICAgPiBPbmNlIHRoZSBmaWxlIGZv
cm1hdCBpcyBhZ3JlZSwgSSB3aWxsIHdyaXRlIGEgdGVzdCBvciBzY3JpcHQuDQogICAgPiAgICAg
PiANCiAgICA+ICAgICA+IEkgYWxzbyBuZWVkIHNvbWUgbW9yZSBjb3JyZWN0IHRlc3QgZGF0YSwg
YWthIGVudHJpZXMgaW4gdGhlIGZpbGUgZnJvbQ0KICAgID4gICAgID4gY29tbWl0dGVycyBsb29r
aW5nIGFmdGVyIHRoZSBmb2xsb3dpbmcgZmlsZXMNCiAgICA+ICAgICA+IFtKYW5dDQogICAgPiAg
ICAgPiB4ZW4vYXJjaC94ODYvY3B1L213YWl0LWlkbGUuYyANCiAgICA+ICAgICA+IFtTdGVmYW5v
LCBKdWxpZW4gLSB0aGlzIGhhcyB0byBiZSBmaW5hbGl6ZWRdDQogICAgPiAgICAgPiB4ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jDQogICAgPiAgICAgPiB4ZW4vYXJjaC9hcm0vdmdp
Yy8qDQogICAgPiAgICAgPiB4ZW4vaW5jbHVkZS9hc20tYXJtL2RpdjY0LmgNCiAgICA+ICAgICA+
IHhlbi9kcml2ZXJzL2NoYXIvbWVzb24tdWFydC5jDQogICAgPiAgICAgPiB4ZW4vYXJjaC9hcm0v
YXJtMzIvbGliLyoNCiAgICA+ICAgICA+IHhlbi9hcmNoL2FybS9hcm02NC9saWIvKg0KICAgID4g
ICAgID4geGVuL2FyY2gvYXJtL2FybTY0L2NhY2hlLlMNCiAgICA+ICAgICA+IHhlbi9hcmNoL2Fy
bS9hcm02NC9icGkuUw0KICAgID4gICAgID4geGVuL2luY2x1ZGUvYXNtLWFybS9zeXN0ZW0uaA0K
ICAgID4gICAgID4geGVuL2FyY2gvYXJtL2FybTY0L2luc24uYw0KICAgID4gICAgID4gW090aGVy
cz9dDQogICAgPiAgICAgPiB4ZW4vY29tbW9uL3JidHJlZS5jDQogICAgPiAgICAgPiANCiAgICA+
ICAgICA+IE5vdGUgdGhhdCBpbiBzb21lIGNhc2VzIExpbnV4IGhhcyBkaXZlcmdlZCBhbmQgc29t
ZSBMaW51eCBmaWxlcyBoYXZlIGRpc2FwcGVhcmVkLiANCiAgICA+ICAgICA+IEp1bGllbiBhbHNv
IHJhaXNlZCB0aGUgcG9pbnQsIHRoYXQgaW4gc29tZSBjYXNlcyBvbmx5IGEgc3Vic2V0IG9mIGNv
ZGUgZnJvbSANCiAgICA+ICAgICA+IExpbnV4IFhlbiBmaWxlcyB3YXMgYXBwbGllZCBvciB0aGF0
IG9ubHkgc29tZSBmdW5jdGlvbnMgZ2V0IG1vdmVkIGFjcm9zcyB0byANCiAgICA+ICAgICA+IFhl
bi4NCiAgICA+ICAgICA+IA0KICAgID4gICAgID4gSSBiZWxpZXZlIHRoYXQgaXMgZW50aXJlbHkg
T0suIFRoZSB3b3JrZmxvdyB3b3VsZCBiZSBpbiBtb3N0IGNhc2VzIHRoYXQ6DQogICAgPiAgICAg
PiAtIFdlIHVzZSBhIExpbnV4IChzb3VyY2UpIGNvbW1pdCBhcyBhIGJlbmNobWFyayBhbmQgcmVj
b3JkIHRoZSBjb21taXQgSUQNCiAgICA+ICAgICA+IC0gSWYgdGhlcmUgaXMgYSBjaGFuZ2UgaW4g
TGludXggdGhlIHRlc3Qgd2lsbCBmYWlsDQogICAgPiAgICAgPiAtIFRoZSBjb21taXR0ZXIgbG9v
a3MgYXQgdGhlIGRpZmYgYW5kIGVpdGhlcg0KICAgID4gICAgID4gICAtIERlY2lkZXMgdG8gaWdu
b3JlIGl0IGFuZCBidW1wcyB0aGUgY29tbWl0IElEIGluIHRoaXMgZmlsZQ0KICAgID4gICAgID4g
ICAtIERlY2lkZXMgdGhlIGNoYW5nZSBpcyBuZWVkZWQsIGludGVncmF0ZXMgaXQgaW50byBYZW4g
YW5kIHRoZW4gDQogICAgPiAgICAgPiAgICAgYnVtcHMgdGhlIGNvbW1pdCBJRCBpbiB0aGlzIGZp
bGUNCiAgICA+ICAgICANCiAgICA+ICAgICBXaXRoIHRoaXMgLi4uDQogICAgPiAgICAgDQogICAg
PiAgICAgPiBDaGFuZ2VzIHNpbmNlIHYxDQogICAgPiAgICAgPiAqIFJlcXVpcmUgYSBjb2xvbiBh
ZnRlciByZXBvOiwgZmlsZTosIC4uLiBrZXl3b3Jkcw0KICAgID4gICAgID4gKiBSZXBsYWNlIG1h
bnVhbDp8YXV0bzogd2l0aCBmaWxlOiBhcyB0aGVyZSBhdXRvOiB1c2UtY2FzZSB3YXMgaW52YWxp
ZA0KICAgID4gICAgID4gKiBBZGRlZCBtb3JlIHZlcmJvc2UgZGVzY3JpcHRpb24gb2YgZm9ybWF0
DQogICAgPiAgICAgPiANCiAgICA+ICAgICA+IENoYW5nZXMgc2luY2UgdjINCiAgICA+ICAgICA+
ICogQ2hhbmdlZCBzb21lIGZvcm1hdHRpbmcNCiAgICA+ICAgICA+ICogUmVtb3ZlZCBleGFtcGxl
cw0KICAgID4gICAgID4gKiBSZW1vdmVkIHJlZmVyZW5jZXMgdG8gaHR0cHMNCiAgICA+ICAgICAN
CiAgICA+ICAgICAuLi4gbW92ZSBwYXN0IHRoZSBmaXJzdCAtLS0gc2VwYXJhdG9yIC4uLg0KICAg
ID4gICAgIA0KICAgID4gICAgID4gU2lnbmVkLW9mZi1ieTogTGFycyBLdXJ0aCA8bGFycy5rdXJ0
aEBjaXRyaXguY29tPg0KICAgID4gICAgIA0KICAgID4gICAgIEFja2VkLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+DQogICAgPiAgICAgDQogICAgPiBBcmUgYW55IGV4dHJhIEFD
S3MgbmVlZGVkPyAgDQogICAgDQogICAgSSBkb24ndCB0aGluayB0aGVyZSdzIGEgc3RyaWN0IHJl
cXVpcmVtZW50IGZvciBtb3JlLCBidXQgSSB0aGluayBpdA0KICAgIHdvdWxkIGJlIG5pY2UgdG8g
YXQgbGVhc3QgZ2V0IHdob2V2ZXIgYnJvdWdodCB1cCB0aGUgdHJhY2tpbmcNCiAgICBpZGVhIHRv
IGFja25vd2xlZGdlIHRoYXQgdGhpcyBhcHByb2FjaCBpcyBsaWtlbHkgZ29pbmcgdG8gZml0Lg0K
ICAgIFVubGVzcyBvZiBjb3Vyc2UgaXQgd2FzIHlvdXJzZWxmIHRvIGJyaW5nIHRoaXMgdXAgZmly
c3QgLi4uDQogICAgDQpJdCB3YXMgYnJvdWdodCB1cCBpbiBhIGNvbW11bml0eSBjYWxsIGluIEZl
YnJ1YXJ5IGFuZCB5b3UsIEp1bGllbiwgR2VvcmdlLCBQYXVsIER1cnJhbnQgYW5kIFN0ZWZhbm8g
YWxsIGZlbHQgdGhpcyB3YXMgYSBnb29kIGlkZWEuIA0KQnV0IHRoZXJlIHdhcyBubyBzcGVjaWZp
YyByZXF1ZXN0b3INClRoZSB0cmlnZ2VyIG9mIHRoZSBkaXNjdXNzaW9uIHdhcyBhIHBvc3QtbW9y
dGVtIG9mIDQuMTIgKGFuZCB0aGUgQVJHTyBwYXRjaGVzKSAuDQoNClJlZ2FyZHMNCkxhcnMNCiAg
ICANCiAgICANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
