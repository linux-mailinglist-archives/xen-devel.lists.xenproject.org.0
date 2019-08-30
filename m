Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCF3A3181
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 09:47:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3baK-00021M-It; Fri, 30 Aug 2019 07:44:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3baI-00021H-HX
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 07:44:38 +0000
X-Inumbo-ID: 032b11c4-cafa-11e9-8980-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 032b11c4-cafa-11e9-8980-bc764e2007e4;
 Fri, 30 Aug 2019 07:44:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 17359B01F;
 Fri, 30 Aug 2019 07:44:35 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1567005862-18540-1-git-send-email-igor.druzhinin@citrix.com>
 <20190829080059.s24eyer5hfaqnbfv@Air-de-Roger>
 <89b9bad1-d9ef-6db2-8521-d55cafb16514@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d01f4b66-bd56-a921-65f1-efd0a9d03966@suse.com>
Date: Fri, 30 Aug 2019 09:44:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <89b9bad1-d9ef-6db2-8521-d55cafb16514@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/mmcfg: add "force" option for MCFG
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
Cc: sstabellini@kernel.org, wl@xen.org, konrad.wilk@oracle.com,
 George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com,
 ian.jackson@eu.citrix.com, tim@xen.org, julien.grall@arm.com,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDguMjAxOSAyMToyNSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gT24gMjkvMDgvMjAx
OSAwOTowMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+Cj4+PiBJIHRoaW5rIHdlIG5lZWQg
dG8gaGF2ZSB0aGlzIG9wdGlvbiB0byBhdCBsZWFzdCBoYXZlIGEgd2F5IHRvIHdvcmthcm91bmQK
Pj4+IHByb2JsZW0gKDEpLiBQcm9ibGVtICgyKSBjb3VsZCBiZSBzb2x2ZWQgaW4gRG9tMCBrZXJu
ZWwgYnkgaW52b2tpbmcKPj4+IHhlbl9tY2ZnX2xhdGUoKSBlYXJsaWVyIGJ1dCBiZWZvcmUgdGhl
IGZpcnN0IFBDSSBidXMgZW51bWVydGFpb24gd2hpY2gKPj4+IGN1cnJlbnRseSBoYXBwZW5zIHNv
bXdoZXJlIGR1cmluZyBBQ1BJIHNjYW4gSSB0aGluay4KPj4+Cj4+PiBUaGUgcXVlc3Rpb24gaXMg
d2hhdCB0aGUgZGVmdWx0IHZhbHVlIGZvciB0aGlzIG9wdGlvbiBzaG91bGQgYmU/Cj4+Cj4+IEhh
dmUgeW91IHRlc3RlZCB0aGlzIGFnYWluc3QgYSB2YXJpZXR5IG9mIGhhcmR3YXJlPwo+IE5vdCB5
ZXQsIEkgcHJlc3VtZSBpdCdzIHBvc3NpYmxlIGluIHRoZW9yeSB0aGF0IHRoZXJlIGlzIHN1Y2gg
YSBib3ggaW4KPiB0aGUgd2lsZCB0aGF0IHdpbGwgbWlzYmVoYXZlIGlmIHdlIGF0dGVtcHQgdG8g
YWNjZXNzIE1DRkcgZWFybGllciBpdCdkCj4gYmUgZGlzY292ZXJlZCB0aHJvdWdoIEFDUEkuIE90
aGVyIHRoYW4gdGhhdCBJIGRvbid0IHNlZSBhIHJlYXNvbiB3aHkgaXQKPiB3b3VsZCBjYXVzZSBh
bnkgcHJvYmxlbS4gQnV0IHlvdSdyZSByaWdodCAtIHdlIG5lZWQgdG8gcnVuIHNvbWUgdGVzdHMK
PiB3aXRoIHRoaXMgb3B0aW9uIHNldCB0byB0cnVlIG9uIG91ciBmbGVldCBiZWZvcmUgZGVjaWRp
bmcuCj4gCj4+IEhhdmUgeW91IGZvdW5kIGFueSBib3ggdGhhdCBoYXMgYSB3cm9uZyBNTUNGRyBh
cmVhIGluIHRoZSBNQ0ZHIHN0YXRpYwo+PiB0YWJsZT8gKGllOiBvbmUgdGhhdCBkb2Vzbid0IG1h
dGNoIHRoZSBtb3RoZXJib2FyZCByZXNvdXJjZQo+PiByZXNlcnZhdGlvbiBpbiB0aGUgZHluYW1p
YyBBQ1BJIHRhYmxlcz8pCj4gCj4gSSB0aGluayBpdCdzIHBvc3NpYmxlIHRoYXQgc2l6ZSBvZiB0
aGUgdGFibGUgcmVwb3J0ZWQgZnJvbSBBQ1BJIGlzCj4gc21hbGxlciB3aGljaCB3b3VsZCBiZSBh
IHByb2JsZW0gaWYgd2UgYWNjZXNzIG91dC1vZi1ib3VuZHMgcHJlbGltaW5hcnkKPiAtIGhlbmNl
IHRoZSBhYmlsaXR5IHRvIGZhbGwgYmFjay4gQnV0IEknbSBub3QgYXdhcmUgb2YgYW55IGhhcmR3
YXJlIGxpa2UKPiB0aGF0LgoKVGhlIHJlYXNvbiB3aHkgTGludXggaGFkIHB1dCB0aGVzZSB0d28g
Y2hlY2tzIChFODIwIGFuZCBBQ1BJKSBpbiBwbGFjZQooYW5kIHdlIGNsb25lZCB0aGVtKSB3YXMg
dGhhdCBpbiB0aGUgb2xkIGRheXMgKGF0IGxlYXN0IHVudGlsIGFyb3VuZAp0aGUgZmlyc3QgeDg2
LTY0IHN5c3RlbXMgYXBwZWFyaW5nKSB0aGVyZSB3ZXJlIG1hbnkgc3VjaCBzeXN0ZW1zIChpaXJj
Cm1vcmUgdGhhbiB0aGVyZSB3ZXJlIHdlbGwgYmVoYXZlZCBvbmVzKS4gVGhlIGJhZCBzaXR1YXRp
b24gd2l0aCBCSU9TZXMKd2FzIGFsc28gd2h5IHRoZSB2YXJpb3VzIGNoaXBzZXQgcHJvYmluZyBt
ZXRob2RzIGhhZCBiZWVuIGludHJvZHVjZWQuCgpBbnl3YXkgLSB0aGUgbWFpbiByaXNrIHdpdGgg
dXNpbmcgTUNGRyB3aXRob3V0IGtub3dpbmcgdGhlIHJhbmdlIGlzCnN1aXRhYmx5IHJlc2VydmVk
IGlzIHRoYXQgb3RoZXIgdGhpbmdzIG1heSBsaXZlIGluIHRoYXQgcmFuZ2UgKGUuZy4KQkFScyBt
YXkgaGF2ZSBiZWVuIGFsbG9jYXRlZCB0aGVyZSkuIFRoZXJlZm9yZSBJIGRvbid0IHRoaW5rIHdl
IGNhbgpyZWFzb25hYmx5IGRlZmF1bHQgdGhpcyBvcHRpb24gdG8gInRydWUiLCBpcnJlc3BlY3Rp
dmUgd2hldGhlcgpwZXJoYXBzIF9hbGxfIHN5c3RlbXMgaW4geW91ciB0ZXN0aW5nIGZsZWV0IGFy
ZSB3ZWxsIGJlaGF2ZWQgaW4gdGhpcwpyZWdhcmQuCgo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2U4
MjAuYwo+Pj4gKysrIGIveGVuL2FyY2gveDg2L2U4MjAuYwo+Pj4gQEAgLTM3LDYgKzM3LDI2IEBA
IHN0cnVjdCBlODIwbWFwIGU4MjA7Cj4+PiAgc3RydWN0IGU4MjBtYXAgX19pbml0ZGF0YSBlODIw
X3JhdzsKPj4+ICAKPj4+ICAvKgo+Pj4gKyAqIFRoaXMgZnVuY3Rpb24gY2hlY2tzIGlmIGFueSBw
YXJ0IG9mIHRoZSByYW5nZSA8c3RhcnQsZW5kPiBpcyBtYXBwZWQKPj4+ICsgKiB3aXRoIHR5cGUu
Cj4+PiArICovCj4+PiAraW50IF9faW5pdCBlODIwX2FueV9tYXBwZWQodTY0IHN0YXJ0LCB1NjQg
ZW5kLCB1bnNpZ25lZCB0eXBlKQo+Pgo+PiBQbGVhc2UgdXNlIHVpbnQ2NF90IGFuZCB1bnNpZ25l
ZCBpbnQuIEFsc28gaXQgbG9va3MgbGlrZSB0aGlzCj4+IGZ1bmN0aW9uIHdhbnRzIHRvIHJldHVy
biBhIGJvb2wgaW5zdGVhZCBvZiBhbiBpbnQuCj4+Cj4gCj4gVGhlIHByb2JsZW0gaGVyZSBpcyB0
aGF0IEkgd2FudCB0aGlzIGZ1bmN0aW9uIGJlIHNpbWlsYXIgdG8gdGhlIG9uZQo+IGJlbG93IChl
ODIwX2FsbF9tYXBwZWQpIHdoaWNoIGlzIGNvcGllZCBmcm9tIExpbnV4IGFzIHdlbGwgYXMgdGhl
IHJlc3QKPiBvZiB0aGUgZmlsZS4gQXQgdGhlIHNhbWUgdGltZSBJIGRvbid0IHdhbnQgdG8gaW50
cm9kdWNlIGNvZGUgY2h1cm4KPiBmaXhpbmcgdW5yZWxhdGVkIHN0eWxlIGlzc3Vlcy4gUGVyaGFw
cyBpdCdzIGJldHRlciB0byBrZWVwIHN0eWxlIG9mIHRoaXMKPiBmdW5jdGlvbiBhcyBpcz8gT3Ig
ZG8geW91IHRoaW5rIGl0J3Mgc3RpbGwgYmV0dGVyIHRvIHVuaWZ5IHRoZSBzdHlsZQo+IGFjcm9z
cyBib3RoIG9mIHRoZW0gKHBlcmhhcHMgaW4gYSBzZXBhcmF0ZSBjb21taXQpPwoKU2luY2Ugd2Un
cmUgdHJ5aW5nIHRvIGdyYWR1YWxseSBzd2l0Y2ggdG8gdWludDxOPl90LCBJIHRoaW5rIG5ldyBj
b2RlCnNob3VsZCBieSBkZWZhdWx0IHVzZSB0aGUgaW50ZW5kZWQgdHlwZXMuIEV4Y2VwdGlvbnMg
d291bGQgYmUgaW1wb3J0cwpvZiBlbnRpcmUgZmlsZXMgZnJvbSBMaW51eC4gSWYgeW91IGZvbGxv
d2VkIHVwIHlvdXIgY2hhbmdlIHdpdGggb25lCmNvbnZlcnRpbmcgdGhlIG90aGVyIGZ1bmN0aW9u
KHMpIHRvIHRoZSBpbnRlbmRlZCB0eXBlcyBhcyB3ZWxsLCB0aGF0J2QKYmUgbXVjaCBhcHByZWNp
YXRlZCwgYnV0IGlzIGltbyBub3QgYSByZXF1aXJlbWVudC4KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
