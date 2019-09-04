Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BD6A839F
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 15:20:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5V9g-0000Rd-Lp; Wed, 04 Sep 2019 13:17:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Tt/v=W7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5V9f-0000RU-0u
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 13:16:59 +0000
X-Inumbo-ID: 45568266-cf16-11e9-abb5-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 45568266-cf16-11e9-abb5-12813bfff9fa;
 Wed, 04 Sep 2019 13:16:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8CCD7AD8C;
 Wed,  4 Sep 2019 13:16:56 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20190902081118.31001-1-aisaila@bitdefender.com>
 <71f44ba3-b436-128e-8585-62c731feb7f3@suse.com>
 <4ba2503f-20b2-3670-ba16-8b03e69f3937@bitdefender.com>
 <813b92ae-0f4a-22ec-db30-6c43be246708@suse.com>
 <f7034f7b-95a2-474a-913b-99665f1ddc2d@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5d7ad447-49a7-de5d-8fef-4d548b4c484c@suse.com>
Date: Wed, 4 Sep 2019 15:17:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f7034f7b-95a2-474a-913b-99665f1ddc2d@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v1] x86/altp2m: Add hypercall to create a
 new view and set sve bits
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
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>,
 "jun.nakajima@intel.com" <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDkuMjAxOSAxNTowNCwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gCj4g
