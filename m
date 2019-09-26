Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 915ABBF003
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 12:48:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDRHz-0002pi-Gy; Thu, 26 Sep 2019 10:46:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UviC=XV=arm.com=robin.murphy@srs-us1.protection.inumbo.net>)
 id 1iDRHx-0002pP-Go
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 10:46:21 +0000
X-Inumbo-ID: e03d2628-e04a-11e9-bf31-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id e03d2628-e04a-11e9-bf31-bc764e2007e4;
 Thu, 26 Sep 2019 10:46:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 567981576;
 Thu, 26 Sep 2019 03:46:20 -0700 (PDT)
Received: from [192.168.1.124] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE7E83F67D;
 Thu, 26 Sep 2019 03:46:18 -0700 (PDT)
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, Rob Herring <robh@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <20190925215006.12056-1-robh@kernel.org>
 <e898c025-32a7-1d2c-3501-c99556f7cdd4@arm.com>
 <1ae7f42e-bf93-b335-b543-653fae5cf49f@epam.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <28440326-ed76-b014-c1b8-02125c3214b9@arm.com>
Date: Thu, 26 Sep 2019 11:46:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <1ae7f42e-bf93-b335-b543-653fae5cf49f@epam.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [RFC PATCH] xen/gntdev: Stop abusing DT
 of_dma_configure API
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAxOS0wOS0yNiAxMToxNyBhbSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4g
Cj4gT24gOS8yNi8xOSAxMjo0OSBQTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSBSb2IsCj4+
Cj4+Cj4+IE9uIDkvMjUvMTkgMTA6NTAgUE0sIFJvYiBIZXJyaW5nIHdyb3RlOgo+Pj4gQXMgdGhl
IGNvbW1lbnQgc2F5cywgdGhpcyBpc24ndCBhIERUIGJhc2VkIGRldmljZS4gb2ZfZG1hX2NvbmZp
Z3VyZSgpCj4+PiBpcyBnb2luZyB0byBzdG9wIGFsbG93aW5nIGEgTlVMTCBEVCBub2RlLCBzbyB0
aGlzIG5lZWRzIHRvIGJlIGZpeGVkLgo+Pgo+PiBBbmQgdGhpcyBjYW4ndCB3b3JrIG9uIGFyY2gg
bm90IHNlbGVjdGluZyBDT05GSUdfT0YgYW5kIGNhbiBzZWxlY3QKPj4gQ09ORklHX1hFTl9HUkFO
VF9ETUFfQUxMT0MuCj4+Cj4+IFdlIGFyZSBsdWNreSBlbm91Z2ggb24geDg2IGJlY2F1c2UsIEFG
QUlDVCwgYXJjaF9zZXR1cF9kbWFfb3BzIGlzIGp1c3QKPj4gYSBub3AuCj4+Cj4gTm8gbHVjayBp
cyBuZWVkZWQgYXMgWzFdIGRvZXMgbm90aGluZyBmb3IgdGhvc2UgcGxhdGZvcm1zIG5vdCB1c2lu
Zwo+IENPTkZJR19PRgo+Pj4KPj4+IE5vdCBzdXJlIGV4YWN0bHkgd2hhdCBzZXR1cCBiZXNpZGVz
IGFyY2hfc2V0dXBfZG1hX29wcyBpcyBuZWVkZWQuLi4KPj4KPj4gV2UgcHJvYmFibHkgd2FudCB0
byB1cGRhdGUgZG1hX21hc2ssIGNvaGVyZW50X2RtYV9tYXNrIGFuZAo+PiBkbWFfcGZuX29mZnNl
dC4KPj4KPj4gQWxzbywgd2hpbGUgbG9vayBhdCBvZl9jb25maWd1cmVfZG1hLCBJIG5vdGljZWQg
dGhhdCB3ZSBjb25zaWRlciB0aGUKPj4gRE1BIHdpbGwgbm90IGJlIGNvaGVyZW50IGZvciB0aGUg
Z3JhbnQtdGFibGUuIE9sZWtzYW5kciwgZG8geW91IGtub3cKPj4gd2h5IHRoZXkgY2FuJ3QgYmUg
Y29oZXJlbnQ/Cj4gVGhlIG1haW4gYW5kIHRoZSBvbmx5IHJlYXNvbiB0byB1c2Ugb2ZfY29uZmln
dXJlX2RtYSBpcyB0aGF0IGlmIHdlIGRvbid0Cj4gdGhlbiB3ZQo+IGFyZSBhYm91dCB0byBzdGF5
IHdpdGggZG1hX2R1bW15X29wcyBbMl0uIEl0IGVmZmVjdGl2ZWx5IG1lYW5zIHRoYXQKPiBvcGVy
YXRpb25zIG9uIGRtYS1idWZzCj4gd2lsbCBlbmQgdXAgcmV0dXJuaW5nIGVycm9ycywgbGlrZSBb
M10sIFs0XSwgdGh1cyBub3QgbWFraW5nIGl0IHBvc3NpYmxlCj4gZm9yIFhlbiBQViBEUk0gYW5k
IERNQQo+IHBhcnQgb2YgZ250ZGV2IGRyaXZlciB0byBkbyB3aGF0IHdlIG5lZWQgKGRtYS1idWZz
IGluIG91ciB1c2UtY2FzZXMKPiBhbGxvdyB6ZXJvLWNvcHlpbmcKPiB3aGlsZSB1c2luZyBncmFw
aGljcyBidWZmZXJzIGFuZCBtYW55IG1vcmUpLgo+IAo+IEkgZGlkbid0IGZpbmQgYW55IGJldHRl
ciB3YXkgb2YgYWNoaWV2aW5nIHRoYXQsIGJ1dCBvZl9jb25maWd1cmVfZG1hLi4uCj4gSWYgdGhl
cmUgaXMgYW55IGJldHRlciBzb2x1dGlvbiB3aGljaCB3aWxsIG5vdCBicmVhayB0aGUgZXhpc3Rp
bmcKPiBmdW5jdGlvbmFsaXR5IHRoZW4KPiBJIHdpbGwgZGVmaW5pdGVseSBjaGFuZ2UgdGhlIGRy
aXZlcnMgc28gd2UgZG8gbm90IGFidXNlIERUICkKPiBCZWZvcmUgdGhhdCwgcGxlYXNlIGtlZXAg
aW4gbWluZCB0aGF0IG1lcmdpbmcgdGhpcyBSRkMgd2lsbCBicmVhayBYZW4gUFYKPiBEUk0gKwo+
IERNQSBidWYgc3VwcG9ydCBpbiBnbnRkZXYuLi4KPiBIb3BlIHdlIGNhbiB3b3JrIG91dCBzb21l
IGFjY2VwdGFibGUgc29sdXRpb24sIHNvIGV2ZXJ5b25lIGlzIGhhcHB5CgpBcyBJIG1lbnRpb25l
ZCBlbHNld2hlcmUsIHRoZSByZWNlbnQgZG1hLWRpcmVjdCByZXdvcmsgbWVhbnMgdGhhdCAKZG1h
X2R1bW15X29wcyBhcmUgbm93IG9ubHkgZXhwbGljaXRseSBpbnN0YWxsZWQgZm9yIHRoZSBBQ1BJ
IGVycm9yIGNhc2UsIApzbyAtIG11Y2ggYXMgSSBtYXkgZGlzbGlrZSBpdCAtIHlvdSBzaG91bGQg
Z2V0IHJlZ3VsYXIgKGRpcmVjdC9TV0lPVExCKSAKb3BzIGJ5IGRlZmF1bHQgYWdhaW4uCgpDb2hl
cmVuY3kgaXMgdHJpY2tpZXIgLSBpZiB0aGUgZ3Vlc3QgaXMgYWxsb2NhdGluZyBidWZmZXJzIGZv
ciB0aGUgUFYgCmRldmljZSwgd2hpY2ggbWF5IGJlIHNoYXJlZCBkaXJlY3RseSB3aXRoIGhhcmR3
YXJlIGJ5IHRoZSBob3N0IGRyaXZlciwgCnRoZW4gdGhlIGNvaGVyZW5jeSBvZiB0aGUgUFYgZGV2
aWNlIHNob3VsZCByZWFsbHkgcmVmbGVjdCB0aGF0IG9mIHRoZSAKdW5kZXJseWluZyBoYXJkd2Fy
ZSB0byBhdm9pZCBwb3RlbnRpYWwgcHJvYmxlbXMuIFRoZXJlIGFyZSBzb21lIGNhc2VzIAp3aGVy
ZSB0aGUgc3RhZ2UgMiBhdHRyaWJ1dGVzIGFsb25lIHdvdWxkbid0IGJlIGVub3VnaCB0byBjb3Jy
ZWN0IGEgbWlzbWF0Y2guCgpSb2Jpbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
