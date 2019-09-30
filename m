Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E53D1C1FC0
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 13:05:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEtRo-0007ze-Sm; Mon, 30 Sep 2019 11:02:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H1QO=XZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iEtRo-0007zZ-8X
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 11:02:32 +0000
X-Inumbo-ID: cbe0b0f8-e371-11e9-96ce-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id cbe0b0f8-e371-11e9-96ce-12813bfff9fa;
 Mon, 30 Sep 2019 11:02:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CE4C2ACFA;
 Mon, 30 Sep 2019 11:02:29 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20190930100900.660-1-jgross@suse.com>
 <3d38c59e-85d1-19bd-e53f-1494c8a46cdd@suse.com>
 <0365be90-5f43-53cd-5e90-3ae0397a21a1@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fc49b59e-bbbb-7c64-3b31-2244c76ee2ae@suse.com>
Date: Mon, 30 Sep 2019 13:02:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <0365be90-5f43-53cd-5e90-3ae0397a21a1@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 20/19] docs: add "sched-gran" boot
 parameter documentation
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDkuMjAxOSAxMjo1MSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAzMC4wOS4xOSAx
MjoyNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDMwLjA5LjIwMTkgMTI6MDksIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBBZGQgZG9jdW1lbnRhdGlvbiBmb3IgdGhlIG5ldyAic2NoZWQtZ3Jh
biIgaHlwZXJ2aXNvciBib290IHBhcmFtZXRlci4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4+PiAtLS0KPj4+ICAgZG9jcy9taXNjL3hlbi1j
b21tYW5kLWxpbmUucGFuZG9jIHwgMjEgKysrKysrKysrKysrKysrKysrKysrCj4+PiAgIDEgZmls
ZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RvY3MvbWlz
Yy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYyBiL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBh
bmRvYwo+Pj4gaW5kZXggZmM2NDQyOTA2NC4uYzg1NTI0NjA1MCAxMDA2NDQKPj4+IC0tLSBhL2Rv
Y3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYwo+Pj4gKysrIGIvZG9jcy9taXNjL3hlbi1j
b21tYW5kLWxpbmUucGFuZG9jCj4+PiBAQCAtMTc4Miw2ICsxNzgyLDI3IEBAIFNldCB0aGUgdGlt
ZXNsaWNlIG9mIHRoZSBjcmVkaXQxIHNjaGVkdWxlciwgaW4gbWlsbGlzZWNvbmRzLiAgVGhlCj4+
PiAgIGRlZmF1bHQgaXMgMzBtcy4gIFJlYXNvbmFibGUgdmFsdWVzIG1heSBpbmNsdWRlIDEwLCA1
LCBvciBldmVuIDEgZm9yCj4+PiAgIHZlcnkgbGF0ZW5jeS1zZW5zaXRpdmUgd29ya2xvYWRzLgo+
Pj4gICAKPj4+ICsjIyMgc2NoZWQtZ3JhbiAoeDg2KQo+Pj4gKz4gYD0gY3B1IHwgY29yZSB8IHNv
Y2tldGAKPj4+ICsKPj4+ICs+IERlZmF1bHQ6IGBzY2hlZC1ncmFuPWNwdWAKPj4+ICsKPj4+ICtT
ZXQgdGhlIHNjaGVkdWxpbmcgZ3JhbnVsYXJpdHkuIEluIGNhc2UgdGhlIGdyYW51bGFyaXR5IGlz
IGxhcmdlciB0aGFuIDEgKGUuZy4KPj4+ICtgY29yZWBvbiBhIFNNVC1lbmFibGVkIHN5c3RlbSwg
b3IgYHNvY2tldGApIG11bHRpcGxlIHZjcHVzIGFyZSBhc3NpZ25lZAo+Pj4gK3N0YXRpY2FsbHkg
dG8gYSAic2NoZWR1bGluZyB1bml0IiB3aGljaCB3aWxsIHRoZW4gYmUgc3ViamVjdCB0byBzY2hl
ZHVsaW5nLgo+Pj4gK1RoaXMgYXNzaWdubWVudCBvZiB2Y3B1cyB0byBzY2hlZHVsaW5nIHVuaXRz
IGlzIGZpeGVkLgo+Pj4gKwo+Pj4gK2BjcHVgOiBWY3B1cyB3aWxsIGJlIHNjaGVkdWxlZCBpbmRp
dmlkdWFsbHkgb24gc2luZ2xlIGNwdXMuCj4+PiArCj4+PiArYGNvcmVgOiBBcyBtYW55IHZjcHVz
IGFzIHRoZXJlIGFyZSBoeXBlcnRocmVhZHMgb24gYSBwaHlzaWNhbCBjb3JlIGFyZQo+Pj4gK3Nj
aGVkdWxlZCB0b2dldGhlciBvbiBhIHBoeXNpY2FsIGNvcmUuCj4+PiArCj4+PiArYHNvY2tldGA6
IEFzIG1hbnkgdmNwdXMgYXMgdGhlcmUgYXJlIGh5cGVydGhyZWFkcyBvbiBhIHBoeXNpY2FsIHNv
Y2tldHMgYXJlCj4+PiArc2NoZWR1bGVkIHRvZ2V0aGVyIG9uIGEgcGh5c2ljYWwgc29ja2V0Lgo+
Pgo+PiBJJ2QgcHJlZmVyIGlmIHRoaXMgZGlkbid0IGVuZCB1cCBJbnRlbC1jZW50cmljOyBpZGVh
bGx5IGl0IGFsc28gd291bGRuJ3QgYmUKPj4geDg2LXNwZWNpZmljLiBBTUQgaGFzIGludHJvZHVj
ZWQgaHlwZXJ0aHJlYWRpbmcgaW4gRmFtMTcgb25seTsgRmFtMTUgdXNlZAo+PiAiY29tcHV0ZSB1
bml0cyIsIGdyb3VwaW5nIHRvZ2V0aGVyICJjb3JlcyIuIEludGVybmFsbHkgdGhlIEludGVsIHNp
ZGUKPj4gImNvcmUgdnMgaHlwZXJ0aHJlYWQiIGlzIHJlcHJlc2VudGVkIGluIHRoZSBzYW1lIHZh
cmlhYmxlcyAoY3B1X3NpYmxpbmdfbWFzawo+PiBpbiBwYXJ0aWN1bGFyKSBhcyB0aGUgQU1EIHNp
ZGUgImNvbXB1dGUgdW5pdCB2cyBjb3JlIi4KPiAKPiBZZXMsIGl0IGlzIGEgbWVzcy4KPiAKPj4g
VGhlcmVmb3JlIGl0IG1heSBiZSBiZXR0ZXIgdG8gdGFsayBoZXJlIGFib3V0IGUuZy4gInNtYWxs
ZXN0IHRvcG9sb2dpY2FsCj4+IHN1Yi11bml0IiBhbmQgb25seSBzYXkgImUuZy4gYSBoeXBlcnRo
cmVhZCB0byBtYWtlIGEgY29ubmVjdGlvbiB0byBjb21tb24KPj4geDg2IC8gSW50ZWwgdGVybWlu
b2xvZ3kiLiBPZiBjb3Vyc2UgdGhlIEFNRCBzaWRlIGFsdGVybmF0aXZlIHVzZSBvZiB0aGUKPj4g
dmFyaWFibGVzIGFsc28gcmVuZGVycyB0aGUgYWN0dWFsIGNvbW1hbmQgbGluZSBvcHRpb24gInNj
aGVkLWdyYW49Y29yZSIKPj4gbm90IG92ZXJseSBmb3J0dW5hdGUuIFBlcmhhcHMgd2UnZCB3YW50
IHRvIGFsc28gdXNlIG1vcmUgYWJzdHJhY3QgdGVybXMKPj4gaGVyZSwgZS5nLiB0b3BvbG9naWNh
bCAibGV2ZWxzIj8KPiAKPiBJIHRoaW5rIHJlZ2FyZGluZyB1c2FnZSBvZiAiaHlwZXJ0aHJlYWRz
IiBJJ2xsIGdvIHdpdGg6Cj4gCj4gK2BjcHVgOiBWY3B1cyB3aWxsIGJlIHNjaGVkdWxlZCBpbmRp
dmlkdWFsbHkgb24gc2luZ2xlIGNwdXMgKGUuZy4gYQo+ICsgaHlwZXJ0aHJlYWQgdXNpbmcgeDg2
L0ludGVsIHRlcm1pbm9sb2d5KQo+ICsKPiArIGBjb3JlYDogQXMgbWFueSB2Y3B1cyBhcyB0aGVy
ZSBhcmUgY3B1cyBvbiBhIHBoeXNpY2FsIGNvcmUgYXJlCj4gKyBzY2hlZHVsZWQgdG9nZXRoZXIg
b24gYSBwaHlzaWNhbCBjb3JlLgo+IC4uLgo+IAo+IEkgdGhpbmsgdXNpbmcgImNvcmUiIGlzIGZp
bmUuIFdlIGhhdmUgaXQgaW4gbXVsdGlwbGUgcGxhY2VzIGluIHRoZQo+IGh5cGVydmlzb3Igd2hp
Y2ggYXJlIF9ub3RfIHNwZWNpZmljIHRvIEludGVsLgoKV2VsbCwgd2hhdCB3ZSBoYXZlIGluIGh5
cGVydmlzb3Igc291cmNlcyBpcyBvbmUgdGhpbmcgLSB3ZSBjYW4Kc2V0dGxlIG9uIGFueSBjb252
ZW50aW9uIHdlIHdhbnQgdGhlcmUuIEl0J3MgdGhlIHVzZXIgKGFkbWluKQppbnRlcmZhY2UgKGku
ZS4gdGhlIGNvbW1hbmQgbGluZSBvcHRpb24gbmFtZSBhbmQgZGVzY3JpcHRpb24KaGVyZSkgd2hp
Y2ggd2UgbWF5IHdhbnQgdG8gYmUgYSBsaXR0bGUgbW9yZSBjYXJlZnVsIHdpdGguIEJ1dAp5ZXMs
IEkgY2FuIHNlZSBob3cgd2UgdXNlICJjb3JlIiBhbHJlYWR5IGluIHNpbWlsYXIgY29udGV4dHMK
aW4gdGhlIGNvbW1hbmQgbGluZSBvcHRpb24gZG9jLCBmaXJzdCBhbmQgZm9yZW1vc3Qgb24KImNy
ZWRpdDJfcnVucXVldWUiLiAoSW4gcmV0cm9zcGVjdCBJIHRoaW5rIHRoaXMgbWlnaHQgaGF2ZSBi
ZWVuCmEgbWlzdGFrZSB0aG91Z2guKQoKPiBBbmQgImNvcmUtc2NoZWR1bGluZyIgaXMgYSB3ZWxs
LWtub3duIGJ1enp3b3JkIGFscmVhZHkuCgpMZXQgbWUgbm90IGdldCBzdGFydGVkIG9uIGJ1enp3
b3JkcyA7LSkKCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
