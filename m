Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8FDC2CE9
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 07:31:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFAhO-0000c7-OI; Tue, 01 Oct 2019 05:27:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hN/W=X2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iFAhN-0000c1-JI
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 05:27:45 +0000
X-Inumbo-ID: 3107c8f0-e40c-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 3107c8f0-e40c-11e9-bf31-bc764e2007e4;
 Tue, 01 Oct 2019 05:27:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D0038AD5C;
 Tue,  1 Oct 2019 05:27:41 +0000 (UTC)
To: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190930184425.13756-1-julien.grall@arm.com>
 <3a7baeaa-6276-a9f0-b876-d44996dd9f3f@citrix.com>
 <alpine.DEB.2.21.1909301755030.2594@sstabellini-ThinkPad-T480s>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <ac3b0cff-3dc6-a383-34c3-15ddadd13cce@suse.com>
Date: Tue, 1 Oct 2019 07:27:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1909301755030.2594@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/arm32: head: Fix build when
 using GAS 2.25.0
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
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 Julien Grall <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMTAuMTkgMDI6NTcsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBPbiBNb24sIDMw
IFNlcCAyMDE5LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAzMC8wOS8yMDE5IDE5OjQ0LCBK
dWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBHQVMgMi4yNS4wIHRocm93cyBtdWx0aXBsZSBlcnJvcnMg
d2hlbiBidWlsZGluZyBhcm0zMi9oZWFkLlM6Cj4+Pgo+Pj4gYXJtMzIvaGVhZC5TOiBBc3NlbWJs
ZXIgbWVzc2FnZXM6Cj4+PiBhcm0zMi9oZWFkLlM6NDUyOiBFcnJvcjogaW52YWxpZCBjb25zdGFu
dCAoZjdmKSBhZnRlciBmaXh1cAo+Pj4gYXJtMzIvaGVhZC5TOjQ1MzogRXJyb3I6IGludmFsaWQg
Y29uc3RhbnQgKGY3ZikgYWZ0ZXIgZml4dXAKPj4+IGFybTMyL2hlYWQuUzo0OTU6IEVycm9yOiBp
bnZhbGlkIGNvbnN0YW50IChmN2YpIGFmdGVyIGZpeHVwCj4+PiBhcm0zMi9oZWFkLlM6NTEwOiBF
cnJvcjogaW52YWxpZCBjb25zdGFudCAoZjdmKSBhZnRlciBmaXh1cAo+Pj4gYXJtMzIvaGVhZC5T
OjUxNDogRXJyb3I6IGludmFsaWQgY29uc3RhbnQgKGY3ZikgYWZ0ZXIgZml4dXAKPj4+IGFybTMy
L2hlYWQuUzo1MTY6IEVycm9yOiBpbnZhbGlkIGNvbnN0YW50IChmN2YpIGFmdGVyIGZpeHVwCj4+
PiBhcm0zMi9oZWFkLlM6NjMzOiBFcnJvcjogaW52YWxpZCBjb25zdGFudCAoZjdmKSBhZnRlciBm
aXh1cAo+Pj4KPj4+IFRoaXMgbWFrZXMgc2Vuc2UgYmVjYXVzZSB0aGUgaW5zdHJ1Y3Rpb24gbW92
IGlzIG9ubHkgYWJsZSB0byBkZWFsIHdpdGggYQo+Pj4gc3BlY2lmaWMgc2V0IG9mIGltbWVkaWF0
ZSAoc2VlICJtb2RpZmllZCBpbW1lZGlhdGUgY29uc3RhbnRzIGluIEFSTQo+Pj4gaW5zdHJ1Y3Rp
b25zIikuIEZvciBhbnkgMTYtYml0IGltbWVkaWF0ZSwgdGhlIGluc3RydWN0aW9uIG1vdncgc2hv
dWxkIGJlCj4+PiB1c2VkLgo+Pj4KPj4+IEl0IGxvb2tzIGxpa2UgbmV3ZXIgdmVyc2lvbiBvZiBH
QVMgd2lsbCBzZWVtbHkgc3dpdGNoIHRvIG1vdncgaWYgdGhlCj4+PiBpbW1lZGlhdGUgZG9lcyBu
b3QgZml0IGluIHRoZSBpbW1lZGlhdGUgZW5jb2RpbmcgZm9yIG1vdi4gQnV0IHdlIHNob3VsZAo+
Pj4gbm90IHJlbHkgb24gdGhpcy4gU28gc3dpdGNoIHRvIG1vdncuCj4+Pgo+Pj4gRml4ZXM6IDIz
ZGZlNDhkMTAgKCJ4ZW4vYXJtMzI6IGhlYWQ6IEludHJvZHVjZSBtYWNyb3MgdG8gY3JlYXRlIHRh
YmxlIGFuZCBtYXBwaW5nIGVudHJ5IikKPj4+IFJlcG9ydGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+Pj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxs
IDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4KPj4gRldJVywgVGVzdGVkLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiwgb25seSBpbnNvZmFyCj4+IGFzIGl0IGZp
eGluZyB0aGUgYnVpbGQuwqAgSSBoYXZlbid0IGJvb3RlZCB0aGUgcmVzdWx0aW5nIGJpbmFyeS4K
PiAKPiBSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPgo+IAo+IEdpdmVuIHRoYXQgdGhpcyBpcyBhIHN0cmFpZ2h0Zm9yd2FyZCBidWlsZCBmaXgs
IGFuZCBkdWUgdG8gdGltZXpvbmUKPiBkaWZmZXJlbmNlcywgSSBoYXZlIGNvbW1pdHRlZCBpdCAo
YWZ0ZXIgdmVyaWZ5aW5nIGl0IGZpeGVzIHRoZSBidWlsZAo+IG15c2VsZikuIEkgaG9wZSB0aGF0
IEp1ZXJnZW4gYXBwcm92ZXMuCj4gCgpJIGRvLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
