Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C681C701BC
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 15:52:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpYg1-0001Ew-65; Mon, 22 Jul 2019 13:48:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PbCh=VT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hpYg0-0001Er-HX
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 13:48:28 +0000
X-Inumbo-ID: 6101edd9-ac87-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6101edd9-ac87-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 13:48:26 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YDEzv1Db/UWB4h/F3oxvLUUIp5iuTRQyVyVv1sS+2S4zT6I+KoEPip+cGlR2vVFEgriicUQBu/
 S9JsDFYDBgRj9v8yttb+RqCvxpS8oT38iXRhA0XvqralDbxusHC487p55+1CytnKeAyHBpQx/1
 q2xtdV8Dejtw5P33E1cHehpLw+6FHFnY+3OMta2XdoQ+tUufds0Urd+9PvhBea9fFEf4HqrrKA
 sFx1X9LTL5PkJmK6rDubm8VPCpO1BufCHphtkoDZaVI1HbuaOLSugxNaaZR9pw8r1TpRUTpLfd
 EN4=
X-SBRS: 2.7
X-MesageID: 3360601
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,295,1559534400"; 
   d="scan'208";a="3360601"
Date: Mon, 22 Jul 2019 15:48:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Message-ID: <20190722134813.c7fedaqtrbo6ojvo@Air-de-Roger>
References: <CAMmSBy9g-QFHTXhpHK6=xDFiBDj4LpnJ=cXj405MMmA1rJaOUg@mail.gmail.com>
 <CAMmSBy8CcG08-+-F6fvwmH1oEKpsV8OGEco94g04dZcyyFWKbw@mail.gmail.com>
 <b2e4ed0b178e41ebbc8f1db622ecae95@AMSPEX02CL03.citrite.net>
 <20190722114859.dtm4w5ff75uedu24@Air-de-Roger>
 <9238bf1a297c42f38dccc1cfb50bd144@AMSPEX02CL03.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9238bf1a297c42f38dccc1cfb50bd144@AMSPEX02CL03.citrite.net>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 'Roman Shaposhnik' <roman@zededa.com>, "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMDE6NTQ6MDBQTSArMDIwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IFJvZ2VyIFBhdSBN
