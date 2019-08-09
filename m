Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1653788160
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 19:37:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw8nG-0008DE-1W; Fri, 09 Aug 2019 17:35:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5OiB=WF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hw8nF-0008D9-2o
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 17:35:09 +0000
X-Inumbo-ID: 07367d08-bacc-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 07367d08-bacc-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 17:35:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B29E215A2;
 Fri,  9 Aug 2019 10:35:06 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 26B053F694;
 Fri,  9 Aug 2019 10:35:06 -0700 (PDT)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
 <1564763985-20312-2-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <45cdffdb-6a07-1a8e-9dc5-1e7531af6636@arm.com>
Date: Fri, 9 Aug 2019 18:35:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564763985-20312-2-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2 1/6] iommu/arm: Add iommu_helpers.c file
 to keep common for IOMMUs stuff
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgT2xla3NhbmRyLAoKT24gMDIvMDgvMjAxOSAxNzozOSwgT2xla3NhbmRyIFR5c2hjaGVua28g
d3JvdGU6Cj4gRnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtv
QGVwYW0uY29tPgo+IAo+IEludHJvZHVjZSBhIHNlcGFyYXRlIGZpbGUgdG8ga2VlcCB2YXJpb3Vz
IGhlbHBlcnMgd2hpY2ggY291bGQgYmUgdXNlZAo+IGJ5IG1vcmUgdGhhbiBvbmUgSU9NTVUgZHJp
dmVyIGluIG9yZGVyIG5vdCB0byBkdXBsaWNhdGUgY29kZS4KPiAKPiBUaGUgZmlyc3QgY29uZGlk
YXRlcyB0byBiZSBtb3ZlZCB0byB0aGUgbmV3IGZpbGUgYXJlIFNNTVUgZHJpdmVyJ3MKCk5JVDog
cy9jb25kaWRhdGVzL2NhbmRpZGF0ZXMvCgo+ICJtYXBfcGFnZS91bm1hcF9wYWdlIiBjYWxsYmFj
a3MuIFRoZXJlIGNhbGxiYWNrcyBuZWl0aGVyIGNvbnRhaW4gYW55Cj4gU01NVSBzcGVjaWZpYyBp
bmZvIG5vciBwZXJmb3JtIGFueSBTTU1VIHNwZWNpZmljIGFjdGlvbnMgYW5kIGFyZSBnb2luZwo+
IHRvIGJlIHRoZSBzYW1lIGFjcm9zcyBhbGwgSU9NTVUgZHJpdmVycyB3aGljaCBIL1cgSVAgc2hh
cmVzIFAyTQo+IHdpdGggdGhlIENQVSBsaWtlIFNNTVUgZG9lcy4KPiAKPiBTbywgbW92ZSBjYWxs
YmFja3MgdG8gaW9tbXVfaGVscGVycy5jIGZvciB0aGUgdXBjb21pbmcgSVBNTVUgZHJpdmVyCj4g
dG8gYmUgYWJsZSB0byByZS11c2UgdGhlbS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIg
VHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+Cj4gLS0tCj4gICB4ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vTWFrZWZpbGUgICAgICAgIHwgIDIgKy0KPiAgIHhlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9pb21tdV9oZWxwZXJzLmMgfCA3OCArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+ICAgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUuYyAg
ICAgICAgICB8IDQ4ICstLS0tLS0tLS0tLS0tLS0tLQo+ICAgeGVuL2luY2x1ZGUvYXNtLWFybS9p
b21tdS5oICAgICAgICAgICAgICAgICB8ICA3ICsrKwo+ICAgNCBmaWxlcyBjaGFuZ2VkLCA4OCBp
bnNlcnRpb25zKCspLCA0NyBkZWxldGlvbnMoLSkKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaW9tbXVfaGVscGVycy5jCj4gCj4gZGlmZiAtLWdpdCBh
L3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9NYWtlZmlsZSBiL3hlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL2FybS9NYWtlZmlsZQo+IGluZGV4IGIzZWZjZmQuLjRhYmI4N2EgMTAwNjQ0Cj4gLS0t
IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL01ha2VmaWxlCj4gKysrIGIveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvYXJtL01ha2VmaWxlCj4gQEAgLTEsMiArMSwyIEBACj4gLW9iai15ICs9
IGlvbW11Lm8KPiArb2JqLXkgKz0gaW9tbXUubyBpb21tdV9oZWxwZXJzLm8KPiAgIG9iai0kKENP
TkZJR19BUk1fU01NVSkgKz0gc21tdS5vCj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL2FybS9pb21tdV9oZWxwZXJzLmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0v
aW9tbXVfaGVscGVycy5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwLi41
M2U4ZGFhCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2Fy
bS9pb21tdV9oZWxwZXJzLmMKPiBAQCAtMCwwICsxLDc4IEBACj4gKy8qCj4gKyAqIHhlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL2FybS9pb21tdV9oZWxwZXJzLmMKPiArICoKPiArICogQ29udGFpbnMg
dmFyaW91cyBoZWxwZXJzIHRvIGJlIHVzZWQgYnkgSU9NTVUgZHJpdmVycy4KPiArICoKPiArICog
Q29weXJpZ2h0IChDKSAyMDE5IEVQQU0gU3lzdGVtcyBJbmMuCgpZb3UgbW9zdGx5IG1vdmVkIHRo
ZSBjb2RlIGZyb20gdGhlIFNNTVUgY29kZSwgc28gdGhlIGNvcHlyaWdodCB0aGVyZSBzaG91bGQg
YmUgCnJldGFpbi4gQXMgdGhpcyBpcyBYZW4gbW9kaWZpY2F0aW9uIHRoZSBjb3B5cmlnaHQgaGVy
ZSBzaG91bGQgYmU6CgogICogQ29weXJpZ2h0IChDKSAyMDE0IExpbmFybyBMaW1pdGVkLgoKPiAr
ICoKPiArICogVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmli
dXRlIGl0IGFuZC9vcgo+ICsgKiBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIGFuZCBjb25kaXRp
b25zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMKPiArICogTGljZW5zZSwgdmVyc2lvbiAyLCBh
cyBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbi4KPiArICoKPiArICog
VGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1
c2VmdWwsCj4gKyAqIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBp
bXBsaWVkIHdhcnJhbnR5IG9mCj4gKyAqIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBB
IFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUgR05VCj4gKyAqIEdlbmVyYWwgUHVibGljIExp
Y2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KPiArICoKPiArICogWW91IHNob3VsZCBoYXZlIHJlY2Vp
dmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljCj4gKyAqIExpY2Vuc2UgYWxvbmcg
d2l0aCB0aGlzIHByb2dyYW07IElmIG5vdCwgc2VlIDxodHRwOi8vd3d3LmdudS5vcmcvbGljZW5z
ZXMvPi4KPiArICovCj4gKwo+ICsjaW5jbHVkZSA8eGVuL2xpYi5oPgo+ICsjaW5jbHVkZSA8eGVu
L3NjaGVkLmg+Cj4gKyNpbmNsdWRlIDx4ZW4vaW9tbXUuaD4KCkNvdWxkIHlvdSBvcmRlciB0aGUg
aGVhZGVycyBhYm92ZSBhbHBoYWJldGljYWwgcGxlYXNlPwoKQW5kIGFsc28gYXMgYSBleHRyYSBO
SVQgYSBuZXdsaW5lIGJlZm9yZSAneGVuJyBoZWFkZXJzIGFuZCAnYXNtJyBvbmUgOikuCgo+ICsj
aW5jbHVkZSA8YXNtL2RldmljZS5oPgoKVGhlIHJlc3Qgb2YgdGhlIGdvb2QgbG9va3MgZ29vZCB0
byBtZS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
