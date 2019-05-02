Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 565B411C80
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 17:20:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMDT4-0008TA-5f; Thu, 02 May 2019 15:17:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JzUk=TC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hMDT1-0008Sz-RD
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 15:17:47 +0000
X-Inumbo-ID: 6f14e11e-6ced-11e9-a3f2-8b94b6a3096f
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 6f14e11e-6ced-11e9-a3f2-8b94b6a3096f;
 Thu, 02 May 2019 15:17:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A591BA78;
 Thu,  2 May 2019 08:17:43 -0700 (PDT)
Received: from [10.37.8.26] (unknown [10.37.8.26])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC0BE3F5AF;
 Thu,  2 May 2019 08:17:41 -0700 (PDT)
To: Viktor Mitin <viktor.mitin.19@gmail.com>, xen-devel@lists.xenproject.org
References: <CAOcoXZZtsXQMp0EzFAa2WEBL1sEUcFsNozaQshsnNEs3=NQK3g@mail.gmail.com>
 <CAOcoXZY6jpPKcWTXPqz0sr=Amw7J0KSaBRWiRnQRgTC2XR=hjQ@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <f95ad35b-42f6-4df2-cade-7a8115f9e49a@arm.com>
Date: Thu, 2 May 2019 16:17:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAOcoXZY6jpPKcWTXPqz0sr=Amw7J0KSaBRWiRnQRgTC2XR=hjQ@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen GCC coverage ARM64 testing - Unexpected Trap:
 Data Abort
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
Cc: Artem_Mygaiev@epam.com,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, sstabellini@kernel.org,
 Andrii_Anisov@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA1LzIvMTkgMzo1MCBQTSwgVmlrdG9yIE1pdGluIHdyb3RlOgo+IEFkZGluZyBYZW4g
