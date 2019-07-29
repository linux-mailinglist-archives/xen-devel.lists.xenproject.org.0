Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A7478985
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 12:18:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs2gK-0005pG-NC; Mon, 29 Jul 2019 10:15:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=l3zY=V2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hs2gJ-0005p6-R3
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 10:15:03 +0000
X-Inumbo-ID: b8768a9c-b1e9-11e9-a634-4f61f191c13e
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id b8768a9c-b1e9-11e9-a634-4f61f191c13e;
 Mon, 29 Jul 2019 10:14:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1084344;
 Mon, 29 Jul 2019 03:14:58 -0700 (PDT)
Received: from [10.37.8.36] (unknown [10.37.8.36])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 095A43F694;
 Mon, 29 Jul 2019 03:14:57 -0700 (PDT)
To: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1561545009-17493-1-git-send-email-olekstysh@gmail.com>
 <1561545009-17493-2-git-send-email-olekstysh@gmail.com>
 <c07d3a21-872e-c711-958d-916461e331e9@arm.com>
 <3fca4b60-43a0-3f2d-f7bb-1a14cfcacdfb@gmail.com>
 <9fbeba99-06a2-6e8e-b22d-0cbb9c47b485@arm.com>
 <8a8df868-d80f-e5aa-0a65-628ed05ab107@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <7222faa1-0643-89b7-c8c5-a1cc7dad19a4@arm.com>
Date: Mon, 29 Jul 2019 11:14:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8a8df868-d80f-e5aa-0a65-628ed05ab107@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V1] iommu/arm: Add Renesas IPMMU-VMSA support
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
 sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgT2xla3NhbmRyLAoKT24gNy8yNC8xOSAxMTo1NCBBTSwgT2xla3NhbmRyIHdyb3RlOgo+IE9u
