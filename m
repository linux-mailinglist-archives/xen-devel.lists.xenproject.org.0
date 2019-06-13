Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E587435F9
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 14:39:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbOyR-0004tH-Ad; Thu, 13 Jun 2019 12:36:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BOU1=UM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hbOyP-0004sS-PW
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 12:36:57 +0000
X-Inumbo-ID: ebaef07e-8dd7-11e9-aa39-bfc50f57b32b
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ebaef07e-8dd7-11e9-aa39-bfc50f57b32b;
 Thu, 13 Jun 2019 12:36:53 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 13 Jun 2019 06:36:51 -0600
Message-Id: <5D0243610200007800237D5C@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Thu, 13 Jun 2019 06:36:49 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <andrii.anisov@gmail.com>
References: <1558721577-13958-1-git-send-email-andrii.anisov@gmail.com>
 <1558721577-13958-3-git-send-email-andrii.anisov@gmail.com>
 <5CFA734902000078002364C0@prv1-mh.provo.novell.com>
 <25ea00e0-c5fc-6606-f3f5-12001675bb60@gmail.com>
 <5D00A97B02000078002374E5@prv1-mh.provo.novell.com>
 <4f83cfb1-a317-d486-d1e0-2ed15fe1be59@gmail.com>
In-Reply-To: <4f83cfb1-a317-d486-d1e0-2ed15fe1be59@gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3] xen: introduce
 VCPUOP_register_runstate_phys_memory_area hypercall
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDEzLjA2LjE5IGF0IDE0OjE3LCA8YW5kcmlpLmFuaXNvdkBnbWFpbC5jb20+IHdyb3Rl
Ogo+IE9uIDEyLjA2LjE5IDEwOjI3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IFdlbGwsIG15IHBv
aW50IGhlcmUgaXMgdG8gbGVmdCBpdCBhcyBpcywgbWF5YmUgYWRkIG1vcmUgZG9jdW1lbnRhdGlv
bi4gSWYKPj4+IG9uZSBsaWtlcyBzaG9vdGluZyBoaXMgbGVnLCB3ZSBzaG91bGQgb25seSBjYXJl
IGFib3V0IGF2b2lkaW5nIHJpY29jaGV0IAo+IGhhcm1zCj4+PiBoeXBlcnZpc29yIG9yIG90aGVy
IGd1ZXN0cy4KPj4+IElmIHlvdSBkaXNhZ3JlZSwgcGxlYXNlIHN1Z2dlc3QgeW91ciBpbnRlcmFj
dGlvbiBtb2RlbCwgSSdsbCBiZSBoYXBweSB0bwo+Pj4gaW1wbGVtZW50IGl0Lgo+PiAKPj4gV2Vs
bCwgaWYgIm1peCBhcyB5b3UgbGlrZSIgaXMgZmluZSBmb3IgZ3Vlc3RzIHRvIGZvbGxvdywgdGhl
biBva2F5LiBCdXQKPj4gd2UgbmVlZCB0byBiZSBfcmVhbGx5XyBjZXJ0YWluIHRoZXJlJ3Mgbm8g
aXNzdWUgd2l0aCB0aGlzLgo+IAo+IEknbSBub3QgYXdhcmUgYWJvdXQgcG90ZW50aWFsIHByb2Js
ZW1zIGZyb20gdGhlIGd1ZXN0IHNpZGUuIERvIHlvdSBoYXZlIGFueSAKPiBpZGVhcyBhYm91dCBp
dD8KCkkgZGlkbid0IHNwZW5kIHRpbWUgdHJ5aW5nIHRvIGZpZ3VyZSBzb21ldGhpbmcgb3V0LCBi
dXQgLi4uCgo+PiBSZWxheGluZwo+PiB0aGUgaW50ZXJmYWNlIGlzIGFsd2F5cyBwb3NzaWJsZSwg
d2hpbGUgdGlnaHRlbmluZyBhbiBpbnRlcmZhY2UgaXMKPj4gYWxtb3N0IGFsd2F5cyBhdCBsZWFz
dCBhIHByb2JsZW0sIGlmIHBvc3NpYmxlIGF0IGFsbC4KPiAKPiBUcnVlLgoKLi4uIHlvdSBhZ3Jl
ZWluZyBoZXJlIHN1Z2dlc3RzIHNvbWVvbmUgc2hvdWxkLCBhbmQgdGhpcyB3b3VsZApiZXR0ZXIg
bm90IChvbmx5KSBiZSB0aGUgcmV2aWV3ZXIocykuCgo+Pj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94
ZW4vc2NoZWQuaAo+Pj4+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAo+Pj4+PiBAQCAt
MTYzLDE3ICsxNjMsMzEgQEAgc3RydWN0IHZjcHUKPj4+Pj4gICAgICAgIHZvaWQgICAgICAgICAg
ICAqc2NoZWRfcHJpdjsgICAgLyogc2NoZWR1bGVyLXNwZWNpZmljIGRhdGEgKi8KPj4+Pj4gICAg
Cj4+Pj4+ICAgICAgICBzdHJ1Y3QgdmNwdV9ydW5zdGF0ZV9pbmZvIHJ1bnN0YXRlOwo+Pj4+PiAr
Cj4+Pj4+ICsgICAgZW51bSB7Cj4+Pj4+ICsgICAgICAgIFJVTlNUQVRFX05PTkUgPSAwLAo+Pj4+
PiArICAgICAgICBSVU5TVEFURV9QQUREUiA9IDEsCj4+Pj4+ICsgICAgICAgIFJVTlNUQVRFX1ZB
RERSID0gMiwKPj4+Pj4gKyAgICB9IHJ1bnN0YXRlX2d1ZXN0X3R5cGU7Cj4+Pj4+ICsKPj4+Pj4g
KyAgICB1bnNpZ25lZCBsb25nIHJ1bnN0YXRlX2luX3VzZTsKPj4+Pgo+Pj4+IFdoeSAidW5zaWdu
ZWQgbG9uZyI/IElzbid0IGEgYm9vbCBhbGwgeW91IG5lZWQ/Cj4+Pgo+Pj4gQm9vbCBzaG91bGQg
YmUgZW5vdWdoLiBCdXQgaXQgc2VlbXMgd2Ugd2lsbCBoYXZlIGEgbG9jayBoZXJlLgo+Pj4KPj4+
PiBBbHNvIHRoZXNlIHdvdWxkIG5vdyBhbGwgd2FudCB0byBiZSBncm91cGVkIGluIGEgc3ViLXN0
cnVjdHVyZSBuYW1lZAo+Pj4+ICJydW5zdGF0ZSIsIHJhdGhlciB0aGFuIGhhdmluZyAicnVuc3Rh
dGVfIiBwcmVmaXhlcy4KPj4+Cj4+PiBNZW1iZXIgYHJ1bnN0YXRlYCBoYXMgYWxyZWFkeSBhIHR5
cGUgb2YgYHN0cnVjdCB2Y3B1X3J1bnN0YXRlX2luZm9gIHdoaWNoIGlzCj4+PiBhbiBpbnRlcmZh
Y2UgdHlwZS4KPj4+IGBydW5zdGF0ZV9ndWVzdGAgaXMgYSB1bmlvbi4gSSdkIG5vdCBsaWtlIG1v
dmluZyBgcnVuc3RhdGVfZ3Vlc3RgIHVuaW9uIGludG8KPj4+IGFub3RoZXIgc3Vic3RydWN0dXJl
LiBCZWNhdXNlIHdlIHdvdWxkIGhhdmUgbG9uZyBsaW5lcyBsaWtlCj4+PiBgdi0+c3RydWN0LnJ1
bnN0YXRlX2d1ZXN0LnZpcnQucC0+c3RhdGVfZW50cnlfdGltZWAuCj4+IAo+PiBZb3UgZGlkbid0
IGdldCBteSBwb2ludCB0aGVuOiBXaGF0IEknbSBhZnRlciBpcwo+PiAKPj4gICAgICBzdHJ1Y3Qg
ewo+PiAgICAgICAgICBzdHJ1Y3QgdmNwdV9ydW5zdGF0ZV9pbmZvIGluZm87Cj4+ICAgICAgICAg
IGVudW0gewo+PiAgICAgICAgICAgICAgUlVOU1RBVEVfTk9ORSwKPj4gICAgICAgICAgICAgIFJV
TlNUQVRFX1BBRERSLAo+PiAgICAgICAgICAgICAgUlVOU1RBVEVfVkFERFIsCj4+ICAgICAgICAg
IH0gZ3Vlc3RfdHlwZTsKPj4gICAgICAgICAgYm9vbCBpbl91c2U7Cj4+ICAgICAgfSBydW5zdGF0
ZTsKPiAKPiBEaWQgeW91IG1pc3MgcnVuc3RhdGVfZ3Vlc3QgYXMgYSBtZW1iZXIgb2YgdGhhdCBz
dHJ1Y3Q/CgpRdWl0ZSBwb3NzaWJsZS4gSSd2ZSBvdXRsaW5lZCBpdCBvbmx5IGFueXdheSwgZm9y
IHlvdSB0byBnZXQgdGhlIGlkZWEuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
