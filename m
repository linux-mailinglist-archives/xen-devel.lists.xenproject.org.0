Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64024E814
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 18:49:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL9R0-0007lu-Ih; Mon, 29 Apr 2019 16:47:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cijb=S7=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hL9Qy-0007lo-8U
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 16:47:16 +0000
X-Inumbo-ID: 714624b5-6a9e-11e9-843c-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 714624b5-6a9e-11e9-843c-bc764e045a96;
 Mon, 29 Apr 2019 16:47:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4FA680D;
 Mon, 29 Apr 2019 09:47:14 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D3B033F5AF;
 Mon, 29 Apr 2019 09:47:12 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-2-julien.grall@arm.com>
 <5CC1A4DD0200007800229083@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e48677c1-45c1-b6bd-a0f3-d7f106608b76@arm.com>
Date: Mon, 29 Apr 2019 17:47:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CC1A4DD0200007800229083@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 01/20] xen/const: Introduce _BITUL and
 _BITULL
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 oleksandr_tyshchenko@epam.com, xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyNS8wNC8yMDE5IDEzOjE1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAyMi4w
NC4xOSBhdCAxODo0OSwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gVGhlIHBhdHRl
cm4gX0FDKDEsIFVMeyxMfSkgPDwgWCBpcyBjb21tb25seSB1c2VkIGluIHRoZSBoZWFkZXJzIHRv
IG1ha2UKPj4gZGVmaW5lIHVzdWFibGUgaW4gYm90aCBhc3NlbWJseSBhbmQgQy4KPj4KPj4gU28g
aW50cm9kdWNlIF9CSVRVTCBhbmQgX0JJVFVMTCB0byBtYWtlIHRoZSBjb2RlIHNsaWdodGx5IG1v
cmUgcmVhZGFibGUuCj4gCj4gSSBkb24ndCBwYXJ0aWN1bGFybHkgbGlrZSB0aGUgbmFtZXMsIGFu
ZCBJIHNwZWNpZmljYWxseSBvYmplY3QgdG8KPiB0aGUgbGVhZGluZyB1bmRlcnNjb3Jlcy4gSSdt
IGFmcmFpZCBJIGRvbid0IGhhdmUgYmV0dGVyCj4gc3VnZ2VzdGlvbnMgZm9yIHRoZSBuYW1lcywg
YnV0IHdoYXQgSSdkIGxpa2UgdG8gYXNrIGZvciBpcyB0aGF0Cj4gYXQgbGVhc3QgdGhlIFVMIC8g
VUxMIGJlIHNvbWVob3cgc2VwYXJhdGVkIGZyb20gQklULiBPbmUKPiBvcHRpb24gbWlnaHQgYmUg
c29tZXRoaW5nIGxpa2UKClRoZSBfIG1hdGNoIHRoZSBvdGhlciBhc3NlbWJseSBtYWNybyB3ZSBo
YXZlIGRlZmluZWQgaW4gY29uc3QuaC4gSSB1bmRlcnN0YW5kIAp5b3UgZG9uJ3QgbGlrZSB0aGUg
bGVhZGluZyB1bmRlcnNjb3JlcywgYnV0IEkgdGhpbmsgY29uc2lzdGVuY3kgaXMgYmV0dGVyIGhl
cmUuCgpUaGUgbW9yZSBrZWVwaW5nIHRoZSBzYW1lIGdlbmVyaWMgbmFtaW5nIGxvd2VyIGRvd24g
dGhlIGNodXJuIHRvIGltcG9ydCBjb2RlIApmcm9tIExpbnV4LgoKPiAKPiAjZGVmaW5lIEJJVChw
b3MsIHNmeCkgKF9BQygxLCBzZngpIDw8IChwb3MpKQoKQklUKCkgaXMgYWxyZWFkeSBkZWZpbmUg
aW4gWGVuIGFuZCB1c2VkIGluIGNvZGUgY29taW5nIGZyb20gTGludXguIEkgd291bGQgCnJhdGhl
ciBub3QgY2hhbmdlIHRoZSBwcm90b3R5cGUgZm9yIHRoaXMgcmVhc29uLgoKPiAKPiBhbGJlaXQg
QklUIG1heSBiZSBhIGxpdHRsZSB0b28gZ2VuZXJpYyBhIG5hbWUsIHlldCBzb21ldGhpbmcKPiBs
aWtlIERFRklORV9CSVQgbG9va3MgYSBsaXR0bGUgbG9uZ2lzaC4gQnV0IGF0IGxlYXN0IGl0IHdv
dWxkIGFsc28KPiBhbGxvdyBlLmcuIHBsYWluIHVuc2lnbmVkIChub24tbG9uZykgY29uc3RhbnRz
IHRvIGJlIGRlZmluZWQKPiB3aXRob3V0IHlldCBhbm90aGVyIG5ldyBjb25zdHJ1Y3QuCgpTZWUg
YWJvdmUgdGhlIHJlYXNvbiB3aHkgdGhvc2UgbmFtZXMuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdy
YWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
