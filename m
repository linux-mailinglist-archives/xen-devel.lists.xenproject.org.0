Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E41963E8
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 17:14:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i05nj-00069M-MN; Tue, 20 Aug 2019 15:11:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aYQB=WQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i05ni-00069C-My
 for xen-devel@lists.xen.org; Tue, 20 Aug 2019 15:11:58 +0000
X-Inumbo-ID: d94107e6-c35c-11e9-92eb-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id d94107e6-c35c-11e9-92eb-bc764e2007e4;
 Tue, 20 Aug 2019 15:11:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB05428;
 Tue, 20 Aug 2019 08:11:55 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1DE733F246;
 Tue, 20 Aug 2019 08:11:54 -0700 (PDT)
To: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
References: <20190416125832.32881-2-wipawel@amazon.de>
 <20190820132854.110843-1-wipawel@amazon.de>
 <7401194e-6070-968f-6254-cfdeaf7514a1@arm.com>
 <CB3FCDBE-6DD1-4F17-B106-AE26E478AB74@amazon.com>
 <c6b76dbd-bf18-aa66-0e55-84b9adedb45a@arm.com>
 <2BE73DB1-9C24-4728-AC08-4A3C5E4187F6@amazon.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <4e85f14f-d441-9e24-9916-2539a4301abc@arm.com>
Date: Tue, 20 Aug 2019 16:11:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2BE73DB1-9C24-4728-AC08-4A3C5E4187F6@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [livepatch: independ. modules v2 2/3] livepatch:
 Allow to override inter-modules buildid dependency
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xen.org>,
 "Pohlack, Martin" <mpohlack@amazon.de>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUGF3ZWwsCgpPbiAyMC8wOC8yMDE5IDE1OjUyLCBXaWVjem9ya2lld2ljeiwgUGF3ZWwgd3Jv
