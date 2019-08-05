Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E0482445
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 19:52:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huh7X-00014H-Nz; Mon, 05 Aug 2019 17:50:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TFeT=WB=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1huh7V-0000yO-N2
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 17:50:05 +0000
X-Inumbo-ID: 73cb004d-b7a9-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 73cb004d-b7a9-11e9-8980-bc764e045a96;
 Mon, 05 Aug 2019 17:50:03 +0000 (UTC)
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
IronPort-SDR: oZzQ3YNbv34LFUc1qheiejMZyML3byPLvNoOsltg09ReGWInsilKVqUZQmJBH50eJkjTPrn99S
 HSmJgJiMG4c3pw4WWgy1PuYoA7jQF5OmiNN+d39zF+uohgdwWUQnDkZCiT7jTV0yPu0PW6MmS7
 07+8oxQMlUzyQGN2QjBIDoEnw2feFmnk1o1WHnoI5JkYtz5IOOH40Acbz8U7UPiG0/e+WG95+n
 TokBzbN+I5f9+4pInxmOVb3GvHRoThbRt/Z1WzsHzC8L52FJuagENnzAuo0POACW2Tgn+4wB4z
 QgY=
X-SBRS: 2.7
X-MesageID: 3877332
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,350,1559534400"; 
   d="scan'208";a="3877332"
From: Lars Kurth <lars.kurth@citrix.com>
To: Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>
Thread-Topic: [RFC] Re-working the patch submission guide
Thread-Index: AQHVSSOEZYGRU/jgzkCxBUMn3iC9Oqbn0AoA///hJwCAAABwAIAAGcwAgAT90wA=
Date: Mon, 5 Aug 2019 17:49:37 +0000
Message-ID: <B5A8E35E-15F4-4997-B39E-896026FF5A90@citrix.com>
References: <591E728E-F69D-46DB-88C2-3B47C4115644@citrix.com>
 <0d2ead7a-ad33-63c7-3749-dff571cb5296@suse.com>
 <b72cded3-5cdd-38db-b607-fbf98614ead5@arm.com>
 <a4b8c295-64aa-c4a1-acf0-8126c3094495@arm.com>
 <49846645-1D5F-463D-B699-05A9E242885C@citrix.com>
In-Reply-To: <49846645-1D5F-463D-B699-05A9E242885C@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.c.190715
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <88F52A3C93559147ADBCA4E9AA33A573@citrix.com>
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

