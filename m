Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57ABCA3A50
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 17:26:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3ijF-0006y8-Vt; Fri, 30 Aug 2019 15:22:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3ijE-0006y3-Pj
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 15:22:20 +0000
X-Inumbo-ID: f4ea5c60-cb39-11e9-ae8b-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f4ea5c60-cb39-11e9-ae8b-12813bfff9fa;
 Fri, 30 Aug 2019 15:22:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CDBEAAB7D;
 Fri, 30 Aug 2019 15:22:18 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190830083225.10397-1-jgross@suse.com>
 <43d293e5-40b8-fae9-4d27-0b6bd6afcbda@suse.com>
 <34ab8be2-4698-c592-6448-2ff47513c107@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a2b60448-9698-2f1f-626f-a87d1e2fe20d@suse.com>
Date: Fri, 30 Aug 2019 17:22:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <34ab8be2-4698-c592-6448-2ff47513c107@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen: add macro for defining variable length
 array in public headers
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDguMjAxOSAxNjoyOSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAzMC4wOC4xOSAx
NjoyMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDMwLjA4LjIwMTkgMTA6MzIsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMveGVuLmgKPj4+ICsrKyBi
L3hlbi9pbmNsdWRlL3B1YmxpYy94ZW4uaAo+Pj4gQEAgLTUzLDYgKzUzLDE1IEBAIERFRklORV9Y
RU5fR1VFU1RfSEFORExFKHVpbnQ2NF90KTsKPj4+ICAgREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUo
eGVuX3Bmbl90KTsKPj4+ICAgREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUoeGVuX3Vsb25nX3QpOwo+
Pj4gICAKPj4+ICsvKiBEZWZpbmUgYSB2YXJpYWJsZSBsZW5ndGggYXJyYXkgKGRlcGVuZHMgb24g
Y29tcGlsZXIpLiAqLwo+Pj4gKyNpZiBkZWZpbmVkKF9fU1REQ19WRVJTSU9OX18pICYmIF9fU1RE
Q19WRVJTSU9OX18gPj0gMTk5OTAxTAo+Pj4gKyNkZWZpbmUgX19YRU5fVkFSTEVOX0FSUkFZX1NJ
WkUKPj4+ICsjZWxpZiBkZWZpbmVkKF9fR05VQ19fKQo+Pj4gKyNkZWZpbmUgX19YRU5fVkFSTEVO
X0FSUkFZX1NJWkUgIDAKPj4+ICsjZWxzZQo+Pj4gKyNkZWZpbmUgX19YRU5fVkFSTEVOX0FSUkFZ
X1NJWkUgIDEgLyogdmFyaWFibGUgc2l6ZSAqLwo+Pj4gKyNlbmRpZgo+Pgo+PiBUbyBiZSBpbiBs
aW5lIHdpdGggdGhlIGludGVudGlvbnMsIHRoZSBDOTAgc3RhbmRhcmQsIGFuZCBpby9yaW5nLmgK
Pj4gSSdkIHN1Z2dlc3QgdG8gdXNlIEZMRVggaW5zdGVhZCBvZiBWQVJMRU4uIEZ1cnRoZXJtb3Jl
LCBlc3BlY2lhbGx5Cj4+IGluIGEgcHVibGljIGhlYWRlciwgdHdvIGRvdWJsZSBsZWFkaW5nIHVu
ZGVyc2NvcmVzIG5lZWQgdG8gZ28gYXdheS4KPj4KPj4gQW5kIHRoZW4sIHdpdGggRkxFWCBpbiB0
aGUgbmFtZSwgU0laRSBpc24ndCByZWFsbHkgYXBwcm9wcmlhdGUKPj4gYW55bW9yZS4gVGhlcmVm
b3JlIEkgc2VlIHRocmVlIHBvc3NpYmxlIG5hbWVzOiBYRU5fRkxFWElCTEVfQVJSQVksCj4+IFhF
Tl9GTEVYX0FSUkFZX0RJTUVOU0lPTiAocG9zc2libHkganVzdCBfRElNIGF0IGl0cyBlbmQpLCBv
cgo+PiBYRU5fRkxFWF9BUlJBWV9ERVNJR05BVE9SLgo+IAo+IE9rYXkgdG8gdGhlICJGTEVYIiBw
YXJ0LCBidXQgdGhlICJYRU5fIiBwcmVmaXggaXMgbm90IHdvcmtpbmcgZHVlIHRvCj4gY29tcGF0
IGhlYWRlciBnZW5lcmF0aW9uICh0aGF0IHdpbGwgcmVzdWx0IGluIENPTVBBVF8gcHJlZml4IGlu
IHRoZQo+IGNvbXBhdCBoZWFkZXJzKS4KPiAKPiBTbyBhbnkgb3RoZXIgaWRlYXMgZm9yIGEgc2Vu
c2libGUgcHJlZml4PwoKSG1tLCB1Z2x5LiBQZXJoYXBzIGFsbCBsb3dlciBjYXNlIHRoZW4/IE9y
IGhhdmUKCiNkZWZpbmUgQ09NUEFUX0ZMRVhfLi4uIFhFTl9GTEVYXy4uLgoKc29tZXdoZXJlPwoK
SmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
