Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AACC5A5022
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 09:46:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4h0L-0008QE-0n; Mon, 02 Sep 2019 07:44:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kzGk=W5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i4h0J-0008Q5-2z
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 07:43:59 +0000
X-Inumbo-ID: 6bb3114e-cd55-11e9-b95f-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6bb3114e-cd55-11e9-b95f-bc764e2007e4;
 Mon, 02 Sep 2019 07:43:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EC61CABD6;
 Mon,  2 Sep 2019 07:43:56 +0000 (UTC)
To: David Woodhouse <dwmw2@infradead.org>
References: <012a0e6de52d8a0ad50b0b784362cf509768990e.camel@infradead.org>
 <20190821163542.172063-1-dwmw2@infradead.org>
 <20190821163542.172063-4-dwmw2@infradead.org>
 <babca242-db4b-ca59-a1c0-bc1948f9c5b0@suse.com>
 <05a88a2bb876b3a165746b91774dc6ee05d86b03.camel@infradead.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <daf8f6f2-aab5-6a4a-e6e4-c10082a70ad4@suse.com>
Date: Mon, 2 Sep 2019 09:44:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <05a88a2bb876b3a165746b91774dc6ee05d86b03.camel@infradead.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 4/5] x86/boot: Copy 16-bit boot variables
 back up to Xen image
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDguMjAxOSAxODoyNSwgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+IE9uIEZyaSwgMjAx
OS0wOC0zMCBhdCAxNzo0MyArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDIxLjA4LjIw
MTkgMTg6MzUsIERhdmlkIFdvb2Rob3VzZSB3cm90ZToKPj4+IEBAIC03NjIsNiArNzczLDExIEBA
IHRyYW1wb2xpbmVfc2V0dXA6Cj4+PiAgICAgICAgICBtb3YgICAgICQoKGJvb3RfdHJhbXBvbGlu
ZV9lbmQgLSBib290X3RyYW1wb2xpbmVfc3RhcnQpIC8gNCksJWVjeAo+Pj4gICAgICAgICAgcmVw
IG1vdnNsICVmczooJWVzaSksJWVzOiglZWRpKQo+Pj4gIAo+Pj4gKyAgICAgICAgLyogQ29weSBi
b290IGRhdGEgdGVtcGxhdGUgdG8gbG93IG1lbW9yeS4gKi8KPj4+ICsgICAgICAgIG1vdiAgICAg
JHN5bV9vZmZzKGJvb3RkYXRhX3N0YXJ0KSwlZXNpCj4+PiArICAgICAgICBtb3YgICAgICQoKGJv
b3RkYXRhX2VuZCAtIGJvb3RkYXRhX3N0YXJ0KSAvIDQpLCVlY3gKPj4+ICsgICAgICAgIHJlcCBt
b3ZzbCAlZnM6KCVlc2kpLCVlczooJWVkaSkKPj4KPj4gQWZhaWN0IG5laXRoZXIgYm9vdGRhdGFf
c3RhcnQgbm9yIGJvb3RkYXRhX2VuZCBhcmUgYWxpZ25lZCwgYW5kIHNvCj4+IHRoZSBkaWZmZXJl
bmNlIGlzbid0IG5lY2Vzc2FyaWx5IGEgbXVsdGlwbGUgb2YgNC4gSW4gZmFjdCB0aGUKPj4gb3Ro
ZXIgKHByZWV4aXN0aW5nKSBtb3ZzbCBsb29rcyB0byBoYXZlIHRoZSBzYW1lIGlzc3VlOyBJIHdv
bmRlcgo+PiBpZiB3ZSBwcm9wYWdhdGUgYmFkIEVESUQgZGF0YSBmb3IgdGhhdCByZWFzb24gb24g
Y2VydGFpbiBidWlsZHMgLwo+PiBpbiBjZXJ0YWluIHZlcnNpb25zLgo+IAo+IEhtLCBJJ20gbm90
IHN1cmUgSSBxdWl0ZSByZWFsaXNlZCB0aGUgZGlzdGluY3Rpb24gYmV0d2Vlbgo+IGJvb3RkYXRh
X3N0YXJ0IGFuZCBfX2Jvb3RkYXRhX3N0YXJ0IChhbmQgbGlrZXdpc2UgX2VuZCkuCj4gCj4gTm93
IHRoYXQgdGhpbmdzIGFyZSBwbGFjZWQgaW4gdGhlIC5kYXRhLmJvb3QxNiBzZWN0aW9uIGJ5Cj4g
LnB1c2hzZWN0aW9uLy5wb3BzZWN0aW9uIGNhbiB3ZSByZWx5IG9uIHRoZSBvcmRlcmluZywgYW5k
IHRoYXQgdGhlCj4gZ2xvYmFscyBpbiB0aGUgLlMgZmlsZXMgYXJlIGFjdHVhbGx5IGF0IHRoZSBz
dGFydCBhbmQgZW5kPwoKUmlnaHQgbm93IEkgdGhpbmsgd2UgY2FuOyBhcyB5b3Ugc2F5IGZ1cnRo
ZXIgZG93biB3ZSBtYXkgbm90IHdhbnQgdG8KdGhvdWdoLgoKPiBJIHRob3VnaHQgd2UgKm5lZWRl
ZCogdG8gdXNlIHRoZSBvbmVzIGluIHRoZSBsaW5rZXIgc2NyaXB0LCBhbmQgd2hhdCBJCj4gc2hv
dWxkIHByb2JhYmx5IGRvIGhlcmUgaXMga2lsbCBib290ZGF0YV9zdGFydC9ib290ZGF0YV9lbmQg
Y29tcGxldGVseQo+IGFuZCByZWx5IG9ubHkgb24gdGhlIG9uZXMgZnJvbSB0aGUgbGlua2VyIHNj
cmlwdD8KPiAKPiBFaXRoZXIgdGhhdCBvciBJIHNob3VsZCBraWxsIHRoZSBvbmVzIGluIHRoZSBs
aW5rZXIgc2NyaXB0IGNvbXBsZXRlbHkuCgpSaWdodCwganVzdCBvbmUgcGFpciBzaG91bGQgc3Vy
dml2ZS4gQW5kIHNlZWluZyBob3cgdGhpbmdzIHdvcmsgYmVmb3JlCnRoaXMgc2VyaWVzIEkgdGhp
bmsgaXQgaW5kZWVkIHNob3VsZCBiZSBsaW5rZXIgc2NyaXB0IHN5bWJvbHMgb25seS4KQW5kIHRo
ZW4gdGhlIEFMSUdOKCkgYWhlYWQgb2YgdGhlICJzdGFydCIgb25lcyBzaG91bGQgc3RheSwgYnV0
IHRoZXJlJ3MKbm8gbmVlZCBmb3Igb25lIG9uIHRoZSAiZW5kIiBvbmVzIChhZ2FpbiBhcyBpcyBj
dXJyZW50bHkgdGhlIGNhc2UpLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