b25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiBTZW50OiAyMiBKdWx5IDIwMTkgMTI6NDkK
PiA+IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsgJ1JvbWFuIFNo
YXBvc2huaWsnIDxyb21hbkB6ZWRlZGEuY29tPgo+ID4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZzsgamdyb3NzQHN1c2UuY29tOyBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVy
M0BjaXRyaXguY29tPjsKPiA+IGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tOyBqYmV1bGljaEBz
dXNlLmNvbQo+ID4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtCVUddIEFmdGVyIHVwZ3JhZGUg
dG8gWGVuIDQuMTIuMCBpb21tdT1uby1pZ2Z4Cj4gPiAKPiA+IE9uIE1vbiwgSnVsIDIyLCAyMDE5
IGF0IDA4OjIwOjM2QU0gKzAwMDAsIFBhdWwgRHVycmFudCB3cm90ZToKPiA+ID4gPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gPiBbc25pcF0KPiA+ID4gPiA+IChYRU4pIERvbWFpbiBo
ZWFwIGluaXRpYWxpc2VkCj4gPiA+ID4gPiAoWEVOKSBBQ1BJOiAzMi82NFggRkFDUyBhZGRyZXNz
IG1pc21hdGNoIGluIEZBRFQgLQo+ID4gPiA+ID4gOGNlOGVmODAvMDAwMDAwMDAwMDAwMDAwMCwg
dXNpbmcgMzIKPiA+ID4gPiA+IChYRU4pIElPQVBJQ1swXTogYXBpY19pZCAyLCB2ZXJzaW9uIDMy
LCBhZGRyZXNzIDB4ZmVjMDAwMDAsIEdTSSAwLTExOQo+ID4gPiA+ID4gKFhFTikgRW5hYmxpbmcg
QVBJQyBtb2RlOiAgRmxhdC4gIFVzaW5nIDEgSS9PIEFQSUNzCj4gPiA+ID4gPiAoWEVOKSBbVlQt
RF0gIFJNUlIgYWRkcmVzcyByYW5nZSA4ZDgwMDAwMC4uOGZmZmZmZmYgbm90IGluIHJlc2VydmVk
Cj4gPiA+ID4gPiBtZW1vcnk7IG5lZWQgImlvbW11X2luY2x1c2l2ZV9tYXBwaW5nPTEiPwo+ID4g
Pgo+ID4gPiBUaGlzIGlzIHlvdXIgcHJvYmxlbS4gSW4gdmVyc2lvbnMgcHJpb3IgdG8gNC4xMSAo
SSB0aGluaywgYW5kIGNlcnRhaW5seSA0LjEyKQo+ID4gaW9tbXVfaW5jbHVzaXZlX21hcHBpbmcg
dXNlZCB0byBkZWZhdWx0IG9uLCB3aGVyZWFzIG5vdyBpdCBhcHBlYXJzIHRvIGRlZmF1bHQgb2Zm
LiBJbiBtb3N0Cj4gPiBjaXJjdW1zdGFuY2VzIHRoaXMgaXMgZmluZSBiZWNhdXNlIHRoZXJlIGlz
IGEgbmV3IGZsYWcsIGlvbW11X2h3ZG9tX3Jlc2VydmVkLCB3aGljaCBkZWZhdWx0cyBvbiBhbmQK
PiA+IHRoaXMgbWFrZXMgc3VyZSB0aGF0IGFsbCBlODIwIHJlc2VydmVkIHJlZ2lvbnMgYXJlIGlk
ZW50aXR5IG1hcHBlZCAod2hpY2ggdXN1YWxseSBjb3ZlcnMgdW5kZWNsYXJlZAo+ID4gUk1SUnMp
LiBZb3UgaGF2ZSB0aGUgb3Bwb3NpdGUgcHJvYmxlbS4uLiBhIGRlY2xhcmVkIFJNUlIgd2hpY2gg
aXMgbm90IHJlc2VydmVkLCBzbyB5b3Ugd2lsbCBuZWVkCj4gPiBpb21tdV9pbmNsdXNpdmVfbWFw
cGluZy4KPiA+IAo+ID4gSSB0aGluayB0aGVyZSdzIGEgYnVnIGluIHRoZSBpbml0aWFsaXphdGlv
biBvZiBpb21tdSBmb3IgYSBQViBkb20wLAo+ID4gd2hpY2ggbGVhdmVzIGRvbTAgd2l0aG91dCBy
bXJyIGVudHJpZXMuIENhbiB5b3UgdHJ5IHRoZSBwYXRjaCBiZWxvdwo+ID4gYW5kIHJlcG9ydCB3
aGV0aGVyIGl0IHNvbHZlcyB5b3VyIGlzc3VlPwo+ID4gCj4gPiBUaGFua3MsIFJvZ2VyLgo+ID4g
LS0tODwtLS0KPiA+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5j
IGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYwo+ID4gaW5kZXggNzllYzY3MTlmNS4u
OWQ5MWYwZDYzMyAxMDA2NDQKPiA+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11
LmMKPiA+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKPiA+IEBAIC0xODUs
NyArMTg1LDcgQEAgdm9pZCBfX2h3ZG9tX2luaXQgaW9tbXVfaHdkb21faW5pdChzdHJ1Y3QgZG9t
YWluICpkKQo+ID4gICAgICByZWdpc3Rlcl9rZXloYW5kbGVyKCdvJywgJmlvbW11X2R1bXBfcDJt
X3RhYmxlLCAiZHVtcCBpb21tdSBwMm0gdGFibGUiLCAwKTsKPiA+IAo+ID4gICAgICBoZC0+c3Rh
dHVzID0gSU9NTVVfU1RBVFVTX2luaXRpYWxpemluZzsKPiA+IC0gICAgaGQtPm5lZWRfc3luYyA9
IGlvbW11X2h3ZG9tX3N0cmljdCAmJiAhaW9tbXVfdXNlX2hhcF9wdChkKTsKPiA+ICsgICAgaGQt
Pm5lZWRfc3luYyA9ICFpb21tdV91c2VfaGFwX3B0KGQpOwo+IAo+IEJ1dCB0aGlzIGlzIGdvaW5n
IHRvIG1lYW4gdGhlIGlmKCkgYmVsb3cgaXMgdHJ1ZSBmb3Igbm9uLXN0cmljdCBkb20wLCB3aGlj
aCBtZWFucyBpdCBwb2ludGxlc3NseSBtYXBzIHRoZSBkb20wIHBhZ2UgbGlzdCB3aGVuIGh3ZG9t
X2lvbW11X21hcCgpIHNob3VsZCBoYXZlIGFscmVhZHkgbWFwcGVkIGFsbCBjb252ZW50aW9uYWwg
UkFNLgoKUmlnaHQsIHRoaXMgYWxsIHNlZW1zIHF1aXRlIGJyb2tlbi4gTm9uLXRyYW5zbGF0ZWQg
Z3Vlc3RzIChpZTogUFYpCndvdWxkIGFsd2F5cyBuZWVkIGlvbW11IHBhZ2UtdGFibGUgc3luYywg
YnV0IHNldF9pZGVudGl0eV9wMm1fZW50cnkKY29udGFpbnMgdGhlIGZvbGxvd2luZzoKCmlmICgg
IXBhZ2luZ19tb2RlX3RyYW5zbGF0ZShwMm0tPmRvbWFpbikgKQp7CiAgICBpZiAoICFuZWVkX2lv
bW11X3B0X3N5bmMoZCkgKQogICAgICAgIHJldHVybiAwOwogICAgcmV0dXJuIGlvbW11X2xlZ2Fj
eV9tYXAoZCwgX2RmbihnZm5fbCksIF9tZm4oZ2ZuX2wpLCBQQUdFX09SREVSXzRLLAogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgSU9NTVVGX3JlYWRhYmxlIHwgSU9NTVVGX3dyaXRhYmxlKTsK
fQoKSSB3b25kZXIgd2hldGhlciB0aGUgdXNhZ2Ugb2YgbmVlZF9pb21tdV9wdF9zeW5jIGlzIHdy
b25nIHRoZXJlLCBhbmQKc2hvdWxkIGluc3RlYWQgYmUgIWhhc19pb21tdV9wdChkKSwgc2luY2Ug
bm9uLXRyYW5zbGF0ZWQgZG9tYWlucyB3b3VsZApuZXZlciBzaGFyZSB0aGUgaW9tbXUgcGFnZS10
YWJsZXMgYW55d2F5LgoKSW4gYW55IGNhc2UsIEkgdGhpbmsgbmVlZF9zeW5jIG11c3QgYmUgc2V0
IHdoZW4gdGhlIGlvbW11IHBhZ2UgdGFibGVzCmFyZSBub3Qgc2hhcmVkLCBhbmQgZ2F0aW5nIGl0
IG9uIGlvbW11X2h3ZG9tX3N0cmljdCBzZWVtcyB3cm9uZyB0byBtZSwKdGhlIHN0cmljdG5lc3Mg
b2YgdGhlIGlvbW11IGRvZXNuJ3QgYWZmZWN0IHdoZXRoZXIgYSBzeW5jIGlzIG5lZWQgb3IKbm90
LgoKSSd2ZSB1cGRhdGVkIHRoZSBwYXRjaCB0byBhdm9pZCB0aGUgcG9pbnRsZXNzIG1hcHBpbmcg
b2YgZG9tMCBwYWdlCmxpc3QsIGJ1dCBJIGhhdmVuJ3QgaW5jbHVkZWQgdGhlIGNoYW5nZSB0byBz
ZXRfaWRlbnRpdHlfcDJtX2VudHJ5LgoKVGhhbmtzLCBSb2dlci4KLS0tODwtLS0KZGlmZiAtLWdp
dCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMgYi94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC9pb21tdS5jCmluZGV4IDc5ZWM2NzE5ZjUuLmFiZjllMzg2MDcgMTAwNjQ0Ci0tLSBhL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvaW9tbXUuYwpAQCAtMTg1LDggKzE4NSw4IEBAIHZvaWQgX19od2RvbV9pbml0IGlvbW11X2h3
ZG9tX2luaXQoc3RydWN0IGRvbWFpbiAqZCkKICAgICByZWdpc3Rlcl9rZXloYW5kbGVyKCdvJywg
JmlvbW11X2R1bXBfcDJtX3RhYmxlLCAiZHVtcCBpb21tdSBwMm0gdGFibGUiLCAwKTsKIAogICAg
IGhkLT5zdGF0dXMgPSBJT01NVV9TVEFUVVNfaW5pdGlhbGl6aW5nOwotICAgIGhkLT5uZWVkX3N5
bmMgPSBpb21tdV9od2RvbV9zdHJpY3QgJiYgIWlvbW11X3VzZV9oYXBfcHQoZCk7Ci0gICAgaWYg
KCBuZWVkX2lvbW11X3B0X3N5bmMoZCkgKQorICAgIGhkLT5uZWVkX3N5bmMgPSAhaW9tbXVfdXNl
X2hhcF9wdChkKTsKKyAgICBpZiAoIGlvbW11X2h3ZG9tX3N0cmljdCAmJiBuZWVkX2lvbW11X3B0
X3N5bmMoZCkgKQogICAgIHsKICAgICAgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGFnZTsKICAgICAg
ICAgdW5zaWduZWQgaW50IGkgPSAwLCBmbHVzaF9mbGFncyA9IDA7CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
