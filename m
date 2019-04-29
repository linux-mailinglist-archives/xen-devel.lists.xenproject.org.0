Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A64E5D7
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 17:11:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL7uP-0004tc-SX; Mon, 29 Apr 2019 15:09:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MPM5=S7=citrix.com=prvs=015b46b47=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hL7uO-0004tM-14
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 15:09:32 +0000
X-Inumbo-ID: c96fbc73-6a90-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c96fbc73-6a90-11e9-843c-bc764e045a96;
 Mon, 29 Apr 2019 15:09:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,409,1549929600"; d="scan'208";a="84659086"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23751.5024.268350.166114@mariner.uk.xensource.com>
Date: Mon, 29 Apr 2019 16:09:20 +0100
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <801bd1ba-1be4-c39c-8842-1d14623ff04e@arm.com>
References: <20190426164002.22381-1-ian.jackson@eu.citrix.com>
 <20190426164002.22381-12-ian.jackson@eu.citrix.com>
 <8ba9d00a-daa1-c09d-4b7b-7556a9d98a7e@arm.com>
 <801bd1ba-1be4-c39c-8842-1d14623ff04e@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [OSSTEST PATCH 11/15] cross builds:
 ts-kernel-build: Support cross target armhf
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
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SnVsaWVuIEdyYWxsIHdyaXRlcyAoIlJlOiBbT1NTVEVTVCBQQVRDSCAxMS8xNV0gY3Jvc3MgYnVp
bGRzOiB0cy1rZXJuZWwtYnVpbGQ6IFN1cHBvcnQgY3Jvc3MgdGFyZ2V0IGFybWhmIik6Cj4gT24g
NC8yNi8xOSAxMDoyMyBQTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gTklUOiBIT1NUQ0MgaXMg
bm90IG5lY2Vzc2FyeS4gSXQgd2lsbCBiZSBkZWZhdWx0IHRvIGdjYyBpZiBub3QgcGFzc2VkLgoK
SSB3aWxsIGRyb3AgaXQuCgo+ID4gT3RoZXJ3aXNlLCB0aGUgZXhwb3J0IGxvb2tzIHdyaXRlIHRv
IG1lLgoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LgoKPiBJIGZvcmdvdCB0byBtZW50aW9uIHRoYXQg
eW91IGNhbiBhZGQgbXkgYWNrIG9uZSBpbiBhbnkgY2FzZToKPiAKPiBBY2tlZC1ieTogSnVsaWVu
IEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCjotKS4KClJlZ2FyZHMsCklhbi4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
