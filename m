Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31248161AE
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 12:08:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNwzU-0003Me-AE; Tue, 07 May 2019 10:06:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hNwzT-0003MZ-0E
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 10:06:27 +0000
X-Inumbo-ID: c1e33312-70af-11e9-b8dc-c73861eee1a4
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c1e33312-70af-11e9-b8dc-c73861eee1a4;
 Tue, 07 May 2019 10:06:19 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 07 May 2019 04:06:18 -0600
Message-Id: <5CD15894020000780022C6EE@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 07 May 2019 04:06:12 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Eslam Elnikety" <elnikety@amazon.com>
References: <20190506124624.54454-1-elnikety@amazon.com>
 <32d91d7a-a02d-65e3-d166-deb3b64ab592@citrix.com>
 <5CD1580E020000780022C6D8@prv1-mh.provo.novell.com>
In-Reply-To: <5CD1580E020000780022C6D8@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] mm: option to _always_ scrub freed domheap
 pages
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, george.dunlap@citrix.com,
 Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA3LjA1LjE5IGF0IDEyOjAzLCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4+
IE9uIDA3LjA1LjE5IGF0IDExOjU1LCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90ZToK
Pj4gT24gNS82LzE5IDE6NDYgUE0sIEVzbGFtIEVsbmlrZXR5IHdyb3RlOgo+Pj4gLS0tIGEveGVu
L2NvbW1vbi9wYWdlX2FsbG9jLmMKPj4+ICsrKyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCj4+
PiBAQCAtMjE0LDYgKzIxNCwxMiBAQCBjdXN0b21fcGFyYW0oImJvb3RzY3J1YiIsIHBhcnNlX2Jv
b3RzY3J1Yl9wYXJhbSk7Cj4+PiAgc3RhdGljIHVuc2lnbmVkIGxvbmcgX19pbml0ZGF0YSBvcHRf
Ym9vdHNjcnViX2NodW5rID0gTUIoMTI4KTsKPj4+ICBzaXplX3BhcmFtKCJib290c2NydWJfY2h1
bmsiLCBvcHRfYm9vdHNjcnViX2NodW5rKTsKPj4+ICAKPj4+ICsvKgo+Pj4gKyAqIHNjcnViX2Rv
bWhlYXAgLT4gRG9taGVhcCBwYWdlcyBhcmUgc2NydWJiZWQgd2hlbiBmcmVlZAo+Pj4gKyAqLwo+
Pj4gK3N0YXRpYyBib29sX3Qgb3B0X3NjcnViX2RvbWhlYXAgPSAwOwo+Pj4gK2Jvb2xlYW5fcGFy
YW0oInNjcnViX2RvbWhlYXAiLCBvcHRfc2NydWJfZG9taGVhcCk7Cj4+IAo+PiBJJ20gc3VyZSBK
YW4gd2lsbCByZXF1ZXN0IHRoaXMgdG8gYmUgJ3NjcnViLWRvbWhlYXAnIGluc3RlYWQgKG5vdCB1
c2luZwo+PiAnXycgd2hlbiB5b3UgY2FuIHVzZSAnLScpLgo+IAo+IEluZGVlZCwgcGx1cyB1c2Ug
ImJvb2wiLCBkcm9wIHRoZSBwb2ludGxlc3MgaW5pdGlhbGl6ZXIsIGFuZCBjb3JyZWN0Cj4gdGhl
IHN0eWxlIG9mIHRoZSAoc2luZ2xlIGxpbmUpIGNvbW1lbnQuCgpBbmQgdXNlIF9fcmVhZF9tb3N0
bHkuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
