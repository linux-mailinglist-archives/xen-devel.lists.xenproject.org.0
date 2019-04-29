Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E20F2E695
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 17:33:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL8Es-0007Yx-Pr; Mon, 29 Apr 2019 15:30:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MPM5=S7=citrix.com=prvs=015b46b47=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hL8Er-0007Ys-G6
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 15:30:41 +0000
X-Inumbo-ID: bddd3af0-6a93-11e9-85b6-47b8051913aa
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bddd3af0-6a93-11e9-85b6-47b8051913aa;
 Mon, 29 Apr 2019 15:30:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,409,1549929600"; d="scan'208";a="84662708"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23751.6297.231034.162861@mariner.uk.xensource.com>
Date: Mon, 29 Apr 2019 16:30:33 +0100
To: Wei Liu <wei.liu2@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, 
 Olaf Hering <olaf@aepfle.de>, Juergen Gross <jgross@suse.com>, Jan Beulich
 <JBeulich@suse.com>, <xen-devel@lists.xenproject.org>
In-Reply-To: <23751.6062.590245.436664@mariner.uk.xensource.com>
References: <23751.6062.590245.436664@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: [Xen-devel] [PATCH STABLE] tools/firmware: update OVMF Makefile,
 when necessary
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWFuIEphY2tzb24gd3JpdGVzICgiW1BBVENIIFNUQUJMRV0gdG9vbHMvZmlybXdhcmU6IHVwZGF0
ZSBPVk1GIE1ha2VmaWxlLCB3aGVuIG5lY2Vzc2FyeSIpOgo+IE9uIGFkdmljZSBmcm9tIFdlaSwg
SSBhbSBhYm91dCB0byBwdXNoIHRoaXMgc3F1YXNoZWQgYmFja3BvcnQgdG8gdGhlCj4gc3RhYmxl
IHRyZWVzLiAgV2UgdGhpbmsgdGhpcyB3aWxsIGhlbHAgZml4IG9zc3Rlc3Qgb24gdGhvc2UgYnJh
bmNoZXMKPiBmb2xsb3dpbmcgdGhlIHVwZ3JhZGUgdG8gRGViaWFuIHN0cmV0Y2guCgpOb3cgZG9u
ZSwgaW5jbHVkaW5nIGZvciBzdGFnaW5nLTQuNi4gIDQuNiBpcyBvdXQgb2Ygc2VjdXJpdHkgc3Vw
cG9ydCwKYnV0IG9zc3Rlc3Qgd2FudHMgdG8gYmUgYWJsZSB0byBidWlsZCA0LjYgc28gdGhhdCBp
dCBjYW4gdGVzdAptaWdyYXRpb24gZnJvbSA0LjYgdG8gNC43LCBhbmQgNC43ICppcyogc3RpbGwg
KGp1c3QgYWJvdXQpIGluIHNlY3VyaXR5CnN1cHBvcnQuCgpJIGV4cGVjdCB0aGUgNC42IHB1c2gg
Z2F0ZSB0byBmYWlsIGFuZCB0byBoYXZlIHRvIGZvcmNlIHB1c2ggaXQuCgpJdCBpcyBhbHNvIHBv
c3NpYmxlIHRoYXQgd2Ugd2lsbCBleHBlcmllbmNlIG90aGVyIGJ1aWxkIGZhbGxvdXQuCgpJYW4u
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
