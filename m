Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08561852AB
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 20:07:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvQI8-0005Fo-Ul; Wed, 07 Aug 2019 18:04:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rYLR=WD=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1hvQI6-0005Fi-Sc
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 18:04:02 +0000
X-Inumbo-ID: bb690f94-b93d-11e9-9738-0f91b6455c8c
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bb690f94-b93d-11e9-9738-0f91b6455c8c;
 Wed, 07 Aug 2019 18:04:00 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +YM50PoDWh7dTyj6MD8govCasvFqRFC1rRJD/Ryf0Q0hrImfahr3QQ9ErAItsuHTpXY+fGmEv6
 emXb5qJA5W5LkutqRHnRrHgofcAwzWqYCagV5AxN0DcT56BQ1BBtpkGjrNUr9qSRX/4k9jzugy
 t17RNMMzJcMoY79HfbmJKecnLm8oMWCB/tdH/S1JliOb5zarK4U4nDLIxuCp4Zwr/rviEoWXKH
 07sHmoXQUJup2enwBdZQcFd2KkpoQJWMcV0LUUNCeMIEB0tu8IFXUXqmPuK6KGi1Duan8+bXj9
 Oak=
X-SBRS: 2.7
X-MesageID: 4172313
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,358,1559534400"; 
   d="scan'208";a="4172313"
From: Lars Kurth <lars.kurth@citrix.com>
To: Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>
Thread-Topic: [RFC] Re-working the patch submission guide
Thread-Index: AQHVSSOEZYGRU/jgzkCxBUMn3iC9Oqbn0AoA///hJwCAAABwAIAAGcwAgAT90wCAAyiqAA==
Date: Wed, 7 Aug 2019 18:03:56 +0000
Message-ID: <226B5CF5-704E-461A-A0DA-CF3DFEC86B9D@citrix.com>
References: <591E728E-F69D-46DB-88C2-3B47C4115644@citrix.com>
 <0d2ead7a-ad33-63c7-3749-dff571cb5296@suse.com>
 <b72cded3-5cdd-38db-b607-fbf98614ead5@arm.com>
 <a4b8c295-64aa-c4a1-acf0-8126c3094495@arm.com>
 <49846645-1D5F-463D-B699-05A9E242885C@citrix.com>
 <B5A8E35E-15F4-4997-B39E-896026FF5A90@citrix.com>
