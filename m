Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A39A7A85F5
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 17:09:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5WrT-0004kQ-G4; Wed, 04 Sep 2019 15:06:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Tt/v=W7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5WrR-0004kF-Eq
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 15:06:17 +0000
X-Inumbo-ID: 8a27c904-cf25-11e9-abb8-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a27c904-cf25-11e9-abb8-12813bfff9fa;
 Wed, 04 Sep 2019 15:06:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A28C9B622;
 Wed,  4 Sep 2019 15:06:14 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-14-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cdd95d65-ce9d-4b8c-77fc-2386cf0e65c1@suse.com>
Date: Wed, 4 Sep 2019 17:06:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809145833.1020-14-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 13/48] xen/sched: add is_running
 indicator to struct sched_unit
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Meng Xu <mengxu@cis.upenn.edu>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDguMjAxOSAxNjo1NywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiAtLS0gYS94ZW4vY29t
bW9uL3NjaGVkdWxlLmMKPiArKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPiBAQCAtNDA3LDYg
KzQwNyw4IEBAIGludCBzY2hlZF9pbml0X3ZjcHUoc3RydWN0IHZjcHUgKnYsIHVuc2lnbmVkIGlu
dCBwcm9jZXNzb3IpCj4gICAgICB7Cj4gICAgICAgICAgZ2V0X3NjaGVkX3Jlcyh2LT5wcm9jZXNz
b3IpLT5jdXJyID0gdW5pdDsKPiAgICAgICAgICB2LT5pc19ydW5uaW5nID0gMTsKPiArICAgICAg
ICB1bml0LT5pc19ydW5uaW5nID0gMTsKPiArICAgICAgICB1bml0LT5zdGF0ZV9lbnRyeV90aW1l
ID0gTk9XKCk7Cj4gICAgICB9Cj4gICAgICBlbHNlCj4gICAgICB7CgpBcmUgaWRsZSB2Q1BVLXMg
YWxzbyBnb2luZyB0byBnZXQgZ3JvdXBlZCBpbnRvIHVuaXRzIChJJ20gc29ycnksCkkgZG9uJ3Qg
cmVjYWxsKT8gSWYgc28sIGp1c3QgbGlrZSBmdXJ0aGVyIGRvd24gSSdkIGJlIHB1dHRpbmcKdW5k
ZXIgcXVlc3Rpb24gdGhlIG11bHRpcGxlIHdyaXRpbmcgb2YgdGhlIGZpZWxkLiBJJ2Qga2luZCBv
ZgpleHBlY3QgdGhlIHVuaXQgYW5kIGFsbCB2Q1BVLXMgd2l0aGluIGl0IHRvIGdldCBhbiBpZGVu
dGljYWwKc3RhdGUgZW50cnkgdGltZSBzdG9yZWQuCgpBbHNvIGJvdGggaGVyZSBhbmQgZnVydGhl
ciBkb3duIEknbSBwdXp6bGVkIHRvIHNlZSB0aGF0IHRoZQp1bml0J3MgZmllbGQgZG9lc24ndCBn
ZXQgc2V0IGF0IHRoZSBzYW1lIHBsYWNlIGluIGNvZGUgd2hlcmUKdGhlIHZDUFUncyBmaWVsZCBn
ZXRzIHNldC4KCj4gQEAgLTE2NjMsOCArMTY2NiwxMCBAQCBzdGF0aWMgdm9pZCBzY2hlZHVsZSh2
b2lkKQo+ICAgICAgICogc3dpdGNoLCBlbHNlIGxvc3RfcmVjb3JkcyByZXN1bWUgd2lsbCBub3Qg
d29yayBwcm9wZXJseS4KPiAgICAgICAqLwo+ICAKPiAtICAgIEFTU0VSVCghbmV4dC0+aXNfcnVu
bmluZyk7Cj4gKyAgICBBU1NFUlQoIW5leHQtPnNjaGVkX3VuaXQtPmlzX3J1bm5pbmcpOwo+ICAg
ICAgbmV4dC0+aXNfcnVubmluZyA9IDE7Cj4gKyAgICBuZXh0LT5zY2hlZF91bml0LT5pc19ydW5u
aW5nID0gMTsKPiArICAgIG5leHQtPnNjaGVkX3VuaXQtPnN0YXRlX2VudHJ5X3RpbWUgPSBub3c7
CgpJc24ndCB0aGUgQVNTRVJUKCkgeW91IGRlbGV0ZSBzdGlsbCBzdXBwb3NlZCB0byBiZSB0cnVl
PyBJbiB3aGljaCBjYXNlCndvdWxkbid0IGl0IGJlIHdvcnRod2hpbGUgdG8gcmV0YWluIGl0PwoK
PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9z
Y2hlZC5oCj4gQEAgLTI3Miw2ICsyNzIsMTEgQEAgc3RydWN0IHNjaGVkX3VuaXQgewo+ICAgICAg
c3RydWN0IHNjaGVkX3Jlc291cmNlICpyZXM7Cj4gICAgICBpbnQgICAgICAgICAgICAgICAgICAg
IHVuaXRfaWQ7Cj4gIAo+ICsgICAgLyogTGFzdCB0aW1lIHVuaXQgZ290IChkZS0pc2NoZWR1bGVk
LiAqLwo+ICsgICAgdWludDY0X3QgICAgICAgICAgICAgICBzdGF0ZV9lbnRyeV90aW1lOwo+ICsK
PiArICAgIC8qIEN1cnJlbnRseSBydW5uaW5nIG9uIGEgQ1BVPyAqLwo+ICsgICAgYm9vbCAgICAg
ICAgICAgICAgICAgICBpc19ydW5uaW5nOwo+ICAgICAgLyogRG9lcyBzb2Z0IGFmZmluaXR5IGFj
dHVhbGx5IHBsYXkgYSByb2xlIChnaXZlbiBoYXJkIGFmZmluaXR5KT8gKi8KPiAgICAgIGJvb2wg
ICAgICAgICAgICAgICAgICAgc29mdF9hZmZfZWZmZWN0aXZlOwo+ICAgICAgLyogQml0bWFzayBv
ZiBDUFVzIG9uIHdoaWNoIHRoaXMgVkNQVSBtYXkgcnVuLiAqLwoKSSdtIG5vdGljaW5nIHRoaXMg
aGVyZSwgYnV0IGl0IG1heSB3ZWxsIGhhdmUgYmVlbiBhbiBpc3N1ZSBlYXJsaWVyCmFscmVhZHkg
KGFuZCB0aGVyZSBtYXkgd2VsbCBiZSBsYXRlciBhZGp1c3RtZW50cyBpbnZhbGlkYXRpbmcgbXkK
cmVtYXJrLCBhbmQgb2YgY291cnNlIGl0J3MgdGhlIGVuZCByZXN1bHQgb2YgdGhpcyBzZXJpZXMg
d2hpY2gKbWF0dGVycyBpbiB0aGUgbG9uZyBydW4pOiBDb3VsZCB5b3Ugc2VlIGFib3V0IGFkZGlu
Zy9yZW1vdmluZwpmaWVsZHMgdG8gdGhpcyBzdHJ1Y3QgKGFuZCBnZW5lcmFsbHkgb2YgY291cnNl
IGFsc28gb3RoZXJzKQptaW5pbWl6aW5nIHRoZSBudW1iZXIgLyBvdmVyYWxsIHNpemUgb2YgaG9s
ZXM/CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
