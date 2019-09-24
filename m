Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A1FBD086
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 19:23:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCoVD-0003fx-Mc; Tue, 24 Sep 2019 17:21:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IFsf=XT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iCoVB-0003fp-JM
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 17:21:25 +0000
X-Inumbo-ID: bbf681a8-deef-11e9-9625-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id bbf681a8-deef-11e9-9625-12813bfff9fa;
 Tue, 24 Sep 2019 17:21:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0840A142F;
 Tue, 24 Sep 2019 10:21:24 -0700 (PDT)
Received: from [10.37.10.95] (unknown [10.37.10.95])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 51F643F694;
 Tue, 24 Sep 2019 10:21:22 -0700 (PDT)
To: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1569339027-19484-1-git-send-email-olekstysh@gmail.com>
 <1569339027-19484-8-git-send-email-olekstysh@gmail.com>
 <27781495-c097-f0a3-6c75-d8cb2aa6f523@arm.com>
 <a16bf417-5e85-46e8-0ec4-167323384c8b@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <f006d373-c759-938a-707a-33cfa0f0e338@arm.com>
Date: Tue, 24 Sep 2019 18:21:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a16bf417-5e85-46e8-0ec4-167323384c8b@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V5 7/8] iommu/arm: Introduce
 iommu_add_dt_device API
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org, volodymyr_babchuk@epam.com,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgT2xla3NhbmRyLAoKT24gOS8yNC8xOSA1OjIyIFBNLCBPbGVrc2FuZHIgd3JvdGU6Cj4gCj4g
T24gMjQuMDkuMTkgMTg6NTcsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGksCj4gCj4gSGkgSnVs
aWVuCj4gCj4gCj4+Cj4+IE9uIDkvMjQvMTkgNDozMCBQTSwgT2xla3NhbmRyIFR5c2hjaGVua28g
d3JvdGU6Cj4+PiBAQCAtMTI2MywxNSArMTI2NCwyMiBAQCBzdGF0aWMgaW50IF9faW5pdCBoYW5k
bGVfZGV2aWNlKHN0cnVjdCBkb21haW4gCj4+PiAqZCwgc3RydWN0IGR0X2RldmljZV9ub2RlICpk
ZXYsCj4+PiDCoMKgwqDCoMKgIGR0X2RwcmludGsoIiVzIHBhc3N0aHJvdWdoID0gJWQgbmlycSA9
ICVkIG5hZGRyID0gJXVcbiIsCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBk
dF9ub2RlX2Z1bGxfbmFtZShkZXYpLCBuZWVkX21hcHBpbmcsIG5pcnEsIG5hZGRyKTsKPj4+IMKg
IC3CoMKgwqAgaWYgKCBkdF9kZXZpY2VfaXNfcHJvdGVjdGVkKGRldikgJiYgbmVlZF9tYXBwaW5n
ICkKPj4+ICvCoMKgwqAgaWYgKCBuZWVkX21hcHBpbmcgKQo+Pj4gwqDCoMKgwqDCoCB7Cj4+PiAt
wqDCoMKgwqDCoMKgwqAgZHRfZHByaW50aygiJXMgc2V0dXAgaW9tbXVcbiIsIGR0X25vZGVfZnVs
bF9uYW1lKGRldikpOwo+Pj4gLcKgwqDCoMKgwqDCoMKgIHJlcyA9IGlvbW11X2Fzc2lnbl9kdF9k
ZXZpY2UoZCwgZGV2KTsKPj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAoIHJlcyApCj4+PiAtwqDCoMKg
wqDCoMKgwqAgewo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJpbnRrKFhFTkxPR19FUlIg
IkZhaWxlZCB0byBzZXR1cCB0aGUgSU9NTVUgZm9yICVzXG4iLAo+Pj4gK8KgwqDCoMKgwqDCoMKg
IGR0X2RwcmludGsoIkNoZWNrIGlmICVzIGlzIGJlaGluZCB0aGUgSU9NTVUgYW5kIGFkZCBpdFxu
IiwKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZHRfbm9kZV9m
dWxsX25hbWUoZGV2KSk7Cj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmVzOwo+
Pj4gKwo+Pj4gK8KgwqDCoMKgwqDCoMKgIGlvbW11X2FkZF9kdF9kZXZpY2UoZGV2KTsKPj4KPj4g
UmV0dXJuIHZhbHVlIHNob3VsZCBhbHdheXMgYmUgY2hlY2tlZCBvciBleHBsYWluIHdoeSB0aGlz
IGlzIG5vdCBkb25lLgo+IAo+IFllcywgSSB3aWxsIGFkZCBhIGNoZWNrLiBUaGUgcG9zaXRpdmUg
cmVzdWx0IGZvciB1cyBpcyBub24tbmVnYXRpdmUgCj4gKGVpdGhlciAiZGV2aWNlIGlzIHByb3Rl
Y3RlZCIgb3IgImRldmljZSBkb2Vzbid0IG5lZWQgdG8gYmUgcHJvdGVjdGVkIikuCj4gCj4gCj4+
Cj4+Cj4+IFsuLi5dCj4+Cj4+PiDCoCBpbnQgaW9tbXVfZG9fZHRfZG9tY3RsKHN0cnVjdCB4ZW5f
ZG9tY3RsICpkb21jdGwsIHN0cnVjdCBkb21haW4gKmQsCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh4ZW5f
ZG9tY3RsX3QpIHVfZG9tY3RsKQo+Pj4gwqAgewo+Pj4gQEAgLTE3Nyw2ICsyNDEsMTMgQEAgaW50
IGlvbW11X2RvX2R0X2RvbWN0bChzdHJ1Y3QgeGVuX2RvbWN0bCAKPj4+ICpkb21jdGwsIHN0cnVj
dCBkb21haW4gKmQsCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCB9Cj4+PiDCoCArwqDCoMKgwqDCoMKgwqAgaW9tbXVfYWRkX2R0X2Rl
dmljZShkZXYpOwo+Pgo+PiBTYW1lIGhlcmUuCj4gCj4gWWVzLCBJIHRoaW5rLCB3ZSBkb24ndCBu
ZWVkIHRvIGNoZWNrIGZvciByZXR1cm4gdmFsdWUsIGJlY2F1c2UgdGhlIG9ubHkgCj4gb25lIHBv
c2l0aXZlIHJlc3VsdCAiaGVyZSIgaXMgdGhlIGZhY3QgdGhhdCAiZGV2aWNlIGlzIHByb3RlY3Rl
ZCIgKHdoaWNoIAo+IGlzIGNoZWNrZWQgYmVsb3cpLgo+IAo+IFdoYXQgaXMgbW9yZSwgaWYgd2Ug
YWRkIGEgY2hlY2sgZm9yIHRoZSByZXR1cm4gdmFsdWUgdG8gYmUgc3RyaWN0bHkgMCwgCj4gd2Ug
d2lsbCBnZXQgYW4gZXJyb3IgYWZ0ZXIgZ3Vlc3QncyByZWJvb3QgKHNpbmNlIGlvbW11X2FkZF9k
dF9kZXZpY2UoKSAKPiB3aWxsIHJldHVybiAtRUVYSVNUKS4KPiAKPiBTbywgSSB3aWxsIGFkZCBh
IGNvbW1lbnQgZXhwbGFpbmluZyB3aHkgd2UgZG9uJ3QgY2hlY2suIFdoYXQgZG8geW91IHRoaW5r
PwoKV2h5IGRvbid0IHlvdSBkbyB0aGUgZm9sbG93aW5nIGNvZGU/CgppZiAoIHJldCA8IDAgJiYg
cmV0ICE9IC1FRVhJU1QgKQoKVGhpcyB3b3VsZCBhbGxvdyB0aGUgY29kZSB0byByZXR1cm4gdGhl
IGNvcnJyZWN0IGVycm9yIHRvIHRoZSB1cHBlciAKbGF5ZXIuIEEgc3VpdGFibGUgY29tbWVudCBv
biB0b3AgZXhwbGFpbmcgdGhlIGNoZWNrIHdvdWxkIGFsc28gYmUgdXNlZnVsLgoKQ2hlZXJzLAoK
LS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
