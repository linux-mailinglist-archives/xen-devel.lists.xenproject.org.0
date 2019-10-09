Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 994CFD126B
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 17:26:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIDpA-0005JF-HY; Wed, 09 Oct 2019 15:24:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8w+b=YC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iIDp9-0005JA-2v
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 15:24:23 +0000
X-Inumbo-ID: dda9fb62-eaa8-11e9-96dc-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id dda9fb62-eaa8-11e9-96dc-bc764e2007e4;
 Wed, 09 Oct 2019 15:24:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6FCA0337;
 Wed,  9 Oct 2019 08:24:20 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B23E13F6C4;
 Wed,  9 Oct 2019 08:24:19 -0700 (PDT)
To: Artem Mygaiev <joculator@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1570628924.git.artem_mygaiev@epam.com>
 <6575cd1b9c82f5b28cd29d78308dc23821c9d246.1570628924.git.artem_mygaiev@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <1798592d-851b-87a2-3893-dcb075040d4f@arm.com>
Date: Wed, 9 Oct 2019 16:24:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6575cd1b9c82f5b28cd29d78308dc23821c9d246.1570628924.git.artem_mygaiev@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/3] Free allocated resource on error
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
Cc: Artem Mygaiev <artem_mygaiev@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQXJ0ZW0sCgpPbiAwOS8xMC8yMDE5IDE1OjIwLCBBcnRlbSBNeWdhaWV2IHdyb3RlOgo+IEFs
c28gZG8gbm90IHNldCBtYXJrIGRldmljZSBhcyBTTU1VIHByb3RlY3RlZCB3aGVuIHRoZXJlIGFy
ZSBubyBtb3JlCj4gU01NVSByZXNvdXJjZXMgbGVmdAoKVGhpcyBpcyBhIHNhbml0eSBjaGVjayBv
biB0aGUgY29udGVudCBvZiB0aGUgbm9kZSwgbm90IGEgbGFjayBvZiByZXNvdXJjZSBpbgp0aGlz
IGNhc2UuCgpUQkgsIHRoZSBjdXJyZW50IHBsYWNlbWVudCBpcyBwcm9iYWJseSBub3QgY29ycmVj
dC4gQnV0IEkgYW0gbm90IGNvbnZpbmNlZCB0aGUgCm5ldyBwbGFjZW1lbnQgaXMgYmV0dGVyLgoK
WGVuIDQuMTIgYW5kIGVhcmxpZXIgd2lsbCBpZ25vcmUgYW55IGZhaWx1cmUgYW5kIGNvbnRpbnVl
LCBzbyB3ZSBjYW5ub3QgdXNlIHRoaXMgCmRldmljZSBhdCBhbGwuIEluZGVlZCwgWGVuIHdpbGwg
Y29uZmlndXJlIHRoZSBTTU1VIHRvIGRlbnkgYW55IHRyYW5zYWN0aW9uLiBJZiAKeW91IGZhaWwg
dG8gaW5pdGlhbGl6ZSB0aGUgZGV2aWNlLCB0aGVuIGl0IHdpbGwgYmUgaW4gYW4gdW51c2FibGUg
c3RhdGUuIEluIHRoaXMgCmNhc2UsIHdlIGRvbid0IHdhbnQgYSBkb21haW4gKGluY2x1ZGluZyBE
b20wKSB0byB1c2UgaXQgYXQgYWxsLiBUaGlzIGNvdWxkIGJlIAphY2hpZXZlZCBieSBjYWxsaW5n
IGR0X2RldmljZV9zZXRfcHJvdGVjdGVkLgoKWGVuIDQuMTMgd2lsbCBzdG9wIGJvb3RpbmcgaWYg
YW55IG9mIHRoZSBTTU1VIGZhaWxzIHRvIGNvbmZpZ3VyZSAodGhpcyBpbmNsdWRlIApNYXN0ZXIg
RGV2aWNlIGNhbm5vdCBiZSBhc3NpZ25lZCkuIFNvIHRoZXJlIGFyZSBubyBkaWZmZXJlbmNlIHRo
ZXJlLgoKTXkgcHJlZmVyZW5jZSBpcyB0byBjYXRlciBmb3IgYWxsIFhlbiB2ZXJzaW9ucyBzbyB3
ZSBjYW4gY29uc2lkZXIgdGhlIHBhdGNoIGZvciAKYSBiYWNrcG9ydCBhbmQgcG90ZW50aWFsbHkg
cmV2ZXJ0IG9mIHRoZSBYZW4gNC4xMyBiZWhhdmlvciAoaS5lLiBjcmFzaGluZyB3aGVuIApvbmUg
SU9NTVUgaXMgbm90IGNvcnJlY3RseSBzZXR1cCkuIFNvIHdlIHdvdWxkIG5lZWQgdG8gbW92ZSB0
aGUgY2FsbCBhdCB0aGUgCmJlZ2lubmluZyBvZiB0aGUgZnVuY3Rpb24uCgo+IAo+IENvdmVyaXR5
LUlEOiAxMzgxODYyCj4gU2lnbmVkLW9mZi1ieTogQXJ0ZW0gTXlnYWlldiA8YXJ0ZW1fbXlnYWll
dkBlcGFtLmNvbT4KPiAtLS0KPiAgIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LmMg
fCA4ICsrKysrLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21t
dS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUuYwo+IGluZGV4IGYxNTFiOWY1
YjUuLmNmNDIzMzVlZWQgMTAwNjQ0Cj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJt
L3NtbXUuYwo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LmMKPiBAQCAt
ODA0LDkgKzgwNCw2IEBAIHN0YXRpYyBpbnQgcmVnaXN0ZXJfc21tdV9tYXN0ZXIoc3RydWN0IGFy
bV9zbW11X2RldmljZSAqc21tdSwKPiAgIAltYXN0ZXItPm9mX25vZGUJCQk9IG1hc3RlcnNwZWMt
Pm5wOwo+ICAgCW1hc3Rlci0+Y2ZnLm51bV9zdHJlYW1pZHMJPSBtYXN0ZXJzcGVjLT5hcmdzX2Nv
dW50Owo+ICAgCj4gLQkvKiBYZW46IExldCBYZW4ga25vdyB0aGF0IHRoZSBkZXZpY2UgaXMgcHJv
dGVjdGVkIGJ5IGFuIFNNTVUgKi8KPiAtCWR0X2RldmljZV9zZXRfcHJvdGVjdGVkKG1hc3RlcnNw
ZWMtPm5wKTsKPiAtCj4gICAJZm9yIChpID0gMDsgaSA8IG1hc3Rlci0+Y2ZnLm51bV9zdHJlYW1p
ZHM7ICsraSkgewo+ICAgCQl1MTYgc3RyZWFtaWQgPSBtYXN0ZXJzcGVjLT5hcmdzW2ldOwo+ICAg
Cj4gQEAgLTgxNSwxMCArODEyLDE1IEBAIHN0YXRpYyBpbnQgcmVnaXN0ZXJfc21tdV9tYXN0ZXIo
c3RydWN0IGFybV9zbW11X2RldmljZSAqc21tdSwKPiAgIAkJCWRldl9lcnIoZGV2LAo+ICAgCQkJ
CSJzdHJlYW0gSUQgZm9yIG1hc3RlciBkZXZpY2UgJXMgZ3JlYXRlciB0aGFuIG1heGltdW0gYWxs
b3dlZCAoJWQpXG4iLAo+ICAgCQkJCW1hc3RlcnNwZWMtPm5wLT5uYW1lLCBzbW11LT5udW1fbWFw
cGluZ19ncm91cHMpOwo+ICsJCQlkZXZtX2ZyZWUobWFzdGVyKTsKPiAgIAkJCXJldHVybiAtRVJB
TkdFOwo+ICAgCQl9Cj4gICAJCW1hc3Rlci0+Y2ZnLnN0cmVhbWlkc1tpXSA9IHN0cmVhbWlkOwo+
ICAgCX0KPiArCj4gKyAgICAgICAgLyogWGVuOiBMZXQgWGVuIGtub3cgdGhhdCB0aGUgZGV2aWNl
IGlzIHByb3RlY3RlZCBieSBhbiBTTU1VICovCj4gKyAgICAgICAgZHRfZGV2aWNlX3NldF9wcm90
ZWN0ZWQobWFzdGVyc3BlYy0+bnApOwoKVGhpcyBjb2RlIGlzIHVzaW5nIExpbnV4IGNvZGluZyBz
dHlsZSwgc28gaXQgc2hvdWxkIGJlIGhhcmQgdGFiIGhlcmUuCgo+ICsKPiAgIAlyZXR1cm4gaW5z
ZXJ0X3NtbXVfbWFzdGVyKHNtbXUsIG1hc3Rlcik7Cj4gICB9Cj4gICAKPiAKCkNoZWVycywKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
