Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3C113AC52
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 15:30:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irNA7-0008ED-Kg; Tue, 14 Jan 2020 14:27:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XZPm=3D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1irNA5-0008E6-UD
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 14:27:17 +0000
X-Inumbo-ID: f0ead20a-36d9-11ea-ac27-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0ead20a-36d9-11ea-ac27-bc764e2007e4;
 Tue, 14 Jan 2020 14:27:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BB248BAF9;
 Tue, 14 Jan 2020 14:27:05 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20200108152328.27194-1-jgross@suse.com>
 <20200108152328.27194-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2a59a886-81ed-05d8-022c-eadaa5146e47@suse.com>
Date: Tue, 14 Jan 2020 15:27:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200108152328.27194-3-jgross@suse.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDEuMjAyMCAxNjoyMywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBAQCAtMjM0LDE2ICsy
MzMsNiBAQCB2b2lkIGRvbWN0bF9sb2NrX3JlbGVhc2Uodm9pZCkKPiAgICAgIHNwaW5fdW5sb2Nr
KCZjdXJyZW50LT5kb21haW4tPmh5cGVyY2FsbF9kZWFkbG9ja19tdXRleCk7Cj4gIH0KPiAgCj4g
LXN0YXRpYyBpbmxpbmUKPiAtaW50IHZjcHVhZmZpbml0eV9wYXJhbXNfaW52YWxpZChjb25zdCBz
dHJ1Y3QgeGVuX2RvbWN0bF92Y3B1YWZmaW5pdHkgKnZjcHVhZmYpCj4gLXsKPiAtICAgIHJldHVy
biB2Y3B1YWZmLT5mbGFncyA9PSAwIHx8Cj4gLSAgICAgICAgICAgKCh2Y3B1YWZmLT5mbGFncyAm
IFhFTl9WQ1BVQUZGSU5JVFlfSEFSRCkgJiYKPiAtICAgICAgICAgICAgZ3Vlc3RfaGFuZGxlX2lz
X251bGwodmNwdWFmZi0+Y3B1bWFwX2hhcmQuYml0bWFwKSkgfHwKPiAtICAgICAgICAgICAoKHZj
cHVhZmYtPmZsYWdzICYgWEVOX1ZDUFVBRkZJTklUWV9TT0ZUKSAmJgo+IC0gICAgICAgICAgICBn
dWVzdF9oYW5kbGVfaXNfbnVsbCh2Y3B1YWZmLT5jcHVtYXBfc29mdC5iaXRtYXApKTsKPiAtfQoK
SSdkIGxpa2UgdG8gc3VnZ2VzdCBrZWVwaW5nIHRoaXMgYW5kIC4uLgoKPiBAQCAtNjA4LDEyMiAr
NTk3LDggQEAgbG9uZyBkb19kb21jdGwoWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh4ZW5fZG9tY3Rs
X3QpIHVfZG9tY3RsKQo+ICAKPiAgICAgIGNhc2UgWEVOX0RPTUNUTF9zZXR2Y3B1YWZmaW5pdHk6
Cj4gICAgICBjYXNlIFhFTl9ET01DVExfZ2V0dmNwdWFmZmluaXR5Ogo+IC0gICAgewo+IC0gICAg
ICAgIHN0cnVjdCB2Y3B1ICp2Owo+IC0gICAgICAgIGNvbnN0IHN0cnVjdCBzY2hlZF91bml0ICp1
bml0Owo+IC0gICAgICAgIHN0cnVjdCB4ZW5fZG9tY3RsX3ZjcHVhZmZpbml0eSAqdmNwdWFmZiA9
ICZvcC0+dS52Y3B1YWZmaW5pdHk7Cj4gLQo+IC0gICAgICAgIHJldCA9IC1FSU5WQUw7Cj4gLSAg
ICAgICAgaWYgKCB2Y3B1YWZmLT52Y3B1ID49IGQtPm1heF92Y3B1cyApCj4gLSAgICAgICAgICAg
IGJyZWFrOwo+IC0KPiAtICAgICAgICByZXQgPSAtRVNSQ0g7Cj4gLSAgICAgICAgaWYgKCAodiA9
IGQtPnZjcHVbdmNwdWFmZi0+dmNwdV0pID09IE5VTEwgKQo+IC0gICAgICAgICAgICBicmVhazsK
PiAtCj4gLSAgICAgICAgdW5pdCA9IHYtPnNjaGVkX3VuaXQ7Cj4gLSAgICAgICAgcmV0ID0gLUVJ
TlZBTDsKPiAtICAgICAgICBpZiAoIHZjcHVhZmZpbml0eV9wYXJhbXNfaW52YWxpZCh2Y3B1YWZm
KSApCj4gLSAgICAgICAgICAgIGJyZWFrOwoKLi4uIGV2ZXJ5dGhpbmcgdXAgdG8gaGVyZSAoZXhj
ZXB0IHRoZSBbdG9vIGVhcmx5XSB1bml0IGFzc2lnbm1lbnQpLAphcyBub3QgYmVpbmcgc2NoZWR1
bGVyIHNwZWNpZmljIGF0IGFsbC4gVGhlIHJlbWFpbmRlciB0aGVuIHdvdWxkCmJldHRlciBiZWNv
bWUgdHdvIGRpc3RpbmN0IGZ1bmN0aW9ucywgZWxpbWluYXRpbmcgdGhlIG5lZWQgdG8gcGFzcwpv
cC0+Y21kIChhbmQgcHJlc3VtYWJseSBwYXNzaW5nICJ2IiBpbnN0ZWFkIG9mICJkIikuIElmLCBv
dG9oLCB0aGUKZGVjaXNpb24gKHN1cHBvcnRlZCBieSBvdGhlcnMpIGlzIHRvIG1vdmUgZXZlcnl0
aGluZywgdGhlbiBJIHRoaW5rCml0IHdvdWxkIGJlIGFwcHJvcHJpYXRlIHRvIG1ha2UgYXQgbGVh
c3Qgc29tZSBhZGp1c3RtZW50czogVGhlIGNvZGUKYWJvdmUgc2hvdWxkIGJlIGNvbnZlcnRlZCB0
byB1c2UgZG9tYWluX3ZjcHUoKSwgYW5kIGUuZy4gLi4uCgo+IC0gICAgICAgIGlmICggb3AtPmNt
ZCA9PSBYRU5fRE9NQ1RMX3NldHZjcHVhZmZpbml0eSApCj4gLSAgICAgICAgewo+IC0gICAgICAg
ICAgICBjcHVtYXNrX3Zhcl90IG5ld19hZmZpbml0eSwgb2xkX2FmZmluaXR5Owo+IC0gICAgICAg
ICAgICBjcHVtYXNrX3QgKm9ubGluZSA9IGNwdXBvb2xfZG9tYWluX21hc3Rlcl9jcHVtYXNrKHYt
PmRvbWFpbik7CgouLi4gdGhpcyBzaG91bGQgdXNlICJkIi4KCj4gQEAgLTg3NSw2ICs4NzYsMTYg
QEAgaW50IGNwdXBvb2xfZG9fc3lzY3RsKHN0cnVjdCB4ZW5fc3lzY3RsX2NwdXBvb2xfb3AgKm9w
KQo+ICAgICAgcmV0dXJuIHJldDsKPiAgfQo+ICAKPiAraW50IGNwdXBvb2xfZ2V0X2lkKGNvbnN0
IHN0cnVjdCBkb21haW4gKmQpCgpJIGZpbmQgcGxhaW4gaW50IG9kZCBmb3Igc29tZXRoaW5nIGxp
a2UgYW4gSUQsIGJ1dCBJIGNhbiBzZWUgd2h5CnRoaXMgaXMuCgo+ICtjcHVtYXNrX3QgKmNwdXBv
b2xfdmFsaWRfY3B1cyhzdHJ1Y3QgY3B1cG9vbCAqcG9vbCkKCmNvbnN0IHR3aWNlPwoKSmFuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
