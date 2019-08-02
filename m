Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 820427F7CE
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 15:06:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htXDr-0006yh-FO; Fri, 02 Aug 2019 13:03:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=s405=V6=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1htXDq-0006yS-1I
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 13:03:50 +0000
X-Inumbo-ID: f7d6a0ba-b525-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id f7d6a0ba-b525-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 13:03:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 966811570;
 Fri,  2 Aug 2019 06:03:48 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E43DE3F71F;
 Fri,  2 Aug 2019 06:03:47 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: Jan Beulich <JBeulich@suse.com>, Lars Kurth <lars.kurth@citrix.com>
References: <591E728E-F69D-46DB-88C2-3B47C4115644@citrix.com>
 <0d2ead7a-ad33-63c7-3749-dff571cb5296@suse.com>
 <b72cded3-5cdd-38db-b607-fbf98614ead5@arm.com>
Message-ID: <a4b8c295-64aa-c4a1-acf0-8126c3094495@arm.com>
Date: Fri, 2 Aug 2019 14:03:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b72cded3-5cdd-38db-b607-fbf98614ead5@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC] Re-working the patch submission guide
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Viktor Mitin <viktor.mitin.19@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwMi8wOC8yMDE5IDE0OjAyLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgSmFuLAo+IAo+
IE9uIDAyLzA4LzIwMTkgMTM6NTIsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAwMi4wOC4yMDE5
IDEzOjE0LCBMYXJzIEt1cnRoIHdyb3RlOgo+Pj4+IDEuNS40IFNlbmRpbmcgUGF0Y2hlcyBNYW51
YWxseQo+Pj4gVGhpcyBzaG91bGQgYmUgcmVtb3ZlZCBvciBzdGF0ZSBOT1QgVE8gRE8gdGhpcwo+
Pgo+PiBQbGVhc2UgZG9uJ3QuIEknbSBub3QgbWVhbmluZyB0byBzdGFydCB1c2luZyBnaXQgZm9y
IHBhdGNoIHN1Ym1pc3Npb24KPj4gYW55IHRpbWUgc29vbiAoaWYgZXZlciksIGFuZCBJIGRvbid0
IHNlZSB3aHkgdGhpcyBzaG91bGQgYmUgYQo+PiByZXF1aXJlbWVudC4KPiBXZWxsLCBzb21lb25l
IHVzaW5nIHRoaXMgaXMgbGlrZWx5IHRvIG1lc3MgaXQgdXAuIFNvIEkgYWdyZWUgd2l0aCBMYXJz
IGFuZCB0aGlzIAo+IHNob3VsZCBhdCBsZWFzdCBkaXNhZ3JlZSBhbmQgZGlzY291cmFnZSB0byB1
c2UgaXQuCgpzL2Rpc2FncmVlL2JlIHJlbW92ZWQvCgo+IAo+IElmIHRoZXkgc3RpbGwgcGxhbiB0
byB1c2UgaXQgdGhlbiB0aGV5IGFyZSBvbiB0aGVpciBvd24uCj4gCj4gQ2hlZXJzLAo+IAoKLS0g
Ckp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
