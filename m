Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F9AA6D5E
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 17:55:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5B6v-00084M-5d; Tue, 03 Sep 2019 15:52:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CRa/=W6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5B6t-00084H-SM
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 15:52:47 +0000
X-Inumbo-ID: def9bfe6-ce62-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id def9bfe6-ce62-11e9-b299-bc764e2007e4;
 Tue, 03 Sep 2019 15:52:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DED43AFBE;
 Tue,  3 Sep 2019 15:52:44 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20190902081118.31001-1-aisaila@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <71f44ba3-b436-128e-8585-62c731feb7f3@suse.com>
Date: Tue, 3 Sep 2019 17:52:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190902081118.31001-1-aisaila@bitdefender.com>
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

T24gMDIuMDkuMjAxOSAxMDoxMSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gQEAg
LTEzNTUsNiArMTM1NSwyMyBAQCB2b2lkIHAybV9pbml0X2FsdHAybV9lcHQoc3RydWN0IGRvbWFp
biAqZCwgdW5zaWduZWQgaW50IGkpCj4gICAgICBlcHQgPSAmcDJtLT5lcHQ7Cj4gICAgICBlcHQt
Pm1mbiA9IHBhZ2V0YWJsZV9nZXRfcGZuKHAybV9nZXRfcGFnZXRhYmxlKHAybSkpOwo+ICAgICAg
ZC0+YXJjaC5hbHRwMm1fZXB0cFtpXSA9IGVwdC0+ZXB0cDsKPiArCj4gKyAgICBpZiAoIHNldF9z
dmUgKQo+ICsgICAgewo+ICsgICAgICAgIHVuc2lnbmVkIGxvbmcgZ2ZuID0gMCwgbWF4X2dwZm4g
PSBkb21haW5fZ2V0X21heGltdW1fZ3BmbihkKTsKPiArCj4gKyAgICAgICAgZm9yKCA7IGdmbiA8
IG1heF9ncGZuOyArK2dmbiApCj4gKyAgICAgICAgewo+ICsgICAgICAgICAgICBtZm5fdCBtZm47
Cj4gKyAgICAgICAgICAgIHAybV9hY2Nlc3NfdCBhOwo+ICsgICAgICAgICAgICBwMm1fdHlwZV90
IHQ7Cj4gKwo+ICsgICAgICAgICAgICBhbHRwMm1fZ2V0X2VmZmVjdGl2ZV9lbnRyeShwMm0sIF9n
Zm4oZ2ZuKSwgJm1mbiwgJnQsICZhLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBBUDJNR0VUX3F1ZXJ5KTsKPiArICAgICAgICAgICAgcDJtLT5zZXRfZW50cnkocDJt
LCBfZ2ZuKGdmbiksIG1mbiwgUEFHRV9PUkRFUl80SywgdCwgYSwgdHJ1ZSk7Cj4gKwo+ICsgICAg
ICAgIH0KPiArICAgIH0KPiAgfQoKSG93IGxvbmcgaXMgdGhpcyBsb29wIGdvaW5nIHRvIHRha2Ug
Zm9yIGEgaHVnZSBndWVzdD8gSU9XIGhvdwpjb21lIHRoZXJlJ3Mgbm8gcHJlZW1wdGlvbiBpbiBo
ZXJlLCBvciBzb21lIG90aGVyIG1lY2hhbmlzbQp0byBib3VuZCBleGVjdXRpb24gdGltZT8KCj4g
LS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2h2bS9odm1fb3AuaAo+ICsrKyBiL3hlbi9pbmNsdWRl
L3B1YmxpYy9odm0vaHZtX29wLmgKPiBAQCAtMjQ0LDYgKzI0NCw3IEBAIHN0cnVjdCB4ZW5faHZt
X2FsdHAybV92aWV3IHsKPiAgICAgIC8qIENyZWF0ZSB2aWV3IG9ubHk6IGRlZmF1bHQgYWNjZXNz
IHR5cGUKPiAgICAgICAqIE5PVEU6IGN1cnJlbnRseSBpZ25vcmVkICovCj4gICAgICB1aW50MTZf
dCBodm1tZW1fZGVmYXVsdF9hY2Nlc3M7IC8qIHhlbm1lbV9hY2Nlc3NfdCAqLwo+ICsgICAgdWlu
dDhfdCBzZXRfc3ZlOyAvKiBib29sIHZhbHVlICovCj4gIH07CgpUaGlzIGludGVyZmFjZSBpcywg
Z2l2ZW4gdGhlIHJpZ2h0IGNvbmZpZ3VyYXRpb24sIGF2YWlsYWJsZSB0bwpndWVzdHMuIEhlbmNl
IHlvdSBjYW4ndCBzaW1wbHkgYWRkIGEgZmllbGQgaGVyZS4gSnVzdCBjb25zaWRlcgp3aGF0IGhh
cHBlbnMgZm9yIGFuIGV4aXN0aW5nIGNhbGxlciB3aGVuIHRoZXJlIGlzIHJhbmRvbSBkYXRhCmlu
IHRoZSBmaWVsZCB5b3Ugbm93IGFzc2lnbiBhIG1lYW5pbmcuCgpGdXJ0aGVybW9yZSwgYWNjb3Jk
aW5nIHRvIGNvbW1vbiBwcmFjdGljZSBlbHNld2hlcmUsIHRoZSBuZXcKdHJhaWxpbmcgcGFkZGlu
ZyBmaWVsZCBzaG91bGQgYmUgbWFkZSBleHBsaWNpdCwgYW5kIGNoZWNrZWQgdG8KaG9sZCB6ZXJv
IG9uIGlucHV0LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
