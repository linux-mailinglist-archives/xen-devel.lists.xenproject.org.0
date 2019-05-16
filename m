Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA25620BB8
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 17:57:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRIiB-0005zf-BV; Thu, 16 May 2019 15:54:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JKB0=TQ=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1hRIiA-0005za-3r
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 15:54:26 +0000
X-Inumbo-ID: e05bad7f-77f2-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e05bad7f-77f2-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 15:54:24 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=SoftFail smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa2.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: p2c+zIafWwydrReOEyFGFOfR0Ql9I1H4wb4Hklt1K4fCfeDI+IMdPwZv66n2cIiduvCCtG88IV
 0j/3029MseGWoA+ZNuhmA5jARzMjiEBtHspa/UvXelFfXedEhnZgIQKdOI8UkcAJmz4B6mCVHw
 /jSv4hntpl58OBNnd0SHmyFL63d3B/AwVFUwMTG/wDFHTLR+m3gHGtuyymvXvNwBWO/i9W0Uj3
 A8Q+7ENfQ3FWQYYNiReguu6quy8H8sHwWgDleBulVUmGHypFEXKuaOEJ0I1Jf8H4Ph/CaFLFsW
 ZQ0=
X-SBRS: 2.7
X-MesageID: 525311
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,477,1549947600"; 
   d="scan'208";a="525311"
From: Lars Kurth <lars.kurth@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH] Add TRACKING.IMPORTS to xen.git to more easily manage
 imported files that need to be kept in sync with an upstream
Thread-Index: AQHVC2w8yCFJJzKGGki86dw3YKFbFqZtcP2A///xTIA=
Date: Thu, 16 May 2019 15:54:20 +0000
Message-ID: <530E0649-256F-4A11-B887-E665B3C92979@citrix.com>
References: <0648312f1c78e519142ff1829a984e7e965bf3c7.1557957269.git.lars.kurth@citrix.com>
 <5CDD3FA1020000780022F903@prv1-mh.provo.novell.com>
