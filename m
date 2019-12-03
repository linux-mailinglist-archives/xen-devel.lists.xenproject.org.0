Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D81D10FC65
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 12:19:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ic6AM-0008BB-Lv; Tue, 03 Dec 2019 11:16:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zSMg=ZZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ic6AL-0008B6-9d
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 11:16:25 +0000
X-Inumbo-ID: 5771da06-15be-11ea-a55d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5771da06-15be-11ea-a55d-bc764e2007e4;
 Tue, 03 Dec 2019 11:16:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F01ADB25D;
 Tue,  3 Dec 2019 11:16:23 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191202112946.25461-1-roger.pau@citrix.com>
 <886dbb28-4729-7bb4-b40a-2e10e803e152@suse.com>
 <20191203110422.GE980@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <58903177-d673-dcd6-b68a-500605aa50e8@suse.com>
Date: Tue, 3 Dec 2019 12:16:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191203110422.GE980@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] x86: re-order clang no integrated
 assembler tests
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 DougGoldstein <cardoe@cardoe.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMTIuMjAxOSAxMjowNCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUdWUsIERl
YyAwMywgMjAxOSBhdCAxMTowMzozMUFNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gRnVy
dGhlcm1vcmUgSSB0aGluayB0aGlzIG1vdmluZyBhcm91bmQgb2YgbG9naWMgKHdoaWNoIGltbwo+
PiB3b3VsZCBiZXR0ZXIgcmVtYWluIGF0IHRoZSBib3R0b20gb2YgdGhlIGZpbGUsIHdlbGwgb3V0
IG9mCj4+IHNpZ2h0KSBpcyBvbmx5IHRoZSBzZWNvbmQgYmVzdCBzb2x1dGlvbiB0byB0aGUgaXNz
dWUuIFRoZQo+PiByZWFzb24gSSBkaWRuJ3Qgbm90aWNlIHRoZSBicmVha2FnZSB3YXMgYmVjYXVz
ZSBJIGhhZCBub3RpY2VkCj4+IHdoYXQgbWFkZSBtZSBjcmVhdGUgdGhlIHBhdGNoIGluIHF1ZXN0
aW9uIG9ubHkgd2hpbGUgcHV0dGluZwo+PiB0b2dldGhlciBhIGNoYW5nZSBtb3Zpbmcgb3V0IHRo
ZSBtYWpvcml0eSBvZiB0aGUgYXMtb3B0aW9uLWFkZAo+PiBpbnZvY2F0aW9ucywgcHJpbWFyaWx5
IHdpdGggdGhlIGdvYWwgb2Ygbm90IGhhdmluZyB0aGUKPj4gY29tcGlsZXIgaW52b2tlZCBvdmVy
IGFuZCBvdmVyIGp1c3QgdG8gY2FsY3VsYXRlIENGTEFHUy4gSQo+PiBkaWRuJ3QgcG9zdCB0aGlz
IGNoYW5nZSB5ZXQgc2ltcGx5IGJlY2F1c2UgSSB3YW50ZWQgdG8gZ2l2ZSBpdAo+PiBzb21lIG1v
cmUgKGxvY2FsKSB0ZXN0aW5nLgo+IAo+IExvb2tzIGxpa2UgYW4gaW1wcm92ZW1lbnQsIGJ1dCBo
b3cgZG8geW91IHBsYW4gdG8gYWNoaWV2ZSB0aGUgc2FtZT8KPiAKPiBBcmUgdGhlcmUgc29tZSBj
b21waWxlci9hc3NlbWJsZXIgaGludHMgYXZhaWxhYmxlIGF0IGJ1aWxkIHRpbWUgYWJvdXQKPiB3
aGljaCBmZWF0dXJlcyBhcmUgc3VwcG9ydGVkPwoKTm8sIEknbSBjaGFuZ2luZyB0aGUgbWVjaGFu
aXNtIGFsdG9nZXRoZXIuIFRoZSB2YXJpb3VzIEhBVkVfQVNfKgp3aWxsIGJlIHB1dCBpbiBhIGdl
bmVyYXRlZCBoZWFkZXIgZmlsZSBpbnN0ZWFkLiBJdHMgZ2VuZXJhdGlvbgoob2J2aW91c2x5KSBo
YXBwZW5zIHdpdGggQ0ZMQUdTIGFscmVhZHkgaW4gZmluYWwgc2hhcGUuCgo+PiBBbm90aGVyIHJl
YXNvbiB0byBrZWVwIHRoaXMgYXQgdGhlIGJvdHRvbSBvZiB0aGUgZmlsZSBpcyB0aGF0Cj4+IG90
aGVyIENGTEFHUyBhZGRpdGlvbnMgd291bGRuJ3QgaGF2ZSBoYXBwZW5lZCB5ZXQgYXQgdGhlCj4+
IHBsYWNlIHRoZSBjaGVja3MgbGl2ZSBub3cuCj4gCj4gUmlnaHQsIGJ1dCBpdCdzIHVubGlrZWx5
IHRoYXQgQ0ZMQUdTIGNhbiBpbmZsdWVuY2Ugd2hldGhlciB0aGUKPiBpbnRlcm5hbCBhc3NlbWJs
ZXIgaXMgY2FwYWJsZSBvZiBidWlsZGluZyBYZW4gb3Igbm90LCB3aGlsZSBpdCdzIElNTwo+IG1v
cmUgbGlrZWx5IHRoYXQgdXNpbmcgdGhlIGludGVybmFsIG9yIGFuIGV4dGVybmFsIGFzc2VtYmxl
ciBjYW4gbGVhZAo+IHRvIGEgZGlmZmVyZW50IHNldCBvZiBDRkxBR1MgKGFzIENGTEFHUyBhbHNv
IGluY2x1ZGUgb3B0aW9ucyB0aGF0Cj4gYWZmZWN0IHRoZSBhc3NlbWJsZXIpLgoKRm9yIHNpbXBs
ZSBjaGVja3MgYWdhaW5zdCBpbnNucyBiZWluZyBrbm93biBJIGFncmVlLiBCdXQgYWxyZWFkeQpz
b21ldGhpbmcgbGlrZQoKIyBTZXQgdXAgdGhlIGFzc2VtYmxlciBpbmNsdWRlIHBhdGggcHJvcGVy
bHkgZm9yIG9sZGVyIHRvb2xjaGFpbnMuCkNGTEFHUyArPSAtV2EsLUkkKEJBU0VESVIpL2luY2x1
ZGUKCmNvdWxkIG1ha2UgYSBkaWZmZXJlbmNlLCBpZiBhIG1vcmUgY29tcGxleCBjaGVjayBpbnZv
bHZlZAppbmNsdWRpbmcgc29tZSBvdGhlciBmaWxlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
