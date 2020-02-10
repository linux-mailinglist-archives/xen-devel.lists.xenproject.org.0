Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E98158430
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 21:18:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1FTR-00060r-6m; Mon, 10 Feb 2020 20:16:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OCy1=36=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j1FTQ-00060m-6I
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 20:16:04 +0000
X-Inumbo-ID: 296c29a8-4c42-11ea-b472-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 296c29a8-4c42-11ea-b472-bc764e2007e4;
 Mon, 10 Feb 2020 20:16:03 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j1FTP-0005Sj-0M; Mon, 10 Feb 2020 20:16:03 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j1FTO-0007ys-NZ; Mon, 10 Feb 2020 20:16:02 +0000
Date: Mon, 10 Feb 2020 20:16:00 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Message-ID: <20200210201600.56yvn7a6pmh4lhj7@debian>
References: <20200210172829.43604-1-roger.pau@citrix.com>
 <20200210172829.43604-8-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200210172829.43604-8-roger.pau@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v4 7/7] x86/tlb: use Xen L0 assisted TLB
 flush when available
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMTAsIDIwMjAgYXQgMDY6Mjg6MjlQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IFVzZSBYZW4ncyBMMCBIVk1PUF9mbHVzaF90bGJzIGh5cGVyY2FsbCBpbiBvcmRl
ciB0byBwZXJmb3JtIGZsdXNoZXMuCj4gVGhpcyBncmVhdGx5IGluY3JlYXNlcyB0aGUgcGVyZm9y
bWFuY2Ugb2YgVExCIGZsdXNoZXMgd2hlbiBydW5uaW5nCj4gd2l0aCBhIGhpZ2ggYW1vdW50IG9m
IHZDUFVzIGFzIGEgWGVuIGd1ZXN0LCBhbmQgaXMgc3BlY2lhbGx5IGltcG9ydGFudAo+IHdoZW4g
cnVubmluZyBpbiBzaGltIG1vZGUuCj4gCj4gVGhlIGZvbGxvd2luZyBmaWd1cmVzIGFyZSBmcm9t
IGEgUFYgZ3Vlc3QgcnVubmluZyBgbWFrZSAtajMyIHhlbmAgaW4KPiBzaGltIG1vZGUgd2l0aCAz
MiB2Q1BVcyBhbmQgSEFQLgo+IAo+IFVzaW5nIHgyQVBJQyBhbmQgQUxMQlVUIHNob3J0aGFuZDoK
PiByZWFsCTRtMzUuOTczcwo+IHVzZXIJNG0zNS4xMTBzCj4gc3lzCTM2bTI0LjExN3MKPiAKPiBV
c2luZyBMMCBhc3Npc3RlZCBmbHVzaDoKPiByZWFsICAgIDFtMi41OTZzCj4gdXNlciAgICA0bTM0
LjgxOHMKPiBzeXMgICAgIDVtMTYuMzc0cwo+IAo+IFRoZSBpbXBsZW1lbnRhdGlvbiBhZGRzIGEg
bmV3IGhvb2sgdG8gaHlwZXJ2aXNvcl9vcHMgc28gb3RoZXIKPiBlbmxpZ2h0ZW5tZW50cyBjYW4g
YWxzbyBpbXBsZW1lbnQgc3VjaCBhc3Npc3RlZCBmbHVzaCBqdXN0IGJ5IGZpbGxpbmcKPiB0aGUg
aG9vay4gTm90ZSB0aGF0IHRoZSBYZW4gaW1wbGVtZW50YXRpb24gY29tcGxldGVseSBpZ25vcmVz
IHRoZQo+IGRpcnR5IENQVSBtYXNrIGFuZCB0aGUgbGluZWFyIGFkZHJlc3MgcGFzc2VkIGluLCBh
bmQgYWx3YXlzIHBlcmZvcm1zIGEKPiBnbG9iYWwgVExCIGZsdXNoIG9uIGFsbCB2Q1BVcy4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
ClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKT25lIHJlbWFyayBiZWxvdy4KClsu
Li5dCj4gIGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX29wcyAqX19pbml0IHhnX3Byb2JlKHZvaWQp
Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zbXAuYyBiL3hlbi9hcmNoL3g4Ni9zbXAuYwo+
IGluZGV4IDY1ZWI3Y2JkYTguLjliYzkyNTYxNmEgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2
L3NtcC5jCj4gKysrIGIveGVuL2FyY2gveDg2L3NtcC5jCj4gQEAgLTE1LDYgKzE1LDcgQEAKPiAg
I2luY2x1ZGUgPHhlbi9wZXJmYy5oPgo+ICAjaW5jbHVkZSA8eGVuL3NwaW5sb2NrLmg+Cj4gICNp
bmNsdWRlIDxhc20vY3VycmVudC5oPgo+ICsjaW5jbHVkZSA8YXNtL2d1ZXN0Lmg+Cj4gICNpbmNs
dWRlIDxhc20vc21wLmg+Cj4gICNpbmNsdWRlIDxhc20vbWMxNDY4MThydGMuaD4KPiAgI2luY2x1
ZGUgPGFzbS9mbHVzaHRsYi5oPgo+IEBAIC0yNTYsNiArMjU3LDE2IEBAIHZvaWQgZmx1c2hfYXJl
YV9tYXNrKGNvbnN0IGNwdW1hc2tfdCAqbWFzaywgY29uc3Qgdm9pZCAqdmEsIHVuc2lnbmVkIGlu
dCBmbGFncykKPiAgICAgIGlmICggKGZsYWdzICYgfkZMVVNIX09SREVSX01BU0spICYmCj4gICAg
ICAgICAgICFjcHVtYXNrX3N1YnNldChtYXNrLCBjcHVtYXNrX29mKGNwdSkpICkKPiAgICAgIHsK
PiArICAgICAgICBpZiAoIGNwdV9oYXNfaHlwZXJ2aXNvciAmJgo+ICsgICAgICAgICAgICAgIShm
bGFncyAmIH4oRkxVU0hfVExCIHwgRkxVU0hfVExCX0dMT0JBTCB8IEZMVVNIX1ZBX1ZBTElEIHwK
PiArICAgICAgICAgICAgICAgICAgICAgICAgIEZMVVNIX09SREVSX01BU0spKSAmJgo+ICsgICAg
ICAgICAgICAgIWh5cGVydmlzb3JfZmx1c2hfdGxiKG1hc2ssIHZhLCBmbGFncyAmIEZMVVNIX09S
REVSX01BU0spICkKCkkgd291bGQgbGlrZSBwYXNzIGluIHRoZSBmbGFnIGFzIGEgd2hvbGUgYmVj
YXVzZSBIeXBlci1WIGhhcyB0aGUKY2FwYWJpbGl0eSB0byBmaW5lIHR1bmUgd2hhdCBnZXRzIGZs
dXNoZWQuIEkgY2FuIHNlZSBGTFVTSF9UTEJfR0xPQkFMCmJlaW5nIHVzZWQgaW4gdGhhdCBzaXR1
YXRpb24uCgpUaGVyZSBpcyBubyBuZWVkIHRvIGNoYW5nZSB5b3VyIHBhdGNoIHRob3VnaC4gSSBj
YW4gc3VibWl0IGEgcGF0Y2gKbXlzZWxmIHRvIGNoYW5nZSB0aGlzIGludGVyZmFjZSBvbmNlIHlv
dXIgc2VyaWVzIGlzIGFjY2VwdGVkLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
