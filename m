Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 987874D041
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2019 16:21:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdxtJ-0000Pg-2L; Thu, 20 Jun 2019 14:18:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bhTV=UT=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1hdxtH-0000Pb-Kc
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2019 14:18:15 +0000
X-Inumbo-ID: 3b882960-9366-11e9-89ee-73f25a774871
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b882960-9366-11e9-89ee-73f25a774871;
 Thu, 20 Jun 2019 14:18:11 +0000 (UTC)
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
IronPort-SDR: eeHmCPwQYogPlH9r70izoPsaMg1TrvKEJSVZVGiGr2U8EWtYzCrjnWd0LbHq7wu2XZ+szIbMB+
 I3dp1Yip6Gw2siPfKMzBsXFI+G46Sh4boGMEv2NehJzimtBRPTxqnMM6xhpjJweZkbpdULgVkb
 fRn2wd8VydL3On29w/Pz+QVMhFRwC2SgePN1mU6h2ZqD3mQNpogbhWyx/5e5d+6MbShLYndFWD
 CvIITZ1rsnJlaq46oQ3B0LOJ+iNJT4G/SJlpNMtzgdztyAwdPwo18cb1BcakGjMMw/4NflXwUr
 648=
X-SBRS: 2.7
X-MesageID: 2017763
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,397,1557201600"; 
   d="scan'208";a="2017763"
From: Lars Kurth <lars.kurth@citrix.com>
To: Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH v3] Add TRACKING.IMPORTS to xen.git to more easily manage
 imported files that need to be kept in sync with an upstream
Thread-Index: AQHVElhW7iPUPZ7iREGo8RmthMIcN6Z+mlKAgCYWLgA=
Date: Thu, 20 Jun 2019 14:18:06 +0000
Message-ID: <EFBDC501-4BF5-49FA-B313-111DBF30CE9C@citrix.com>
References: <6250372b05e95412cfd0f8e6f558f2376c4f3d94.1558719481.git.lars.kurth@citrix.com>
 <5CEBB0A30200007800232BBE@prv1-mh.provo.novell.com>
