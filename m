Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED66935A62
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 12:21:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYT10-0003lm-Gt; Wed, 05 Jun 2019 10:19:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=73hT=UE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYT0z-0003lh-T3
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 10:19:29 +0000
X-Inumbo-ID: 66025d10-877b-11e9-b01e-bfe5a14b27f9
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 66025d10-877b-11e9-b01e-bfe5a14b27f9;
 Wed, 05 Jun 2019 10:19:28 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 05 Jun 2019 04:19:26 -0600
Message-Id: <5CF7972B0200007800235713@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 05 Jun 2019 04:19:23 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <osstest-136184-mainreport@xen.org>
 <20190516103727.GB5438@perard.uk.xensource.com>
 <c576ae9d-4a6e-1602-7f05-6fc2c7b26314@arm.com>
 <20190517172344.GE1245@perard.uk.xensource.com>
 <d2ac0071-149e-0c03-016c-d9ad2a423f5e@arm.com>
 <9df7707d-8aa4-2abf-d7c3-0fd101ec3e68@arm.com>
 <20190603171558.GF2126@perard.uk.xensource.com>
 <5CF618900200007800234E5F@prv1-mh.provo.novell.com>
 <5d8eac54-2c4d-3003-4017-0672716d0581@arm.com>
 <alpine.DEB.2.21.1906041000590.14041@sstabellini-ThinkPad-T480s>
 <014113e2-1481-ce57-1807-2cfa01a3a177@arm.com>
In-Reply-To: <014113e2-1481-ce57-1807-2cfa01a3a177@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [qemu-upstream-4.11-testing test] 136184:
 regressions - FAIL
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 osstest service owner <osstest-admin@xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA0LjA2LjE5IGF0IDE5OjIyLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IFRoZSBvbmx5IG9uZSB3ZSBjb3VsZCBjb25zaWRlciBpcyA0LjEwLCBidXQgQUZBSUNUIEphbiBh
bHJlYWR5IGRpZCBjdXQgCj4gdGhlIGxhc3QgcmVsZWFzZSBmb3IgaXQuCgpJJ3ZlIHNlbnQgYSBj
YWxsIGZvciBiYWNrcG9ydCByZXF1ZXN0cy4gVGhlIHRyZWUgaXNuJ3QgY2xvc2VkIHlldCwgYnV0
CnNvb24gd2lsbCBiZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