DQoNCu+7v09uIDAyLzA4LzIwMTksIDE0OjM2LCAiTGFycyBLdXJ0aCIgPGxhcnMua3VydGhAY2l0
cml4LmNvbT4gd3JvdGU6DQoNCiAgICANCiAgICANCiAgICBPbiAwMi8wOC8yMDE5LCAxNDowMywg
Ikp1bGllbiBHcmFsbCIgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToNCiAgICANCiAgICAg
ICAgDQogICAgICAgIA0KICAgICAgICBPbiAwMi8wOC8yMDE5IDE0OjAyLCBKdWxpZW4gR3JhbGwg
d3JvdGU6DQogICAgICAgID4gSGkgSmFuLA0KICAgICAgICA+IA0KICAgICAgICA+IE9uIDAyLzA4
LzIwMTkgMTM6NTIsIEphbiBCZXVsaWNoIHdyb3RlOg0KICAgICAgICA+PiBPbiAwMi4wOC4yMDE5
IDEzOjE0LCBMYXJzIEt1cnRoIHdyb3RlOg0KICAgICAgICA+Pj4+IDEuNS40IFNlbmRpbmcgUGF0
Y2hlcyBNYW51YWxseQ0KICAgICAgICA+Pj4gVGhpcyBzaG91bGQgYmUgcmVtb3ZlZCBvciBzdGF0
ZSBOT1QgVE8gRE8gdGhpcw0KICAgICAgICA+Pg0KICAgICAgICA+PiBQbGVhc2UgZG9uJ3QuIEkn
bSBub3QgbWVhbmluZyB0byBzdGFydCB1c2luZyBnaXQgZm9yIHBhdGNoIHN1Ym1pc3Npb24NCiAg
ICAgICAgPj4gYW55IHRpbWUgc29vbiAoaWYgZXZlciksIGFuZCBJIGRvbid0IHNlZSB3aHkgdGhp
cyBzaG91bGQgYmUgYQ0KICAgICAgICA+PiByZXF1aXJlbWVudC4NCiAgICAgICAgPiBXZWxsLCBz
b21lb25lIHVzaW5nIHRoaXMgaXMgbGlrZWx5IHRvIG1lc3MgaXQgdXAuIFNvIEkgYWdyZWUgd2l0
aCBMYXJzIGFuZCB0aGlzIA0KICAgICAgICA+IHNob3VsZCBhdCBsZWFzdCBkaXNhZ3JlZSBhbmQg
ZGlzY291cmFnZSB0byB1c2UgaXQuDQogICAgICAgIA0KICAgICAgICBzL2Rpc2FncmVlL2JlIHJl
bW92ZWQvDQogICAgICAgIA0KICAgIE9LLiBUaGF0IHNlZW1zIHRvIGJlIGFncmVlZC4gVGhlIGlu
dGVudGlvbiBvZiByZW1vdmluZyBpdCBpcyB0byBlbmNvdXJhZ2UgbmV3Y29tZXJzIHRvIHVzZSB0
aGUgdG9vbHMgd2UgaGF2ZSBhbmQgd2hpY2ggd2Uga25vdyB3b3JrLg0KICAgIA0KICAgIEFueSBv
dGhlciBnZW5lcmFsIGZlZWRiYWNrIG9uIGhvdyBJIGFtIHBsYW5uaW5nIHRvIGFwcHJvYWNoIHRo
aXM/DQogICAgDQogICAgSW4gZXNzZW5jZSwgd2Ugd2lsbCBlbmQgdXAgd2l0aCANCiAgICAqIFdo
YXQncyBpbiBhIHBhdGNoIHNlcmllcy9wYXRjaCAgLSB0ZXJtaW5vbG9neSBhbmQgb3VyIGV4cGVj
dGF0aW9ucw0KICAgICAgIC0gUG9zc2libHkgd2l0aCBhIGxpbmsgdG8gc29tZSBiZXN0IHByYWN0
aWNlcyBhbmQgdG9vbHMgZm9yIHBsYW5uaW5nIGZvciBtdWx0aXBsZSB2ZXJzaW9ucyAoYnV0IHNo
b3VsZCBub3QgYmUgcGFydCBvZiB0aGUgZG9jIGl0c2VsZikNCiAgICAgICAtIExvbmdlciB0ZXJt
IGl0IHdvdWxkIGJlIG5pY2UgdG8gZ2V0IHRvIHNvbWV0aGluZyBsaWtlOiBodHRwczovL3d3dy5r
ZXJuZWwub3JnL2RvYy9odG1sL3Y0LjE3L3Byb2Nlc3MvZGV2ZWxvcG1lbnQtcHJvY2Vzcy5odG1s
IC0gVEJIIEkgZG9uJ3QgbGlrZSB0aGUgZG9jIG90c2VsZiB2ZXJ5IG11Y2gsIGJ1dCBpdCBoYXMg
c29tZSBnb29kIHRvcGljcyBpbiBpdCB3aGljaCB3ZSBzaG91bGQgY292ZXINCiAgICAqIFRoZSB0
b29saW5nIG1lY2hhbmljcyBmb3IgYSBzaW5nbGUgcGF0Y2g6IHNldC11cCBhbmQgc3RlcHMgdXNp
bmcgZ2V0X21haW50YWluZXJzLnBsIA0KICAgICogRm9sbG93LXVwOiBtdWx0aXBsZSB2ZXJzaW9u
cywgY2hlY2tpbmcgd2hlbiBzdHVmZiBoYXMgZ29uZSBpbiwgLi4uIA0KICAgICogU3BlY2lmaWNz
IGZvciBRRU1VLCAuLi4NCiAgICANCkhpIGFsbCwgSSBwdXQgdG9nZXRoZXIgYSBkcmFmdCBpbiBo
dHRwczovL2RvY3MuZ29vZ2xlLmNvbS9kb2N1bWVudC9kLzFqTXNTX3Q0em9GU3NJd1pqSW13SUF4
VkNwYk5vaFFiZ3U4WDFTNFFFSXE4L2VkaXQ/dXNwPXNoYXJpbmcgKGFsc28gYXR0YWNoZWQgYXMg
UERGKSB3aGljaCBzaG93cyB0aGUgY2hhbmdlcyB0byB0aGUgb3JpZ2luYWwgd2lraSBwYWdlIGF0
IGh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL1N1Ym1pdHRpbmdfWGVuX1Byb2plY3Rf
UGF0Y2hlcyANCg0KVGhlcmUgYXJlIHNvbWUgcHJvYmxlbXMgaW4gdGhlICJCcmVhayBkb3duIHlv
dXIgcGF0Y2hlcyBhcHByb3ByaWF0ZWx5IiBzZWN0aW9uIGFuZCBtYWludGFpbmVyIGlucHV0L2d1
aWRhbmNlIHdvdWxkIGJlIGdvb2QuIEkgYWxzbyBhZGRlZCBzb21lIG5vdGVzIG9uIHdoYXQgc2hv
dWxkIGJlIGluIGEgY292ZXIgbGV0dGVyLCBidXQgYWdhaW4gdGhpcyBpcyBqdXN0IGEgc3RhcnRp
bmcgcG9pbnQgYW5kIGFnYWluIG1haW50YWluZXIgaW5wdXQvZ3VpZGFuY2Ugd291bGQgYmUgZ29v
ZC4NCg0KVGhlIEdvb2dsZSBkb2NzIFVSTCBhbGxvd3MgY29tbWVudGluZy4gIElmIHlvdSBjb21t
ZW50LCBwbGVhc2UgbG9nIGluIHdpdGggYW4gSUQgYW5kL29yIHN0YXRlIGEgbmFtZSwgc3VjaCB0
aGF0IEkgY2FuIGZvbGxvdyB1cCBpbiBjYXNlIG9mIHF1ZXN0aW9ucy4NCiAgIA0KSSB3aWxsIHdh
aXQgdW50aWwgbmV4dCB3ZWVrIGJlZm9yZSBlbmNvZGluZyB0aGlzIG9uIHRoZSB3aWtpIGFuZCBh
cyBhIHNlY29uZCBzdGVwLCBJIHdpbGwgc3VibWl0IHBhdGNoZXMgdG8gdGhlIHNwaGlueCBkb2Nz
LiANCg0KUmVnYXJkcw0KTGFycw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
