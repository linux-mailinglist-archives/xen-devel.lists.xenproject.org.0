Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD54312F888
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 13:53:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inMQ9-000300-JC; Fri, 03 Jan 2020 12:51:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1inMQ7-0002zv-RQ
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 12:51:15 +0000
X-Inumbo-ID: b8697092-2e27-11ea-a479-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b8697092-2e27-11ea-a479-12813bfff9fa;
 Fri, 03 Jan 2020 12:51:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A1D2CADEE;
 Fri,  3 Jan 2020 12:51:12 +0000 (UTC)
To: Aaron Janse <aaron@ajanse.me>
References: <4019c78f-6546-4edc-b5c3-1ea471e129ff@www.fastmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2006e043-240d-fede-034c-7898d855f18d@suse.com>
Date: Fri, 3 Jan 2020 13:51:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <4019c78f-6546-4edc-b5c3-1ea471e129ff@www.fastmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [BUG] panic: "IO-APIC + timer doesn't work" -
 several people have reproduced
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEuMTIuMjAxOSAwODo1MiwgIEFhcm9uIEphbnNlICB3cm90ZToKPiBJJ2QgbGlrZSB0byBu
b3RlIHRoYXQgVWJ1bnR1LCB1bmxpa2UgUXViZXMsIGRvZXNuJ3QgbmVlZCB0byB0cnkKPiBhbnkg
YE1QLUJJT1MgYnVnYCBmYWxsYmFja3MuCgoiRG9lc24ndCBuZWVkIHRvIHRyeSIgaXMgc3VwcG9z
ZWQgdG8gbWVhbiB3aGF0PyBUaGF0IGl0IGdldHMgcGFzdAp0aGUgdGltZXIgaW50ZXJydXB0IGlu
aXRpYWxpemF0aW9uLCBtZWFuaW5nIGlmIGl0IGNyYXNoZXMgYW5vdGhlcgp3YXksIGl0J3MgYSBk
aWZmZXJlbnQgcHJvYmxlbT8gT3IgaW5zdGVhZCBtZWFuaW5nIGl0IHdvcmtzCihjb250cmFyeSB0
byBpbmZvcm1hdGlvbiBmb3VuZCBlbHNld2hlcmUpLCBzdWdnZXN0aW5nIHRoZXJlJ3MgYQpRdWJl
cyBzaWRlIGNoYW5nZSBpbnZvbHZlZD8KCj4gIyBUaGluZ3MgdGhhdCBoYXZlIGJlZW4gdHJpZWQK
PiAKPiBEaXNhYmxpbmcgQVBJQyBlbnRpcmVseSAoYG5vYXBpYyB4MmFwaWM9b2ZmYCkKPiAtIFRo
aXMgaXMgYXZvaWRpbmcgdGhlIHByb2JsZW0sIG5vdCBmaXhpbmcgaXQKPiAtIFF1YmVPUyByZXF1
aXJlcyBBUElDIGFueXdheSwgc28gdGhpcyBpcyBub3QgYW4gb3B0aW9uIGZvciBtYW55IG9mIHVz
Cj4gCj4gU3dpdGNoaW5nIHRoZSB0aW1lciB0byBIUEVUICh2aWEgdGhlIGBjbG9ja3NvdXJjZWAg
ZmxhZykKPiAtIFRoaXMgZGlkbid0IGZpeCB0aGUgcGFuaWMgKEkndmUgdHJpZWQgYGFjcGlgIGFu
ZCBgcGl0YCkKPiAtIE9uIG15IFhQUyAxMywgdGhpcyBkb2Vzbid0IGNoYW5nZSBhbnkgb2YgdGhl
IHRpbWVyIGVycm9yIG91dHB1dAo+IC0gVWJ1bnR1IHdvcmtzIG9uIG15IGxhcHRvcCB1c2luZyBI
UEVUCj4gLSBodHRwOi8veGVuYml0cy54ZW4ub3JnL2RvY3MvdW5zdGFibGUvbWlzYy94ZW4tY29t
bWFuZC1saW5lLmh0bWwjY2xvY2tzb3VyY2UteDg2CgpEaWQgeW91IHRyeSBkaXNhYmxpbmcgdXNl
IG9mIHRoZSBJT01NVSAoImlvbW11PTAiIG9uIHRoZSBYZW4KY29tbWFuZCBsaW5lKT8KCj4gVXBk
YXRpbmcgdG8gNS40IExpbnV4IGtlcm5lbCBbNzddCj4gLSBUaGlzIGRpZG4ndCBmaXggdGhlIHBh
bmljCgpBcyBsb25nIGFzIHlvdSBkb24ndCBldmVuIHJlYWNoIERvbTAgaW5pdGlhbGl6YXRpb24s
IG5vIGNoYW5nZQp3aGF0c29ldmVyIHRvIHRoZSBEb20wIGtlcm5lbCB3aWxsIHBvc3NpYmx5IGhl
bHAuCgpJZiB0aGlzIGlzIGFzIGNvbW1vbiBhIHByb2JsZW0gYXMgeW91IHNheSwgaXQncyBoYXJk
IHRvIGJlbGlldmUKdGhpcyBoYXMgbmV2ZXIgd29ya2VkIG9uIGFueSBvZiB0aGVzZSBzeXN0ZW1z
LiBIZW5jZSBpdCB3b3VsZCBiZQpoZWxwZnVsIHRvIGtub3cgc3RhcnRpbmcgZnJvbSB3aGljaCB2
ZXJzaW9uIHRoaXMgaGFzIGJlZW4KcmVncmVzc2VkLgoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
