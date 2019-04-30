Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBABF31C
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 11:36:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLP7O-0005ZR-Pb; Tue, 30 Apr 2019 09:32:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8rCO=TA=citrix.com=prvs=016a9660e=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hLP7N-0005ZM-Lt
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 09:32:05 +0000
X-Inumbo-ID: cfac95d7-6b2a-11e9-843c-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cfac95d7-6b2a-11e9-843c-bc764e045a96;
 Tue, 30 Apr 2019 09:32:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,413,1549929600"; d="scan'208";a="89455772"
Date: Tue, 30 Apr 2019 11:30:33 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Chao Gao <chao.gao@intel.com>
Message-ID: <20190430093033.ncd2ism7n4mvy733@Air-de-Roger>
References: <1556601559-30921-1-git-send-email-chao.gao@intel.com>
 <5CC7FFAF020000780022A42A@prv1-mh.provo.novell.com>
 <20190430090120.GA6748@gao-cwp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190430090120.GA6748@gao-cwp>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86/pt: skip setup of posted format IRTE
 when gvec is 0
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgMDU6MDE6MjFQTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6
Cj4gT24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgMDE6NTY6MzFBTSAtMDYwMCwgSmFuIEJldWxpY2gg
d3JvdGU6Cj4gPj4+PiBPbiAzMC4wNC4xOSBhdCAwNzoxOSwgPGNoYW8uZ2FvQGludGVsLmNvbT4g
d3JvdGU6Cj4gPj4gV2hlbiB0ZXN0aW5nIHdpdGggYW4gVVAgZ3Vlc3Qgd2l0aCBhIHBhc3MtdGhy
dSBkZXZpY2Ugd2l0aCB2dC1kIHBpCj4gPj4gZW5hYmxlZCBpbiBob3N0LCB3ZSBvYnNlcnZlZCB0
aGF0IGd1ZXN0IGNvdWxkbid0IHJlY2VpdmUgaW50ZXJydXB0cwo+ID4+IGZyb20gdGhhdCBwYXNz
LXRocnUgZGV2aWNlLiBEdW1waW5nIElSVEUsIHdlIGZvdW5kIHRoZSBjb3JyZXNwb25kaW5nCj4g
Pj4gSVJURSBpcyBzZXQgdG8gcG9zdGVkIGZvcm1hdCB3aXRoICJ2ZWN0b3IiIGZpZWxkIGFzIDAu
Cj4gPj4gCj4gPj4gV2Ugd291bGQgZmFsbCBpbnRvIHRoaXMgaXNzdWUgd2hlbiBndWVzdCB1c2Vk
IHRoZSBwaXJxIGZvcm1hdCBvZiBNU0kKPiA+PiAoc2VlIHRoZSBjb21tZW50IHhlbl9tc2lfY29t
cG9zZV9tc2coKSBpbiBsaW51eCBrZXJuZWwpLiBBcyAnZGVzdF9pZCcKPiA+PiBpcyByZXB1cnBv
c2VkLCBza2lwIG1pZ3JhdGlvbiB3aGljaCBpcyBiYXNlZCBvbiAnZGVzdF9pZCcuCj4gPgo+ID5J
J3ZlIGdvbmUgdGhyb3VnaCBhbGwgdXNlcyBvZiBndmVjLCBhbmQgSSBjb3VsZG4ndCBmaW5kIGFu
eSBleGlzdGluZwo+ID5zcGVjaWFsIGNhc2luZyBvZiBpdCBiZWluZyB6ZXJvLiBJIGFzc3VtZSB0
aGlzIGlzIGFjdHVhbGx5IGNvbW11bmljYXRpb24KPiA+YmV0d2VlbiB0aGUga2VybmVsIGFuZCBx
ZW11LAo+IAo+IFllcy4gCj4gCj4gPmluIHdoaWNoIGNhc2UgSSdkIGxpa2UgdG8gc2VlIGFuCj4g
PmV4cGxhbmF0aW9uIG9mIHdoeSB0aGUgaXNzdWUgbmVlZHMgdG8gYmUgYWRkcmVzc2VkIGluIFhl
biByYXRoZXIKPiA+dGhhbiBxZW11Lgo+IAo+IFRvIGNhbGwgcGlycV9ndWVzdF9iaW5kKCkgdG8g
Y29uZmlndXJlIGlycV9kZXNjIHByb3Blcmx5Lgo+IEVzcGVjaWFsbHksIHdlIGFwcGVuZCBhIHBv
aW50ZXIgb2Ygc3RydWN0IGRvbWFpbiB0byAnYWN0aW9uLT5ndWVzdCcgaW4KPiBwaXJxX2d1ZXN0
X2JpbmQoKS4gVGhlbiBfX2RvX0lSUV9ndWVzdCgpIGtub3dzIGRvbWFpbnMgdGhhdCBhcmUgaW50
ZXJlc3RlZAo+IGluIHRoaXMgaW50ZXJydXB0IGFuZCBpbmplY3RzIGFuIGludGVycnVwdCB0byB0
aG9zZSBkb21haW5zLgo+IAo+ID5PdGhlcndpc2UsIGlmIEkndmUgb3Zlcmxvb2tlZCBzb21ldGhp
bmcsIHdvdWxkIHlvdQo+ID5taW5kIHBvaW50aW5nIG91dCB3aGVyZSBzdWNoIHNwZWNpYWwgY2Fz
aW5nIGxpdmVzIGluIFhlbj8KPiA+Cj4gPkluIGFueSBldmVudCBpdCBkb2Vzbid0IGxvb2sgY29y
cmVjdCB0byBza2lwIG1pZ3JhdGlvbiBhbHRvZ2V0aGVyIGluCj4gPnRoYXQgY2FzZS4gSSdkIHJh
dGhlciBleHBlY3QgaXQgdG8gcmVxdWlyZSBnZXR0aW5nIGRvbmUgZGlmZmVyZW50bHkuCj4gPkFm
dGVyIGFsbCB0aGVyZSBzdGlsbCBpcyBhIChDUFUsIHZlY3RvcikgdHVwbGUgYXNzb2NpYXRlZCB3
aXRoIHRoYXQKPiA+eyxwfUlSUSBpZiBpdCdzIG5vdCBwb3N0ZWQsIGFuZCBodm1fbWlncmF0ZV9w
aXJxKCkgaXMgYSBuby1vcCBpZiBpdCBpcwo+ID5wb3N0ZWQuCj4gCj4gSGVyZSwgd2UgdHJ5IHRv
IHNldCBpcnEncyB0YXJnZXQgY3B1IHRvIHRoZSBjcHUgd2hpY2ggdGhlIHZtc2kncyB0YXJnZXQg
dmNwdQo+IGlzIHJ1bm5pbmcgb24gdG8gcmVkdWNlIElQSS4gQnV0IHRoZSAnZGVzdF9pZCcgZmll
bGQgd2hpY2ggdXNlZCB0bwo+IGluZGljYXRlIHRoZSB2bXNpJ3MgdGFyZ2V0IHZjcHUgaXMgbWlz
c2luZywgd2UgZG9uJ3Qga25vdyB3aGljaCBjcHUgd2Ugc2hvdWxkCj4gbWlncmF0ZSB0aGUgaXJx
IHRvLiBPbmUgcG9zc2libGUgY2hvaWNlIGlzIHRoZSAnY2huLT5ub3RpZnlfdmNwdV9pZCcKPiB1
c2VkIGluIHNlbmRfZ3Vlc3RfcGlycSgpLiBEbyB5b3UgdGhpbmsgdGhpcyBjaG9pY2UgaXMgZmlu
ZT8KCkkgdGhpbmsgdGhhdCBieSB0aGUgdGltZSB0aGUgZGV2aWNlIG1vZGVsIGNhbGxzIGludG8g
cGlycV9ndWVzdF9iaW5kCnRoZSBQSVJRIHdvbid0IGJlIGJvdW5kIHRvIGFueSBldmVudCBjaGFu
bmVsLCBzbyBwaXJxLT5ldnRjaG4gd291bGQgYmUKMC4KCk5vdGUgdGhhdCB0aGUgYmluZGluZyBv
ZiB0aGUgUElSUSB3aXRoIHRoZSBldmVudCBjaGFubmVsIGlzIGRvbmUKYWZ0ZXJ3YXJkcyBpbiB4
ZW5faHZtX3NldHVwX21zaV9pcnFzIGJ5IHRoZSBMaW51eCBrZXJuZWwuCgpJdCBzZWVtcyBsaWtl
IHRoZSBkZXZpY2UgbW9kZWwgc2hvdWxkIGJlIHVzaW5nIGEgZGlmZmVyZW50IHNldCBvZgpoeXBl
cmNhbGxzIHRvIHNldHVwIGEgUElSUSB0aGF0IGlzIHJvdXRlZCBvdmVyIGFuIGV2ZW50IGNoYW5u
ZWwsIGllOgpQSFlTREVWT1BfbWFwX3BpcnEgYW5kIGZyaWVuZHMuCgpUaGFua3MsIFJvZ2VyLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
