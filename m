Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 681901405D2
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 10:11:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isNb6-0003Gv-4X; Fri, 17 Jan 2020 09:07:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1vaW=3G=huawei.com=xuwei5@srs-us1.protection.inumbo.net>)
 id 1isNb4-0003Gq-Pc
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 09:07:18 +0000
X-Inumbo-ID: bb75a8da-3908-11ea-a985-bc764e2007e4
Received: from huawei.com (unknown [45.249.212.35])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb75a8da-3908-11ea-a985-bc764e2007e4;
 Fri, 17 Jan 2020 09:07:07 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 65527C4C0873CA346A3F;
 Fri, 17 Jan 2020 17:07:04 +0800 (CST)
Received: from [127.0.0.1] (10.57.101.250) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Fri, 17 Jan 2020
 17:06:53 +0800
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <1577498922-192711-1-git-send-email-xuwei5@hisilicon.com>
 <e96ddb84-db96-5316-05a7-632fed7dddb8@xen.org>
 <5E071910.2070002@hisilicon.com>
 <alpine.DEB.2.21.2001061359580.732@sstabellini-ThinkPad-T480s>
 <5E1443CD.3060908@hisilicon.com>
 <5e39e799-a716-ee84-2061-a295335607e8@xen.org> <5E1453F5.50704@hisilicon.com>
 <94aa0896-b6cf-01b4-7bde-2a4870fa37ff@xen.org>
 <5E147FA8.1000401@hisilicon.com>
 <79e63299-ce00-b417-5002-aff6d4f6bb2e@xen.org>
From: Wei Xu <xuwei5@hisilicon.com>
Message-ID: <5E21792C.9020602@hisilicon.com>
Date: Fri, 17 Jan 2020 17:06:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <79e63299-ce00-b417-5002-aff6d4f6bb2e@xen.org>
X-Originating-IP: [10.57.101.250]
X-CFilter-Loop: Reflected
Subject: Re: [Xen-devel] [PATCH] xen/arm: vgic-v3: Fix the typo of GICD IRQ
 active status range
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
Cc: xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, prime.zeng@hisilicon.com,
 shameerali.kolothum.thodi@huawei.com, linuxarm@huawei.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVsaWVuLAoKT24gMjAyMC8xLzcgMjM6MTIsIEp1bGllbiBHcmFsbCB3cm90ZToKPgo+Cj4g
