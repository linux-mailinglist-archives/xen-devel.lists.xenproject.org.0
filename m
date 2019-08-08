Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF2D85DFD
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 11:15:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hveU5-0003dT-O5; Thu, 08 Aug 2019 09:13:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=islG=WE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hveU4-0003dN-Ll
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 09:13:20 +0000
X-Inumbo-ID: c2d24227-b9bc-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id c2d24227-b9bc-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 09:13:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 628711570;
 Thu,  8 Aug 2019 02:13:18 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB55D3F706;
 Thu,  8 Aug 2019 02:13:16 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190807194143.1351-1-andrew.cooper3@citrix.com>
 <ad94d279-e53c-b1ae-c333-096944b217dd@suse.com>
 <2e3a40d8-14ec-9f84-6a43-d7389bdbebf8@citrix.com>
 <eba4a457-5be0-ee55-28b5-f25973c743fa@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <40816d88-b7e2-7d9f-2d7a-bede37a80e99@arm.com>
Date: Thu, 8 Aug 2019 10:13:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <eba4a457-5be0-ee55-28b5-f25973c743fa@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Terminology for "guest" - Was: [PATCH] docs/sphinx:
 Introduction
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMDgvMDgvMjAxOSAxMDowNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDgu
MDguMjAxOSAxMDo0MywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDgvMDgvMjAxOSAwNzoy
MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBPbiAwNy4wOC4yMDE5IDIxOjQxLCBBbmRyZXcgQ29v
cGVyIHdyb3RlOgo+Pj4+IC0tLSAvZGV2L251bGwKPj4+PiArKysgYi9kb2NzL2dsb3NzYXJ5LnJz
dAo+Pj4+IEBAIC0wLDAgKzEsMzcgQEAKPj4+PiArR2xvc3NhcnkKPj4+PiArPT09PT09PT0KPj4+
PiArCj4+Pj4gKy4uIFRlcm1zIHNob3VsZCBhcHBlYXIgaW4gYWxwaGFiZXRpY2FsIG9yZGVyCj4+
Pj4gKwo+Pj4+ICsuLiBnbG9zc2FyeTo6Cj4+Pj4gKwo+Pj4+ICvCoMKgIGNvbnRyb2wgZG9tYWlu
Cj4+Pj4gK8KgwqDCoMKgIEEgOnRlcm06YGRvbWFpbmAsIGNvbW1vbmx5IGRvbTAsIHdpdGggdGhl
IHBlcm1pc3Npb24gYW5kCj4+Pj4gcmVzcG9uc2liaWxpdHkKPj4+PiArwqDCoMKgwqAgdG8gY3Jl
YXRlIGFuZCBtYW5hZ2Ugb3RoZXIgZG9tYWlucyBvbiB0aGUgc3lzdGVtLgo+Pj4+ICsKPj4+PiAr
wqDCoCBkb21haW4KPj4+PiArwqDCoMKgwqAgQSBkb21haW4gaXMgWGVuJ3MgdW5pdCBvZiByZXNv
dXJjZSBvd25lcnNoaXAsIGFuZCBnZW5lcmFsbHkgaGFzCj4+Pj4gYXQgdGhlCj4+Pj4gK8KgwqDC
oMKgIG1pbmltdW0gc29tZSBSQU0gYW5kIHZpcnR1YWwgQ1BVcy4KPj4+PiArCj4+Pj4gK8KgwqDC
oMKgIFRoZSB0ZXJtcyA6dGVybTpgZG9tYWluYCBhbmQgOnRlcm06YGd1ZXN0YCBhcmUgY29tbW9u
bHkgdXNlZAo+Pj4+ICvCoMKgwqDCoCBpbnRlcmNoYW5nZWFibHksIGJ1dCB0aGV5IG1lYW4gc3Vi
dGx5IGRpZmZlcmVudCB0aGluZ3MuCj4+Pj4gKwo+Pj4+ICvCoMKgwqDCoCBBIGd1ZXN0IGlzIGEg
c2luZ2xlIHZpcnR1YWwgbWFjaGluZS4KPj4+PiArCj4+Pj4gK8KgwqDCoMKgIENvbnNpZGVyIHRo
ZSBjYXNlIG9mIGxpdmUgbWlncmF0aW9uIHdoZXJlLCBmb3IgYSBwZXJpb2Qgb2YKPj4+PiB0aW1l
LCBvbmUKPj4+PiArwqDCoMKgwqAgZ3Vlc3Qgd2lsbCBiZSBjb21wcmlzZWQgb2YgdHdvIGRvbWFp
bnMsIHdoaWxlIGl0IGlzIGluIHRyYW5zaXQuCj4+Pj4gKwo+Pj4+ICvCoMKgIGRvbWlkCj4+Pj4g
K8KgwqDCoMKgIFRoZSBudW1lcmljIGlkZW50aWZpZXIgb2YgYSBydW5uaW5nIDp0ZXJtOmBkb21h
aW5gLsKgIEl0IGlzCj4+Pj4gdW5pcXVlIHRvIGEKPj4+PiArwqDCoMKgwqAgc2luZ2xlIGluc3Rh
bmNlIG9mIFhlbiwgdXNlZCBhcyB0aGUgaWRlbnRpZmllciBpbiB2YXJpb3VzIEFQSXMsCj4+Pj4g
YW5kIGlzCj4+Pj4gK8KgwqDCoMKgIHR5cGljYWxseSBhbGxvY2F0ZWQgc2VxdWVudGlhbGx5IGZy
b20gMC4KPj4+PiArCj4+Pj4gK8KgwqAgZ3Vlc3QKPj4+PiArwqDCoMKgwqAgU2VlIDp0ZXJtOmBk
b21haW5gCj4+Pgo+Pj4gSSB0aGluayB5b3Ugd2FudCB0byBtZW50aW9uIHRoZSB1c3VhbCBkaXN0
aW5jdGlvbiBoZXJlOiBEb20wIGlzLAo+Pj4gd2hpbGUgYSBkb21haW4sIGNvbW1vbmx5IG5vdCBj
b25zaWRlcmVkIGEgZ3Vlc3QuCj4+Cj4+IFRvIGJlIGhvbmVzdCwgSSBoYWQgdG90YWxseSBmb3Jn
b3R0ZW4gYWJvdXQgdGhhdC7CoCBJIGd1ZXNzIG5vdyBpcyB0aGUKPj4gcHJvcGVyIHRpbWUgdG8g
cmVoYXNoIGl0IGluIHB1YmxpYy4KPj4KPj4gSSBkb24ndCB0aGluayB0aGUgd2F5IGl0IGN1cnJl
bnRseSBnZXRzIHVzZWQgaGFzIGEgY2xlYXIgb3IgY29oZXJlbnQgc2V0Cj4+IG9mIHJ1bGVzLCBi
ZWNhdXNlIEkgY2FuJ3QgdGhpbmsgb2YgYW55IHRvIGRlc2NyaWJlIGhvdyBpdCBkb2VzIGdldCB1
c2VkLgo+Pgo+PiBFaXRoZXIgdGhlcmUgYXJlIGEgY2xlYXIgYW5kIGNvaGVyZW50IChhbmQgc2lt
cGxlISkgc2V0IG9mIHJ1bGVzIGZvcgo+PiB3aGF0IHdlIG1lYW4gYnkgImd1ZXN0IiwgYXQgd2hp
Y2ggcG9pbnQgdGhleSBjYW4gbGl2ZSBoZXJlIGluIHRoZQo+PiBnbG9zc2FyeSwgb3IgdGhlIGZ1
enp5IHdheSBpdCBpcyBjdXJyZW50IHVzZWQgc2hvdWxkIGNlYXNlLgo+IAo+IFdoYXQncyBmdXp6
eSBhYm91dCBEb20wIG5vdCBiZWluZyBhIGd1ZXN0IChkdWUgdG8gYmVpbmcgYSBwYXJ0IG9mIHRo
ZQo+IGhvc3QgaW5zdGVhZCk/CkRvbTAgaXMgbm90IHBhcnQgb2YgdGhlIGhvc3QgaWYgeW91IGFy
ZSB1c2luZyBhbiBoYXJkd2FyZSBkb21haW4uIEkgYWN0dWFsbHkgCnRob3VnaHQgd2UgcmVuYW1l
ZCBldmVyeXRoaW5nIGluIFhlbiBmcm9tIERvbTAgdG8gaHdkb20gdG8gYXZvaWQgdGhlIGNvbmZ1
c2lvbi4KCkkgYWxzbyB3b3VsZCByYXRoZXIgYXZvaWQgdG8gdHJlYXQgImRvbTAiIGFzIG5vdCBh
IGd1ZXN0LiBJbiBub3JtYWwgc2V0dXAgdGhpcyAKaXMgYSBtb3JlIHByaXZpbGVnZSBndWVzdCwg
aW4gb3RoZXIgc2V0dXAgdGhpcyBtYXkganVzdCBiZSBhIG5vcm1hbCBndWVzdCAodGhpbmsgCmFi
b3V0IHBhcnRpdGlvbmluZykuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
