Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B591338CEB
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2019 16:26:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hZFly-0003lr-2F; Fri, 07 Jun 2019 14:23:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/Vp6=UG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hZFlw-0003lm-Pa
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2019 14:23:12 +0000
X-Inumbo-ID: c50e0f06-892f-11e9-833f-9736e9cb07f0
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c50e0f06-892f-11e9-833f-9736e9cb07f0;
 Fri, 07 Jun 2019 14:23:08 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 07 Jun 2019 08:23:06 -0600
Message-Id: <5CFA734902000078002364C0@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 07 Jun 2019 08:23:05 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <andrii.anisov@gmail.com>
References: <1558721577-13958-1-git-send-email-andrii.anisov@gmail.com>
 <1558721577-13958-3-git-send-email-andrii.anisov@gmail.com>
In-Reply-To: <1558721577-13958-3-git-send-email-andrii.anisov@gmail.com>
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

Pj4+IE9uIDI0LjA1LjE5IGF0IDIwOjEyLCA8YW5kcmlpLmFuaXNvdkBnbWFpbC5jb20+IHdyb3Rl
Ogo+IEZyb206IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+Cj4gCj4gRXhp
c3RpbmcgaW50ZXJmYWNlIHRvIHJlZ2lzdGVyIHJ1bnN0YXRlIGFyZSB3aXRoIGl0cyB2aXJ0dWFs
IGFkZHJlc3MKPiBpcyBwcm9uZSB0byBpc3N1ZXMgd2hpY2ggYmVjYW1lIG1vcmUgb2J2aW91cyB3
aXRoIEtQVEkgZW5hYmxlbWVudCBpbgo+IGd1ZXN0cy4gVGhlIG5hdHVyZSBvZiB0aG9zZSBpc3N1
ZXMgaXMgdGhlIGZhY3QgdGhhdCB0aGUgZ3Vlc3QgY291bGQKPiBiZSBpbnRlcnJ1cHRlZCBieSB0
aGUgaHlwZXJ2aXNvciBhdCBhbnkgdGltZSwgYW5kIHRoZXJlIGlzIG5vIGd1YXJhbnRlZQo+IHRv
IGhhdmUgdGhlIHJlZ2lzdGVyZWQgdmlydHVhbCBhZGRyZXNzIHRyYW5zbGF0ZWQgd2l0aCB0aGUg
Y3VycmVudGx5Cj4gYXZhaWxhYmxlIGd1ZXN0J3MgcGFnZSB0YWJsZXMuIEJlZm9yZSB0aGUgS1BU
SSBzdWNoIGEgc2l0dWF0aW9uIHdhcwo+IHBvc3NpYmxlIGluIGNhc2UgdGhlIGd1ZXN0IGlzIGNh
dWdodCBpbiB0aGUgbWlkZGxlIG9mIFBUIHByb2Nlc3NpbmcKPiAoZS5nLiBzdXBlcnBhZ2Ugc2hh
dHRlcmluZykuIFdpdGggdGhlIEtQVEkgdGhpcyBoYXBwZW5zIGFsc28gd2hlbiB0aGUKPiBndWVz
dCBydW5zIHVzZXJzcGFjZSwgc28gaGFzIGEgcHJldHR5IGhpZ2ggcHJvYmFiaWxpdHkuCgpFeGNl
cHQgd2hlbiB0aGVyZSdzIG5vIG5lZWQgZm9yIEtQVEkgaW4gdGhlIGd1ZXN0IGluIHRoZSBmaXJz
dCBwbGFjZSwKYXMgaXMgdGhlIGNhc2UgZm9yIHg4Ni02NCBQViBndWVzdHMuIEkgdGhpbmsgdGhp
cyBpcyB3b3J0aHdoaWxlIGNsYXJpZnlpbmcuCgo+IFNvIGl0IHdhcyBhZ3JlZWQgdG8gcmVnaXN0
ZXIgcnVuc3RhdGUgd2l0aCB0aGUgZ3Vlc3QncyBwaHlzaWNhbCBhZGRyZXNzCj4gc28gdGhhdCBp
dHMgbWFwcGluZyBpcyBwZXJtYW5lbnQgZnJvbSB0aGUgaHlwZXJ2aXNvciBwb2ludCBvZiB2aWV3
LiBbMV0KPiAKPiBUaGUgaHlwZXJjYWxsIGVtcGxveXMgdGhlIHNhbWUgdmNwdV9yZWdpc3Rlcl9y
dW5zdGF0ZV9tZW1vcnlfYXJlYQo+IHN0cnVjdHVyZSBmb3IgdGhlIGludGVyZmFjZSwgYnV0IHJl
cXVpcmVzIGEgcmVnaXN0ZXJlZCBhcmVhIHRvIG5vdAo+IGNyb3NzIGEgcGFnZSBib3VuZGFyeS4K
PiAKPiBbMV0gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1k
ZXZlbC8yMDE5LTAyL21zZzAwNDE2Lmh0bWwgCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmlpIEFu
aXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCkkgd291bGQgaGF2ZSByZWFsbHkgaG9wZWQg
dGhhdCB5b3Ugd291bGQgb3V0bGluZSB0aGUgaW50ZW5kZWQgaW50ZXJhY3Rpb24KYmV0d2VlbiBi
b3RoIGludGVyZmFjZXMsIHN1Y2ggdGhhdCB3aGlsZSByZXZpZXdpbmcgb25lIGNhbiBqdWRnZSB3
aGV0aGVyCnlvdSdyZSBhY3R1YWxseSBtYXRjaGluZyB0aGUgZ29hbC4gSSB0aGluayBpdCBpcyBh
Y3R1YWxseSBtYW5kYXRvcnkgdG8gbWFrZQpleHBsaWNpdCBpbiB0aGUgcHVibGljIGhlYWRlciB3
aGF0IGxldmVsIG9mIG1peGluZyBpcyBwZXJtaXR0ZWQsIHdoYXQgaXMgbm90CnBlcm1pdHRlZCwg
YW5kIHdoYXQgbWl4IG9mIHJlcXVlc3RzIGlzIHNpbXBseSB1bmRlZmluZWQuCgpJbiBwYXJ0aWN1
bGFyLCB3aGlsZSB3ZSBkaWQgd29yayBvdXQgZHVyaW5nIHByaW9yIGRpc2N1c3Npb25zIHRoYXQg
c29tZQpsZXZlbCBvZiBtaXhpbmcgaGFzIHRvIGJlIHBlcm1pdHRlZCwgSSdtIHVuY29udmluY2Vk
IHRoYXQgYXJiaXRyYXJ5Cm1peGluZyBoYXMgdG8gYmUgYWxsb3dlZC4gRm9yIGV4YW1wbGUsIHN3
aXRjaGluZyBmcm9tIG9uZSBtb2RlbCB0bwphbm90aGVyIGNvdWxkIGJlIHBlcm1pdHRlZCBvbmx5
IHdpdGgganVzdCBhIHNpbmdsZSBhY3RpdmUgdkNQVS4gVGhpcwptaWdodCBhbGxvdyB0byBkbyBh
d2F5IGFnYWluIHdpdGggdGhlIHJ1bnN0YXRlX2luX3VzZSBmaWVsZCB5b3UgYWRkLgoKPiAtLS0g
YS94ZW4vYXJjaC9hcm0vZG9tYWluLmMKPiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluLmMKPiBA
QCAtMjc0LDE3ICsyNzQsMTUgQEAgc3RhdGljIHZvaWQgY3R4dF9zd2l0Y2hfdG8oc3RydWN0IHZj
cHUgKm4pCj4gICAgICB2aXJ0X3RpbWVyX3Jlc3RvcmUobik7Cj4gIH0KPiAgCj4gLS8qIFVwZGF0
ZSBwZXItVkNQVSBndWVzdCBydW5zdGF0ZSBzaGFyZWQgbWVtb3J5IGFyZWEgKGlmIHJlZ2lzdGVy
ZWQpLiAqLwo+IC1zdGF0aWMgdm9pZCB1cGRhdGVfcnVuc3RhdGVfYXJlYShzdHJ1Y3QgdmNwdSAq
dikKPiArc3RhdGljIHZvaWQgdXBkYXRlX3J1bnN0YXRlX2J5X2d2YWRkcihzdHJ1Y3QgdmNwdSAq
dikKPiAgewo+ICAgICAgdm9pZCBfX3VzZXIgKmd1ZXN0X2hhbmRsZSA9IE5VTEw7Cj4gIAo+IC0g
ICAgaWYgKCBndWVzdF9oYW5kbGVfaXNfbnVsbChydW5zdGF0ZV9ndWVzdCh2KSkgKQo+IC0gICAg
ICAgIHJldHVybjsKPiArICAgIEFTU0VSVCghZ3Vlc3RfaGFuZGxlX2lzX251bGwocnVuc3RhdGVf
Z3Vlc3RfdmlydCh2KSkpOwo+ICAKPiAgICAgIGlmICggVk1fQVNTSVNUKHYtPmRvbWFpbiwgcnVu
c3RhdGVfdXBkYXRlX2ZsYWcpICkKPiAgICAgIHsKPiAtICAgICAgICBndWVzdF9oYW5kbGUgPSAm
di0+cnVuc3RhdGVfZ3Vlc3QucC0+c3RhdGVfZW50cnlfdGltZSArIDE7Cj4gKyAgICAgICAgZ3Vl
c3RfaGFuZGxlID0gJnYtPnJ1bnN0YXRlX2d1ZXN0LnZpcnQucC0+c3RhdGVfZW50cnlfdGltZSAr
IDE7Cj4gICAgICAgICAgZ3Vlc3RfaGFuZGxlLS07Cj4gICAgICAgICAgdi0+cnVuc3RhdGUuc3Rh
dGVfZW50cnlfdGltZSB8PSBYRU5fUlVOU1RBVEVfVVBEQVRFOwo+ICAgICAgICAgIF9fcmF3X2Nv
cHlfdG9fZ3Vlc3QoZ3Vlc3RfaGFuZGxlLAo+IEBAIC0yOTIsNyArMjkwLDcgQEAgc3RhdGljIHZv
aWQgdXBkYXRlX3J1bnN0YXRlX2FyZWEoc3RydWN0IHZjcHUgKnYpCj4gICAgICAgICAgc21wX3dt
YigpOwo+ICAgICAgfQo+ICAKPiAtICAgIF9fY29weV90b19ndWVzdChydW5zdGF0ZV9ndWVzdCh2
KSwgJnYtPnJ1bnN0YXRlLCAxKTsKPiArICAgIF9fY29weV90b19ndWVzdChydW5zdGF0ZV9ndWVz
dF92aXJ0KHYpLCAmdi0+cnVuc3RhdGUsIDEpOwoKSW4gYSBwcmlvciB2ZXJzaW9uIHlvdSBkaWQg
dGhlIG1lY2hhbmljYWwgcGFydCBvZiBhZGp1c3RpbmcgdGhlIFZBLWJhc2VkCmNvZGUgaW4gYSBw
cmVyZXEgcGF0Y2gsIGFpZGluZyByZXZpZXcuIElzIHRoZXJlIGEgcGFydGljdWxhciByZWFzb24g
eW91CmZvbGRlZCBldmVyeXRoaW5nIGludG8gb25lIHBhdGNoIG5vdz8KCj4gQEAgLTMwMyw2ICsz
MDEsNTMgQEAgc3RhdGljIHZvaWQgdXBkYXRlX3J1bnN0YXRlX2FyZWEoc3RydWN0IHZjcHUgKnYp
Cj4gICAgICB9Cj4gIH0KPiAgCj4gK3N0YXRpYyB2b2lkIHVwZGF0ZV9ydW5zdGF0ZV9ieV9ncGFk
ZHIoc3RydWN0IHZjcHUgKnYpCj4gK3sKPiArICAgIHN0cnVjdCB2Y3B1X3J1bnN0YXRlX2luZm8g
KnJ1bnN0YXRlID0KPiArICAgICAgICAgICAgKHN0cnVjdCB2Y3B1X3J1bnN0YXRlX2luZm8gKil2
LT5ydW5zdGF0ZV9ndWVzdC5waHlzOwoKV2hhdCdzIHRoZSBjYXN0IGZvciBoZXJlPwoKPiBAQCAt
MTYxNCw2ICsxNjEzLDkyIEBAIGJvb2wgdXBkYXRlX3J1bnN0YXRlX2FyZWEoc3RydWN0IHZjcHUg
KnYpCj4gICAgICByZXR1cm4gcmM7Cj4gIH0KPiAgCj4gK3N0YXRpYyBib29sIHVwZGF0ZV9ydW5z
dGF0ZV9ieV9ncGFkZHJfbmF0aXZlKHN0cnVjdCB2Y3B1ICp2KQo+ICt7Cj4gKyAgICBzdHJ1Y3Qg
dmNwdV9ydW5zdGF0ZV9pbmZvICpydW5zdGF0ZSA9Cj4gKyAgICAgICAgICAgIChzdHJ1Y3QgdmNw
dV9ydW5zdGF0ZV9pbmZvICopdi0+cnVuc3RhdGVfZ3Vlc3QucGh5czsKPiArCj4gKyAgICBBU1NF
UlQocnVuc3RhdGUgIT0gTlVMTCk7Cj4gKwo+ICsgICAgaWYgKCBWTV9BU1NJU1Qodi0+ZG9tYWlu
LCBydW5zdGF0ZV91cGRhdGVfZmxhZykgKQo+ICsgICAgewo+ICsgICAgICAgIHJ1bnN0YXRlLT5z
dGF0ZV9lbnRyeV90aW1lIHw9IFhFTl9SVU5TVEFURV9VUERBVEU7Cj4gKyAgICAgICAgc21wX3dt
YigpOwo+ICsgICAgICAgIHYtPnJ1bnN0YXRlLnN0YXRlX2VudHJ5X3RpbWUgfD0gWEVOX1JVTlNU
QVRFX1VQREFURTsKPiArICAgIH0KPiArCj4gKyAgICBtZW1jcHkodi0+cnVuc3RhdGVfZ3Vlc3Qu
cGh5cywgJnYtPnJ1bnN0YXRlLCBzaXplb2Yodi0+cnVuc3RhdGUpKTsKPiArCj4gKyAgICBpZiAo
IFZNX0FTU0lTVCh2LT5kb21haW4sIHJ1bnN0YXRlX3VwZGF0ZV9mbGFnKSApCj4gKyAgICB7Cj4g
KyAgICAgICAgcnVuc3RhdGUtPnN0YXRlX2VudHJ5X3RpbWUgJj0gflhFTl9SVU5TVEFURV9VUERB
VEU7Cj4gKyAgICAgICAgc21wX3dtYigpOwo+ICsgICAgICAgIHYtPnJ1bnN0YXRlLnN0YXRlX2Vu
dHJ5X3RpbWUgJj0gflhFTl9SVU5TVEFURV9VUERBVEU7Cj4gKyAgICB9Cj4gKwo+ICsgICAgcmV0
dXJuIHRydWU7Cj4gK30KCkkgY2FuJ3QgaGVscCB0aGlua2luZyB0aGF0IHRoaXMgbWF0Y2hlcyB0
aGUgQXJtIGNvZGUuIENhbiBjb21tb24gdGhpbmdzCnBsZWFzZSBiZSBwdXQgaW4gY29tbW9uIGNv
ZGU/IEkgbWF5IGJlIGFza2luZyB0b28gbXVjaCwgYnV0IGlmIHRoZQpwcmUtZXhpc3RpbmcgaW1w
bGVtZW50YXRpb25zIGFyZSBzaW1pbGFyIGVub3VnaCAoSSBkaWRuJ3QgY2hlY2spIHBlcmhhcHMK
dGhleSBjb3VsZCBiZSBmb2xkZWQgaW4gYSBmaXJzdCBzdGVwLCB0b28/Cgo+ICtzdGF0aWMgYm9v
bCB1cGRhdGVfcnVuc3RhdGVfYnlfZ3BhZGRyX2NvbXBhdChzdHJ1Y3QgdmNwdSAqdikKPiArewo+
ICsgICAgc3RydWN0IGNvbXBhdF92Y3B1X3J1bnN0YXRlX2luZm8gKnJ1bnN0YXRlID0KPiArICAg
ICAgICAgICAgKHN0cnVjdCBjb21wYXRfdmNwdV9ydW5zdGF0ZV9pbmZvICopdi0+cnVuc3RhdGVf
Z3Vlc3QucGh5czsKPiArCj4gKyAgICBBU1NFUlQocnVuc3RhdGUgIT0gTlVMTCk7Cj4gKwo+ICsg
ICAgaWYgKCBWTV9BU1NJU1Qodi0+ZG9tYWluLCBydW5zdGF0ZV91cGRhdGVfZmxhZykgKQo+ICsg
ICAgewo+ICsgICAgICAgIHJ1bnN0YXRlLT5zdGF0ZV9lbnRyeV90aW1lIHw9IFhFTl9SVU5TVEFU
RV9VUERBVEU7Cj4gKyAgICAgICAgc21wX3dtYigpOwo+ICsgICAgICAgIHYtPnJ1bnN0YXRlLnN0
YXRlX2VudHJ5X3RpbWUgfD0gWEVOX1JVTlNUQVRFX1VQREFURTsKPiArICAgIH0KPiArCj4gKyAg
ICB7Cj4gKyAgICAgICAgc3RydWN0IGNvbXBhdF92Y3B1X3J1bnN0YXRlX2luZm8gaW5mbzsKPiAr
ICAgICAgICBYTEFUX3ZjcHVfcnVuc3RhdGVfaW5mbygmaW5mbywgJnYtPnJ1bnN0YXRlKTsKPiAr
ICAgICAgICBtZW1jcHkodi0+cnVuc3RhdGVfZ3Vlc3QucGh5cywgJmluZm8sIHNpemVvZihpbmZv
KSk7Cj4gKyAgICB9Cj4gKyAgICBlbHNlCj4gKyAgICAgICAgbWVtY3B5KHYtPnJ1bnN0YXRlX2d1
ZXN0LnBoeXMsICZ2LT5ydW5zdGF0ZSwgc2l6ZW9mKHYtPnJ1bnN0YXRlKSk7CgpUaGlzICJlbHNl
IiBkb2VzIG5vdCBzZWVtIHRvIGJlIHBhaXJlZCB3aXRoIGFuIGlmKCkuIERvZXMgdGhpcyBidWls
ZAphdCBhbGw/Cgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvZG9tYWluLmMKPiArKysgYi94
ZW4vYXJjaC94ODYveDg2XzY0L2RvbWFpbi5jCj4gQEAgLTEyLDYgKzEyLDggQEAKPiAgQ0hFQ0tf
dmNwdV9nZXRfcGh5c2lkOwo+ICAjdW5kZWYgeGVuX3ZjcHVfZ2V0X3BoeXNpZAo+ICAKPiArZXh0
ZXJuIHZvaWQgZGlzY2FyZF9ydW5zdGF0ZV9hcmVhKHN0cnVjdCB2Y3B1ICp2KTsKCk5vLCB0aGlz
IGlzIG5vdCBhbGxvd2VkLiBUaGUgZGVjbGFyYXRpb24gbXVzdCBiZSB2aXNpYmxlIHRvIGJvdGgg
Y29uc3VtZXIKYW5kIHByb2R1Y2VyLCBzbyB0aGF0IHdoZW4gZWl0aGVyIHNpZGUgaXMgY2hhbmdl
ZCB0aGluZ3Mgd29uJ3QgYnVpbGQgdW50aWwKdGhlIG90aGVyIHNpZGUgZ2V0cyBjaGFuZ2VkIHRv
by4KCj4gQEAgLTM1LDggKzM3LDE2IEBAIGFyY2hfY29tcGF0X3ZjcHVfb3AoCj4gICAgICAgICAg
ICAgICAhY29tcGF0X2hhbmRsZV9va2F5KGFyZWEuYWRkci5oLCAxKSApCj4gICAgICAgICAgICAg
IGJyZWFrOwo+ICAKPiArICAgICAgICB3aGlsZSggeGNoZygmdi0+cnVuc3RhdGVfaW5fdXNlLCAx
KSA9PSAwKTsKCkF0IHRoZSB2ZXJ5IGxlYXN0IHN1Y2ggbG9vcHMgd2FudCBhIGNwdV9yZWxheCgp
IGluIHRoZWlyIGJvZGllcy4KQnV0IHRoaXMgYmVpbmcgb24gYSBoeXBlcmNhbGwgcGF0aCAtIGFy
ZSB0aGVyZSB0aGVvcmV0aWNhbCBndWFyYW50ZWVzCnRoYXQgYSBndWVzdCBjYW4ndCBhYnVzZSB0
aGlzIHRvIGxvY2sgdXAgYSBDUFU/CgpGdXJ0aGVybW9yZSBJIGRvbid0IHVuZGVyc3RhbmQgaG93
IHRoaXMgaXMgc3VwcG9zZWQgdG8gd29yayBpbgp0aGUgZmlyc3QgcGxhY2UuIFRoZSBmaXJzdCB4
Y2hnKCkgd2lsbCBzdG9yZSAxLCBubyBtYXR0ZXIgd2hhdC4gVGh1cwpvbiB0aGUgc2Vjb25kIGl0
ZXJhdGlvbiB5b3UnbGwgZmluZCB0aGUgd2FudGVkIHZhbHVlIHVubGVzcyB0aGUKb3RoZXIgc2lk
ZSBzdG9yZWQgMC4gWWV0IHRoZSBvdGhlciBzaWRlIGlzIGEgc2ltcGxlIHhjaGcoKSB0b28uCkhl
bmNlIGl0cyBmaXJzdCBhdHRlbXB0IHdvdWxkIGZhaWwsIGJ1dCBpdHMgc2Vjb25kIGF0dGVtcHQg
KHdoaWNoCndlIGRpZG4ndCBleGl0IHRoZSBjcml0aWNhbCByZWdpb24gaGVyZSB5ZXQpIHdvdWxk
IHN1Y2NlZWQuCgpBbHNvIC0gc3R5bGUuCgo+IC0tLSBhL3hlbi9jb21tb24vZG9tYWluLmMKPiAr
KysgYi94ZW4vY29tbW9uL2RvbWFpbi5jCj4gQEAgLTY5OCw2ICs2OTgsNzQgQEAgaW50IHJjdV9s
b2NrX2xpdmVfcmVtb3RlX2RvbWFpbl9ieV9pZChkb21pZF90IGRvbSwgc3RydWN0IGRvbWFpbiAq
KmQpCj4gICAgICByZXR1cm4gMDsKPiAgfQo+ICAKPiArc3RhdGljIHZvaWQgdW5tYXBfcnVuc3Rh
dGVfYXJlYShzdHJ1Y3QgdmNwdSAqdikKPiArewo+ICsgICAgbWZuX3QgbWZuOwo+ICsKPiArICAg
IGlmICggISB2LT5ydW5zdGF0ZV9ndWVzdC5waHlzICkKClN0cmF5IGJsYW5rIGFmdGVyICEgLgoK
PiArICAgICAgICByZXR1cm47Cj4gKwo+ICsgICAgbWZuID0gZG9tYWluX3BhZ2VfbWFwX3RvX21m
bih2LT5ydW5zdGF0ZV9ndWVzdC5waHlzKTsKPiArCj4gKyAgICB1bm1hcF9kb21haW5fcGFnZV9n
bG9iYWwoKHZvaWQgKikKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoKHVuc2lnbmVk
IGxvbmcpdi0+cnVuc3RhdGVfZ3Vlc3QucGh5cyAmCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFBBR0VfTUFTSykpOwo+ICsKPiArICAgIHYtPnJ1bnN0YXRlX2d1ZXN0LnBoeXMgPSBO
VUxMOwoKSSB0aGluayB5b3Ugd291bGQgYmV0dGVyIHN0b3JlIE5VTEwgYmVmb3JlIHVubWFwcGlu
Zy4KCj4gQEAgLTczNCw3ICs4MDIsMTAgQEAgaW50IGRvbWFpbl9raWxsKHN0cnVjdCBkb21haW4g
KmQpCj4gICAgICAgICAgaWYgKCBjcHVwb29sX21vdmVfZG9tYWluKGQsIGNwdXBvb2wwKSApCj4g
ICAgICAgICAgICAgIHJldHVybiAtRVJFU1RBUlQ7Cj4gICAgICAgICAgZm9yX2VhY2hfdmNwdSAo
IGQsIHYgKQo+ICsgICAgICAgIHsKPiArICAgICAgICAgICAgZGlzY2FyZF9ydW5zdGF0ZV9hcmVh
X2xvY2tlZCh2KTsKPiAgICAgICAgICAgICAgdW5tYXBfdmNwdV9pbmZvKHYpOwo+ICsgICAgICAg
IH0KCldoYXQgaXMgdGhlICJsb2NrZWQiIGFzcGVjdCBoZXJlIGFib3V0PyBUaGUgZ3Vlc3QgaXRz
ZWxmIGlzIGRlYWQgKGkuZS4KZnVsbHkgcGF1c2VkKSBhdCB0aGlzIHBvaW50LCBpc24ndCBpdD8g
QW5kIGl0IHdvbid0IGV2ZXIgYmUgdW5wYXVzZWQKYWdhaW4uCgo+IC0tLSBhL3hlbi9pbmNsdWRl
L3hlbi9zY2hlZC5oCj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgKPiBAQCAtMTYzLDE3
ICsxNjMsMzEgQEAgc3RydWN0IHZjcHUKPiAgICAgIHZvaWQgICAgICAgICAgICAqc2NoZWRfcHJp
djsgICAgLyogc2NoZWR1bGVyLXNwZWNpZmljIGRhdGEgKi8KPiAgCj4gICAgICBzdHJ1Y3QgdmNw
dV9ydW5zdGF0ZV9pbmZvIHJ1bnN0YXRlOwo+ICsKPiArICAgIGVudW0gewo+ICsgICAgICAgIFJV
TlNUQVRFX05PTkUgPSAwLAo+ICsgICAgICAgIFJVTlNUQVRFX1BBRERSID0gMSwKPiArICAgICAg
ICBSVU5TVEFURV9WQUREUiA9IDIsCj4gKyAgICB9IHJ1bnN0YXRlX2d1ZXN0X3R5cGU7Cj4gKwo+
ICsgICAgdW5zaWduZWQgbG9uZyBydW5zdGF0ZV9pbl91c2U7CgpXaHkgInVuc2lnbmVkIGxvbmci
PyBJc24ndCBhIGJvb2wgYWxsIHlvdSBuZWVkPwoKQWxzbyB0aGVzZSB3b3VsZCBub3cgYWxsIHdh
bnQgdG8gYmUgZ3JvdXBlZCBpbiBhIHN1Yi1zdHJ1Y3R1cmUgbmFtZWQKInJ1bnN0YXRlIiwgcmF0
aGVyIHRoYW4gaGF2aW5nICJydW5zdGF0ZV8iIHByZWZpeGVzLgoKPiArICAgICAgICB2b2lkKiAg
IHBoeXM7CgpCYWQgb3JkZXJpbmcgYmV0d2VlbiAqIGFuZCB0aGUgYmxhbmtzLiBUaGVyZSBvdWdo
dCB0byBiZSBhIGJsYW5rCmFoZWFkIG9mIHRoZSAqLCBhbmQgSSBkb24ndCBzZWUgd2h5IHlvdSBu
ZWVkIGFueSBhZnRlciBpdC4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
