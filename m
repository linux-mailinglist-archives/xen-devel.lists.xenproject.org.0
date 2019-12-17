Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A2B1234E8
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 19:33:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihHcK-0005O3-Tn; Tue, 17 Dec 2019 18:30:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UgdD=2H=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ihHcJ-0005Ny-4O
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 18:30:43 +0000
X-Inumbo-ID: 54fac43e-20fb-11ea-8f5b-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 54fac43e-20fb-11ea-8f5b-12813bfff9fa;
 Tue, 17 Dec 2019 18:30:42 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C86692072D;
 Tue, 17 Dec 2019 18:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576607442;
 bh=A4N6LV3dnMutAe+pU18NMFMeAWXege25uDzLYhWEtd8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=xOTmu+PZskFo9sGr2rLnpZliCURiKcS5ftVhL49+aiyj9bpBzVK8sBii98kjw8tMq
 tgjY/IfRfWPIOR6+ZVY2xkuGsB/1s2xsFwvm7/9SK41sqtm3Ab6DhyDtGQ4Vzbt6QL
 q+9RmDPvf6zZ1/nczt0Roq/rO8U03dMZmOeTwv9I=
Date: Tue, 17 Dec 2019 10:30:41 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: roman@zededa.com
In-Reply-To: <5db3b29a-2f07-c807-1ee2-503d779548f7@xen.org>
Message-ID: <alpine.DEB.2.21.1912171029300.12921@sstabellini-ThinkPad-T480s>
References: <CAMmSBy8Zh00tebTvz=__GDv478++b-2t4248YnkH0W9DVgqKbw@mail.gmail.com>
 <alpine.DEB.2.21.1912161814220.13474@sstabellini-ThinkPad-T480s>
 <CAMmSBy_EG6=20dHde7AHby48Q8aWoRLAX+LFWTTTuKeHi8M+dg@mail.gmail.com>
 <5db3b29a-2f07-c807-1ee2-503d779548f7@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] REGRESSION: Xen 4.13 RC5 fails to bootstrap Dom0 on
 ARM
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 julien@xen.org, Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxNyBEZWMgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDE3
LzEyLzIwMTkgMDQ6MzksIFJvbWFuIFNoYXBvc2huaWsgd3JvdGU6Cj4gPiBPbiBNb24sIERlYyAx
NiwgMjAxOSBhdCA2OjU1IFBNIFN0ZWZhbm8gU3RhYmVsbGluaQo+ID4gPHNzdGFiZWxsaW5pQGtl
cm5lbC5vcmc+IHdyb3RlOgo+ID4gPiBPbiBNb24sIDE2IERlYyAyMDE5LCBSb21hbiBTaGFwb3No
bmlrIHdyb3RlOgo+ID4gPiBJZiBJIHN1bSBhbGwgdGhlIG1lbW9yeSBzaXplcyB0b2dldGhlciBJ
IGdldCAweDNkZGZkMDAwIHdoaWNoIGlzIDk5ME0uCj4gPiA+IElmIHNvLCBJIHdvbmRlciBob3cg
eW91IGNvdWxkIGJvb3Qgc3VjY2VzZnVsbHkgd2l0aCBkb20wX21lbT0xMDI0TSBldmVuCj4gPiA+
IG9uIFhlbiA0LjEyLi4uIDotPwo+ID4gCj4gPiBUaGF0IGlzIGEgdmVyeSBpbnRlcmVzdGluZyBv
YnNlcnZhdGlvbiBpbmRlZWQhIEkgYWN0dWFsbHkgZG9uJ3QKPiA+IHJlbWVtYmVyIHdoZXJlIHRo
YXQgZGV2aWNlIHRyZWUgY2FtZSBmcm9tLCBidXQgSSB0aGluayBpdCB3YXMgZnJvbSBvbmUKPiA+
IG9mIHRoZSBMaW5hcm8gc2l0ZXMuCj4gCj4gVGhpcyBpcyBtb3N0bHkgbGlrZWx5IGJlY2F1c2Ug
b2Y6Cj4gCj4gY29tbWl0IDYzNDFhNjc0NTczZjE4MzRmMDgzZjBhYjBmNWIzNmIwNzVmOWUwMmUK
PiBBdXRob3I6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gRGF0ZTogICBX
ZWQgQXVnIDIxIDIyOjQyOjMxIDIwMTkgKzAxMDAKPiAKPiAgICAgeGVuL2FybTogZG9tYWluX2J1
aWxkOiBEb24ndCBjb250aW51ZSBpZiB1bmFibGUgdG8gYWxsb2NhdGUgYWxsIGRvbTAgYmFua3MK
PiAKPiAgICAgWGVuIHdpbGwgb25seSBwcmludCBhIHdhcm5pbmcgaWYgdGhlcmUgYXJlIG1lbW9y
eSB1bmFsbG9jYXRlZCB3aGVuIHVzaW5nCj4gICAgIDE6MSBtYXBwaW5nIChvbmx5IHVzZWQgYnkg
ZG9tMCkuIFRoaXMgYWxzbyBpbmNsdWRlcyB0aGUgY2FzZSB3aGVyZSBubwo+ICAgICBtZW1vcnkg
aGFzIGJlZW4gYWxsb2NhdGVkLgo+IAo+ICAgICBJdCB3aWxsIGJyaW5nIHRvIGFsbCBzb3J0IG9m
IGlzc3VlcyB0aGF0IGNhbiBiZSBoYXJkIHRvIGRpYWdub3N0aWMgZm9yCj4gICAgIHVzZXJzICh0
aGUgd2FybmluZyBjYW4gYmUgZGlmZmljdWx0IHRvIHNwb3Qgb3IgZGlzcmVnYXJkKS4KPiAKPiAg
ICAgSWYgdGhlIHVzZXJzIHJlcXVlc3QgMUdCIG9mIG1lbW9yeSwgdGhlbiBtb3N0IGxpa2VseSB0
aGV5IHdhbnQgdGhlIGV4YWN0Cj4gICAgIGFtb3VudCBhbmQgbm90IDUxMk1CLiBTbyBwYW5pYyBp
ZiBhbGwgdGhlIG1lbW9yeSBoYXMgbm90IGJlZW4gYWxsb2NhdGVkLgo+IAo+ICAgICBBZnRlciB0
aGlzIGNoYW5nZSwgdGhlIGJlaGF2aW9yIGlzIHRoZSBzYW1lIGFzIGZvciBub24tMToxIG1lbW9y
eQo+ICAgICBhbGxvY2F0aW9uICh1c2VkIGJ5IGRvbVUpLgo+IAo+ICAgICBBdCB0aGUgc2FtZSB0
aW1lLCByZWZsb3cgdGhlIG1lc3NhZ2UgdG8gaGF2ZSB0aGUgZm9ybWF0IG9uIGEgc2luZ2xlCj4g
ICAgIGxpbmUuCj4gCj4gICAgIFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxsQGFybS5jb20+Cj4gICAgIEFja2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+CgpBaCEgUm9tYW4sIGNvdWxkIHlvdSBwbGVhc2UgcG9zdCB0aGUgZnVs
bCBib290IGxvZyBvZiBhIHN1Y2Nlc3NmdWwgNC4xMgpib290PwoKSWYgaXQgaGFzIGEgIkZhaWxl
ZCB0byBhbGxvY2F0ZSByZXF1ZXN0ZWQgZG9tMCBtZW1vcnkiIG1lc3NhZ2UsIHRoZW4gd2UKa25v
dyB3aGF0IHRoZSBpc3N1ZSBpcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
