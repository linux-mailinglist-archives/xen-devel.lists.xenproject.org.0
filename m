Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A26C7F2DB5
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 12:50:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSgFr-0004ZM-7B; Thu, 07 Nov 2019 11:47:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jh7D=Y7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iSgFp-0004ZH-Hh
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 11:47:09 +0000
X-Inumbo-ID: 53cccd1c-0154-11ea-a1c2-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 53cccd1c-0154-11ea-a1c2-12813bfff9fa;
 Thu, 07 Nov 2019 11:47:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BF339AF40;
 Thu,  7 Nov 2019 11:47:07 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <db66edf2-ca66-4127-8920-ba55f4aee14e@suse.com>
 <7045df66-009d-6c9f-8e8d-cfd058c29131@suse.com>
 <3836ccda-3184-1135-2b6f-53dce5507f65@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <78055525-7158-ee5b-3f9d-6ba47881f548@suse.com>
Date: Thu, 7 Nov 2019 12:47:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3836ccda-3184-1135-2b6f-53dce5507f65@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/3] introduce GFN notification for
 translated domains
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
Cc: Juergen Gross <jgross@suse.com>, StefanoStabellini <sstabellini@kernel.org>,
 JulienGrall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Sander Eikelenboom <linux@eikelenboom.it>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMTEuMjAxOSAxMjozNSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAxMS82LzE5IDM6
MTkgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBJbiBvcmRlciBmb3IgaW5kaXZpZHVhbCBJT01N
VSBkcml2ZXJzIChhbmQgZnJvbSBhbiBhYnN0cmFjdCBwb3YgYWxzbwo+PiBhcmNoaXRlY3R1cmVz
KSB0byBiZSBhYmxlIHRvIGFkanVzdCB0aGVpciBkYXRhIHN0cnVjdHVyZXMgYWhlYWQgb2YgdGlt
ZQo+PiB3aGVuIHRoZXkgbWlnaHQgY292ZXIgb25seSBhIHN1Yi1yYW5nZSBvZiBhbGwgcG9zc2li
bGUgR0ZOcywgaW50cm9kdWNlCj4+IGEgbm90aWZpY2F0aW9uIGNhbGwgdXNlZCBieSB2YXJpb3Vz
IGNvZGUgcGF0aHMgcG90ZW50aWFsbHkgaW5zdGFsbGluZyBhCj4+IGZyZXNoIG1hcHBpbmcgb2Yg
YSBuZXZlciB1c2VkIEdGTiAoZm9yIGEgcGFydGljdWxhciBkb21haW4pLgo+IAo+IFNvIHRyeWlu
ZyB0byByZXZlcnNlIGVuZ2luZWVyIHdoYXQncyBnb2luZyBvbiBoZXJlLCB5b3UgbWVhbiB0byBz
YXkKPiBzb21ldGhpbmcgbGlrZSB0aGlzOgo+IAo+IC0tLQo+IEluZGl2aWR1YWwgSU9NTVUgZHJp
dmVycyBjb250YWluIGFkanVjdCBkYXRhIHN0cnVjdHVyZXMgZm9yIGdmbiByYW5nZXMKPiBjb250
YWluZWQgaW4gdGhlIG1haW4gcDJtLiAgRm9yIGVmZmljaWVuY3ksIHRoZXNlIGFkanVjdCBkYXRh
IHN0cnVjdHVyZXMKPiBvZnRlbiBjb3ZlciBvbmx5IGEgc3Vic2V0IG9mIHRoZSBnZm4gcmFuZ2Uu
ICBJbnN0YWxsaW5nIGEgZnJlc2ggbWFwcGluZwo+IG9mIGEgbmV2ZXItdXNlZCBnZm4gbWF5IHJl
cXVpcmUgdGhlc2UgcmFuZ2VzIHRvIGJlIGV4cGFuZGVkLiAgRG9pbmcgdGhpcwo+IHdoZW4gdGhl
IHAybSBlbnRyeSBpcyBmaXJzdCB1cGRhdGVkIG1heSBiZSBwcm9ibGVtYXRpYyBiZWNhdXNlIDxy
ZWFzb25zPi4KPiAKPiBUbyBmaXggdGhpcywgaW1wbGVtZW50IG5vdGlmeV9nZm4oKSwgdG8gYmUg
Y2FsbGVkIHdoZW4gWGVuIGZpcnN0IGJlY29tZXMKPiBhd2FyZSB0aGF0IGEgcG90ZW50aWFsbHkg
bmV3IGdmbiBtYXkgYmUgYWJvdXQgdG8gYmUgdXNlZC4gIFRoaXMgd2lsbAo+IG5vdGlmeSB0aGUg
SU9NTVUgZHJpdmVyIGFib3V0IHRoZSBuZXcgZ2ZuLCBhbGxvd2luZyBpdCB0byBleHBhbmQgdGhl
Cj4gZGF0YSBzdHJ1Y3R1cmVzLiAgSXQgbWF5IHJldHVybiAtRVJFU1RBUlQgKD8pIGZvciBsb25n
LXJ1bm5pbmcKPiBvcGVyYXRpb25zLCBpbiB3aGljaCBjYXNlIHRoZSBvcGVyYXRpb24gc2hvdWxk
IGJlIHJlc3RhcnRlZCBvciBhCj4gZGlmZmVyZW50IGVycm9yIGlmIHRoZSBleHBhbnNpb24gb2Yg
dGhlIGRhdGEgc3RydWN0dXJlIGlzIG5vdCBwb3NzaWJsZS4KPiAgSW4gdGhlIGxhdHRlciBjYXNl
LCB0aGUgZW50aXJlIG9wZXJhdGlvbiBzaG91bGQgZmFpbC4KPiAtLS0KPiAKPiBJcyB0aGF0IGFi
b3V0IHJpZ2h0PwoKV2l0aCB0aGUgZXhjZXB0aW9uIG9mIHRoZSAtRVJFU1RBUlQgLyBsb25nIHJ1
bm5pbmcgb3BlcmF0aW9ucyBhc3BlY3QsCnllcy4gUGx1cyBhc3N1bWluZyB5b3UgbWVhbiAiYWRq
dW5jdCIgKG5vdCAiYWRqdWN0Iiwgd2hpY2ggbXkKZGljdGlvbmFyeSBkb2Vzbid0IGtub3cgYWJv
dXQpLgoKPiAgTm90ZSBJJ3ZlIGhhZCB0byBtYWtlIGEgbG90IG9mIGd1ZXNzZXMgaGVyZSBhYm91
dAo+IHRoZSBmdW5jdGlvbmFsaXR5IGFuZCBpbnRlbnQuCgpXZWxsLCBldmVuIGFmdGVyIHNlZWlu
ZyB5b3VyIGxvbmdlciBkZXNjcmlwdGlvbiwgSSBkb24ndCBzZWUgd2hhdCBtaW5lCmRvZXNuJ3Qg
c2F5LgoKPj4gTm90ZSB0aGF0IGluIGdudHRhYl90cmFuc2ZlcigpIHRoZSBub3RpZmljYXRpb24g
YW5kIGxvY2sgcmUtYWNxdWlyZQo+PiBoYW5kbGluZyBpcyBiZXN0IGVmZm9ydCBvbmx5ICh0aGUg
Z3Vlc3QgbWF5IG5vdCBiZSBhYmxlIHRvIG1ha2UgdXNlIG9mCj4+IHRoZSBuZXcgcGFnZSBpbiBj
YXNlIG9mIGZhaWx1cmUsIGJ1dCB0aGF0J3MgaW4gbGluZSB3aXRoIHRoZSBsYWNrIG9mIGEKPj4g
cmV0dXJuIHZhbHVlIGNoZWNrIG9mIGd1ZXN0X3BoeXNtYXBfYWRkX3BhZ2UoKSBpdHNlbGYpLgo+
IAo+IElzIHRoZXJlIGEgcmVhc29uIHdlIGNhbid0IGp1c3QgcmV0dXJuIGFuIGVycm9yIHRvIHRo
ZSBjYWxsZXI/CgpSb2xsaW5nIGJhY2sgd2hhdCBoYXMgYmVlbiBkb25lIGJ5IHRoYXQgcG9pbnQg
d291bGQgc2VlbSByYXRoZXIKZGlmZmljdWx0LCB3aGljaCBJIGd1ZXNzIGlzIHRoZSByZWFzb24g
d2h5IHRoZSBjb2RlIHdhcyB3cml0dGVuIHRoZQp3YXkgaXQgaXMgKHByaW9yIHRvIG15IGNoYW5n
ZSkuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