bWFpbnRhaW5lcnMgdG8gdGhpcyBlbWFpbCBDQy4KPiAKPiBUaGFua3MKPiAKPiBPbiBUaHUsIE1h
eSAyLCAyMDE5IGF0IDU6MDggUE0gVmlrdG9yIE1pdGluIDx2aWt0b3IubWl0aW4uMTlAZ21haWwu
Y29tPiB3cm90ZToKPj4KPj4gSGkgQWxsLAo+Pgo+PiBQbGVhc2UgYmUgYXdhcmUgdGhhdCB3ZSBo
YXZlIHRyaWVkIFhlbiBBUk02NCBidWlsZCB3aXRoCj4+IENPTkZJR19DT1ZFUkFHRSBmZWF0dXJl
IGVuYWJsZWQuIFRoZSBidWlsZCBlbnZpcm9ubWVudCBpcyBuZXh0Ogo+PiBYZW4gVmVyc2lvbnMg
dGVzdGVkOiB4ZW4tNC4xMi1zdGFibGUsIHhlbi00LjEzLXN0YWdpbmcKPj4gQm9hcmQ6IEgzVUxD
QiwgUi1DYXIgSDMgVmVyLjIuMAo+PiBQb2t5OiBZb2N0byBQcm9qZWN0IFJlZmVyZW5jZSBEaXN0
cm8gMi40LjIKPj4gQ29tcGlsZXI6IGFhcmNoNjQtcG9reS1saW51eC1nY2MgKExpbmFybyBHQ0Mg
Ny4yLTIwMTcuMTEpIDcuMi4xCj4+Cj4+IEJvdGggWGVuIHZlcnNpb25zICg0LjEyIGFuZCBzdGFn
aW5nKSByZXR1cm4gIlVuZXhwZWN0ZWQgVHJhcDogRGF0YQo+PiBBYm9ydCIgaXNzdWUgaW4gY2Fz
ZSBvZiAneGVuY292IHJlc2V0JyBvciAneGVuY292IHJlYWQnIGNhbGxzOgo+Pgo+PiByb290QGgz
dWxjYjp+IyB4ZW5jb3YgcmVzZXQKPj4gKFhFTikgRGF0YSBBYm9ydCBUcmFwLiBTeW5kcm9tZT0w
eDcKClBlciB0aGUgdmFsdWUsIHRoZSBzeW5kcm9tZSBpcyBpbnZhbGlkLiBBcyBJIHdpbGwgbm90
IG9wZW4gYSB6aXAgKHNlZSAKYmVsb3cgd2h5KSwgY291bGQgeW91IHBvc3QgdGhlIGZ1bGwgc3Rh
Y2sgdHJhY2U/Cgo+PiAoWEVOKSBXYWxraW5nIEh5cGVydmlzb3IgVkEgMHgzNjE3MDAgb24gQ1BV
MyB2aWEgVFRCUiAweDAwMDAwMDAwNzgyNjYwMDAKPj4gKFhFTikgMFRIWzB4MF0gPSAweDAwMDAw
MDAwNzgyNjVmN2YKPj4gKFhFTikgMVNUWzB4MF0gPSAweDAwMDAwMDAwNzgyNjJmN2YKPj4gKFhF
TikgMk5EWzB4MV0gPSAweDAwNDAwMDAwNzgyNWZmN2YKPj4gKFhFTikgM1JEWzB4MTYxXSA9IDB4
MDA2MDAwMDA3ODFlMWY3ZQo+PiAoWEVOKSBDUFUzOiBVbmV4cGVjdGVkIFRyYXA6IERhdGEgQWJv
cnQKPj4KPj4gQXR0YWNoaW5nIHRoZSBuZXh0IGxvZyBmaWxlcyAoemlwcGVkIGluCj4+IHhlbl93
aXRoX2NvbmZpZ19jb3ZlcmFnZV9sb2dzLnppcCkgd2l0aCB0aGUgZGV0YWlsczoKClBsZWFzZSBk
b24ndCBzZW5kIGEgNTRLQiBhdHRhY2htZW50IG9uIHRoZSBtYWlsaW5nIGxpc3QuIFRoaXMgaXMg
dXNpbmcgCnVwIHNwYWNlIGZvciBldmVyeSBvbmUgb24gdGhlIE1MLiBJbnN0ZWFkIHlvdSBzaG91
bGQgdXBsb2FkIHNvbWV3aGVyZSAKKGUuZyBwYXN0ZWJpbikuCgpCdXQgSSBhbSBhZnJhaWQsIEkg
YW0gbm90IGdvaW5nIHRvIG9wZW4gYW55IGFyY2hpdmUgc2VudCBvbiB0aGUgbWFpbGluZyAKbGlz
dC4gUGxlYXNlIHVwbG9hZCBmaWxlIHNlcGFyYXRlbHkuIEhvd2V2ZXIuLi4uCgo+PiAtIGFsbCB0
aGUgcnVuLXRpbWUgZXhjZXB0aW9uIGRldGFpbHMgKHJjYXJoM19jb25maWdfY292ZXJhZ2VfdHJh
cC5sb2cpOwo+PiAtIHhlbiBwYWNrYWdlIGJ1aWxkIGxvZyBmaWxlIHdpdGggY29tcGlsYXRpb24g
b3B0aW9ucyAoY29tcGlsYXRpb24ubG9nKTsKClRoaXMgaXMgbm90IG5lY2Vzc2FyeS4KCj4+IC0g
eGVuIGh5cGVydmlzb3IgLmNvbmZpZyBmaWxlIHVzZWQgZm9yIHRoZSBidWlsZCAoeGVuX2RvdF9j
b25maWcubG9nKTsKPj4KPj4gUGxlYXNlIHNoYXJlIGFueSBjb21tZW50cyBvciBpZGVhcyBhYm91
dCB0aGUgaXNzdWUuCgpHQ09WIG9uIEFybSBoYXMgbmV2ZXIgYmVlbiB0ZXN0ZWQuIFNvIGl0IG1p
Z2h0IGJlIHBvc3NpYmxlIHRoZXJlIG1pZ2h0IApiZSBzb21lIGlzc3VlcyB3aXRoIGl0LgoKQ2hl
ZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
