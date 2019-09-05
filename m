Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 364E5A9A9D
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 08:25:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5l9s-0004MU-H1; Thu, 05 Sep 2019 06:22:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=K5dO=XA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i5l9r-0004MP-11
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 06:22:15 +0000
X-Inumbo-ID: 7f2297fc-cfa5-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f2297fc-cfa5-11e9-b299-bc764e2007e4;
 Thu, 05 Sep 2019 06:22:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6C7A1ABCB;
 Thu,  5 Sep 2019 06:22:09 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190809145833.1020-1-jgross@suse.com>
 <c81b4a24-818d-7f1c-522e-f2120297569f@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <ad3b44cf-b62c-8d48-e4d2-9ef24e47078c@suse.com>
Date: Thu, 5 Sep 2019 08:22:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c81b4a24-818d-7f1c-522e-f2120297569f@citrix.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v2 00/48] xen: add core scheduling support
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
 AndrewCooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 RogerPau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU2VyZ2V5LAoKT24gMTUuMDguMTkgMTI6MTcsIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4gSGkg
SnVlcmdlbiwKPiAKPiBUaGUgbGF0ZXN0IHJvdW5kIG9mIHRlc3RpbmcgcmV2ZWFsZWQgdGhlIGZv
bGxvd2luZyAzIFhlbiBjcmFzaGVzOgo+IAo+IDEuIHZjcHVfc2xlZXBfc3luYygpIDwtLSB2bGFw
aWNfaW5pdF9zaXBpX2FjdGlvbigpCj4gVGhpcyB3YXMgc2VlbiBtdWx0aXBsZSB0aW1lcy4gSXQg
dGVuZHMgdG8gaGFwcGVuIG9uIGxhcmdlIFdpbmRvd3MgU2VydmVyCj4gVk1zICg+PSAxMiB2Q1BV
cykuCj4gaHR0cHM6Ly9wYXN0ZS5kZWJpYW4ubmV0LzEwOTU4NDQvCj4gCj4gMi4gdmNwdV9zbGVl
cF9zeW5jKCkgPC0tIHZjcHVfc2V0X3BlcmlvZGljX3RpbWVyKCkgPC0tIHB2X2h5cGVyY2FsbCgp
Cj4gVGhpcyB3YXMgc2VlbiBvbiBTbGVzIDExLjQgUFYgVk0gd2l0aCAzMiB2Q1BVcyBhbmQgNkdC
IFJBTQo+IGh0dHBzOi8vcGFzdGUuZGViaWFuLm5ldC8xMDk1ODQzLwo+IAo+IDMuIEFDUEkgUzU6
IHNjaGVkdWxlLmMjc2NoZWRfc2xhdmUoKQo+IFRoaXMgb25lIHdhcyBkdXJpbmcgc2h1dGRvd24g
YWdhaW4uCj4gaHR0cHM6Ly9wYXN0ZS5kZWJpYW4ubmV0LzEwOTU4NDUvCj4gCj4gVGhlcmUgYWxz
byB3ZXJlIGEgbnVtYmVyIG9mIERvbTAgc29mdC1sb2NrdXBzICh0b2dldGhlciB3aXRoIFJDVSBz
dGFsbHMpCj4gYnV0IHVuZm9ydHVuYXRlbHkgb3VyIGNyYXNoZHVtcCB0b29sIHdhcyBhIGJpdCBi
cm9rZW4gc28gZnVsbCBEb20wIGtlcm5lbAo+IGxvZ3Mgd2VyZSBub3QgY2FwdHVyZWQgdGhpcyB0
aW1lLgo+IAo+IEFuZCBDZW50T1MgNS4xMSBzdXNwZW5kIHJlZ3Jlc3Npb24gKGFzIHJlcG9ydGVk
IHByZXZpb3VzbHkpIGlzIHN0aWxsCj4gcHJlc2VudC4KCkkgaGF2ZSBmb3VuZCBvbmUgYnVnIGlu
IHRoZSB2LT5pc19ydW5uaW5nIHNldHRpbmcsIHdoaWNoIG1pZ2h0IGJlCnJlbGF0ZWQgdG8geW91
ciBvYnNlcnZlZCBoYW5ncywgYnV0IEkgY291bGRuJ3QgdmVyaWZ5IHRoYXQuCgpJIGhhdmUgcmVi
YXNlZCBteSBzZXJpZXMgd2l0aCB0aGUgaXNfcnVubmluZyBmaXggdG8gY3VycmVudCBzdGFnaW5n
LiBZb3UKY2FuIGZpbmQgdGhhdCB1bmRlcgoKZ2l0Oi8vZ2l0aHViLmNvbS9qZ3Jvc3MxL3hlbi8g
c2NoZWQtdjJiLTIwMTktMDktMDUKClRoaXMgYnJhbmNoIGluY2x1ZGVzIHRoZSBuZWVkZWQgcHJl
cmVxdWlzaXRlIHNlcmllcyAoInhlbi9zY2hlZDogdXNlIG5ldyAKaWRsZSBzY2hlZHVsZXIgZm9y
IGZyZWUgY3B1cyIpLCBhbmQgc29tZSBhZGRpdGlvbmFsIGRlYnVnIGVuaGFuY2VtZW50cwpJJ2Qg
bGlrZSB5b3UgdG8gdXNlOgoKLSBteSBzZXJpZXMgZm9yIGRlYnVndHJhY2UgZW5oYW5jZW1lbnRz
Ci0gbXkgc2VyaWVzIGZvciBsb2NrLXByb2ZpbGluZyBlbmhhbmNlbWVudHMKLSBhbmQgYXMgdGhl
IGxhc3QgcGF0Y2ggc29tZSBkZWJ1Z3RyYWNlIGhvb2tzIGluIHRoZSBzY2hlZHVsZXIKClBsZWFz
ZSBtYWtlIHN1cmUgdG8gaGF2ZSBDT05GSUdfREVCVUdfVFJBQ0UgYW5kCkNPTkZJR19ERUJVR19M
T0NLX1BST0ZJTEUgc2V0IHdoZW4gYnVpbGRpbmcgdGhlIGh5cGVydmlzb3IuCgpXaGVuIHRlc3Rp
bmcgcGxlYXNlIGFkZDoKCmFzeW5jLXNob3ctYWxsPW9uIHdhdGNoZG9nPW9uIGRlYnVndHJhY2U9
Y3B1OjE2Cgp0byB0aGUgaHlwZXJ2aXNvciBib290IHBhcmFtZXRlcnMuIFRoaXMgc2hvdWxkIGFk
ZCBhIGxvdCBvZiBhZGRpdGlvbmFsCm91dHB1dCBpbiBjYXNlIG9mIGEgY3Jhc2gsIHdoaWNoIHdp
bGwgKGhvcGVmdWxseSkgaGVscCB0byBmaW5kIHRoZQpyZWFzb24ocykgZm9yIGhhbmdzIGFuZCBj
cmFzaGVzLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