In-Reply-To: <B5A8E35E-15F4-4997-B39E-896026FF5A90@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.c.190715
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <D1E24F70D1DF884C8218080BB4EF0C72@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [RFC] Re-working the patch submission guide
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Viktor Mitin <viktor.mitin.19@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQpPbiAwNS8wOC8yMDE5LCAxODo0OSwgIkxhcnMgS3VydGgiIDxsYXJzLmt1cnRoQGNpdHJpeC5j
b20+IHdyb3RlOg0KICAgIA0KICAgIE9uIDAyLzA4LzIwMTksIDE0OjM2LCAiTGFycyBLdXJ0aCIg
PGxhcnMua3VydGhAY2l0cml4LmNvbT4gd3JvdGU6DQogICAgICAgIA0KICAgICAgICBPbiAwMi8w
OC8yMDE5LCAxNDowMywgIkp1bGllbiBHcmFsbCIgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90
ZToNCiAgICAgICAgDQogICAgICAgICAgICANCiAgICAgICAgICAgIA0KICAgICAgICAgICAgT24g
MDIvMDgvMjAxOSAxNDowMiwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KICAgICAgICAgICAgPiBIaSBK
YW4sDQogICAgICAgICAgICA+IA0KICAgICAgICAgICAgPiBPbiAwMi8wOC8yMDE5IDEzOjUyLCBK
YW4gQmV1bGljaCB3cm90ZToNCiAgICAgICAgICAgID4+IE9uIDAyLjA4LjIwMTkgMTM6MTQsIExh
cnMgS3VydGggd3JvdGU6DQogICAgICAgICAgICA+Pj4+IDEuNS40IFNlbmRpbmcgUGF0Y2hlcyBN
YW51YWxseQ0KICAgICAgICAgICAgPj4+IFRoaXMgc2hvdWxkIGJlIHJlbW92ZWQgb3Igc3RhdGUg
Tk9UIFRPIERPIHRoaXMNCiAgICAgICAgICAgID4+DQogICAgICAgICAgICA+PiBQbGVhc2UgZG9u
J3QuIEknbSBub3QgbWVhbmluZyB0byBzdGFydCB1c2luZyBnaXQgZm9yIHBhdGNoIHN1Ym1pc3Np
b24NCiAgICAgICAgICAgID4+IGFueSB0aW1lIHNvb24gKGlmIGV2ZXIpLCBhbmQgSSBkb24ndCBz
ZWUgd2h5IHRoaXMgc2hvdWxkIGJlIGENCiAgICAgICAgICAgID4+IHJlcXVpcmVtZW50Lg0KICAg
ICAgICAgICAgPiBXZWxsLCBzb21lb25lIHVzaW5nIHRoaXMgaXMgbGlrZWx5IHRvIG1lc3MgaXQg
dXAuIFNvIEkgYWdyZWUgd2l0aCBMYXJzIGFuZCB0aGlzIA0KICAgICAgICAgICAgPiBzaG91bGQg
YXQgbGVhc3QgZGlzYWdyZWUgYW5kIGRpc2NvdXJhZ2UgdG8gdXNlIGl0Lg0KICAgICAgICAgICAg
DQogICAgICAgICAgICBzL2Rpc2FncmVlL2JlIHJlbW92ZWQvDQogICAgICAgICAgICANCiAgICAg
ICAgT0suIFRoYXQgc2VlbXMgdG8gYmUgYWdyZWVkLiBUaGUgaW50ZW50aW9uIG9mIHJlbW92aW5n
IGl0IGlzIHRvIGVuY291cmFnZSBuZXdjb21lcnMgdG8gdXNlIHRoZSB0b29scyB3ZSBoYXZlIGFu
ZCB3aGljaCB3ZSBrbm93IHdvcmsuDQogICAgICAgIA0KICAgICAgICBBbnkgb3RoZXIgZ2VuZXJh
bCBmZWVkYmFjayBvbiBob3cgSSBhbSBwbGFubmluZyB0byBhcHByb2FjaCB0aGlzPw0KICAgICAg
ICANCiAgICAgICAgSW4gZXNzZW5jZSwgd2Ugd2lsbCBlbmQgdXAgd2l0aCANCiAgICAgICAgKiBX
aGF0J3MgaW4gYSBwYXRjaCBzZXJpZXMvcGF0Y2ggIC0gdGVybWlub2xvZ3kgYW5kIG91ciBleHBl
Y3RhdGlvbnMNCiAgICAgICAgICAgLSBQb3NzaWJseSB3aXRoIGEgbGluayB0byBzb21lIGJlc3Qg
cHJhY3RpY2VzIGFuZCB0b29scyBmb3IgcGxhbm5pbmcgZm9yIG11bHRpcGxlIHZlcnNpb25zIChi
dXQgc2hvdWxkIG5vdCBiZSBwYXJ0IG9mIHRoZSBkb2MgaXRzZWxmKQ0KICAgICAgICAgICAtIExv
bmdlciB0ZXJtIGl0IHdvdWxkIGJlIG5pY2UgdG8gZ2V0IHRvIHNvbWV0aGluZyBsaWtlOiBodHRw
czovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL3Y0LjE3L3Byb2Nlc3MvZGV2ZWxvcG1lbnQtcHJv
Y2Vzcy5odG1sIC0gVEJIIEkgZG9uJ3QgbGlrZSB0aGUgZG9jIG90c2VsZiB2ZXJ5IG11Y2gsIGJ1
dCBpdCBoYXMgc29tZSBnb29kIHRvcGljcyBpbiBpdCB3aGljaCB3ZSBzaG91bGQgY292ZXINCiAg
ICAgICAgKiBUaGUgdG9vbGluZyBtZWNoYW5pY3MgZm9yIGEgc2luZ2xlIHBhdGNoOiBzZXQtdXAg
YW5kIHN0ZXBzIHVzaW5nIGdldF9tYWludGFpbmVycy5wbCANCiAgICAgICAgKiBGb2xsb3ctdXA6
IG11bHRpcGxlIHZlcnNpb25zLCBjaGVja2luZyB3aGVuIHN0dWZmIGhhcyBnb25lIGluLCAuLi4g
DQogICAgICAgICogU3BlY2lmaWNzIGZvciBRRU1VLCAuLi4NCiAgICAgICAgDQogICAgSGkgYWxs
LCBJIHB1dCB0b2dldGhlciBhIGRyYWZ0IGluIGh0dHBzOi8vZG9jcy5nb29nbGUuY29tL2RvY3Vt
ZW50L2QvMWpNc1NfdDR6b0ZTc0l3WmpJbXdJQXhWQ3BiTm9oUWJndThYMVM0UUVJcTgvZWRpdD91
c3A9c2hhcmluZyAoYWxzbyBhdHRhY2hlZCBhcyBQREYpIHdoaWNoIHNob3dzIHRoZSBjaGFuZ2Vz
IHRvIHRoZSBvcmlnaW5hbCB3aWtpIHBhZ2UgYXQgaHR0cHM6Ly93aWtpLnhlbnByb2plY3Qub3Jn
L3dpa2kvU3VibWl0dGluZ19YZW5fUHJvamVjdF9QYXRjaGVzIA0KICAgIA0KICAgIFRoZXJlIGFy
ZSBzb21lIHByb2JsZW1zIGluIHRoZSAiQnJlYWsgZG93biB5b3VyIHBhdGNoZXMgYXBwcm9wcmlh
dGVseSIgc2VjdGlvbiBhbmQgbWFpbnRhaW5lciBpbnB1dC9ndWlkYW5jZSB3b3VsZCBiZSBnb29k
LiBJIGFsc28gYWRkZWQgc29tZSBub3RlcyBvbiB3aGF0IHNob3VsZCBiZSBpbiBhIGNvdmVyIGxl
dHRlciwgYnV0IGFnYWluIHRoaXMgaXMganVzdCBhIHN0YXJ0aW5nIHBvaW50IGFuZCBhZ2FpbiBt
YWludGFpbmVyIGlucHV0L2d1aWRhbmNlIHdvdWxkIGJlIGdvb2QuDQogICAgDQogICAgVGhlIEdv
b2dsZSBkb2NzIFVSTCBhbGxvd3MgY29tbWVudGluZy4gIElmIHlvdSBjb21tZW50LCBwbGVhc2Ug
bG9nIGluIHdpdGggYW4gSUQgYW5kL29yIHN0YXRlIGEgbmFtZSwgc3VjaCB0aGF0IEkgY2FuIGZv
bGxvdyB1cCBpbiBjYXNlIG9mIHF1ZXN0aW9ucy4NCiAgICAgICANCiAgICBJIHdpbGwgd2FpdCB1
bnRpbCBuZXh0IHdlZWsgYmVmb3JlIGVuY29kaW5nIHRoaXMgb24gdGhlIHdpa2kgYW5kIGFzIGEg
c2Vjb25kIHN0ZXAsIEkgd2lsbCBzdWJtaXQgcGF0Y2hlcyB0byB0aGUgc3BoaW54IGRvY3MuIA0K
ICAgIA0KICAgIFJlZ2FyZHMNCiAgICBMYXJzDQogICAgDQpIaSBhbGwsDQoNCkkgZ2F2ZSB0aGlz
IGEgbWFqb3IgcmUtd29yayBiYXNlZCBvbiB5b3VyIGZlZWRiYWNrDQoNClRoZSBvdXRwdXQgY2Fu
IGJlIGZvdW5kIGF0IGh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL1N1Ym1pdHRpbmdf
WGVuX1Byb2plY3RfUGF0Y2hlcyBhbmQgaHR0cHM6Ly93aWtpLnhlbnByb2plY3Qub3JnL3dpa2kv
TWFuYWdpbmdfWGVuX1BhdGNoZXNfd2l0aF9HaXQgDQoNClRoZSBvbmx5IGFyZWFzIHdoaWNoIEkg
dGhpbmsgbmVlZCBpbXByb3ZlbWVudHMgYXJlDQoqIE1heWJlIGEgZ29vZCBleGFtcGxlIG9mIGEg
Y292ZXIgbGV0dGVyICAtIHN1Z2dlc3Rpb25zIHdlbGNvbWUNCiogQSBzZWN0aW9uIHVuZGVyIENv
ZGUgcmV2aWV3IGFyb3VuZCB3aGVuIHlvdSBrbm93IHlvdSBhcmUgZ2V0dGluZyBjbG9zZSB0byB0
aGUgZW5kOiBha2EgdHJhY2tpbmcgQUNLcyANCiogSG93IHRvIGtub3cgd2hlbiBhIHBhdGNoIGhh
cyBiZWVuIGNvbW1pdHRlZCAtIHNob3VsZCByZWZlciB0byBwYXRjaHdvcmssIHBhdGNoZXcsIC4u
LiANCg0KRmVlZGJhY2sgb3IgZWRpdHMgYXJlIHdlbGNvbWUgICAgDQoNCkJlc3QgUmVnYXJkcw0K
TGFycw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