Cj4gT24gMDQuMDkuMjAxOSAxNToxNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA0LjA5LjIw
MTkgMTM6NTEsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOgo+Pj4KPj4+Cj4+PiBPbiAw
My4wOS4yMDE5IDE4OjUyLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAwMi4wOS4yMDE5IDEw
OjExLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToKPj4+Pj4gQEAgLTEzNTUsNiArMTM1
NSwyMyBAQCB2b2lkIHAybV9pbml0X2FsdHAybV9lcHQoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWdu
ZWQgaW50IGkpCj4+Pj4+ICAgICAgICBlcHQgPSAmcDJtLT5lcHQ7Cj4+Pj4+ICAgICAgICBlcHQt
Pm1mbiA9IHBhZ2V0YWJsZV9nZXRfcGZuKHAybV9nZXRfcGFnZXRhYmxlKHAybSkpOwo+Pj4+PiAg
ICAgICAgZC0+YXJjaC5hbHRwMm1fZXB0cFtpXSA9IGVwdC0+ZXB0cDsKPj4+Pj4gKwo+Pj4+PiAr
ICAgIGlmICggc2V0X3N2ZSApCj4+Pj4+ICsgICAgewo+Pj4+PiArICAgICAgICB1bnNpZ25lZCBs
b25nIGdmbiA9IDAsIG1heF9ncGZuID0gZG9tYWluX2dldF9tYXhpbXVtX2dwZm4oZCk7Cj4+Pj4+
ICsKPj4+Pj4gKyAgICAgICAgZm9yKCA7IGdmbiA8IG1heF9ncGZuOyArK2dmbiApCj4+Pj4+ICsg
ICAgICAgIHsKPj4+Pj4gKyAgICAgICAgICAgIG1mbl90IG1mbjsKPj4+Pj4gKyAgICAgICAgICAg
IHAybV9hY2Nlc3NfdCBhOwo+Pj4+PiArICAgICAgICAgICAgcDJtX3R5cGVfdCB0Owo+Pj4+PiAr
Cj4+Pj4+ICsgICAgICAgICAgICBhbHRwMm1fZ2V0X2VmZmVjdGl2ZV9lbnRyeShwMm0sIF9nZm4o
Z2ZuKSwgJm1mbiwgJnQsICZhLAo+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgQVAyTUdFVF9xdWVyeSk7Cj4+Pj4+ICsgICAgICAgICAgICBwMm0tPnNldF9lbnRy
eShwMm0sIF9nZm4oZ2ZuKSwgbWZuLCBQQUdFX09SREVSXzRLLCB0LCBhLCB0cnVlKTsKPj4+Pj4g
Kwo+Pj4+PiArICAgICAgICB9Cj4+Pj4+ICsgICAgfQo+Pj4+PiAgICB9Cj4+Pj4KPj4+PiBIb3cg
bG9uZyBpcyB0aGlzIGxvb3AgZ29pbmcgdG8gdGFrZSBmb3IgYSBodWdlIGd1ZXN0PyBJT1cgaG93
Cj4+Pj4gY29tZSB0aGVyZSdzIG5vIHByZWVtcHRpb24gaW4gaGVyZSwgb3Igc29tZSBvdGhlciBt
ZWNoYW5pc20KPj4+PiB0byBib3VuZCBleGVjdXRpb24gdGltZT8KPj4+Cj4+PiBCZWNhdXNlIHRo
aXMgaXMgZG9uZSBmb3IgdGhlIGluaXRpYWxpemF0aW9uIG9mIGEgbmV3IHZpZXcgYW5kIHRoZSBw
Mm0gaXMKPj4+IGxvY2tlZC4KPj4KPj4gV2VsbCwgdGhpcyBtYWtlcyBoYW5kbGluZyB0aGlzIHRo
ZSB3YXkgeW91IHdhbnQgaXQgY2xvc2UgdG8KPj4gaW1wb3NzaWJsZSwgYnV0IGlzIG5vdCBhbiBh
cmd1bWVudCBhZ2FpbnN0IHRoZSBuZWVkIGZvciBwcmVlbXB0aW9uCj4+IGhlcmUuIEp1c3QgbGlr
ZSBpdCBoYWQgdHVybmVkIG91dCB0byBiZSB1bnJlYXNvbmFibGUgdG8KPj4gcHJlZW1wdGl2ZWx5
IGhhbmRsZSBvdGhlciBQMk0gYWRqdXN0bWVudHMgKHdoaWNoIGlzIHdoeQo+PiBwMm0tZXB0LmM6
cmVzb2x2ZV9taXNjb25maWcoKSBhbmQgcDJtLXB0LmM6ZG9fcmVjYWxjKCkgZ290Cj4+IGludHJv
ZHVjZWQpLCBJJ20gYWZyYWlkIHlvdSdsbCBoYXZlIHRvIHVzZSBzb21lIG90aGVyIHRlY2huaXF1
ZQo+PiBoZXJlIChwb3NzaWJseSBidWlsZGluZyBvbiB0b3Agb2YgdGhlIG1lbnRpb25lZCBmdW5j
dGlvbnMpLgo+Pgo+IAo+IEkgdGhpbmsgdGhhdCB0aGUgbWVjaGFuaXNtIGZyb20gcDJtX3NldF9t
ZW1fYWNjZXNzX211bHRpKCkgY2FuIHN1aXQgdGhpcyAKPiBjYXNlLCBzdGFydCB0aGUgbG9vcCwg
c2V0ICxpZihoeXBlcmNhbGxfcHJlZW1wdF9jaGVjaygpKSByYyA9IAo+IG5leHRfdW5zZXRfZ2Zu
Owo+IAo+IEFuZCBmb3IgdGhpcyB0byB3b3JrIGl0IHNob3VsZCBoYXZlIGEgbmV3ICJzdGFydF9n
Zm4iIHBhcmFtZXRlciBzbyB0aGUgCj4gY2FsbGVyIGNhbiBpc3N1ZSBtdWx0aXBsZSBoeXBlcmNh
bGxzIHVudGlsIGdmbiA9PSBtYXhfZ2ZuLgoKSG1tLCBwb3NzaWJsZS4gSSB0b29rIHlvdXIgcHJl
dmlvdXMgcmVwbHkgdG8gbWVhbiB0aGF0IGl0IGlzCmltcG9ydGFudCBmb3IgdGhlIHAybSB0byBu
b3QgZ2V0IHVubG9ja2VkIGluIHRoZSBtaWRkbGUgb2YgdGhpcwpwcm9jZXNzLiBJZiB0aGlzIHdh
cyBhIHdyb25nIHVuZGVyc3RhbmRpbmcgb2YgbWluZSwgdGhlbiB5ZXMsCiJjb252ZW50aW9uYWwi
IHByZWVtcHRpb24gbGlrZSB5b3Ugb3V0bGluZSBpdCBvdWdodCB0byB3b3JrLgoKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
