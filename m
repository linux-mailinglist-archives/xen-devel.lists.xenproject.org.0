Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BD2B22E4
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 17:05:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8n5G-0007Qq-0P; Fri, 13 Sep 2019 15:02:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mE8E=XI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i8n5E-0007Qj-1a
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 15:02:00 +0000
X-Inumbo-ID: 6e794368-d637-11e9-a337-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e794368-d637-11e9-a337-bc764e2007e4;
 Fri, 13 Sep 2019 15:01:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 522A2B8F3;
 Fri, 13 Sep 2019 15:01:57 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-32-jgross@suse.com>
 <f76aba47-e3c7-b8c6-03ac-b6862106d01c@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <e4d759d5-75a7-4428-8b12-7532275cf595@suse.com>
Date: Fri, 13 Sep 2019 17:01:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f76aba47-e3c7-b8c6-03ac-b6862106d01c@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v2 31/48] xen/sched: add support for
 multiple vcpus per sched unit where missing
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDkuMTkgMTI6NDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA5LjA4LjIwMTkgMTY6
NTgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IFYxOgo+PiAtIGFkZCBzcGVjaWFsIGhhbmRsaW5n
IGZvciBpZGxlIHVuaXQgaW4gdW5pdF9ydW5uYWJsZSgpIGFuZAo+PiAgICB1bml0X3J1bm5hYmxl
X3N0YXRlKCkKPiAKPiBXaHkgd2FzIHRoaXMgZG9uZT8gSXNuJ3QgdmNwdV9ydW5uYWJsZSgpIGdv
aW5nIHRvIGFsd2F5cyByZXR1cm4KPiB0cnVlIGZvciBpZGxlIHZDUFUtcz8KClRoZSBwcm9ibGVt
IGlzIHRoZSBmb3JfZWFjaF9zY2hlZF91bml0X3ZjcHUoKSBsb29wIGhhbmRsaW5nLgoKVGhlIGxv
b3AgaXMgZW5kaW5nIGFzIHNvb24gYXMgdmNwdS0+c2NoZWRfdW5pdCAhPSB1bml0LiBCdXQgdGhp
cwptaWdodCBiZSB0cnVlIGZvciBpZGxlIHZjcHVzIGluIGNhc2UgdGhleSBhcmUgdGVtcG9yYXJp
bHkgYWN0aXZlCmZvciBhIG5vcm1hbCBkb21haW4ncyB1bml0LgoKPiAKPj4gLS0tIGEveGVuL2Nv
bW1vbi9kb21haW4uYwo+PiArKysgYi94ZW4vY29tbW9uL2RvbWFpbi5jCj4+IEBAIC0xMjU1LDcg
KzEyNTUsMTAgQEAgaW50IHZjcHVfcmVzZXQoc3RydWN0IHZjcHUgKnYpCj4+ICAgICAgIHYtPmFz
eW5jX2V4Y2VwdGlvbl9tYXNrID0gMDsKPj4gICAgICAgbWVtc2V0KHYtPmFzeW5jX2V4Y2VwdGlv
bl9zdGF0ZSwgMCwgc2l6ZW9mKHYtPmFzeW5jX2V4Y2VwdGlvbl9zdGF0ZSkpOwo+PiAgICNlbmRp
Zgo+PiAtICAgIHYtPmFmZmluaXR5X2Jyb2tlbiA9IDA7Cj4+ICsgICAgaWYgKCB2LT5hZmZpbml0
eV9icm9rZW4gJiBWQ1BVX0FGRklOSVRZX09WRVJSSURFICkKPj4gKyAgICAgICAgdmNwdV90ZW1w
b3JhcnlfYWZmaW5pdHkodiwgTlJfQ1BVUywgVkNQVV9BRkZJTklUWV9PVkVSUklERSk7Cj4+ICsg
ICAgaWYgKCB2LT5hZmZpbml0eV9icm9rZW4gJiBWQ1BVX0FGRklOSVRZX1dBSVQgKQo+PiArICAg
ICAgICB2Y3B1X3RlbXBvcmFyeV9hZmZpbml0eSh2LCBOUl9DUFVTLCBWQ1BVX0FGRklOSVRZX1dB
SVQpOwo+IAo+IFNob3VsZG4ndCB0aGlzIGxpdmUgaW4gYW4gZWFybGllciBwYXRjaD8gSSBndWVz
cyB0aGUgc2FtZSBxdWVzdGlvbgo+IGlzIGFwcGxpY2FibGUgdG8gYWxtb3N0IGV2ZXJ5dGhpbmcg
aGVyZSwgYXMgYWxzbyBhbHJlYWR5IG1lbnRpb25lZAo+IGUuZy4gaW4gdGhlIHByZXZpb3VzIHBh
dGNoLgoKSG1tLCB0aGlzIF9pc18gYSBtaXNzaW5nIHBhcnQgZm9yIG11bHRpcGxlIHZjcHVzIHBl
ciB1bml0LgoKSSB3b3VsZG4ndCBrbm93IHdoaWNoIG90aGVyIHBhdGNoIHdvdWxkIGJlIG1vcmUg
c3VpdGFibGUuCgo+IAo+PiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBzY2hlZF9zZXRfcmVzKHN0cnVj
dCBzY2hlZF91bml0ICp1bml0LAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBzY2hlZF9yZXNvdXJjZSAqcmVzKQo+PiAgIHsKPj4gLSAgICB1bml0LT52Y3B1X2xp
c3QtPnByb2Nlc3NvciA9IHJlcy0+cHJvY2Vzc29yOwo+PiArICAgIGludCBjcHUgPSBjcHVtYXNr
X2ZpcnN0KHJlcy0+Y3B1cyk7Cj4gCj4gdW5zaWduZWQgaW50CgpZZXMuCgo+IAo+PiAgIHN0YXRp
YyBpbmxpbmUgdm9pZCBzY2hlZF9zZXRfcGF1c2VfZmxhZ3NfYXRvbWljKHN0cnVjdCBzY2hlZF91
bml0ICp1bml0LAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGludCBiaXQpCj4+ICAgewo+PiAtICAgIHNldF9iaXQoYml0LCAmdW5p
dC0+dmNwdV9saXN0LT5wYXVzZV9mbGFncyk7Cj4+ICsgICAgc3RydWN0IHZjcHUgKnY7Cj4+ICsK
Pj4gKyAgICBmb3JfZWFjaF9zY2hlZF91bml0X3ZjcHUgKCB1bml0LCB2ICkKPj4gKyAgICAgICAg
c2V0X2JpdChiaXQsICZ2LT5wYXVzZV9mbGFncyk7Cj4+ICAgfQo+PiAgIAo+PiAgIHN0YXRpYyBp
bmxpbmUgdm9pZCBzY2hlZF9jbGVhcl9wYXVzZV9mbGFnc19hdG9taWMoc3RydWN0IHNjaGVkX3Vu
aXQgKnVuaXQsCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBpbnQgYml0KQo+PiAgIHsKPj4gLSAgICBjbGVhcl9iaXQoYml0LCAm
dW5pdC0+dmNwdV9saXN0LT5wYXVzZV9mbGFncyk7Cj4+ICsgICAgc3RydWN0IHZjcHUgKnY7Cj4+
ICsKPj4gKyAgICBmb3JfZWFjaF9zY2hlZF91bml0X3ZjcHUgKCB1bml0LCB2ICkKPj4gKyAgICAg
ICAgY2xlYXJfYml0KGJpdCwgJnYtPnBhdXNlX2ZsYWdzKTsKPj4gICB9Cj4gCj4gVGhlIGF0b21p
Y2l0eSBpcyAobmVjZXNzYXJpbHkpIGxpbWl0ZWQgaGVyZSAtIGl0J3MgYXRvbWljIGZvciBhbgo+
IGluZGl2aWR1YWwgdkNQVSwgYnV0IG5vdCBhdG9taWMgZm9yIGEgdW5pdCBhcyBhIHdob2xlLiBJ
ZiB0aGlzCj4gaXMgaW5kZWVkIGEgdXNlZnVsIGh5YnJpZCwgdGhlbiBJIHRoaW5rIGl0IHdvdWxk
IGJlIG5pY2UgaWYgdGhlcmUKPiB3YXMgYSBjb21tZW50IG5leHQgdG8gdGhlc2UgZnVuY3Rpb25z
IGNsYXJpZnlpbmcgdW5kZXIgd2hhdAo+IGNvbmRpdGlvbnMgdXNlIG9mIHRoZW0gaXMgY29ycmVj
dCB3aXRob3V0IGl0IGFsc28gYmVpbmcgY29ycmVjdAo+IHRvIHVzZSB0aGVpciBub24tYXRvbWlj
IGNvdW50ZXJwYXJ0cyAoZS5nLiBkdWUgdG8gdXNlIG9mIGFuCj4gZXh0ZXJuYWwgbG9jaykuCgpP
a2F5LCBJJ2xsIGFkZCB0aGF0LgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
