Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DDCA85C7
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 16:52:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5Way-0002z8-AJ; Wed, 04 Sep 2019 14:49:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Tt/v=W7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5Waw-0002z3-S3
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 14:49:14 +0000
X-Inumbo-ID: 295d03e8-cf23-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 295d03e8-cf23-11e9-978d-bc764e2007e4;
 Wed, 04 Sep 2019 14:49:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 04072B678;
 Wed,  4 Sep 2019 14:49:12 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-11-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <35cdea2f-f271-f23f-8b90-e7159e971bd1@suse.com>
Date: Wed, 4 Sep 2019 16:49:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809145833.1020-11-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 10/48] xen/sched: add scheduler helpers
 hiding vcpu
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDguMjAxOSAxNjo1NywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBBZGQgdGhlIGZvbGxv
d2luZyBoZWxwZXJzIHVzaW5nIGEgc2NoZWRfdW5pdCBhcyBpbnB1dCBpbnN0ZWFkIG9mIGEKPiB2
Y3B1Ogo+IAo+IC0gaXNfaWRsZV91bml0KCkgc2ltaWxhciB0byBpc19pZGxlX3ZjcHUoKQo+IC0g
aXNfdW5pdF9vbmxpbmUoKSBzaW1pbGFyIHRvIGlzX3ZjcHVfb25saW5lKCkKPiAtIHVuaXRfcnVu
bmFibGUoKSBsaWtlIHZjcHVfcnVubmFibGUoKQoKU2luY2UgZm9yIHZDUFUtcyB3aXRoaW4gYSB1
bml0IHRoZSByZXR1cm4gdmFsdWVzIGNhbiB2YXJ5LCBJIHRoaW5rCml0IHdvdWxkIGJlIG5pY2Ug
aWYgeW91IG1hZGUgZXhwbGljaXQgaGVyZSB3aGF0IHRoZSB1bml0LXdpZGUgcmV0dXJuCnZhbHVl
cyBhcmUgbWVhbnQgdG8gbWVhbiBpbiBzdWNoIGEgY2FzZSAoYW5kIHdoeSB0aGUgY2hvc2VuCmFs
dGVybmF0aXZlIGlzIGJldHRlciB0aGFuIHRoZSBvdGhlciBvbmUpLgoKPiAtIHNjaGVkX3NldF9y
ZXMoKSB0byBzZXQgdGhlIGN1cnJlbnQgcHJvY2Vzc29yIG9mIGFuIHVuaXQKPiAtIHNjaGVkX3Vu
aXRfY3B1KCkgdG8gZ2V0IHRoZSBjdXJyZW50IHByb2Nlc3NvciBvZiBhbiB1bml0CgpXaGF0IGlz
ICJ0aGUgcHJvY2Vzc29yIG9mIGEgdW5pdCIgd2hlbiB0aGVyZSBhcmUgbXVsdGlwbGUKZW50aXRp
ZXMgd2l0aGluIGEgdW5pdCwgYW5kIGhlbmNlIG11bHRpcGxlIHByb2Nlc3NvcnMgbmVlZGVkCmlu
IG9yZGVyIHRvIHJ1biB0aGUgdW5pdD8KCj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlm
LmgKPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQtaWYuaAo+IEBAIC01OSw2ICs1OSw2MiBA
QCBzdGF0aWMgaW5saW5lIHZvaWQgc2V0X3NjaGVkX3Jlcyh1bnNpZ25lZCBpbnQgY3B1LCBzdHJ1
Y3Qgc2NoZWRfcmVzb3VyY2UgKnJlcykKPiAgICAgIHBlcl9jcHUoc2NoZWRfcmVzLCBjcHUpID0g
cmVzOwo+ICB9Cj4gIAo+ICtzdGF0aWMgaW5saW5lIGJvb2wgaXNfaWRsZV91bml0KGNvbnN0IHN0
cnVjdCBzY2hlZF91bml0ICp1bml0KQo+ICt7Cj4gKyAgICByZXR1cm4gaXNfaWRsZV92Y3B1KHVu
aXQtPnZjcHVfbGlzdCk7Cj4gK30KPiArCj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBpc191bml0X29u
bGluZShjb25zdCBzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCkKPiArewo+ICsgICAgcmV0dXJuIGlz
X3ZjcHVfb25saW5lKHVuaXQtPnZjcHVfbGlzdCk7Cj4gK30KPiArCj4gK3N0YXRpYyBpbmxpbmUg
Ym9vbCB1bml0X3J1bm5hYmxlKGNvbnN0IHN0cnVjdCBzY2hlZF91bml0ICp1bml0KQo+ICt7Cj4g
KyAgICByZXR1cm4gdmNwdV9ydW5uYWJsZSh1bml0LT52Y3B1X2xpc3QpOwo+ICt9Cj4gCj4gK3N0
YXRpYyBpbmxpbmUgdm9pZCBzY2hlZF9zZXRfcmVzKHN0cnVjdCBzY2hlZF91bml0ICp1bml0LAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgc2NoZWRfcmVzb3VyY2Ug
KnJlcykKPiArewo+ICsgICAgdW5pdC0+dmNwdV9saXN0LT5wcm9jZXNzb3IgPSByZXMtPnByb2Nl
c3NvcjsKPiArICAgIHVuaXQtPnJlcyA9IHJlczsKPiArfQo+ICsKPiArc3RhdGljIGlubGluZSB1
bnNpZ25lZCBpbnQgc2NoZWRfdW5pdF9jcHUoc3RydWN0IHNjaGVkX3VuaXQgKnVuaXQpCj4gK3sK
PiArICAgIHJldHVybiB1bml0LT5yZXMtPnByb2Nlc3NvcjsKPiArfQo+ICsKPiArc3RhdGljIGlu
bGluZSB2b2lkIHNjaGVkX3NldF9wYXVzZV9mbGFncyhzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCwK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQg
Yml0KQo+ICt7Cj4gKyAgICBfX3NldF9iaXQoYml0LCAmdW5pdC0+dmNwdV9saXN0LT5wYXVzZV9m
bGFncyk7Cj4gK30KPiArCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBzY2hlZF9jbGVhcl9wYXVzZV9m
bGFncyhzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCwKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBiaXQpCj4gK3sKPiArICAgIF9fY2xlYXJf
Yml0KGJpdCwgJnVuaXQtPnZjcHVfbGlzdC0+cGF1c2VfZmxhZ3MpOwo+ICt9Cj4gKwo+ICtzdGF0
aWMgaW5saW5lIHZvaWQgc2NoZWRfc2V0X3BhdXNlX2ZsYWdzX2F0b21pYyhzdHJ1Y3Qgc2NoZWRf
dW5pdCAqdW5pdCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgaW50IGJpdCkKPiArewo+ICsgICAgc2V0X2JpdChiaXQsICZ1bml0LT52
Y3B1X2xpc3QtPnBhdXNlX2ZsYWdzKTsKPiArfQo+ICsKPiArc3RhdGljIGlubGluZSB2b2lkIHNj
aGVkX2NsZWFyX3BhdXNlX2ZsYWdzX2F0b21pYyhzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCwKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25l
ZCBpbnQgYml0KQo+ICt7Cj4gKyAgICBjbGVhcl9iaXQoYml0LCAmdW5pdC0+dmNwdV9saXN0LT5w
YXVzZV9mbGFncyk7Cj4gK30KCkFuZCB3aXRoIHRoZSBhYm92ZSAtIGFyZSBzb21lL2FsbCBvZiB0
aGVzZSBnb2luZyB0byByZW1haW4gbGlrZQp0aGlzLCBvciB3aWxsIHRoZXkgZ2FpbiBmb3JfZWFj
aC1zdHlsZSBsb29wcyBsYXRlcj8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
