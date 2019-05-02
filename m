Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D3C12394
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 22:47:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMIY8-0006Xy-TT; Thu, 02 May 2019 20:43:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JzUk=TC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hMIY7-0006Xt-9v
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 20:43:23 +0000
X-Inumbo-ID: ec337386-6d1a-11e9-a91d-970db3fec87f
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ec337386-6d1a-11e9-a91d-970db3fec87f;
 Thu, 02 May 2019 20:43:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A70D8374;
 Thu,  2 May 2019 13:43:20 -0700 (PDT)
Received: from [10.37.12.81] (unknown [10.37.12.81])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7CADA3F557;
 Thu,  2 May 2019 13:43:19 -0700 (PDT)
To: Viktor Mitin <viktor.mitin.19@gmail.com>
References: <CAOcoXZZtsXQMp0EzFAa2WEBL1sEUcFsNozaQshsnNEs3=NQK3g@mail.gmail.com>
 <CAOcoXZY6jpPKcWTXPqz0sr=Amw7J0KSaBRWiRnQRgTC2XR=hjQ@mail.gmail.com>
 <f95ad35b-42f6-4df2-cade-7a8115f9e49a@arm.com>
 <CAOcoXZaMLfHSyLSE04xRFZZY0hLkFcJ5cBqHTdmwDoqwcreD1w@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <ff543e3c-0619-5aa6-b36a-e1a8b8cce886@arm.com>
Date: Thu, 2 May 2019 21:43:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAOcoXZaMLfHSyLSE04xRFZZY0hLkFcJ5cBqHTdmwDoqwcreD1w@mail.gmail.com>
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
 Wei Liu <wei.liu2@citrix.com>, Andrii_Anisov@epam.com,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KCsgV2VpKQoKT24gNS8yLzE5IDU6NTUgUE0sIFZpa3RvciBNaXRpbiB3cm90ZToKPiBIaSBKdWxp
ZW4sCgpIaSwKCj4gUGxlYXNlIGZpbmQgdHJhY2UgbG9nIGJlbG93Ogo+IAo+IHJvb3RAaDN1bGNi
On4jIHhlbmNvdiByZXNldAo+IChYRU4pIERhdGEgQWJvcnQgVHJhcC4gU3luZHJvbWU9MHg3Cj4g
KFhFTikgV2Fsa2luZyBIeXBlcnZpc29yIFZBIDB4MzYxNzAwIG9uIENQVTMgdmlhIFRUQlIgMHgw
MDAwMDAwMDc4MjY2MDAwClNvIHRoaXMgaXMgYSBkYXRhIGFib3J0IHdoZW4gdHJ5aW5nIHRvIGFj
Y2VzcyBWQSAweDM2MTcwMCAoaXQgaXMgcGFydCBvZiAKWGVuIGl0c2VsZikuIEkgbWlzcmVhZCB0
aGUgQXJtIEFybSBiZWZvcmUsIHdoaWxlIElTViBpcyAwIERGU0Mgd2lsbCAKc3RpbGwgcHJvdmlk
ZSBhIGNvcnJlY3QgdmFsdWUuIFNvIGhlcmUgd2UgaGF2ZSBhICJUcmFuc2xhdGlvbiBmYXVsdCwg
CmxldmVsIDMiLgoKV2hpY2ggbWFrZXMgc2Vuc2UgYmVjYXVzZSAuLi4KCgo+IChYRU4pIDBUSFsw
eDBdID0gMHgwMDAwMDAwMDc4MjY1ZjdmCj4gKFhFTikgMVNUWzB4MF0gPSAweDAwMDAwMDAwNzgy
NjJmN2YKPiAoWEVOKSAyTkRbMHgxXSA9IDB4MDA0MDAwMDA3ODI1ZmY3Zgo+IChYRU4pIDNSRFsw
eDE2MV0gPSAweDAwNjAwMDAwNzgxZTFmN2UKCnRoZSAzcmQgZW50cnkgaXMgbm90IHZhbGlkLiBJ
IG1hbmFnZWQgdG8gcmVkdWNlIHRoZSBlcnJvciBhbmQgaXQgbG9va3MgCmxpa2UgZ2NvdiBpcyB0
cnlpbmcgdG8gYWNjZXNzIGEgY291bnRlciBpbiB0aGUgc2VjdGlvbiBpbml0LmRhdGEuCgpBcyBh
bGwgdGhlIC5pbml0Liogc2VjdGlvbnMgYXJlIHN0cmlwcGVkIGFmdGVyIGJvb3QsIGl0IG1lYW5z
IHRoYXQgCmFueXRoaW5nIGluIC5pbml0LmRhdGEgY2Fubm90IGJlIGFjY2Vzc2VkIGFueW1vcmUu
CgpXZWksIGhvdyBkbyB5b3UgZGVhbCB3aXRoIGNvdW50ZXJzIGluIGluaXQuZGF0YSBvbiB4ODY/
CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
