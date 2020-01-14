Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D1013AC65
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 15:36:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irNGO-0000jx-KD; Tue, 14 Jan 2020 14:33:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2XF3=3D=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1irNGN-0000jq-Qj
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 14:33:47 +0000
X-Inumbo-ID: daaea1a0-36da-11ea-a985-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id daaea1a0-36da-11ea-a985-bc764e2007e4;
 Tue, 14 Jan 2020 14:33:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3E9D2BB33;
 Tue, 14 Jan 2020 14:33:38 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200108152328.27194-1-jgross@suse.com>
 <20200108152328.27194-3-jgross@suse.com>
 <2a59a886-81ed-05d8-022c-eadaa5146e47@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <5020a128-e1ac-482f-3456-9895b784882c@suse.com>
Date: Tue, 14 Jan 2020 15:33:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <2a59a886-81ed-05d8-022c-eadaa5146e47@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/9] xen/sched: make sched-if.h really
 scheduler private
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDEuMjAgMTU6MjcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA4LjAxLjIwMjAgMTY6
MjMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IEBAIC0yMzQsMTYgKzIzMyw2IEBAIHZvaWQgZG9t
Y3RsX2xvY2tfcmVsZWFzZSh2b2lkKQo+PiAgICAgICBzcGluX3VubG9jaygmY3VycmVudC0+ZG9t
YWluLT5oeXBlcmNhbGxfZGVhZGxvY2tfbXV0ZXgpOwo+PiAgIH0KPj4gICAKPj4gLXN0YXRpYyBp
bmxpbmUKPj4gLWludCB2Y3B1YWZmaW5pdHlfcGFyYW1zX2ludmFsaWQoY29uc3Qgc3RydWN0IHhl
bl9kb21jdGxfdmNwdWFmZmluaXR5ICp2Y3B1YWZmKQo+PiAtewo+PiAtICAgIHJldHVybiB2Y3B1
YWZmLT5mbGFncyA9PSAwIHx8Cj4+IC0gICAgICAgICAgICgodmNwdWFmZi0+ZmxhZ3MgJiBYRU5f
VkNQVUFGRklOSVRZX0hBUkQpICYmCj4+IC0gICAgICAgICAgICBndWVzdF9oYW5kbGVfaXNfbnVs
bCh2Y3B1YWZmLT5jcHVtYXBfaGFyZC5iaXRtYXApKSB8fAo+PiAtICAgICAgICAgICAoKHZjcHVh
ZmYtPmZsYWdzICYgWEVOX1ZDUFVBRkZJTklUWV9TT0ZUKSAmJgo+PiAtICAgICAgICAgICAgZ3Vl
c3RfaGFuZGxlX2lzX251bGwodmNwdWFmZi0+Y3B1bWFwX3NvZnQuYml0bWFwKSk7Cj4+IC19Cj4g
Cj4gSSdkIGxpa2UgdG8gc3VnZ2VzdCBrZWVwaW5nIHRoaXMgYW5kIC4uLgo+IAo+PiBAQCAtNjA4
LDEyMiArNTk3LDggQEAgbG9uZyBkb19kb21jdGwoWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh4ZW5f
ZG9tY3RsX3QpIHVfZG9tY3RsKQo+PiAgIAo+PiAgICAgICBjYXNlIFhFTl9ET01DVExfc2V0dmNw
dWFmZmluaXR5Ogo+PiAgICAgICBjYXNlIFhFTl9ET01DVExfZ2V0dmNwdWFmZmluaXR5Ogo+PiAt
ICAgIHsKPj4gLSAgICAgICAgc3RydWN0IHZjcHUgKnY7Cj4+IC0gICAgICAgIGNvbnN0IHN0cnVj
dCBzY2hlZF91bml0ICp1bml0Owo+PiAtICAgICAgICBzdHJ1Y3QgeGVuX2RvbWN0bF92Y3B1YWZm
aW5pdHkgKnZjcHVhZmYgPSAmb3AtPnUudmNwdWFmZmluaXR5Owo+PiAtCj4+IC0gICAgICAgIHJl
dCA9IC1FSU5WQUw7Cj4+IC0gICAgICAgIGlmICggdmNwdWFmZi0+dmNwdSA+PSBkLT5tYXhfdmNw
dXMgKQo+PiAtICAgICAgICAgICAgYnJlYWs7Cj4+IC0KPj4gLSAgICAgICAgcmV0ID0gLUVTUkNI
Owo+PiAtICAgICAgICBpZiAoICh2ID0gZC0+dmNwdVt2Y3B1YWZmLT52Y3B1XSkgPT0gTlVMTCAp
Cj4+IC0gICAgICAgICAgICBicmVhazsKPj4gLQo+PiAtICAgICAgICB1bml0ID0gdi0+c2NoZWRf
dW5pdDsKPj4gLSAgICAgICAgcmV0ID0gLUVJTlZBTDsKPj4gLSAgICAgICAgaWYgKCB2Y3B1YWZm
aW5pdHlfcGFyYW1zX2ludmFsaWQodmNwdWFmZikgKQo+PiAtICAgICAgICAgICAgYnJlYWs7Cj4g
Cj4gLi4uIGV2ZXJ5dGhpbmcgdXAgdG8gaGVyZSAoZXhjZXB0IHRoZSBbdG9vIGVhcmx5XSB1bml0
IGFzc2lnbm1lbnQpLAo+IGFzIG5vdCBiZWluZyBzY2hlZHVsZXIgc3BlY2lmaWMgYXQgYWxsLiBU
aGUgcmVtYWluZGVyIHRoZW4gd291bGQKPiBiZXR0ZXIgYmVjb21lIHR3byBkaXN0aW5jdCBmdW5j
dGlvbnMsIGVsaW1pbmF0aW5nIHRoZSBuZWVkIHRvIHBhc3MKPiBvcC0+Y21kIChhbmQgcHJlc3Vt
YWJseSBwYXNzaW5nICJ2IiBpbnN0ZWFkIG9mICJkIikuIElmLCBvdG9oLCB0aGUKPiBkZWNpc2lv
biAoc3VwcG9ydGVkIGJ5IG90aGVycykgaXMgdG8gbW92ZSBldmVyeXRoaW5nLCB0aGVuIEkgdGhp
bmsKPiBpdCB3b3VsZCBiZSBhcHByb3ByaWF0ZSB0byBtYWtlIGF0IGxlYXN0IHNvbWUgYWRqdXN0
bWVudHM6IFRoZSBjb2RlCj4gYWJvdmUgc2hvdWxkIGJlIGNvbnZlcnRlZCB0byB1c2UgZG9tYWlu
X3ZjcHUoKSwgYW5kIGUuZy4gLi4uCgpFaXRoZXIgd291bGQgYmUgZmluZSB3aXRoIG1lLgoKPiAK
Pj4gLSAgICAgICAgaWYgKCBvcC0+Y21kID09IFhFTl9ET01DVExfc2V0dmNwdWFmZmluaXR5ICkK
Pj4gLSAgICAgICAgewo+PiAtICAgICAgICAgICAgY3B1bWFza192YXJfdCBuZXdfYWZmaW5pdHks
IG9sZF9hZmZpbml0eTsKPj4gLSAgICAgICAgICAgIGNwdW1hc2tfdCAqb25saW5lID0gY3B1cG9v
bF9kb21haW5fbWFzdGVyX2NwdW1hc2sodi0+ZG9tYWluKTsKPiAKPiAuLi4gdGhpcyBzaG91bGQg
dXNlICJkIi4KClllcy4KCj4gCj4+IEBAIC04NzUsNiArODc2LDE2IEBAIGludCBjcHVwb29sX2Rv
X3N5c2N0bChzdHJ1Y3QgeGVuX3N5c2N0bF9jcHVwb29sX29wICpvcCkKPj4gICAgICAgcmV0dXJu
IHJldDsKPj4gICB9Cj4+ICAgCj4+ICtpbnQgY3B1cG9vbF9nZXRfaWQoY29uc3Qgc3RydWN0IGRv
bWFpbiAqZCkKPiAKPiBJIGZpbmQgcGxhaW4gaW50IG9kZCBmb3Igc29tZXRoaW5nIGxpa2UgYW4g
SUQsIGJ1dCBJIGNhbiBzZWUgd2h5Cj4gdGhpcyBpcy4KPiAKPj4gK2NwdW1hc2tfdCAqY3B1cG9v
bF92YWxpZF9jcHVzKHN0cnVjdCBjcHVwb29sICpwb29sKQo+IAo+IGNvbnN0IHR3aWNlPwoKU2Vl
IHBhdGNoIDkuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
