Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C66AABD14
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 17:57:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6GZO-0001Al-MR; Fri, 06 Sep 2019 15:54:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i6GZN-0001Ag-6d
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 15:54:41 +0000
X-Inumbo-ID: a271fd14-d0be-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a271fd14-d0be-11e9-b299-bc764e2007e4;
 Fri, 06 Sep 2019 15:54:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7E9A0AF39;
 Fri,  6 Sep 2019 15:54:39 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190905194909.6811-1-andrew.cooper3@citrix.com>
 <a7787fb5-02ea-61a0-b503-21b21c2961aa@suse.com>
 <7a0a832d-e7a6-7f2f-66be-7d0af44aa3ff@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7e73bf4a-eb0b-12bd-0bc3-aa1f5ba60eb0@suse.com>
Date: Fri, 6 Sep 2019 17:54:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7a0a832d-e7a6-7f2f-66be-7d0af44aa3ff@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/cpuid: Extend the cpuid= option to
 support all named features
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDkuMjAxOSAxNzoyNywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNi8wOS8yMDE5
IDE2OjE4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDUuMDkuMjAxOSAyMTo0OSwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9jcHVpZC5jCj4+PiArKysgYi94
ZW4vYXJjaC94ODYvY3B1aWQuYwo+Pj4gQEAgLTIxLDQ1ICsyMSw2MiBAQCBzdGF0aWMgY29uc3Qg
dWludDMyX3QgZGVlcF9mZWF0dXJlc1tdID0gSU5JVF9ERUVQX0ZFQVRVUkVTOwo+Pj4gIAo+Pj4g
IHN0YXRpYyBpbnQgX19pbml0IHBhcnNlX3hlbl9jcHVpZChjb25zdCBjaGFyICpzKQo+Pj4gIHsK
Pj4+ICsgICAgc3RhdGljIGNvbnN0IHN0cnVjdCBmZWF0dXJlIHsKPj4+ICsgICAgICAgIGNvbnN0
IGNoYXIgKm5hbWU7Cj4+PiArICAgICAgICB1bnNpZ25lZCBpbnQgYml0Owo+Pj4gKyAgICB9IGZl
YXR1cmVzW10gX19pbml0Y29uc3QgPSBJTklUX0ZFQVRVUkVfTkFNRVMsICpsaHMsICptaWQsICpy
aHM7Cj4+IFRoZSBwb2ludGVyIGZpZWxkIHdhbnQgdGhpcyB0byB1c2UgX19pbml0Y29uc3RyZWwu
Cj4gCj4gT2suCj4gCj4+IEFuZCBJIGRvbid0IHRoaW5rIHlvdSBtZWFuIGxocywgbWlkLCBhbmQg
cmhzIHRvIGFsc28gYmUgc3RhdGljPwo+IAo+IE5vIC0gbm90IGludGVudGlvbmFsLgo+IAo+PiAg
QWxiZWl0IC4uLgo+Pgo+Pj4gICAgICBjb25zdCBjaGFyICpzczsKPj4+ICAgICAgaW50IHZhbCwg
cmMgPSAwOwo+Pj4gIAo+Pj4gICAgICBkbyB7Cj4+PiArICAgICAgICBjb25zdCBjaGFyICpmZWF0
Owo+Pj4gKwo+Pj4gICAgICAgICAgc3MgPSBzdHJjaHIocywgJywnKTsKPj4+ICAgICAgICAgIGlm
ICggIXNzICkKPj4+ICAgICAgICAgICAgICBzcyA9IHN0cmNocihzLCAnXDAnKTsKPj4+ICAKPj4+
IC0gICAgICAgIGlmICggKHZhbCA9IHBhcnNlX2Jvb2xlYW4oIm1kLWNsZWFyIiwgcywgc3MpKSA+
PSAwICkKPj4+IC0gICAgICAgIHsKPj4+IC0gICAgICAgICAgICBpZiAoICF2YWwgKQo+Pj4gLSAg
ICAgICAgICAgICAgICBzZXR1cF9jbGVhcl9jcHVfY2FwKFg4Nl9GRUFUVVJFX01EX0NMRUFSKTsK
Pj4+IC0gICAgICAgIH0KPj4+IC0gICAgICAgIGVsc2UgaWYgKCAodmFsID0gcGFyc2VfYm9vbGVh
bigiaWJwYiIsIHMsIHNzKSkgPj0gMCApCj4+PiAtICAgICAgICB7Cj4+PiAtICAgICAgICAgICAg
aWYgKCAhdmFsICkKPj4+IC0gICAgICAgICAgICAgICAgc2V0dXBfY2xlYXJfY3B1X2NhcChYODZf
RkVBVFVSRV9JQlBCKTsKPj4+IC0gICAgICAgIH0KPj4+IC0gICAgICAgIGVsc2UgaWYgKCAodmFs
ID0gcGFyc2VfYm9vbGVhbigiaWJyc2IiLCBzLCBzcykpID49IDAgKQo+Pj4gLSAgICAgICAgewo+
Pj4gLSAgICAgICAgICAgIGlmICggIXZhbCApCj4+PiAtICAgICAgICAgICAgICAgIHNldHVwX2Ns
ZWFyX2NwdV9jYXAoWDg2X0ZFQVRVUkVfSUJSU0IpOwo+Pj4gLSAgICAgICAgfQo+Pj4gLSAgICAg
ICAgZWxzZSBpZiAoICh2YWwgPSBwYXJzZV9ib29sZWFuKCJzdGlicCIsIHMsIHNzKSkgPj0gMCAp
Cj4+PiAtICAgICAgICB7Cj4+PiAtICAgICAgICAgICAgaWYgKCAhdmFsICkKPj4+IC0gICAgICAg
ICAgICAgICAgc2V0dXBfY2xlYXJfY3B1X2NhcChYODZfRkVBVFVSRV9TVElCUCk7Cj4+PiAtICAg
ICAgICB9Cj4+PiAtICAgICAgICBlbHNlIGlmICggKHZhbCA9IHBhcnNlX2Jvb2xlYW4oImwxZC1m
bHVzaCIsIHMsIHNzKSkgPj0gMCApCj4+PiAtICAgICAgICB7Cj4+PiAtICAgICAgICAgICAgaWYg
KCAhdmFsICkKPj4+IC0gICAgICAgICAgICAgICAgc2V0dXBfY2xlYXJfY3B1X2NhcChYODZfRkVB
VFVSRV9MMURfRkxVU0gpOwo+Pj4gLSAgICAgICAgfQo+Pj4gLSAgICAgICAgZWxzZSBpZiAoICh2
YWwgPSBwYXJzZV9ib29sZWFuKCJzc2JkIiwgcywgc3MpKSA+PSAwICkKPj4+ICsgICAgICAgIC8q
IFNraXAgdGhlICduby0nIHByZWZpeCBmb3IgbmFtZSBjb21wYXJpc29ucy4gKi8KPj4+ICsgICAg
ICAgIGZlYXQgPSBzOwo+Pj4gKyAgICAgICAgaWYgKCBzdHJuY21wKHMsICJuby0iLCAzKSA9PSAw
ICkKPj4+ICsgICAgICAgICAgICBmZWF0ICs9IDM7Cj4+PiArCj4+PiArICAgICAgICAvKiAoUmUp
aW5pdGFsaXNlIGxocyBhbmQgcmhzIGZvciBiaW5hcnkgc2VhcmNoLiAqLwo+Pj4gKyAgICAgICAg
bGhzID0gZmVhdHVyZXM7Cj4+PiArICAgICAgICByaHMgPSBmZWF0dXJlcyArIEFSUkFZX1NJWkUo
ZmVhdHVyZXMpOwo+PiAuLi4gdGhlIGNvbW1lbnQgaGVyZSBzdWdnZXN0cyB5b3UgZG8sIGJ1dCBJ
IGRvbid0IGN1cnJlbnRseSBzZWUgd2h5Lgo+IAo+IFdlIGFyZSBpbnNpZGUgYSBkbyB7IH0gKCkg
d2hpbGUgbG9vcCwgcGFyc2luZyBzb21ldGhpbmcgc3VjaCBhcwo+IGNwdWlkPWF2eDUxMixzcyxz
bXgKPiAKPiBUaGUgYmluYXJ5IHNlYXJjaCBvdmVyIHRoZSBmZWF0dXJlIG5hbWVzIG5lZWRzIHRv
IHN0YXJ0IGFnYWluIGZyb20KPiBzY3JhdGNoIGZvciBlYWNoIG5ldyBjcHVpZD0gbGlzdCBpdGVt
Lgo+IAo+IE90aGVyd2lzZSwgdGhlIHdoaWxlICggbGhzIDwgcmhzICkgYmluYXJ5IHNlYXJjaCB3
aWxsIG5ldmVyIGJlIGVudGVyZWQKPiBmb3IgdGhlIHNlY29uZCBjcHVpZD0gaXRlbS4KCkluIHdo
aWNoIGNhc2UsIHdoeSBkb24ndCB5b3UgbW92ZSB0aGUgdGhyZWUgdmFyaWFibGVzIGludG8gdGhl
IGRvL3doaWxlCnNjb3BlPyBBbnl3YXksIHdpdGggdGhlIGFubm90YXRpb24gY29ycmVjdGlvbiBh
bmQgdGhlIHZhcmlhYmxlcyBub24tCnN0YXRpYyAoaW4gd2hpY2hldmVyIHNjb3BlKQpSZXZpZXdl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
