Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A982168138
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 16:11:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j59tm-0006cS-QI; Fri, 21 Feb 2020 15:07:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=P1D7=4J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j59tl-0006cN-6e
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 15:07:25 +0000
X-Inumbo-ID: dd4e727f-54bb-11ea-8695-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd4e727f-54bb-11ea-8695-12813bfff9fa;
 Fri, 21 Feb 2020 15:07:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 793B9AFA8;
 Fri, 21 Feb 2020 15:07:19 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <5E4F3EF4.4050701@hisilicon.com>
 <3a4f47ed-215f-f518-e819-a4b6503968c0@suse.com>
 <d21dd32d-8a5b-bb91-f83b-ed7aa72d2758@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <63a33275-3aca-3bb1-3028-c890e1474d07@suse.com>
Date: Fri, 21 Feb 2020 16:07:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <d21dd32d-8a5b-bb91-f83b-ed7aa72d2758@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Linuxarm <linuxarm@huawei.com>,
 Wei Xu <xuwei5@hisilicon.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDIuMjAyMCAxNTo1NywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDIxLzAyLzIwMjAg
MTQ6MDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAyMS4wMi4yMDIwIDAzOjIyLCBXZWkgWHUg
d3JvdGU6Cj4+PiAtLS0gYS94ZW4vZHJpdmVycy9jaGFyL25zMTY1NTAuYwo+Pj4gKysrIGIveGVu
L2RyaXZlcnMvY2hhci9uczE2NTUwLmMKPj4+IEBAIC0xNjIwLDYgKzE2MjAsODUgQEAgRFRfREVW
SUNFX1NUQVJUKG5zMTY1NTAsICJOUzE2NTUwIFVBUlQiLCBERVZJQ0VfU0VSSUFMKQo+Pj4gICBE
VF9ERVZJQ0VfRU5ECj4+Pgo+Pj4gICAjZW5kaWYgLyogSEFTX0RFVklDRV9UUkVFICovCj4+PiAr
Cj4+PiArI2lmIGRlZmluZWQoQ09ORklHX0FDUEkpICYmIGRlZmluZWQoQ09ORklHX0FSTSkKPj4+
ICsjaW5jbHVkZSA8eGVuL2FjcGkuaD4KPj4+ICsKPj4+ICtzdGF0aWMgaW50IF9faW5pdCBuczE2
NTUwX2FjcGlfdWFydF9pbml0KGNvbnN0IHZvaWQgKmRhdGEpCj4+PiArewo+Pj4gKyAgICBzdHJ1
Y3QgYWNwaV90YWJsZV9oZWFkZXIgKnRhYmxlOwo+Pj4gKyAgICBzdHJ1Y3QgYWNwaV90YWJsZV9z
cGNyICpzcGNyOwo+Pj4gKyAgICBhY3BpX3N0YXR1cyBzdGF0dXM7Cj4+PiArICAgIC8qCj4+PiAr
ICAgICAqIFNhbWUgYXMgdGhlIERUIHBhcnQuCj4+PiArICAgICAqIE9ubHkgc3VwcG9ydCBvbmUg
VUFSVCBvbiBBUk0gd2hpY2ggaGFwcGVuIHRvIGJlIG5zMTY1NTBfY29tWzBdLgo+Pj4gKyAgICAg
Ki8KPj4+ICsgICAgc3RydWN0IG5zMTY1NTAgKnVhcnQgPSAmbnMxNjU1MF9jb21bMF07Cj4+PiAr
Cj4+PiArICAgIHN0YXR1cyA9IGFjcGlfZ2V0X3RhYmxlKEFDUElfU0lHX1NQQ1IsIDAsICZ0YWJs
ZSk7Cj4+PiArICAgIGlmICggQUNQSV9GQUlMVVJFKHN0YXR1cykgKQo+Pj4gKyAgICB7Cj4+PiAr
ICAgICAgICBwcmludGsoIm5zMTY1NTA6IEZhaWxlZCB0byBnZXQgU1BDUiB0YWJsZVxuIik7Cj4+
PiArICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4+ICsgICAgfQo+Pj4gKwo+Pj4gKyAgICBzcGNy
ID0gY29udGFpbmVyX29mKHRhYmxlLCBzdHJ1Y3QgYWNwaV90YWJsZV9zcGNyLCBoZWFkZXIpOwo+
Pj4gKwo+Pj4gKyAgICAvKgo+Pj4gKyAgICAgKiBUaGUgc2VyaWFsIHBvcnQgYWRkcmVzcyBtYXkg
YmUgMCBmb3IgZXhhbXBsZQo+Pj4gKyAgICAgKiBpZiB0aGUgY29uc29sZSByZWRpcmVjdGlvbiBp
cyBkaXNhYmxlZC4KPj4+ICsgICAgICovCj4+PiArICAgIGlmICggdW5saWtlbHkoIXNwY3ItPnNl
cmlhbF9wb3J0LmFkZHJlc3MpICkKPj4+ICsgICAgewo+Pj4gKyAgICAgICAgcHJpbnRrKCJuczE2
NTUwOiBDb25zb2xlIHJlZGlyZWN0aW9uIGlzIGRpc2FibGVkXG4iKTsKPj4+ICsgICAgICAgIHJl
dHVybiAtRUlOVkFMOwo+Pj4gKyAgICB9Cj4+PiArCj4+PiArICAgIGlmICggdW5saWtlbHkoc3Bj
ci0+c2VyaWFsX3BvcnQuc3BhY2VfaWQgIT0gQUNQSV9BRFJfU1BBQ0VfU1lTVEVNX01FTU9SWSkg
KQo+Pj4gKyAgICB7Cj4+PiArICAgICAgICBwcmludGsoIm5zMTY1NTA6IEFkZHJlc3Mgc3BhY2Ug
dHlwZSBpcyBub3QgbW1pb1xuIik7Cj4+PiArICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4+ICsg
ICAgfQo+Pgo+PiBUaGUgc3BhY2VfaWQgZmllbGQgcXVhbGlmaWVzIHRoZSBhZGRyZXNzIG9uZSwg
aS5lLiB3aGV0aGVyIGEgdmFsdWUgb2YKPj4gemVybyBjYW4gc2Vuc2libHkgbWVhbiAiZGlzYWJs
ZWQiIGRlcGVuZHMgb24gdGhlIGFkZHJlc3Mgc3BhY2UuIEhlbmNlCj4+IGxvZ2ljYWxseSB0aGUg
YWRkcmVzcyBzcGFjZSBjaGVjayBzaG91bGQgY29tZSBmaXJzdC4KPj4KPj4gVGhpcyBpcyB0aGUg
bGFzdCB0aGluZyBJJ2QgbGlrZSB0byBzZWUgY2hhbmdlZC4gSSB3b24ndCBnaXZlIHRoZQo+PiBw
YXRjaCBteSBhY2sgdGhvdWdoLCBhcyBJIHRoaW5rIGl0IHNob3VsZCBiZSBhbiBBcm0gbWFpbnRh
aW5lciB0byBhY2sKPj4gaXQuCj4gCj4gQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhl
bi5vcmc+Cj4gCj4gQWx0aG91Z2gsIGEgcmV2aWV3ZWQtYnkgdGFnIGZyb20geW91IHdvdWxkIGJl
IG5pY2UgYXMgeW91IGRpZCBtb3N0IG9mIAo+IHRoZSByZXZpZXcgZm9yIHRoaXMgcGF0Y2guCgpX
ZWxsLCB0byBjbGFyaWZ5IC0gdGhpcyBpcyBvbmUgb2YgdGhlIHZlcnkgZmV3IChhZmFpY3QpIGNh
c2VzIHdoZXJlIG91cgpSLWIgaW1wbHlpbmcgQS1iICh3aGVuIHBlb3BsZSBhcmUgZW50aXRsZWQg
dG8gYWNrIHRoZSByZXNwZWN0aXZlIGNvZGUpCmdldHMgaW4gdGhlIHdheS4gSWYgdGhpcyB3YXNu
J3QgdGhlIGNhc2UsIEknZCBoYXZlIGdpdmVuIHRoZSBmb3JtZXIsCm1ha2luZyBpdCBjbGVhciAo
YWxzbyBsYXRlciBmcm9tIGp1c3QgbG9va2luZyBhdCB0aGUgcmVzdWx0aW5nIGNvbW1pdCkKdGhh
dCB0aGUgKG9ubHkpIGFjayBjYW1lIGZyb20gYW4gQXJtIHBlcnNvbi4KCkphbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
