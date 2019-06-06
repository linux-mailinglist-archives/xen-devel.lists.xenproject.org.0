Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B0A37411
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 14:27:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYrSf-0004Wv-W8; Thu, 06 Jun 2019 12:25:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=p1/W=UF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYrSe-0004Wo-U7
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 12:25:40 +0000
X-Inumbo-ID: 319fd895-8856-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 319fd895-8856-11e9-8980-bc764e045a96;
 Thu, 06 Jun 2019 12:25:39 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 06 Jun 2019 06:25:38 -0600
Message-Id: <5CF906400200007800235ED6@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Thu, 06 Jun 2019 06:25:36 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <aisaila@bitdefender.com>
References: <20190606121548.2075-1-aisaila@bitdefender.com>
In-Reply-To: <20190606121548.2075-1-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v1] x86/altp2m: Add
 xc_altp2m_get_vcpu_p2m_idx
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

Pj4+IE9uIDA2LjA2LjE5IGF0IDE0OjE2LCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IEBAIC00NzM1LDYgKzQ3MzYsMjkgQEAgc3RhdGljIGludCBkb19hbHRwMm1fb3AoCj4gICAg
ICAgICAgICAgICAgICAgICAgX2dmbihhLnUuY2hhbmdlX2dmbi5vbGRfZ2ZuKSwKPiAgICAgICAg
ICAgICAgICAgICAgICBfZ2ZuKGEudS5jaGFuZ2VfZ2ZuLm5ld19nZm4pKTsKPiAgICAgICAgICBi
cmVhazsKPiArCj4gKyAgICBjYXNlIEhWTU9QX2FsdHAybV9nZXRfcDJtX2lkeDoKPiArICAgIHsK
PiArICAgICAgICBzdHJ1Y3QgdmNwdSAqdjsKPiArCj4gKyAgICAgICAgaWYgKCBhLnUuZ2V0X3Zj
cHVfcDJtX2lkeC52Y3B1X2lkID49IGQtPm1heF92Y3B1cyApCj4gKyAgICAgICAgewo+ICsgICAg
ICAgICAgICByYyA9IC1FSU5WQUw7Cj4gKyAgICAgICAgICAgIGJyZWFrOwo+ICsgICAgICAgIH0K
PiArCj4gKyAgICAgICAgaWYgKCAhYWx0cDJtX2FjdGl2ZShkKSApCj4gKyAgICAgICAgewo+ICsg
ICAgICAgICAgICByYyA9IC1FT1BOT1RTVVBQOwo+ICsgICAgICAgICAgICBicmVhazsKPiArICAg
ICAgICB9Cj4gKwo+ICsgICAgICAgIHYgPSBkLT52Y3B1W2EudS5nZXRfdmNwdV9wMm1faWR4LnZj
cHVfaWRdOwoKUGxlYXNlIGNhbiB5b3UgYXZvaWQgcmUtaW50cm9kdWNpbmcgdGhpcyBhY2Nlc3Mg
cGF0dGVybj8gV2UgaGF2ZQpkb21haW5fdmNwdSgpIG5vdyBleGFjdGx5IGZvciB0aGlzIHB1cnBv
c2UuCgo+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9odm0vaHZtX29wLmgKPiArKysgYi94ZW4v
aW5jbHVkZS9wdWJsaWMvaHZtL2h2bV9vcC5oCj4gQEAgLTMwNCw2ICszMDQsMTQgQEAgc3RydWN0
IHhlbl9odm1fYWx0cDJtX2NoYW5nZV9nZm4gewo+ICB0eXBlZGVmIHN0cnVjdCB4ZW5faHZtX2Fs
dHAybV9jaGFuZ2VfZ2ZuIHhlbl9odm1fYWx0cDJtX2NoYW5nZV9nZm5fdDsKPiAgREVGSU5FX1hF
Tl9HVUVTVF9IQU5ETEUoeGVuX2h2bV9hbHRwMm1fY2hhbmdlX2dmbl90KTsKPiAgCj4gK3N0cnVj
dCB4ZW5faHZtX2FsdHAybV9nZXRfdmNwdV9wMm1faWR4IHsKPiArICAgIHVpbnQzMl90IHZjcHVf
aWQ7Cj4gKyAgICB1aW50MTZfdCBhbHRwMm1faWR4Owo+ICt9Owo+ICt0eXBlZGVmIHN0cnVjdCB4
ZW5faHZtX2FsdHAybV9nZXRfdmNwdV9wMm1faWR4Cj4gKyAgICAgICAgICAgICAgIHhlbl9odm1f
YWx0cDJtX2dldF92Y3B1X3AybV9pZHhfdDsKPiArREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUoeGVu
X2h2bV9hbHRwMm1fZ2V0X3ZjcHVfcDJtX2lkeF90KTsKCldoYXQgZG8geW91IG5lZWQgdGhpcyB0
eXBlIGFuZCBoYW5kbGUgZm9yPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
