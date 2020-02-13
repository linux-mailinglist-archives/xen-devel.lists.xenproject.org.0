Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B39615BB25
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 10:06:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2AP7-0000pc-RQ; Thu, 13 Feb 2020 09:03:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QmQS=4B=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1j2AP6-0000pN-Av
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 09:03:24 +0000
X-Inumbo-ID: b02bbd6a-4e3f-11ea-bc8e-bc764e2007e4
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b02bbd6a-4e3f-11ea-bc8e-bc764e2007e4;
 Thu, 13 Feb 2020 09:03:23 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1j2AP5-0002g9-0c; Thu, 13 Feb 2020 09:03:23 +0000
Date: Thu, 13 Feb 2020 09:03:22 +0000
From: Tim Deegan <tim@xen.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Message-ID: <20200213090322.GC10200@deinos.phlegethon.org>
References: <20200210172829.43604-1-roger.pau@citrix.com>
 <20200210172829.43604-3-roger.pau@citrix.com>
 <20200213090208.GA10200@deinos.phlegethon.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200213090208.GA10200@deinos.phlegethon.org>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org);
 SAEximRunCond expanded to false
Subject: Re: [Xen-devel] [PATCH v4 2/7] x86/paging: add TLB flush hooks
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXQgMDk6MDIgKzAwMDAgb24gMTMgRmViICgxNTgxNTg0NTI4KSwgVGltIERlZWdhbiB3cm90ZToK
PiBBdCAxODoyOCArMDEwMCBvbiAxMCBGZWIgKDE1ODEzNTkzMDQpLCBSb2dlciBQYXUgTW9ubmUg
d3JvdGU6Cj4gPiBBZGQgc2hhZG93IGFuZCBoYXAgaW1wbGVtZW50YXRpb24gc3BlY2lmaWMgaGVs
cGVycyB0byBwZXJmb3JtIGd1ZXN0Cj4gPiBUTEIgZmx1c2hlcy4gTm90ZSB0aGF0IHRoZSBjb2Rl
IGZvciBib3RoIGlzIGV4YWN0bHkgdGhlIHNhbWUgYXQgdGhlCj4gPiBtb21lbnQsIGFuZCBpcyBj
b3BpZWQgZnJvbSBodm1fZmx1c2hfdmNwdV90bGIuIFRoaXMgd2lsbCBiZSBjaGFuZ2VkIGJ5Cj4g
PiBmdXJ0aGVyIHBhdGNoZXMgdGhhdCB3aWxsIGFkZCBpbXBsZW1lbnRhdGlvbiBzcGVjaWZpYyBv
cHRpbWl6YXRpb25zIHRvCj4gPiB0aGVtLgo+ID4gCj4gPiBObyBmdW5jdGlvbmFsIGNoYW5nZSBp
bnRlbmRlZC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+Cj4gPiBSZXZpZXdlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KPiAK
PiBBY2tlZC1ieTogVGltIERlZWdhbiA8dGpkLXhlbkBwaGxlZ2V0aG9uLm9yZz4KCk9vcHMsIHdy
b25nIGFkZHJlc3MsIHNvcnJ5LgoKQWNrZWQtYnk6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
