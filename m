Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0599D8537B
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 21:18:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvRPC-0002Pb-Vy; Wed, 07 Aug 2019 19:15:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WZHT=WD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hvRPB-0002PW-6j
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 19:15:25 +0000
X-Inumbo-ID: b434c65f-b947-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id b434c65f-b947-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 19:15:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB92728;
 Wed,  7 Aug 2019 12:15:22 -0700 (PDT)
Received: from [10.37.9.94] (unknown [10.37.9.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E96F73F575;
 Wed,  7 Aug 2019 12:15:20 -0700 (PDT)
To: Oleksandr <olekstysh@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
 <1564763985-20312-7-git-send-email-olekstysh@gmail.com>
 <OSBPR01MB453664F7A6D6AA717761BC07D8D40@OSBPR01MB4536.jpnprd01.prod.outlook.com>
 <a49eccf6-935c-c87a-1fcc-fdc12a67d58e@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <42cc28a7-5ab3-e24f-16d3-7a287f7f14e8@arm.com>
Date: Wed, 7 Aug 2019 20:15:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a49eccf6-935c-c87a-1fcc-fdc12a67d58e@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2 6/6] iommu/arm: Add Renesas IPMMU-VMSA
 support
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
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Lars Kurth <lars.kurth@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KCsgTGFycykKCkhpLAoKT24gOC83LzE5IDU6MDEgUE0sIE9sZWtzYW5kciB3cm90ZToKPj4+ICsg
KiB5b3UgY2FuIGZvdW5kIGF0Ogo+Pj4gKyAqwqDCoMKgIHVybDogCj4+PiBnaXQ6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvaG9ybXMvcmVuZXNhcy1ic3AuZ2l0Cj4+
PiArICrCoMKgwqAgYnJhbmNoOiB2NC4xNC43NS1sdHNpL3JjYXItMy45LjYKPj4+ICsgKsKgwqDC
oCBjb21taXQ6IGUyMDZlYjViODFhNjBlNjRjMzVmYmMzYTk5OWIxYTBkYjJiOTgwNDQKPj4+ICsg
KiBhbmQgWGVuJ3MgU01NVSBkcml2ZXI6Cj4+PiArICrCoMKgwqAgeGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvYXJtL3NtbXUuYwo+Pj4gKyAqCj4+PiArICogQ29weXJpZ2h0IChDKSAyMDE2LTIwMTkg
RVBBTSBTeXN0ZW1zIEluYy4KPj4+ICsgKgo+Pj4gKyAqIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNv
ZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKPj4+ICsgKiBtb2RpZnkgaXQg
dW5kZXIgdGhlIHRlcm1zIGFuZCBjb25kaXRpb25zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMK
Pj4+ICsgKiBMaWNlbnNlLCB2ZXJzaW9uIDIsIGFzIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0
d2FyZSBGb3VuZGF0aW9uLgo+Pj4gKyAqCj4+PiArICogVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1
dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCj4+PiArICogYnV0IFdJVEhP
VVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKPj4+
ICsgKiBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0Uu
wqAgU2VlIHRoZSBHTlUKPj4+ICsgKiBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRl
dGFpbHMuCj4+PiArICoKPj4+ICsgKiBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9m
IHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMKPj4+ICsgKiBMaWNlbnNlIGFsb25nIHdpdGggdGhpcyBw
cm9ncmFtOyBJZiBub3QsIHNlZSAKPj4+IDxodHRwOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4K
Pj4gSSBkb24ndCBrbm93IHRoYXQgWGVuIGxpY2Vuc2UgZGVzY3JpcHRpb24gcnVsZSwgYnV0IHNp
bmNlIGEgZmV3IHNvdXJjZSAKPj4gZmlsZXMgaGF2ZQo+PiBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
ciwgY2FuIHdlIGFsc28gdXNlIGl0IG9uIHRoZSBkcml2ZXI/Cj4gCj4gSSBhbSBhZnJhaWQsIEkg
ZG9uJ3Qga25vdyBhIGNvcnJlY3QgYW5zd2VyIGZvciB0aGlzIHF1ZXN0aW9uLiBJIHdvdWxkIAo+
IGxlYXZlIHRoaXMgdG8gbWFpbnRhaW5lcnMuCj4gCj4gSSBqdXN0IGZvbGxvd2VkIHNhbXBsZSBj
b3B5cmlnaHQgbm90aWNlIGZvciBHUEwgdjIgTGljZW5zZSBhY2NvcmRpbmcgdG8gCj4gdGhlIGRv
Y3VtZW50Ogo+IAo+IGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1i
bG9iO2Y9Q09OVFJJQlVUSU5HCgpUaGUgZmlsZSBDT05UUklCVVRJTkcgaXMgb25seSBnaXZpbmcg
ZXhhbXBsZSBvZiBjb21tb24gZXhhbXBsZSBvZiAKbGljZW5zZS4gU28gSSB0aGluayB0aGlzIGlz
IGZpbmUgdG8gdXNlIFNQRFgsIHRoZSBtb3JlIHRoZXkgYXJlIGFscmVhZHkgCnVzZWQuIFRoZSBv
bmx5IHJlcXVlc3QgaXMgdG8gcHV0IGVpdGhlciBTRFBYIG9yIHRoZSBmdWxsLWJsb3duIHRleHQg
YnV0IApub3QgdGhlIHR3byA6KS4gTGFycywgYW55IG9iamVjdGlvbj8KCkkgYW0gcXVpdGUgaW4g
ZmF2b3Igb2YgU1BEWCBiZWNhdXNlIGl0IGlzIGVhc2llciB0byBmaW5kIG91dCB0aGUgCmxpY2Vu
c2UuIFdpdGggdGhlIGZ1bGwtYmxvd24gdGV4dCwgdGhlIHRleHQgbWF5IHNsaWdodGx5IHZhcnkg
YmV0d2VlbiAKbGljZW5zZXMuIEZvciBpbnN0YW5jZSwgdGhlIG9ubHkgZGlmZmVyZW5jZSBiZXR3
ZWVuIEdQTHYyIGFuZCBHUEx2MisgaXMgCiIsb3IgKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIg
dmVyc2lvbiIuIEkgbGV0IHlvdSBpbWFnaW5lIGhvdyBpdCBjYW4gCmJlIGVhc3kgdG8gbWlzcyBp
dCB3aGVuIHJldmlld2luZyA7KS4KCldlIGhhZCBhIGRpc2N1c3Npb24gbGFzdCB5ZWFyIGFib3V0
IHVzaW5nIFNQRFggaW4gWGVuIGNvZGUgYmFzZSBidXQgSSAKbmV2ZXIgZ290IHRoZSB0aW1lIHRv
IGZvcm1hbGx5IHN1Z2dlc3QgaXQuCgo+IAo+Pj4gKyAqLwo+Pj4gKwo+Pj4gKyNpbmNsdWRlIDx4
ZW4vZGVsYXkuaD4KPj4+ICsjaW5jbHVkZSA8eGVuL2Vyci5oPgo+Pj4gKyNpbmNsdWRlIDx4ZW4v
aXJxLmg+Cj4+PiArI2luY2x1ZGUgPHhlbi9saWIuaD4KPj4+ICsjaW5jbHVkZSA8eGVuL2xpc3Qu
aD4KPj4gSSBkb24ndCBrbm93IHRoYXQgWGVuIHBhc3N0aHJvdWdoIGRyaXZlciBydWxlIHRob3Vn
aCwgZG9lc24ndCBoZXJlIG5lZWQKPj4gI2luY2x1ZGUgPHhlbi9pb21tdS5oPj8gKFRoZSB4ZW4v
c2NoZWQuaCBzZWVtcyB0byBoYXZlIGl0IHNvIHRoYXQKPj4gbm8gY29tcGlsZSBlcnJvciBoYXBw
ZW5zIHRob3VnaC4pCj4gCj4gUHJvYmFibHksIHllcywgSSBzaG91bGQgaGF2ZSBpbmNsdWRlZCB0
aGF0IGhlYWRlci4KCkkgYW0gZmluZSBlaXRoZXIgd2F5IDopLiBUaGUgaW5kaXJlY3QgaW5jbHVz
aW9uIGhhcHBlbnMgcXVpdGUgb2Z0ZW4gYW5kIAp3ZSBvbmx5IG5vdGljZSBpdCB3aGVuIHNvbWVv
bmUgZGVjaWRlIHRvIHJld29yayB0aGUgaGVhZGVycy4KClsuLi5dCj4+ICsvKiBYZW4gSU9NTVUg
b3BzICovCj4+PiArc3RhdGljIGludCBfX211c3RfY2hlY2sgaXBtbXVfaW90bGJfZmx1c2hfYWxs
KHN0cnVjdCBkb21haW4gKmQpCj4+PiArewo+Pj4gK8KgwqDCoCBzdHJ1Y3QgaXBtbXVfdm1zYV94
ZW5fZG9tYWluICp4ZW5fZG9tYWluID0gZG9tX2lvbW11KGQpLT5hcmNoLnByaXY7Cj4+PiArCj4+
PiArwqDCoMKgIGlmICggIXhlbl9kb21haW4gfHwgIXhlbl9kb21haW4tPnJvb3RfZG9tYWluICkK
Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4+ICsKPj4+ICvCoMKgwqAgc3Bpbl9sb2Nr
KCZ4ZW5fZG9tYWluLT5sb2NrKTsKPj4gSXMgbG9jYWwgaXJxIGlzIGFscmVhZHkgZGlzYWJsZWQg
aGVyZT8KPj4gSWYgbm8sIHlvdSBzaG91bGQgdXNlIHNwaW5fbG9ja19pcnFzYXZlKCkgYmVjYXVz
ZSB0aGUgaXBtbXVfaXJxKCkgYWxzbwo+PiBnZXRzIHRoZSBsb2NrLgo+IAo+IAo+IE5vLCBpdCBp
cyBub3QgZGlzYWJsZWQuIEJ1dCwgaXBtbXVfaXJxKCkgdXNlcyBhbm90aGVyIG1tdS0+bG9jay4g
U28sIEkgCj4gdGhpbmssIHRoZXJlIHdvbid0IGJlIGEgZGVhZGxvY2suCj4gCj4gT3IgSSByZWFs
bHkgbWlzc2VkIHNvbWV0aGluZz8KPiAKPiBJZiB3ZSB3b3JyeSBhYm91dCBpcG1tdV90bGJfaW52
YWxpZGF0ZSgpIHdoaWNoIGlzIGNhbGxlZCBoZXJlICh0byAKPiBwZXJmb3JtIGEgZmx1c2ggYnkg
cmVxdWVzdCBmcm9tIFAyTSBjb2RlLCB3aGljaCBtYW5hZ2VzIGEgcGFnZSB0YWJsZSkgCj4gYW5k
IGZyb20gdGhlIGlycSBoYW5kbGVyICh0byBwZXJmb3JtIGEgZmx1c2ggdG8gcmVzdW1lIGFkZHJl
c3MgCj4gdHJhbnNsYXRpb24pLCBJIGNvdWxkIHVzZSBhIHRhc2tsZXQgdG8gc2NoZWR1bGUgaXBt
bXVfdGxiX2ludmFsaWRhdGUoKSAKPiBmcm9tIHRoZSBpcnEgaGFuZGxlciB0aGVuLiBUaGlzIHdh
eSB3ZSB3b3VsZCBnZXQgdGhpcyBzZXJpYWxpemVkLiBXaGF0IAo+IGRvIHlvdSB0aGluaz8KCkkg
YW0gYWZyYWlkIGEgdGFza2xldCBpcyBub3QgYW4gb3B0aW9uLiBZb3UgbmVlZCB0byBwZXJmb3Jt
IHRoZSBUTEIgCmZsdXNoIHdoZW4gcmVxdWVzdGVkIG90aGVyd2lzZSB5b3UgYXJlIGludHJvZHVj
aW5nIGEgc2VjdXJpdHkgaXNzdWUuCgpUaGlzIGlzIGJlY2F1c2UgYXMgc29vbiBhcyBhIHJlZ2lv
biBpcyB1bm1hcHBlZCBpbiB0aGUgcGFnZSB0YWJsZSwgd2UgCnJlbW92ZSB0aGUgZHJvcCB0aGUg
cmVmZXJlbmNlIG9uIGFueSBwYWdlIGJhY2tpbmcgdGhhdCByZWdpb24uIFdoZW4gdGhlIApyZWZl
cmVuY2UgaXMgZHJvcHBlZCB0byB6ZXJvLCB0aGUgcGFnZSBjYW4gYmUgcmVhbGxvY2F0ZWQgdG8g
YW5vdGhlciAKZG9tYWluIG9yIGV2ZW4gWGVuLiBJZiB0aGUgVExCIGZsdXNoIGhhcHBlbiBhZnRl
ciwgdGhlbiB0aGUgZ3Vlc3QgbWF5IApzdGlsbCBiZSBhYmxlIHRvIGFjY2VzcyB0aGUgcGFnZSBm
b3IgYSBzaG9ydCB0aW1lIGlmIHRoZSB0cmFuc2xhdGlvbiBoYXMgCmJlZW4gY2FjaGVkIGJ5IHRo
ZSBhbnkgVExCIChJT01NVSwgUHJvY2Vzc29yKS4KClsuLi5dCgo+Pj4gK8KgwqDCoCAvKgo+Pj4g
K8KgwqDCoMKgICogRGVzdHJveSBSb290IElQTU1VIGRvbWFpbiB3aGljaCBjb250ZXh0IGlzIG1h
cHBlZCB0byB0aGlzIFhlbiAKPj4+IGRvbWFpbgo+Pj4gK8KgwqDCoMKgICogaWYgZXhpdHMuCj4+
PiArwqDCoMKgwqAgKi8KPj4+ICvCoMKgwqAgaWYgKCB4ZW5fZG9tYWluLT5yb290X2RvbWFpbiAp
Cj4+PiArwqDCoMKgwqDCoMKgwqAgaXBtbXVfZnJlZV9yb290X2RvbWFpbih4ZW5fZG9tYWluLT5y
b290X2RvbWFpbik7Cj4+PiArCj4+PiArwqDCoMKgIHNwaW5fdW5sb2NrKCZ4ZW5fZG9tYWluLT5s
b2NrKTsKPj4+ICsKPj4+ICvCoMKgwqAgLyoKPj4+ICvCoMKgwqDCoCAqIFdlIGFzc3VtZSB0aGF0
IGFsbCBtYXN0ZXIgZGV2aWNlcyBoYXZlIGFscmVhZHkgYmVlbiBkZXRhY2hlZCAKPj4+IGZyb20K
Pj4+ICvCoMKgwqDCoCAqIHRoaXMgWGVuIGRvbWFpbiBhbmQgdGhlcmUgbXVzdCBiZSBubyBhc3Nv
Y2lhdGVkIENhY2hlIElQTU1VIAo+Pj4gZG9tYWlucwo+Pj4gK8KgwqDCoMKgICogaW4gdXNlLgo+
Pj4gK8KgwqDCoMKgICovCj4+PiArwqDCoMKgIEFTU0VSVChsaXN0X2VtcHR5KCZ4ZW5fZG9tYWlu
LT5jYWNoZV9kb21haW5zKSk7Cj4+IEkgdGhpbmsgdGhpcyBzaG91bGQgYmUgaW4gdGhlIHNwaW4g
bG9jayBoZWxkIGJ5ICZ4ZW5fZG9tYWluLT5sb2NrLgo+IAo+IE9LLiBXaWxsIHB1dCBzcGluX3Vu
bG9jayBhZnRlciBpdC4KClRoZSBzcGluX2xvY2sgaXMgYWN0dWFsbHkgcG9pbnRsZXNzIGhlcmUu
IFRoaXMgaXMgZG9uZSB3aGVuIHRoZSBkb21haW4gCmlzIGRlc3Ryb3llZCwgc28gbm9ib2R5IHNo
b3VsZCB0b3VjaCBpdC4KCklmIHlvdSB0aGluayBjb25jdXJyZW50IGFjY2VzcyBjYW4gc3RpbGwg
aGFwcGVuLCB0aGVuIHlvdSBhcmUgZ29pbmcgdG8gCmJlIGluIGRlZXAgdHJvdWJsZSBhcyB5b3Ug
ZnJlZSB0aGUgeGVuX2RvbWFpbiAoYW5kIHRoZXJlZm9yZSB0aGUgCnNwaW5sb2NrKSBiZWxvdyA6
KS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
