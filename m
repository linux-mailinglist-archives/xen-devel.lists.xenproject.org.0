Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B71C623CE0
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 18:08:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSkmk-00016V-S4; Mon, 20 May 2019 16:05:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hVmq=TU=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1hSkmi-00016Q-Vk
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 16:05:09 +0000
X-Inumbo-ID: 09073a1b-7b19-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 09073a1b-7b19-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 16:05:07 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: 4KccGxiviz49xHwctDbA3vkJ97PutCx13u0yutCgX9cxukhZbjDKAMnY2FqeLd04RAgKAlxHW9
 mgUzDLmycr2+JUkHBQeqwzqirrAvWlPToUXnjMY1qMz36tvD1MWudM9s2jAEifnGJzQfN60l/7
 9aPr9Gmh4YRU69ZYrpcHUrW8WMqtOVqVee4/Zg9eQZhjU8lj++hktbhagBhomZqZiJFXA/4dFc
 457mM0CBlruY0TBLAhS9gTvoRulBnqQ4509C2mJbMjjKpHid//K7VnEOZzpUVGi5xIzNVBjB9T
 OPY=
X-SBRS: 2.7
X-MesageID: 663067
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,491,1549947600"; 
   d="scan'208";a="663067"
From: Lars Kurth <lars.kurth@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH] Add TRACKING.IMPORTS to xen.git to more easily manage
 imported files that need to be kept in sync with an upstream
Thread-Index: AQHVC2w8yCFJJzKGGki86dw3YKFbFqZtcP2A///xTICAAWtFgIAE4QuA
Date: Mon, 20 May 2019 16:05:02 +0000
Message-ID: <2B55A18B-F04C-4249-8558-11F0A24E312C@citrix.com>
References: <0648312f1c78e519142ff1829a984e7e965bf3c7.1557957269.git.lars.kurth@citrix.com>
 <5CDD3FA1020000780022F903@prv1-mh.provo.novell.com>
 <530E0649-256F-4A11-B887-E665B3C92979@citrix.com>
 <5CDE6407020000780022FF63@prv1-mh.provo.novell.com>
In-Reply-To: <5CDE6407020000780022FF63@prv1-mh.provo.novell.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.a.190512
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <987DD0C0D0E04B4B9B2F9FF22437801E@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] Add TRACKING.IMPORTS to xen.git to more
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
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

