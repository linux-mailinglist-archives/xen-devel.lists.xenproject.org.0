Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED33CA3947
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 16:32:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3hty-0002JL-4F; Fri, 30 Aug 2019 14:29:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ii8P=W2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i3htw-0002JA-IO
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 14:29:20 +0000
X-Inumbo-ID: 8d4f3f0a-cb32-11e9-ae8a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8d4f3f0a-cb32-11e9-ae8a-12813bfff9fa;
 Fri, 30 Aug 2019 14:29:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A2824AC50;
 Fri, 30 Aug 2019 14:29:18 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190830083225.10397-1-jgross@suse.com>
 <43d293e5-40b8-fae9-4d27-0b6bd6afcbda@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <34ab8be2-4698-c592-6448-2ff47513c107@suse.com>
Date: Fri, 30 Aug 2019 16:29:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <43d293e5-40b8-fae9-4d27-0b6bd6afcbda@suse.com>
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

T24gMzAuMDguMTkgMTY6MjEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDMwLjA4LjIwMTkgMTA6
MzIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy94ZW4u
aAo+PiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMveGVuLmgKPj4gQEAgLTUzLDYgKzUzLDE1IEBA
IERFRklORV9YRU5fR1VFU1RfSEFORExFKHVpbnQ2NF90KTsKPj4gICBERUZJTkVfWEVOX0dVRVNU
X0hBTkRMRSh4ZW5fcGZuX3QpOwo+PiAgIERFRklORV9YRU5fR1VFU1RfSEFORExFKHhlbl91bG9u
Z190KTsKPj4gICAKPj4gKy8qIERlZmluZSBhIHZhcmlhYmxlIGxlbmd0aCBhcnJheSAoZGVwZW5k
cyBvbiBjb21waWxlcikuICovCj4+ICsjaWYgZGVmaW5lZChfX1NURENfVkVSU0lPTl9fKSAmJiBf
X1NURENfVkVSU0lPTl9fID49IDE5OTkwMUwKPj4gKyNkZWZpbmUgX19YRU5fVkFSTEVOX0FSUkFZ
X1NJWkUKPj4gKyNlbGlmIGRlZmluZWQoX19HTlVDX18pCj4+ICsjZGVmaW5lIF9fWEVOX1ZBUkxF
Tl9BUlJBWV9TSVpFICAwCj4+ICsjZWxzZQo+PiArI2RlZmluZSBfX1hFTl9WQVJMRU5fQVJSQVlf
U0laRSAgMSAvKiB2YXJpYWJsZSBzaXplICovCj4+ICsjZW5kaWYKPiAKPiBUbyBiZSBpbiBsaW5l
IHdpdGggdGhlIGludGVudGlvbnMsIHRoZSBDOTAgc3RhbmRhcmQsIGFuZCBpby9yaW5nLmgKPiBJ
J2Qgc3VnZ2VzdCB0byB1c2UgRkxFWCBpbnN0ZWFkIG9mIFZBUkxFTi4gRnVydGhlcm1vcmUsIGVz
cGVjaWFsbHkKPiBpbiBhIHB1YmxpYyBoZWFkZXIsIHR3byBkb3VibGUgbGVhZGluZyB1bmRlcnNj
b3JlcyBuZWVkIHRvIGdvIGF3YXkuCj4gCj4gQW5kIHRoZW4sIHdpdGggRkxFWCBpbiB0aGUgbmFt
ZSwgU0laRSBpc24ndCByZWFsbHkgYXBwcm9wcmlhdGUKPiBhbnltb3JlLiBUaGVyZWZvcmUgSSBz
ZWUgdGhyZWUgcG9zc2libGUgbmFtZXM6IFhFTl9GTEVYSUJMRV9BUlJBWSwKPiBYRU5fRkxFWF9B
UlJBWV9ESU1FTlNJT04gKHBvc3NpYmx5IGp1c3QgX0RJTSBhdCBpdHMgZW5kKSwgb3IKPiBYRU5f
RkxFWF9BUlJBWV9ERVNJR05BVE9SLgoKT2theSB0byB0aGUgIkZMRVgiIHBhcnQsIGJ1dCB0aGUg
IlhFTl8iIHByZWZpeCBpcyBub3Qgd29ya2luZyBkdWUgdG8KY29tcGF0IGhlYWRlciBnZW5lcmF0
aW9uICh0aGF0IHdpbGwgcmVzdWx0IGluIENPTVBBVF8gcHJlZml4IGluIHRoZQpjb21wYXQgaGVh
ZGVycykuCgpTbyBhbnkgb3RoZXIgaWRlYXMgZm9yIGEgc2Vuc2libGUgcHJlZml4PwoKCkp1ZXJn
ZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
