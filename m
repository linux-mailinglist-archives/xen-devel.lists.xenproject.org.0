Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 879DAC4A32
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 11:05:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFaXB-0004tI-Rl; Wed, 02 Oct 2019 09:02:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bv4y=X3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iFaXA-0004t9-Iz
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 09:02:56 +0000
X-Inumbo-ID: 6b603798-e4f3-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 6b603798-e4f3-11e9-bf31-bc764e2007e4;
 Wed, 02 Oct 2019 09:02:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 84FC9AE04;
 Wed,  2 Oct 2019 09:02:53 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191001143207.15844-1-andrew.cooper3@citrix.com>
 <20191001143207.15844-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a600eb53-d5f4-cad4-92d2-32929e0f90cd@suse.com>
Date: Wed, 2 Oct 2019 11:03:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191001143207.15844-3-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/2] xen/nospec: Introduce
 CONFIG_SPECULATIVE_HARDEN_BRANCH and disable it
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Norbert Manthey <nmanthey@amazon.de>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMTAuMjAxOSAxNjozMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGUgY29kZSBnZW5l
cmF0aW9uIGZvciBiYXJyaWVyX25vc3BlY190cnVlKCkgaXMgbm90IGNvcnJlY3Q7IHRoZSBsZmVu
Y2UKPiBpbnN0cnVjdGlvbnMgYXJlIGdlbmVyYWxseSB0b28gZWFybHkgaW4gdGhlIGluc3RydWN0
aW9uIHN0cmVhbSwgcmVzdWx0aW5nIGluIGEKPiBwZXJmb3JtYW5jZSBoaXQgYnV0IG5vIGFkZGl0
aW9uYWwgc3BlY3VsYXRpdmUgc2FmZXR5Lgo+IAo+IFRoaXMgaXMgY2F1c2VkIGJ5IGlubGluZSBh
c3NlbWJseSB0cnlpbmcgdG8gZmlnaHQgdGhlIGNvbXBpbGVyIG9wdGltaXNlciwgYW5kCj4gdGhl
IG9wdGltaXNlciB3aW5uaW5nLiAgVGhlcmUgaXMgbm8gY2xlYXIgd2F5IHRvIGFjaGlldmUgc2Fm
ZXR5LCBzbyB0dXJuIHRoZQo+IHBlcmYgaGl0IG9mZiBmb3Igbm93LgoKRm9yIG9uZSAoZm9sbG93
aW5nIHRoZSB2MSB0aHJlYWQgd2hpY2ggd2FzIHN0aWxsIGluIHByb2dyZXNzIHdoZW4geW91CnNl
bnQgdGhpcykgYW5kIGltcG9ydGFudCBidXQgbm90IChleHBsaWNpdGx5KSBtZW50aW9uZWQgYXNw
ZWN0IGhlcmUgaXMKdGhhdCBpbiBjYXNlIGFmZmVjdGVkIGlubGluZSBmdW5jdGlvbnMgdG8gbm90
IGdldCBpbmxpbmVkLCB0aGUgTEZFTkNFCndvdWxkIGVuZCB1cCBpbiB0aGUgZnVuY3Rpb24gYm9k
eSByYXRoZXIgdGhhbiBpbiB0aGUgY2FsbGVyLiBJIHRoaW5rCnRoaXMgd2FudHMgbWFraW5nIGV4
cGxpY2l0LgoKQXMgdG8gIm5vIGNsZWFyIHdheSIgLSBpcyB0aGUgImNvbnZlcnQgYWxsIGludm9s
dmVkIGlubGluZSBmdW5jdGlvbnMKdG8gYWx3YXlzX2lubGluZSIgbm90IGEgc3VmZmljaWVudGx5
IHByb21pc2luZyBhcHByb2FjaCwgdW50aWwgYWlkIGJ5CmNvbXBpbGVycyBpcyBhdmFpbGFibGU/
IChGb3IgZ2NjIDkgdGhlIGFzbSBpbmxpbmUoKSBhcHByb2FjaCBjb3VsZCBhbHNvCmJlIGNob3Nl
biwgYW5kIHNob3VsZG4ndCBiZSBvdmVybHkgZGlmZmljdWx0IHRvIGNhcnJ5IG91dC4pCgpGaW5h
bGx5IC4uLgoKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L25vc3BlYy5oCj4gKysrIGIveGVu
L2luY2x1ZGUvYXNtLXg4Ni9ub3NwZWMuaAo+IEBAIC05LDEzICs5LDEzIEBACj4gIC8qIEFsbG93
IHRvIGluc2VydCBhIHJlYWQgbWVtb3J5IGJhcnJpZXIgaW50byBjb25kaXRpb25hbHMgKi8KPiAg
c3RhdGljIGFsd2F5c19pbmxpbmUgYm9vbCBiYXJyaWVyX25vc3BlY190cnVlKHZvaWQpCj4gIHsK
PiAtI2lmZGVmIENPTkZJR19IVk0KPiAtICAgIGFsdGVybmF0aXZlKCIiLCAibGZlbmNlIiwgWDg2
X0ZFQVRVUkVfU0NfTDFURl9WVUxOKTsKPiArI2lmZGVmIENPTkZJR19TUEVDVUxBVElWRV9IQVJE
RU5fQlJBTkNICj4gKyAgICBhc20gdm9sYXRpbGUgKCAibGZlbmNlIiA6OjogIm1lbW9yeSIgKTsK
PiAgI2VuZGlmCj4gICAgICByZXR1cm4gdHJ1ZTsKPiAgfQoKLi4uIGRvZXNuJ3QgdGhpcyBjaGFu
Z2UgYWxvbmUgKGFzc3VtaW5nIHRoZSBjb25maWcgb3B0aW9uIGNvdWxkIGJlIHNldAp0byBZKSBh
bHJlYWR5IHRha2UgY2FyZSBvZiB0aGUgaXNzdWU/IEJ5IHRoZXJlIG5vIGxvbmdlciBiZWluZyB0
aGUKKG1pc2xlYWRpbmcgdG8gdGhlIGNvbXBpbGVyKSBjb21wbGV4aXR5IG9mIGFsdGVybmF0aXZl
KCksIHRoZXJlIHNob3VsZApiZSBmYXIgbGVzcyAoaWYgYW55KSBpbnN0YW5jZXMgb2YgdGhpcyAo
YW5kIGl0cyBpbmxpbmUgdXNlcnMpIG5vdApnZXR0aW5nIGlubGluZWQuIEluIGZhY3QgSSB3b25k
ZXIgd2hldGhlciB0aGVuIHRoZSBhbHdheXNfaW5saW5lIGhlcmUKY291bGRuJ3QgYWxzbyBiZSBj
b252ZXJ0ZWQgYmFjayB0byBqdXN0IGlubGluZSAoZXhjZXB0IHBlcmhhcHMgZm9yCmNsYW5nLCBh
cyBwZXIgdGhlIG90aGVyIHBhdGNoIG9mIHlvdXJzKS4KClRoZW4gYWdhaW4gaWYgdGhlIGNvbmZp
ZyBvcHRpb24gY291bGQgYmUgc2V0IHRvIFksIHdlJ2Qgbm90IHdhbnQgdGhlCkxGRU5DRSB1bmNv
bmRpdGlvbmFsbHkgYW55d2F5IGFpdWk6IEhhcmR3YXJlIGFmZmVjdGVkIGJ5IG5laXRoZXIgTDFU
Rgpub3IgdGhlIE1EUyB2YXJpYXRpb25zIChpLmUuIGluIHBhcnRpY3VsYXIgYWxsIG9mIEFNRCBo
YXJkd2FyZSkKc2hvdWxkbid0IGdldCBwZW5hbGl6ZWQuIFNvIHBlcmhhcHMgaXQgd2FzIGEgYmFk
IHJlcXVlc3Qgb2YgbWluZSB0bwpzd2l0Y2ggZnJvbSBhbHRlcm5hdGl2ZSgpIHRvIGFzbSgpOyBp
bnN0ZWFkIEkgc2hvdWxkIGhhdmUgYXNrZWQgdGhhdAp5b3VyIHVzZSBvZiBYODZfRkVBVFVSRV9B
TFdBWVMgaW4gdjEgYmUgcmVwbGFjZWQgYnkgc29tZXRoaW5nIHRoYXQKd291bGQgYWN0dWFsbHkg
dHJpZ2dlciBhIGJ1aWxkIGVycm9yIChvciB3b3JrIGNvcnJlY3RseSkgaWYgdGhlIGNvbmZpZwpv
cHRpb24gYmVjYW1lIHNldHRhYmxlIHRvIFkuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
