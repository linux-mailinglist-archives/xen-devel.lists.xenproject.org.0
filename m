Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22154A695E
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 15:09:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i58VR-0000yr-8d; Tue, 03 Sep 2019 13:05:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CRa/=W6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i58VP-0000yc-Iw
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 13:05:55 +0000
X-Inumbo-ID: 8f6f28c4-ce4b-11e9-ab94-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8f6f28c4-ce4b-11e9-ab94-12813bfff9fa;
 Tue, 03 Sep 2019 13:05:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2933BAF38;
 Tue,  3 Sep 2019 13:05:53 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <347e51f2-e80c-992c-6d0b-3b2bfdb75cce@suse.com>
 <1fc41c75-7e6d-5a34-c500-8f769e4374bb@suse.com>
 <c0e34ad1-746b-6520-2d6a-f069e3107755@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3e5a4cfc-0d44-221a-d732-d1995c9f916a@suse.com>
Date: Tue, 3 Sep 2019 15:05:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c0e34ad1-746b-6520-2d6a-f069e3107755@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 7/8] x86emul: support RDPRU
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDkuMjAxOSAxNDozNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwMy8wOS8yMDE5
IDEwOjQxLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gV2hpbGUgdGhlIFBNIGRvZXNuJ3Qgc2F5IHNv
LCB0aGlzIGFzc3VtZXMgdGhhdCB0aGUgTVBFUkYgdmFsdWUgcmVhZCB0aGlzCj4+IHdheSBnZXRz
IHNjYWxlZCBzaW1pbGFybHkgdG8gaXRzIHJlYWRpbmcgdGhyb3VnaCBSRE1TUi4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IFRoaXMgd2Fu
dHMgdGhlIGZvbGxvd2luZyBodW5rcyBtZXJnZWQsIHRvIGF0IGxlYXN0IGtlZXAgdGhlCj4gaW50
ZXJjZXB0L2V4aXQgY29kZXMgdXAgdG8gZGF0ZS4gIFRoaXMgaXMgZnJvbSBteSBhbHRlcm5hdGl2
ZSBzZXJpZXMKPiB3aGljaCBpbnRlcmNlcHRlZCBhbmQgdGVybWluYXRlZCBSRFBSVSB3aXRoICNV
RC4KPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vc3ZtL3ZtY2IuaAo+
IGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vc3ZtL3ZtY2IuaAo+IGluZGV4IDVjNzEwMjg2Zjcu
LjJiZjBkNTBmNmQgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vc3ZtL3Zt
Y2IuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3N2bS92bWNiLmgKPiBAQCAtNzYs
NyArNzYsOCBAQCBlbnVtIEdlbmVyaWNJbnRlcmNlcHQyYml0cwo+ICAgICAgR0VORVJBTDJfSU5U
RVJDRVBUX01PTklUT1IgPSAxIDw8IDEwLAo+ICAgICAgR0VORVJBTDJfSU5URVJDRVBUX01XQUlU
ICAgPSAxIDw8IDExLAo+ICAgICAgR0VORVJBTDJfSU5URVJDRVBUX01XQUlUX0NPTkRJVElPTkFM
ID0gMSA8PCAxMiwKPiAtICAgIEdFTkVSQUwyX0lOVEVSQ0VQVF9YU0VUQlYgID0gMSA8PCAxMwo+
ICsgICAgR0VORVJBTDJfSU5URVJDRVBUX1hTRVRCViAgPSAxIDw8IDEzLAo+ICsgICAgR0VORVJB
TDJfSU5URVJDRVBUX1JEUFJVICAgPSAxIDw8IDE0LAo+ICB9Owo+IAo+IAo+IEBAIC0zMDAsNiAr
MzAxLDcgQEAgZW51bSBWTUVYSVRfRVhJVENPREUKPiAgICAgIFZNRVhJVF9NV0FJVCAgICAgICAg
ICAgID0gMTM5LCAvKiAweDhiICovCj4gICAgICBWTUVYSVRfTVdBSVRfQ09ORElUSU9OQUw9IDE0
MCwgLyogMHg4YyAqLwo+ICAgICAgVk1FWElUX1hTRVRCViAgICAgICAgICAgPSAxNDEsIC8qIDB4
OGQgKi8KPiArICAgIFZNRVhJVF9SRFBSVSAgICAgICAgICAgID0gMTQyLCAvKiAweDhlICovCj4g
ICAgICBWTUVYSVRfTlBGICAgICAgICAgICAgICA9IDEwMjQsIC8qIDB4NDAwLCBuZXN0ZWQgcGFn
aW5nIGZhdWx0ICovCj4gICAgICBWTUVYSVRfSU5WQUxJRCAgICAgICAgICA9ICAtMQo+ICB9OwoK
SSB3b3VsZG4ndCB0aGluayB0aGlzIGJlbG9uZ3MgaGVyZSwgYnV0IHNpbmNlIHlvdSBhc2sgZm9y
IGl0LCBJCmNhbiBmb2xkIGl0IGluLgoKPj4gLS0tIGEveGVuL2FyY2gveDg2L2NwdWlkLmMKPj4g
KysrIGIveGVuL2FyY2gveDg2L2NwdWlkLmMKPj4gQEAgLTU0NSw2ICs1NDUsMTEgQEAgdm9pZCBy
ZWNhbGN1bGF0ZV9jcHVpZF9wb2xpY3koc3RydWN0IGRvbQo+PiAgCj4+ICAgICAgcC0+ZXh0ZC5t
YXhsaW5hZGRyID0gcC0+ZXh0ZC5sbSA/IDQ4IDogMzI7Cj4+ICAKPj4gKyAgICBpZiAoIHAtPmV4
dGQucmRwcnUgKQo+PiArICAgICAgICBwLT5leHRkLnJkcHJ1X21heCA9IG1pbihwLT5leHRkLnJk
cHJ1X21heCwgbWF4LT5leHRkLnJkcHJ1X21heCk7Cj4+ICsgICAgZWxzZQo+PiArICAgICAgICBw
LT5leHRkLnJkcHJ1X21heCA9IDA7Cj4+ICsKPj4gICAgICByZWNhbGN1bGF0ZV94c3RhdGUocCk7
Cj4+ICAgICAgcmVjYWxjdWxhdGVfbWlzYyhwKTsKPiAKPiBUaGUgQ1BVSUQgbG9naWMgbmVlZHMg
cXVpdGUgYSBiaXQgbW9yZSB0aGFuIHRoaXMsIGFuZCB0byBiZSBzYWZlIG9uCj4gbWlncmF0ZS4g
IEZvciBvbmUsIHJlY2FsY3VsYXRlX3hzdGF0ZSgpIHVuaWxhdGVyYWxseSBjbG9iYmVycyB0aGlz
IHRvIDAuCgpPaCwgcmVjYWxjdWxhdGVfbWlzYygpIC0geWVzLCBJIHNlZSB0aGlzIG5vdy4gQW5k
IEkgaGF2ZSB0byBhZG1pdApJIGRvbid0IHNlZSB0aGUgbWlncmF0aW9uLXVuc2FmZXR5LCBzbyAu
Li4KCj4gU2hhbGwgSSBkbyBhIHByZXAgcGF0Y2ggZ2V0dGluZyB0aGUgQ1BVSUQgc2lkZSBvZiB0
aGluZ3MgaW4gb3JkZXI/CgouLi4geWVzLCBJJ2QgYXBwcmVjaWF0ZSB5b3UgZG9pbmcgc28uCgo+
PiAtLS0gYS94ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuYwo+PiArKysgYi94
ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuYwo+PiBAQCAtNTY3MCw2ICs1Njcx
LDUyIEBAIHg4Nl9lbXVsYXRlKAo+PiAgICAgICAgICAgICAgICAgIGxpbWl0IC09IHNpemVvZih6
ZXJvKTsKPj4gICAgICAgICAgICAgIH0KPj4gICAgICAgICAgICAgIGJyZWFrOwo+PiArCj4+ICsg
ICAgICAgIGNhc2UgMHhmZDogLyogcmRwcnUgKi8KPj4gKyAgICAgICAgICAgIHZjcHVfbXVzdF9o
YXZlKHJkcHJ1KTsKPj4gKwo+PiArICAgICAgICAgICAgaWYgKCAhbW9kZV9yaW5nMCgpICkKPj4g
KyAgICAgICAgICAgIHsKPj4gKyAgICAgICAgICAgICAgICBmYWlsX2lmKCFvcHMtPnJlYWRfY3Ip
Owo+PiArICAgICAgICAgICAgICAgIGlmICggKHJjID0gb3BzLT5yZWFkX2NyKDQsICZjcjQsIGN0
eHQpKSAhPSBYODZFTVVMX09LQVkgKQo+PiArICAgICAgICAgICAgICAgICAgICBnb3RvIGRvbmU7
Cj4+ICsgICAgICAgICAgICAgICAgZ2VuZXJhdGVfZXhjZXB0aW9uX2lmKGNyNCAmIFg4Nl9DUjRf
VFNELCBFWENfVUQpOwo+PiArICAgICAgICAgICAgfQo+PiArCj4+ICsgICAgICAgICAgICBzd2l0
Y2ggKCBfcmVncy5lY3ggKQo+PiArICAgICAgICAgICAgewo+PiArICAgICAgICAgICAgY2FzZSAw
OiAgbiA9IE1TUl9JQTMyX01QRVJGOyBicmVhazsKPj4gKyAgICAgICAgICAgIGNhc2UgMTogIG4g
PSBNU1JfSUEzMl9BUEVSRjsgYnJlYWs7Cj4+ICsgICAgICAgICAgICBkZWZhdWx0OiBuID0gMDsg
YnJlYWs7Cj4+ICsgICAgICAgICAgICB9Cj4+ICsgICAgICAgICAgICBpZiAoIF9yZWdzLmVjeCA+
IGN0eHQtPmNwdWlkLT5leHRkLnJkcHJ1X21heCApCj4+ICsgICAgICAgICAgICAgICAgbiA9IDA7
Cj4gCj4gVGhpcyBjYW4gYmUgZm9sZGVkIGludG8gdGhlIHN3aXRjaCBzdGF0ZW1lbnQuICBTb21l
dGhpbmcgbGlrZSAoCj4gX3JlZ3MuZWN4IHwgLShfcmVncy5lY3ggPiBjdHh0LT5jcHVpZC0+ZXh0
ZC5yZHBydV9tYXgpICkKCldpbGwgZG8uCgo+IEFsc28sIHRoZSBzZW50aW5lbCBtaWdodCBiZXR0
ZXIgYmUgLTEsIHdoaWNoIGlzIG5vdCBpbiBhIGRlZmluZWQgTVNSCj4gYmxvY2suICBNU1IgMCBp
cyBhIFA1LWNvbXBhdCBNQ0UgTVNSLCBldmVuIG9uIEFNRCBoYXJkd2FyZS4KCkkgZGlkIGNvbnNp
ZGVyIHRoaXMsIGJ1dCBkZWNpZGVkIHRoZXJlJ3MgYSB2YW5pc2hpbmdseSBzbWFsbCByaXNrCmZv
ciB0aGVtIHRvIGV4cG9zZSB0aGlzIE1TUiAoYW5kIGlmIHRoZXkgZGlkIHdlIGNvdWxkIHN0aWxs
IGNoYW5nZQp0aGUgY29kZSBhbG9uZyB0aGUgbGluZXMgb2Ygd2hhdCB5b3Ugc2F5KS4gQSBzZW50
aW5lbCBvZiB6ZXJvIGlzCnNsaWdodGx5IGNoZWFwZXIgdG8gaGF2ZSwgYWZ0ZXIgYWxsLgoKSmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
