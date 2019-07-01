Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F885BD98
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 16:06:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhwse-00012R-JM; Mon, 01 Jul 2019 14:02:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tezJ=U6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hhwsd-00012M-S2
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 14:02:03 +0000
X-Inumbo-ID: ccebd6ad-9c08-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ccebd6ad-9c08-11e9-8980-bc764e045a96;
 Mon, 01 Jul 2019 14:02:02 +0000 (UTC)
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
IronPort-SDR: IuA3gV4WN9wu8AvOWU4goWZlB9LVFdb7UkipUteS27lSuJgcvGDABFZ6xevFY+aLBDhA5/XDOe
 7BC3Y+7zS8xkv7FJAXsZxGB9BbzVWfuYNQgVNQrhgxfJhR7J+I8dH0cr4Zw7whQMCw9mbXiRNB
 AWUf2rJ/ocvqlc8mr8wxeE9JPcqjCxR4Rk8GX3sUsP0KuTNC+nbKZ+lINkZkqAOlmMPRCZ8H8r
 8yGJig9mZGhjUoNJKrZ9HwUkb2zmyI6VVBaRmVhucY4EMPhgVxctp2sx2BOfnjs0QmJuKPedbP
 OLQ=
X-SBRS: 2.7
X-MesageID: 2491126
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,439,1557201600"; 
   d="scan'208";a="2491126"
Date: Mon, 1 Jul 2019 16:01:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190701140153.uy5frq2kgxijxolr@MacBook-Air-de-Roger.local>
References: <20190701104903.72364-1-roger.pau@citrix.com>
 <addf8b00-6c2e-56e3-d5f8-ec7e52291638@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <addf8b00-6c2e-56e3-d5f8-ec7e52291638@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] xstate: make use_xsave non-init
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdWwgMDEsIDIwMTkgYXQgMTE6Mzk6MTZBTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDEuMDcuMjAxOSAxMjo0OSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gLS0t
IGEveGVuL2FyY2gveDg2L3hzdGF0ZS5jCj4gPiArKysgYi94ZW4vYXJjaC94ODYveHN0YXRlLmMK
PiA+IEBAIC01NzcsNyArNTc3LDcgQEAgdW5zaWduZWQgaW50IHhzdGF0ZV9jdHh0X3NpemUodTY0
IHhjcjApCj4gPiAgIC8qIENvbGxlY3QgdGhlIGluZm9ybWF0aW9uIG9mIHByb2Nlc3NvcidzIGV4
dGVuZGVkIHN0YXRlICovCj4gPiAgIHZvaWQgeHN0YXRlX2luaXQoc3RydWN0IGNwdWluZm9feDg2
ICpjKQo+ID4gICB7Cj4gPiAtICAgIHN0YXRpYyBib29sIF9faW5pdGRhdGEgdXNlX3hzYXZlID0g
dHJ1ZTsKPiA+ICsgICAgc3RhdGljIGJvb2wgdXNlX3hzYXZlID0gdHJ1ZTsKPiAKPiBQbGVhc2Ug
YXR0YWNoIGF0IGxlYXN0IGEgYnJpZWYgY29tbWVudCBoZXJlLCBzdWNoIHRoYXQgcGVvcGxlCj4g
d29uJ3QgY29uc2lkZXIgdGhlIF9faW5pdGRhdGEgbWlzc2luZy4KClN1cmUuCgo+IAo+IE9mIGNv
dXJzZSBJJ2QgYWN0dWFsbHkgcHJlZmVyIHRoZSBhbm5vdGF0aW9uIHRvIHN0YXkgaGVyZSBpbgo+
IHRoZSBnY2MgY2FzZS4gSWlyYyB0aGVyZSB3YXMgb25lIG90aGVyIGNhc2Ugd2hlcmUgdGhlcmUg
d2FzCj4gc3VjaCBhbiBpc3N1ZTsgSSBkb24ndCByZWNhbGwgd2hldGhlciB0aGVyZSBpdCB0b28g
Z290IGRlYWx0Cj4gd2l0aCBieSByZW1vdmluZyBhbiBhbm5vdGF0aW9uLgoKWWVzLCBpbiB0aGF0
IG90aGVyIGNhc2UgdGhlIGFubm90YXRpb24gd2FzIGp1c3QgcmVtb3ZlZCwgaXQncyA0M2ZhOTVh
ZSBbMF0KCj4gSG93IGFib3V0IHdlIGludHJvZHVjZSBhbgo+IGFubm90YXRpb24gdGhhdCBleHBh
bmRzIHRvIG5vdGhpbmcgaW4gdGhlIGNsYW5nIGNhc2UsIGJ1dAo+IGNvbnRpbnVlcyB0byBwcm92
aWRlIHRoZSBzYW1lIGZ1bmN0aW9uYWxpdHkgZm9yIGdjYz8gVGhhdAo+IHdvdWxkIHRoZW4gYWxz
byBjbGFyaWZ5IHRoZSByZWFzb24gZm9yIGl0IGJlaW5nIGluIGFueQo+IHBhcnRpY3VsYXIgcGxh
Y2UgKEkgZ3Vlc3MgdGhlcmUgYXJlIGdvaW5nIHRvIGJlIG1vcmUpIHdpdGhvdXQKPiB0aGUgbmVl
ZCBmb3IgZnVydGhlciBjb21tZW50YXJ5LgoKSU1PIHRoYXQncyBhIGxpdHRsZSBiaXQgZGFuZ2Vy
b3VzLCBmcm9tIHRoZSBMTFZNIGJ1ZyByZXBvcnQgaXQgc2VlbXMKbGlrZSBMTFZNIGJlaGF2aW91
ciBpcyBub3QgYSBidWcsIGFuZCBoZW5jZSBJIHdvdWxkbid0IGJlIHN1cnByaXNlZCBpZgpuZXdl
ciB2ZXJzaW9ucyBvZiBnY2MgYWxzbyBleGhpYml0IHRoZSBzYW1lIGlzc3VlLgoKVGhhbmtzLCBS
b2dlci4KClswXSBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9Y29t
bWl0O2g9NDNmYTk1YWU2YTY0MTMyYjhlYmUzMDI1YmQxODdhYjlkZjY4Njc3YgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
