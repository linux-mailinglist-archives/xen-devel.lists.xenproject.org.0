Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4812C947
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 16:52:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVdIc-0007zQ-2q; Tue, 28 May 2019 14:41:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=31/0=T4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hVdIb-0007zL-6V
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 14:41:57 +0000
X-Inumbo-ID: bccdd96e-8156-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bccdd96e-8156-11e9-8980-bc764e045a96;
 Tue, 28 May 2019 14:41:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CFA9EAD72;
 Tue, 28 May 2019 14:41:53 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>
References: <20190528130811.26480-1-jgross@suse.com>
 <5CED46600200007800233274@prv1-mh.provo.novell.com>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <75f2b5ce-142a-9788-f847-2ee81a183822@suse.com>
Date: Tue, 28 May 2019 16:41:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CED46600200007800233274@prv1-mh.provo.novell.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH] xen: remove on-stack cpumask from
 stop_machine_run()
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
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjgvMDUvMjAxOSAxNjozMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjguMDUuMTkg
YXQgMTU6MDgsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiAtLS0gYS94ZW4vY29tbW9uL3N0
b3BfbWFjaGluZS5jCj4+ICsrKyBiL3hlbi9jb21tb24vc3RvcF9tYWNoaW5lLmMKPj4gQEAgLTY5
LDggKzY5LDggQEAgc3RhdGljIHZvaWQgc3RvcG1hY2hpbmVfd2FpdF9zdGF0ZSh2b2lkKQo+PiAg
Cj4+ICBpbnQgc3RvcF9tYWNoaW5lX3J1bihpbnQgKCpmbikodm9pZCAqKSwgdm9pZCAqZGF0YSwg
dW5zaWduZWQgaW50IGNwdSkKPj4gIHsKPj4gLSAgICBjcHVtYXNrX3QgYWxsYnV0c2VsZjsKPj4g
ICAgICB1bnNpZ25lZCBpbnQgaSwgbnJfY3B1czsKPj4gKyAgICB1bnNpZ25lZCBpbnQgbXlfY3B1
ID0gc21wX3Byb2Nlc3Nvcl9pZCgpOwo+IAo+IFZhcmlhYmxlcyBzdGFydGluZyB3aXRoIG15XyBi
ZWluZyBjb21tb25seSB1c2VkIGluIGludHJvZHVjdG9yeQo+IGV4YW1wbGVzLCBJJ2QgcHJlZmVy
IHRvIGF2b2lkIHN1Y2ggbmFtZXMuIEVsc2V3aGVyZSB3ZSB1c2UKPiAidGhpc19jcHUiLCAibWUi
LCBvciBtYXliZSAidGhpcyIgaWYgcGxhaW4gImNwdSIgaXMgYWxyZWFkeSB0YWtlbi4KCk9rYXku
Cgo+IAo+PiBAQCAtNzksOSArNzksNyBAQCBpbnQgc3RvcF9tYWNoaW5lX3J1bihpbnQgKCpmbiko
dm9pZCAqKSwgdm9pZCAqZGF0YSwgdW5zaWduZWQgaW50IGNwdSkKPj4gICAgICBpZiAoICFnZXRf
Y3B1X21hcHMoKSApCj4+ICAgICAgICAgIHJldHVybiAtRUJVU1k7Cj4+ICAKPj4gLSAgICBjcHVt
YXNrX2FuZG5vdCgmYWxsYnV0c2VsZiwgJmNwdV9vbmxpbmVfbWFwLAo+PiAtICAgICAgICAgICAg
ICAgICAgIGNwdW1hc2tfb2Yoc21wX3Byb2Nlc3Nvcl9pZCgpKSk7Cj4+IC0gICAgbnJfY3B1cyA9
IGNwdW1hc2tfd2VpZ2h0KCZhbGxidXRzZWxmKTsKPj4gKyAgICBucl9jcHVzID0gY3B1bWFza193
ZWlnaHQoJmNwdV9vbmxpbmVfbWFwKSAtIDE7Cj4gCj4gSGF2aW5nIGxvb2tlZCBhdCBhIGxvdCBv
ZiBDUFUgb2ZmbGluaW5nIGNvZGUgcmVjZW50bHksIEkgbm90aWNlIHRoaXMKPiBpc24ndCBzdHJp
Y3RseSBjb3JyZWN0OiBZb3UgaW1wbHkgY3B1X29ubGluZShteV9jcHUpIHRvIHByb2R1Y2UKPiAi
dHJ1ZSIuIEkgdGhpbmsgYXQgcHJlc2VudCB0aGlzIHdpbGwgYWx3YXlzIGhvbGQsIGJ1dCBJJ2Qg
cHJlZmVyIGlmIHdlCj4gY291bGQgYXZvaWQgZ2FpbmluZyBzdWNoIGEgZGVwZW5kZW5jeS4gQW5k
IGl0IGRvZXNuJ3QgbG9vayBvdmVybHkKPiBkaWZmaWN1bHQgdG8gYXZvaWQgaXQuCgpZZXMsIEkg
aGF2ZSB0aG91Z2h0IGFib3V0IGl0LiBJZiB5b3UgbGlrZSBpdCBiZXR0ZXIgSSB0ZXN0IGZvciB0
aGUKcnVubmluZyBjcHUgdG8gYmUgaW4gY3B1X29ubGluZV9tYXAuCgo+IEFsc28gcGxlYXNlIGRv
bid0IG9wZW4tY29kZSBudW1fb25saW5lX2NwdXMoKS4KCkFoLCBvZiBjb3Vyc2UhCgo+IAo+PiBA
QCAtMTAwLDggKzk4LDkgQEAgaW50IHN0b3BfbWFjaGluZV9ydW4oaW50ICgqZm4pKHZvaWQgKiks
IHZvaWQgKmRhdGEsIHVuc2lnbmVkIGludCBjcHUpCj4+ICAKPj4gICAgICBzbXBfd21iKCk7Cj4+
ICAKPj4gLSAgICBmb3JfZWFjaF9jcHUgKCBpLCAmYWxsYnV0c2VsZiApCj4+IC0gICAgICAgIHRh
c2tsZXRfc2NoZWR1bGVfb25fY3B1KCZwZXJfY3B1KHN0b3BtYWNoaW5lX3Rhc2tsZXQsIGkpLCBp
KTsKPj4gKyAgICBmb3JfZWFjaF9jcHUgKCBpLCAmY3B1X29ubGluZV9tYXAgKQo+IAo+IFNhbWUg
aGVyZSBmb3IgZm9yX2VhY2hfb25saW5lX2NwdSgpLgoKWWVzLgoKCkp1ZXJnZW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
