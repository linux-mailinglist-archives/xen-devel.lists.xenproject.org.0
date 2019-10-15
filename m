Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DF0D742C
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 13:06:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKKaS-0000OS-U0; Tue, 15 Oct 2019 11:01:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dEpp=YI=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iKKaQ-0000OM-Lf
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 11:01:54 +0000
X-Inumbo-ID: 326777ce-ef3b-11e9-a531-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 326777ce-ef3b-11e9-a531-bc764e2007e4;
 Tue, 15 Oct 2019 11:01:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3D8928;
 Tue, 15 Oct 2019 04:01:53 -0700 (PDT)
Received: from [10.37.8.6] (unknown [10.37.8.6])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 555DA3F68E;
 Tue, 15 Oct 2019 04:01:52 -0700 (PDT)
To: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20191004004745.26522-1-stewart.hildebrand@dornerworks.com>
 <39153cd6-efe5-1b5d-baba-b567c151a5f3@arm.com>
 <2474d9869a5c46e39ea862a2c78a04c4@dornerworks.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <8c959176-715b-db7d-cf2f-a810791f676f@arm.com>
Date: Tue, 15 Oct 2019 12:01:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2474d9869a5c46e39ea862a2c78a04c4@dornerworks.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: platform: fix Raspberry Pi
 compatible string
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
Cc: Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxMC85LzE5IDU6NTkgUE0sIFN0ZXdhcnQgSGlsZGVicmFuZCB3cm90ZToKPiBPbiBX
ZWRuZXNkYXksIE9jdG9iZXIgOSwgMjAxOSAxMTozMCBBTSwgSnVsaWVuIEdyYWxsIDxqdWxpZW4u
Z3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IE9uIDA0LzEwLzIwMTkgMDE6NDcsIFN0ZXdhcnQgSGls
ZGVicmFuZCB3cm90ZToKPj4+IEJvdGggdXBzdHJlYW0gWzFdIGFuZCBkb3duc3RyZWFtIFsyXSBM
aW51eCBrZXJuZWxzIHVzZSAiYnJjbSxiY20yNzExIgo+Pj4gYXMgdGhlIGNvbXBhdGlibGUgc3Ry
aW5nIGZvciBSYXNwYmVycnkgUGkgNC4gQWRkIHRoaXMgc3RyaW5nIHRvIG91cgo+Pj4gcGxhdGZv
cm0gY29tcGF0aWJsZSBsaXN0Lgo+Pgo+PiBEaWQgdGhlIFJQSSBmb3VuZGF0aW9uIHJlbGVhc2Vk
IGFueSBrZXJuZWwgd2l0aCB0aGUgb2xkIGJpbmRpbmc/Cj4gCj4gU3VyZSwgSSBzZWUgdGhlIGZv
bGxvd2luZyB0YWdzIGluIHRoZWlyIGxpbnV4IHRyZWUgc2luY2UgaW5pdGlhbCBSUGk0Cj4gc3Vw
cG9ydCB1bnRpbCB0aGUgYmluZGluZyB3YXMgdXBkYXRlZDoKPiByYXNwYmVycnlwaS1rZXJuZWxf
MS4yMDE5MDcwOS0xCj4gcmFzcGJlcnJ5cGkta2VybmVsXzEuMjAxOTA3MTgtMQo+IHJhc3BiZXJy
eXBpLWtlcm5lbF8xLjIwMTkwODE5LTEKPiByYXNwYmVycnlwaS1rZXJuZWxfMS4yMDE5MDkyNS0x
Cj4gCj4gVGhlc2UgY29ycmVzcG9uZCB3aXRoIHRoZWlyIGJpbmFyeSByZWxlYXNlcyBhdCBbM10s
IGV4Y2VwdCB0aGUgYmluYXJ5Cj4gcmVsZWFzZXMgYWxzbyBoYXZlIGFuIGVhcmxpZXIgMS4yMDE5
MDYyMCsxIHRhZyB3aXRoIFJQaTQgc3VwcG9ydC4KPiAKPiBIb3dldmVyLCBldmVuIHdpdGggWGVu
IGxvb2tpbmcgZm9yIGJjbTI4MzgsIHlvdSB3b3VsZG4ndCBiZSBhYmxlIHRvCj4gZ3JhYiBvbmUg
b2YgdGhvc2UgcmVsZWFzZXMgYW5kIGJvb3Qgd2l0aG91dCBydW5uaW5nIGludG8gb3RoZXIgaXNz
dWVzLgo+IFlvdSdkIHN0aWxsIG5lZWQgYSBjb3VwbGUgb2YgYWRkaXRpb25hbCBwYXRjaGVzIGF0
IFs0XS4gQ3VycmVudGx5IHRoZQo+IG9ubHkgd2F5IHRoYXQgSSdtIGF3YXJlIG9mIHRvIHN1Y2Nl
c3NmdWxseSBib290IGludG8gZG9tMCBhbmQgbGF1bmNoCj4gZG9tVSBpcyB0byBidWlsZCB0aGUg
ZG9tMCBrZXJuZWwgZnJvbSBzb3VyY2Ugd2l0aCB0aGUgZXh0cmEgcGF0Y2hlcwo+IGFwcGxpZWQg
Zm91bmQgYXQgWzRdLgoKSXMgdGhlcmUgYW55IHBsYW4gdG8gdXBzdHJlYW0gdGhvc2UgcGF0Y2hl
cz8KCj4gCj4+IElmIHNvLCBJIGFtIG9rIGlmIHdlIGRvbid0IHN1cHBvcnQgdGhlIGNvbXBhdGli
bGUgaW4gWGVuICh3ZSBkb24ndCBoYXZlIGEKPj4gcmVsZWFzZSB3aXRoIGl0IHlldCEpLCBidXQg
aXQgd291bGQgYmUgd29ydGggbWVudGlvbmluZyBpbiB0aGUgY29tbWl0IG1lc3NhZ2UKPj4gdGhh
dCB0aGlzIGlzIGdvaW5nIHRvIGJyZWFrIGZvciBzb21lIHVzZXJzIChUQkQpIHNvIHRoZXkgbmVl
ZCB0byB1cGdyYWRlLgo+IAo+IFNlZSBiZWxvdyBmb3Igc3VnZ2VzdGlvbi4KPiAKPj4gQEp1ZXJn
ZW46IEkgd291bGQgbGlrZSB0byBjb25zaWRlciB0aGlzIHBhdGNoIGZvciBYZW4gNC4xMy4gVGhp
cyBpcyBsaW1pdGVkIHRvCj4+IFJQSTQgYW5kIHdvdWxkIGF2b2lkIHVzIHRvIHNoaXAgaXQgd2l0
aCBhIGNvbXBhdGlibGUgdGhhdCBpcyBnb2luZyB0byBkaXNhcHBlYXIuCj4+Cj4+Pgo+Pj4gVGhl
IGJyY20sYmNtMjgzOCBjb252ZW50aW9uIGlzIGFiYW5kb25lZC4gUmVtb3ZlIGl0Lgo+Pj4KPj4+
IFJlbmFtZSB0aGUgdmFyaWFibGVzIHdpdGhpbiB0aGUgZmlsZSB0byBhIHJwaTRfKiBwcmVmaXgg
c2luY2UgdGhlIGZpbGUKPj4+IGlzIG1lYW50IHRvIGNvdmVyIHRoZSBSYXNwYmVycnkgUGkgNCBw
bGF0Zm9ybS4KPiAKPiAiSWYgeW91IGFyZSB1c2luZyBhIGRldmljZSB0cmVlIHdpdGggdGhlIG9s
ZCBjb21wYXRpYmxlIHN0cmluZwo+IGJyY20sYmNtMjgzOCwgeW91IHdpbGwgbmVlZCB0byB1cGdy
YWRlIHlvdXIgZGV2aWNlIHRyZWUgdG8gb25lIHRoYXQgaGFzCj4gdGhlIG5ldyBicmNtLGJjbTI3
MTEgY29tcGF0aWJsZSBzdHJpbmcuIgoKVGhhdCdzIGZpbmUgd2l0aCBtZS4KCkNoZWVycywKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
