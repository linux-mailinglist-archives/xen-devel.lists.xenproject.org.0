Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4F3349BC
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 16:06:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYA2E-0003N5-D1; Tue, 04 Jun 2019 14:03:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8ILU=UD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYA2D-0003N0-Ii
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 14:03:29 +0000
X-Inumbo-ID: 8699a59c-86d1-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8699a59c-86d1-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 14:03:27 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 04 Jun 2019 08:03:26 -0600
Message-Id: <5CF67A2A0200007800235235@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 04 Jun 2019 08:03:22 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] 4.10.4 preparations
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
 Lars Kurth <lars.kurth@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWxsLAoKd2hpbGUgNC4xMS4yIHN0aWxsIHN1ZmZlcnMgZGVsYXlzLCA0LjEwLjQgaXMgYWJvdXQg
ZHVlIG5vdyBhcyB3ZWxsLgpQbGVhc2UgcG9pbnQgb3V0IGJhY2twb3J0cyB5b3UgZmluZCBtaXNz
aW5nIGZyb20gaXRzIHN0YWdpbmcgdHJlZS4KSSBoYXZlIHRoZXNlIHR3byBhbHJlYWR5IHF1ZXVl
ZAoKYjE0NGNmNDVkNQl4ODYvdmhwZXQ6IGF2b2lkICdzbWFsbCcgdGltZSBkaWZmIHRlc3Qgb24g
cmVzdW1lCmUyMTA1MTgwZjkJeDg2L3NwZWMtY3RybDogS25pZ2h0cyBMYW5kaW5nL01pbGwgYXJl
IHJldHBvbGluZS1zYWZlCgpidXQgSSBkb24ndCB2aWV3IHRoZW0gYXMgY3JpdGljYWwgZW5vdWdo
IHRvIGFwcGx5IGp1c3Qgb24gdGhlaXIgb3duCihvbmNlIHRoZXkgcGFzcyB0aGUgcHVzaCBnYXRl
IG9uIHRoZSBtYXN0ZXIgYnJhbmNoKS4KClBsZWFzZSBub3RlIHRoYXQgdGhpcyBpcyBnb2luZyB0
byBiZSB0aGUgbGFzdCBYZW5Qcm9qZWN0IGNvb3JkaW5hdGVkCnJlbGVhc2UgZnJvbSB0aGlzIGJy
YW5jaDsgdGhlIGJyYW5jaCB3aWxsIHRoZW4gc3dpdGNoIGludG8gc2VjdXJpdHkKb25seSBtYWlu
dGVuYW5jZSBtb2RlLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
