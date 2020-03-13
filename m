Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB941843F3
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 10:43:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCgnO-00040Z-0Q; Fri, 13 Mar 2020 09:39:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9TpK=46=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jCgnM-00040U-W9
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 09:39:57 +0000
X-Inumbo-ID: 987ea5e8-650e-11ea-92cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 987ea5e8-650e-11ea-92cf-bc764e2007e4;
 Fri, 13 Mar 2020 09:39:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 448CFABF4;
 Fri, 13 Mar 2020 09:39:54 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <8f1b522e-8667-c230-6671-7d70252634de@suse.com>
 <97e02ced-a5e4-a0d7-0435-124fff9f5dca@suse.com>
 <b296a252-a79c-8e61-c919-9ee4edef06be@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6304a293-41d3-ceca-ab35-9e674e373f3f@suse.com>
Date: Fri, 13 Mar 2020 10:39:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <b296a252-a79c-8e61-c919-9ee4edef06be@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/9] x86/HVM: reduce domain.h include
 dependencies
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Alexandru Isaila <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel de Graaf <dgdegra@tycho.nsa.gov>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDMuMjAyMCAxNDowOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMC8wMy8yMDIw
IDE1OjQ4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gRHJvcCAjaW5jbHVkZS1zIG5vdCBuZWVkZWQg
YnkgdGhlIGhlYWRlciBpdHNlbGYuIFB1dCB0aGUgb25lcyBuZWVkZWQKPj4gaW50byB3aGljaGV2
ZXIgb3RoZXIgZmlsZXMgYWN0dWFsbHkgbmVlZCB0aGVtLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IC0tLQo+PiB2MjogQWxzbyBtYWtlIHRo
aW5ncyBidWlsZCB3aXRoIFhTTT15Lgo+IAo+IExvb2tpbmcgYmV0dGVyLCBidXQgc3RpbGwgZ290
IHByb2JsZW1zLgo+IAo+IHhlbl9wdl9jb25zb2xlLmM6IEluIGZ1bmN0aW9uIOKAmHB2X2NvbnNv
bGVfaW5pdOKAmToKPiB4ZW5fcHZfY29uc29sZS5jOjUxOjM3OiBlcnJvcjog4oCYSFZNX1BBUkFN
X0NPTlNPTEVfUEZO4oCZIHVuZGVjbGFyZWQgKGZpcnN0Cj4gdXNlIGluIHRoaXMgZnVuY3Rpb24p
Cj4gwqDCoMKgwqAgciA9IHhlbl9oeXBlcmNhbGxfaHZtX2dldF9wYXJhbShIVk1fUEFSQU1fQ09O
U09MRV9QRk4sICZyYXdfcGZuKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXn5+fn5+fn5+fn5+fn5+fn5+
fn5+Cj4gCj4gYW5kCj4gCj4gc2hpbS5jOiBJbiBmdW5jdGlvbiDigJhwdl9zaGltX2ZpeHVwX2U4
MjDigJk6Cj4gc2hpbS5jOjE0ODoyMDogZXJyb3I6IOKAmEhWTV9QQVJBTV9TVE9SRV9QRk7igJkg
dW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluCj4gdGhpcyBmdW5jdGlvbikKPiDCoMKgwqDCoCBNQVJL
X1BBUkFNX1JBTShIVk1fUEFSQU1fU1RPUkVfUEZOKTsKCkluIGEgbGF0ZXIgcmVwbHkgKHdoaWNo
IEkndmUgbG9zdCBkdWUgdG8gbWFpbGJveCBwcm9ibGVtcykgeW91J3ZlCmJlZW4gc3VnZ2VzdGlu
ZyBhbGx5ZXNjb25maWcuIEknZCBiZWVuIGNvbnNpZGVyaW5nIHRvIHVzZSBpdCBpbmRlZWQsCmJ1
dCB0aGVuIGZvcmdvdC4gVG9nZXRoZXIgd2l0aCBjaG9pY2VzIHRob3VnaCBJJ20gdW5jb252aW5j
ZWQgdGhpcwp3b3VsZCBwcm92aWRlIGJyb2FkIGVub3VnaCBjb3ZlcmFnZS4gSSdkIGFsc28gc2lt
aWxhcmx5IHdvbmRlcgp3aGV0aGVyIGFsbG5vY29uZmlnIG1pZ2h0IG5vdCBiZSBtb3JlIHRlbGxp
bmcsIGFzIGl0IG1pZ2h0IHJlc3VsdAppbiBmZXdlciB0aGluZ3MgZ2V0dGluZyBpbmNsdWRlZCBo
ZXJlIGFuZCB0aGVyZS4gSSdsbCBtYWtlIHN1cmUKYm90aCBidWlsZCBmaW5lIGJlZm9yZSBzZW5k
aW5nIHYzLCBidXQgSSdtIGhhdmluZyB0cm91YmxlIHNlZWluZwpob3cgSSB3b3VsZCBpbnZva2Ug
dGhlc2UgLSBuZWl0aGVyIHRoZSB0b3AgbGV2ZWwgTWFrZWZpbGUgbm9yCnhlbi9NYWtlZmlsZSBs
b29rIHRvIHBlcm1pdCBpdHMgdXNlIHJpZ2h0IG5vdy4gSGF2ZSB5b3UgZm91bmQgYQp3YXkgdG8g
c3VjY2Vzc2Z1bGx5IHVzZSB0aGVzZSB3aXRob3V0IGZpcnN0IHBhdGNoaW5nIHRoZSB0cmVlPwoK
SmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
