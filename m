Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D24817A3AC
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 12:07:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9oIr-0007Dc-5J; Thu, 05 Mar 2020 11:04:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eGB2=4W=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j9oIp-0007DT-BF
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 11:04:31 +0000
X-Inumbo-ID: 153854ed-5ed1-11ea-a561-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 153854ed-5ed1-11ea-a561-12813bfff9fa;
 Thu, 05 Mar 2020 11:04:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5EF60AFA0;
 Thu,  5 Mar 2020 11:04:29 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200305100331.16790-1-jgross@suse.com>
 <20200305104935.GU24458@Air-de-Roger.citrite.net>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <20915d12-665e-bd23-2685-d2ec7e015679@suse.com>
Date: Thu, 5 Mar 2020 12:04:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200305104935.GU24458@Air-de-Roger.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/blkfront: fix ring info addressing
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
Cc: Jens Axboe <axboe@kernel.dk>, Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDMuMjAgMTE6NDksIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gVGh1LCBNYXIg
MDUsIDIwMjAgYXQgMTE6MDM6MzFBTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gQ29t
bWl0IDAyNjVkNmU4ZGRiODkwICgieGVuL2Jsa2Zyb250OiBsaW1pdCBhbGxvY2F0ZWQgbWVtb3J5
IHNpemUgdG8KPj4gYWN0dWFsIHVzZSBjYXNlIikgbWFkZSBzdHJ1Y3QgYmxrZnJvbnRfcmluZ19p
bmZvIHNpemUgZHluYW1pYy4gVGhpcyBpcwo+PiBmaW5lIHdoZW4gcnVubmluZyB3aXRoIG9ubHkg
b25lIHF1ZXVlLCBidXQgd2l0aCBtdWx0aXBsZSBxdWV1ZXMgdGhlCj4+IGFkZHJlc3Npbmcgb2Yg
dGhlIHNpbmdsZSBxdWV1ZXMgaGFzIHRvIGJlIGFkYXB0ZWQgYXMgdGhlIHN0cnVjdHMgYXJlCj4+
IGFsbG9jYXRlZCBpbiBhbiBhcnJheS4KPiAKPiBUaGFua3MsIGFuZCBzb3JyeSBmb3Igbm90IGNh
dGNoaW5nIHRoaXMgZHVyaW5nIHJldmlldy4KPiAKPj4KPj4gRml4ZXM6IDAyNjVkNmU4ZGRiODkw
ICgieGVuL2Jsa2Zyb250OiBsaW1pdCBhbGxvY2F0ZWQgbWVtb3J5IHNpemUgdG8gYWN0dWFsIHVz
ZSBjYXNlIikKPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
Pgo+PiAtLS0KPj4gICBkcml2ZXJzL2Jsb2NrL3hlbi1ibGtmcm9udC5jIHwgODIgKysrKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwg
NDUgaW5zZXJ0aW9ucygrKSwgMzcgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2Jsb2NrL3hlbi1ibGtmcm9udC5jIGIvZHJpdmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYwo+
PiBpbmRleCBlMmFkNmJiYTIyODEuLmE4ZDRhMzgzOGU1ZCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVy
cy9ibG9jay94ZW4tYmxrZnJvbnQuYwo+PiArKysgYi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtmcm9u
dC5jCj4+IEBAIC0yMTMsNiArMjEzLDcgQEAgc3RydWN0IGJsa2Zyb250X2luZm8KPj4gICAJc3Ry
dWN0IGJsa19tcV90YWdfc2V0IHRhZ19zZXQ7Cj4+ICAgCXN0cnVjdCBibGtmcm9udF9yaW5nX2lu
Zm8gKnJpbmZvOwo+PiAgIAl1bnNpZ25lZCBpbnQgbnJfcmluZ3M7Cj4+ICsJdW5zaWduZWQgaW50
IHJpbmZvX3NpemU7Cj4+ICAgCS8qIFNhdmUgdW5jb21wbGV0ZSByZXFzIGFuZCBiaW9zIGZvciBt
aWdyYXRpb24uICovCj4+ICAgCXN0cnVjdCBsaXN0X2hlYWQgcmVxdWVzdHM7Cj4+ICAgCXN0cnVj
dCBiaW9fbGlzdCBiaW9fbGlzdDsKPj4gQEAgLTI1OSw2ICsyNjAsMjEgQEAgc3RhdGljIGludCBi
bGtmcm9udF9zZXR1cF9pbmRpcmVjdChzdHJ1Y3QgYmxrZnJvbnRfcmluZ19pbmZvICpyaW5mbyk7
Cj4+ICAgc3RhdGljIHZvaWQgYmxrZnJvbnRfZ2F0aGVyX2JhY2tlbmRfZmVhdHVyZXMoc3RydWN0
IGJsa2Zyb250X2luZm8gKmluZm8pOwo+PiAgIHN0YXRpYyBpbnQgbmVnb3RpYXRlX21xKHN0cnVj
dCBibGtmcm9udF9pbmZvICppbmZvKTsKPj4gICAKPj4gKyNkZWZpbmUgcmluZm9fcHRyKHJpbmZv
LCBvZmYpIFwKPj4gKwkoc3RydWN0IGJsa2Zyb250X3JpbmdfaW5mbyAqKSgodW5zaWduZWQgbG9u
ZykocmluZm8pICsgKG9mZikpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXiB2b2lkICogd291bGQgc2VlbSBtb3JlIG5hdHVyYWwgSU1PLgo+IAo+IEFsc28gaWYgeW91
IHVzZSB2b2lkICogeW91IGRvbid0IG5lZWQgdGhlIGV4dHJhIChzdHJ1Y3QKPiBibGtmcm9udF9y
aW5nX2luZm8gKikgY2FzdCBJIHRoaW5rPwoKWWVzLCBjYW4gY2hhbmdlIHRoYXQuCgo+IEkgaG93
ZXZlciB0aGluayB0aGlzIG1hY3JvIGlzIGtpbmQgb2Ygd2VpcmQsIHNpbmNlIGl0J3MganVzdCBk
b2luZyBhbgo+IGFkZGl0aW9uLiBJIHdvdWxkIHJhdGhlciBoYXZlIHRoYXQgY2FsY3VsYXRpb24g
aW4gZ2V0X3JpbmZvIGFuZCBjb2RlCj4gZm9yX2VhY2hfcmluZm8gb24gdG9wIG9mIHRoYXQuCgpJ
IHdhbnRlZCB0byBhdm9pZCB0aGUgbXVsdGlwbGljYXRpb24gaW4gdGhlIHJhdGhlciBjb21tb24K
Zm9yX2VhY2hfcmluZm8oKSB1c2FnZS4KCj4gCj4gSSBhZ3JlZSB0aGlzIG1pZ2h0IGJlIGEgcXVl
c3Rpb24gb2YgdGFzdGUsIHNvIEknbSBub3QgZ29pbmcgdG8gaW5zaXN0Cj4gYnV0IHRoYXQgd291
bGQgcmVkdWNlIHRoZSBudW1iZXIgb2YgaGVscGVycyBmcm9tIDMgdG8gMi4KPiAKPj4gKwo+PiAr
I2RlZmluZSBmb3JfZWFjaF9yaW5mbyhpbmZvLCByaW5mbywgaWR4KQkJCQlcCj4+ICsJZm9yIChy
aW5mbyA9IGluZm8tPnJpbmZvLCBpZHggPSAwOwkJCQlcCj4+ICsJICAgICBpZHggPCBpbmZvLT5u
cl9yaW5nczsJCQkJCVwKPj4gKwkgICAgIGlkeCsrLCByaW5mbyA9IHJpbmZvX3B0cihyaW5mbywg
aW5mby0+cmluZm9fc2l6ZSkpCj4gCj4gSSB0aGluayB0aGUgYWJvdmUgaXMgbWlzc2luZyBwcm9w
ZXIgcGFyZW50aGVzZXMgYXJvdW5kIG1hY3JvCj4gcGFyYW1ldGVycy4KCnJpbmZvIGFuZCBpZHgg
YXJlIHNpbXBsZSB2YXJpYWJsZXMsIHNvIEkgZG9uJ3QgdGhpbmsgdGhleSBuZWVkCnBhcmVudGhl
c2VzLiBpbmZvIG1heWJlLiBCdXQganVzdCBzZWVpbmcgaXQgbm93OiBuYW1pbmcgdGhlCnBhcmFt
ZXRlciAicmluZm8iIGFuZCB0cnlpbmcgdG8gYWNjZXNzIGluZm8tPnJpbmZvIGlzbid0IGEgZ29v
ZAppZGVhLiBJdCBpcyB3b3JraW5nIG9ubHkgYXMgSSBhbHdheXMgdXNlICJyaW5mbyIgYXMgdGhl
IHBvaW50ZXIuCgo+IAo+PiArCj4+ICtzdGF0aWMgc3RydWN0IGJsa2Zyb250X3JpbmdfaW5mbyAq
Z2V0X3JpbmZvKHN0cnVjdCBibGtmcm9udF9pbmZvICppbmZvLAo+PiArCQkJCQkgICAgdW5zaWdu
ZWQgaW50IGkpCj4gCj4gaW5saW5lIGF0dHJpYnV0ZSBtaWdodCBiZSBhcHByb3ByaWF0ZSBoZXJl
LgoKU2VlICJ0aGUgaW5saW5lIGRpc2Vhc2UiIGluIHRoZSBrZXJuZWwncyBjb2Rpbmcgc3R5bGUu
CgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
