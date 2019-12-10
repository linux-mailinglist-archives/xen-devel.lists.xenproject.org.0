Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15678118454
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 11:06:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iecN1-0005b1-39; Tue, 10 Dec 2019 10:03:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1mH3=2A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iecN0-0005aw-1a
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 10:03:54 +0000
X-Inumbo-ID: 5eb08562-1b34-11ea-b6f1-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5eb08562-1b34-11ea-b6f1-bc764e2007e4;
 Tue, 10 Dec 2019 10:03:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6E030AC2F;
 Tue, 10 Dec 2019 10:03:52 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191206193429.29165-1-andrew.cooper3@citrix.com>
 <677d8349-ba6f-a90e-99ef-0384180031cf@suse.com>
 <75eeed82-31d7-8f48-6dc5-d4095e11777b@citrix.com>
 <9e5adb48-c837-9b79-805c-839e3be0f130@suse.com>
 <14560f56-e857-c2ab-3d63-eaf8c276a4fc@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7ab08f01-e5c1-ead9-34e8-bd23eba96703@suse.com>
Date: Tue, 10 Dec 2019 11:04:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <14560f56-e857-c2ab-3d63-eaf8c276a4fc@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] docs/sphinx: How Xen Boots on x86
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMTIuMjAxOSAxMDo1NSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMC8xMi8yMDE5
IDA3OjUyLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDkuMTIuMjAxOSAxNzo0MiwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDA5LzEyLzIwMTkgMTU6MjAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IE9uIDA2LjEyLjIwMTkgMjA6MzQsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4+ICtP
YmplY3RzCj4+Pj4+ICt+fn5+fn5+Cj4+Pj4+ICsKPj4+Pj4gK1RvIGJlZ2luIHdpdGgsIG1vc3Qg
b2JqZWN0IGZpbGVzIGFyZSBjb21waWxlZCBhbmQgbGlua2VkLiAgVGhpcyBpbmNsdWRlcyB0aGUK
Pj4+Pj4gK011bHRpYm9vdCAxIGFuZCAyIGhlYWRlcnMgYW5kIGVudHJ5cG9pbnRzLCBpbmNsdWRp
bmcgdGhlIE11bHRpYm9vdCAyIHRhZ3MgZm9yCj4+Pj4+ICtFRkkgZXh0ZW5zaW9ucy4gIFdoZW4g
YGBDT05GSUdfUFZIX0dVRVNUYGAgaXMgc2VsZWN0ZWQgYXQgYnVpbGQgdGltZSwgdGhpcwo+Pj4+
PiAraW5jbHVkZXMgdGhlIFBWSCBlbnRyeXBvaW50IGFuZCBhc3NvY2lhdGVkIEVMRiBub3Rlcy4K
Pj4+Pj4gKwo+Pj4+PiArRGVwZW5kaW5nIG9uIHdoZXRoZXIgdGhlIGNvbXBpbGVyIHN1cHBvcnRz
IGBgX19hdHRyaWJ1dGVfXygoX19tc19hYmlfXykpYGAgb3IKPj4+Pj4gK25vdCwgZWl0aGVyIGFu
IEVGSSBzdHViIGlzIGluY2x1ZGVkIHdoaWNoIG5vcHMvZmFpbHMgYXBwbGljYWJsZSBzZXR1cCBj
YWxscywKPj4+Pj4gK29yIGZ1bGwgRUZJIHN1cHBvcnQgaXMgaW5jbHVkZWQuCj4+Pj4gUGVyaGFw
cyBhbHNvIG1lbnRpb24gdGhhdCB0aGUgbGlua2VyIG5lZWRzIHRvIHN1cHBvcnQgdGhlIG5lY2Vz
c2FyeQo+Pj4+IGJpbmFyeSBvdXRwdXQgZm9ybWF0PyBBbmQgcGVyaGFwcyAic2V0dXAgYW5kIHJ1
bnRpbWUgY2FsbHMiPwo+Pj4gTGluayB0aW1lIGJlaGF2aW91ciBpcyAoZGVsaWJlcmF0ZWx5KSBp
biBhIGxhdGVyIHNlY3Rpb24uCj4+IEkgcmVhbGl6ZShkKSB0aGlzLCBidXQgdGhlIHN0YXRlbWVu
dCBhYm92ZSBpcyBzaW1wbHkgbm90IHRydWUgd2l0aG91dAo+PiBhbHNvIG1lbnRpb25pbmcgcmVx
dWlyZWQgbGlua2VyIGNhcGFiaWxpdGllczogVGhlIG9iamVjdCBmaWxlcyB3b24ndAo+PiBoYXZl
ICJmdWxsIEVGSSBzdXBwb3J0IGluY2x1ZGVkIiBpbiB0aGlzIGNhc2UuIFNvIEknZCBleHBlY3Qg
YSAic2VlCj4+IGFsc28iIGhlcmUgYXQgdGhlIHZlcnkgbGVhc3QuCj4gCj4gTm90ZSBob3cgWEVO
X0JVSUxEX0VGSSBhbmQgWEVOX0JVSUxEX1BFIGFyZSBkaWZmZXJlbnQsIG9uZSBieSBjb21waWxl
cgo+IHN1cHBvcnQgZm9yIG1zX2FiaSwgYW5kIG9uZSBieSBsaW5rZXIgc3VwcG9ydCBmb3IgaTM4
NnBlcC4KPiAKPiBMaW5rZXIgc3VwcG9ydCBmb3IgaTM4NnBlcCBpcyBub3QgcmVxdWlyZWQgYXQg
YWxsIHRvIGdldCBFRkkgc3VwcG9ydCBpbgo+IFhlbi7CoCBUaGlzIGlzIGhvdyB0aGUgTUIyK0VG
SSBwYXRoIGlzIGNvbnN0cnVjdGVkLgoKSG1tLCBpbmRlZWQuIE1lYW5pbmcgdGhlIGJ1aWxkIHJl
cG9ydGluZyAiRUZJIHN1cHBvcnQgZGlzYWJsZWQiIGhhcwpiZWVuIHdyb25nIHNpbmNlIHRoZSBz
cGxpdHRpbmcgb2YgdGhlIHR3by4gU2hvdWxkIG5vdyBiZSBzb21ldGhpbmcKbGlrZSAiTm90IGdl
bmVyYXRpbmcgeGVuLmVmaSIsIEkgZ3Vlc3MuCgpXaXRoIHRoZSBtaW5vciByZS1zdGF0aW5nIG9m
IDMyLWJpdCBtb2RlIGFuZCB0aGUgUEUzMisgbmFtaW5nCmFkanVzdG1lbnQgdGhlbgpSZXZpZXdl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