T24gMDcvMDEvMjAyMCAxMjo1NSwgV2VpIFh1IHdyb3RlOgo+PiBIaSBKdWxpZW4sCj4+PiBBcyBv
bmx5IG9uZSBlbnRpdHkgc2hvdWxkIG1hbmFnZSB0aGUgVUFSVCAoaS5lIFhlbiBvciBEb20wKSwg
d2UgCj4+PiB0b2RheSBhc3N1bWUgdGhpcyB3aWxsIGJlIG1hbmFnZWQgYnkgWGVuLiBYZW4gc2hv
dWxkIGV4cG9zZSBhIAo+Pj4gcGFydGlhbCB2aXJ0dWFsIFVBUlQgKG9ubHkgYSBmZXcgcmVnaXN0
ZXJzIGFyZSBlbXVsYXRpbmcpIHRvIGRvbTAgaW4gCj4+PiByZXBsYWNlbWVudC4KPj4+Cj4+PiBU
aGlzIGlzIHVzdWFsbHkgZG9uZSBieSB0aGUgVUFSVCBkcml2ZXIuIExvb2tpbmcgYXQgdGhlIGxv
ZyB5b3UgCj4+PiBwYXN0ZWQgaW4gYSBzZXBhcmF0ZSBlLW1haWw6Cj4+Pgo+Pj4gKFhFTikgUGxh
dGZvcm06IEdlbmVyaWMgU3lzdGVtCj4+PiAoWEVOKSBVbmFibGUgdG8gaW5pdGlhbGl6ZSBhY3Bp
IHVhcnQ6IC05Cj4+PiAoWEVOKSBCYWQgY29uc29sZT0gb3B0aW9uICdkdHVhcnQnCj4+Pgo+Pj4g
U28gWGVuIGRpZG4ndCBtYW5hZ2UgdG8gaW5pdGlhbGl6ZSB0aGUgdWFydC4gVGhlIC05IHN1Z2dl
c3RzLCBYZW4gCj4+PiBkaWRuJ3QgZmluZCBhIGRyaXZlciBmb3IgeW91ciBVQVJULiBBdCB0aGUg
bW9tZW50LCBYZW4gaXMgb25seSBhYmxlIAo+Pj4gdG8gZGV0ZWN0IHBsMDExLCBzYnNhLCBzYnNh
MzIgVUFSVCBmb3IgQUNQSS4gV2hhdCBpcyB0aGUgdHlwZSBvZiB0aGUgCj4+PiBVQVJUIHVzZWQg
b24geW91ciBwbGF0Zm9ybT8KPj4+Cj4+Cj4+IFRoYW5rcyEKPj4gR290IGl0Lgo+PiBPdXIgVUFS
VCBpcyA4MjUwLgo+Cj4gWW91IHdvdWxkIG5lZWQgdG8gdGVhY2ggdGhlIDgyNTAgZHJpdmVyIGhv
dyB0byBpbml0aWFsaXplIHRoZSBVQVJUIAo+IHdpdGggQUNQSS4gSXQgaXMgbm90IHZlcnkgZGlm
ZmljdWx0IHRvIGRvIGl0LCBoYXZlIGEgbG9vayBhdCB0aGUgcGwwMTEgCj4gdmVyc2lvbi4KPgo+
Pgo+PiBUaGFua3MhCj4+IEl0IGlzIG5vdCB3b3JraW5nIGV2ZW4gSSBjaGFuZ2VkIHRoZSBjb25k
aXRpb24gdG8gIiBpZiAoIAo+PiBhY3BpX2Rpc2FibGVkICkgIi4KPgo+IERvaCwgdGhhbmsgeW91
IGZvciBzcG90dGluZyB0aGUgZXh0cmEgIS4KPgo+PiBNeSBncnViIDIuMDQgY29uZmlndXJhdGlv
biBpcyBhcyBiZWxvdzoKPj4KPj4gICAgICB4ZW5faHlwZXJ2aXNvciAveGVuIGRvbTBfbWVtPTRH
IGFjcGk9Zm9yY2UgbG9nbHZsPWFsbCAKPj4gZ3Vlc3RfbG9nbHZsPWFsbAo+PiAgICAgIHhlbl9t
b2R1bGUgL0ltYWdlIHJkaW5pdD0vaW5pdCAgYWNwaT1mb3JjZSBub2luaXRyZCAKPj4gcm9vdD0v
ZGV2L3NkYjEgcncKPj4KPj4gVGhlIGxvZyB3aXRoIHRoZSBjb25kaXRpb24gIiBpZiAoIGFjcGlf
ZGlzYWJsZWQgKSAiIGlzIGFzIGZvbGxvd2luZzoKPj4KPj4gICAgICAoWEVOKSBBZGRpbmcgY3B1
IDEyNiB0byBydW5xdWV1ZSAwCj4+ICAgICAgKFhFTikgQWRkaW5nIGNwdSAxMjcgdG8gcnVucXVl
dWUgMAo+PiAgICAgIChYRU4pIGFsdGVybmF0aXZlczogUGF0Y2hpbmcgd2l0aCBhbHQgdGFibGUg
MDAwMDAwMDAwMDJkNGY0OCAtPiAKPj4gMDAwMDAwMDAwMDJkNTc2NAo+PiAgICAgIChYRU4pICoq
KiBMT0FESU5HIERPTUFJTiAwICoqKgo+PiAgICAgIChYRU4pIExvYWRpbmcgZDAga2VybmVsIGZy
b20gYm9vdCBtb2R1bGUgQCAwMDAwMDAwMDE2MjU3MDAwCj4+ICAgICAgKFhFTikgQWxsb2NhdGlu
ZyAxOjEgbWFwcGluZ3MgdG90YWxsaW5nIDQwOTZNQiBmb3IgZG9tMDoKPj4gICAgICAoWEVOKSBC
QU5LWzBdIDB4MDAwMDAwMDgwMDAwMDAtMHgwMDAwMDAxMDAwMDAwMCAoMTI4TUIpCj4+ICAgICAg
KFhFTikgQkFOS1sxXSAweDAwMDAwMDIwMDAwMDAwLTB4MDAwMDAwMzgwMDAwMDAgKDM4NE1CKQo+
PiAgICAgIChYRU4pIEJBTktbMl0gMHgwMDAwMDA1MDAwMDAwMC0weDAwMDAwMDgwMDAwMDAwICg3
NjhNQikKPj4gICAgICAoWEVOKSBCQU5LWzNdIDB4MDAyMDIwMDAwMDAwMDAtMHgwMDIwMjA4MDAw
MDAwMCAoMjA0OE1CKQo+PiAgICAgIChYRU4pIEJBTktbNF0gMHgwMDIwMjBiMDAwMDAwMC0weDAw
MjAyMGMwMDAwMDAwICgyNTZNQikKPj4gICAgICAoWEVOKSBCQU5LWzVdIDB4MDAyMDI2MDAwMDAw
MDAtMHgwMDIwMjYyMDAwMDAwMCAoNTEyTUIpCj4+ICAgICAgKFhFTikgR3JhbnQgdGFibGUgcmFu
Z2U6IDB4MDAwMDAwMTgxYzcwMDAtMHgwMDAwMDAxODIwNzAwMAo+PiAgICAgIChYRU4pIEFsbG9j
YXRpbmcgUFBJIDE2IGZvciBldmVudCBjaGFubmVsIGludGVycnVwdAo+PiAgICAgIChYRU4pIExv
YWRpbmcgekltYWdlIGZyb20gMDAwMDAwMDAxNjI1NzAwMCB0byAKPj4gMDAwMDAwMDAwODA4MDAw
MC0wMDAwMDAwMDA5OTgxMjAwCj4+ICAgICAgKFhFTikgTG9hZGluZyBkMCBEVEIgdG8gMHgwMDAw
MDAwMDBmZTAwMDAwLTB4MDAwMDAwMDAwZmUwMDI1Ygo+PiAgICAgIChYRU4pIEluaXRpYWwgbG93
IG1lbW9yeSB2aXJxIHRocmVzaG9sZCBzZXQgYXQgMHg0MDAwIHBhZ2VzLgo+PiAgICAgIChYRU4p
IFNjcnViYmluZyBGcmVlIFJBTSBpbiBiYWNrZ3JvdW5kCj4+ICAgICAgKFhFTikgU3RkLiBMb2ds
ZXZlbDogQWxsCj4+ICAgICAgKFhFTikgR3Vlc3QgTG9nbGV2ZWw6IEFsbAo+PiAgICAgIChYRU4p
ICoqKiBTZXJpYWwgaW5wdXQgdG8gRE9NMCAodHlwZSAnQ1RSTC1hJyB0aHJlZSB0aW1lcyB0byAK
Pj4gc3dpdGNoIGlucHV0KQo+PiAgICAgIChYRU4pIERhdGEgQWJvcnQgVHJhcC4gU3luZHJvbWU9
MHg2Cj4+ICAgICAgKFhFTikgV2Fsa2luZyBIeXBlcnZpc29yIFZBIDB4MTAgb24gQ1BVMCB2aWEg
VFRCUiAKPj4gMHgwMDAwMDAwMDE4MmZmMDAwCj4+ICAgICAgKFhFTikgMFRIWzB4MF0gPSAweDAw
MDAwMDAwMTgzMDJmN2YKPj4gICAgICAoWEVOKSAxU1RbMHgwXSA9IDB4MDAwMDAwMDAxODMwMGY3
Zgo+PiAgICAgIChYRU4pIDJORFsweDBdID0gMHgwMDAwMDAwMDAwMDAwMDAwCj4+ICAgICAgKFhF
TikgQ1BVMDogVW5leHBlY3RlZCBUcmFwOiBEYXRhIEFib3J0Cj4+ICAgICAgKFhFTikgLS0tLVsg
WGVuLTQuMTMuMC1yYyAgYXJtNjQgIGRlYnVnPXkgICBOb3QgdGFpbnRlZCBdLS0tLQo+PiAgICAg
IChYRU4pIENQVTogICAgMAo+PiAgICAgIChYRU4pIFBDOiAgICAgMDAwMDAwMDAwMDJiNjVjOCAw
MDAwMDAwMDAwMmI2NWM4Cj4KPiBDYW4geW91IGxvb2sgd2l0aCBhZGRyMmxpbmUgd2hhdCB0aGlz
IFBDIHJlZmVycyB0bz8KPgoKU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5IQpUaGUgUEMgcmVmZXJz
IHRvIGZkdF9udW1fbWVtX3JzdiBkdXJpbmcgaW5pdF9kb25lLgpCdXQgdGhlIGRldmljZV90cmVl
X2ZsYXR0ZW5lZCBpcyBOVUxMIHRoYXQgdGhlIGRhdGEgYWJvcnQgaGFwcGVuZWQuCgpTbyBJIGFk
ZGVkIGJlbG93IGNoYW5nZXMgYW5kIHRoZSBYRU4gZG9tMCBjYW4gYmUgYm9vdGVkLgoKICAgICBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3NldHVwLmMgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwog
ICAgIGluZGV4IDFlODMzNTEuLjFhYjgwYTEgMTAwNjQ0CiAgICAgLS0tIGEveGVuL2FyY2gvYXJt
L3NldHVwLmMKICAgICArKysgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwogICAgIEBAIC0zOTIsNyAr
MzkyLDggQEAgdm9pZCBfX2luaXQgZGlzY2FyZF9pbml0aWFsX21vZHVsZXModm9pZCkKICAgICAg
ICAgICAgICAgICAgICFtZm5fdmFsaWQobWFkZHJfdG9fbWZuKGUpKSApCiAgICAgICAgICAgICAg
ICAgIGNvbnRpbnVlOwoKICAgICAtICAgICAgICBkdF91bnJlc2VydmVkX3JlZ2lvbnMocywgZSwg
aW5pdF9kb21oZWFwX3BhZ2VzLCAwKTsKICAgICArICAgICAgIGlmKCBhY3BpX2Rpc2FibGVkICkK
ICAgICArICAgICAgICAgICBkdF91bnJlc2VydmVkX3JlZ2lvbnMocywgZSwgaW5pdF9kb21oZWFw
X3BhZ2VzLCAwKTsKICAgICAgICAgIH0KClRoYW5rIHlvdSBzbyBtdWNoIQoKQmVzdCBSZWdhcmRz
LApXZWkKCj4gQ2hlZXJzLAo+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
