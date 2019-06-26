Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E23DD56D8B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 17:22:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hg9hP-0006HZ-EU; Wed, 26 Jun 2019 15:19:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JP5O=UZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hg9hN-0006HU-Or
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 15:19:01 +0000
X-Inumbo-ID: b91e9a17-9825-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b91e9a17-9825-11e9-8980-bc764e045a96;
 Wed, 26 Jun 2019 15:19:00 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 26BC22080C;
 Wed, 26 Jun 2019 15:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561562339;
 bh=yslNOtVtaXpADjbnUFZbJrlpc6r5WuTObcJpja7ZYr0=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=a4xIV6ZE5ItkGLVSLqkYgXi3hs9Ah/mvPwXoesJo7V8IajOaBAq6IsvJSwSXFCsFJ
 u9vdMud+njoli+FYs2x2R34v1NWnIxbitQW7gaFjOfHy6vfuo3J3+9wq/+N6QTdHq2
 aShWW3mP0Ttv+HPv9vX1OZYAtGT5WU83W7Nry1No=
Date: Wed, 26 Jun 2019 08:18:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Juergen Gross <jgross@suse.com>
In-Reply-To: <2b9df6fd-1be8-5f45-009e-4a975ad159b1@suse.com>
Message-ID: <alpine.DEB.2.21.1906260818360.5851@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1906241135080.2468@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1906241146530.2468@sstabellini-ThinkPad-T480s>
 <3c16614d-fc50-1899-709c-45f49eb156b1@suse.com>
 <20190626122157.GA2885@gao-cwp>
 <2b9df6fd-1be8-5f45-009e-4a975ad159b1@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] PCI Passthrough bug with x86 HVM
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, wl@xen.org,
 andrew.cooper3@citrix.com, jbeulich@suse.com, xen-devel@lists.xenproject.org,
 boris.ostrovsky@oracle.com, roger.pau@citrix.com,
 Chao Gao <chao.gao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyNiBKdW4gMjAxOSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAyNi4wNi4xOSAx
