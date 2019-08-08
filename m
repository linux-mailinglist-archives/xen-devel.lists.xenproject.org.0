Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6DB85F0A
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 11:53:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvf3a-0006V8-6u; Thu, 08 Aug 2019 09:50:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gKpt=WE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hvf3Y-0006Od-BH
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 09:50:00 +0000
X-Inumbo-ID: e254f2ac-b9c1-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e254f2ac-b9c1-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 09:49:59 +0000 (UTC)
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
IronPort-SDR: Zh7Atdi/FV6BdMTI41ZtaIiUYzLSuVNaZG1yrdYrpUzLzFi5Jzr6oPul15BA+mFSLH2U+uTkqP
 CnSOWd4hZZ6Lm2Iyp36i8NrNIJyWUtut3Tbrg3J6PZjcPvENLPQxJ0GPF+I7fHQwXped2LNbLv
 xuLY6jWbqLwRiAYY5TGpDoAYo6TYh5OCVaclFzYq9LzI7ohSDgtJMSwR9jgh3UTeHQ4nw4jnPu
 PpfPTjxT0IUS/gUAlc6Q6byTtcFF7VPdvjF+Z/V41X59UabxP2Cj4Z74iebhh0tCNwjU9kT2ZN
 d9I=
X-SBRS: 2.7
X-MesageID: 4015949
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,360,1559534400"; 
   d="scan'208";a="4015949"
Date: Thu, 8 Aug 2019 11:49:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190808094948.v3abeth65nmhxuok@Air-de-Roger>
References: <20190807194143.1351-1-andrew.cooper3@citrix.com>
 <ad94d279-e53c-b1ae-c333-096944b217dd@suse.com>
 <2e3a40d8-14ec-9f84-6a43-d7389bdbebf8@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2e3a40d8-14ec-9f84-6a43-d7389bdbebf8@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Terminology for "guest" - Was: [PATCH] docs/sphinx:
 Introduction
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Ian
 Jackson <ian.jackson@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMDgsIDIwMTkgYXQgMDk6NDM6MDFBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAwOC8wOC8yMDE5IDA3OjIyLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+IE9uIDA3
