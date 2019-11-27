Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF6010AFCD
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 13:53:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZwlP-0002ZL-Ad; Wed, 27 Nov 2019 12:49:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bRVm=ZT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iZwlN-0002ZG-RJ
 for xen-devel@lists.xen.org; Wed, 27 Nov 2019 12:49:45 +0000
X-Inumbo-ID: 627975ac-1114-11ea-83b8-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 627975ac-1114-11ea-83b8-bc764e2007e4;
 Wed, 27 Nov 2019 12:49:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3F753B44B;
 Wed, 27 Nov 2019 12:49:43 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>, xen-devel@lists.xen.org
References: <20191127100430.9635-1-sergey.dyasli@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <c35f3c62-a229-55f8-ee7c-e0ce6dad8d86@suse.com>
Date: Wed, 27 Nov 2019 13:49:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191127100430.9635-1-sergey.dyasli@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 for 4.13] x86/microcode: refuse to load
 the same revision ucode
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Chao Gao <chao.gao@intel.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMTEuMTkgMTE6MDQsIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4gQ3VycmVudGx5IGlmIGEg
dXNlciB0cmllcyB0byBsaXZlLWxvYWQgdGhlIHNhbWUgb3Igb2xkZXIgdWNvZGUgcmV2aXNpb24K
PiB0aGFuIENQVSBhbHJlYWR5IGhhcywgaGUgd2lsbCBnZXQgYSBzaW5nbGUgbWVzc2FnZSBpbiBY
ZW4gbG9nIGxpa2U6Cj4gCj4gICAgICAoWEVOKSAxMjggY29yZXMgYXJlIHRvIHVwZGF0ZSB0aGVp
ciBtaWNyb2NvZGUKPiAKPiBObyBhY3R1YWwgdWNvZGUgbG9hZGluZyB3aWxsIGhhcHBlbiBhbmQg
dGhpcyBzaXR1YXRpb24gY2FuIGJlIHF1aXRlCj4gY29uZnVzaW5nLiBGaXggdGhpcyBieSBzdGFy
dGluZyB1Y29kZSB1cGRhdGUgb25seSB3aGVuIHRoZSBwcm92aWRlZAo+IHVjb2RlIHJldmlzaW9u
IGlzIGhpZ2hlciB0aGFuIHRoZSBjdXJyZW50bHkgY2FjaGVkIG9uZSAoaWYgYW55KS4KPiBUaGlz
IGlzIGJhc2VkIG9uIHRoZSBwcm9wZXJ0eSB0aGF0IGlmIG1pY3JvY29kZV9jYWNoZSBleGlzdHMs
IGFsbCBDUFVzCj4gaW4gdGhlIHN5c3RlbSBzaG91bGQgaGF2ZSBhdCBsZWFzdCB0aGF0IHVjb2Rl
IHJldmlzaW9uLgo+IAo+IEFkZGl0aW9uYWxseSwgcHJpbnQgYSB1c2VyIGZyaWVuZGx5IG1lc3Nh
Z2UgaWYgbm8gbWF0Y2hpbmcgb3IgbmV3ZXIKPiB1Y29kZSBjYW4gYmUgZm91bmQgaW4gdGhlIHBy
b3ZpZGVkIGJsb2IuIFRoaXMgYWxzbyByZXF1aXJlcyBpZ25vcmluZwo+IC1FTk9EQVRBIGluIEFN
RC1zaWRlIGNvZGUsIG90aGVyd2lzZSB0aGUgbWVzc2FnZSBnaXZlbiB0byB0aGUgdXNlciBpczoK
PiAKPiAgICAgIChYRU4pIFBhcnNpbmcgbWljcm9jb2RlIGJsb2IgZXJyb3IgLTYxCj4gCj4gV2hp
Y2ggYWN0dWFsbHkgbWVhbnMgdGhhdCBhIHVjb2RlIGJsb2Igd2FzIHBhcnNlZCBmaW5lLCBidXQg
bm8gbWF0Y2hpbmcKPiB1Y29kZSB3YXMgZm91bmQuCj4gCj4gU2lnbmVkLW9mZi1ieTogU2VyZ2V5
IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPgo+IFJldmlld2VkLWJ5OiBDaGFvIEdh
byA8Y2hhby5nYW9AaW50ZWwuY29tPgo+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+CgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
