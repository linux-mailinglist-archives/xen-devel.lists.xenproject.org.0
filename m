Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4647D4E285
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 11:02:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heFNl-0003fK-LS; Fri, 21 Jun 2019 08:58:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1heFNk-0003fF-Fc
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 08:58:52 +0000
X-Inumbo-ID: c74b6b32-9402-11e9-8007-53188dacc4e9
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c74b6b32-9402-11e9-8007-53188dacc4e9;
 Fri, 21 Jun 2019 08:58:47 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 21 Jun 2019 02:58:46 -0600
Message-Id: <5D0C9C440200007800239FC5@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 21 Jun 2019 02:58:44 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>,
 "Stefano Stabellini" <sstabellini@kernel.org>
References: <2B31D2BD02000066A2327079@prv1-mh.provo.novell.com>
 <5D09E4310200007800239852@prv1-mh.provo.novell.com>
 <60ff0360-50be-8545-45d8-799ef9fcb95b@arm.com>
 <5de0325f-0782-34c5-3118-5ac9a2fafcb9@arm.com>
 <alpine.DEB.2.21.1906190943500.2072@sstabellini-ThinkPad-T480s>
 <f1dbb360-1946-83c8-128e-caf179b5681d@arm.com>
In-Reply-To: <f1dbb360-1946-83c8-128e-caf179b5681d@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] Fwd: [xen-4.10-testing bisection] complete
 test-armhf-armhf-xl-arndale
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
 Ian Jackson <Ian.Jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIwLjA2LjE5IGF0IDE5OjI0LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IEFjdHVhbGx5IEkgbWF5IGhhdmUgZm91bmQgdGhlIGVycm9yLiBJIGZlZWwgcXVpdGUgYXNoYW1l
ZCBJIGRpZG4ndCBzcG90IAo+IHRoaXMgZHVyaW5nIHJldmlldyBhbmQgd2hlbiB0aGUgYmlzZWN0
b3IgZmluZ2VyZWQgaXQuCj4gCj4gc3RhZ2luZy00LjExIGFuZCBzdGFnaW5nLjQuMTIgZGlkbid0
IGhhdmUgZ2V0X2N5Y2xlcyBpbXBsZW1lbnRlZCAoaS5lIGl0IAo+IHJldHVybmVkIDApLiBEdXJp
bmcgdGhlIGJhY2twb3J0LCBnZXRfY3ljbGVzKCkgZ290IHN1ZGRlbmx5IGltcGxlbWVudGVkIAo+
IChhc2lkZSB0aGUgaXNiKCkpIHNvIGl0IG5vdyByZXR1cm5zIHRoZSBudW1iZXIgb2YgY3ljbGVz
LgoKU3RlZmFubywgaG93IGNhbiB0aGlzIGJlIGEgdmFsaWQgYmFja3BvcnQgdW5kZXIgdGhlIGdp
dmVuIHRpdGxlPyBUaGUKKGltbykgb25seSBjb3JyZWN0IHdheSBvZiBiYWNrcG9ydGluZyB0aGF0
IGh1bmsgd291bGQgaGF2ZSBiZWVuIHRvCnNpbXBseSBkcm9wIGl0LCBhZGRpbmcgaXNiKCkgaW5z
dGVhZCBvZiB0aGUgc3dpdGNoIHRvIGNhbGwgdGhlIGZ1bmN0aW9uCmluIHRoZSB0d28gb3RoZXIg
cGxhY2VzLgoKVG8gYm90aCBvZiB5b3U6IEhvdyBjZXJ0YWluIGFyZSB5b3UgdGhhdCB0aGUgc3Vi
c2VxdWVudCB0eXBlCmNoYW5nZSBpcyByZWFsbHkgYWxsIHRoYXQncyBuZWVkZWQsIGFuZCB0aGF0
IHRoZSBzdWRkZW4gY2hhbmdlIGluCmJlaGF2aW9yIG9mIGdldF9jeWNsZXMoKSB3b24ndCBoYXZl
IG90aGVyIHVuZHVlIHNpZGUgZWZmZWN0cz8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
