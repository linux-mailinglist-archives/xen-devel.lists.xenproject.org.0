Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDFC13BD42
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 11:21:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irfkV-0001xx-QM; Wed, 15 Jan 2020 10:18:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wJf7=3E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1irfkV-0001xs-5Y
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 10:18:07 +0000
X-Inumbo-ID: 509811c6-3780-11ea-8503-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 509811c6-3780-11ea-8503-12813bfff9fa;
 Wed, 15 Jan 2020 10:18:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 21A78ABC7;
 Wed, 15 Jan 2020 10:18:03 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <5c88239b-de0f-5f81-72c4-7fdb07524278@suse.com>
 <91d9f45c-e0e1-a01c-d812-2dd3345fff48@suse.com>
 <20200115095637.GI11756@Air-de-Roger> <20200115100003.GJ11756@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b0cd8ce9-3465-0963-6c44-cef8bf1063f2@suse.com>
Date: Wed, 15 Jan 2020 11:18:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200115100003.GJ11756@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] Ping: [PATCH v2] dom0-build: fix build with clang5
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMDEuMjAyMCAxMTowMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBXZWQsIEph
biAxNSwgMjAyMCBhdCAxMDo1NjozN0FNICswMTAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+
PiBPbiBGcmksIERlYyAyMCwgMjAxOSBhdCAwNToyNjozNFBNICswMTAwLCBKYW4gQmV1bGljaCB3
cm90ZToKPj4+IE9uIDE3LjA3LjIwMTkgMDg6NDcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IFdp
dGggbm9uLWVtcHR5IENPTkZJR19ET00wX01FTSBjbGFuZzUgcHJvZHVjZXMKPj4+Pgo+Pj4+IGRv
bTBfYnVpbGQuYzozNDQ6MjQ6IGVycm9yOiB1c2Ugb2YgbG9naWNhbCAnJiYnIHdpdGggY29uc3Rh
bnQgb3BlcmFuZCBbLVdlcnJvciwtV2NvbnN0YW50LWxvZ2ljYWwtb3BlcmFuZF0KPj4+PiAgICAg
IGlmICggIWRvbTBfbWVtX3NldCAmJiBDT05GSUdfRE9NMF9NRU1bMF0gKQo+Pj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgIF4gIH5+fn5+fn5+fn5+fn5+fn5+fgo+Pj4+IGRvbTBfYnVpbGQuYzoz
NDQ6MjQ6IG5vdGU6IHVzZSAnJicgZm9yIGEgYml0d2lzZSBvcGVyYXRpb24KPj4+PiAgICAgIGlm
ICggIWRvbTBfbWVtX3NldCAmJiBDT05GSUdfRE9NMF9NRU1bMF0gKQo+Pj4+ICAgICAgICAgICAg
ICAgICAgICAgICAgIF5+Cj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgJgo+Pj4+IGRvbTBf
YnVpbGQuYzozNDQ6MjQ6IG5vdGU6IHJlbW92ZSBjb25zdGFudCB0byBzaWxlbmNlIHRoaXMgd2Fy
bmluZwo+Pj4+ICAgICAgaWYgKCAhZG9tMF9tZW1fc2V0ICYmIENPTkZJR19ET00wX01FTVswXSAp
Cj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICB+Xn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4+Pj4g
MSBlcnJvciBnZW5lcmF0ZWQuCj4+Pj4KPj4+PiBPYnZpb3VzbHkgbmVpdGhlciBvZiB0aGUgdHdv
IHN1Z2dlc3Rpb25zIGFyZSBhbiBvcHRpb24gaGVyZS4gT2RkbHkKPj4+PiBlbm91Z2ggc3dhcHBp
bmcgdGhlIG9wZXJhbmRzIG9mIHRoZSAmJiBoZWxwcywgd2hpbGUgZS5nLiBjYXN0aW5nIG9yCj4+
Pj4gcGFyZW50aGVzaXppbmcgZG9lc24ndC4gQW5vdGhlciB3b3JrYWJsZSB2YXJpYW50IGxvb2tz
IHRvIGJlIHRoZSB1c2Ugb2YKPj4+PiAhISBvbiB0aGUgY29uc3RhbnQuCj4+Pj4KPj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+Pj4gLS0tCj4+Pj4g
djI6IEFsc28gYWRqdXN0IHRoZSBBcm0gaW5jYXJuYXRpb24gb2YgdGhlIHNhbWUgY29uc3RydWN0
Lgo+Pj4+IC0tLQo+Pj4+IEknbSBvcGVuIHRvIGdvaW5nIHRoZSAhISBvciB5ZXQgc29tZSBkaWZm
ZXJlbnQgcm91dGUgKGJ1dCBub3QgcmVhbGx5IHRoZQo+Pj4+IHN1Z2dlc3RlZCBzdHJsZW4oKSBv
bmUpLiBObyBtYXR0ZXIgd2hpY2ggb25lIHdlIGNob29zZSwgSSdtIGFmcmFpZCBpdCBpcwo+Pj4+
IGdvaW5nIHRvIHJlbWFpbiBndWVzc3dvcmsgd2hhdCBuZXdlciAoYW5kIGZ1dHVyZSkgdmVyc2lv
bnMgb2YgY2xhbmcgd2lsbAo+Pj4+IGNob2tlIG9uLgo+Pj4KPj4+IEkgZ3Vlc3MgdGhlIGRpc2Fn
cmVlbWVudCBvbiBob3cgdG8gZXhhY3RseSBhZGRyZXNzIHRoZSBpc3N1ZSBoYXMKPj4+IHN0YWxs
ZWQgdGhpcy4gQnV0IEkgdGhpbmsgd2Ugc2hvdWxkIHJhdGhlciBoYXZlIF9zb21lXyAoZS5nLgo+
Pj4gdGhpcykgc29sdXRpb24gaW4gdGhlIHJlcG8sIHRoYW4gY29udGludWUgdG8gc2hpcCB2ZXJz
aW9ucyB3aGljaAo+Pj4gZG9uJ3QgYnVpbGQuIFBlb3BsZSB3YW50aW5nIHRvIGJlYXV0aWZ5IHRo
ZSBjb2RlIGZ1cnRoZXIgY291bGQKPj4+IHRoZW4gc3VibWl0IGluY3JlbWVudGFsIHBhdGNoZXMu
Cj4+Cj4+IEFja2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
ClRoYW5rcy4KCj4+IEknbSBub3QgcHJvdmlkaW5nIGEgUkIgYmVjYXVzZSB0aGlzIGlzIGFsbCBn
dWVzc3dvcmssIHNvIGl0IGRvZXNuJ3QKPj4gZmVlbCBhcHByb3ByaWF0ZSB0byByZXZpZXcgc29t
ZXRoaW5nIHRoYXQncyBiYXNlZCBvbiB1bmRvY3VtZW50ZWQKPj4gY29tcGlsZXIgYmVoYXZpb3Iu
Cj4+Cj4+IEFub3RoZXIgb3B0aW9uIHdvdWxkIGJlIHRvIHBhc3MgLVdjb25zdGFudC1sb2dpY2Fs
LW9wZXJhbmQgYnV0IHRoYXQKPj4gd291bGQgcHJldmVudCBjYWNoaW5nIHNvbWUgbGljaXQgaXNz
dWVzLgo+IAo+IEZvcmdvdCB0byBtZW50aW9uLCBidXQgY291bGQgeW91IHBsZWFzZSBhZGQgYSBj
b21tZW50IHRvIG5vdGUgdGhhdCB0aGUKPiBjb25kaXRpb24gaXMgb3JkZXJlZCB0aGlzIHdheSB0
byBtYWtlIGNsYW5nNSBoYXBweT8KCkkndmUgYWRkZWQKCiAgICAvKiBUaGUgb3JkZXJpbmcgb2Yg
b3BlcmFuZHMgaXMgdG8gd29yayBhcm91bmQgYSBjbGFuZzUgaXNzdWUuICovCgp0byBib3RoIGlu
c3RhbmNlcy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
