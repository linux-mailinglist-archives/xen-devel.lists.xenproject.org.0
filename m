Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D33517752C
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 12:16:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j95Uv-0006T7-4E; Tue, 03 Mar 2020 11:14:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TLdZ=4U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j95Uu-0006T2-G0
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 11:14:00 +0000
X-Inumbo-ID: 14c8277c-5d40-11ea-82f6-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 14c8277c-5d40-11ea-82f6-bc764e2007e4;
 Tue, 03 Mar 2020 11:14:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1F06EB240;
 Tue,  3 Mar 2020 11:13:59 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9731ee51-33ac-d916-3ae4-3126756a76c9@suse.com>
Date: Tue, 3 Mar 2020 12:13:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] MAINTAINERS: Paul to co-maintain
 vendor-independent IOMMU code
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGF2aW5nIGp1c3QgYSBzaW5nbGUgbWFpbnRhaW5lciBpcyBub3QgaGVscGZ1bCBhbnl3aGVyZSwg
YW5kIGNhbiBiZQphdm9pZGVkIGhlcmUgcXVpdGUgZWFzaWx5LCBzZWVpbmcgdGhhdCBQYXVsIGhh
cyBiZWVuIGRvaW5nIHF1aXRlIGEgYml0Cm9mIElPTU1VIHdvcmsgbGF0ZWx5LgoKU2lnbmVkLW9m
Zi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEvTUFJTlRBSU5FUlMK
KysrIGIvTUFJTlRBSU5FUlMKQEAgLTMyMyw2ICszMjMsNyBAQCBGOgl4ZW4vYXJjaC94ODYvY3B1
L3ZwbXVfaW50ZWwuYwogCiBJT01NVSBWRU5ET1IgSU5ERVBFTkRFTlQgQ09ERQogTToJSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgorTToJUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6
b24uY29tPgogUzoJU3VwcG9ydGVkCiBGOgl4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC8KIFg6CXhl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
