Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27391162A2
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 13:14:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNxyk-0000Hb-Lz; Tue, 07 May 2019 11:09:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dSdb=TH=citrix.com=prvs=023b58f18=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hNxyj-0000HW-MT
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 11:09:45 +0000
X-Inumbo-ID: 9e49d900-70b8-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9e49d900-70b8-11e9-843c-bc764e045a96;
 Tue, 07 May 2019 11:09:44 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,441,1549929600"; d="scan'208";a="85207653"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23761.26485.474022.299868@mariner.uk.xensource.com>
Date: Tue, 7 May 2019 12:09:41 +0100
To: Wei Liu <wei.liu2@citrix.com>, Juergen Gross <jgross@suse.com>, Jan
 Beulich <JBeulich@suse.com>, <xen-devel@lists.xenproject.org>
In-Reply-To: <23751.6297.231034.162861@mariner.uk.xensource.com>
References: <23751.6062.590245.436664@mariner.uk.xensource.com>
 <23751.6297.231034.162861@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: [Xen-devel] [PATCH STABLE] tools/firmware: update OVMF Makefile,
 when necessaryf
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
ZSBPVk1GIE1ha2VmaWxlLCB3aGVuIG5lY2Vzc2FyeSIpOgo+IE5vdyBkb25lLCBpbmNsdWRpbmcg
Zm9yIHN0YWdpbmctNC42LiAgNC42IGlzIG91dCBvZiBzZWN1cml0eSBzdXBwb3J0LAo+IGJ1dCBv
c3N0ZXN0IHdhbnRzIHRvIGJlIGFibGUgdG8gYnVpbGQgNC42IHNvIHRoYXQgaXQgY2FuIHRlc3QK
PiBtaWdyYXRpb24gZnJvbSA0LjYgdG8gNC43LCBhbmQgNC43ICppcyogc3RpbGwgKGp1c3QgYWJv
dXQpIGluIHNlY3VyaXR5Cj4gc3VwcG9ydC4KCkkgaGF2ZSBjaGVycnkgcGlja2VkIGFub3RoZXIg
MiBidWlsZCBmaXhlcyBmcm9tIDQuNyBvbnRvIHN0YWdpbmctNC42OgoKICA3YzhkYjU4ZDM3Mzlj
ODA1ZjRjMGY3NzNiNjUxNTdmMzA2YjAwYzJhCiAgRml4IG1pc2xlYWRpbmcgaW5kZW50YXRpb24g
d2FybmluZ3MKCiAgZTY3NTMzMmQ1ZDA0OWJiZjVjZTRjZjE5MjRhNjQxNGI4MDM1OTYzZAogIHhl
bmFseXplOiByZW1vdmUgY3IzX2NvbXBhcmVfdG90YWwKCklhbi4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