In-Reply-To: <5CEBB0A30200007800232BBE@prv1-mh.provo.novell.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.b.190609
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <86BA51F8BFA77C49886BEBFEA05C7344@citrix.com>
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
Cc: Wei Liu <wei.liu2@citrix.com>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDI3LzA1LzIwMTksIDEwOjQxLCAiSmFuIEJldWxpY2giIDxKQmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQoNCiAgICA+Pj4gT24gMjQuMDUuMTkgYXQgMTk6NDQsIDxsYXJzLmt1cnRo
QGNpdHJpeC5jb20+IHdyb3RlOg0KICAgID4gRm9sbG93aW5nIHRoZSByZWNlbnQgZGlzY3Vzc2lv
biwgd2UgaGFkIG9uIElSQyBhbmQgdGhlIGFjdGlvbiBJIGhhZCBpbiANCiAgICA+IHRoZSBNYXJj
aCBjb21tdW5pdHkgY2FsbCwgdGhpcyBmaWxlIHByb3ZpZGVzIGEgZmlsZSBmb3JtYXQgdGhhdCAN
CiAgICA+IGVuYWJsZXMgd3JpdGluZyBhbiBhdXRvbWF0ZWQgdGVzdCB0byBjaGVjayB3aGV0aGVy
IGZpbGVzIGFyZSBvdXQgb2Ygc3luYy4gDQogICAgPiANCiAgICA+IEFuIGV4YW1wbGUsIHdoYXQg
ZmlsZSBjb250ZW50IG1heSBsb29rIGxpa2UgaXMgZW1iZWRkZWQgYmVsb3cNCiAgICA+IHJlcG86
IGxpbnV4LXRvcnZhbGRzIGdpdCANCiAgICA+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3Nj
bS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdCANCiAgICA+IGZpbGU6IHhlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LmMgbGludXgtdG9ydmFsZHMgDQogICAgPiBsaW51
eC9kcml2ZXJzL2lvbW11L2FybS1zbW11LmMgYjc3Y2YxMWYwOTQxMzYNCiAgICA+IA0KICAgID4g
T25jZSB0aGUgZmlsZSBmb3JtYXQgaXMgYWdyZWUsIEkgd2lsbCB3cml0ZSBhIHRlc3Qgb3Igc2Ny
aXB0Lg0KICAgID4gDQogICAgPiBJIGFsc28gbmVlZCBzb21lIG1vcmUgY29ycmVjdCB0ZXN0IGRh
dGEsIGFrYSBlbnRyaWVzIGluIHRoZSBmaWxlIGZyb20NCiAgICA+IGNvbW1pdHRlcnMgbG9va2lu
ZyBhZnRlciB0aGUgZm9sbG93aW5nIGZpbGVzDQogICAgPiBbSmFuXQ0KICAgID4geGVuL2FyY2gv
eDg2L2NwdS9td2FpdC1pZGxlLmMgDQogICAgPiBbU3RlZmFubywgSnVsaWVuIC0gdGhpcyBoYXMg
dG8gYmUgZmluYWxpemVkXQ0KICAgID4geGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUu
Yw0KICAgID4geGVuL2FyY2gvYXJtL3ZnaWMvKg0KICAgID4geGVuL2luY2x1ZGUvYXNtLWFybS9k
aXY2NC5oDQogICAgPiB4ZW4vZHJpdmVycy9jaGFyL21lc29uLXVhcnQuYw0KICAgID4geGVuL2Fy
Y2gvYXJtL2FybTMyL2xpYi8qDQogICAgPiB4ZW4vYXJjaC9hcm0vYXJtNjQvbGliLyoNCiAgICA+
IHhlbi9hcmNoL2FybS9hcm02NC9jYWNoZS5TDQogICAgPiB4ZW4vYXJjaC9hcm0vYXJtNjQvYnBp
LlMNCiAgICA+IHhlbi9pbmNsdWRlL2FzbS1hcm0vc3lzdGVtLmgNCiAgICA+IHhlbi9hcmNoL2Fy
bS9hcm02NC9pbnNuLmMNCiAgICA+IFtPdGhlcnM/XQ0KICAgID4geGVuL2NvbW1vbi9yYnRyZWUu
Yw0KICAgID4gDQogICAgPiBOb3RlIHRoYXQgaW4gc29tZSBjYXNlcyBMaW51eCBoYXMgZGl2ZXJn
ZWQgYW5kIHNvbWUgTGludXggZmlsZXMgaGF2ZSBkaXNhcHBlYXJlZC4gDQogICAgPiBKdWxpZW4g
YWxzbyByYWlzZWQgdGhlIHBvaW50LCB0aGF0IGluIHNvbWUgY2FzZXMgb25seSBhIHN1YnNldCBv
ZiBjb2RlIGZyb20gDQogICAgPiBMaW51eCBYZW4gZmlsZXMgd2FzIGFwcGxpZWQgb3IgdGhhdCBv
bmx5IHNvbWUgZnVuY3Rpb25zIGdldCBtb3ZlZCBhY3Jvc3MgdG8gDQogICAgPiBYZW4uDQogICAg
PiANCiAgICA+IEkgYmVsaWV2ZSB0aGF0IGlzIGVudGlyZWx5IE9LLiBUaGUgd29ya2Zsb3cgd291
bGQgYmUgaW4gbW9zdCBjYXNlcyB0aGF0Og0KICAgID4gLSBXZSB1c2UgYSBMaW51eCAoc291cmNl
KSBjb21taXQgYXMgYSBiZW5jaG1hcmsgYW5kIHJlY29yZCB0aGUgY29tbWl0IElEDQogICAgPiAt
IElmIHRoZXJlIGlzIGEgY2hhbmdlIGluIExpbnV4IHRoZSB0ZXN0IHdpbGwgZmFpbA0KICAgID4g
LSBUaGUgY29tbWl0dGVyIGxvb2tzIGF0IHRoZSBkaWZmIGFuZCBlaXRoZXINCiAgICA+ICAgLSBE
ZWNpZGVzIHRvIGlnbm9yZSBpdCBhbmQgYnVtcHMgdGhlIGNvbW1pdCBJRCBpbiB0aGlzIGZpbGUN
CiAgICA+ICAgLSBEZWNpZGVzIHRoZSBjaGFuZ2UgaXMgbmVlZGVkLCBpbnRlZ3JhdGVzIGl0IGlu
dG8gWGVuIGFuZCB0aGVuIA0KICAgID4gICAgIGJ1bXBzIHRoZSBjb21taXQgSUQgaW4gdGhpcyBm
aWxlDQogICAgDQogICAgV2l0aCB0aGlzIC4uLg0KICAgIA0KICAgID4gQ2hhbmdlcyBzaW5jZSB2
MQ0KICAgID4gKiBSZXF1aXJlIGEgY29sb24gYWZ0ZXIgcmVwbzosIGZpbGU6LCAuLi4ga2V5d29y
ZHMNCiAgICA+ICogUmVwbGFjZSBtYW51YWw6fGF1dG86IHdpdGggZmlsZTogYXMgdGhlcmUgYXV0
bzogdXNlLWNhc2Ugd2FzIGludmFsaWQNCiAgICA+ICogQWRkZWQgbW9yZSB2ZXJib3NlIGRlc2Ny
aXB0aW9uIG9mIGZvcm1hdA0KICAgID4gDQogICAgPiBDaGFuZ2VzIHNpbmNlIHYyDQogICAgPiAq
IENoYW5nZWQgc29tZSBmb3JtYXR0aW5nDQogICAgPiAqIFJlbW92ZWQgZXhhbXBsZXMNCiAgICA+
ICogUmVtb3ZlZCByZWZlcmVuY2VzIHRvIGh0dHBzDQogICAgDQogICAgLi4uIG1vdmUgcGFzdCB0
aGUgZmlyc3QgLS0tIHNlcGFyYXRvciAuLi4NCiAgICANCiAgICA+IFNpZ25lZC1vZmYtYnk6IExh
cnMgS3VydGggPGxhcnMua3VydGhAY2l0cml4LmNvbT4NCiAgICANCiAgICBBY2tlZC1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KICAgIA0KQXJlIGFueSBleHRyYSBBQ0tzIG5l
ZWRlZD8gIA0KQWxzbywgSSB3b3VsZCBiZSB3aWxsaW5nIHRvIHdyaXRlIGEgc2NyaXB0IHdoaWNo
IGhlbHBzIGNoZWNraW5nIHRoZSBmaWxlLCBidXQgaXQgZG9lcyByZXF1aXJlIHNvbWUgdGVzdCBk
YXRhIChha2EgSmFuLCBKdWxpZW4gYW5kIFN0ZWZhbm8pIHRvIHBvcHVsYXRlIHRoZSBmaWxlDQpS
ZWdhcmRzDQpMYXJzDQogICAgDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
