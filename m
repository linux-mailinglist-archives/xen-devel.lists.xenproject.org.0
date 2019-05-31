Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1478030C16
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 11:54:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWeDb-0005ZJ-78; Fri, 31 May 2019 09:52:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2tza=T7=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hWeDZ-0005Z1-Dn
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 09:52:57 +0000
X-Inumbo-ID: dd5cc9a4-8389-11e9-801e-57a99dbf7de0
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id dd5cc9a4-8389-11e9-801e-57a99dbf7de0;
 Fri, 31 May 2019 09:52:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B02CC341;
 Fri, 31 May 2019 02:52:55 -0700 (PDT)
Received: from [10.37.12.213] (unknown [10.37.12.213])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC0853F59C;
 Fri, 31 May 2019 02:52:53 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <5CF0F33A0200007800233D8F@prv1-mh.provo.novell.com>
 <5CF0F5700200007800233DB4@prv1-mh.provo.novell.com>
 <f78f627c-753f-a162-14a1-b193908f673a@arm.com>
 <5CF0F8BE0200007800233DE3@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <f8edeb03-b223-e723-0b02-9ca565fe8055@arm.com>
Date: Fri, 31 May 2019 10:52:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CF0F8BE0200007800233DE3@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] dom_cow is needed for mem-sharing only
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA1LzMxLzE5IDEwOjQ5IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAzMS4w
NS4xOSBhdCAxMTo0MiwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gT24gNS8zMS8x
OSAxMDozNSBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4v
bW0uaAo+Pj4gKysrIGIveGVuL2luY2x1ZGUveGVuL21tLmgKPj4+IEBAIC02NDQsNiArNjQ0LDkg
QEAgc3RhdGljIGlubGluZSB2b2lkIGZpbHRlcmVkX2ZsdXNoX3RsYl9tYQo+Pj4gICAgCj4+PiAg
ICAvKiBQcml2YXRlIGRvbWFpbiBzdHJ1Y3RzIGZvciBET01JRF9YRU4sIERPTUlEX0lPLCBldGMu
ICovCj4+PiAgICBleHRlcm4gc3RydWN0IGRvbWFpbiAqZG9tX3hlbiwgKmRvbV9pbywgKmRvbV9j
b3c7Cj4+Cj4+IERvbid0IHlvdSB3YW50IHRvIHByb3RlY3QgZG9tX2NvdyB3aXRoICIjaWZkZWYg
Q09ORklHX0hBU19NRU1fU0hBUklORyI/Cj4gCj4gVGhlcmUncyBubyBuZWVkIHRvIHdpdGggLi4u
Cj4gCj4+PiArI2lmbmRlZiBDT05GSUdfSEFTX01FTV9TSEFSSU5HCj4+PiArIyBkZWZpbmUgZG9t
X2NvdyBOVUxMCj4+PiArI2VuZGlmCj4gCj4gLi4uIHRoaXMsIGFuZCB0aGlzIHdheSB0aGVyZSdz
IGxlc3MgY2x1dHRlciBvdmVyYWxsLgoKSSBhbSBhbGwgZm9yIGF2b2lkaW5nIGNsdXR0ZXJpbmcg
YnV0IG5vdCBhdCB0aGUgZXhwZW5zZSBvZiBtYWtpbmcgdGhlIApjb2RlIGxlc3MgaW50dWl0aXZl
LiBJbiB0aGlzIGNhc2UsIEkgd291bGQgcHJlZmVyIHRoZSBkZWNsZXJhdGlvbiAKZG9tX2NvdyB0
byBiZSBndWFyZGVkLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
