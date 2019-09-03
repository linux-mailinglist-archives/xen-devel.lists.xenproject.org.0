Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1309EA688C
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 14:25:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i57pK-0004tW-3E; Tue, 03 Sep 2019 12:22:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j28/=W6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i57pI-0004tH-Ck
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 12:22:24 +0000
X-Inumbo-ID: 7b67245e-ce45-11e9-8853-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7b67245e-ce45-11e9-8853-bc764e2007e4;
 Tue, 03 Sep 2019 12:22:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 63E76B011;
 Tue,  3 Sep 2019 12:22:22 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190828080028.18205-1-jgross@suse.com>
 <20190828080028.18205-2-jgross@suse.com>
 <393f2e3f-d15c-270b-9938-4ebcc251b482@suse.com>
 <f5bd649c-1dc2-080b-df0c-ef06d59da35b@suse.com>
 <f373132d-ba9c-45b2-8b2d-d1833f43870c@suse.com>
 <45f2bc1b-571d-d780-961c-64b73bf26c3b@suse.com>
 <089c061c-74cf-e390-34a9-3c65900d1e93@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <afa878a5-e04f-8ff0-f50f-230cc9332115@suse.com>
Date: Tue, 3 Sep 2019 14:22:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <089c061c-74cf-e390-34a9-3c65900d1e93@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/4] xen: use common output function in
 debugtrace
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDkuMTkgMTQ6MDksIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDAzLjA5LjIwMTkgMTM6
NTgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDAzLjA5LjE5IDEzOjQ3LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDAzLjA5LjIwMTkgMTI6MjIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gT24gMDMuMDkuMTkgMTI6MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyOC4wOC4y
MDE5IDEwOjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+Pj4gVG9kYXkgZHVtcGluZyB0aGUg
ZGVidWd0cmFjZSBidWZmZXJzIGlzIGRvbmUgdmlhIHNlcmNvbl9wdXRzKCksIHdoaWxlCj4+Pj4+
PiBkaXJlY3QgcHJpbnRpbmcgb2YgdHJhY2UgZW50cmllcyAoYWZ0ZXIgdG9nZ2xpbmcgb3V0cHV0
IHRvIHRoZSBjb25zb2xlKQo+Pj4+Pj4gaXMgdXNpbmcgc2VyaWFsX3B1dHMoKS4KPj4+Pj4+Cj4+
Pj4+PiBVc2Ugc2VyY29uX3B1dHMoKSBpbiBib3RoIGNhc2VzLCBhcyB0aGUgZGlmZmVyZW5jZSBi
ZXR3ZWVuIGJvdGggaXMgbm90Cj4+Pj4+PiByZWFsbHkgbWFraW5nIHNlbnNlLgo+Pj4+Pgo+Pj4+
PiBObyBtYXR0ZXIgdGhhdCBJIGxpa2UgdGhpcyBjaGFuZ2UsIEknbSBub3QgY29udmluY2VkIGl0
J3MgY29ycmVjdDoKPj4+Pj4gVGhlcmUgYXJlIHR3byBkaWZmZXJlbmNlcyBiZXR3ZWVuIHRoZSBm
dW5jdGlvbnMsIG5laXRoZXIgb2Ygd2hpY2gKPj4+Pj4gSSBjb3VsZCBxdWFsaWZ5IGFzICJub3Qg
cmVhbGx5IG1ha2luZyBzZW5zZSI6IFdoeSBpcyBpdCBvYnZpb3VzCj4+Pj4+IHRoYXQgaXQgbWFr
ZXMgbm8gc2Vuc2UgZm9yIHRoZSBkZWJ1Z3RyYWNlIG91dHB1dCB0byBieXBhc3Mgb25lIG9yCj4+
Pj4+IGJvdGggb2Ygc2VyaWFsX3N0ZWFsX2ZuKCkgYW5kIHB2X2NvbnNvbGVfcHV0cygpPyBJZiB5
b3UncmUKPj4+Pj4gY29udmluY2VkIG9mIHRoaXMsIHBsZWFzZSBwcm92aWRlIHRoZSAid2h5Ii1z
IGJlaGluZCB0aGUgc2VudGVuY2UKPj4+Pj4gYWJvdmUuCj4+Pj4KPj4+PiBPa2F5LCBJJ2xsIHVz
ZToKPj4+Pgo+Pj4+IFVzZSBzZXJjb25fcHV0cygpIGluIGJvdGggY2FzZXMsIHRvIGJlIGNvbnNp
c3RlbnQgYmV0d2VlbiBkdW1waW5nIHRoZQo+Pj4+IGJ1ZmZlciB3aGVuIHN3aXRjaGluZyBkZWJ1
Z3RyYWNlIHRvIGNvbnNvbGUgb3V0cHV0IGFuZCB3aGVuIHByaW50aW5nCj4+Pj4gYSBkZWJ1Z3Ry
YWNlIGVudHJ5IGRpcmVjdGx5IHRvIGNvbnNvbGUuCj4+Pgo+Pj4gV2VsbCwgdGhpcyBpcyBiZXR0
ZXIgYXMgYW4gZXhwbGFuYXRpb24gaW5kZWVkLCBidXQgaXQgc3RpbGwgZG9lc24ndAo+Pj4gbWFr
ZSBjbGVhciB3aGV0aGVyIGl0IHdhc24ndCBpbiBmYWN0IHdhbnRlZCBmb3IgdGhlcmUgdG8gYmUg
YQo+Pj4gZGlmZmVyZW5jZSBpbiB3aGVyZSBvdXRwdXQgZ2V0cyBzZW50LiBJIG1heSBiZWxpZXZl
IHRoYXQgYnlwYXNzaW5nCj4+PiBwdl9jb25zb2xlX3B1dHMoKSB3YXNuJ3QgaW50ZW5kZWQsIGJ1
dCB0aGUgc3RlYWwgZnVuY3Rpb24gYnlwYXNzCj4+PiBoYWQgYmVlbiB0aGVyZSBpbiAzLjIgYWxy
ZWFkeSwgc28gbWF5IHdlbGwgaGF2ZSBiZWVuIG9uIHB1cnBvc2UuCj4+Cj4+IFRoZXJlIGFyZSB0
d28gdXNlcnMgb2YgY29uc29sZV9zdGVhbCgpOgo+Pgo+PiBzdXNwZW5kIGhhbmRsaW5nIC0gSSBi
ZWxpZXZlIGl0IGlzIGEgZ29vZCBpZGVhIHRvIG5vdCB1c2UgdGhlIHNlcmlhbAo+PiBpbnRlcmZh
Y2Ugd2hpbGUgaXQgaXMgcG90ZW50aWFsbHkgdW5pbml0aWFsaXplZC4KPiAKPiBJIGFncmVlIGhl
cmUuCj4gCj4+IGdkYiBzdXBwb3J0IC0gV2h5IHNob3VsZCB0aGF0IGJlIHNwZWNpYWw/IE5vdCB0
cmVhdGluZyB0aGUgb3V0cHV0IGRhdGEKPj4gYXBwcm9wcmlhdGUgdG8gdGhlIGF0dGFjaGVkIGRl
YnVnZ2VyIHdpbGwgYmUgd29yc2UgdGhhbiBlbmNhcHN1bGF0aW5nCj4+IGl0IGluIGEgd2F5IHRo
ZSBkZWJ1Z2dlciBjYW4gaGFuZGxlLgo+IAo+IEknbSBub3Qgc3VyZSBoZXJlIC0gaXQgbWF5IHdl
bGwgaGF2ZSBiZWVuIGludGVudGlvbmFsIHRvIGF2b2lkCj4gY2x1dHRlcmluZyB0aGUgZGVidWdn
ZXIgY29uc29sZS4KCkJ1dCB3b24ndCB1c2luZyBzZXJpYWxfcHV0cygpIGNsdXR0ZXIgdGhlIGRl
YnVnZ2VyIGNvbnNvbGU/ICJub3JtYWwiCnByaW50aygpIG91dHB1dCBzZWVtIHRvIGJlIGhhbmRs
ZWQgaW4gYSBzcGVjaWFsIHdheSB3aXRoIGdkYiBhY3RpdmUsCndoaWxlIGp1c3QgdXNpbmcgc2Vy
aWFsX3B1dHMoKSB3aXRoIGF0dGFjaGVkIGdkYiBpcyBsb29raW5nIGF0IGxlYXN0CnN1c3BpY2lv
dXMgdG8gbWUuIFRoZXJlIHNlZW1zIHRvIGJlIGEgc3BlY2lhbCBmb3JtYXQsIGUuZy4gdGV4dCBv
dXRwdXQKb2YgdGhlIGh5cGVydmlzb3IgaXMgcHJlcGVuZGVkIHdpdGggJ08nIGFuZCB0aGUgZGF0
YSBpcyBzZW50IGluIGhleApyZXByZXNlbnRhdGlvbi4gSSBjYW4ndCBpbWFnaW5lIGp1c3Qgc2Vu
ZGluZyBzb21lIEFTQ0lJIHRleHQgaXMgdGhlCmRlc2lyZWQgYXBwcm9hY2ggZm9yIGRlYnVndHJh
Y2Ugb3V0cHV0LgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
