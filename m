Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B51E32D26
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 11:49:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXjZP-0003qO-M0; Mon, 03 Jun 2019 09:47:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TYzS=UC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hXjZO-0003qI-Pb
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 09:47:58 +0000
X-Inumbo-ID: aa7faa71-85e4-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id aa7faa71-85e4-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 09:47:57 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 03 Jun 2019 03:47:56 -0600
Message-Id: <5CF4ECC6020000780023483A@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 03 Jun 2019 03:47:50 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Stefano Stabellini" <sstabellini@kernel.org>
References: <20190531230056.14506-1-sstabellini@kernel.org>
In-Reply-To: <20190531230056.14506-1-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] xen: debug_registers_trap,
 perf_counters_trap, and "static_partitioning"
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
Cc: Tim Deegan <tim@xen.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <stefanos@xilinx.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAxLjA2LjE5IGF0IDAxOjAwLCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gLS0tIGEveGVuL2FyY2gvYXJtL3RyYXBzLmMKPiArKysgYi94ZW4vYXJjaC9hcm0vdHJhcHMu
Ywo+IEBAIC0xMTgsNiArMTE4LDI4IEBAIHN0YXRpYyBpbnQgX19pbml0IHBhcnNlX3Z3ZmkoY29u
c3QgY2hhciAqcykKPiAgfQo+ICBjdXN0b21fcGFyYW0oInZ3ZmkiLCBwYXJzZV92d2ZpKTsKPiAg
Cj4gK3N0YXRpYyBib29sIGRlYnVnX3JlZ2lzdGVyc190cmFwID0gdHJ1ZTsKPiArc3RhdGljIGJv
b2wgcGVyZl9jb3VudGVyc190cmFwID0gdHJ1ZTsKPiArCj4gK3N0YXRpYyBpbnQgX19pbml0IG9w
dF9zdGF0aWNfcGFydGl0aW9uaW5nKGNvbnN0IGNoYXIgKnMpCj4gK3sKPiArICAgIGlmICggc3Ry
Y21wKHMsICJ0cnVlIikgJiYgCj4gKyAgICAgICAgIHN0cmNtcChzLCAiVHJ1ZSIpICYmCj4gKyAg
ICAgICAgIHN0cmNtcChzLCAiMSIpICkKPiArICAgICAgICByZXR1cm4gMDsKPiArCj4gKyAgICB2
d2ZpID0gTkFUSVZFOwo+ICsgICAgZGVidWdfcmVnaXN0ZXJzX3RyYXAgPSBmYWxzZTsKPiArICAg
IHBlcmZfY291bnRlcnNfdHJhcCA9IGZhbHNlOwo+ICsgICAgbWVtY3B5KG9wdF9zY2hlZCwgIm51
bGwiLCA1KTsKPiArCj4gKyAgICAvKiBEaXNhYmxlIFRyYXAgRGVidWcgYW5kIFBlcmZvcm1hbmNl
IE1vbml0b3Igbm93IGZvciBDUFUwICovCj4gKyAgICBXUklURV9TWVNSRUcoSERDUl9URFJBLCBN
RENSX0VMMik7Cj4gKwo+ICsgICAgcmV0dXJuIDA7Cj4gK30KPiArY3VzdG9tX3BhcmFtKCJzdGF0
aWNfcGFydGl0aW9uaW5nIiwgb3B0X3N0YXRpY19wYXJ0aXRpb25pbmcpOwoKUGxlYXNlIG5vIHVu
ZGVyc2NvcmVzIGFueW1vcmUgaW4gbmV3IG9wdGlvbiBuYW1lcywgYXQgbGVhc3QgdW50aWwKd2Ug
cGVyaGFwcyBpbXBsZW1lbnQgc3RyaW5nIGNvbXBhcmlzb24gdG8gdHJlYXQgdW5kZXJzY29yZSBh
bmQKZGFzaCBhcyBtYXRjaGluZyB1cC4KCj4gLS0tIGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jCj4g
KysrIGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCj4gQEAgLTM5LDcgKzM5LDcgQEAKPiAgI2luY2x1
ZGUgPHhlbi9lcnIuaD4KPiAgCj4gIC8qIG9wdF9zY2hlZDogc2NoZWR1bGVyIC0gZGVmYXVsdCB0
byBjb25maWd1cmVkIHZhbHVlICovCj4gLXN0YXRpYyBjaGFyIF9faW5pdGRhdGEgb3B0X3NjaGVk
WzEwXSA9IENPTkZJR19TQ0hFRF9ERUZBVUxUOwo+ICtjaGFyIF9faW5pdGRhdGEgb3B0X3NjaGVk
WzEwXSA9IENPTkZJR19TQ0hFRF9ERUZBVUxUOwo+ICBzdHJpbmdfcGFyYW0oInNjaGVkIiwgb3B0
X3NjaGVkKTsKPiAgCj4gIC8qIGlmIHNjaGVkX3NtdF9wb3dlcl9zYXZpbmdzIGlzIHNldCwKPiAt
LS0gYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hl
ZC5oCj4gQEAgLTkwNiw2ICs5MDYsNyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgaXNfdmNwdV9vbmxp
bmUoY29uc3Qgc3RydWN0IHZjcHUgKnYpCj4gIH0KPiAgCj4gIGV4dGVybiBib29sIHNjaGVkX3Nt
dF9wb3dlcl9zYXZpbmdzOwo+ICtleHRlcm4gY2hhciBvcHRfc2NoZWRbMTBdOwoKVGhpcywgaW1v
LCBpcyBhIGxheWVyaW5nIHZpb2xhdGlvbiwgYW5kIGhlbmNlIHNob3VsZCBiZSBzb2x2ZWQgaW4g
YQpkaWZmZXJlbnQgd2F5LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
