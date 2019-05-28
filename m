Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD99E2C5DE
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 13:54:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVaeE-0001MC-VP; Tue, 28 May 2019 11:52:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=31/0=T4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hVaeD-0001M1-El
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 11:52:05 +0000
X-Inumbo-ID: 022b036a-813f-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 022b036a-813f-11e9-8980-bc764e045a96;
 Tue, 28 May 2019 11:52:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6F991AF1C;
 Tue, 28 May 2019 11:52:02 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-50-jgross@suse.com>
 <5CED1F030200007800233129@prv1-mh.provo.novell.com>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <180b9637-f922-902b-add5-9a32e275d0a9@suse.com>
Date: Tue, 28 May 2019 13:52:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CED1F030200007800233129@prv1-mh.provo.novell.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 49/60] xen/sched: reject switching smt
 on/off with core scheduling active
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjgvMDUvMjAxOSAxMzo0NCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjguMDUuMTkg
YXQgMTI6MzMsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiAtLS0gYS94ZW4vYXJjaC94ODYv
c3lzY3RsLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L3N5c2N0bC5jCj4+IEBAIC0yMDAsNyArMjAw
LDggQEAgbG9uZyBhcmNoX2RvX3N5c2N0bCgKPj4gIAo+PiAgICAgICAgICBjYXNlIFhFTl9TWVND
VExfQ1BVX0hPVFBMVUdfU01UX0VOQUJMRToKPj4gICAgICAgICAgY2FzZSBYRU5fU1lTQ1RMX0NQ
VV9IT1RQTFVHX1NNVF9ESVNBQkxFOgo+PiAtICAgICAgICAgICAgaWYgKCAhY3B1X2hhc19odHQg
fHwgYm9vdF9jcHVfZGF0YS54ODZfbnVtX3NpYmxpbmdzIDwgMiApCj4+ICsgICAgICAgICAgICBp
ZiAoICFjcHVfaGFzX2h0dCB8fCBib290X2NwdV9kYXRhLng4Nl9udW1fc2libGluZ3MgPCAyIHx8
Cj4+ICsgICAgICAgICAgICAgICAgIHNjaGVkX2Rpc2FibGVfc210X3N3aXRjaGluZyApCj4+ICAg
ICAgICAgICAgICB7Cj4+ICAgICAgICAgICAgICAgICAgcmV0ID0gLUVPUE5PVFNVUFA7Cj4+ICAg
ICAgICAgICAgICAgICAgYnJlYWs7Cj4gCj4gSSdtIG5vdCBjb252aW5jZWQgLUVPUE5PVFNVUFAg
aXMgYW4gYXBwcm9wcmlhdGUgZXJyb3IgY29kZSBmb3IKPiB0aGlzIG5ldyBjYXNlLiAtRVBFUk0s
IC1FQUNDRVMsIG9yIC1FSU8gd291bGQgYWxsIHNlZW0gbW9yZQo+IGFwcHJvcHJpYXRlIHRvIG1l
IChhbmQgcGVyaGFwcyB0aGVyZSBhcmUgZnVydGhlciBvbmVzKS4KCkkgdGhpbmsgLUVJTyBvciAt
RUJVU1kgd291bGQgYmUgdGhlIGJlc3QgZml0LgoKPiAKPj4gLS0tIGEveGVuL2NvbW1vbi9zY2hl
ZHVsZS5jCj4+ICsrKyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYwo+PiBAQCAtNTcsNiArNTcsNyBA
QCBpbnRlZ2VyX3BhcmFtKCJzY2hlZF9yYXRlbGltaXRfdXMiLCBzY2hlZF9yYXRlbGltaXRfdXMp
Owo+PiAgCj4+ICAvKiBOdW1iZXIgb2YgdmNwdXMgcGVyIHN0cnVjdCBzY2hlZF91bml0LiAqLwo+
PiAgc3RhdGljIHVuc2lnbmVkIGludCBzY2hlZF9ncmFudWxhcml0eSA9IDE7Cj4+ICtib29sIHNj
aGVkX2Rpc2FibGVfc210X3N3aXRjaGluZzsKPiAKPiBfX3JlYWRfbW9zdGx5IChwZXJoYXBzIGFs
c28gdGhlIHByZS1leGlzdGluZyB2YXJpYWJsZSBpbiBjb250ZXh0KT8KClllcywgY2FuIGRvLgoK
Ckp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
