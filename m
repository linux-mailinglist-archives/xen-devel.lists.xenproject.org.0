Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AED165D2F
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 13:02:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4kUq-0002AZ-UT; Thu, 20 Feb 2020 12:00:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iWzT=4I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j4kUp-0002AL-LT
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 11:59:59 +0000
X-Inumbo-ID: 8427f398-53d8-11ea-b0fd-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8427f398-53d8-11ea-b0fd-bc764e2007e4;
 Thu, 20 Feb 2020 11:59:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E7C53ACF0;
 Thu, 20 Feb 2020 11:59:55 +0000 (UTC)
To: David Woodhouse <dwmw2@infradead.org>
References: <56f7fe21daff2dc4bf8db7ee356666233bdb0f7a.camel@infradead.org>
 <20200207155701.2781820-2-dwmw2@infradead.org>
 <cdf20919a9c1afcee2d2f63631391a701cde46ef.camel@amazon.com>
 <017D4B5F-603D-42BF-94DA-B757FF27EAF8@infradead.org>
 <2f2368f84380dd2c81bbfa310d03bc3c3f800b94.camel@amazon.com>
 <B63B9D74-EF17-4E6F-AA5D-2BEC0C3228D7@infradead.org>
 <f5b6325a469352585d7cf1d7d01d2dc4a2f2af8f.camel@infradead.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <af374a90-f060-7239-5a02-c98df409819c@suse.com>
Date: Thu, 20 Feb 2020 12:59:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <f5b6325a469352585d7cf1d7d01d2dc4a2f2af8f.camel@infradead.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] xen/mm: Introduce PG_state_uninitialised
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "jeff.kubascik@dornerworks.com" <jeff.kubascik@dornerworks.com>, "Xia,
 Hongyan" <hongyxia@amazon.com>,
 "stewart.hildebrand@dornerworks.com" <stewart.hildebrand@dornerworks.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDIuMjAyMCAxOTowNCwgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9tbS5jCj4gKysrIGIveGVuL2FyY2gveDg2L21tLmMKPiBAQCAtNDg4LDcgKzQ4OCw4