IDIzLjA3LjE5IDE2OjM2LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4gT24gNi8yNi8xOSAxMToz
MCBBTSwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6Cj4+Pj4+IEZyb206IE9sZWtzYW5kciBU
eXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4KPj4+Pj4gK3sKPj4+Pj4g
K8KgwqDCoCByZXR1cm4gcmVhZGwobW11LT5iYXNlICsgb2Zmc2V0KTsKPj4+Pj4gK30KPj4+Pj4g
Kwo+Pj4+PiArc3RhdGljIHZvaWQgaXBtbXVfd3JpdGUoc3RydWN0IGlwbW11X3Ztc2FfZGV2aWNl
ICptbXUsIHVuc2lnbmVkIAo+Pj4+PiBpbnQgb2Zmc2V0LAo+Pj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1MzIgZGF0YSkKPj4+Pj4gK3sKPj4+Pj4g
K8KgwqDCoCB3cml0ZWwoZGF0YSwgbW11LT5iYXNlICsgb2Zmc2V0KTsKPj4+Pj4gK30KPj4+Pj4g
Kwo+Pj4+PiArc3RhdGljIHUzMiBpcG1tdV9jdHhfcmVhZF9yb290KHN0cnVjdCBpcG1tdV92bXNh
X2RvbWFpbiAqZG9tYWluLAo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCByZWcpCj4+Pj4+ICt7Cj4+
Pj4+ICvCoMKgwqAgcmV0dXJuIGlwbW11X3JlYWQoZG9tYWluLT5tbXUtPnJvb3QsCj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG9tYWluLT5jb250ZXh0
X2lkICogSU1fQ1RYX1NJWkUgKyByZWcpOwo+Pj4+PiArfQo+Pj4+PiArCj4+Pj4+ICtzdGF0aWMg
dm9pZCBpcG1tdV9jdHhfd3JpdGVfcm9vdChzdHJ1Y3QgaXBtbXVfdm1zYV9kb21haW4gKmRvbWFp
biwKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IHJlZywgdTMyIGRhdGEpCj4+Pj4+ICt7Cj4+
Pj4+ICvCoMKgwqAgaXBtbXVfd3JpdGUoZG9tYWluLT5tbXUtPnJvb3QsCj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG9tYWluLT5jb250ZXh0X2lkICogSU1fQ1RYX1NJWkUg
KyByZWcsIGRhdGEpOwo+Pj4+PiArfQo+Pj4+PiArCj4+Pj4+ICtzdGF0aWMgdm9pZCBpcG1tdV9j
dHhfd3JpdGVfY2FjaGUoc3RydWN0IGlwbW11X3Ztc2FfZG9tYWluICpkb21haW4sCj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgdW5zaWduZWQgaW50IHJlZywgdTMyIGRhdGEpCj4+Pj4+ICt7Cj4+Pj4+ICvCoMKg
wqAgQVNTRVJUKHJlZyA9PSBJTUNUUik7Cj4+Pj4KPj4+PiBXaGF0J3MgdGhlIHJhdGlvbmFsZSBv
ZiBwYXNzaW5nIHJlZyBpbiBwYXJhbWV0ZXIgaWYgaXQgY2FuIG9ubHkgYmUgCj4+Pj4gZXF1YWwg
dG8gSU1DVFI/Cj4+Pgo+Pj4gR29vZCBxdWVzdGlvbi4gSSB0cmllZCB0byByZXRhaW4gdGhlIHNh
bWUgaW50ZXJmYWNlIGFzIGZvciAKPj4+IGlwbW11X2N0eF93cml0ZV9yb290KF9hbGwpIGZvciB2
aXNpYmlsaXR5Lgo+Pj4KPj4+IENhY2hlIElQTU1VIGRldmljZSBoYXMgb3RoZXIgdGhhbiBJTUNU
UiBjb250ZXh0IHJlZ2lzdGVycywgYnV0IHRoZXkgCj4+PiBhcmUgbm90IHVzZWQgYnkgdGhpcyBk
cml2ZXIuCj4+Cj4+IENvdWxkIHRoZSBmdW5jdGlvbiBiZSBhYmxlIHRvIGRlYWwgd2l0aCB0aG9z
ZSBvdGhlciByZWdpc3RlcnMgd2l0aG91dCAKPj4gYW55IGNoYW5nZT8KPiAKPiBOby4gImRhdGEg
JiBJTUNUUl9DT01NT05fTUFTSyIgc2hvdWxkIGJlIG1vdmVkIG91dCBvZiB0aGUgZnVuY3Rpb24g
YXQgCj4gbGVhc3QuCgpJIHdpbGwgbGVhdmUgdXAgdG8geW91IHdoZXRoZXIgeW91IHdhbnQgdG8g
ZHJvcCB0aGUgcGFyYW1ldGVyLiBIb3dldmVyLCAKSSdkIGxpa2UgYSBjb21tZW50IGV4cGxhaW5p
bmcgd2h5IHRoZSBBU1NFUlQoKSBpZiB5b3UgZGVjaWRlIHRvIGtlZXAgaXQuCgoKWy4uLl0KCj4+
Cj4+IElmIG5vdCwgdGhlbiBtYXliZSB5b3UgY291bGQganVzdCBhZGQgY2hlY2sgaW4gdGhlIGRy
aXZlciB0byBwcmV2ZW50IAo+PiB0aGF0IHVzZSBjYXNlcy4gVGhlIHdvcmsgYXJvdW5kIHRoZSBp
b21tdV9ncm91cCBkb25lIGJ5IFBhdWwgWzFdIG1pZ2h0IAo+PiBiZSB1c2VmdWwuCj4+Cj4+IEFu
eXdheSwgZnJvbSB1cHN0cmVhbSBwZXJzcGVjdGl2ZSB0aGlzIGlzIG5vdCBhIG1hc3NpdmUgY29u
Y2VybiBmb3IgCj4+IG5vdyBhcyBwbGF0Zm9ybSBkZXZpY2UtcGFzc3Rocm91Z2ggaXMgbm90IHNl
Y3VyaXR5IHN1cHBvcnRlZC4gU28gSSAKPj4gd291bGQgYmUgaGFwcHkgaWYgdGhlIFRPRE8gaXMg
YWRkcmVzc2VkIGluIGEgZm9sbG93LXVwIHNlcmllcy4KPiAKPiAKPiBBZ3JlZS4KPiAKPiBTbywg
dGhlIGZvbGxvd2luZyBhY3Rpb25zOgo+IAo+IDEuIFRPRE8gcmVtYWlucyBmb3IgdGhpcyBkcml2
ZXIgc2VyaWVzLgo+IAo+IDIuIFRPRE8gd2lsbCBiZSBhZGRyZXNzZWQgaW4gYSBmb2xsb3ctdXAg
c2VyaWVzIGJ5ICpwcmV2ZW50aW5nKiB0aGUgdXNlIAo+IGNhc2VzIHdoZXJlIHRoZSBzYW1lIHV0
bGIgY291bGQgYmUgc2hhcmVkIGJldHdlZW4gbXVsdGlwbGUgWGVuIGRvbWFpbnMuCgpUaGUgMiBh
Y3Rpb25zIGxvb2tzIGdvb2QgdG8gbWUuCgpbLi4uXQoKPiBJIHRoaW5rLCB0aGlzIHNvdW5kcyBy
ZWFzb25hYmxlIGFuZCB3b3J0aCB0cnlpbmcuIENvdWxkIHRoaXMgVE9ETyBiZSAKPiBhZGRyZXNz
ZWQgaW4gYSBmb2xsb3ctdXAgc2VyaWVzPwoKSSBhbSBmaW5lIHdpdGggdGhhdC4KCkNoZWVycywK
Ci0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
