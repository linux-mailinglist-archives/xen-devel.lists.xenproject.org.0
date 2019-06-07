Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC033896B
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2019 13:53:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hZDOD-0007gk-Ui; Fri, 07 Jun 2019 11:50:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/Vp6=UG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hZDOC-0007gf-DY
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2019 11:50:32 +0000
X-Inumbo-ID: 732db3e3-891a-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 732db3e3-891a-11e9-8980-bc764e045a96;
 Fri, 07 Jun 2019 11:50:30 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 07 Jun 2019 05:50:29 -0600
Message-Id: <5CFA4F850200007800236337@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 07 Jun 2019 05:50:29 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <aisaila@bitdefender.com>
References: <20190607105449.28167-1-aisaila@bitdefender.com>
In-Reply-To: <20190607105449.28167-1-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3] x86/altp2m: Add a new hypercall to get
 the active altp2m index
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA3LjA2LjE5IGF0IDEyOjU1LCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IEBAIC00NzM1LDYgKzQ3MzYsMjggQEAgc3RhdGljIGludCBkb19hbHRwMm1fb3AoCj4gICAg
ICAgICAgICAgICAgICAgICAgX2dmbihhLnUuY2hhbmdlX2dmbi5vbGRfZ2ZuKSwKPiAgICAgICAg
ICAgICAgICAgICAgICBfZ2ZuKGEudS5jaGFuZ2VfZ2ZuLm5ld19nZm4pKTsKPiAgICAgICAgICBi
cmVhazsKPiArCj4gKyAgICBjYXNlIEhWTU9QX2FsdHAybV9nZXRfcDJtX2lkeDoKPiArICAgIHsK
PiArICAgICAgICBzdHJ1Y3QgdmNwdSAqdjsKPiArCj4gKyAgICAgICAgaWYgKCAhYWx0cDJtX2Fj
dGl2ZShkKSApCj4gKyAgICAgICAgewo+ICsgICAgICAgICAgICByYyA9IC1FT1BOT1RTVVBQOwo+
ICsgICAgICAgICAgICBicmVhazsKPiArICAgICAgICB9Cj4gKwo+ICsgICAgICAgIGlmICggKHYg
PSBkb21haW5fdmNwdShkLCBhLnUuZ2V0X3ZjcHVfcDJtX2lkeC52Y3B1X2lkKSkgPT0gTlVMTCAp
Cj4gKyAgICAgICAgewo+ICsgICAgICAgICAgICByYyA9IC1FSU5WQUw7Cj4gKyAgICAgICAgICAg
IGJyZWFrOwo+ICsgICAgICAgIH0KClRoZSBvcmRlciBvZiByZXR1cm4gdmFsdWVzIHdhcyB0aGUg
b3RoZXIgd2F5IGFyb3VuZCBiZWZvcmUsIGJ1dApJIHN1cHBvc2UgdGhpcyBkb2Vzbid0IG1hdHRl
ciBtdWNoPwoKPiArICAgICAgICBhLnUuZ2V0X3ZjcHVfcDJtX2lkeC5hbHRwMm1faWR4ID0gYWx0
cDJtX3ZjcHVfaWR4KHYpOwo+ICsgICAgICAgIHJjID0gX19jb3B5X3RvX2d1ZXN0KGFyZywgJmEs
IDEpID8gLUVGQVVMVCA6IDA7CgpKdXN0IGFzIHJlbWFyayBmb3IgdGhlIGZ1dHVyZSAoSSBkaWRu
J3QgcGF5IGF0dGVudGlvbiBiZWZvcmUsCmFuZCB0aGUgZGlmZmVyZW5jZSBpc24ndCBvdmVybHkg
bWVhbmluZ2Z1bCBmb3Igb3BlcmF0aW9ucyB0aGF0CmRvbid0IG9jY3VyIGZyZXF1ZW50bHkpIC0g
X19jb3B5X2ZpZWxkX3RvX2d1ZXN0KCkgd291bGQgYmUKbGVzcyBvdmVyaGVhZCBoZXJlLiBPaCwg
cmlnaHQgLSB0aGlzIGlzIG9uY2UgYWdhaW4gbm90IHBvc3NpYmxlCmJlY2F1c2Ugb2YgYXJnIChz
dGlsbCkgYmVpbmcgYSBoYW5kbGUgb2Ygdm9pZC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
