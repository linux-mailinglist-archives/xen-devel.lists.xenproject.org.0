Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 165E770290
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 16:43:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpZU2-0005bg-Hk; Mon, 22 Jul 2019 14:40:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PbCh=VT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hpZU1-0005bb-9G
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 14:40:09 +0000
X-Inumbo-ID: 99db17bd-ac8e-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 99db17bd-ac8e-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 14:40:08 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wU87Pt9nJ0jcBuhm+QsXoTFHR3JyDEesmZep2Hrq2H4E6ntl6p+JcYT4MWtV0d1JBFe+rPZlUt
 M+gGbnR9fHqGEIecg4AqyFHBr7Ohub4zCWbpZR1S404nVHNmfa30oqjN1J9aaC8uYAygZ0leuc
 n3aE/2EP3+IvQFQaJwB7yzIx0hKuKqSrav3/WVFnEP5GcM/bhviNvPZJr2eHU068EuhlaLJhmB
 YeOxaJ0Gh54M5rdmK1tMMWxc8AWC7ztJ/xzFb7xCfIUTwRUlTr8JOXB31kZxZbL3pJ+skgM/Xr
 8io=
X-SBRS: 2.7
X-MesageID: 3381494
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,295,1559534400"; 
   d="scan'208";a="3381494"
Date: Mon, 22 Jul 2019 16:39:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Message-ID: <20190722143953.tkcmv5bb72sdlkql@Air-de-Roger>
References: <CAMmSBy9g-QFHTXhpHK6=xDFiBDj4LpnJ=cXj405MMmA1rJaOUg@mail.gmail.com>
 <CAMmSBy8CcG08-+-F6fvwmH1oEKpsV8OGEco94g04dZcyyFWKbw@mail.gmail.com>
 <b2e4ed0b178e41ebbc8f1db622ecae95@AMSPEX02CL03.citrite.net>
 <20190722114859.dtm4w5ff75uedu24@Air-de-Roger>
 <9238bf1a297c42f38dccc1cfb50bd144@AMSPEX02CL03.citrite.net>
 <20190722134813.c7fedaqtrbo6ojvo@Air-de-Roger>
 <81a7cdc728294e5ca05fd056a87cb21b@AMSPEX02CL03.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <81a7cdc728294e5ca05fd056a87cb21b@AMSPEX02CL03.citrite.net>
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

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMDQ6MDM6NDRQTSArMDIwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBbc25pcF0KPiA+ID4gPiBkaWZm
IC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYyBiL3hlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL2lvbW11LmMKPiA+ID4gPiBpbmRleCA3OWVjNjcxOWY1Li45ZDkxZjBkNjMzIDEw
MDY0NAo+ID4gPiA+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKPiA+ID4g
PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCj4gPiA+ID4gQEAgLTE4NSw3
ICsxODUsNyBAQCB2b2lkIF9faHdkb21faW5pdCBpb21tdV9od2RvbV9pbml0KHN0cnVjdCBkb21h
aW4gKmQpCj4gPiA+ID4gICAgICByZWdpc3Rlcl9rZXloYW5kbGVyKCdvJywgJmlvbW11X2R1bXBf
cDJtX3RhYmxlLCAiZHVtcCBpb21tdSBwMm0gdGFibGUiLCAwKTsKPiA+ID4gPgo+ID4gPiA+ICAg
ICAgaGQtPnN0YXR1cyA9IElPTU1VX1NUQVRVU19pbml0aWFsaXppbmc7Cj4gPiA+ID4gLSAgICBo
ZC0+bmVlZF9zeW5jID0gaW9tbXVfaHdkb21fc3RyaWN0ICYmICFpb21tdV91c2VfaGFwX3B0KGQp
Owo+ID4gPiA+ICsgICAgaGQtPm5lZWRfc3luYyA9ICFpb21tdV91c2VfaGFwX3B0KGQpOwo+ID4g
Pgo+ID4gPiBCdXQgdGhpcyBpcyBnb2luZyB0byBtZWFuIHRoZSBpZigpIGJlbG93IGlzIHRydWUg
Zm9yIG5vbi1zdHJpY3QgZG9tMCwgd2hpY2ggbWVhbnMgaXQgcG9pbnRsZXNzbHkKPiA+IG1hcHMg
dGhlIGRvbTAgcGFnZSBsaXN0IHdoZW4gaHdkb21faW9tbXVfbWFwKCkgc2hvdWxkIGhhdmUgYWxy
ZWFkeSBtYXBwZWQgYWxsIGNvbnZlbnRpb25hbCBSQU0uCj4gPiAKPiA+IFJpZ2h0LCB0aGlzIGFs
bCBzZWVtcyBxdWl0ZSBicm9rZW4uIE5vbi10cmFuc2xhdGVkIGd1ZXN0cyAoaWU6IFBWKQo+ID4g
d291bGQgYWx3YXlzIG5lZWQgaW9tbXUgcGFnZS10YWJsZSBzeW5jLCBidXQgc2V0X2lkZW50aXR5
X3AybV9lbnRyeQo+ID4gY29udGFpbnMgdGhlIGZvbGxvd2luZzoKPiA+IAo+ID4gaWYgKCAhcGFn
aW5nX21vZGVfdHJhbnNsYXRlKHAybS0+ZG9tYWluKSApCj4gPiB7Cj4gPiAgICAgaWYgKCAhbmVl
ZF9pb21tdV9wdF9zeW5jKGQpICkKPiA+ICAgICAgICAgcmV0dXJuIDA7Cj4gPiAgICAgcmV0dXJu
IGlvbW11X2xlZ2FjeV9tYXAoZCwgX2RmbihnZm5fbCksIF9tZm4oZ2ZuX2wpLCBQQUdFX09SREVS
XzRLLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIElPTU1VRl9yZWFkYWJsZSB8IElP
TU1VRl93cml0YWJsZSk7Cj4gPiB9Cj4gPiAKPiA+IEkgd29uZGVyIHdoZXRoZXIgdGhlIHVzYWdl
IG9mIG5lZWRfaW9tbXVfcHRfc3luYyBpcyB3cm9uZyB0aGVyZSwgYW5kCj4gPiBzaG91bGQgaW5z
dGVhZCBiZSAhaGFzX2lvbW11X3B0KGQpLCBzaW5jZSBub24tdHJhbnNsYXRlZCBkb21haW5zIHdv
dWxkCj4gPiBuZXZlciBzaGFyZSB0aGUgaW9tbXUgcGFnZS10YWJsZXMgYW55d2F5Lgo+IAo+IFlv
dSB3YW50IHN5bmNpbmcgaWYgdGhlIGRvbWFpbiBoYXMgSU9NTVUgcGFnZSB0YWJsZXMgYW5kIHNo
YXJlZCBFUFQgaXMgbm90IGluIHVzZSwgc28gdGhpcyBsb2dpYyBqdXN0IHNlZW1zIHdyb25nLgoK
UmlnaHQsIHNvIGZvciBhIFBWIGRvbWFpbiB0aGlzIHdvdWxkIG1lYW4gc3luY2luZyBpZiB0aGUg
aW9tbXUgaXMgaW4KdXNlZCwgYmVjYXVzZSB0aGVyZSdzIG5vIHNoYXJpbmcgYXQgYWxsLgoKPiA+
IAo+ID4gSW4gYW55IGNhc2UsIEkgdGhpbmsgbmVlZF9zeW5jIG11c3QgYmUgc2V0IHdoZW4gdGhl
IGlvbW11IHBhZ2UgdGFibGVzCj4gPiBhcmUgbm90IHNoYXJlZCwgYW5kIGdhdGluZyBpdCBvbiBp
b21tdV9od2RvbV9zdHJpY3Qgc2VlbXMgd3JvbmcgdG8gbWUsCj4gPiB0aGUgc3RyaWN0bmVzcyBv
ZiB0aGUgaW9tbXUgZG9lc24ndCBhZmZlY3Qgd2hldGhlciBhIHN5bmMgaXMgbmVlZCBvcgo+ID4g
bm90Lgo+IAo+IEkgdGhpbmsgbmVlZF9zeW5jIGlzIGdhdGVkIG9uIHN0cmljdCBtb2RlIGJlY2F1
c2UsIGluICdyZWxheGVkJyBtb2RlLCB0aGUgbWFwcGluZ3MgdGhhdCBhcmUgc2V0IHVwIHdoZW4g
ZG9tMCBpcyBzdGFydGVkIGFyZSBzdXBwb3NlZCB0byBiZSBzdGF0aWMgKG1vZHVsbyBob3RwbHVn
IFJBTSkuLi4gc28gbW9kaWZpY2F0aW9ucyB0byB0aGUgZG9tYWluJ3MgcGFnZSBsaXN0IGFyZSBu
b3Qgc3VwcG9zZWQgdG8gaGF2ZSBhbnkgZWZmZWN0LCBhbmQgc28gbm8gc3luY2hyb25pemF0aW9u
IG5lZWQgYmUgZG9uZS4KCkhtLCByaWdodCwgaW4gcmVsYXhlZCBtb2RlIGRvbTAgaXMgc3VwcG9z
ZWQgdG8gaGF2ZSBhbGwgUkFNIHJlZ2lvbnMKbWFwcGVkIGluIHRoZSBpb21tdSBwYWdlLXRhYmxl
cywgc28gdGhlcmUncyBubyBuZWVkIHRvIG1vZGlmeSB0aGUKaW9tbXUgcGFnZSB0YWJsZXMgYXQg
cnVuIHRpbWUuCgpUaGlzIGFwcHJvYWNoIHNlZW1zIHNsaWdodGx5IGJyb2tlbiBpZiBkbWEgb3Bl
cmF0aW9ucyBhZ2FpbnMgbW1pbwpyZWdpb25zIGFyZSBhdHRlbXB0ZWQgYnkgZG9tMCwgYnV0IGFu
eXdheSwgdGhpcyBzZWVtcyB0byBoYXZlIHdvcmtlZApmaW5lIHNvIGZhci4KCj4gPiAKPiA+IEkn
dmUgdXBkYXRlZCB0aGUgcGF0Y2ggdG8gYXZvaWQgdGhlIHBvaW50bGVzcyBtYXBwaW5nIG9mIGRv
bTAgcGFnZQo+ID4gbGlzdCwgYnV0IEkgaGF2ZW4ndCBpbmNsdWRlZCB0aGUgY2hhbmdlIHRvIHNl
dF9pZGVudGl0eV9wMm1fZW50cnkuCj4gPiAKPiAKPiBTbywgSSB0aGluayB0aGUgYWxiZWl0IG9k
ZCBsb29raW5nIGxvZ2ljIGluIGlvbW11X2h3ZG9tX2luaXQoKSB3YXMgYWN0dWFsbHkgY29ycmVj
dCwgYnV0IHRoZSBjb2RlIGluIHNldF9pZGVudGl0eV9wMm1fZW50cnkoKSBpcyB3cm9uZy4KCkFj
aywgc2VlIHRoZSBwYXRjaCBiZWxvdy4gSSB0aGluayBpdCBtaWdodCBhbHNvIGJlIGhlbHBmdWwg
dG8gYWRkIGEKY29tbWVudCB0byB0aGUgc2V0dGluZyBvZiBuZWVkX3N5bmMgaW4gaW9tbXVfaHdk
b21faW5pdCBpbiBvcmRlciB0bwptZW50aW9uIHRoYXQgcmVsYXhlZCBkb21haW5zIGRvbid0IG5l
ZWQgc3luYyBiZWNhdXNlIGFsbCByYW0gaXMKYWxyZWFkeSBtYXBwZWQgaW4gdGhlIGlvbW11IHBh
Z2UgdGFibGVzLgoKVGhhbmtzLCBSb2dlci4KLS0tODwtLS0KZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9tbS9wMm0uYyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwppbmRleCBmZWY5N2M4MmY2Li44
OGEyNDMwYzhjIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMKKysrIGIveGVuL2Fy
Y2gveDg2L21tL3AybS5jCkBAIC04MzYsNyArODM2LDcgQEAgZ3Vlc3RfcGh5c21hcF9hZGRfcGFn
ZShzdHJ1Y3QgZG9tYWluICpkLCBnZm5fdCBnZm4sIG1mbl90IG1mbiwKICAgICAgICAgICovCiAg
ICAgICAgIGZvciAoIGkgPSAwOyBpIDwgKDFVTCA8PCBwYWdlX29yZGVyKTsgKytpLCArK3BhZ2Ug
KQogICAgICAgICB7Ci0gICAgICAgICAgICBpZiAoICFuZWVkX2lvbW11X3B0X3N5bmMoZCkgKQor
ICAgICAgICAgICAgaWYgKCAhaGFzX2lvbW11X3B0KGQpICkKICAgICAgICAgICAgICAgICAvKiBu
b3RoaW5nICovOwogICAgICAgICAgICAgZWxzZSBpZiAoIGdldF9wYWdlX2FuZF90eXBlKHBhZ2Us
IGQsIFBHVF93cml0YWJsZV9wYWdlKSApCiAgICAgICAgICAgICAgICAgcHV0X3BhZ2VfYW5kX3R5
cGUocGFnZSk7CkBAIC0xMzQxLDcgKzEzNDEsNyBAQCBpbnQgc2V0X2lkZW50aXR5X3AybV9lbnRy
eShzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBsb25nIGdmbl9sLAogCiAgICAgaWYgKCAhcGFn
aW5nX21vZGVfdHJhbnNsYXRlKHAybS0+ZG9tYWluKSApCiAgICAgewotICAgICAgICBpZiAoICFu
ZWVkX2lvbW11X3B0X3N5bmMoZCkgKQorICAgICAgICBpZiAoICFoYXNfaW9tbXVfcHQoZCkgKQog
ICAgICAgICAgICAgcmV0dXJuIDA7CiAgICAgICAgIHJldHVybiBpb21tdV9sZWdhY3lfbWFwKGQs
IF9kZm4oZ2ZuX2wpLCBfbWZuKGdmbl9sKSwgUEFHRV9PUkRFUl80SywKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgSU9NTVVGX3JlYWRhYmxlIHwgSU9NTVVGX3dyaXRhYmxlKTsKQEAg
LTE0MzIsNyArMTQzMiw3IEBAIGludCBjbGVhcl9pZGVudGl0eV9wMm1fZW50cnkoc3RydWN0IGRv
bWFpbiAqZCwgdW5zaWduZWQgbG9uZyBnZm5fbCkKIAogICAgIGlmICggIXBhZ2luZ19tb2RlX3Ry
YW5zbGF0ZShkKSApCiAgICAgewotICAgICAgICBpZiAoICFuZWVkX2lvbW11X3B0X3N5bmMoZCkg
KQorICAgICAgICBpZiAoICFoYXNfaW9tbXVfcHQoZCkgKQogICAgICAgICAgICAgcmV0dXJuIDA7
CiAgICAgICAgIHJldHVybiBpb21tdV9sZWdhY3lfdW5tYXAoZCwgX2RmbihnZm5fbCksIFBBR0Vf
T1JERVJfNEspOwogICAgIH0KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
