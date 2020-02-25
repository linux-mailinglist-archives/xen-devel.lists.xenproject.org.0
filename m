Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8191216C0C3
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 13:27:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6ZGn-00023c-7Q; Tue, 25 Feb 2020 12:25:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=g8Eh=4N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j6ZGl-00023T-QQ
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 12:24:59 +0000
X-Inumbo-ID: d62a417e-57c9-11ea-92e8-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d62a417e-57c9-11ea-92e8-12813bfff9fa;
 Tue, 25 Feb 2020 12:24:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 66862ABD7;
 Tue, 25 Feb 2020 12:24:55 +0000 (UTC)
To: Wei Xu <xuwei5@hisilicon.com>
References: <5E4F3EF4.4050701@hisilicon.com>
 <3a4f47ed-215f-f518-e819-a4b6503968c0@suse.com>
 <d21dd32d-8a5b-bb91-f83b-ed7aa72d2758@xen.org>
 <63a33275-3aca-3bb1-3028-c890e1474d07@suse.com>
 <5E5321A4.4080408@hisilicon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c329bb96-5e1b-c826-efc2-1ca8e144fbed@suse.com>
Date: Tue, 25 Feb 2020 13:25:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <5E5321A4.4080408@hisilicon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4] ns16550: Add ACPI support for ARM only
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Linuxarm <linuxarm@huawei.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDIuMjAyMCAwMjowNiwgV2VpIFh1IHdyb3RlOgo+IE9uIDIwMjAvMi8yMSAyMzowNywg
SmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDIxLjAyLjIwMjAgMTU6NTcsIEp1bGllbiBHcmFsbCB3
cm90ZToKPj4+IE9uIDIxLzAyLzIwMjAgMTQ6MDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9u
IDIxLjAyLjIwMjAgMDM6MjIsIFdlaSBYdSB3cm90ZToKPj4+Pj4gLS0tIGEveGVuL2RyaXZlcnMv
Y2hhci9uczE2NTUwLmMKPj4+Pj4gKysrIGIveGVuL2RyaXZlcnMvY2hhci9uczE2NTUwLmMKPj4+
Pj4gQEAgLTE2MjAsNiArMTYyMCw4NSBAQCBEVF9ERVZJQ0VfU1RBUlQobnMxNjU1MCwgIk5TMTY1
NTAgVUFSVCIsIERFVklDRV9TRVJJQUwpCj4+Pj4+ICAgRFRfREVWSUNFX0VORAo+Pj4+Pgo+Pj4+
PiAgICNlbmRpZiAvKiBIQVNfREVWSUNFX1RSRUUgKi8KPj4+Pj4gKwo+Pj4+PiArI2lmIGRlZmlu
ZWQoQ09ORklHX0FDUEkpICYmIGRlZmluZWQoQ09ORklHX0FSTSkKPj4+Pj4gKyNpbmNsdWRlIDx4
ZW4vYWNwaS5oPgo+Pj4+PiArCj4+Pj4+ICtzdGF0aWMgaW50IF9faW5pdCBuczE2NTUwX2FjcGlf
dWFydF9pbml0KGNvbnN0IHZvaWQgKmRhdGEpCj4+Pj4+ICt7Cj4+Pj4+ICsgICAgc3RydWN0IGFj
cGlfdGFibGVfaGVhZGVyICp0YWJsZTsKPj4+Pj4gKyAgICBzdHJ1Y3QgYWNwaV90YWJsZV9zcGNy
ICpzcGNyOwo+Pj4+PiArICAgIGFjcGlfc3RhdHVzIHN0YXR1czsKPj4+Pj4gKyAgICAvKgo+Pj4+
PiArICAgICAqIFNhbWUgYXMgdGhlIERUIHBhcnQuCj4+Pj4+ICsgICAgICogT25seSBzdXBwb3J0
IG9uZSBVQVJUIG9uIEFSTSB3aGljaCBoYXBwZW4gdG8gYmUgbnMxNjU1MF9jb21bMF0uCj4+Pj4+
ICsgICAgICovCj4+Pj4+ICsgICAgc3RydWN0IG5zMTY1NTAgKnVhcnQgPSAmbnMxNjU1MF9jb21b
MF07Cj4+Pj4+ICsKPj4+Pj4gKyAgICBzdGF0dXMgPSBhY3BpX2dldF90YWJsZShBQ1BJX1NJR19T
UENSLCAwLCAmdGFibGUpOwo+Pj4+PiArICAgIGlmICggQUNQSV9GQUlMVVJFKHN0YXR1cykgKQo+
Pj4+PiArICAgIHsKPj4+Pj4gKyAgICAgICAgcHJpbnRrKCJuczE2NTUwOiBGYWlsZWQgdG8gZ2V0
IFNQQ1IgdGFibGVcbiIpOwo+Pj4+PiArICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4+Pj4gKyAg
ICB9Cj4+Pj4+ICsKPj4+Pj4gKyAgICBzcGNyID0gY29udGFpbmVyX29mKHRhYmxlLCBzdHJ1Y3Qg
YWNwaV90YWJsZV9zcGNyLCBoZWFkZXIpOwo+Pj4+PiArCj4+Pj4+ICsgICAgLyoKPj4+Pj4gKyAg
ICAgKiBUaGUgc2VyaWFsIHBvcnQgYWRkcmVzcyBtYXkgYmUgMCBmb3IgZXhhbXBsZQo+Pj4+PiAr
ICAgICAqIGlmIHRoZSBjb25zb2xlIHJlZGlyZWN0aW9uIGlzIGRpc2FibGVkLgo+Pj4+PiArICAg
ICAqLwo+Pj4+PiArICAgIGlmICggdW5saWtlbHkoIXNwY3ItPnNlcmlhbF9wb3J0LmFkZHJlc3Mp
ICkKPj4+Pj4gKyAgICB7Cj4+Pj4+ICsgICAgICAgIHByaW50aygibnMxNjU1MDogQ29uc29sZSBy
ZWRpcmVjdGlvbiBpcyBkaXNhYmxlZFxuIik7Cj4+Pj4+ICsgICAgICAgIHJldHVybiAtRUlOVkFM
Owo+Pj4+PiArICAgIH0KPj4+Pj4gKwo+Pj4+PiArICAgIGlmICggdW5saWtlbHkoc3Bjci0+c2Vy
aWFsX3BvcnQuc3BhY2VfaWQgIT0gQUNQSV9BRFJfU1BBQ0VfU1lTVEVNX01FTU9SWSkgKQo+Pj4+
PiArICAgIHsKPj4+Pj4gKyAgICAgICAgcHJpbnRrKCJuczE2NTUwOiBBZGRyZXNzIHNwYWNlIHR5
cGUgaXMgbm90IG1taW9cbiIpOwo+Pj4+PiArICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4+Pj4g
KyAgICB9Cj4+Pj4KPj4+PiBUaGUgc3BhY2VfaWQgZmllbGQgcXVhbGlmaWVzIHRoZSBhZGRyZXNz
IG9uZSwgaS5lLiB3aGV0aGVyIGEgdmFsdWUgb2YKPj4+PiB6ZXJvIGNhbiBzZW5zaWJseSBtZWFu
ICJkaXNhYmxlZCIgZGVwZW5kcyBvbiB0aGUgYWRkcmVzcyBzcGFjZS4gSGVuY2UKPj4+PiBsb2dp
Y2FsbHkgdGhlIGFkZHJlc3Mgc3BhY2UgY2hlY2sgc2hvdWxkIGNvbWUgZmlyc3QuCj4+Pj4KPj4+
PiBUaGlzIGlzIHRoZSBsYXN0IHRoaW5nIEknZCBsaWtlIHRvIHNlZSBjaGFuZ2VkLiBJIHdvbid0
IGdpdmUgdGhlCj4+Pj4gcGF0Y2ggbXkgYWNrIHRob3VnaCwgYXMgSSB0aGluayBpdCBzaG91bGQg
YmUgYW4gQXJtIG1haW50YWluZXIgdG8gYWNrCj4+Pj4gaXQuCj4+Pgo+Pj4gQWNrZWQtYnk6IEp1
bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+Cj4+Pgo+Pj4gQWx0aG91Z2gsIGEgcmV2aWV3ZWQt
YnkgdGFnIGZyb20geW91IHdvdWxkIGJlIG5pY2UgYXMgeW91IGRpZCBtb3N0IG9mIAo+Pj4gdGhl
IHJldmlldyBmb3IgdGhpcyBwYXRjaC4KPj4KPj4gV2VsbCwgdG8gY2xhcmlmeSAtIHRoaXMgaXMg
b25lIG9mIHRoZSB2ZXJ5IGZldyAoYWZhaWN0KSBjYXNlcyB3aGVyZSBvdXIKPj4gUi1iIGltcGx5
aW5nIEEtYiAod2hlbiBwZW9wbGUgYXJlIGVudGl0bGVkIHRvIGFjayB0aGUgcmVzcGVjdGl2ZSBj
b2RlKQo+PiBnZXRzIGluIHRoZSB3YXkuIElmIHRoaXMgd2Fzbid0IHRoZSBjYXNlLCBJJ2QgaGF2
ZSBnaXZlbiB0aGUgZm9ybWVyLAo+PiBtYWtpbmcgaXQgY2xlYXIgKGFsc28gbGF0ZXIgZnJvbSBq
dXN0IGxvb2tpbmcgYXQgdGhlIHJlc3VsdGluZyBjb21taXQpCj4+IHRoYXQgdGhlIChvbmx5KSBh
Y2sgY2FtZSBmcm9tIGFuIEFybSBwZXJzb24uCj4gCj4gSSB3aWxsIGNoZWNrIHRoZSBhZGRyZXNz
IHNwYWNlIGluIHRoZSB2NSBhbmQgYWRkIHlvdXIgUi1iLgoKSSBndWVzcyBzb21lIG1pc3VuZGVy
c3RhbmRpbmcgaGFzIG9jY3VycmVkPyBZb3UncmUgYWxyZWFkeSBjaGVja2luZyB0aGUKYWRkcmVz
cyBzcGFjZSBpbiB2NCAoYW5kIEkgZGlkIGFscmVhZHkgY29tbWl0IGl0IHRoaXMgd2F5IG9uIEZy
aWRheSkuCkFuZCBhcyBpbmRpY2F0ZWQgSSBpbnRlbnRpb25hbGx5IGVsZWN0ZWQgdG8gbm90IHBy
b3ZpZGUgbXkgUi1iIGZvciB0aGlzCnBhdGNoLCBmb3IgdGhlIHJlYXNvbiBnaXZlbiBhYm92ZS4K
CkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
