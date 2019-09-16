Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A09C5B36AD
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 10:54:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9mj4-0008Gc-3U; Mon, 16 Sep 2019 08:51:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i9mj2-0008GU-Jo
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 08:51:12 +0000
X-Inumbo-ID: 215e9306-d85f-11e9-a337-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 215e9306-d85f-11e9-a337-bc764e2007e4;
 Mon, 16 Sep 2019 08:51:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 05FB5AFB7;
 Mon, 16 Sep 2019 08:51:09 +0000 (UTC)
To: Julien Grall <julien.grall@arm.com>
References: <osstest-141333-mainreport@xen.org>
 <5f71588b-274a-bdb7-d324-5ff9177a0490@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ecb6672c-18e0-d949-9e2d-c340413c2c96@suse.com>
Date: Mon, 16 Sep 2019 10:51:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5f71588b-274a-bdb7-d324-5ff9177a0490@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] dom/xen heap and boot allocator (WAS Re:
 [xen-unstable-smoke test] 141333: regressions - FAIL)
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMDkuMjAxOSAxOTo1MSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDkv
MTUvMTkgMzowOSBQTSwgb3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyb3RlOgo+PiBmbGlnaHQgMTQx
MzMzIHhlbi11bnN0YWJsZS1zbW9rZSByZWFsIFtyZWFsXQo+PiBodHRwOi8vbG9ncy50ZXN0LWxh
Yi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTQxMzMzLwo+Pgo+PiBSZWdyZXNzaW9ucyA6
LSgKPj4KPj4gVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCj4+
IGluY2x1ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgo+PiAgIHRlc3QtYXJtaGYt
YXJtaGYteGwgICAgICAgICAgIDcgeGVuLWJvb3QgICAgICAgICAgICAgICAgIGZhaWwgUkVHUi4g
dnMuIDE0MTI1Mwo+IAo+IE9zc3Rlc3QgZG9lcyBub3QgcHJvdmlkZSB0aGUgc3RhY2sgdHJhY2Ug
YXMgdGhlIGNyYXNoIGhhcHBlbiBiZWZvcmUgdGhlIAo+IGNvbnNvbGUgaXMgc2V0dXAsIGJ1dCBJ
IG1hbmFnZWQgdG8gcmVwcm9kdWNlIGl0IGxvY2FsbHk6Cj4gCj4gKFhFTikgQXNzZXJ0aW9uICdp
c194ZW5faGVhcF9tZm4obWFkZHJfdG9fbWZuKG1hKSknIGZhaWxlZCBhdCAKPiAvaG9tZS9qdWxp
ZW5nL3dvcmtzL3hlbi94ZW4vaW5jbHVkZS9hc20vbW0uaDoyNTAKPiAoWEVOKSAtLS0tWyBYZW4t
NC4xMy11bnN0YWJsZSAgYXJtMzIgIGRlYnVnPXkgICBOb3QgdGFpbnRlZCBdLS0tLQo+IAo+IFsu
Li5dCj4gCj4gKFhFTikgWGVuIGNhbGwgdHJhY2U6Cj4gKFhFTikgICAgWzwwMDI5OTJjMD5dIHBh
Z2VfYWxsb2MuYyNib290bWVtX3JlZ2lvbl9hZGQrMHhmOC8weDE3YyAoUEMpCj4gKFhFTikgICAg
WzwwMDI5OTVhYz5dIGluaXRfYm9vdF9wYWdlcysweDhjLzB4MWEwIChMUikKPiAoWEVOKSAgICBb
PDAwMjk5NWFjPl0gaW5pdF9ib290X3BhZ2VzKzB4OGMvMHgxYTAKPiAoWEVOKSAgICBbPDAwMmFj
YzJjPl0gZHRfdW5yZXNlcnZlZF9yZWdpb25zKzB4MjY4LzB4Mjg0Cj4gKFhFTikgICAgWzwwMDJh
ZDhlMD5dIHN0YXJ0X3hlbisweDVjOC8weGU5MAo+IChYRU4pICAgIFs8MDAyMDAwOTg+XSBhcm0z
Mi9oZWFkLm8jcHJpbWFyeV9zd2l0Y2hlZCsweDQvMHgxMAo+IAo+IFRoaXMgaXMgaGFwcGVuaW5n
IGJlY2F1c2Ugb2YgY29tbWl0IDZlM2U3NzEyMDMgInhlbi9hcm06IHNldHVwOiBSZWxvY2F0ZSAK
PiB0aGUgRGV2aWNlLVRyZWUgbGF0ZXIgb24gaW4gdGhlIGJvb3QiLiBTaW5jZSB0aGlzIHBhdGNo
LCBub25lIG9mIHhlbmhlYXAgCj4gbWVtb3J5IGlzIGdpdmVuIHRvIHRoZSBib290IGFsbG9jYXRv
ci4KClNvIHRoaXMgY2hhbmdlIHdhc24ndCB0ZXN0ZWQgb24gMzItYml0IEFybSBhdCBhbGwgdGhl
biBiZWZvcmUKY29tbWl0dGluZz8KCj4gVGhlIGJvb3QgYWxsb2NhdG9yIGlzIGJvb3RzdHJhcHBp
bmcgaXRzZWxmIGFuZCByZS11c2UgYSBwYWdlIGZyb20gdGhlIAo+IGZpcnN0IGFkZGVkIHJlZ2lv
bi4gSWYgdGhpcyByZWdpb24gaXMgbm90IGEgeGVuaGVhcCByZWdpb24sIHRoZW4gaXQgd2lsbCAK
PiBjcmFzaCB3aGVuIGNhbGxpbmcgbWZuX3RvX3ZpcnQoKSBvciBsYXRlciBvbiBiZWNhdXNlIHRo
ZSB2aXJ0dWFsIGFkZHJlc3MgCj4gaXMgbm90IG1hcHBlZCBpbiBtZW1vcnkuCj4gCj4gVGhlIGRl
c2NyaXB0aW9uIG9mIHRoZSBib290IGFsbG9jYXRvciBpbiBwYWdlX2FsbG9jLmMgbGVhZHMgdG8g
dGhpbmsgCj4gdGhhdCBvbmx5IGRvbWhlYXAgbWVtb3J5IG1heSBiZSBnaXZlbiB0byB0aGUgYm9v
dCBhbGxvY2F0b3IuCj4gCj4gRnVydGhlcm1vcmUsIGFzIHRoZSBib290IGFsbG9jYXRvciBtYXkg
aGF2ZSBkb21oZWFwIHBhZ2UsIGl0IG1lYW5zIHRoYXQgCj4gY2FsbGluZyBtZm5fdG9fdmlydCht
Zm5feChhbGxvY19ib290X3BhZ2VzKC4uLikpIG1heSBub3Qgd29yayB3aGVuIAo+IENPTkZJR19T
RVBBUkFURV9YRU5IRUFQPXkuCj4gCj4gSXQgZmVlbHMgdG8gbWUgdGhhdCBpbXBvc2luZyB0byBn
aXZlIGEgeGVuaGVhcCBwYWdlIHRvIHRoZSBib290IAo+IGFsbG9jYXRvciBpcyBxdWl0ZSB1Z2x5
LiBBcyB0aGUgYm9vdCBhbGxvY2F0b3Igd2lsbCBiZSB1c2VkIGluIG1vc3Qgb2YgCj4gdGhlIGNh
c2UsIHN0YXRpY2FsbHkgYWxsb2NhdGluZyBib290bWVtX3JlZ2lvbl9saXN0IG1heWJlIHRoZSBi
ZXN0LiBBbnkgCj4gdGhvdWdodHM/CgpJJ3ZlIGdvbmUgYmFjayB0byA0LjIgY29kZSwgd2hlcmUg
MzItYml0IHg4NiB3YXMgc3RpbGwgc3VwcG9ydGVkLiBUaGVyZQp3ZSBoYWQKCiNpZiBkZWZpbmVk
KENPTkZJR19YODZfMzIpCiAgICB4ZW5oZWFwX2luaXRpYWxfcGh5c19zdGFydCA9IChQRk5fVVAo
X19wYSgmX2VuZCkpICsgMSkgPDwgUEFHRV9TSElGVDsKICAgIC8qIE11c3QgcGFzcyBhIHNpbmds
ZSBtYXBwZWQgcGFnZSBmb3IgcG9wdWxhdGluZyBib290bWVtX3JlZ2lvbl9saXN0LiAqLwogICAg
aW5pdF9ib290X3BhZ2VzKF9fcGEoJl9lbmQpLCB4ZW5oZWFwX2luaXRpYWxfcGh5c19zdGFydCk7
CiAgICB4ZW5oZWFwX3BoeXNfZW5kID0gRElSRUNUTUFQX01CWVRFUyA8PCAyMDsKI2Vsc2UKCmku
ZS4gaXQgd2FzIGNsZWFybHkgaW50ZW5kZWQgZm9yIHRoZSBmaXJzdCB0aGluZyBnaXZlbiB0byB0
aGUgYm9vdAphbGxvY2F0b3IgdG8gYmUgYSBYZW4gaGVhcCBwYWdlLgoKQmV5b25kIHRoaXMgbm8g
eDg2IGNvZGUgdGhhdCB3YXNuJ3QgeDg2LTY0IHNwZWNpZmljIGRlcGVuZGVkIG9uIHRoZXJlCm9u
bHkgY29taW5nIGRpcmVjdC1tYXBwZWQgbWVtb3J5IGJhY2sgb3V0IG9mIGFsbG9jX2Jvb3RfcGFn
ZXMoKS4KCkJ1dCB5ZXMsIGEgc3RhdGljIGFsbG9jYXRpb24gbWF5IG1ha2Ugc2Vuc2UgKGFuZCB0
aGVuIGFyZ3VhYmx5IGl0IG1heQpub3QgZXZlbiBuZWVkIHRvIGJlIGEgZnVsbCBwYWdlKSAtIGNv
bW1pdCAwNDA5ZTI5ZTJiLCB3aGljaCBpcyB3aGF0CmhhZCBpbnRyb2R1Y2VkIGJvb3RtZW1fcmVn
aW9uX2xpc3QsIGRvZXNuJ3QgKGFzIHdhcyB0aGUgY29tbW9uIGNhc2UKYmFjayB0aGVuKSBoYXZl
IGFueSBkZXNjcmlwdGlvbiBhdCBhbGwsIGkuZS4gdGhlcmUncyBubyB3YXkgdG8ga25vdwp3aHkg
aXQgd2Fzbid0IGRvbmUgdGhpcyB3YXkgaW4gdGhlIGZpcnN0IHBsYWNlLgoKSmFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
