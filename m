Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB31D0B56
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 11:35:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iI8KA-0004tk-9h; Wed, 09 Oct 2019 09:32:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GB/u=YC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iI8K9-0004tf-3c
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 09:32:01 +0000
X-Inumbo-ID: a45ed796-ea77-11e9-9bee-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a45ed796-ea77-11e9-9bee-bc764e2007e4;
 Wed, 09 Oct 2019 09:31:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B1FF5ACB9;
 Wed,  9 Oct 2019 09:31:58 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <09d5e0bc-074e-90c5-f0a6-60e1be23d92f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <67e9bc2c-82dc-5fd7-9b8c-29d564a30ddb@suse.com>
Date: Wed, 9 Oct 2019 11:31:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <09d5e0bc-074e-90c5-f0a6-60e1be23d92f@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] HPET interrupt remapping during boot
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMTAuMjAxOSAyMDozMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBIZWxsbywKPiAKPiBJ
IGhhdmUgbm8gaWRlYSBpZiB0aGlzIGlzIGEgcmVncmVzc2lvbiBvciBub3QuwqAgSSBzdXNwZWN0
IGl0IG1pZ2h0IG5vdAo+IGJlLCBhbmQgaGFzIGFsd2F5cyBiZWVuIGJyb2tlbi4KPiAKPiBFaXRo
ZXIgd2F5LCBJJ20gc2VlaW5nIG9jY2FzaW9uYWwgc2luZ2xlIGludGVycnVwdCByZW1hcHBpbmcg
ZXJyb3JzIHdoZW4KPiBib290aW5nIGEgcmFuZ2Ugb2YgSW50ZWwgc3lzdGVtcwo+IAo+IChYRU4p
IHgyQVBJQyBtb2RlIGlzIGFscmVhZHkgZW5hYmxlZCBieSBCSU9TLgo+IChYRU4pIFVzaW5nIEFQ
SUMgZHJpdmVyIHgyYXBpY19jbHVzdGVyCj4gLi4uCj4gKFhFTikgUGxhdGZvcm0gdGltZXIgaXMg
MjMuOTk5TUh6IEhQRVQKPiAoWEVOKSBEZXRlY3RlZCAyMTk0LjkyMiBNSHogcHJvY2Vzc29yLgo+
IC4uLgo+IChYRU4pIEhWTTogSEFQIHBhZ2Ugc2l6ZXM6IDRrQiwgMk1CLCAxR0IKPiAoWEVOKSBh
bHQgdGFibGUgZmZmZjgyZDA4MDQ3YTA3MCAtPiBmZmZmODJkMDgwNDg2YzZjCj4gKFhFTikgW1ZU
LURdSU5UUi1SRU1BUDogUmVxdWVzdCBkZXZpY2UgWzAwMDA6ZjA6MWYuMF0gZmF1bHQgaW5kZXgg
MCwKPiBpb21tdSByZWcgPSBmZmZmODJjMDAwNzJkMDAwCj4gKFhFTikgW1ZULURdSU5UUi1SRU1B
UDogcmVhc29uIDIyIC0gUHJlc2VudCBmaWVsZCBpbiB0aGUgSVJURSBlbnRyeSBpcyBjbGVhcgo+
IChYRU4pIG1pY3JvY29kZTogQ1BVMiB1cGRhdGVkIGZyb20gcmV2aXNpb24gMHg1MDAwMDIxIHRv
IDB4NTAwMDAyYiwgZGF0ZQo+ID0gMjAxOS0wOC0xMgo+IAo+IEZyb20gb3RoZXIgZGVidWdnaW5n
LCBJIGtub3cgdGhhdCB0aGlzIGhhcHBlbnMgYWZ0ZXIgQ1BVIDEgKHdoaWNoIGlzIGEKPiBoeXBl
cnRocmVhZCkgaGFzIHBhc3NlZCB0aHJvdWdoIHN0YXJ0X3NlY29uZGFyeSgpLgo+IAo+IGYwOjFm
LjAgaXMgb25lIG9mIHRoZSBJTy1BUElDcywgYW5kIGlmIEkndmUgY3Jvc3MgcmVmZXJlbmNlZCB0
aGUgRE1BUgo+IGFuZCBBUElDIHRhYmxlcyBwcm9wZXJseSwgaXMgdGhlIElPLUFQSUMgb24gdGhl
IFBDSCwgbWFraW5nIHRoZQo+IHByb2JsZW1hdGljIElSUSBHU0kwLgo+IAo+IFRoaXMgc3VnZ2Vz
dHMgdGhhdCB3ZSBoYXZlIGFuIGVycm9yIHNldHRpbmcgdXAgdGhlIHRpbWVyIElSUSAoYXMgdGhl
Cj4gSFBFVCBpc24ndCBNU0ktY2FwYWJsZSksIGJ1dCB3ZSBoYXZlIGFscmVhZHkgYWxsZWdlZGx5
IHVzZWQgaXQKPiBzdWNjZXNzZnVsbHkgZWFybGllciBvbiBib290LgoKV2FpdCAtIGlzIHRoaXMg
cmVhbGx5IGEgc3lzdGVtIHdpdGggdGhlIHRpbWVyIGF0IEdTSSAwLCBpLmUuIHdpdGhvdXQKYW4g
aW50ZXJydXB0IHNvdXJjZSBvdmVycmlkZSBsaWtlIHRoaXMgKGFzIHNlZW4gaW4gTGludXggbG9n
cyk6CgpBQ1BJOiBJTlRfU1JDX09WUiAoYnVzIDAgYnVzX2lycSAwIGdsb2JhbF9pcnEgMiBkZmwg
ZGZsKQoKT3RoZXJ3aXNlIGlzbid0IHRoaXMgcmF0aGVyIGFuIEV4dEludCBhcnJpdmluZyB0aHJv
dWdoIHRoZSBQSUM/IFdlCm1hc2sgYWxsIFBJQyBpbnRlcnJ1cHRzIGZpcnN0IHRoaW5nLCBidXQg
SSdtIG5vdCBzdXJlIHRoZXJlIGFyZW4ndApwYXRocyB3aGVyZSB3ZSdkIHVubWFzayBhbnkuIEFk
ZGl0aW9uYWxseSBJIHNlZW0gdG8gdmFndWVseSByZWNhbGwKdGhhdCB0aGUgc3B1cmlvdXMgaW50
ZXJydXB0IGNhbid0IGJlIG1hc2tlZCBhdCB0aGUgUElDLCBhbmQgSSBkbwpyZWNhbGwgc2VlaW5n
IChyYW5kb21seSwgbGlrZSB5b3UpIHNwdXJpb3VzIGludGVycnVwdHMgZHVyaW5nIGJvb3QKKGNh
bid0IHRlbGwgb2ZmaGFuZCB3aGV0aGVyIHRoaXMgd2FzIG9uIEFNRCBhbmQvb3IgSW50ZWwsIGFu
ZApwZXJoYXBzIG9uIElPTU1VLWxlc3Mgc3lzdGVtcyBvbmx5KS4gSSd2ZSBuZXZlciBzZWVuIHRo
b3VnaCB3aGF0CnlvdSBkZXNjcmliZSBoZXJlLgoKVGhlbiBhZ2FpbiB0aGUgbG9nIG1lc3NhZ2Ug
c2F5aW5nICJmYXVsdCBpbmRleCAwIiBkb2Vzbid0IHRlbGwgdXMKd2hhdCB0aGUgR1NJIGlzLCBv
ciB3aGF0IElPLUFQSUMgcGluIHRoZSBJUlEgY2FuIHRocm91Z2guIEFsbCBub3QKeWV0IHNldCB1
cCBJTy1BUElDIFJURXMgd291bGQgc3BlY2lmeSBhIHJlbWFwcGluZyBpbmRleCBvZiB6ZXJvLgpP
ZiBjb3Vyc2UgYWxsIHN1Y2ggSU8tQVBJQyBlbnRyaWVzIG91Z2h0IHRvIGhhdmUgdGhlaXIgbWFz
ayBiaXQKc2V0IC0gcXVlc3Rpb24gaXMgd2hldGhlciB0aGUgc3lzdGVtIGNvbWVzIG91dCBvZiBi
b290IHdpdGggb25lCihwZXJoYXBzIGluZGVlZCBhbiBFeHRJbnQgb25lKSBub3QgbWFza2VkLgoK
SmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
