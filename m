Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E315FAFDB1
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 15:26:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i82Zt-0007r7-GK; Wed, 11 Sep 2019 13:22:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=s4Ct=XG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i82Zs-0007r2-AG
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 13:22:32 +0000
X-Inumbo-ID: 3434ab81-d497-11e9-83d5-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3434ab81-d497-11e9-83d5-12813bfff9fa;
 Wed, 11 Sep 2019 13:22:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 32303ADEF;
 Wed, 11 Sep 2019 13:22:30 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-11-jgross@suse.com>
 <35cdea2f-f271-f23f-8b90-e7159e971bd1@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <bae4befe-2de6-1823-0c60-1a7a4f6ff9cd@suse.com>
Date: Wed, 11 Sep 2019 15:22:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <35cdea2f-f271-f23f-8b90-e7159e971bd1@suse.com>
Content-Language: de-DE
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDkuMTkgMTY6NDksIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA5LjA4LjIwMTkgMTY6
NTcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IEFkZCB0aGUgZm9sbG93aW5nIGhlbHBlcnMgdXNp
bmcgYSBzY2hlZF91bml0IGFzIGlucHV0IGluc3RlYWQgb2YgYQo+PiB2Y3B1Ogo+Pgo+PiAtIGlz
X2lkbGVfdW5pdCgpIHNpbWlsYXIgdG8gaXNfaWRsZV92Y3B1KCkKPj4gLSBpc191bml0X29ubGlu
ZSgpIHNpbWlsYXIgdG8gaXNfdmNwdV9vbmxpbmUoKQo+PiAtIHVuaXRfcnVubmFibGUoKSBsaWtl
IHZjcHVfcnVubmFibGUoKQo+IAo+IFNpbmNlIGZvciB2Q1BVLXMgd2l0aGluIGEgdW5pdCB0aGUg
cmV0dXJuIHZhbHVlcyBjYW4gdmFyeSwgSSB0aGluawo+IGl0IHdvdWxkIGJlIG5pY2UgaWYgeW91
IG1hZGUgZXhwbGljaXQgaGVyZSB3aGF0IHRoZSB1bml0LXdpZGUgcmV0dXJuCj4gdmFsdWVzIGFy
ZSBtZWFudCB0byBtZWFuIGluIHN1Y2ggYSBjYXNlIChhbmQgd2h5IHRoZSBjaG9zZW4KPiBhbHRl
cm5hdGl2ZSBpcyBiZXR0ZXIgdGhhbiB0aGUgb3RoZXIgb25lKS4KPiAKPj4gLSBzY2hlZF9zZXRf
cmVzKCkgdG8gc2V0IHRoZSBjdXJyZW50IHByb2Nlc3NvciBvZiBhbiB1bml0Cj4+IC0gc2NoZWRf
dW5pdF9jcHUoKSB0byBnZXQgdGhlIGN1cnJlbnQgcHJvY2Vzc29yIG9mIGFuIHVuaXQKPiAKPiBX
aGF0IGlzICJ0aGUgcHJvY2Vzc29yIG9mIGEgdW5pdCIgd2hlbiB0aGVyZSBhcmUgbXVsdGlwbGUK
PiBlbnRpdGllcyB3aXRoaW4gYSB1bml0LCBhbmQgaGVuY2UgbXVsdGlwbGUgcHJvY2Vzc29ycyBu
ZWVkZWQKPiBpbiBvcmRlciB0byBydW4gdGhlIHVuaXQ/Cj4gCj4+IC0tLSBhL3hlbi9pbmNsdWRl
L3hlbi9zY2hlZC1pZi5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oCj4+IEBA
IC01OSw2ICs1OSw2MiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgc2V0X3NjaGVkX3Jlcyh1bnNpZ25l
ZCBpbnQgY3B1LCBzdHJ1Y3Qgc2NoZWRfcmVzb3VyY2UgKnJlcykKPj4gICAgICAgcGVyX2NwdShz
Y2hlZF9yZXMsIGNwdSkgPSByZXM7Cj4+ICAgfQo+PiAgIAo+PiArc3RhdGljIGlubGluZSBib29s
IGlzX2lkbGVfdW5pdChjb25zdCBzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCkKPj4gK3sKPj4gKyAg
ICByZXR1cm4gaXNfaWRsZV92Y3B1KHVuaXQtPnZjcHVfbGlzdCk7Cj4+ICt9Cj4+ICsKPj4gK3N0
YXRpYyBpbmxpbmUgYm9vbCBpc191bml0X29ubGluZShjb25zdCBzdHJ1Y3Qgc2NoZWRfdW5pdCAq
dW5pdCkKPj4gK3sKPj4gKyAgICByZXR1cm4gaXNfdmNwdV9vbmxpbmUodW5pdC0+dmNwdV9saXN0
KTsKPj4gK30KPj4gKwo+PiArc3RhdGljIGlubGluZSBib29sIHVuaXRfcnVubmFibGUoY29uc3Qg
c3RydWN0IHNjaGVkX3VuaXQgKnVuaXQpCj4+ICt7Cj4+ICsgICAgcmV0dXJuIHZjcHVfcnVubmFi
bGUodW5pdC0+dmNwdV9saXN0KTsKPj4gK30KPj4KPj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBzY2hl
ZF9zZXRfcmVzKHN0cnVjdCBzY2hlZF91bml0ICp1bml0LAo+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc3RydWN0IHNjaGVkX3Jlc291cmNlICpyZXMpCj4+ICt7Cj4+ICsgICAg
dW5pdC0+dmNwdV9saXN0LT5wcm9jZXNzb3IgPSByZXMtPnByb2Nlc3NvcjsKPj4gKyAgICB1bml0
LT5yZXMgPSByZXM7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyBpbmxpbmUgdW5zaWduZWQgaW50IHNj
aGVkX3VuaXRfY3B1KHN0cnVjdCBzY2hlZF91bml0ICp1bml0KQo+PiArewo+PiArICAgIHJldHVy
biB1bml0LT5yZXMtPnByb2Nlc3NvcjsKPj4gK30KPj4gKwo+PiArc3RhdGljIGlubGluZSB2b2lk
IHNjaGVkX3NldF9wYXVzZV9mbGFncyhzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCwKPj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGJpdCkKPj4g
K3sKPj4gKyAgICBfX3NldF9iaXQoYml0LCAmdW5pdC0+dmNwdV9saXN0LT5wYXVzZV9mbGFncyk7
Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBzY2hlZF9jbGVhcl9wYXVzZV9mbGFn
cyhzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgYml0KQo+PiArewo+PiArICAgIF9fY2xlYXJf
Yml0KGJpdCwgJnVuaXQtPnZjcHVfbGlzdC0+cGF1c2VfZmxhZ3MpOwo+PiArfQo+PiArCj4+ICtz
dGF0aWMgaW5saW5lIHZvaWQgc2NoZWRfc2V0X3BhdXNlX2ZsYWdzX2F0b21pYyhzdHJ1Y3Qgc2No
ZWRfdW5pdCAqdW5pdCwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVuc2lnbmVkIGludCBiaXQpCj4+ICt7Cj4+ICsgICAgc2V0X2JpdChiaXQsICZ1
bml0LT52Y3B1X2xpc3QtPnBhdXNlX2ZsYWdzKTsKPj4gK30KPj4gKwo+PiArc3RhdGljIGlubGlu
ZSB2b2lkIHNjaGVkX2NsZWFyX3BhdXNlX2ZsYWdzX2F0b21pYyhzdHJ1Y3Qgc2NoZWRfdW5pdCAq
dW5pdCwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdW5zaWduZWQgaW50IGJpdCkKPj4gK3sKPj4gKyAgICBjbGVhcl9iaXQoYml0LCAmdW5pdC0+
dmNwdV9saXN0LT5wYXVzZV9mbGFncyk7Cj4+ICt9Cj4gCj4gQW5kIHdpdGggdGhlIGFib3ZlIC0g
YXJlIHNvbWUvYWxsIG9mIHRoZXNlIGdvaW5nIHRvIHJlbWFpbiBsaWtlCj4gdGhpcywgb3Igd2ls
bCB0aGV5IGdhaW4gZm9yX2VhY2gtc3R5bGUgbG9vcHMgbGF0ZXI/CgpJIHdpbGwgYWRkIHNob3J0
IGRlc2NyaXB0aW9ucyB0byB0aGUgY29tbWl0IG1lc3NhZ2UuCgoKSnVlcmdlbgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
