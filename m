Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D62259B2
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2019 23:10:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTBy1-0006cW-Ah; Tue, 21 May 2019 21:06:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jEEf=TV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hTBy0-0006cR-AS
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 21:06:36 +0000
X-Inumbo-ID: 50e4b9ac-7c0c-11e9-a4ad-c3b9362d1cc1
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 50e4b9ac-7c0c-11e9-a4ad-c3b9362d1cc1;
 Tue, 21 May 2019 21:06:35 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5C104217F9;
 Tue, 21 May 2019 21:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558472794;
 bh=VBEUjSFBOs8oxFlhcnQWbr+A1wAIGRwCaInTJRMjqCU=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=yMKNx6PlEjBPYm/BFtlRnCbjMFA3698EXazsiY44ZhTjYpF35eplI3E2evmAoSIeL
 0wlP7+DjvK0IZCFP9m1Y9dS+DiRXEvGJUuPxvzJB0NQxOVjitBn7DLZmePhAGafgmr
 vjMrwIZZMaaluU4immxCVON3bamKAm6AkYiPRzwc=
Date: Tue, 21 May 2019 14:06:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <f2f912ac-a1c6-1f07-f708-cf2935c0270f@arm.com>
Message-ID: <alpine.DEB.2.21.1905211406150.16404@sstabellini-ThinkPad-T480s>
References: <20190520181250.17404-1-julien.grall@arm.com>
 <5CE3C45A0200007800230E0E@prv1-mh.provo.novell.com>
 <1c7f43ce-7df2-24c9-ecb2-d8be1afebfa5@arm.com>
 <5CE3C8370200007800230E40@prv1-mh.provo.novell.com>
 <f2f912ac-a1c6-1f07-f708-cf2935c0270f@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAyMSBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIEphbiwKPiAKPiBP
