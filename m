Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3D635DE2
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 15:25:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYVs0-0007Bh-B7; Wed, 05 Jun 2019 13:22:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gpCR=UE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hYVrz-0007Ba-8C
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 13:22:23 +0000
X-Inumbo-ID: f36562d7-8794-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f36562d7-8794-11e9-8980-bc764e045a96;
 Wed, 05 Jun 2019 13:22:22 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: D9758UPZZ/tRe2b4s4ZEne9yV9Qo8H0auE19RYthBE5wcAGrZbuYuUo6vGBLldINgO3ErvePFj
 0g+q7SYelxFPCOd5yNOpiBtxX00AVLFH4F/FXGoufIPvT6vh8I1dwyMOL+MTAbJv0NdMao5obx
 tdtoqSj26BRNT0Z3UxXh6yNVwZO08qVIHW7HQZyjnGr6Da+L9WdQXccPPtPgEfRPnH4yvh+F1a
 R19Dv60lBm5iiUUm1I0GIxXsfj2viYNw5655y3v282IfHZ7IejaiQ517i64Kc0cj5MX2Q1LDu0
 QaQ=
X-SBRS: 2.7
X-MesageID: 1354365
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,550,1549947600"; 
   d="scan'208";a="1354365"
Date: Wed, 5 Jun 2019 15:22:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190605132209.sjex2t4tww25ezex@Air-de-Roger>
References: <1558945891-3015-1-git-send-email-chao.gao@intel.com>
 <1558945891-3015-3-git-send-email-chao.gao@intel.com>
 <5CF682930200007800235268@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CF682930200007800235268@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v7 02/10] microcode/intel: extend
 microcode_update_match()
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Ashok Raj <ashok.raj@intel.com>,
 WeiLiu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Chao Gao <chao.gao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdW4gMDQsIDIwMTkgYXQgMDg6Mzk6MTVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI3LjA1LjE5IGF0IDEwOjMxLCA8Y2hhby5nYW9AaW50ZWwuY29tPiB3cm90
ZToKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGVfaW50ZWwuYwo+ID4gKysrIGIveGVu
L2FyY2gveDg2L21pY3JvY29kZV9pbnRlbC5jCj4gPiBAQCAtMTM0LDE0ICsxMzQsMjggQEAgc3Rh
dGljIGludCBjb2xsZWN0X2NwdV9pbmZvKHVuc2lnbmVkIGludCBjcHVfbnVtLCBzdHJ1Y3QgY3B1
X3NpZ25hdHVyZSAqY3NpZykKPiA+ICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+ID4gIAo+ID4gLXN0
YXRpYyBpbmxpbmUgaW50IG1pY3JvY29kZV91cGRhdGVfbWF0Y2goCj4gPiAtICAgIHVuc2lnbmVk
IGludCBjcHVfbnVtLCBjb25zdCBzdHJ1Y3QgbWljcm9jb2RlX2hlYWRlcl9pbnRlbCAqbWNfaGVh
ZGVyLAo+ID4gLSAgICBpbnQgc2lnLCBpbnQgcGYpCj4gPiArc3RhdGljIGVudW0gbWljcm9jb2Rl
X21hdGNoX3Jlc3VsdCBtaWNyb2NvZGVfdXBkYXRlX21hdGNoKAo+ID4gKyAgICBjb25zdCBzdHJ1
Y3QgbWljcm9jb2RlX2hlYWRlcl9pbnRlbCAqbWNfaGVhZGVyLCB1bnNpZ25lZCBpbnQgc2lnLAo+
ID4gKyAgICB1bnNpZ25lZCBpbnQgcGYsIHVuc2lnbmVkIGludCByZXYpCj4gPiAgewo+ID4gLSAg
ICBzdHJ1Y3QgdWNvZGVfY3B1X2luZm8gKnVjaSA9ICZwZXJfY3B1KHVjb2RlX2NwdV9pbmZvLCBj
cHVfbnVtKTsKPiA+ICsgICAgY29uc3Qgc3RydWN0IGV4dGVuZGVkX3NpZ3RhYmxlICpleHRfaGVh
ZGVyOwo+ID4gKyAgICBjb25zdCBzdHJ1Y3QgZXh0ZW5kZWRfc2lnbmF0dXJlICpleHRfc2lnOwo+
ID4gKyAgICB1bnNpZ25lZCBsb25nIGRhdGFfc2l6ZSA9IGdldF9kYXRhc2l6ZShtY19oZWFkZXIp
Owo+ID4gKyAgICB1bnNpZ25lZCBpbnQgaTsKPiA+ICsKPiA+ICsgICAgaWYgKCBzaWdtYXRjaChz
aWcsIG1jX2hlYWRlci0+c2lnLCBwZiwgbWNfaGVhZGVyLT5wZikgKQo+ID4gKyAgICAgICAgcmV0
dXJuIChtY19oZWFkZXItPnJldiA+IHJldikgPyBORVdfVUNPREUgOiBPTERfVUNPREU7Cj4gCj4g
QXMgaW5kaWNhdGVkIGJlZm9yZSwgSSB0aGluayB5b3Ugd291bGQgYmV0dGVyIGFsc28gcHJvdmlk
ZSBhbiAiZXF1YWwiCj4gaW5kaWNhdGlvbi4gSWlyYyBJJ3ZlIHRvbGQgeW91IHRoYXQgSSBoYXZl
IG9uZSBzeXN0ZW0gd2hlcmUgdGhlIGNvcmVzCj4gZ2V0IGhhbmRlZCBvdmVyIGZyb20gdGhlIEJJ
T1MgaW4gYW4gaW5jb25zaXN0ZW50IHN0YXRlIChvbmx5IGNvcmUKPiBoYXMgdWNvZGUgbG9hZGVk
KS4gSGVuY2Ugd2UnZCB3YW50IHRvIGJlIGFibGUgdG8gYWxzbyBfc3RvcmVfCj4gdWNvZGUgbWF0
Y2hpbmcgdGhhdCBmb3VuZCBvbiBDUFUgMCwgd2l0aG91dCBhY3R1YWxseSB3YW50IHRvIF9sb2Fk
Xwo+IGl0IHRoZXJlLgoKSG0sIHdpdGhvdXQgbWUgYmVpbmcgYW4gZXhwZXJ0IG9uIG1pY3JvY29k
ZSwgaXNuJ3Qgc3VjaCBhIHN5c3RlbSB1dHRlcmx5CmJyb2tlbj8KCkknbSBub3QgYWdhaW5zdCBt
YWtpbmcgWGVuIGNhcGFibGUgb2YgYm9vdGluZyBpbiB0aGlzIHNjZW5hcmlvIHdoZXJlCmZpcm13
YXJlIGxlYXZlcyB0aGUgQ1BVcyB3aXRoIGRpZmZlcmVudCBtaWNyb2NvZGUgdmVyc2lvbnMsIGJ1
dCB0aGlzCmlzIHNvbWV0aGluZyB0aGF0IHNob3VsZCBiZSByZXBvcnRlZCB0byB0aGUgdmVuZG9y
IGluIG9yZGVyIHRvIGdldCBpdApmaXhlZCBJTU8/CgpXaGF0IGhhcHBlbnMgd2hlbiB5b3UgZG9u
J3QgbG9hZCBhbnkgbWljcm9jb2RlIGF0IGFsbCwgaXMgdGhlIHN5c3RlbQpjYXBhYmxlIG9mIG9w
ZXJhdGluZyBub3JtYWxseSB3aXRoIHN1Y2ggbWl4ZWQgbWljcm9jb2RlPwoKVGhhbmtzLCBSb2dl
ci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