LjA4LjIwMTkgMjE6NDEsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gPj4gLS0tIC9kZXYvbnVsbAo+
ID4+ICsrKyBiL2RvY3MvZ2xvc3NhcnkucnN0Cj4gPj4gQEAgLTAsMCArMSwzNyBAQAo+ID4+ICtH
bG9zc2FyeQo+ID4+ICs9PT09PT09PQo+ID4+ICsKPiA+PiArLi4gVGVybXMgc2hvdWxkIGFwcGVh
ciBpbiBhbHBoYWJldGljYWwgb3JkZXIKPiA+PiArCj4gPj4gKy4uIGdsb3NzYXJ5OjoKPiA+PiAr
Cj4gPj4gK8KgwqAgY29udHJvbCBkb21haW4KPiA+PiArwqDCoMKgwqAgQSA6dGVybTpgZG9tYWlu
YCwgY29tbW9ubHkgZG9tMCwgd2l0aCB0aGUgcGVybWlzc2lvbiBhbmQKPiA+PiByZXNwb25zaWJp
bGl0eQo+ID4+ICvCoMKgwqDCoCB0byBjcmVhdGUgYW5kIG1hbmFnZSBvdGhlciBkb21haW5zIG9u
IHRoZSBzeXN0ZW0uCj4gPj4gKwo+ID4+ICvCoMKgIGRvbWFpbgo+ID4+ICvCoMKgwqDCoCBBIGRv
bWFpbiBpcyBYZW4ncyB1bml0IG9mIHJlc291cmNlIG93bmVyc2hpcCwgYW5kIGdlbmVyYWxseSBo
YXMKPiA+PiBhdCB0aGUKPiA+PiArwqDCoMKgwqAgbWluaW11bSBzb21lIFJBTSBhbmQgdmlydHVh
bCBDUFVzLgo+ID4+ICsKPiA+PiArwqDCoMKgwqAgVGhlIHRlcm1zIDp0ZXJtOmBkb21haW5gIGFu
ZCA6dGVybTpgZ3Vlc3RgIGFyZSBjb21tb25seSB1c2VkCj4gPj4gK8KgwqDCoMKgIGludGVyY2hh
bmdlYWJseSwgYnV0IHRoZXkgbWVhbiBzdWJ0bHkgZGlmZmVyZW50IHRoaW5ncy4KPiA+PiArCj4g
Pj4gK8KgwqDCoMKgIEEgZ3Vlc3QgaXMgYSBzaW5nbGUgdmlydHVhbCBtYWNoaW5lLgo+ID4+ICsK
PiA+PiArwqDCoMKgwqAgQ29uc2lkZXIgdGhlIGNhc2Ugb2YgbGl2ZSBtaWdyYXRpb24gd2hlcmUs
IGZvciBhIHBlcmlvZCBvZgo+ID4+IHRpbWUsIG9uZQo+ID4+ICvCoMKgwqDCoCBndWVzdCB3aWxs
IGJlIGNvbXByaXNlZCBvZiB0d28gZG9tYWlucywgd2hpbGUgaXQgaXMgaW4gdHJhbnNpdC4KPiA+
PiArCj4gPj4gK8KgwqAgZG9taWQKPiA+PiArwqDCoMKgwqAgVGhlIG51bWVyaWMgaWRlbnRpZmll
ciBvZiBhIHJ1bm5pbmcgOnRlcm06YGRvbWFpbmAuwqAgSXQgaXMKPiA+PiB1bmlxdWUgdG8gYQo+
ID4+ICvCoMKgwqDCoCBzaW5nbGUgaW5zdGFuY2Ugb2YgWGVuLCB1c2VkIGFzIHRoZSBpZGVudGlm
aWVyIGluIHZhcmlvdXMgQVBJcywKPiA+PiBhbmQgaXMKPiA+PiArwqDCoMKgwqAgdHlwaWNhbGx5
IGFsbG9jYXRlZCBzZXF1ZW50aWFsbHkgZnJvbSAwLgo+ID4+ICsKPiA+PiArwqDCoCBndWVzdAo+
ID4+ICvCoMKgwqDCoCBTZWUgOnRlcm06YGRvbWFpbmAKPiA+Cj4gPiBJIHRoaW5rIHlvdSB3YW50
IHRvIG1lbnRpb24gdGhlIHVzdWFsIGRpc3RpbmN0aW9uIGhlcmU6IERvbTAgaXMsCj4gPiB3aGls
ZSBhIGRvbWFpbiwgY29tbW9ubHkgbm90IGNvbnNpZGVyZWQgYSBndWVzdC4KPiAKPiBUbyBiZSBo
b25lc3QsIEkgaGFkIHRvdGFsbHkgZm9yZ290dGVuIGFib3V0IHRoYXQuwqAgSSBndWVzcyBub3cg
aXMgdGhlCj4gcHJvcGVyIHRpbWUgdG8gcmVoYXNoIGl0IGluIHB1YmxpYy4KPiAKPiBJIGRvbid0
IHRoaW5rIHRoZSB3YXkgaXQgY3VycmVudGx5IGdldHMgdXNlZCBoYXMgYSBjbGVhciBvciBjb2hl
cmVudCBzZXQKPiBvZiBydWxlcywgYmVjYXVzZSBJIGNhbid0IHRoaW5rIG9mIGFueSB0byBkZXNj
cmliZSBob3cgaXQgZG9lcyBnZXQgdXNlZC4KPiAKPiBFaXRoZXIgdGhlcmUgYXJlIGEgY2xlYXIg
YW5kIGNvaGVyZW50IChhbmQgc2ltcGxlISkgc2V0IG9mIHJ1bGVzIGZvcgo+IHdoYXQgd2UgbWVh
biBieSAiZ3Vlc3QiLCBhdCB3aGljaCBwb2ludCB0aGV5IGNhbiBsaXZlIGhlcmUgaW4gdGhlCj4g
Z2xvc3NhcnksIG9yIHRoZSBmdXp6eSB3YXkgaXQgaXMgY3VycmVudCB1c2VkIHNob3VsZCBjZWFz
ZS4KCkkndmUgYWx3YXlzIHJlZmVycmVkIHRvIGRvbTAgYXMgYSBwcml2aWxlZ2VkIGd1ZXN0LCBi
dXQgYSBndWVzdAphZnRlciBhbGwuIEkgdGhpbmsgdGhpcyBpcyBvbmUgb2YgdGhlIGRpZmZlcmVu
Y2VzIG9mIFhlbiB2cyBLVk0gb3IKb3RoZXIgaG9zdGVkIGh5cGVydmlzb3JzLgoKUm9nZXIuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
