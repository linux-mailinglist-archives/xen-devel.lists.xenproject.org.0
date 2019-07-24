Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC30E7314F
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 16:14:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqHzu-0006sX-4x; Wed, 24 Jul 2019 14:12:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UCFt=VV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hqHzt-0006sS-8l
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 14:12:01 +0000
X-Inumbo-ID: ff5b64c6-ae1c-11e9-ad95-97e4d1c9be90
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff5b64c6-ae1c-11e9-ad95-97e4d1c9be90;
 Wed, 24 Jul 2019 14:11:58 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 3AAGjEb9aAYXjZCaUcAkR2dEdCHrl2tDNn2eVbBzyUeZu5fH1d/OeXTjsNyA8RD+nDzCXqQCVY
 Va/5SCAhkNxVfb8zcFTebklmyPzhIZiml+CfvoNDpOIVm8O/pd59uQ+Fvno6Ekd60fAERVJLaA
 GORILpMzAl7Bo1ri5keunRa/enSntFpjZSUQ0tjjTXhGFnBiIhoF37FLQGE4gJmQvqoIEFSSdE
 JaGlKkdw9ee/vwZIBZMu2E4tC+ISlucJ+umtfaGC3rQBfXspDZGcOzrlOAhce5o6I5gI+w0ZRW
 i1Q=
X-SBRS: 2.7
X-MesageID: 3369357
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,303,1559534400"; 
   d="scan'208";a="3369357"
