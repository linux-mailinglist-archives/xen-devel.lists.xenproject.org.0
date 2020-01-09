Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA311356B3
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 11:19:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipUr2-00082q-64; Thu, 09 Jan 2020 10:15:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q+DX=26=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ipUr0-00082l-UH
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 10:15:50 +0000
X-Inumbo-ID: 025f16f0-32c9-11ea-b98e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 025f16f0-32c9-11ea-b98e-12813bfff9fa;
 Thu, 09 Jan 2020 10:15:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2677969C51;
 Thu,  9 Jan 2020 10:15:20 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>, Juergen Gross <jgross@suse.com>
References: <20200109054031.18455-1-jgross@suse.com>
 <791d2e94-3d46-bc8d-b929-280bfe7f2f51@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dec75371-76ad-b405-cf99-532a390a4296@suse.com>
Date: Thu, 9 Jan 2020 11:15:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <791d2e94-3d46-bc8d-b929-280bfe7f2f51@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen: make CONFIG_DEBUG_LOCKS usable without
 CONFIG_DEBUG
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDEuMjAyMCAxMTowNywgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAxLzkvMjAgNTo0
MCBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gSW4gZXhwZXJ0IG1vZGUgaXQgaXMgcG9zc2li
bGUgdG8gZW5hYmxlIENPTkZJR19ERUJVR19MT0NLUyB3aXRob3V0Cj4+IGhhdmluZyBlbmFibGVk
IENPTkZJR19ERUJVRy4gVGhlIGNvZGluZyBpcyBkZXBlbmRpbmcgb24gQ09ORklHX0RFQlVHCj4+
IGFzIGl0IGlzIHVzaW5nIEFTU0VSVCgpLCBob3dldmVyLgo+IAo+IEFueSByZWFzb24gbm90IHRv
IHVzZSBCVUdfT04oKSBpbiB0aGF0IGNhc2U/Cj4gCj4gSGF2aW5nIHR3byBkaWZmZXJlbnQgYXNz
ZXJ0cyBpcyBhbG1vc3QgY2VydGFpbmx5IGdvaW5nIHRvIGNhdXNlIGJ1Z3MuCgpGdXJ0aGVybW9y
ZSwgYXNzZXJ0KCkgaXMgYSBDIHN0YW5kYXJkIGxpYnJhcnkgY29uc3RydWN0LAptYW5kYXRlZCB0
byBiZSBjb250cm9sbGVkIGJ5IE5ERUJVRy4gSS5lLiBpZiBhbnl0aGluZyBhdCBhbGwsCkFTU0VS
VCgpIGNvdWxkIGJlIG1hZGUgYmVoYXZlIGRpZmZlcmVudGx5LCBidXQgb2YgY291cnNlIHRoaXMK
d291bGQgYmUgcXVpdGUgYmlnIGEgY2hhbmdlIHRvIHRoZSBjb2RlIGJhc2UuICsxIHRvIChjb250
aW51ZSkKdXNpbmcgQlVHX09OKCkgYW55d2hlcmUgd2Ugd2FudCBtb3JlIHRoYW4ganVzdCBkZWJ1
ZyBidWlsZApjaGVja2luZy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
