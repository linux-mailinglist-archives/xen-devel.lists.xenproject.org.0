Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DB2C342B
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 14:24:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFHAB-0006PS-1l; Tue, 01 Oct 2019 12:21:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=itvi=X2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iFHA8-0006PN-VG
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 12:21:52 +0000
X-Inumbo-ID: 0bd75dae-e446-11e9-96f9-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 0bd75dae-e446-11e9-96f9-12813bfff9fa;
 Tue, 01 Oct 2019 12:21:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 79E3EAD4E;
 Tue,  1 Oct 2019 12:21:50 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190930182437.25478-1-andrew.cooper3@citrix.com>
 <20190930182437.25478-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <46bcfde3-83c8-5a2c-9196-832e0ea144ea@suse.com>
Date: Tue, 1 Oct 2019 14:21:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190930182437.25478-3-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 2/2] xen/nospec: Introduce
 CONFIG_SPECULATIVE_BRANCH_HARDEN and disable it
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

T24gMzAuMDkuMjAxOSAyMDoyNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGUgY29kZSBnZW5l
cmF0aW9uIGZvciBiYXJyaWVyX25vc3BlY190cnVlKCkgaXMgbm90IGNvcnJlY3QuICBXZSBhcmUg
dGFraW5nIGEKPiBwZXJmIGl0IGZyb20gdGhlIGFkZGVkIGZlbmNlcywgYnV0IG5vdCBnYWluaW5n
IGFueSBzcGVjdWxhdGl2ZSBzYWZldHkuCgpZb3Ugd2FudCB0byBiZSBtb3JlIHNwZWNpZmljIGhl
cmUsIEkgdGhpbms6IElTVFIgeW91IHNheWluZyB0aGF0IHRoZSBMRkVOQ0VzCmdldCBpbnNlcnRl
ZCBhdCB0aGUgd3JvbmcgcGxhY2UuIElJUkMgd2Ugd2FudCB0aGVtIG9uIGVpdGhlciBzaWRlIG9m
IGEKY29uZGl0aW9uYWwgYnJhbmNoLCBpLmUuIGltbWVkaWF0ZWx5IGZvbGxvd2luZyBhIGJyYW5j
aCBpbnNuIGFzIHdlbGwgYXMgcmlnaHQKYXQgdGhlIGJyYW5jaCB0YXJnZXQuIEkndmUgdGFrZW4s
IGFzIGEgc2ltcGxlIGV4YW1wbGUsCnAybV9tZW1fYWNjZXNzX3Nhbml0eV9jaGVjaygpLCBhbmQg
dGhpcyBsb29rcyB0byBiZSB0aGUgd2F5IGdjYzkgaGFzIGdlbmVyYXRlZApjb2RlIChpbiBhIG5v
bi1kZWJ1ZyBidWlsZCkuIEhlbmNlIGVpdGhlciBJJ20gbWlzLXJlbWVtYmVyaW5nIHdoYXQgd2Ug
d2FudAp0aGluZ3MgdG8gbG9vayBsaWtlLCBvciB0aGVyZSdzIG1vcmUgdG8gaXQgdGhhbiBjb2Rl
IGdlbmVyYXRpb24gc2ltcGx5IGJlaW5nCiJub3QgY29ycmVjdCIuCgo+IC0tLSBhL3hlbi9jb21t
b24vS2NvbmZpZwo+ICsrKyBiL3hlbi9jb21tb24vS2NvbmZpZwo+IEBAIC05Niw2ICs5NiwyMyBA
QCBjb25maWcgU1BFQ1VMQVRJVkVfQVJSQVlfSEFSREVOCj4gIAo+ICAJICBJZiB1bnN1cmUsIHNh
eSBZLgo+ICAKPiArY29uZmlnIFNQRUNVTEFUSVZFX0JSQU5DSF9IQVJERU4KPiArCWJvb2wgIlNw
ZWN1bGF0aXZlIEJyYW5jaCBIYXJkZW5pbmciCj4gKwlkZXBlbmRzIG9uIEJST0tFTgo+ICsgICAg
ICAgIC0tLWhlbHAtLS0KPiArCSAgQ29udGVtcG9yYXJ5IHByb2Nlc3NvcnMgbWF5IHVzZSBzcGVj
dWxhdGl2ZSBleGVjdXRpb24gYXMgYQo+ICsJICBwZXJmb3JtYW5jZSBvcHRpbWlzYXRpb24sIGJ1
dCB0aGlzIGNhbiBwb3RlbnRpYWxseSBiZSBhYnVzZWQgYnkgYW4KPiArCSAgYXR0YWNrZXIgdG8g
bGVhayBkYXRhIHZpYSBzcGVjdWxhdGl2ZSBzaWRlY2hhbm5lbHMuCj4gKwo+ICsJICBPbmUgc291
cmNlIG9mIG1pc2JlaGF2aW91ciBpcyBieSBleGVjdXRpbmcgdGhlIHdyb25nIGJhc2ljIGJsb2Nr
Cj4gKwkgIGZvbGxvd2luZyBhIGNvbmRpdGlvbmFsIGp1bXAuCj4gKwo+ICsJICBXaGVuIGVuYWJs
ZWQsIHNwZWNpZmljIGNvbmRpdGlvbnMgd2hpY2ggaGF2ZSBiZWVuIGRlZW1lZCBsaWFibGUgdG8K
PiArCSAgYmUgc3BlY3VsYXRpdmVseSBhYnVzZWQgd2lsbCBiZSBoYXJkZW5lZCB0byBhdm9pZCBl
bnRlcmluZyB0aGUgd3JvbmcKPiArCSAgYmFzaWMgYmxvY2suCj4gKwo+ICsJICAhISEgV0FSTklO
RyAtIFRoaXMgaXMgYnJva2VuIGFuZCBkb2Vzbid0IGdlbmVyYXRlIHNhZmUgY29kZSAhISEKCk5v
dCBiZWluZyBhIG5hdGl2ZSBzcGVha2VyLCB0aGlzIHJlYWQgdG8gbWUgYXMgImlzIGJyb2tlbiBp
biBnZW5lcmFsIiwKd2hlcmVhcyB0aGUgYnJva2VubmVzcyBpcyB0aGF0IGFjY29yZGluZyB0byB5
b3VyIGFuYWx5c2lzIHNhZmUgY29kZQpkb2VzIG5vdCByZXN1bHQuIFRoZXJlZm9yZSBob3cgYWJv
dXQgIlRoaXMgaXMgYnJva2VuIGluIHRoYXQgaXQgZG9lc24ndApnZW5lcmF0ZSBzYWZlIGNvZGUi
PwoKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L25vc3BlYy5oCj4gKysrIGIveGVuL2luY2x1
ZGUvYXNtLXg4Ni9ub3NwZWMuaAo+IEBAIC05LDggKzksOCBAQAo+ICAvKiBBbGxvdyB0byBpbnNl
cnQgYSByZWFkIG1lbW9yeSBiYXJyaWVyIGludG8gY29uZGl0aW9uYWxzICovCj4gIHN0YXRpYyBh
bHdheXNfaW5saW5lIGJvb2wgYmFycmllcl9ub3NwZWNfdHJ1ZSh2b2lkKQo+ICB7Cj4gLSNpZmRl
ZiBDT05GSUdfSFZNCj4gLSAgICBhbHRlcm5hdGl2ZSgiIiwgImxmZW5jZSIsIFg4Nl9GRUFUVVJF
X1NDX0wxVEZfVlVMTik7Cj4gKyNpZmRlZiBDT05GSUdfU1BFQ1VMQVRJVkVfQlJBTkNIX0hBUkRF
Tgo+ICsgICAgYWx0ZXJuYXRpdmUoIiIsICJsZmVuY2UiLCBYODZfRkVBVFVSRV9BTFdBWVMpOwoK
V2h5IGFsdGVybmF0aXZlKCkgdGhlbiBhbmQgbm90IGp1c3QgYXNtKCk/CgpKYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