Date: Wed, 24 Jul 2019 16:11:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Roman Shaposhnik <roman@zededa.com>
Message-ID: <20190724141145.hg4aa5wyg5tsgv5p@Air-de-Roger>
References: <20190722114859.dtm4w5ff75uedu24@Air-de-Roger>
 <9238bf1a297c42f38dccc1cfb50bd144@AMSPEX02CL03.citrite.net>
 <20190722134813.c7fedaqtrbo6ojvo@Air-de-Roger>
 <81a7cdc728294e5ca05fd056a87cb21b@AMSPEX02CL03.citrite.net>
 <20190722143953.tkcmv5bb72sdlkql@Air-de-Roger>
 <9f11fd0b6be14ea5a8efbb809df74cc9@AMSPEX02CL03.citrite.net>
 <20190722152152.dvhs4riw2w67rvih@Air-de-Roger>
 <CAMmSBy-P9+00XfK6k2OYqFHNONcxeGuu0V=Qk4peFDC=KOUogA@mail.gmail.com>
 <b5ba8315-ce59-85e6-5bfc-1db4c239eb1c@citrix.com>
 <CAMmSBy-S7nMg-V5DUzV2L2RmK0TnFt+9=C8gE=0FuUOQK3kjQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMmSBy-S7nMg-V5DUzV2L2RmK0TnFt+9=C8gE=0FuUOQK3kjQQ@mail.gmail.com>
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMTA6MzI6MjZBTSAtMDcwMCwgUm9tYW4gU2hhcG9zaG5p
ayB3cm90ZToKPiBIaSBSb2dlciEKPiAKPiBJIGFwcGxpZWQgeW91ciBwYXRjaCwgcmVtb3ZlZCBu
by1pZ2Z4IGFuZCBJIHN0aWxsIHNlZSB0aGUgb3JpZ2luYWwKPiBwcm9ibGVtLiBQbGVhc2UgbGV0
IG1lIGtub3cgd2hhdCBvdGhlciBsb2dzL2RlYnVncyB3b3VsZCB5b3UgbmVlZCBhdAo+IHRoaXMg
cG9pbnQuCgpJJ20gbm90IHN1cmUgd2h5IHlvdSBkb24ndCBnZXQgdGhlIHJtcnJzIGFkZGVkIHRv
IHRoZSBpb21tdSBwYWdlCnRhYmxlcywgQUZBSUNUIGl0IHdvcmtzIG9uIG15IHRlc3QgYm94LgoK
SSBoYXZlIGEgcGF0Y2ggd2l0aCBleHRyYSBkZWJ1ZyBtZXNzYWdlcyBhbmQgY2hlY2tzLCBjb3Vs
ZCB5b3UgZ2l2ZSBpdAphIHRlc3QsIEknbSBhdHRhY2hpbmcgaXQgYmVsb3cuIE5vdGUgdGhhdCB5
b3UgZG9uJ3QgbmVlZCB0aGUgcHJldmlvdXMKcGF0Y2gsIHNpbmNlIGl0J3MgYWxyZWFkeSBjb250
YWluZWQgaW4gdGhlIGRlYnVnIHBhdGNoIGJlbG93LgoKUGxlYXNlIHBhc3RlIHRoZSBYZW4gYm9v
dGxvZyB3aXRoIHRoZSBwYXRjaCBhcHBsaWVkIHdoZW4geW91ciByZXBseS4KClRoYW5rLCBSb2dl
ci4KLS0tODwtLS0KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYyBiL3hlbi9hcmNo
L3g4Ni9tbS9wMm0uYwppbmRleCBmZWY5N2M4MmY2Li4zNjA1NjE0YWFmIDEwMDY0NAotLS0gYS94
ZW4vYXJjaC94ODYvbW0vcDJtLmMKKysrIGIveGVuL2FyY2gveDg2L21tL3AybS5jCkBAIC0xMzQx
LDcgKzEzNDEsNyBAQCBpbnQgc2V0X2lkZW50aXR5X3AybV9lbnRyeShzdHJ1Y3QgZG9tYWluICpk
LCB1bnNpZ25lZCBsb25nIGdmbl9sLAogCiAgICAgaWYgKCAhcGFnaW5nX21vZGVfdHJhbnNsYXRl
KHAybS0+ZG9tYWluKSApCiAgICAgewotICAgICAgICBpZiAoICFuZWVkX2lvbW11X3B0X3N5bmMo
ZCkgKQorICAgICAgICBpZiAoICFoYXNfaW9tbXVfcHQoZCkgKQogICAgICAgICAgICAgcmV0dXJu
IDA7CiAgICAgICAgIHJldHVybiBpb21tdV9sZWdhY3lfbWFwKGQsIF9kZm4oZ2ZuX2wpLCBfbWZu
KGdmbl9sKSwgUEFHRV9PUkRFUl80SywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
SU9NTVVGX3JlYWRhYmxlIHwgSU9NTVVGX3dyaXRhYmxlKTsKQEAgLTE0MzIsNyArMTQzMiw3IEBA
IGludCBjbGVhcl9pZGVudGl0eV9wMm1fZW50cnkoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQg
bG9uZyBnZm5fbCkKIAogICAgIGlmICggIXBhZ2luZ19tb2RlX3RyYW5zbGF0ZShkKSApCiAgICAg
ewotICAgICAgICBpZiAoICFuZWVkX2lvbW11X3B0X3N5bmMoZCkgKQorICAgICAgICBpZiAoICFo
YXNfaW9tbXVfcHQoZCkgKQogICAgICAgICAgICAgcmV0dXJuIDA7CiAgICAgICAgIHJldHVybiBp
b21tdV9sZWdhY3lfdW5tYXAoZCwgX2RmbihnZm5fbCksIFBBR0VfT1JERVJfNEspOwogICAgIH0K
ZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jIGIveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMKaW5kZXggOGIyN2Q3ZTc3NS4uZWEzMDNiNWQ0
NSAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMKKysrIGIv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMKQEAgLTIwMDksMTIgKzIwMDksMTkg
QEAgc3RhdGljIGludCBybXJyX2lkZW50aXR5X21hcHBpbmcoc3RydWN0IGRvbWFpbiAqZCwgYm9v
bF90IG1hcCwKICAgICBpZiAoICFtYXAgKQogICAgICAgICByZXR1cm4gLUVOT0VOVDsKIAorcHJp
bnRrKCI8Uk1SUj4gbWFwcGluZyAlI2x4IC0gJSNseFxuIiwgYmFzZV9wZm4sIGVuZF9wZm4pOwog
ICAgIHdoaWxlICggYmFzZV9wZm4gPCBlbmRfcGZuICkKICAgICB7CiAgICAgICAgIGludCBlcnIg
PSBzZXRfaWRlbnRpdHlfcDJtX2VudHJ5KGQsIGJhc2VfcGZuLCBwMm1fYWNjZXNzX3J3LCBmbGFn
KTsKKyAgICAgICAgbWZuX3QgbWZuOworICAgICAgICB1bnNpZ25lZCBpbnQgZjsKIAogICAgICAg
ICBpZiAoIGVyciApCiAgICAgICAgICAgICByZXR1cm4gZXJyOworQlVHX09OKGludGVsX2lvbW11
X2xvb2t1cF9wYWdlKGQsIF9kZm4oYmFzZV9wZm4pLCAmbWZuLCAmZikpOworQlVHX09OKGJhc2Vf
cGZuICE9IG1mbl94KG1mbikpOworQlVHX09OKGYgIT0gKElPTU1VRl9yZWFkYWJsZSB8IElPTU1V
Rl93cml0YWJsZSkpOworCiAgICAgICAgIGJhc2VfcGZuKys7CiAgICAgfQogCkBAIC0yMjYzLDYg
KzIyNzAsNyBAQCBzdGF0aWMgdm9pZCBfX2h3ZG9tX2luaXQgc2V0dXBfaHdkb21fcm1ycihzdHJ1
Y3QgZG9tYWluICpkKQogICAgIHUxNiBiZGY7CiAgICAgaW50IHJldCwgaTsKIAorcHJpbnRrKCI8
Uk1SUj4gc2V0dGluZyB1cCByZWdpb25zXG4iKTsKICAgICBwY2lkZXZzX2xvY2soKTsKICAgICBm
b3JfZWFjaF9ybXJyX2RldmljZSAoIHJtcnIsIGJkZiwgaSApCiAgICAgewoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
