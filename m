Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F15A109E7C
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 14:07:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZaVX-0000Of-MF; Tue, 26 Nov 2019 13:03:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EMZS=ZS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZaVW-0000Oa-PY
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 13:03:54 +0000
X-Inumbo-ID: 3207b1e6-104d-11ea-a3a0-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3207b1e6-104d-11ea-a3a0-12813bfff9fa;
 Tue, 26 Nov 2019 13:03:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 494CCAC10;
 Tue, 26 Nov 2019 13:03:53 +0000 (UTC)
To: Pawel Wieczorkiewicz <wipawel@amazon.de>
References: <20191126123027.9032-1-wipawel@amazon.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c2b14aac-0783-7b3d-abf3-9777627dab9e@suse.com>
Date: Tue, 26 Nov 2019 14:03:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191126123027.9032-1-wipawel@amazon.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] MAINTAINERS: Add mandatory V: version
 identifier
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
Cc: xen-devel@lists.xenproject.org, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 LarsKurth <lars.kurth@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMTEuMjAxOSAxMzozMCwgUGF3ZWwgV2llY3pvcmtpZXdpY3ogd3JvdGU6Cj4gVGhpcyBz
ZWVtcyByZXF1aXJlZCBieSB0aGUgWGVuIHJlcG8ncyBhZGRfbWFpbnRhaW5lcnMucGwgc2NyaXB0
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhd2VsIFdpZWN6b3JraWV3aWN6IDx3aXBhd2VsQGFtYXpv
bi5kZT4KPiAtLS0KPiAgTUFJTlRBSU5FUlMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKPiBp
bmRleCBkZTJhZWRiLi5hYTA0ZDA2IDEwMDY0NAo+IC0tLSBhL01BSU5UQUlORVJTCj4gKysrIGIv
TUFJTlRBSU5FUlMKPiBAQCAtOSwzICs5LDQgQEAgTDoJeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCj4gIFM6CVN1cHBvcnRlZAo+ICBGOgkqCj4gIEY6CSovCj4gK1Y6ICAgICAgeGVuLW1h
aW50YWluZXJzLTEKCkl0IHdvdWxkIGhhdmUgaGVscGVkIGlmIHlvdSBpZGVudGlmaWVkIHdoaWNo
IHJlcG8gdGhpcyBpcyBhZ2FpbnN0LgpJIGFsc28gbm90ZSB5b3UgdXNlIHNwYWNlcyBpbW1lZGlh
dGVseSBuZXh0IHRvIGxpbmVzIHVzaW5nIHRhYnMKZm9yIHRoZSBzYW1lIHB1cnBvc2UuCgpKYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
