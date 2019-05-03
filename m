Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A148212F55
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 15:37:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMYLM-0000by-84; Fri, 03 May 2019 13:35:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vigr=TD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hMYLK-0000bt-E3
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 13:35:14 +0000
X-Inumbo-ID: 47073247-6da8-11e9-843c-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 47073247-6da8-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 13:35:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4FC8C374;
 Fri,  3 May 2019 06:35:12 -0700 (PDT)
Received: from [10.1.35.71] (oppo-r15.cambridge.arm.com [10.1.35.71])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CCEF03F5C1;
 Fri,  3 May 2019 06:35:10 -0700 (PDT)
To: Wei Liu <wei.liu2@citrix.com>
References: <CAOcoXZZtsXQMp0EzFAa2WEBL1sEUcFsNozaQshsnNEs3=NQK3g@mail.gmail.com>
 <CAOcoXZY6jpPKcWTXPqz0sr=Amw7J0KSaBRWiRnQRgTC2XR=hjQ@mail.gmail.com>
 <f95ad35b-42f6-4df2-cade-7a8115f9e49a@arm.com>
 <CAOcoXZaMLfHSyLSE04xRFZZY0hLkFcJ5cBqHTdmwDoqwcreD1w@mail.gmail.com>
 <ff543e3c-0619-5aa6-b36a-e1a8b8cce886@arm.com>
 <20190503110819.GA5900@zion.uk.xensource.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <63ea8905-87ca-a419-95bf-ae497bf1ff85@arm.com>
