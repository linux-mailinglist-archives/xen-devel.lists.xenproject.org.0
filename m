Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D25A556CB0
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 16:48:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hg9B3-0003f1-On; Wed, 26 Jun 2019 14:45:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=G0cr=UZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hg9B2-0003ev-39
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 14:45:36 +0000
X-Inumbo-ID: 0dde84a0-9821-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0dde84a0-9821-11e9-8980-bc764e045a96;
 Wed, 26 Jun 2019 14:45:34 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 26 Jun 2019 08:45:34 -0600
Message-Id: <5D138507020000780023B4C8@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 26 Jun 2019 08:45:27 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <20190626135546.50665-1-roger.pau@citrix.com>
 <20190626135546.50665-5-roger.pau@citrix.com>
In-Reply-To: <20190626135546.50665-5-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 4/5] kconfig: disable non-literal format
 string warnings
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
 Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI2LjA2LjE5IGF0IDE1OjU1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEtjb25maWcgbWFrZXMgaGVhdnkgdXNlIG9mIG5vbi1saXRlcmFscyBhcyBmb3JtYXQgc3RyaW5n
cywgZGlzYWJsZQo+IGNvbXBpbGVyIHdhcm5pbmdzIHNpbmNlIHRoaXMgaXMgZXhwZWN0ZWQgdXNh
Z2UuCgpJJ3ZlIG5ldmVyIHNlZW4gYW55IHdpdGggYW55IHZlcnNpb24gb2YgZ2NjIC0gYXJlIHRo
ZXJlIG1vcmUKYXNwZWN0cyB0byBiZSBtZW50aW9uZWQgaGVyZT8KCj4gU2lnbmVkLW9mZi1ieTog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gLS0tCj4gQ2M6IERvdWcg
R29sZHN0ZWluIDxjYXJkb2VAY2FyZG9lLmNvbT4KPiAtLS0KPiAgeGVuL3Rvb2xzL2tjb25maWcv
TWFrZWZpbGUua2NvbmZpZyB8IDUgKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKQoKWW91IENjIGxpc3QgbG9va3MgdG8gYmUgdG9vIHNob3J0IGZvciB0aGlzIGNoYW5nZS4K
Cj4gLS0tIGEveGVuL3Rvb2xzL2tjb25maWcvTWFrZWZpbGUua2NvbmZpZwo+ICsrKyBiL3hlbi90
b29scy9rY29uZmlnL01ha2VmaWxlLmtjb25maWcKPiBAQCAtNDMsNiArNDMsMTEgQEAgRk9SQ0U6
Cj4gICMgU2V0cyB0b29sY2hhaW4gYmluYXJpZXMgdG8gdXNlCj4gIGluY2x1ZGUgJChYRU5fUk9P
VCkvY29uZmlnLyQoc2hlbGwgdW5hbWUgLXMpLm1rCj4gIAo+ICsjIERpc2FibGUgZm9ybWF0IHdh
cm5pbmdzLCBrY29uZmlnIG1ha2VzIGhlYXZ5IHVzZSBvZiBub24tbGl0ZXJhbCBmb3JtYXQKPiAr
IyBzdHJpbmdzLgo+ICtIT1NUQ0ZMQUdTICs9IC1Xbm8tZm9ybWF0Cj4gK0hPU1RDWFhGTEFHUyAr
PSAtV25vLWZvcm1hdAoKQnV0IHRoaXMgZGlzYWJsZXMgZmFyIG1vcmUgd2FybmluZ3MgdGhhbiBv
bmVzIGZvciBub24tbGl0ZXJhbCBmb3JtYXQKc3RyaW5ncywgYXQgbGVhc3QgYWZhaWN0LgoKSmFu
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