DQoNCu+7v09uIDE3LzA1LzIwMTksIDAxOjM0LCAiSmFuIEJldWxpY2giIDxKQmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQoNCiAgICA+Pj4gT24gMTYuMDUuMTkgYXQgMTc6NTQsIDxsYXJzLmt1cnRo
QGNpdHJpeC5jb20+IHdyb3RlOg0KICAgIA0KICAgID4gDQogICAgPiBPbiAxNi8wNS8yMDE5LCAw
NDo0NywgIkphbiBCZXVsaWNoIiA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KICAgID4gDQog
ICAgPiAgICAgPj4+IE9uIDE2LjA1LjE5IGF0IDAwOjE4LCA8bGFycy5rdXJ0aEBjaXRyaXguY29t
PiB3cm90ZToNCiAgICA+ICAgICA+ICsjIE1hcHBpbmdzIHRvIHRyYWNrIGZpbGVzIGFyZSBvZiB0
aGUgZm9sbG93aW5nIGZvcm1hdA0KICAgID4gICAgID4gKyMgLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQogICAgPiAgICAgPiArIyBtYW51YWx8YXV0
byB4ZW4tZmlsZSBuYW1lLW9mLW9yaWdpbmFsLXJlcG8gb3JpZ2luYWwtZmlsZSBjb21taXQtaWQN
CiAgICA+ICAgICA+ICsjDQogICAgPiAgICAgPiArIyBhdXRvOg0KICAgID4gICAgID4gKyMgICBU
aGUgeGVuLWZpbGUgbmVlZHMgdG8gdHJhY2sgdGhlIHRoZSBvcmlnaW5hbC1maWxlIGV4YWN0bHkN
CiAgICA+ICAgICA+ICsjICAgSW4gb3RoZXIgd29yZHMsIHdlIGNhbiBhdXRvbWF0aWNhbGx5IHVw
ZGF0ZSB0aGUgZmlsZSB1c2luZyBhIHNjcmlwdA0KICAgID4gICAgIA0KICAgID4gICAgIERvIHdl
IGhhdmUgX2FueV8gZXhhbXBsZSBvZiB0aGlzPyBJIGNhbid0IGV2ZW4gaW1hZ2luZSBvbmUsIGR1
ZQ0KICAgID4gICAgIHRvIGUuZy4gb3VyIGluY2x1ZGVzIGFsbCBzdGFydGluZyB3aXRoIHhlbi8g
d2hlcmVhcyBMaW51eCdlcyAoanVzdCB0bw0KICAgID4gICAgIHRha2UgYXMgZXhhbXBsZSkgYWxs
IHN0YXJ0IHdpdGggbGludXgvLiBQZXJoYXBzICJhdXRvIiBuZWVkcyB0bw0KICAgID4gICAgIGlu
Y2x1ZGUgc2VkIGV4cHJlc3Npb25zIHRoYXQgbmVlZCB0byBiZSBhcHBsaWVkIGJlZm9yZSBhY3R1
YWxseQ0KICAgID4gICAgIGFwcGx5aW5nIHRoZSBvcmlnaW5hbCBjaGFuZ2UgdG8gb3VyIHRyZWU/
DQogICAgPiANCiAgICA+IEkgYW0gbm90IHN1cmUgSSBmdWxseSB1bmRlcnN0YW5kIHlvdXIgY29u
Y2Vybi4gDQogICAgPiBUaGlzIHdhcyBpbnRlbmRlZCBmb3IgdGhlIGNhc2Ugd2hlcmUgc2F5IHdl
IHdvdWxkIGV4YWN0bHkgdHJhY2sgDQogICAgPiB4ZW4vLi4uL2Zvby5iYXIgd2l0aCBsaW51eC8u
Li4vZm9vLmJhcg0KICAgID4gSW4gb3RoZXIgd29yZHMsIGF1dG8gb25seSBhcHBsaWVzIHRvIHRo
ZSBjb250ZW50IG9mIGEgZmlsZTogdGhlIGZpbGVuYW1lIA0KICAgID4gaXNuJ3QgcmVsZXZhbnQs
IGJlY2F1c2UgYWxsIHRoZSBpbmZvcm1hdGlvbiB0aGF0IHdvdWxkIGJlIG5lZWRlZCB0byBkbyB0
aGlzIA0KICAgID4gaXMgaW4gdGhlIGZpbGUuDQogICAgDQogICAgV2hlbiB0YWxraW5nIGFib3V0
IGZpbGUgbmFtZXMgaW4gbXkgcmVwbHksIEkgcmVmZXJyZWQgdG8gQyBsYW5ndWFnZQ0KICAgICNp
bmNsdWRlIGRpcmVjdGl2ZXMgaW5zaWRlIHRoZSBmaWxlIGluIHF1ZXN0aW9uLCBhcyBhIChwcmV0
dHkgaW1wb3J0YW50KQ0KICAgIGV4YW1wbGUuIFRoZXJlIHdhcyBubyB0YWxrIGFib3V0IHRoZSBj
bG9uZWQvY29waWVkIGZpbGUncyBuYW1lIGl0c2VsZi4NCiAgICBIZW5jZSB0aGUgc3VnZ2VzdGlv
biB0byBhY2NvbXBhbnkgYXV0bzogd2l0aCBhIHNldCBvZiBzZWQNCiAgICBleHByZXNzaW9ucywg
d2hpY2ggY291bGQgdGhlbiBlLmcuIHRyYW5zZm9ybSAjaW5jbHVkZSA8bGludXgvLi4uPg0KICAg
IGludG8gI2luY2x1ZGUgPHhlbi8uLi4+Lg0KDQpUaGF0IG1ha2VzIHBlcmZlY3Qgc2Vuc2Ugbm93
LiBJbiB0aGF0IGNhc2UsIEkgdGVuZCB0byBhZ3JlZSB0aGF0ICJhdXRvIiBpcyBwcm9iYWJseSBu
b3QgbmVlZGVkLiBXb3VsZCBiZSBxdWl0ZSBoYXBweSB0byBkcm9wIGl0Lg0KICAgIA0KICAgID4g
QEp1bGllbiwgQFN0ZWZhbm8sIEBKYW46IGFyZSBhbnkgb2YgdGhlIGZpbGVzIHlvdSBsaXN0ZWQg
ZmFsbCBpbnRvIHRoZSANCiAgICA+ICJzaG91bGQgYmUgdHJhY2tlZCBleGFjdGx5IiBjYXRlZ29y
eT8NCiAgICANCiAgICBBcyBJJ3ZlIHNhaWQgYmVmb3JlIC0gSSBjYW4ndCBldmVuIGltYWdpbmUg
c3VjaCBhIGZpbGUgdG8gZXhpc3QuDQogICAgDQogICAgPiAgICAgPiArIyBtYW51YWw6DQogICAg
PiAgICAgPiArIyAgIEEgZGV2ZWxvcGVyIG5lZWRzIHRvIG1ha2UgYSBkZWNpc2lvbiB3aGV0aGVy
IGENCiAgICA+ICAgICA+ICsjICAgc3BlY2lmaWMgY2hhbmdlIGlzIGFwcGxpZWQgb3IgaWdub3Jl
ZCBhbmQgdXBkYXRlIHRoZSBsYXN0IGNvbW1pdCBpZA0KICAgID4gICAgID4gKyMgICBhY2NvcmRp
bmdseQ0KICAgID4gICAgID4gKyMNCiAgICA+ICAgICA+ICsjIG5hbWUtb2Ytb3JpZ2luYWwtcmVw
bzoNCiAgICA+ICAgICA+ICsjICAgQSByZWZlcmVuY2UgdG8gYSBzb3VyY2UgcmVwb3NpdG9yeSBk
ZWZpbmVkIGJ5ICpyZXBvKiBrZXl3b3JkDQogICAgPiAgICAgPiArIw0KICAgID4gICAgID4gKyMg
Y29tbWl0IGlkOg0KICAgID4gICAgID4gKyMgICBMYXN0IGNvbW1pdCBpZCBvZiBzb3VyY2UgZmls
ZSB0aGF0IHdhcyBkZWVtZWQgdG8gYmUgb2sNCiAgICA+ICAgICA+ICsjICAgYW5kIGVpdGhlciBp
bXBvcnRlZCBpbnRvIHRoZSB0cmVlIG9yIHJlamVjdGVkDQogICAgPiAgICAgPiArIw0KICAgID4g
ICAgID4gKyMgRm9yIGV4YW1wbGU6DQogICAgPiAgICAgPiArIyAgIG1hbnVhbCB4ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jIGxpbnV4LXRvcnZhbGRzIA0KICAgID4gbGludXgvZHJp
dmVycy9pb21tdS9hcm0tc21tdS5jIGI3N2NmMTFmMDk0MTM2DQogICAgPiAgICAgPiArDQogICAg
PiAgICAgPiArdmVyc2lvbiAxDQogICAgPiAgICAgDQogICAgPiAgICAgUGVyaGFwcyBpdCB3b3Vs
ZG4ndCBodXJ0IHRvIGluY2x1ZGUgdGhlIGNvbG9ucyBpbiB0aGUgYWN0dWFsIGVudHJpZXMgYXMN
CiAgICA+ICAgICB3ZWxsPyANCiAgICA+IA0KICAgID4gSSBhbSBub3Qgc3VyZSB3aGF0IHlvdSBt
ZWFuLCB3aGljaCBjb2xvbnM/IEFyZSB5b3Ugc2F5aW5nLCB0aGUgZm9ybWF0IHNob3VsZCBiZQ0K
ICAgID4gdmVyc2lvbjogMQ0KICAgID4gcmVwbzogLi4uDQogICAgDQogICAgWWVzLiBUaGlzIHdv
dWxkIG1ha2UgaXQgZXZlbiBtb3JlIHByb21pbmVudCB0aGF0IHRoZXNlIGFyZSB0YWdzIG9mDQog
ICAgc29tZSBzb3J0LiBCdXQgdGhpcyB3YXMgb25seSBhIHRob3VnaHQgb2YgbWluZSwgaXQncyBp
biBubyB3YXkgbWVhbnQNCiAgICB0byBiZSBhIHJlcXVpcmVtZW50IEkgaGF2ZS4NCiAgICANCiAg
ICA+IEkgdGhpbmsgdGhlIGNvbmZ1c2lvbiBjb21lcyBiZWNhdXNlIEkgdXNlZCBjb2xvbnMgYWZ0
ZXIgc3RhdGVtZW50cyBpbiB0aGUgDQogICAgPiBjb21tZW50cy4gDQogICAgDQogICAgUmlnaHQs
IHRoYXQncyBob3cgSSBnb3QgdGhlcmUuDQogICAgDQogICAgPiBJIHRoaW5rIHRoYXQgInZlcnNp
b246IDEiIGlzIHNsaWdodGx5IG1vcmUgaHVtYW4tcmVhZGFibGUsIHNvIEkgd291bGQgYmUgT0sg
DQogICAgPiB3aXRoIHRoYXQNCiAgICANCiAgICBBIHdlbGwgZGVmaW5lZCBub24tYmxhbmsgc2Vw
YXJhdG9yIGFsc28gYWxsb3dzIG1hY2hpbmUgcHJvY2Vzc2luZw0KICAgIHRvIG5vdGljZSBtb3Jl
IGVhc2lseSBpZiB0aGVyZSdzIGEgbWFsZm9ybWVkIGxpbmUuIFBsdXMgKGlmIG5lZWQgYmUpDQog
ICAgaXQgd291bGQgcGVybWl0IHRhZ3Mgd2l0aCBibGFua3MgaW4gdGhlaXIgbmFtZXMuDQogICAg
DQpJIGNhbiBkbyB0aGF0LiBObyBwcm9ibGVtLg0KDQpBbnkgb3RoZXIgY29tbWVudHMgZnJvbSBh
bnlvbmUsIGJlZm9yZSBzZW5kaW5nIHZlcnNpb24gMj8NCg0KTGFycyAgICANCiAgICANCg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