dGU6Cj4gCj4+IE9uIDIwLiBBdWcgMjAxOSwgYXQgMTY6MjgsIEp1bGllbiBHcmFsbCA8anVsaWVu
LmdyYWxsQGFybS5jb20+IHdyb3RlOgo+Pgo+PiBIaSwKPj4KPj4+Pgo+IOKApnNuaXAuLi4KPj4+
IFllYWgsIHNpbmNlIEkgZ290IGZlZWRiYWNrIGFuZCByZXZpZXdzIG9uIHZhcmlvdXMgcGF0Y2hl
cyB0aGF0IEkgaGF2ZSBhbHJlYWR5IHN1Ym1pdHRlZCB0aGUgd2F5IEkgZGlkLAo+Pj4gSSBzaW1w
bHkgY29udGludWUgd2l0aCB3aGF0IEkgaGF2ZSB1bnRpbCBhbGwgY29tbWVudHMgYXJlIGFkZHJl
c3NlZCAoSSBkbyBub3Qgd2FudCB0byBsb3NlIGFueXRoaW5nKS4KPj4KPj4gV2hhdCBkbyB5b3Ug
bWVhbiBieSAiYWxsIGNvbW1lbnRzIGFyZSBhZGRyZXNzZWQiPyBVc3VhbGx5IHlvdSBnYXRoZXIg
YSBzZXQgb2YgY29tbWVudHMgZm9yIGEgc2VyaWVzLCBhZGRyZXNzIHRoZW0gYW5kIHRoZW4gcmVz
ZW5kIHRoZSBzZXJpZXMgd2l0aCBhbGwgb2YgdGhlbSBhZGRyZXNzZWQuCj4+Cj4gCj4gWWVhaCwg
YnV0IHBlb3BsZSBpbnZlc3RlZCB0aW1lIGluIHJldmlld3MgYW5kIHJlcGxpZWQgdG8gbXkgaW5j
b3JyZWN0bHkgc2VudCB0aHJlYWRzLCBzbyBJIGZpbmQgaXQgcnVkZSB0byBpZ25vcmUgc3VjaCBj
b21tZW50cyBhbmQgc3RhcnQgYSBuZXcgdGhyZWFkIGluc3RlYWQuCgpJZiB5b3UgcmVzZW5kIGEg
bmV3IHZlcnNpb24gaW4gYSBmZXcgZGF5cyB3aXRoIGNvbW1lbnRzIGFkZHJlc3NlZCwgdGhlbiBt
b3N0IG9mIAp0aGUgcmV2aWV3ZXJzIHdpbGwgYmUgbW9zdGx5IGxpa2VseSBoYXBweSA6KS4KCklm
IEkgd2FudGVkIHRvIGp1bXAgb24gdGhlIHNlcmllcyBub3csIEkgaGF2ZSBubyBpZGVhIHdoZXJl
IHRvIHN0YXJ0LCB3aGljaCAKdmVyc2lvbiBpcyB0aGUgbGF0ZXN0LiBJdCBpcyBhbHNvIHByZXR0
eSBub3QgY2xlYXIgd2h5IG9uZSBwYXRjaCBvZiB0aGUgc2VyaWVzIAppcyBhdCB2ZXJzaW9uIDMg
d2hlbiBhbm90aGVyIGlzIGF0IHZlcnNpb24gMi4KCktlZXBpbmcgdmVyc2lvbiBzZXBhcmF0ZWQg
bWFrZSBxdWl0ZSBjbGVhciB3aGVyZSB3ZSBhcmUgYW5kIGFsc28gYWxsb3dzIHRvIAphdXRvbWF0
aWMgdG9vbHMgdG8gcGljayBpdCB1cC4KCgo+IEJ1dCBpZiB0aGlzIGlzIHRoZSByZWNvbW1lbmRl
ZCBwcmFjdGljZSwgSSB3aWxsIG9iZXkuCgpNb3N0IG9mIChpZiBub3QgYWxsKSB0aGUgcmVjb21t
ZW5kZWQgZ3VpZGVsaW5lcyBhcmUgZ2F0aGVyZWQgb24gdGhlIHdpa2kgKFsxXSkuCgo+IAo+Pj4g
VGhlbiwgSSB3aWxsIHJlLXNlbmQgdGhlIHBhdGNoZXMgaW4gMiBzZXJpZXM6IGxpdmVwYXRjaC1i
dWlsZC10b29scyBhbmQgeGVuIHdpdGggYWxsIGNoYW5nZXMsCj4+PiBSZXZpZXdlZC1ieS9BY2tl
ZC1ieSBhbmQgY292ZXIgbGV0dGVycy4gVGhpcyBpcyB0aGUgd2F5IHJlY29tbWVuZGVkIGJ5IEFu
ZHJldy4KPj4KPj4gUGxlYXNlIGRvbid0IHNlbmQgdGhlIHBhdGNoIG9uZSBieSBvbmUgdG8gY2hl
Y2sgaWYgZXZlcnlvbmUgaXMgaGFwcHkuIEp1c3QgcmVzZW5kIGFsbCBvZiB0aGVtIGluIG9uZSBn
byBvbmNlIHlvdSBnYXRoZXJlZCBlbm91Z2ggZmVlZGJhY2suCj4+Cj4gCj4gT2suCj4gCj4+PiBV
bmZvcnR1bmF0ZWx5LCBpdCB3aWxsIGJlIGFsc28gcXVpdGUgY29uZnVzaW5nIEkgdGhpbmssIGJl
Y2F1c2UgdmFyaW91cyBjaGFuZ2VzIGJlbG9uZ2luZyB0byBkaWZmZXJlbnQgdG9waWNzLAo+Pj4g
YXJlIGRpc3RyaWJ1dGVkIGJldHdlZW4gdGhvc2UgMiBkaXN0aW5jdCByZXBvcy4KPj4KPj4gVGhh
dCBhbHNvIGhhcHBlbiB3aGVuIHlvdSBoYXZlIG11bHRpcGxlIHBhdGNoZXMgaW4gYSBzZXJpZXMu
IEZlYXR1cmUgaW1wbGVtZW50ZWQgYWNjcm9zcyBtdWx0aXBsZSBwYXRjaCBuZWVkcyBhIHBsYWNl
IHRvIGRpc2N1c3MuIFRoaXMgY2FuIHVzdWFsbHkgYmUgZG9uZSBpbiB0aGUgY292ZXIgbGV0dGVy
LiBGb3IgbXVsdGkgcmVwbyBzZXJpZXMsIHlvdSBjYW4gc3RlZXIgdGhlIGRpc2N1c3Npb24gb24g
YSBzaW5nbGUgcmVwbyBhbmQganVzdCByZXBsaWNhdGUgdGhlIGNoYW5nZXMgaW4gdGhlIG90aGVy
IG9uZSBvbmNlIHRoZXJlIGFyZSBhbiBhZ3JlZW1lbnQuCj4gCj4gRmluZS4gTGV0IG1lIHRoZW4g
c2VuZCB0aGUgMiBmdWxsIHNlcmllcyBmb3IgZWFjaCByZXBvIHdpdGggYWxsIHRoZSBjaGFuZ2Vz
IGFuZCBjb3JyZXNwb25kaW5nIGNvdmVyIGxldHRlcnMuCgpUaGFuayB5b3UhCgpDaGVlcnMsCgpb
MV0gCmh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL1N1Ym1pdHRpbmdfWGVuX1Byb2pl
Y3RfUGF0Y2hlcyNSZXZpZXcuMkNfUmluc2VfLjI2X1JlcGVhdAoKLS0gCkp1bGllbiBHcmFsbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
