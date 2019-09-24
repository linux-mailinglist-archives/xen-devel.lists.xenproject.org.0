Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C8ABC56E
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 12:10:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iChhi-0006r4-Sp; Tue, 24 Sep 2019 10:05:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kqGS=XT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iChhh-0006qz-3Q
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 10:05:53 +0000
X-Inumbo-ID: e3b1267c-deb2-11e9-9613-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id e3b1267c-deb2-11e9-9613-12813bfff9fa;
 Tue, 24 Sep 2019 10:05:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 52F8DAD8C;
 Tue, 24 Sep 2019 10:05:51 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-34-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <084a148f-ad84-9c43-339b-cdd0a7365cde@suse.com>
Date: Tue, 24 Sep 2019 12:05:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190914085251.18816-34-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 33/47] xen/sched: add a percpu resource
 index
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDkuMjAxOSAxMDo1MiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiAtLS0gYS94ZW4vY29t
bW9uL3NjaGVkdWxlLmMKPiArKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKPiBAQCAtNzEsNiAr
NzEsNyBAQCBzdGF0aWMgdm9pZCBwb2xsX3RpbWVyX2ZuKHZvaWQgKmRhdGEpOwo+ICAvKiBUaGlz
IGlzIGdsb2JhbCBmb3Igbm93IHNvIHRoYXQgcHJpdmF0ZSBpbXBsZW1lbnRhdGlvbnMgY2FuIHJl
YWNoIGl0ICovCj4gIERFRklORV9QRVJfQ1BVKHN0cnVjdCBzY2hlZHVsZXIgKiwgc2NoZWR1bGVy
KTsKPiAgREVGSU5FX1BFUl9DUFVfUkVBRF9NT1NUTFkoc3RydWN0IHNjaGVkX3Jlc291cmNlICos
IHNjaGVkX3Jlcyk7Cj4gK3N0YXRpYyBERUZJTkVfUEVSX0NQVV9SRUFEX01PU1RMWSh1bnNpZ25l
ZCBpbnQsIHNjaGVkX3Jlc19pZHgpOwoKSXQncyBvZiBjb3Vyc2Ugbm90IHZlcnkgaGVscGZ1bCB0
aGF0IHRoaXMgdmFyaWFibGUgKHJpZ2h0IGhlcmUpIGRvZXNuJ3QKZXZlciBnZXQgd3JpdHRlbiB0
bywgYW5kIGhlbmNlIG9uZSBjYW4ndCBqdWRnZSB3aGVyZSAvIGhvdyB0aGlzIGlzIHRvCmJlIGRv
bmUgKHdpdGhvdXQgZ29pbmcgbG9vayBlbHNld2hlcmUpLiBCdXQgSSBndWVzcyB0aGF0IGNhbGN1
bGF0aW9uCmNhbid0IGJlIG1vdmVkIGludG8gdGhpcyBwYXRjaCAoYWNjZXB0aW5nIHRoYXQgaXQg
d291bGQgYWx3YXlzIHlpZWxkCnplcm8gZm9yIG5vdyk/Cgo+IEBAIC0xMzUsNiArMTM2LDEyIEBA
IHN0YXRpYyBzdHJ1Y3Qgc2NoZWR1bGVyIHNjaGVkX2lkbGVfb3BzID0gewo+ICAgICAgLnN3aXRj
aF9zY2hlZCAgID0gc2NoZWRfaWRsZV9zd2l0Y2hfc2NoZWQsCj4gIH07Cj4gIAo+ICtzdGF0aWMg
aW5saW5lIHN0cnVjdCB2Y3B1ICpzY2hlZF91bml0MnZjcHVfY3B1KHN0cnVjdCBzY2hlZF91bml0
ICp1bml0LAoKY29uc3QgKG9uIHRoZSBwYXJhbWV0ZXIpPwoKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgY3B1KQo+ICt7Cj4gKyAg
ICByZXR1cm4gdW5pdC0+ZG9tYWluLT52Y3B1W3VuaXQtPnVuaXRfaWQgKyBwZXJfY3B1KHNjaGVk
X3Jlc19pZHgsIGNwdSldOwo+ICt9Cj4gKwo+ICBzdGF0aWMgaW5saW5lIHN0cnVjdCBzY2hlZHVs
ZXIgKmRvbV9zY2hlZHVsZXIoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCkKPiAgewo+ICAgICAgaWYg
KCBsaWtlbHkoZC0+Y3B1cG9vbCAhPSBOVUxMKSApCj4gQEAgLTIwMDgsNyArMjAxNSw3IEBAIHN0
YXRpYyB2b2lkIHNjaGVkX3NsYXZlKHZvaWQpCj4gIAo+ICAgICAgcGNwdV9zY2hlZHVsZV91bmxv
Y2tfaXJxKGxvY2ssIGNwdSk7Cj4gIAo+IC0gICAgc2NoZWRfY29udGV4dF9zd2l0Y2godnByZXYs
IG5leHQtPnZjcHVfbGlzdCwgbm93KTsKPiArICAgIHNjaGVkX2NvbnRleHRfc3dpdGNoKHZwcmV2
LCBzY2hlZF91bml0MnZjcHVfY3B1KG5leHQsIGNwdSksIG5vdyk7Cj4gIH0KCkJ5IHRoZSBlbmQg
b2YgdGhlIHNlcmllcyB0aGlzIHdpbGwgYmUKCiAgICBzY2hlZF9jb250ZXh0X3N3aXRjaCh2cHJl
diwgc2NoZWRfdW5pdDJ2Y3B1X2NwdShuZXh0LCBjcHUpLAogICAgICAgICAgICAgICAgICAgICAg
ICAgaXNfaWRsZV91bml0KG5leHQpICYmICFpc19pZGxlX3VuaXQocHJldiksIG5vdyk7CgpjbGFy
aWZ5aW5nIChJIHRoaW5rKSB0aGF0ICJuZXh0IiBjYW4gaW5kZWVkIGJlIGFuIGlkbGUgdW5pdC4g
SSdtIGhhdmluZwpkaWZmaWN1bHR5IHNlZWluZyBob3cgY2FuIHByb2R1Y2UgdGhlIGNvcnJlY3Qg
cmVzdWx0IGluIGFsbCB0aHJlZSBjYXNlcwotIGFsbCB2Q1BVLXMgaW4gdGhlIHVuaXQgYmVsb25n
IHRvIGEgcmVhbCBkb21haW4KLSBhbGwgdkNQVS1zIGluIHRoZSB1bml0IGJlbG9uZyB0byB0aGUg
aWRsZSBkb21haW4KLSB0aGVyZSdzIGEgbWl4IG9mICJyZWFsIiBhbmQgKGZpbGxlcikgImlkbGUi
IHZDUFUtcwpNeSBtYWluIHF1ZXN0aW9uIGlzIHdoYXQgIm5leHQiIGlzIGluIHRoZSBsYXN0IG9m
IHRoZSAzIGNhc2VzIGFib3ZlLgpDb25zaWRlcmluZyB0aGF0IHNjaGVkdWxpbmcgaGFwcGVucyBp
biB0ZXJtcyBvZiB1bml0cywgSSdkIGV4cGVjdCBpdCB0bwpiZSBhIHJlYWwgZG9tYWluJ3MgdW5p
dCwgeWV0IHRoZW4gSSBkb24ndCBzZWUgaG93IHlvdSdkIGdldCBhdCB0aGUKY29ycmVjdCAoaWRs
ZSkgdkNQVSB3aGVuIGNhbGxpbmcgc2NoZWRfdW5pdDJ2Y3B1X2NwdShuZXh0LCBjcHUpLgoKSmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
