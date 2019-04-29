Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2390BE551
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 16:50:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL7Yb-0002UC-Et; Mon, 29 Apr 2019 14:47:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MPM5=S7=citrix.com=prvs=015b46b47=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hL7Ya-0002U5-EP
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 14:47:00 +0000
X-Inumbo-ID: a15362d4-6a8d-11e9-a91b-c3f68d76377a
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a15362d4-6a8d-11e9-a91b-c3f68d76377a;
 Mon, 29 Apr 2019 14:46:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,409,1549929600"; d="scan'208";a="84653806"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23751.3672.258243.563470@mariner.uk.xensource.com>
Date: Mon, 29 Apr 2019 15:46:48 +0100
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <fa02ed11-5bb4-d324-b9a5-a019c2b696d8@arm.com>
References: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
 <fa02ed11-5bb4-d324-b9a5-a019c2b696d8@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [OSSTEST PATCH 00/21] Abandon jobs which are
 unreasonably delaying their flight
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Lars Kurth <lars.kurth@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SnVsaWVuIEdyYWxsIHdyaXRlcyAoIlJlOiBbT1NTVEVTVCBQQVRDSCAwMC8yMV0gQWJhbmRvbiBq
b2JzIHdoaWNoIGFyZSB1bnJlYXNvbmFibHkgZGVsYXlpbmcgdGhlaXIgZmxpZ2h0Iik6Cj4gQXMg
d2UgZGlzY3Vzc2VkIG9uIElSQywgSSB1bmRlcnN0YW5kIHRoaXMgd2lsbCBoYXZlIGFuIGltcGFj
dCBvbiBBcm0zMiAKPiB0ZXN0aW5nLiBEbyB5b3UgaGF2ZSBhbiBlc3RpbWF0ZSBob3cgbGlrZWx5
IHRoZSB0ZXN0cyB3aWxsIGJlIHNraXBwZWQ/CgpNYW55LCBtYXliZSBtb3N0LiAgVmVyeSBsaWtl
bHkgdGhlIHNtb2tlIHRlc3RzIHdpbGwgY29udGludWUgdG8gcnVuLgoKPiBJIGFtIHdvbmRlcmlu
ZyB3aGV0aGVyIHdlIHNob3VsZCBkaXNjdXNzIHRvIHJlZHVjZSB0aGUgbnVtYmVyIG9mIAo+IHRl
c3RpbmdzIGRvbmUgb24gQXJtMzIuIFdlIGRpZCB0aGF0IGluIHRoZSBwYXN0IG9uIEFybTY0IHdo
ZW4gd2Ugd2VyZSAKPiBzdHJ1Z2dsZSB3aXRoIGJyb2tlbiBsYXh0b24wL2xheHRvbjEuCgpUaGF0
IGlzIGEgc2Vuc2libGUgc3VnZ2VzdGlvbiBidXQgYmVmb3JlIHdlIGRvIHRoYXQga2luZCBvZiBt
YW51YWwKcmViYWxhbmNpbmcgSSB3b3VsZCBsaWtlIHRvIHRyeSBtb3ZpbmcgYXQgbGVhc3QgdGhl
IGtlcm5lbCBidWlsZHMsIHNvCnRoZXkgcnVuIGFzIGFtZDY0IGNyb3NzIGJ1aWxkcy4gIEkgdGhp
bmsgdGhhdCB3aWxsIGZyZWUgdXAgYSBsb3Qgb2YKY2FwYWNpdHkuCgpJbiB0aGUgbWVhbnRpbWUs
IGFyZSB5b3UgaGFwcHkgd2l0aCBtZSBwdXNoaW5nIHRoaXMgc2VyaWVzIHRvIG9zc3Rlc3QKcHJl
dGVzdCBhdCBzb21lIHBvaW50IHdoZW4gY29udmVuaWVudCA/CgpSZWdhcmRzLApJYW4uCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
