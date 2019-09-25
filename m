Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6D8BDAAF
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 11:14:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD3Jl-0002fB-1X; Wed, 25 Sep 2019 09:10:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KYcU=XU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iD3Jj-0002f6-Kq
 for xen-devel@lists.xen.org; Wed, 25 Sep 2019 09:10:35 +0000
X-Inumbo-ID: 54565566-df74-11e9-962c-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 54565566-df74-11e9-962c-12813bfff9fa;
 Wed, 25 Sep 2019 09:10:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6200B142F;
 Wed, 25 Sep 2019 02:10:33 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 939413F694;
 Wed, 25 Sep 2019 02:10:32 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1908201838370.20094@sstabellini-ThinkPad-T480s>
 <20190821035315.12812-7-sstabellini@kernel.org>
 <8e13c7ad-c3cb-aa46-744b-8dc01fe70718@arm.com>
 <alpine.DEB.2.21.1909241056070.24909@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <3d883055-b997-92e1-3121-e383959a5e25@arm.com>
Date: Wed, 25 Sep 2019 10:10:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1909241056070.24909@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 7/8] xen/arm: introduce nr_spis
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
Cc: Volodymyr_Babchuk@epam.com, Achin.Gupta@arm.com, andrii_anisov@epam.com,
 Stefano Stabellini <stefanos@xilinx.com>, xen-devel@lists.xen.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyNC8wOS8yMDE5IDE4OjU2LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24g
V2VkLCAxMSBTZXAgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSBTdGVmYW5vLAo+Pgo+
PiBPbiA4LzIxLzE5IDQ6NTMgQU0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+IFdlIGRv
bid0IGhhdmUgYSBjbGVhciB3YXkgdG8ga25vdyBob3cgbWFueSB2aXJ0dWFsIFNQSXMgd2UgbmVl
ZCBmb3IgdGhlCj4+PiBkb20wLWxlc3MgZG9tYWlucy4gSW50cm9kdWNlIGEgbmV3IG9wdGlvbiB1
bmRlciB4ZW4sZG9tYWluIHRvIHNwZWNpZnkKPj4+IHRoZSBudW1iZXIgb2YgU1BJcyB0byBhbGxv
Y2F0ZSBmb3IgYSBkb21haW4uCj4+Pgo+Pj4gVGhlIHByb3BlcnR5IGlzIG9wdGlvbmFsLiBXaGVu
IGFic2VudCwgd2UnbGwgdXNlIHRoZSBwaHlzaWNhbCBudW1iZXIgb2YKPj4+IEdJQyBsaW5lcyBm
b3IgZG9tMC1sZXNzIGRvbWFpbnMsIGp1c3QgbGlrZSBmb3IgZG9tMC4gR2l2ZW4gdGhhdAo+Pj4g
ZG9tMC1sZXNzIFZNcyBhcmUgbWVhbnQgZm9yIHN0YXRpYyBwYXJ0aXRpb25pbmcgc2NlbmFyaW9z
IHdoZXJlIHRoZQo+Pj4gbnVtYmVyIG9mIFZNcyBpcyB2ZXJ5IGxvdywgaW5jcmVhc2VkIG1lbW9y
eSBvdmVyaGVhZCBzaG91bGQgbm90IGJlIGEKPj4+IHByb2JsZW0sIGFuZCBpdCBpcyBwb3NzaWJs
ZSB0byBtaW5pbWl6ZSBpdCB1c2luZyAibnJfc3BpcyIuCj4+Pgo+Pj4gUmVtb3ZlIHRoZSBvbGQg
c2V0dGluZyBvZiBucl9zcGlzIGJhc2VkIG9uIHRoZSBwcmVzZW5jZSBvZiB0aGUgdnBsMDExLgo+
Pgo+PiBJIGFtIGFmcmFpZCB0aGlzIHN0aWxsIGRvZXMgbm90IGV4cGxhaW4gdGhlIGltcGxpY2F0
aW9ucyBvZiB0aGlzIHBhdGNoIHRvCj4+IGN1cnJlbnQgc2V0dXAgKHdpdGggYW5kIHdpdGhvdXQg
VlBMMDExKS4KPj4KPj4gRm9yIGluc3RhbmNlLCB3aXRoIHlvdXIgY2hhbmdlLCBWUEwwMTEgbWF5
IG5vdCB3b3JrIGFueW1vcmUuIEltYWdpbmUgd2UgZGVjaWRlCj4+IHRvIHB1c2ggdGhlIHZwbDAx
MSBpbnRlcnJ1cHQgdG93YXJkcyB0aGUgZW5kIG9mIHRoZSBJbnRlcnJ1cHQgSUQgc3BhY2UgKGku
ZS4KPj4gMTAxOSkuCj4+Cj4+IEkgZG9uJ3QgdGhpbmsgd2Ugd2FudCB0aGUgdXNlciB0byBoYXZl
IHRvIHNlbGVjdCBucl9zcGlzIGJ5IGhpbXNlbGYgZm9yIHRoaXMKPj4gY2FzZS4KPj4KPj4gUmVn
YXJkaW5nIHRoZSBjaGFuZ2Ugd2l0aG91dCB2cGwwMTEsIHRoaXMgaXMgbm90IGV4cGxhaW5lZCB3
aHkgYWxsIHRoZSBkb21haW5zCj4+IChldmVuIHRoZSBvbmUgd2l0aG91dCBTUElzIHJvdXRlZCkg
d2lsbCBoYXZlIFNQSXMgZXhwb3NlZC4gRm9yIGluc3RhbmNlLCBpZgo+PiB5b3Ugd2VyZSB0byBl
eHBvc2UgMjU2IGludGVycnVwdHMgZm9yIDQgZG9tYWlucywgdGhpcyB3aWxsIHJvdWdobHkgdXNl
IDgwS0Igb2YKPj4gbWVtb3J5LiBJIGRvbid0IHRoaW5rIHRoaXMgaXMgd2hhdCB5b3UgaGFkIGlu
IG1pbmQgYXMgImxvdyBmb290cHJpbnQiLgo+ICAgCj4gV2hhdCBkbyB5b3UgdGhpbmsgb2YgdGhl
IGZvbGxvd2luZzoKPiAKPiBUaGUgaW1wbGljYXRpb24gb2YgdGhpcyBjaGFuZ2UgaXMgdGhhdCB3
aXRob3V0IG5yX3NwaXMgZG9tMGxlc3MgZG9tYWlucwo+IGdldCB0aGUgc2FtZSBhbW91bnQgb2Yg
U1BJIGFsbG9jYXRlZCBhcyBkb20wLCByZWdhcmRsZXNzIG9mIGhvdyBtYW55Cj4gcGh5c2ljYWwg
ZGV2aWNlcyB0aGV5IGhhdmUgYXNzaWduZWQsIGFuZCByZWdhcmRsZXNzIG9mIHdoZXRoZXIgdGhl
eSBoYXZlCj4gYSB2aXJ0dWFsIHBsMDExICh3aGljaCBhbHNvIG5lZWRzIGFuIGVtdWxhdGVkIFNQ
SSkuCj4gCj4gV2hlbiBucl9zcGlzIGlzIHByZXNlbnQsIHRoZSBkb21haW4gZ2V0cyBleGFjdGx5
IG5yX3NwaXMgYWxsb2NhdGVkIFNQSXMuCj4gSWYgdGhlIG51bWJlciBpcyB0b28gbG93LCBpdCBt
aWdodCBub3QgYmUgZW5vdWdoIGZvciB0aGUgZGV2aWNlcwo+IGFzc2lnbmVkIGl0IHRvIGl0LiBJ
ZiB0aGUgbnVtYmVyIGlzIGxlc3MgdGhhbiBHVUVTVF9WUEwwMTFfU1BJLCB0aGUKPiB2aXJ0dWFs
IHBsMDExIHdvbid0IHdvcmsuCgpUaGlzIGlzIGdvb2QgdG8gYWRkcmVzcyBteSBmaXJzdCByZW1h
cmsuIEhvdyBhYm91dCB0aGUgb3RoZXJzPwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
