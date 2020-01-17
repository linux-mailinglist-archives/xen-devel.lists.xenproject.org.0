Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CC3140C9C
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 15:35:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isSgT-00029R-Se; Fri, 17 Jan 2020 14:33:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=n+o/=3G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1isSgS-00029M-Pk
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 14:33:12 +0000
X-Inumbo-ID: 44cc9e90-3936-11ea-9fd7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 44cc9e90-3936-11ea-9fd7-bc764e2007e4;
 Fri, 17 Jan 2020 14:33:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BA82AAC91;
 Fri, 17 Jan 2020 14:33:02 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20200117133059.14602-1-aisaila@bitdefender.com>
 <20200117133059.14602-2-aisaila@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9e95d83a-22d7-0f72-b30c-ee48e6d53d6e@suse.com>
Date: Fri, 17 Jan 2020 15:33:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200117133059.14602-2-aisaila@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V8 2/4] x86/altp2m: Add hypercall to set a
 range of sve bits
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Razvan COJOCARU <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDEuMjAyMCAxNDozMSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gQnkg
ZGVmYXVsdCB0aGUgc3ZlIGJpdHMgYXJlIG5vdCBzZXQuCj4gVGhpcyBwYXRjaCBhZGRzIGEgbmV3
IGh5cGVyY2FsbCwgeGNfYWx0cDJtX3NldF9zdXByZXNzX3ZlX211bHRpKCksCj4gdG8gc2V0IGEg
cmFuZ2Ugb2Ygc3ZlIGJpdHMuCj4gVGhlIGNvcmUgZnVuY3Rpb24sIHAybV9zZXRfc3VwcHJlc3Nf
dmVfbXVsdGkoKSwgZG9lcyBub3QgYnJlYWsgaW4gY2FzZQo+IG9mIGEgZXJyb3IgYW5kIGl0IGlz
IGRvaW5nIGEgYmVzdCBlZmZvcnQgZm9yIHNldHRpbmcgdGhlIGJpdHMgaW4gdGhlCj4gZ2l2ZW4g
cmFuZ2UuIEEgY2hlY2sgZm9yIGNvbnRpbnVhdGlvbiBpcyBtYWRlIGluIG9yZGVyIHRvIGhhdmUK
PiBwcmVlbXB0aW9uIG9uIGxhcmdlIHJhbmdlcy4KPiBUaGUgZ2ZuIG9mIHRoZSBmaXJzdCBlcnJv
ciBpcyBzdG9yZWQgaW4KPiB4ZW5faHZtX2FsdHAybV9zdXBwcmVzc192ZV9tdWx0aS5maXJzdF9l
cnJvcl9nZm4gYW5kIHRoZSBlcnJvciBjb2RlIGlzCj4gc3RvcmVkIGluIHhlbl9odm1fYWx0cDJt
X3N1cHByZXNzX3ZlX211bHRpLmZpcnN0X2Vycm9yLgo+IElmIG5vIGVycm9yIG9jY3VycmVkIHRo
ZSB2YWx1ZXMgd2lsbCBiZSAwLgoKSSdtIHNvcnJ5IGZvciBiZWluZyBuaXRwaWNreSBoZXJlLCBi
dXQgdGhpcyBzdGlsbCBpc24ndCBmdWxseSBpbgpsaW5lIHdpdGggLi4uCgo+IC0tLSBhL3hlbi9p
bmNsdWRlL3B1YmxpYy9odm0vaHZtX29wLmgKPiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvaHZt
L2h2bV9vcC5oCj4gQEAgLTQ2LDYgKzQ2LDE2IEBAIHN0cnVjdCB4ZW5faHZtX2FsdHAybV9zdXBw
cmVzc192ZSB7Cj4gICAgICB1aW50NjRfdCBnZm47Cj4gIH07Cj4gIAo+ICtzdHJ1Y3QgeGVuX2h2
bV9hbHRwMm1fc3VwcHJlc3NfdmVfbXVsdGkgewo+ICsgICAgdWludDE2X3QgdmlldzsKPiArICAg
IHVpbnQ4X3Qgc3VwcHJlc3NfdmU7IC8qIEJvb2xlYW4gdHlwZS4gKi8KPiArICAgIHVpbnQ4X3Qg
cGFkMTsKPiArICAgIGludDMyX3QgZmlyc3RfZXJyb3I7IC8qIFNob3VsZCBiZSBzZXQgdG8gMC4g
Ki8KPiArICAgIHVpbnQ2NF90IGZpcnN0X2dmbjsgLyogVmFsdWUgbWF5IGJlIHVwZGF0ZWQuICov
Cj4gKyAgICB1aW50NjRfdCBsYXN0X2dmbjsKPiArICAgIHVpbnQ2NF90IGZpcnN0X2Vycm9yX2dm
bjsgLyogR2ZuIG9mIHRoZSBmaXJzdCBlcnJvci4gKi8KPiArfTsKCi4uLiB0aGlzOiBUaGVyZSdz
IG5vdGhpbmcgc2FpZCBoZXJlIGFib3V0IHplcm9pbmcgZmlyc3RfZXJyb3JfZ2ZuCihhbmQgRkFP
RCB0aGVyZSBkb2Vzbid0IG5lZWQgdG8gYmUpLCBhbmQgZXZlbiBmaXJzdF9lcnJvciBjb3JyZWN0
bHkKc2F5cyBvbmx5ICJzaG91bGQiLiBIZW5jZSB0aGUgdmFsdWVzIHdpbGwgYmUgbm9uLXplcm8g
d2hlbiB0aGVyZQp3YXMgbm8gZXJyb3Igb25seSBpZiB0aGUgY2FsbGVyIGhhZCBzZXQgdGhlbSB0
byB6ZXJvLiBBbnl3YXksIHRoaXMKYWxvbmUgc3VyZWx5IGlzIG5vIHJlYXNvbiBmb3IgYSB2OSwg
c28gdGFrZSBpdCBqdXN0IGFzIGEgYmVuaWduCihmb3IgdGhlIG1vbWVudCkgcmVtYXJrLgoKSmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
