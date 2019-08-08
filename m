Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC3F85B06
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 08:48:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvcAp-00080L-ND; Thu, 08 Aug 2019 06:45:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KK2h=WE=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1hvcAo-00080G-Dj
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 06:45:18 +0000
X-Inumbo-ID: 12e3e3f6-b9a8-11e9-9835-5bf055de6781
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 12e3e3f6-b9a8-11e9-9835-5bf055de6781;
 Thu, 08 Aug 2019 06:45:13 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: nc5IVp/0X6xp+t489nwZc4bNwmXnum4rnV6G1SqwUEVcUVTpvmgWTtSvR+0hh5247yCrpmlYv9
 0pAvMrD01sP8YQz3DSWZzeGXr2ftVkc/BKl5mBZFLKXxge7w3TgjD1tN5EyF+iFFpJkmhOb7gW
 Ca0ksk3EywHLyPOVMTegePghOVCWDGS8FKe40lzJbnfChVYjpfzoJir2JTu48Qf5FE3E4LTVve
 ClWxjk27DZMrlBFxiULQdRodqe+m4u3sVJLCtnd7RkA41Km1hhXN7V2EFxJd3GsiqGInWsaVq2
 ybQ=
X-SBRS: 2.7
X-MesageID: 4023463
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,360,1559534400"; 
   d="scan'208";a="4023463"
From: Lars Kurth <lars.kurth@citrix.com>
To: Viktor Mitin <viktor.mitin.19@gmail.com>
Thread-Topic: [RFC] Re-working the patch submission guide
Thread-Index: AQHVSSOEZYGRU/jgzkCxBUMn3iC9Oqbn0AoA///hJwCAAABwAIAAGcwAgAT90wCAAyiqAP//+XaAgADbNIA=
Date: Thu, 8 Aug 2019 06:45:09 +0000
Message-ID: <7F24BEB4-B9CD-4020-BC40-6918123840E6@citrix.com>
References: <591E728E-F69D-46DB-88C2-3B47C4115644@citrix.com>
 <0d2ead7a-ad33-63c7-3749-dff571cb5296@suse.com>
 <b72cded3-5cdd-38db-b607-fbf98614ead5@arm.com>
 <a4b8c295-64aa-c4a1-acf0-8126c3094495@arm.com>
 <49846645-1D5F-463D-B699-05A9E242885C@citrix.com>
 <B5A8E35E-15F4-4997-B39E-896026FF5A90@citrix.com>
 <226B5CF5-704E-461A-A0DA-CF3DFEC86B9D@citrix.com>
 <CAOcoXZbC8BONGUgEOmWQN+5ZnSKa40xu6LNk7gWoE5Qs5Ed5=Q@mail.gmail.com>
In-Reply-To: <CAOcoXZbC8BONGUgEOmWQN+5ZnSKa40xu6LNk7gWoE5Qs5Ed5=Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.c.190715
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <5E4C63F839B4444AB6D708F696AC98A1@citrix.com>
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
 Julien Grall <julien.grall@arm.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDA3LzA4LzIwMTksIDE5OjQwLCAiVmlrdG9yIE1pdGluIiA8dmlrdG9yLm1pdGlu
