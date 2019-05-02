Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB001183F
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 13:38:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hM9zc-0000hs-RW; Thu, 02 May 2019 11:35:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hM9zb-0000hn-Ao
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 11:35:11 +0000
X-Inumbo-ID: 57abb5ba-6cce-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 57abb5ba-6cce-11e9-843c-bc764e045a96;
 Thu, 02 May 2019 11:35:10 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 02 May 2019 05:35:09 -0600
Message-Id: <5CCAD5ED020000780022B2A2@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 02 May 2019 05:35:09 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH 0/9] XSA-292 follow-up
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VmFyaW91cyBDUjMgYW5kIFBDSUQgcmVsYXRlZCBhZGp1c3RtZW50cywgZmlyc3QgYW5kIGZvcmVt
b3N0CmFuIGFsbW9zdCBmdWxsIHJlLXdyaXRlIG9mIHN3aXRjaF9jcjNfY3I0KCkgKGluIHBhdGNo
IDIpLgoKMTogeDg2OiBhZGp1c3QgY3IzX3BjaWQoKSByZXR1cm4gdHlwZQoyOiB4ODY6IGxpbWl0
IHRoZSBhbW91bnQgb2YgVExCIGZsdXNoaW5nIGluIHN3aXRjaF9jcjNfY3I0KCkKMzogeDg2L21t
OiBob25vciBvcHRfcGNpZCBhbHNvIGZvciAzMi1iaXQgUFYgZG9tYWlucwo0OiB4ODYvSFZNOiBt
b3ZlIE5PRkxVU0ggaGFuZGxpbmcgb3V0IG9mIGh2bV9zZXRfY3IzKCkKNTogeDg2L0hWTTogcmVm
dXNlIENSMyBsb2FkcyB3aXRoIHJlc2VydmVkICh1cHBlcikgYml0cyBzZXQKNjogeDg2L0hWTTog
cmVsYXggc2hhZG93IG1vZGUgY2hlY2sgaW4gaHZtX3NldF9jcjMoKQo3OiB4ODYvSFZNOiBjb3Nt
ZXRpY3MgdG8gaHZtX3NldF9jcjMoKQo4OiB4ODYvQ1BVSUQ6IGRyb3AgSU5WUENJRCBkZXBlbmRl
bmN5IG9uIFBDSUQKOTogeDg2OiBQQ0lEIGlzIHVudXNlZCB3aGVuICFQVgoKSmFuCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
