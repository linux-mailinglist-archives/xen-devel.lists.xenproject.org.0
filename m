Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E65D9575
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2019 17:25:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKl7s-0000LT-7T; Wed, 16 Oct 2019 15:22:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eWLc=YJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iKl7q-0000LM-Qu
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2019 15:22:10 +0000
X-Inumbo-ID: b87b9d84-f028-11e9-bbab-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b87b9d84-f028-11e9-bbab-bc764e2007e4;
 Wed, 16 Oct 2019 15:22:10 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9B5472067D;
 Wed, 16 Oct 2019 15:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571239329;
 bh=Yi+xR5j4lZs/h2Nz9vJXSDPaEgkOjfIy0HWm4FWNlcw=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=RpKfQfv352nsa26iBxkmA6uJfzclp214KRtwB/7DvcpNzig9GcN3od1XRrLrNpv14
 0wDdQNUGcK0VOVHZEOzSzAE8FXuUmgH95+fOxDbcO3Yl/jM8iTaAJ7YgiD3/G7aGXZ
 kpc8+nl8jhvosag5yR+ONOf9ywvBmquOpPCTTVdk=
Date: Wed, 16 Oct 2019 08:22:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Ian Jackson <ian.jackson@citrix.com>
In-Reply-To: <23974.61064.928585.36020@mariner.uk.xensource.com>
Message-ID: <alpine.DEB.2.21.1910160819310.30080@sstabellini-ThinkPad-T480s>
References: <20191015181802.21957-1-julien.grall@arm.com>
 <alpine.DEB.2.21.1910151221270.30080@sstabellini-ThinkPad-T480s>
 <bfb3ac7c-19bc-90f0-381b-32a1491a967c@arm.com>
 <alpine.DEB.2.21.1910151249160.30080@sstabellini-ThinkPad-T480s>
 <9520fef5-a21b-e4cc-12d1-97794b979883@arm.com>
 <alpine.DEB.2.21.1910152124170.30080@sstabellini-ThinkPad-T480s>
 <23974.61064.928585.36020@mariner.uk.xensource.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/arm: Don't use _end in
 is_xen_fixed_mfn()
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim  \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <Julien.Grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAxNiBPY3QgMjAxOSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gU3RlZmFubyBTdGFiZWxs
aW5pIHdyaXRlcyAoIlJlOiBbUEFUQ0ggZm9yLTQuMTNdIHhlbi9hcm06IERvbid0IHVzZSBfZW5k
IGluIGlzX3hlbl9maXhlZF9tZm4oKSIpOgo+ID4gTXkgc3VnZ2VzdGlvbiBpcyBnb2luZyB0byB3
b3JrOiAidGhlIGNvbXBpbGVyIHNlZXMgdGhyb3VnaCBjYXN0cyIKPiA+IHJlZmVycmVkIHRvIGNv
bXBhcmlzb25zIGJldHdlZW4gcG9pbnRlcnMsIHdoZXJlIHdlIHRlbXBvcmFyaWx5IGNhc3RlZAo+
ID4gYm90aCBwb2ludGVycyB0byBpbnRlZ2VycyBhbmQgYmFjayB0byBwb2ludGVycyB2aWEgYSBN
QUNSTy4gVGhhdCBjYXNlCj4gPiB3YXMgaWZmeSBiZWNhdXNlIHRoZSBNQUNSTyB3YXMgY2xlYXJs
eSBhIHdvcmthcm91bmQgdGhlIHNwZWMuCj4gPiAKPiA+IEhlcmUgdGhlIHNpdHVhdGlvbiBpcyBk
aWZmZXJlbnQuIEZvciBvbmUsIHdlIGFyZSBkb2luZyBhcml0aG1ldGljLiBBbHNvCj4gPiB2aXJ0
X3RvX21hZGRyIGFscmVhZHkgdGFrZXMgYSB2YWRkcl90IGFzIGFyZ3VtZW50LiBTbyBpbnN0ZWFk
IG9mIGRvaW5nCj4gPiBwb2ludGVycyBhcml0aG1ldGljLCB0aGVuIGNvbnZlcnRpbmcgdG8gdmFk
ZHJfdCwgd2UgYXJlIGNvbnZlcnRpbmcgdG8KPiA+IHZhZGRyX3QgZmlyc3QsIHRoZW4gZG9pbmcg
YXJpdGhtZXRpY3MsIHdoaWNoIGlzIGZpbmUgYm90aCBmcm9tIGEgQzk5Cj4gPiBwb2ludCBvZiB2
aWV3IGFuZCBldmVuIGEgTUlTUkEgQyBwb2ludCBvZiB2aWV3LiBJIGNhbid0IHNlZSBhIHByb2Js
ZW0KPiA+IHdpdGggdGhhdC4gSSBhbSBzdXJlIGFzIEkgcmVhc29uYWJsZSBjYW4gYmUgOi0pCj4g
Cj4gRlRBT0QgSSB0aGluayB5b3UgYXJlIHN1Z2dlc3RpbmcgdGhpczoKPiAgLSArICAgICAobWZu
X3RvX21hZGRyKG1mbikgPD0gdmlydF90b19tYWRkcihfZW5kIC0gMSkpKQo+ICArICsgICAgICht
Zm5fdG9fbWFkZHIobWZuKSA8PSB2aXJ0X3RvX21hZGRyKCgodmFkZHJfdClfZW5kIC0gMSkpKQo+
IAo+IHZpcnRfdG9fbWFkZHIodmEpIGlzIGEgbWFjcm8gd2hpY2ggZXhwYW5kcyB0bwo+ICAgIF9f
dmlydF90b19tYWRkcigodmFkZHJfdCkodmEpKQo+IAo+IFNvIHdoYXQgaXMgaGFwcGVuaW5nIGhl
cmUgaXMgdGhhdCB0aGUgY2FzdCB0byBhbiBpbnRlZ2VyIHR5cGUgaXMgYmVpbmcKPiBkb25lIGJl
Zm9yZSB0aGUgc3VidHJhY3Rpb24uCj4gCj4gV2l0aG91dCB0aGUgY2FzdCwgeW91IGFyZSBjYWxj
dWxhdGluZyB0aGUgcG9pbnRlciB2YWx1ZSBfZW5kLTEgZnJvbQo+IHRoZSB2YWx1ZSBfZW5kLCB3
aGljaCBpcyBVQi4gIFdpdGggdGhlIGNhc3QgeW91IGFyZSBjYWxjdWxhdGluZyBhbgo+IGludGVn
ZXIgdmFsdWUuICB2YWRkcl90IGlzIHVuc2lnbmVkLCBzbyBhbGwgYXJpdGhtZXRpYyBvcGVyYXRp
b25zIGFyZQo+IGRlZmluZWQuICBOb3RoaW5nIGNhc3RzIHRoZSByZXN1bHQgYmFjayB0byB0aGUg
ImZvcmJpZGRlbiIgKHdpdGggdGhpcwo+IHByb3ZlbmFuY2UpIHBvaW50ZXIgdmFsdWUsIHNvIGFs
bCBpcyB3ZWxsLgo+IAo+IChXaXRoIHRoZSBtYWNybyBleHBhbnNpb24gdGhlIGNhc3QgaGFwcGVu
cyB0d2ljZS4gIFRoaXMgaXMgcHJvYmFibHkKPiBiZXR0ZXIgdGhhbiB1c2luZyBfX3ZpcnRfdG9f
bWFkZHIgaGVyZS4pCj4gCj4gSWUsIGluIHRoaXMgY2FzZSBJIGFncmVlIHdpdGggU3RlZmFuby4g
IFRoZSBjYXN0IGlzIGJvdGggbmVjZXNzYXJ5IGFuZAo+IHN1ZmZpY2llbnQuCgpUaGFua3MgSWFu
IGZvciB0aGUgc2Vjb25kIHBhaXIgb2YgZXllcyEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