LjE5QGdtYWlsLmNvbT4gd3JvdGU6DQoNCiAgICBPbiBXZWQsIEF1ZyA3LCAyMDE5IGF0IDk6MDQg
UE0gTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPiB3cm90ZToNCiAgICA+DQogICAg
Pg0KICAgID4gT24gMDUvMDgvMjAxOSwgMTg6NDksICJMYXJzIEt1cnRoIiA8bGFycy5rdXJ0aEBj
aXRyaXguY29tPiB3cm90ZToNCiAgICA+DQogICAgPiAgICAgT24gMDIvMDgvMjAxOSwgMTQ6MzYs
ICJMYXJzIEt1cnRoIiA8bGFycy5rdXJ0aEBjaXRyaXguY29tPiB3cm90ZToNCiAgICA+DQogICAg
PiAgICAgICAgIE9uIDAyLzA4LzIwMTksIDE0OjAzLCAiSnVsaWVuIEdyYWxsIiA8anVsaWVuLmdy
YWxsQGFybS5jb20+IHdyb3RlOg0KICAgID4NCiAgICA+DQogICAgPg0KICAgID4gICAgICAgICAg
ICAgT24gMDIvMDgvMjAxOSAxNDowMiwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KICAgID4gICAgICAg
ICAgICAgPiBIaSBKYW4sDQogICAgPiAgICAgICAgICAgICA+DQogICAgPiAgICAgICAgICAgICA+
IE9uIDAyLzA4LzIwMTkgMTM6NTIsIEphbiBCZXVsaWNoIHdyb3RlOg0KICAgID4gICAgICAgICAg
ICAgPj4gT24gMDIuMDguMjAxOSAxMzoxNCwgTGFycyBLdXJ0aCB3cm90ZToNCiAgICA+ICAgICAg
ICAgICAgID4+Pj4gMS41LjQgU2VuZGluZyBQYXRjaGVzIE1hbnVhbGx5DQogICAgPiAgICAgICAg
ICAgICA+Pj4gVGhpcyBzaG91bGQgYmUgcmVtb3ZlZCBvciBzdGF0ZSBOT1QgVE8gRE8gdGhpcw0K
ICAgID4gICAgICAgICAgICAgPj4NCiAgICA+ICAgICAgICAgICAgID4+IFBsZWFzZSBkb24ndC4g
SSdtIG5vdCBtZWFuaW5nIHRvIHN0YXJ0IHVzaW5nIGdpdCBmb3IgcGF0Y2ggc3VibWlzc2lvbg0K
ICAgID4gICAgICAgICAgICAgPj4gYW55IHRpbWUgc29vbiAoaWYgZXZlciksIGFuZCBJIGRvbid0
IHNlZSB3aHkgdGhpcyBzaG91bGQgYmUgYQ0KICAgID4gICAgICAgICAgICAgPj4gcmVxdWlyZW1l
bnQuDQogICAgPiAgICAgICAgICAgICA+IFdlbGwsIHNvbWVvbmUgdXNpbmcgdGhpcyBpcyBsaWtl
bHkgdG8gbWVzcyBpdCB1cC4gU28gSSBhZ3JlZSB3aXRoIExhcnMgYW5kIHRoaXMNCiAgICA+ICAg
ICAgICAgICAgID4gc2hvdWxkIGF0IGxlYXN0IGRpc2FncmVlIGFuZCBkaXNjb3VyYWdlIHRvIHVz
ZSBpdC4NCiAgICA+DQogICAgPiAgICAgICAgICAgICBzL2Rpc2FncmVlL2JlIHJlbW92ZWQvDQog
ICAgPg0KICAgID4gICAgICAgICBPSy4gVGhhdCBzZWVtcyB0byBiZSBhZ3JlZWQuIFRoZSBpbnRl
bnRpb24gb2YgcmVtb3ZpbmcgaXQgaXMgdG8gZW5jb3VyYWdlIG5ld2NvbWVycyB0byB1c2UgdGhl
IHRvb2xzIHdlIGhhdmUgYW5kIHdoaWNoIHdlIGtub3cgd29yay4NCiAgICA+DQogICAgPiAgICAg
ICAgIEFueSBvdGhlciBnZW5lcmFsIGZlZWRiYWNrIG9uIGhvdyBJIGFtIHBsYW5uaW5nIHRvIGFw
cHJvYWNoIHRoaXM/DQogICAgPg0KICAgID4gICAgICAgICBJbiBlc3NlbmNlLCB3ZSB3aWxsIGVu
ZCB1cCB3aXRoDQogICAgPiAgICAgICAgICogV2hhdCdzIGluIGEgcGF0Y2ggc2VyaWVzL3BhdGNo
ICAtIHRlcm1pbm9sb2d5IGFuZCBvdXIgZXhwZWN0YXRpb25zDQogICAgPiAgICAgICAgICAgIC0g
UG9zc2libHkgd2l0aCBhIGxpbmsgdG8gc29tZSBiZXN0IHByYWN0aWNlcyBhbmQgdG9vbHMgZm9y
IHBsYW5uaW5nIGZvciBtdWx0aXBsZSB2ZXJzaW9ucyAoYnV0IHNob3VsZCBub3QgYmUgcGFydCBv
ZiB0aGUgZG9jIGl0c2VsZikNCiAgICA+ICAgICAgICAgICAgLSBMb25nZXIgdGVybSBpdCB3b3Vs
ZCBiZSBuaWNlIHRvIGdldCB0byBzb21ldGhpbmcgbGlrZTogaHR0cHM6Ly93d3cua2VybmVsLm9y
Zy9kb2MvaHRtbC92NC4xNy9wcm9jZXNzL2RldmVsb3BtZW50LXByb2Nlc3MuaHRtbCAtIFRCSCBJ
IGRvbid0IGxpa2UgdGhlIGRvYyBvdHNlbGYgdmVyeSBtdWNoLCBidXQgaXQgaGFzIHNvbWUgZ29v
ZCB0b3BpY3MgaW4gaXQgd2hpY2ggd2Ugc2hvdWxkIGNvdmVyDQogICAgPiAgICAgICAgICogVGhl
IHRvb2xpbmcgbWVjaGFuaWNzIGZvciBhIHNpbmdsZSBwYXRjaDogc2V0LXVwIGFuZCBzdGVwcyB1
c2luZyBnZXRfbWFpbnRhaW5lcnMucGwNCiAgICA+ICAgICAgICAgKiBGb2xsb3ctdXA6IG11bHRp
cGxlIHZlcnNpb25zLCBjaGVja2luZyB3aGVuIHN0dWZmIGhhcyBnb25lIGluLCAuLi4NCiAgICA+
ICAgICAgICAgKiBTcGVjaWZpY3MgZm9yIFFFTVUsIC4uLg0KICAgID4NCiAgICA+ICAgICBIaSBh
bGwsIEkgcHV0IHRvZ2V0aGVyIGEgZHJhZnQgaW4gaHR0cHM6Ly9kb2NzLmdvb2dsZS5jb20vZG9j
dW1lbnQvZC8xak1zU190NHpvRlNzSXdaakltd0lBeFZDcGJOb2hRYmd1OFgxUzRRRUlxOC9lZGl0
P3VzcD1zaGFyaW5nIChhbHNvIGF0dGFjaGVkIGFzIFBERikgd2hpY2ggc2hvd3MgdGhlIGNoYW5n
ZXMgdG8gdGhlIG9yaWdpbmFsIHdpa2kgcGFnZSBhdCBodHRwczovL3dpa2kueGVucHJvamVjdC5v
cmcvd2lraS9TdWJtaXR0aW5nX1hlbl9Qcm9qZWN0X1BhdGNoZXMNCiAgICA+DQogICAgPiAgICAg
VGhlcmUgYXJlIHNvbWUgcHJvYmxlbXMgaW4gdGhlICJCcmVhayBkb3duIHlvdXIgcGF0Y2hlcyBh
cHByb3ByaWF0ZWx5IiBzZWN0aW9uIGFuZCBtYWludGFpbmVyIGlucHV0L2d1aWRhbmNlIHdvdWxk
IGJlIGdvb2QuIEkgYWxzbyBhZGRlZCBzb21lIG5vdGVzIG9uIHdoYXQgc2hvdWxkIGJlIGluIGEg
Y292ZXIgbGV0dGVyLCBidXQgYWdhaW4gdGhpcyBpcyBqdXN0IGEgc3RhcnRpbmcgcG9pbnQgYW5k
IGFnYWluIG1haW50YWluZXIgaW5wdXQvZ3VpZGFuY2Ugd291bGQgYmUgZ29vZC4NCiAgICA+DQog
ICAgPiAgICAgVGhlIEdvb2dsZSBkb2NzIFVSTCBhbGxvd3MgY29tbWVudGluZy4gIElmIHlvdSBj
b21tZW50LCBwbGVhc2UgbG9nIGluIHdpdGggYW4gSUQgYW5kL29yIHN0YXRlIGEgbmFtZSwgc3Vj
aCB0aGF0IEkgY2FuIGZvbGxvdyB1cCBpbiBjYXNlIG9mIHF1ZXN0aW9ucy4NCiAgICA+DQogICAg
PiAgICAgSSB3aWxsIHdhaXQgdW50aWwgbmV4dCB3ZWVrIGJlZm9yZSBlbmNvZGluZyB0aGlzIG9u
IHRoZSB3aWtpIGFuZCBhcyBhIHNlY29uZCBzdGVwLCBJIHdpbGwgc3VibWl0IHBhdGNoZXMgdG8g
dGhlIHNwaGlueCBkb2NzLg0KICAgID4NCiAgICA+ICAgICBSZWdhcmRzDQogICAgPiAgICAgTGFy
cw0KICAgID4NCiAgICA+IEhpIGFsbCwNCiAgICA+DQogICAgPiBJIGdhdmUgdGhpcyBhIG1ham9y
IHJlLXdvcmsgYmFzZWQgb24geW91ciBmZWVkYmFjaw0KICAgID4NCiAgICA+IFRoZSBvdXRwdXQg
Y2FuIGJlIGZvdW5kIGF0IGh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL1N1Ym1pdHRp
bmdfWGVuX1Byb2plY3RfUGF0Y2hlcyBhbmQgaHR0cHM6Ly93aWtpLnhlbnByb2plY3Qub3JnL3dp
a2kvTWFuYWdpbmdfWGVuX1BhdGNoZXNfd2l0aF9HaXQNCiAgICA+DQogICAgPiBUaGUgb25seSBh
cmVhcyB3aGljaCBJIHRoaW5rIG5lZWQgaW1wcm92ZW1lbnRzIGFyZQ0KICAgID4gKiBNYXliZSBh
IGdvb2QgZXhhbXBsZSBvZiBhIGNvdmVyIGxldHRlciAgLSBzdWdnZXN0aW9ucyB3ZWxjb21lDQog
ICAgPiAqIEEgc2VjdGlvbiB1bmRlciBDb2RlIHJldmlldyBhcm91bmQgd2hlbiB5b3Uga25vdyB5
b3UgYXJlIGdldHRpbmcgY2xvc2UgdG8gdGhlIGVuZDogYWthIHRyYWNraW5nIEFDS3MNCiAgICA+
ICogSG93IHRvIGtub3cgd2hlbiBhIHBhdGNoIGhhcyBiZWVuIGNvbW1pdHRlZCAtIHNob3VsZCBy
ZWZlciB0byBwYXRjaHdvcmssIHBhdGNoZXcsIC4uLg0KICAgID4NCiAgICA+IEZlZWRiYWNrIG9y
IGVkaXRzIGFyZSB3ZWxjb21lDQogICAgPg0KICAgID4gQmVzdCBSZWdhcmRzDQogICAgPiBMYXJz
DQogICAgPg0KICAgIA0KICAgIEhpIExhcnMsDQogICAgDQogICAgVGhhbmsgeW91IHZlcnkgbXVj
aCBmb3IgdGhlIGRvY3VtZW50IHdvcmsgeW91IGFyZSBkb2luZy4NCiAgICANCiAgICBJdCBpcyBw
cm9iYWJseSB3b3JzdCBhZGRpbmcgb25lIG1vcmUgbm90ZSBvciBzZWN0aW9uIGRlc2NyaWJpbmcg
YW4NCiAgICBhdXRvbWF0aWMgdGVzdGluZyBtZWNoYW5pc20gZGV0YWlscyBhbmQgaG93IHRvIHVz
ZSBpdCwgYW5kL29yDQogICAgbWVudGlvbmluZyB0aGF0IHRoZSBwYXRjaGVzIGNvdWxkIGJlIHRl
c3RlZCB3aXRoIFFlbXUgKGFkZGl0aW9uYWxseSB0bw0KICAgIGh3KSBtYW51YWxseSBhcyB3ZWxs
LiBOb3Qgc3VyZSBpZiBpdCBzaG91bGQgYmUgYWRkZWQgdG8gdGhpcyBkb2N1bWVudA0KICAgIG9y
IGFub3RoZXIgb25lLiANCg0KSXQgc2hvdWxkIGJlIGFkZGVkIHRvIGFub3RoZXIgb25lICBhbmQg
cmVmZXJyZWQgdG8gZnJvbSBoZXJlICAgDQoNCiAgICBPbiB0aGUgb25lIGhhbmQsIHRoZSB0ZXN0
aW5nIHJlbGF0ZXMgdG8gcGF0Y2hlcw0KICAgIHN1Ym1pc3Npb24gKG1lYW4gcGF0Y2hlcyBzaG91
bGQgYmUgdGVzdGVkIGJlZm9yZSBzdWJtaXNzaW9uIGFueXdheSksDQogICAgYnV0IG9uIHRoZSBv
dGhlciBoYW5kLCB0ZXN0aW5nIGRldGFpbHMgYXJlIG5vdCBhYm91dCB0aGUgcGF0Y2hlcw0KICAg
IHN1Ym1pc3Npb24gcHJvY2Vzcy4gSW4gYW55IGNhc2UsIHdlIGRvIG5vdCBoYXZlIGFueSBleHBs
aWNpdA0KICAgIGRvY3VtZW50YXRpb24gYWJvdXQgcGF0Y2hlcyB0ZXN0aW5nIGZvciBub3cuIElz
IGl0IGNvcnJlY3Q/DQoNCk5vLCBub3QgcmVhbGx5LiANCk9TU1RFU1QgY2FuIGJlIHJ1biBsb2Nh
bGx5IGJ1dCBpcyBoYXJkIHRvIGRvDQpYVEYgd291bGQgYmUgYSBnb29kIG9wdGlvbiwgYnV0IGRv
ZXMgbm90IHdvcmsgb24gQXJtDQogICAgDQogICAgVGhhbmsgeW91IGFnYWluIGZvciBpbXByb3Zp
bmcgWGVuIGRvY3VtZW50YXRpb24uDQogICAgDQpZb3UgYXJlIHdlbGNvbWUNCg0KTGFycw0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
