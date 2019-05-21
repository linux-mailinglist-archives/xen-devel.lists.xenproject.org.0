Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEF924B8A
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2019 11:30:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hT132-0007yY-2g; Tue, 21 May 2019 09:27:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7C/d=TV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hT130-0007yT-Ad
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 09:27:02 +0000
X-Inumbo-ID: 949d85c8-7baa-11e9-9e3d-63cfe72308ef
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 949d85c8-7baa-11e9-9e3d-63cfe72308ef;
 Tue, 21 May 2019 09:26:58 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 21 May 2019 03:26:57 -0600
Message-Id: <5CE3C45A0200007800230E0E@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 21 May 2019 03:26:50 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <20190520181250.17404-1-julien.grall@arm.com>
In-Reply-To: <20190520181250.17404-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] xen/public: arch-arm: Restrict the
 visibility of struct vcpu_guest_core_regs
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
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIwLjA1LjE5IGF0IDIwOjEyLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
ICAgICBBcyB0aGlzIGlzIG5vdyBYZW4gYW5kIHRvb2xzIG9ubHksIEkgYW0gd29uZGVyaW5nIHdo
ZXRoZXIgdGhlIGNoZWNrIG9uCj4gICAgIEdOVV9DIGlzIHN0aWxsIG5lY2Vzc2FyeS4gSSBhbSBo
YXBweSB0byBzZW5kIGEgZm9sbG93LXVwIHBhdGNoIChvciBmb2xkCj4gICAgIGluIHRoaXMgb25l
KSBpZiBpdCBjYW4gYmUgcmVtb3ZlZC4KCkkgdGhpbmsgdGhpcyBzaG91bGQgYmUgZHJvcHBlZCBp
ZiBpdCBjYW4gYmUgd2l0aG91dCBicmVha2luZyBhbnkKcGFydCBvZiB0aGUgYnVpbGQuCgo+IC0t
LSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oCj4gKysrIGIveGVuL2luY2x1ZGUvcHVi
bGljL2FyY2gtYXJtLmgKPiBAQCAtMTk3LDYgKzE5Nyw3IEBACj4gICAgICB9IHdoaWxlICggMCAp
Cj4gICNkZWZpbmUgc2V0X3hlbl9ndWVzdF9oYW5kbGUoaG5kLCB2YWwpIHNldF94ZW5fZ3Vlc3Rf
aGFuZGxlX3JhdyhobmQsIHZhbCkKPiAgCj4gKyNpZiBkZWZpbmVkKF9fWEVOX18pIHx8IGRlZmlu
ZWQoX19YRU5fVE9PTFNfXykKPiAgI2lmIGRlZmluZWQoX19HTlVDX18pICYmICFkZWZpbmVkKF9f
U1RSSUNUX0FOU0lfXykKPiAgLyogQW5vbnltb3VzIHVuaW9uIGluY2x1ZGVzIGJvdGggMzItIGFu
ZCA2NC1iaXQgbmFtZXMgKGUuZy4sIHIwL3gwKS4gKi8KPiAgIyBkZWZpbmUgX19ERUNMX1JFRyhu
NjQsIG4zMikgdW5pb24geyAgICAgICAgICBcCj4gQEAgLTI3Miw2ICsyNzMsOCBAQCBERUZJTkVf
WEVOX0dVRVNUX0hBTkRMRSh2Y3B1X2d1ZXN0X2NvcmVfcmVnc190KTsKPiAgCj4gICN1bmRlZiBf
X0RFQ0xfUkVHCj4gIAo+ICsjZW5kaWYKCklmIEkgd2FzIHRoZSBtYWludGFpbmVyIG9mIHRoaXMg
Y29kZSwgSSdkIGFzayBmb3IgdGhlIHN0cnVjdCBkZWNsYXJhdGlvbgp0byBiZSBtb3ZlZCAoaW50
byB0aGUgZXhpc3RpbmcgI2lmKSByYXRoZXIgdGhhbiBhZGRpbmcgYSAybmQgI2lmLgoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