IEBAIHZvaWQgc2hhcmVfeGVuX3BhZ2Vfd2l0aF9ndWVzdChzdHJ1Y3QgcGFnZV9pbmZvICpwYWdl
LCBzdHJ1Y3QgZG9tYWluICpkLAo+ICAKPiAgICAgIHBhZ2Vfc2V0X293bmVyKHBhZ2UsIGQpOwo+
ICAgICAgc21wX3dtYigpOyAvKiBpbnN0YWxsIHZhbGlkIGRvbWFpbiBwdHIgYmVmb3JlIHVwZGF0
aW5nIHJlZmNudC4gKi8KPiAtICAgIEFTU0VSVCgocGFnZS0+Y291bnRfaW5mbyAmIH5QR0NfeGVu
X2hlYXApID09IDApOwo+ICsgICAgQVNTRVJUKChwYWdlLT5jb3VudF9pbmZvICYgflBHQ194ZW5f
aGVhcCkgPT0gUEdDX3N0YXRlX2ludXNlIHx8Cj4gKyAgICAgICAgICAgKHBhZ2UtPmNvdW50X2lu
Zm8gJiB+UEdDX3hlbl9oZWFwKSA9PSBQR0Nfc3RhdGVfdW5pbml0aWFsaXNlZCk7CgpDYW4gdW5p
bml0aWFsaXplZCBwYWdlcyByZWFsbHkgbWFrZSBpdCBoZXJlPwoKPiBAQCAtMTM4OSw2ICsxMzkx
LDE2IEBAIHN0YXRpYyB2b2lkIGZyZWVfaGVhcF9wYWdlcygKPiAgICAgIEFTU0VSVChvcmRlciA8
PSBNQVhfT1JERVIpOwo+ICAgICAgQVNTRVJUKG5vZGUgPj0gMCk7Cj4gIAo+ICsgICAgaWYgKCBw
YWdlX3N0YXRlX2lzKHBnLCB1bmluaXRpYWxpc2VkKSApCj4gKyAgICB7Cj4gKyAgICAgICAgaW5p
dF9oZWFwX3BhZ2VzKHBnLCAxIDw8IG9yZGVyLCBuZWVkX3NjcnViKTsKPiArICAgICAgICAvKgo+
ICsgICAgICAgICAqIGluaXRfaGVhcF9wYWdlcygpIHdpbGwgY2FsbCBiYWNrIGludG8gZnJlZV9o
ZWFwX3BhZ2VzKCkgZm9yCj4gKyAgICAgICAgICogZWFjaCBwYWdlIGJ1dCBjYW5ub3Qga2VlcCBy
ZWN1cnNpbmcgYmVjYXVzZSBlYWNoIHBhZ2Ugd2lsbAo+ICsgICAgICAgICAqIGJlIHNldCB0byBQ
R0Nfc3RhdGVfaW51c2UgZmlyc3QuCj4gKyAgICAgICAgICovCj4gKyAgICAgICAgcmV0dXJuOwo+
ICsgICAgfQo+ICAgICAgc3Bpbl9sb2NrKCZoZWFwX2xvY2spOwoKQ2FuIHlvdSBhbHNvIGFkZCBh
IGJsYW5rIGxpbmUgYWJvdmUgaGVyZSBwbGVhc2U/Cgo+IEBAIC0xNzgwLDExICsxNzkyLDEwIEBA
IGludCBxdWVyeV9wYWdlX29mZmxpbmUobWZuX3QgbWZuLCB1aW50MzJfdCAqc3RhdHVzKQo+ICAg
KiBsYXR0ZXIgaXMgbm90IG9uIGEgTUFYX09SREVSIGJvdW5kYXJ5LCB0aGVuIHdlIHJlc2VydmUg
dGhlIHBhZ2UgYnkKPiAgICogbm90IGZyZWVpbmcgaXQgdG8gdGhlIGJ1ZGR5IGFsbG9jYXRvci4K
PiAgICovCj4gLXN0YXRpYyB2b2lkIGluaXRfaGVhcF9wYWdlcygKPiAtICAgIHN0cnVjdCBwYWdl
X2luZm8gKnBnLCB1bnNpZ25lZCBsb25nIG5yX3BhZ2VzKQo+ICtzdGF0aWMgdm9pZCBpbml0X2hl
YXBfcGFnZXMoc3RydWN0IHBhZ2VfaW5mbyAqcGcsIHVuc2lnbmVkIGxvbmcgbnJfcGFnZXMsCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIHNjcnViKQoKSXMgdGhpcyBuZXcgcGFy
YW1ldGVyIHN0cmljdGx5IG5lZWRlZCwgaS5lLiBjYW4gZnJlZV9oZWFwX3BhZ2VzKCkKYmUgY2Fs
bGVkIHdpdGggdW5pbml0aWFsaXplZCBwYWdlcyB3aGljaCBuZWVkIHNjcnViYmluZz8gKFRoZQpj
b2RlIGNoYW5nZSBpcyBzaW1wbGUgZW5vdWdoLCBhbmQgaGVuY2UgbWF5IHdhcnJhbnQga2VlcGlu
ZywgYnV0CnRoZW4gdGhlIGNvbW1pdCBtZXNzYWdlIGNvdWxkIGluZGljYXRlIHNvIGluIGNhc2Ug
dGhpcyBpc24ndCBhCnN0cmljdCByZXF1aXJlbWVudC4pCgo+IEBAIC0yMzAxLDEwICsyMzE2LDEx
IEBAIGludCBhc3NpZ25fcGFnZXMoCj4gICAgICBmb3IgKCBpID0gMDsgaSA8ICgxIDw8IG9yZGVy
KTsgaSsrICkKPiAgICAgIHsKPiAgICAgICAgICBBU1NFUlQocGFnZV9nZXRfb3duZXIoJnBnW2ld
KSA9PSBOVUxMKTsKPiAtICAgICAgICBBU1NFUlQoIXBnW2ldLmNvdW50X2luZm8pOwo+ICsgICAg
ICAgIEFTU0VSVChwZ1tpXS5jb3VudF9pbmZvID09IFBHQ19zdGF0ZV9pbnVzZSB8fAo+ICsgICAg
ICAgICAgICAgICBwZ1tpXS5jb3VudF9pbmZvID09IFBHQ19zdGF0ZV91bmluaXRpYWxpc2VkKTsK
ClNhbWUgcXVlc3Rpb24gaGVyZTogQ2FuIHVuaW5pdGlhbGl6ZWQgcGFnZXMgbWFrZSBpdCBoZXJl
PyBJZgpzbywgd291bGRuJ3QgaXQgYmUgYmV0dGVyIHRvIGNvcnJlY3QgdGhpcywgcmF0aGVyIHRo
YW4gaGF2aW5nCnRoZSBtb3JlIHBlcm1pc3NpdmUgYXNzZXJ0aW9uPwoKPiAgICAgICAgICBwYWdl
X3NldF9vd25lcigmcGdbaV0sIGQpOwo+ICAgICAgICAgIHNtcF93bWIoKTsgLyogRG9tYWluIHBv
aW50ZXIgbXVzdCBiZSB2aXNpYmxlIGJlZm9yZSB1cGRhdGluZyByZWZjbnQuICovCj4gLSAgICAg
ICAgcGdbaV0uY291bnRfaW5mbyA9IFBHQ19hbGxvY2F0ZWQgfCAxOwo+ICsgICAgICAgIHBnW2ld
LmNvdW50X2luZm8gfD0gUEdDX2FsbG9jYXRlZCB8IDE7CgpUaGlzIGlzIHRvbyByZWxheGVkIGZv
ciBteSB0YXN0ZTogSSB1bmRlcnN0YW5kIHlvdSB3YW50IHRvCnJldGFpbiBwYWdlIHN0YXRlLCBi
dXQgSSBzdXBwb3NlIG90aGVyIGJpdHMgd291bGQgd2FudCBjbGVhcmluZwpuZXZlcnRoZWxlc3Mu
Cgo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbW0uaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2Fz
bS14ODYvbW0uaAo+IEBAIC03MiwxMiArNzIsMTMgQEAKPiAgICAqIHsgaW51c2UsIG9mZmxpbmlu
Zywgb2ZmbGluZWQsIGZyZWUsIGJyb2tlbl9vZmZsaW5pbmcsIGJyb2tlbiB9Cj4gICAgKi8KPiAg
I2RlZmluZSBQR0Nfc3RhdGUgICAgICAgICAgICAgICAgICBQR19tYXNrKDcsIDkpCj4gLSNkZWZp
bmUgUEdDX3N0YXRlX2ludXNlICAgICAgICAgICAgUEdfbWFzaygwLCA5KQo+ICsjZGVmaW5lIFBH
Q19zdGF0ZV91bmluaXRpYWxpc2VkICAgIFBHX21hc2soMCwgOSkKPiAgI2RlZmluZSBQR0Nfc3Rh
dGVfb2ZmbGluaW5nICAgICAgICBQR19tYXNrKDEsIDkpCj4gICNkZWZpbmUgUEdDX3N0YXRlX29m
ZmxpbmVkICAgICAgICAgUEdfbWFzaygyLCA5KQo+ICAjZGVmaW5lIFBHQ19zdGF0ZV9mcmVlICAg
ICAgICAgICAgIFBHX21hc2soMywgOSkKPiAgI2RlZmluZSBQR0Nfc3RhdGVfYnJva2VuX29mZmxp
bmluZyBQR19tYXNrKDQsIDkpCj4gICNkZWZpbmUgUEdDX3N0YXRlX2Jyb2tlbiAgICAgICAgICAg
UEdfbWFzayg1LCA5KQo+ICsjZGVmaW5lIFBHQ19zdGF0ZV9pbnVzZSAgICAgICAgICAgIFBHX21h
c2soNiwgOSkKCldvdWxkIGltbyBiZSBuaWNlIGlmIHRoaXMgbW9zdCBjb21tb24gc3RhdGUgd2Fz
IGFjdHVhbGx5CmVpdGhlciAxIG9yIDcsIGZvciBlYXN5IHJlY29nbml0aW9uLiBCdXQgdGhlIG1v
c3Qgc3VpdGFibGUKdmFsdWUgdG8gcGljayBtYXkgYWxzbyBkZXBlbmQgb24gdGhlIG91dGNvbWUg
b2Ygb25lIG9mIHRoZQpjb21tZW50cyBvbiBwYXRjaCAxLgoKSmFuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