In-Reply-To: <5CDD3FA1020000780022F903@prv1-mh.provo.novell.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.a.190512
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <36AF11B839B5C646AC951F55B9B50E38@citrix.com>
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
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDE2LzA1LzIwMTksIDA0OjQ3LCAiSmFuIEJldWxpY2giIDxKQmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQoNCiAgICA+Pj4gT24gMTYuMDUuMTkgYXQgMDA6MTgsIDxsYXJzLmt1cnRo
QGNpdHJpeC5jb20+IHdyb3RlOg0KICAgID4gKyMgTWFwcGluZ3MgdG8gdHJhY2sgZmlsZXMgYXJl
IG9mIHRoZSBmb2xsb3dpbmcgZm9ybWF0DQogICAgPiArIyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCiAgICA+ICsjIG1hbnVhbHxhdXRvIHhlbi1m
aWxlIG5hbWUtb2Ytb3JpZ2luYWwtcmVwbyBvcmlnaW5hbC1maWxlIGNvbW1pdC1pZA0KICAgID4g
KyMNCiAgICA+ICsjIGF1dG86DQogICAgPiArIyAgIFRoZSB4ZW4tZmlsZSBuZWVkcyB0byB0cmFj
ayB0aGUgdGhlIG9yaWdpbmFsLWZpbGUgZXhhY3RseQ0KICAgID4gKyMgICBJbiBvdGhlciB3b3Jk
cywgd2UgY2FuIGF1dG9tYXRpY2FsbHkgdXBkYXRlIHRoZSBmaWxlIHVzaW5nIGEgc2NyaXB0DQog
ICAgDQogICAgRG8gd2UgaGF2ZSBfYW55XyBleGFtcGxlIG9mIHRoaXM/IEkgY2FuJ3QgZXZlbiBp
bWFnaW5lIG9uZSwgZHVlDQogICAgdG8gZS5nLiBvdXIgaW5jbHVkZXMgYWxsIHN0YXJ0aW5nIHdp
dGggeGVuLyB3aGVyZWFzIExpbnV4J2VzIChqdXN0IHRvDQogICAgdGFrZSBhcyBleGFtcGxlKSBh
bGwgc3RhcnQgd2l0aCBsaW51eC8uIFBlcmhhcHMgImF1dG8iIG5lZWRzIHRvDQogICAgaW5jbHVk
ZSBzZWQgZXhwcmVzc2lvbnMgdGhhdCBuZWVkIHRvIGJlIGFwcGxpZWQgYmVmb3JlIGFjdHVhbGx5
DQogICAgYXBwbHlpbmcgdGhlIG9yaWdpbmFsIGNoYW5nZSB0byBvdXIgdHJlZT8NCg0KSSBhbSBu
b3Qgc3VyZSBJIGZ1bGx5IHVuZGVyc3RhbmQgeW91ciBjb25jZXJuLiANClRoaXMgd2FzIGludGVu
ZGVkIGZvciB0aGUgY2FzZSB3aGVyZSBzYXkgd2Ugd291bGQgZXhhY3RseSB0cmFjayB4ZW4vLi4u
L2Zvby5iYXIgd2l0aCBsaW51eC8uLi4vZm9vLmJhcg0KSW4gb3RoZXIgd29yZHMsIGF1dG8gb25s
eSBhcHBsaWVzIHRvIHRoZSBjb250ZW50IG9mIGEgZmlsZTogdGhlIGZpbGVuYW1lIGlzbid0IHJl
bGV2YW50LCBiZWNhdXNlIGFsbCB0aGUgaW5mb3JtYXRpb24gdGhhdCB3b3VsZCBiZSBuZWVkZWQg
dG8gZG8gdGhpcyBpcyBpbiB0aGUgZmlsZS4NCg0KQnV0IGlmIHRoZXJlIGlzIG5vIG5lZWQgZm9y
IGl0LCB3ZSBjYW4gZHJvcCBpdC4gQW5kIGlmIG5lZWRlZCwgd2UgY2FuIGFkZCBpbiBmdXR1cmUu
DQpASnVsaWVuLCBAU3RlZmFubywgQEphbjogYXJlIGFueSBvZiB0aGUgZmlsZXMgeW91IGxpc3Rl
ZCBmYWxsIGludG8gdGhlICJzaG91bGQgYmUgdHJhY2tlZCBleGFjdGx5IiBjYXRlZ29yeT8NCiAg
ICANCiAgICA+ICsjIG1hbnVhbDoNCiAgICA+ICsjICAgQSBkZXZlbG9wZXIgbmVlZHMgdG8gbWFr
ZSBhIGRlY2lzaW9uIHdoZXRoZXIgYQ0KICAgID4gKyMgICBzcGVjaWZpYyBjaGFuZ2UgaXMgYXBw
bGllZCBvciBpZ25vcmVkIGFuZCB1cGRhdGUgdGhlIGxhc3QgY29tbWl0IGlkDQogICAgPiArIyAg
IGFjY29yZGluZ2x5DQogICAgPiArIw0KICAgID4gKyMgbmFtZS1vZi1vcmlnaW5hbC1yZXBvOg0K
ICAgID4gKyMgICBBIHJlZmVyZW5jZSB0byBhIHNvdXJjZSByZXBvc2l0b3J5IGRlZmluZWQgYnkg
KnJlcG8qIGtleXdvcmQNCiAgICA+ICsjDQogICAgPiArIyBjb21taXQgaWQ6DQogICAgPiArIyAg
IExhc3QgY29tbWl0IGlkIG9mIHNvdXJjZSBmaWxlIHRoYXQgd2FzIGRlZW1lZCB0byBiZSBvaw0K
ICAgID4gKyMgICBhbmQgZWl0aGVyIGltcG9ydGVkIGludG8gdGhlIHRyZWUgb3IgcmVqZWN0ZWQN
CiAgICA+ICsjDQogICAgPiArIyBGb3IgZXhhbXBsZToNCiAgICA+ICsjICAgbWFudWFsIHhlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LmMgbGludXgtdG9ydmFsZHMgbGludXgvZHJpdmVy
cy9pb21tdS9hcm0tc21tdS5jIGI3N2NmMTFmMDk0MTM2DQogICAgPiArDQogICAgPiArdmVyc2lv
biAxDQogICAgDQogICAgUGVyaGFwcyBpdCB3b3VsZG4ndCBodXJ0IHRvIGluY2x1ZGUgdGhlIGNv
bG9ucyBpbiB0aGUgYWN0dWFsIGVudHJpZXMgYXMNCiAgICB3ZWxsPyANCg0KSSBhbSBub3Qgc3Vy
ZSB3aGF0IHlvdSBtZWFuLCB3aGljaCBjb2xvbnM/IEFyZSB5b3Ugc2F5aW5nLCB0aGUgZm9ybWF0
IHNob3VsZCBiZQ0KdmVyc2lvbjogMQ0KcmVwbzogLi4uDQoNCkkgdGhpbmsgdGhlIGNvbmZ1c2lv
biBjb21lcyBiZWNhdXNlIEkgdXNlZCBjb2xvbnMgYWZ0ZXIgc3RhdGVtZW50cyBpbiB0aGUgY29t
bWVudHMuIA0KSSB0aGluayB0aGF0ICJ2ZXJzaW9uOiAxIiBpcyBzbGlnaHRseSBtb3JlIGh1bWFu
LXJlYWRhYmxlLCBzbyBJIHdvdWxkIGJlIE9LIHdpdGggdGhhdA0KDQogICAgSSBhbHNvIGRvbid0
IHRoaW5rIGV4YW1wbGVzIGFyZSBuZWVkZWQgb25jZSB3ZSBnZXQgdGhlIGZpcnN0DQogICAgcmVh
bCBlbnRyaWVzLiBIZW5jZSBJJ2QgbW92ZSB0aGVtIHRvIHRoZSBjb21taXQgbWVzc2FnZSBvciBh
DQogICAgcG9zdC1jb21taXQgbWVzc2FnZSByZW1hcmsuDQoNCkFncmVlZC4NCg0KTGFycw0KDQoN
CiAgICANCiAgICANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