Date: Fri, 3 May 2019 14:35:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190503110819.GA5900@zion.uk.xensource.com>
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii_Anisov@epam.com, Viktor Mitin <viktor.mitin.19@gmail.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgV2VpLAoKT24gNS8zLzE5IDEyOjA4IFBNLCBXZWkgTGl1IHdyb3RlOgo+IE9uIFRodSwgTWF5
IDAyLCAyMDE5IGF0IDA5OjQzOjE3UE0gKzAxMDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gKCsg
V2VpKQo+Pgo+PiBPbiA1LzIvMTkgNTo1NSBQTSwgVmlrdG9yIE1pdGluIHdyb3RlOgo+Pj4gSGkg
SnVsaWVuLAo+Pgo+PiBIaSwKPj4KPj4+IFBsZWFzZSBmaW5kIHRyYWNlIGxvZyBiZWxvdzoKPj4+
Cj4+PiByb290QGgzdWxjYjp+IyB4ZW5jb3YgcmVzZXQKPj4+IChYRU4pIERhdGEgQWJvcnQgVHJh
cC4gU3luZHJvbWU9MHg3Cj4+PiAoWEVOKSBXYWxraW5nIEh5cGVydmlzb3IgVkEgMHgzNjE3MDAg
b24gQ1BVMyB2aWEgVFRCUiAweDAwMDAwMDAwNzgyNjYwMDAKPj4gU28gdGhpcyBpcyBhIGRhdGEg
YWJvcnQgd2hlbiB0cnlpbmcgdG8gYWNjZXNzIFZBIDB4MzYxNzAwIChpdCBpcyBwYXJ0IG9mIFhl
bgo+PiBpdHNlbGYpLiBJIG1pc3JlYWQgdGhlIEFybSBBcm0gYmVmb3JlLCB3aGlsZSBJU1YgaXMg
MCBERlNDIHdpbGwgc3RpbGwKPj4gcHJvdmlkZSBhIGNvcnJlY3QgdmFsdWUuIFNvIGhlcmUgd2Ug
aGF2ZSBhICJUcmFuc2xhdGlvbiBmYXVsdCwgbGV2ZWwgMyIuCj4+Cj4+IFdoaWNoIG1ha2VzIHNl
bnNlIGJlY2F1c2UgLi4uCj4+Cj4+Cj4+PiAoWEVOKSAwVEhbMHgwXSA9IDB4MDAwMDAwMDA3ODI2
NWY3Zgo+Pj4gKFhFTikgMVNUWzB4MF0gPSAweDAwMDAwMDAwNzgyNjJmN2YKPj4+IChYRU4pIDJO
RFsweDFdID0gMHgwMDQwMDAwMDc4MjVmZjdmCj4+PiAoWEVOKSAzUkRbMHgxNjFdID0gMHgwMDYw
MDAwMDc4MWUxZjdlCj4+Cj4+IHRoZSAzcmQgZW50cnkgaXMgbm90IHZhbGlkLiBJIG1hbmFnZWQg
dG8gcmVkdWNlIHRoZSBlcnJvciBhbmQgaXQgbG9va3MgbGlrZQo+PiBnY292IGlzIHRyeWluZyB0
byBhY2Nlc3MgYSBjb3VudGVyIGluIHRoZSBzZWN0aW9uIGluaXQuZGF0YS4KPj4KPj4gQXMgYWxs
IHRoZSAuaW5pdC4qIHNlY3Rpb25zIGFyZSBzdHJpcHBlZCBhZnRlciBib290LCBpdCBtZWFucyB0
aGF0IGFueXRoaW5nCj4+IGluIC5pbml0LmRhdGEgY2Fubm90IGJlIGFjY2Vzc2VkIGFueW1vcmUu
Cj4+Cj4+IFdlaSwgaG93IGRvIHlvdSBkZWFsIHdpdGggY291bnRlcnMgaW4gaW5pdC5kYXRhIG9u
IHg4Nj8KPiAKPiBUaGUgYnVpbGQgc3lzdGVtIGV4cGxpY2l0bHkgY29tcGlsZSBhbnkgLmluaXQg
YmluYXJ5IHdpdGhvdXQgZ2Nvdgo+IG9wdGlvbi4gU28gbWF5YmUgc29tZSBmaWxlIHdhcyBub3Qg
Y29ycmVjdGx5IGFkZGVkPwoKVGhhbmsgeW91IGZvciB0aGUgcG9pbnRlci4gVGhlIHByb2JsZW0g
aXMgY29taW5nIGZyb20gbGliZmR0LiBUaGUgZW50aXJlIApsaWJyYXJ5IGlzIG1vdmVkIHRvIC5p
bml0IHVzaW5nOgoKICAkKE9CSkNPUFkpICQoZm9yZWFjaCBzLCQoU0VDVElPTlMpLC0tcmVuYW1l
LXNlY3Rpb24gLiQocyk9LmluaXQuJChzKSkgCiQ8ICRACgpTbyB3ZSBuZWVkIHRvIHRlbGwgdGhl
IHRvcCBNYWtlZmlsZSB0byBmaWx0ZXIgb3V0IGxpYmZkdC4gVGhlIHBhdGNoIApiZWxvdyBzaG91
bGQgZG8gdGhlIGpvYjoKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2xpYmZkdC9NYWtlZmlsZSBi
L3hlbi9jb21tb24vbGliZmR0L01ha2VmaWxlCmluZGV4IGQ4MWY1NGI2YjguLmMwNzViYmY1NDYg
MTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vbGliZmR0L01ha2VmaWxlCisrKyBiL3hlbi9jb21tb24v
bGliZmR0L01ha2VmaWxlCkBAIC0zLDYgKzMsNyBAQCBpbmNsdWRlIE1ha2VmaWxlLmxpYmZkdAog
IFNFQ1RJT05TIDo9IHRleHQgZGF0YSAkKFNQRUNJQUxfREFUQV9TRUNUSU9OUykKCiAgb2JqLXkg
Kz0gbGliZmR0Lm8KK25vY292LXkgKz0gbGliZmR0Lm8KCiAgQ0ZMQUdTICs9IC1JJChCQVNFRElS
KS9pbmNsdWRlL3hlbi9saWJmZHQvCgpXaGlsZSBsb29raW5nIGF0IHRoZSBjb2RlLCBJIG5vdGlj
ZWQgbGliZWxmIGlzIGFsc28gYnVpbHQgd2l0aCBjb3ZlcmFnZSAKYnV0IGluIC5pbml0IHNlY3Rp
b24uIFNvIEkgd291bGQgZXhwZWN0IHRoZSBzYW1lIGVycm9yIG9uIHg4NiwgZGlkIHlvdSAKdHJ5
ICJ4ZW5jb3YgcmVzZXQiIG9uIHg4Nj8KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
