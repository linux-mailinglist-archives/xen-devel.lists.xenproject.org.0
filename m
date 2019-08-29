Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A9CA1269
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 09:14:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3Ebb-0003V6-6Q; Thu, 29 Aug 2019 07:12:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3Eba-0003V0-AR
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 07:12:26 +0000
X-Inumbo-ID: 59959328-ca2c-11e9-ac23-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 59959328-ca2c-11e9-ac23-bc764e2007e4;
 Thu, 29 Aug 2019 07:12:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B5A82AF56;
 Thu, 29 Aug 2019 07:12:23 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190814104404.17739-1-andrew.cooper3@citrix.com>
 <c5fa4def-f574-e37e-1973-02a3d1931c2d@suse.com>
 <e36fc4bb-0a7a-9e0b-337d-8ae8d2f01adc@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d54a5a6e-46cc-849d-2c97-94c438d81bbe@suse.com>
Date: Thu, 29 Aug 2019 09:12:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e36fc4bb-0a7a-9e0b-337d-8ae8d2f01adc@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/boot: Annotate pagetables with
 STT_OBJECT
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

T24gMjguMDguMjAxOSAyMDoyNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyNy8wOC8yMDE5
IDE1OjM2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTQuMDguMjAxOSAxMjo0NCwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IEludHJvZHVjZSBhIG5ldyBFTkREQVRBKCkgaGVscGVyIHdoaWNo
IHNldHMgdHlwZSBhbmQgc2l6ZSB0b2dldGhlci4KPj4KPj4gRXhjZXB0IHRoaXMgaXNuJ3QgdmVy
eSBuYXR1cmFsOiBTZXR0aW5nIHRoZSBzaXplIGxhdGUgaXMgcXVpdGUKPj4gY29tbW9uLCB0byBh
dm9pZCB0aGUgbmVlZCBmb3IgYW4gImVuZCIgbGFiZWwuIEJ1dCB0aGUgdHlwZSB3b3VsZAo+PiBi
ZXR0ZXIgYmUgc2V0IHRvZ2V0aGVyIHdpdGggdGhlIGxhYmVsIGRlZmluaXRpb24sIGkuZS4gYnkg
YQo+PiBHTE9CQUwoKSBjb3VudGVycGFydCAoZS5nLiBHTE9CQUxfREFUQSgpKS4gSG93ZXZlciwg
aWYgZGVzcGl0ZQo+PiB0aGlzIHJlbWFyayB5b3UgdGhpbmsgeW91ciBhcHByb2FjaCBpcyB0aGUg
d2F5IHRvIGdvOgo+IAo+IFdlbGwgLSB0aGlzIHdheSBpcyBmZXdlciBtb3ZpbmcgcGFydHMuCj4g
Cj4gR0xPQkFMIGFuZCBFTlRSWSBhcmUgdG8gZG8gd2l0aCB2aXNpYmlsaXR5IGFuZCBhbGlnbm1l
bnQuwqAgV2hpbGUgRU5UUlkKPiBtaWdodCBub3QgdHlwaWNhbGx5IGJlIHVzZWQgZm9yIGRhdGEs
IGJvdGggYXJlIGNvbW1vbmx5IHVzZWQgZm9yIGNvZGUuCj4gCj4gV2UgY2FuIGVpdGhlciBoYXZl
IGEgcHJvbGlmZXJhdGlvbiBvZiB7R0xPQkFMLEVOVFJZfXssX0RBVEEsX0ZVTkMsZXRjfQo+IGFu
ZCBhIHNpbmdsZSBFTkQsIG9yIHdlIGNhbiBoYXZlIEVORERBVEEvRU5ERlVOQyBhbmQgbmVlZCBu
byBjaGFuZ2VzIHRvCj4gdGhlIGV4aXN0aW5nIEdMT0JBTC9FTlRSWSBpbmZyYXN0cnVjdHVyZS4K
ClllcywgaXQncyBzbGlnaHRseSBtb3JlIG9mIGEgY2hhbmdlIHRoZSB3YXkgSSdkIHByZWZlciwg
YnV0IGFzIHNhaWQsCml0IHdvdWxkIChpbW8pIHlpZWxkIGEgbW9yZSBuYXR1cmFsIHJlc3VsdC4g
T21pc3Npb24gb2YgRU5EKCkgd291bGQKdGhlbiBtZWFuIG9ubHkgdGhlIHN5bWJvbCdzIHNpemUg
dG8gbm90IGJlIHNldCwgYnV0IGFsbCBvdGhlcgphdHRyaWJ1dGVzIHRvIGJlIGNvcnJlY3QgbmV2
ZXJ0aGVsZXNzLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
