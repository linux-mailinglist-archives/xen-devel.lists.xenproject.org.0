Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC19DA3A69
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 17:33:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3irS-0007mF-Th; Fri, 30 Aug 2019 15:30:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ii8P=W2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i3irR-0007m7-2a
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 15:30:49 +0000
X-Inumbo-ID: 23b53cd0-cb3b-11e9-ae8b-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 23b53cd0-cb3b-11e9-ae8b-12813bfff9fa;
 Fri, 30 Aug 2019 15:30:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D4D11AE84;
 Fri, 30 Aug 2019 15:30:46 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190830083225.10397-1-jgross@suse.com>
 <43d293e5-40b8-fae9-4d27-0b6bd6afcbda@suse.com>
 <34ab8be2-4698-c592-6448-2ff47513c107@suse.com>
 <a2b60448-9698-2f1f-626f-a87d1e2fe20d@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <0caf8faa-2f7a-0ea6-693d-f505d34d2217@suse.com>
Date: Fri, 30 Aug 2019 17:30:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a2b60448-9698-2f1f-626f-a87d1e2fe20d@suse.com>
Content-Language: de-DE
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDguMTkgMTc6MjIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDMwLjA4LjIwMTkgMTY6
MjksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDMwLjA4LjE5IDE2OjIxLCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDMwLjA4LjIwMTkgMTA6MzIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL3hlbi5oCj4+Pj4gKysrIGIveGVuL2luY2x1ZGUv
cHVibGljL3hlbi5oCj4+Pj4gQEAgLTUzLDYgKzUzLDE1IEBAIERFRklORV9YRU5fR1VFU1RfSEFO
RExFKHVpbnQ2NF90KTsKPj4+PiAgICBERUZJTkVfWEVOX0dVRVNUX0hBTkRMRSh4ZW5fcGZuX3Qp
Owo+Pj4+ICAgIERFRklORV9YRU5fR1VFU1RfSEFORExFKHhlbl91bG9uZ190KTsKPj4+PiAgICAK
Pj4+PiArLyogRGVmaW5lIGEgdmFyaWFibGUgbGVuZ3RoIGFycmF5IChkZXBlbmRzIG9uIGNvbXBp
bGVyKS4gKi8KPj4+PiArI2lmIGRlZmluZWQoX19TVERDX1ZFUlNJT05fXykgJiYgX19TVERDX1ZF
UlNJT05fXyA+PSAxOTk5MDFMCj4+Pj4gKyNkZWZpbmUgX19YRU5fVkFSTEVOX0FSUkFZX1NJWkUK
Pj4+PiArI2VsaWYgZGVmaW5lZChfX0dOVUNfXykKPj4+PiArI2RlZmluZSBfX1hFTl9WQVJMRU5f
QVJSQVlfU0laRSAgMAo+Pj4+ICsjZWxzZQo+Pj4+ICsjZGVmaW5lIF9fWEVOX1ZBUkxFTl9BUlJB
WV9TSVpFICAxIC8qIHZhcmlhYmxlIHNpemUgKi8KPj4+PiArI2VuZGlmCj4+Pgo+Pj4gVG8gYmUg
aW4gbGluZSB3aXRoIHRoZSBpbnRlbnRpb25zLCB0aGUgQzkwIHN0YW5kYXJkLCBhbmQgaW8vcmlu
Zy5oCj4+PiBJJ2Qgc3VnZ2VzdCB0byB1c2UgRkxFWCBpbnN0ZWFkIG9mIFZBUkxFTi4gRnVydGhl
cm1vcmUsIGVzcGVjaWFsbHkKPj4+IGluIGEgcHVibGljIGhlYWRlciwgdHdvIGRvdWJsZSBsZWFk
aW5nIHVuZGVyc2NvcmVzIG5lZWQgdG8gZ28gYXdheS4KPj4+Cj4+PiBBbmQgdGhlbiwgd2l0aCBG
TEVYIGluIHRoZSBuYW1lLCBTSVpFIGlzbid0IHJlYWxseSBhcHByb3ByaWF0ZQo+Pj4gYW55bW9y
ZS4gVGhlcmVmb3JlIEkgc2VlIHRocmVlIHBvc3NpYmxlIG5hbWVzOiBYRU5fRkxFWElCTEVfQVJS
QVksCj4+PiBYRU5fRkxFWF9BUlJBWV9ESU1FTlNJT04gKHBvc3NpYmx5IGp1c3QgX0RJTSBhdCBp
dHMgZW5kKSwgb3IKPj4+IFhFTl9GTEVYX0FSUkFZX0RFU0lHTkFUT1IuCj4+Cj4+IE9rYXkgdG8g
dGhlICJGTEVYIiBwYXJ0LCBidXQgdGhlICJYRU5fIiBwcmVmaXggaXMgbm90IHdvcmtpbmcgZHVl
IHRvCj4+IGNvbXBhdCBoZWFkZXIgZ2VuZXJhdGlvbiAodGhhdCB3aWxsIHJlc3VsdCBpbiBDT01Q
QVRfIHByZWZpeCBpbiB0aGUKPj4gY29tcGF0IGhlYWRlcnMpLgo+Pgo+PiBTbyBhbnkgb3RoZXIg
aWRlYXMgZm9yIGEgc2Vuc2libGUgcHJlZml4Pwo+IAo+IEhtbSwgdWdseS4gUGVyaGFwcyBhbGwg
bG93ZXIgY2FzZSB0aGVuPyBPciBoYXZlCgp4ZW5fIGFuZCBYZW5fIGFyZSBiZWluZyBjb252ZXJ0
ZWQsIHRvby4KCj4gCj4gI2RlZmluZSBDT01QQVRfRkxFWF8uLi4gWEVOX0ZMRVhfLi4uCj4gCj4g
c29tZXdoZXJlPwoKU2VlbXMgYXMgaWYgZG9pbmcgdGhhdCBpbiBpbmNsdWRlL3B1YmxpYy94ZW4t
Y29tcGF0LmggaXMgd29ya2luZy4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