NDoyMSwgQ2hhbyBHYW8gd3JvdGU6Cj4gPiBPbiBXZWQsIEp1biAyNiwgMjAxOSBhdCAwODoxNzo1
MEFNICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+ID4gPiBPbiAyNC4wNi4xOSAyMDo0Nywg
U3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gPiA+ICsgeGVuLWRldmVsCj4gPiA+ID4gCj4g
PiA+ID4gT24gTW9uLCAyNCBKdW4gMjAxOSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4g
PiA+ID4gSGkgYWxsLAo+ID4gPiA+ID4gCj4gPiA+ID4gPiBJIG1pZ2h0IGhhdmUgZm91bmQgYSBi
dWcgd2l0aCBQQ0kgcGFzc3Rocm91Z2ggdG8gYSBMaW51eCBIVk0gZ3Vlc3Qgb24KPiA+ID4gPiA+
IHg4NiB3aXRoIFhlbiA0LjEyLiBJdCBpcyBub3QgZWFzeSBmb3IgbWUgdG8gZ2V0IGFjY2Vzcywg
YW5kIGVzcGVjaWFsbHkKPiA+ID4gPiA+IGNoYW5nZSBjb21wb25lbnRzLCBvbiB0aGlzIHBhcnRp
Y3VsYXIgc3lzdGVtLCBhbmQgSSBkb24ndCBoYXZlIGFjY2Vzcwo+ID4gPiA+ID4gdG8KPiA+ID4g
PiA+IG90aGVyIHg4NiBib3hlcyBhdCB0aGUgbW9tZW50LCBzbyBhcG9sb2dpZXMgZm9yIHRoZSBw
YXJ0aWFsCj4gPiA+ID4gPiBpbmZvcm1hdGlvbgo+ID4gPiA+ID4gcmVwb3J0LiBUaGUgc2V0dXAg
aXMgYXMgZm9sbG93Ogo+ID4gPiA+ID4gCj4gPiA+ID4gPiAtIHR3byBQQ0kgZGV2aWNlcyBoYXZl
IGJlZW4gYXNzaWduZWQgdG8gYSBIVk0gZ3Vlc3QsIGV2ZXJ5dGhpbmcgaXMKPiA+ID4gPiA+IGZp
bmUKPiA+ID4gPiA+IC0gcmVib290IHRoZSBndWVzdCBmcm9tIGluc2lkZSwgaS5lLiBgcmVib290
JyBpbiBMaW51eAo+ID4gPiA+ID4gLSBhZnRlciB0aGUgcmVib290IGNvbXBsZXRlcywgb25seSBv
bmUgZGV2aWNlIGlzIGFzc2lnbmVkCj4gPiA+ID4gPiAKPiA+ID4gPiA+IEJlZm9yZSB0aGUgcmVi
b290LCBJIHNlZSBhbGwgdGhlIGFwcHJvcHJpYXRlIHhlbnN0b3JlIGVudHJpZXMgZm9yIGJvdGgK
PiA+ID4gPiA+IGRldmljZXMuIEV2ZXJ5dGhpbmcgaXMgZmluZS4gQWZ0ZXIgdGhlIHJlYm9vdCwg
SSBjYW4gb25seSBzZWUgdGhlCj4gPiA+ID4gPiB4ZW5zdG9yZSBlbnRyaWVzIG9mIG9uZSBkZXZp
Y2UuIEl0IGlzIGFzIGlmIHRoZSBvdGhlciBkZXZpY2UKPiA+ID4gPiA+ICJkaXNhcHBlYXJlZCIg
d2l0aG91dCB0aHJvd2luZyBhbnkgZXJyb3JzLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBIYXZlIHlv
dSBzZWVuIHRoaXMgYmVmb3JlPyBEbyB5b3Uga25vdyBpZiBpdCBoYXMgYmVlbiBmaXhlZCBpbgo+
ID4gPiA+ID4gc3RhZ2luZz8KPiA+ID4gPiA+IEkgbm90aWNlZCB0aGlzIGZpeCB3aGljaCBzZWVt
cyB0byBiZSB2ZXJ5IHJlbGV2YW50Ogo+ID4gPiA+ID4gCj4gPiA+ID4gPiBodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTgtMTEvbXNnMDE2MTYu
aHRtbAo+ID4gPiA+ID4gCj4gPiA+ID4gPiBidXQgaXQgaXMgYWxyZWFkeSBpbmNsdWRlZCBpbiA0
LjEyLgo+ID4gPiAKPiA+ID4gU3RlZmFubywgY291bGQgeW91IHBsZWFzZSB0cnkgdGhlIGF0dGFj
aGVkIHBhdGNoPyBJdCBpcyBvbmx5IGNvbXBpbGUKPiA+ID4gdGVzdGVkIGZvciBub3cuCj4gPiA+
IAo+ID4gPiAKPiA+ID4gSnVlcmdlbgo+ID4gCj4gPiA+IEZyb20gZWE5NWRjZGZjNjBhODk1Y2M0
M2JhZjM0YzhlMGZiMDg4ZTEwMDA4ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiA+ID4gRnJv
bTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+ID4gPiBUbzogeGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCj4gPiA+IENjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUu
Y2l0cml4LmNvbT4KPiA+ID4gQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gPiA+IERhdGU6IFdl
ZCwgMjYgSnVuIDIwMTkgMDg6MTU6MjggKzAyMDAKPiA+ID4gU3ViamVjdDogW1BBVENIXSBsaWJ4
bDogZml4IHBjaSBkZXZpY2UgcmUtYXNzaWduaW5nIGFmdGVyIGRvbWFpbiByZWJvb3QKPiA+ID4g
Cj4gPiA+IEFmdGVyIGEgcmVib290IG9mIGEgZ3Vlc3Qgb25seSB0aGUgZmlyc3QgcGNpIGRldmlj
ZSBjb25maWd1cmF0aW9uIHdpbGwKPiA+ID4gYmUgcmV0cmlldmVkIGZyb20gWGVuc3RvcmUgcmVz
dWx0aW5nIGluIGxvc3Mgb2YgYW55IGZ1cnRoZXIgYXNzaWduZWQKPiA+ID4gcGFzc2VkIHRocm91
Z2ggcGNpIGRldmljZXMuCj4gPiA+IAo+ID4gPiBUaGUgbWFpbiByZWFzb24gaXMgdGhhdCBhbGwg
cGFzc2VkIHRocm91Z2ggcGNpIGRldmljZXMgcmVzaWRlIHVuZGVyIGEKPiA+ID4gY29tbW9uIHJv
b3QgZGV2aWNlICIwIiBpbiBYZW5zdG9yZS4gU28gd2hlbiB0aGUgZGV2aWNlIGxpc3QgaXMgcmVi
dWlsdAo+ID4gPiBmcm9tIFhlbnN0b3JlIGFmdGVyIGEgcmVib290IHRoZSBzdWItZGV2aWNlcyBi
ZWxvdyB0aGF0IHJvb3QgZGV2aWNlCj4gPiA+IG5lZWQgdG8gYmUgc2VsZWN0ZWQgaW5zdGVhZCBv
ZiB1c2luZyB0aGUgcm9vdCBkZXZpY2UgbnVtYmVyIGFzIGEKPiA+ID4gc2VsZWN0b3IuCj4gPiA+
IAo+ID4gPiBGaXggdGhhdCBieSBhZGRpbmcgYSBuZXcgbWVtYmVyIHRvIHN0cnVjdCBsaWJ4bF9k
ZXZpY2VfdHlwZSB3aGljaCB3aGVuCj4gPiA+IHNldCBpcyB1c2VkIHRvIGdldCB0aGUgbnVtYmVy
IG9mIGRldmljZXMuIEFkZCBzdWNoIGEgbWVtYmVyIGZvciBwY2kgdG8KPiA+ID4gZ2V0IHRoZSBj
b3JyZWN0IG51bWJlciBvZiBwY2kgZGV2aWNlcyBpbnN0ZWFkIG9mIGltcGx5aW5nIGl0IGZyb20g
dGhlCj4gPiA+IG51bWJlciBvZiBwY2kgcm9vdCBkZXZpY2VzICh3aGljaCB3aWxsIGFsd2F5cyBi
ZSAxKS4KPiA+ID4gCj4gPiA+IFdoaWxlIGF0IGl0IGZpeCB0aGUgdHlwZSBvZiBsaWJ4bF9fZGV2
aWNlX3BjaV9mcm9tX3hzX2JlKCkgdG8gbWF0Y2gKPiA+ID4gdGhlIG9uZSBvZiB0aGUgLmZyb21f
eGVuc3RvcmUgbWVtYmVyIG9mIHN0cnVjdCBsaWJ4bF9kZXZpY2VfdHlwZS4gVGhpcwo+ID4gPiBm
aXhlcyBhIGxhdGVudCBidWcgY2hlY2tpbmcgdGhlIHJldHVybiB2YWx1ZSBvZiBhIGZ1bmN0aW9u
IHJldHVybmluZwo+ID4gPiB2b2lkLgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+ID4gCj4gPiBUZXN0ZWQtYnk6IENoYW8gR2FvIDxj
aGFvLmdhb0BpbnRlbC5jb20+Cj4gCj4gVGhhbmtzIQoKVGhhbmsgeW91IHZlcnkgbXVjaCBib3Ro
IG9mIHlvdSEgSSdsbCBsZXQgeW91IGtub3cgaWYgaXQgd29ya3MuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
