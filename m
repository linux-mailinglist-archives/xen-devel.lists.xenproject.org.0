Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 761D949E35
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 12:26:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdBHE-0003cT-55; Tue, 18 Jun 2019 10:23:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/6v3=UR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hdBHC-0003bv-NV
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 10:23:42 +0000
X-Inumbo-ID: 22830e44-91b3-11e9-b720-4f65f7dcd45a
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 22830e44-91b3-11e9-b720-4f65f7dcd45a;
 Tue, 18 Jun 2019 10:23:38 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 18 Jun 2019 04:23:37 -0600
Message-Id: <5D08BBA702000078002392FA@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 18 Jun 2019 04:23:35 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Stefano Stabellini" <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1906171146440.2072@sstabellini-ThinkPad-T480s>
 <20190617185017.32661-1-sstabellini@kernel.org>
In-Reply-To: <20190617185017.32661-1-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v4 1/2] xen: switch pdx_init_mask to return
 uint64_t
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Stefano Stabellini <stefanos@xilinx.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE3LjA2LjE5IGF0IDIwOjUwLCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gQWxzbyBjaGFuZ2Ugc3JhdF9yZWdpb25fbWFzayB0byB1aW50NjRfdCBhcyBpdCBpcyB1c2Vk
IHRvIHN0b3JlIHRoZQo+IHJldHVybiB2YWx1ZSBvZiBwZHhfaW5pdF9tYXNrLiB1aW50NjRfdCBp
cyBhbHdheXMgZ3JlYXRlciBvciBlcXVhbCB0bwo+IHU2NC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+CgpOb24tQXJtIGJpdHMKQWNr
ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KYnV0IGNvdWxkIHlvdSBtYWtl
IHRoZSB0aXRsZSBzb3VuZCBsZXNzIGxpa2UgaXQncyBhbiBhY3R1YWwgY2hhbmdlCnRvIHRoZSBm
dW5jdGlvbiByZXR1cm4gdHlwZT8gQWxzbyBpdCdzIG5vdCBqdXN0IGl0cyByZXR1cm4gdHlwZQp5
b3UgY2hhbmdlLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