biA1LzIxLzE5IDEwOjQzIEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+ID4gPiA+IE9uIDIxLjA1
LjE5IGF0IDExOjM1LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+ID4gPiBPbiA1LzIx
LzE5IDEwOjI2IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+ID4gPiA+ID4gPiBPbiAyMC4wNS4x
OSBhdCAyMDoxMiwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPiA+ID4gPiA+ICAgICAg
IEFzIHRoaXMgaXMgbm93IFhlbiBhbmQgdG9vbHMgb25seSwgSSBhbSB3b25kZXJpbmcgd2hldGhl
ciB0aGUKPiA+ID4gPiA+IGNoZWNrIG9uCj4gPiA+ID4gPiAgICAgICBHTlVfQyBpcyBzdGlsbCBu
ZWNlc3NhcnkuIEkgYW0gaGFwcHkgdG8gc2VuZCBhIGZvbGxvdy11cCBwYXRjaAo+ID4gPiA+ID4g
KG9yIGZvbGQKPiA+ID4gPiA+ICAgICAgIGluIHRoaXMgb25lKSBpZiBpdCBjYW4gYmUgcmVtb3Zl
ZC4KPiA+ID4gPiAKPiA+ID4gPiBJIHRoaW5rIHRoaXMgc2hvdWxkIGJlIGRyb3BwZWQgaWYgaXQg
Y2FuIGJlIHdpdGhvdXQgYnJlYWtpbmcgYW55Cj4gPiA+ID4gcGFydCBvZiB0aGUgYnVpbGQuCj4g
PiA+IFRoaXMgaXMgYmVjYXVzZSBhbGwgdGhlIHRvb2xzIGFyZSBwYXJ0IG9mIHhlbi5naXQsIHJp
Z2h0Pwo+ID4gCj4gPiBSaWdodCAtIG5vLW9uZSBlbHNlIGlzIHN1cHBvc2VkIHRvIGRlZmluZSBf
X1hFTl9UT09MU19fLCBvcgo+ID4gaWYgYW55b25lIGRvZXMsIHRoZXkncmUgb24gdGhlaXIgb3du
Lgo+IAo+IFRoYW5rcyBmb3IgdGhlIGluZm9ybWF0aW9uLiBJIHdpbGwgZG8gYSBmdWxsIGJ1aWxk
IGNoZWNrLgo+IAo+ID4gCj4gPiA+ID4gPiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1h
cm0uaAo+ID4gPiA+ID4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2FyY2gtYXJtLmgKPiA+ID4g
PiA+IEBAIC0xOTcsNiArMTk3LDcgQEAKPiA+ID4gPiA+ICAgICAgICB9IHdoaWxlICggMCApCj4g
PiA+ID4gPiAgICAjZGVmaW5lIHNldF94ZW5fZ3Vlc3RfaGFuZGxlKGhuZCwgdmFsKQo+ID4gPiA+
ID4gc2V0X3hlbl9ndWVzdF9oYW5kbGVfcmF3KGhuZCwgdmFsKQo+ID4gPiA+ID4gICAgKyNpZiBk
ZWZpbmVkKF9fWEVOX18pIHx8IGRlZmluZWQoX19YRU5fVE9PTFNfXykKPiA+ID4gPiA+ICAgICNp
ZiBkZWZpbmVkKF9fR05VQ19fKSAmJiAhZGVmaW5lZChfX1NUUklDVF9BTlNJX18pCj4gPiA+ID4g
PiAgICAvKiBBbm9ueW1vdXMgdW5pb24gaW5jbHVkZXMgYm90aCAzMi0gYW5kIDY0LWJpdCBuYW1l
cyAoZS5nLiwKPiA+ID4gPiA+IHIwL3gwKS4gKi8KPiA+ID4gPiA+ICAgICMgZGVmaW5lIF9fREVD
TF9SRUcobjY0LCBuMzIpIHVuaW9uIHsgICAgICAgICAgXAo+ID4gPiA+ID4gQEAgLTI3Miw2ICsy
NzMsOCBAQCBERUZJTkVfWEVOX0dVRVNUX0hBTkRMRSh2Y3B1X2d1ZXN0X2NvcmVfcmVnc190KTsK
PiA+ID4gPiA+ICAgICAgICN1bmRlZiBfX0RFQ0xfUkVHCj4gPiA+ID4gPiAgICArI2VuZGlmCj4g
PiA+ID4gCj4gPiA+ID4gSWYgSSB3YXMgdGhlIG1haW50YWluZXIgb2YgdGhpcyBjb2RlLCBJJ2Qg
YXNrIGZvciB0aGUgc3RydWN0IGRlY2xhcmF0aW9uCj4gPiA+ID4gdG8gYmUgbW92ZWQgKGludG8g
dGhlIGV4aXN0aW5nICNpZikgcmF0aGVyIHRoYW4gYWRkaW5nIGEgMm5kICNpZi4KPiA+ID4gCj4g
PiA+IHMvMm5kLzNyZC8gOykKPiA+ID4gCj4gPiA+IFRoZSByZWFzb24gSSBoYXZlbid0IGRvbmUg
dGhhdCBpcyBnaXQgd2lsbCBnZW5lcmF0ZSBhIGNvbXBsZXRlbHkKPiA+ID4gdW5yZWxhdGVkIGRp
ZmYuIFNvIGl0IG1ha2VzIHF1aXRlIGRpZmZpY3VsdCB0byB1bmRlcnN0YW5kIHRoZSBwdXJwb3Nl
IG9mCj4gPiA+IHRoZSBwYXRjaC4KPiA+IAo+ID4gV2VsbCwgYXMgc2FpZCAtIHlvdSdyZSB0aGUg
bWFpbnRhaW5lci4gSSB3b3VsZG4ndCBiZSBib3RoZXJlZCBvdmVybHkKPiA+IG11Y2ggYnkgYSBz
dHJhbmdlIGRpZmYgdGhhdCBtaWdodCByZXN1bHQuCj4gCj4gSSB3aWxsIHdhaXQgb24gU3RlZmFu
bydzIGlucHV0LgoKWWVzLCBwbGVhc2UgZm9sbG93IEphbidzIGFkdmljZSwgdGhhbmtzLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
