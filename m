Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3910F15306C
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 13:11:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izJUR-0007Zm-9X; Wed, 05 Feb 2020 12:09:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=n2Y8=3Z=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1izJUP-0007Zh-96
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 12:09:05 +0000
X-Inumbo-ID: 4d8f6790-4810-11ea-90e0-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4d8f6790-4810-11ea-90e0-12813bfff9fa;
 Wed, 05 Feb 2020 12:09:04 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1izJUN-0004OO-K6; Wed, 05 Feb 2020 12:09:03 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1izJUN-0006Un-7q; Wed, 05 Feb 2020 12:09:03 +0000
Date: Wed, 5 Feb 2020 12:09:00 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200205120900.3eafvayolnbe7arb@debian>
References: <20200204153704.15934-1-liuwe@microsoft.com>
 <20200204153704.15934-2-liuwe@microsoft.com>
 <a44595da-5039-49bc-4d5e-83c4442456be@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a44595da-5039-49bc-4d5e-83c4442456be@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v7 01/10] x86/hypervisor: make
 hypervisor_ap_setup return an error code
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMDUsIDIwMjAgYXQgMTI6MTI6MzBQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDQuMDIuMjAyMCAxNjozNiwgV2VpIExpdSB3cm90ZToKPiA+IEBAIC0yMTUsMTgg
KzIyMCwxOSBAQCBzdGF0aWMgdm9pZCBpbml0X2V2dGNobih2b2lkKQo+ID4gICAgICByYyA9IHhl
bl9oeXBlcmNhbGxfc2V0X2V2dGNobl91cGNhbGxfdmVjdG9yKHRoaXNfY3B1KHZjcHVfaWQpLAo+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGV2dGNo
bl91cGNhbGxfdmVjdG9yKTsKPiA+ICAgICAgaWYgKCByYyApCj4gPiAtICAgICAgICBwYW5pYygi
VW5hYmxlIHRvIHNldCBldnRjaG4gdXBjYWxsIHZlY3RvcjogJWRcbiIsIHJjKTsKPiA+ICsgICAg
ewo+ID4gKyAgICAgICAgcHJpbnRrKCJVbmFibGUgdG8gc2V0IGV2dGNobiB1cGNhbGwgdmVjdG9y
OiAlZFxuIiwgcmMpOwo+ID4gKyAgICAgICAgZ290byBvdXQ7Cj4gCj4gVGhlcmUncyBubyBuZWVk
IGZvciAiZ290byIgaGVyZSAtICJyZXR1cm4gcmMiIGlzIGFsbCB5b3UgbmVlZAo+IGluc3RlYWQu
IEFzIHN0YXRlZCBlbHNld2hlcmUsIHdoZW4gdGhlcmUncyBjb21wbGV4IGNsZWFudXAgb3IKPiBh
IGZhaXIgcmlzayBvZiBsZWF2aW5nIG91dCBhbiBpbXBvcnRhbnQgY2xlYW51cCBzdGVwLCBJIGNh
bgo+IGxpdmUgd2l0aCAiZ290byIgZ2V0dGluZyB1c2VkLiBCdXQgSSBkb24ndCB0aGluayBpdCBz
aG91bGQgYmUKPiB1c2VkIHRvIHJlcGxhY2UgYSBzaW1wbGUgInJldHVybiIuCgpPSy4gVGhhdCBj
YW4gYmUgZml4ZWQuCgo+IAo+IFdpdGggdGhpcwo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Cj4gd2l0aCBvbmUgbW9yZSAob3B0aW9uYWwhKSBzdWdnZXN0aW9u
IGFuZCBvbmUgbW9yZSByZW1hcms6CgpUaGFua3MuCgo+IAo+ID4gQEAgLTI1NCwxNCArMjYwLDIw
IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1cCh2b2lkKQo+ID4gICAgICAgICAgICAgICAgIFhF
Tl9MRUdBQ1lfTUFYX1ZDUFVTKTsKPiA+ICAgICAgfQo+ID4gIAo+ID4gLSAgICBpbml0X2V2dGNo
bigpOwo+ID4gKyAgICBCVUdfT04oaW5pdF9ldnRjaG4oKSk7Cj4gPiAgfQo+ID4gIAo+ID4gLXN0
YXRpYyB2b2lkIGFwX3NldHVwKHZvaWQpCj4gPiArc3RhdGljIGludCBhcF9zZXR1cCh2b2lkKQo+
ID4gIHsKPiA+ICsgICAgaW50IHJjOwo+ID4gKwo+ID4gICAgICBzZXRfdmNwdV9pZCgpOwo+ID4g
LSAgICBtYXBfdmNwdWluZm8oKTsKPiA+IC0gICAgaW5pdF9ldnRjaG4oKTsKPiA+ICsKPiA+ICsg
ICAgcmMgPSBtYXBfdmNwdWluZm8oKTsKPiA+ICsgICAgaWYgKCByYyApCj4gPiArICAgICAgICBy
ZXR1cm4gcmM7Cj4gPiArCj4gPiArICAgIHJldHVybiBpbml0X2V2dGNobigpOwo+ID4gIH0KPiAK
PiBUbyBhdm9pZCBhIGxvY2FsIHZhcmlhYmxlLCBob3cgYWJvdXQKPiAKPiAgICAgcmV0dXJuIG1h
cF92Y3B1aW5mbygpID86IGluaXRfZXZ0Y2huKCk7Cj4gCj4gPwoKSVNUUiB0aGlzIGlzIGEgR05V
IGV4dGVuc2lvbiwgYnV0IHNlZWluZyB0aGF0IHRoZXJlIGlzIGFscmVhZHkgcXVpdGUgYQpsb3Qg
b2YgaXQgaW4gaHlwZXJjaXNvciBjb2RlLCBJIHdpbGwgbWFrZSB0aGUgY2hhbmdlLgoKV2VpLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
