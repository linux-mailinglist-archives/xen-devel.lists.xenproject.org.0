Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2841514BE09
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 17:51:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwU1f-0000eW-SJ; Tue, 28 Jan 2020 16:47:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iQoc=3R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwU1e-0000dl-0k
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 16:47:42 +0000
X-Inumbo-ID: e5766762-41ed-11ea-8736-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e5766762-41ed-11ea-8736-12813bfff9fa;
 Tue, 28 Jan 2020 16:47:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B9C28AFB2;
 Tue, 28 Jan 2020 16:47:39 +0000 (UTC)
To: Tamas K Lengyel <tamas.lengyel@intel.com>
References: <cover.1580148227.git.tamas.lengyel@intel.com>
 <0f94706731f30e8407f64064d33a27f549554250.1580148227.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <60bfe54a-0395-228b-d74d-017db819c279@suse.com>
Date: Tue, 28 Jan 2020 17:47:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <0f94706731f30e8407f64064d33a27f549554250.1580148227.git.tamas.lengyel@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 2/9] x86/hvm: introduce
 hvm_copy_context_and_params
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDEuMjAyMCAxOTowNiwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IEBAIC00MTM5LDQ5
ICs0MTQwLDMyIEBAIHN0YXRpYyBpbnQgaHZtX2FsbG93X3NldF9wYXJhbShzdHJ1Y3QgZG9tYWlu
ICpkLAo+ICAgICAgcmV0dXJuIHJjOwo+ICB9Cj4gIAo+IC1zdGF0aWMgaW50IGh2bW9wX3NldF9w
YXJhbSgKPiAtICAgIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX2h2bV9wYXJhbV90KSBhcmcp
Cj4gK3N0YXRpYyBpbnQgaHZtX3NldF9wYXJhbShzdHJ1Y3QgZG9tYWluICpkLCB1aW50MzJfdCBp
bmRleCwgdWludDY0X3QgdmFsdWUpCj4gIHsKPiAgICAgIHN0cnVjdCBkb21haW4gKmN1cnJfZCA9
IGN1cnJlbnQtPmRvbWFpbjsKPiAtICAgIHN0cnVjdCB4ZW5faHZtX3BhcmFtIGE7Cj4gLSAgICBz
dHJ1Y3QgZG9tYWluICpkOwo+ICAgICAgc3RydWN0IHZjcHUgKnY7Cj4gICAgICBpbnQgcmM7Cj4g
IAo+IC0gICAgaWYgKCBjb3B5X2Zyb21fZ3Vlc3QoJmEsIGFyZywgMSkgKQo+IC0gICAgICAgIHJl
dHVybiAtRUZBVUxUOwo+IC0KPiAtICAgIGlmICggYS5pbmRleCA+PSBIVk1fTlJfUEFSQU1TICkK
PiArICAgIGlmICggaW5kZXggPj0gSFZNX05SX1BBUkFNUyApCj4gICAgICAgICAgcmV0dXJuIC1F
SU5WQUw7CgpUaGUgZXF1aXZhbGVudCBvZiB0aGlzIG9uIHRoZSAiZ2V0IiBwYXRoIG5vdyBzZWVt
cyB0byBiZSBnb25lLiBJcwp0aGVyZSBhbnkgcmVhc29uIHRoZSBvbmUgaGVyZSBpcyBzdGlsbCBu
ZWVkZWQ/Cgo+ICtpbnQgaHZtb3Bfc2V0X3BhcmFtKAo+ICsgICAgWEVOX0dVRVNUX0hBTkRMRV9Q
QVJBTSh4ZW5faHZtX3BhcmFtX3QpIGFyZykKPiArewo+ICsgICAgc3RydWN0IHhlbl9odm1fcGFy
YW0gYTsKPiArICAgIHN0cnVjdCBkb21haW4gKmQ7Cj4gKyAgICBpbnQgcmM7Cj4gKwo+ICsgICAg
aWYgKCBjb3B5X2Zyb21fZ3Vlc3QoJmEsIGFyZywgMSkgKQo+ICsgICAgICAgIHJldHVybiAtRUZB
VUxUOwo+ICsKPiArICAgIGlmICggYS5pbmRleCA+PSBIVk1fTlJfUEFSQU1TICkKPiArICAgICAg
ICByZXR1cm4gLUVJTlZBTDsKPiArCj4gKyAgICAvKiBNYWtlIHN1cmUgdGhlIGFib3ZlIGJvdW5k
IGNoZWNrIGlzIG5vdCBieXBhc3NlZCBkdXJpbmcgc3BlY3VsYXRpb24uICovCj4gKyAgICBibG9j
a19zcGVjdWxhdGlvbigpOwo+ICsKPiArICAgIGQgPSByY3VfbG9ja19kb21haW5fYnlfYW55X2lk
KGEuZG9taWQpOwo+ICsgICAgaWYgKCBkID09IE5VTEwgKQo+ICsgICAgICAgIHJldHVybiAtRVNS
Q0g7Cj4gKwo+ICsgICAgcmMgPSAtRUlOVkFMOwo+ICsgICAgaWYgKCAhaXNfaHZtX2RvbWFpbihk
KSApCj4gKyAgICAgICAgZ290byBvdXQ7CgpEZXNwaXRlIHlvdXIgY2xhaW0gdG8gaGF2ZSBhZGRy
ZXNzZWQgbXkgcmVtYWluaW5nIGNvbW1lbnQgZnJvbSB2NCwKeW91IHN0aWxsIHVzZSBnb3RvIGhl
cmUgd2hlbiB0aGVyZSdzIGFuIGVhc3kgYWx0ZXJuYXRpdmUuCgo+IEBAIC01Mjk3LDYgKzUzMjIs
MzcgQEAgdm9pZCBodm1fc2V0X3NlZ21lbnRfcmVnaXN0ZXIoc3RydWN0IHZjcHUgKnYsIGVudW0g
eDg2X3NlZ21lbnQgc2VnLAo+ICAgICAgYWx0ZXJuYXRpdmVfdmNhbGwoaHZtX2Z1bmNzLnNldF9z
ZWdtZW50X3JlZ2lzdGVyLCB2LCBzZWcsIHJlZyk7Cj4gIH0KPiAgCj4gK2ludCBodm1fY29weV9j
b250ZXh0X2FuZF9wYXJhbXMoc3RydWN0IGRvbWFpbiAqZHN0LCBzdHJ1Y3QgZG9tYWluICpzcmMp
Cj4gK3sKPiArICAgIGludCByYzsKPiArICAgIHVuc2lnbmVkIGludCBpOwo+ICsgICAgc3RydWN0
IGh2bV9kb21haW5fY29udGV4dCBjID0geyB9Owo+ICsKPiArICAgIGZvciAoIGkgPSAwOyBpIDwg
SFZNX05SX1BBUkFNUzsgaSsrICkKPiArICAgIHsKPiArICAgICAgICB1aW50NjRfdCB2YWx1ZSA9
IDA7Cj4gKwo+ICsgICAgICAgIGlmICggaHZtX2dldF9wYXJhbShzcmMsIGksICZ2YWx1ZSkgfHwg
IXZhbHVlICkKPiArICAgICAgICAgICAgY29udGludWU7Cj4gKwo+ICsgICAgICAgIGlmICggKHJj
ID0gaHZtX3NldF9wYXJhbShkc3QsIGksIHZhbHVlKSkgKQo+ICsgICAgICAgICAgICByZXR1cm4g
cmM7Cj4gKyAgICB9Cj4gKwo+ICsgICAgYy5zaXplID0gaHZtX3NhdmVfc2l6ZShzcmMpOwo+ICsg
ICAgaWYgKCAoYy5kYXRhID0gdm1hbGxvYyhjLnNpemUpKSA9PSBOVUxMICkKPiArICAgICAgICBy
ZXR1cm4gLUVOT01FTTsKPiArCj4gKyAgICBpZiAoICEocmMgPSBodm1fc2F2ZShzcmMsICZjKSkg
KQoKQWxzbyBjb250cmFyeSB0byB5b3VyIGNsYWltIHlvdSBzdGlsbCBkbyBhbGxvY2F0aW9uIGFu
ZCBzYXZlCmFmdGVyIHRoZSBsb29wLCBsZWF2aW5nIGRzdCBpbiBhIHBhcnRseSBtb2RpZmllZCBz
dGF0ZSBpbiBtb3JlCmNhc2VzIHRoYW4gbmVjZXNzYXJ5LiBNYXkgSSBhc2sgdGhhdCB5b3UgZ28g
YmFjayB0byB0aGUgdjQKY29tbWVudHMgb25lIG1vcmUgdGltZT8KCkphbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
