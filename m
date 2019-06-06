Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2D336EFE
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 10:45:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYnyY-0003mO-Cm; Thu, 06 Jun 2019 08:42:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=p1/W=UF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYnyX-0003mF-If
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 08:42:21 +0000
X-Inumbo-ID: ff1e6064-8836-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ff1e6064-8836-11e9-8980-bc764e045a96;
 Thu, 06 Jun 2019 08:42:20 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 06 Jun 2019 02:42:19 -0600
Message-Id: <5CF8D1EA0200007800235CBF@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Thu, 06 Jun 2019 02:42:18 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>,
 "Stefano Stabellini" <sstabellini@kernel.org>
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
 <alpine.DEB.2.21.1906041026110.14041@sstabellini-ThinkPad-T480s>
 <7af8e9d1-6f60-f3b4-9201-2b84f1cf6886@arm.com>
 <alpine.DEB.2.21.1906041508520.14041@sstabellini-ThinkPad-T480s>
 <986b7bb5-f223-f91a-ddc5-96dc3ee69b17@arm.com>
 <alpine.DEB.2.21.1906051313570.14041@sstabellini-ThinkPad-T480s>
 <8acdb27d-dd3b-44af-5763-efbad3c1b554@arm.com>
In-Reply-To: <8acdb27d-dd3b-44af-5763-efbad3c1b554@arm.com>
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
 osstest service owner <osstest-admin@xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA1LjA2LjE5IGF0IDIzOjM4LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDYvNS8xOSA5OjI5IFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+IE15IHZvdGUg
aXMgdG8gYmFja3BvcnQgdG8gYm90aC4gSmFuL290aGVycyBwbGVhc2UgZXhwcmVzcyB5b3VyIG9w
aW5pb24uCj4gCj4gVG8gZm9sbG93IHRoZSB2b3RlIGNvbnZlbnRpb246Cj4gCj4gNC4xMTogLTEK
CkhtbSwgSSdtIHN1cnByaXNlZCBieSB0aGlzLiBEaWRuJ3QgSSBzZWUgeW91IG1lbnRpb24gdG8g
SWFuIChvbiBpcmMpCnlvdSdkIHByZWZlciBiYWNrcG9ydGluZyBvdmVyIHdvcmtpbmcgYXJvdW5k
IHRoaXMgaW4gb3NzdGVzdD8KCj4gNC4xMDogLTEgKEkgd2FzIHRlbXB0ZWQgYnkgYSAtMiBidXQg
aWYgdGhlIG90aGVyIGZlZWxzIGl0IHNob3VsZCBiZSAKPiBiYWNrcG9ydGVkIHRoZW4gSSB3aWxs
IG5vdCBwdXNoIGJhY2spLgoKQ29uc2lkZXJpbmcgdGhlIHNpdHVhdGlvbiwgSSdtIGxlYW5pbmcg
dG93YXJkcyBKdWxpZW4ncyBvcGluaW9uIGhlcmUuCkJ1dCB0YWtlIHRoaXMgd2l0aCBjYXJlIC0g
SSBoYXZlIHdheSB0b28gbGl0dGxlIGluc2lnaHQgdG8gaGF2ZSBhCm1lYW5pbmdmdWwgb3Bpbmlv
bi4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
