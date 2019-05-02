Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D2B1156A
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 10:28:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hM72m-0000RB-GX; Thu, 02 May 2019 08:26:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=L2Tp=TC=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hM72k-0000R6-Py
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 08:26:14 +0000
X-Inumbo-ID: ea8d829a-6cb3-11e9-860e-8fb2fdca9ad0
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ea8d829a-6cb3-11e9-860e-8fb2fdca9ad0;
 Thu, 02 May 2019 08:26:00 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 ACDA830747CA; Thu,  2 May 2019 11:25:59 +0300 (EEST)
Received: from [10.10.196.90] (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 94CF6306E477;
 Thu,  2 May 2019 11:25:59 +0300 (EEST)
To: Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
References: <20190501235731.1486-1-tamas@tklengyel.com>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <59f57a48-b1da-7362-4024-c890cf357bf0@bitdefender.com>
Date: Thu, 2 May 2019 11:25:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190501235731.1486-1-tamas@tklengyel.com>
Content-Language: en-US-large
Subject: Re: [Xen-devel] [PATCH] x86/vm_event: add gdtr_base to the vm_event
 structure
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
Cc: Petre PIRCALABU <ppircalabu@bitdefender.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNS8yLzE5IDI6NTcgQU0sIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiBSZWNlaXZpbmcgdGhp
cyByZWdpc3RlciBpcyB1c2VmdWwgZm9yIGludHJvc3BlY3RpbmcgMzItYml0IFdpbmRvd3Mgd2hl
biB0aGUKPiBldmVudCBiZWluZyB0cmFwcGVkIGhhcHBlbmVkIHdoaWxlIGluIHJpbmczLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KPiBD
YzogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgo+IENjOiBUYW1h
cyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+Cj4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KPiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KPiBDYzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiBDYzogUm9nZXIgUGF1
IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiAtLS0KPiAgIHhlbi9hcmNoL3g4Ni92bV9l
dmVudC5jICAgICAgIHwgNSArKysrKwo+ICAgeGVuL2luY2x1ZGUvcHVibGljL3ZtX2V2ZW50Lmgg
fCAzICsrLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3ZtX2V2ZW50LmMgYi94ZW4vYXJjaC94
ODYvdm1fZXZlbnQuYwo+IGluZGV4IDUxYzM0OTNiMWQuLjg3Mzc4OGUzMmYgMTAwNjQ0Cj4gLS0t
IGEveGVuL2FyY2gveDg2L3ZtX2V2ZW50LmMKPiArKysgYi94ZW4vYXJjaC94ODYvdm1fZXZlbnQu
Ywo+IEBAIC0xNzksNiArMTc5LDEwIEBAIHN0YXRpYyB2b2lkIHZtX2V2ZW50X3BhY2tfc2VnbWVu
dF9yZWdpc3RlcihlbnVtIHg4Nl9zZWdtZW50IHNlZ21lbnQsCj4gICAgICAgICAgIHJlZy0+ZXNf
c2VsID0gc2VnLnNlbDsKPiAgICAgICAgICAgYnJlYWs7Cj4gICAKPiArICAgIGNhc2UgeDg2X3Nl
Z19nZHRyOgo+ICsgICAgICAgIHJlZy0+Z2R0cl9iYXNlID0gc2VnLmJhc2U7Cj4gKyAgICAgICAg
YnJlYWs7CgpQbGVhc2UgYWxzbyBhZGQgbGltaXQsIGFyLCBzZWwsIGxpa2UgdGhlIG90aGVycyBk
by4gSW4gYWRkaXRpb24gdG8gCm1ha2luZyB0aGlzIG1vZGlmaWNhdGlvbiBsb29rIGxlc3Mgc3Ry
YW5nZSAoc2luY2UsIGluIGNvbnRyYXN0IHRvIHRoZSAKZnVuY3Rpb24gbmFtZSwgbm90aGluZyBp
cyBwYWNrZWQgZm9yIGdkdHJfYmFzZSksIGl0IHdpbGwgYWxzbyBzYXZlIApmdXR1cmUgd29yayBm
b3IgYXBwbGljYXRpb25zIHdhbnRpbmcgdG8gdXNlIGdkdHIgd2hpY2ggYWxzbyByZXF1aXJlIApi
YWNrd2FyZHMgY29tcGF0aWJpbGl0eSB3aXRoIHByZXZpb3VzIHZtX2V2ZW50IHZlcnNpb25zLgoK
QXMgeW91IGtub3csIGZvciBlYWNoIHN1Y2ggbW9kaWZpY2F0aW9uIHdlIG5lZWQgdG8gaGF2ZSBh
IHNlcGFyYXRlIAp2bV9ldmVudF92WCBoZWFkZXIgaW4gb3VyIGFwcGxpY2F0aW9ucyBzbyB0aGF0
IHdlJ3JlIHJlYWR5IHRvIGNyZWF0ZSBhIApyaW5nIGJ1ZmZlciB1c2luZyByZXF1ZXN0cyBhbmQg
cmVwbGllcyBvZiB0aGUgcmlnaHQgc2l6ZSwgYW5kIGFsc28gdG8gYmUgCmFibGUgdG8gcHJvcGVy
bHkgaW50ZXJwcmV0IHRoZSByaW5nIGJ1ZmZlciBkYXRhLCBzbyB0aGUgbGVhc3QgZnJlcXVlbnQg
CmNoYW5nZXMgdG8gdGhlIHZtX2V2ZW50IHN0cnVjdCwgdGhlIGJldHRlci4KClBldHJlIGlzIGN1
cnJlbnRseSB3b3JraW5nIG9uIHRoZSB2bV9ldmVudCBjaGFuZ2VzIHRoYXQgd2lsbCBob3BlZnVs
bHkgCmVuYWJsZSB1cyB0byBqdXN0IGNhY2hlIGV2ZXJ5dGhpbmcgdGhhdCB0aGUgZ2V0Y29udGV4
dF9wYXJ0aWFsIGh5cGVyY2FsbCAKcmV0cmlldmVzLgoKClRoYW5rcywKUmF6dmFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
