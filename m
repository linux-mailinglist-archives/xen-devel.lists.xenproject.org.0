Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D57C91356B1
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 11:18:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipUr7-00083E-F9; Thu, 09 Jan 2020 10:15:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3305=26=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ipUr5-000833-Si
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 10:15:55 +0000
X-Inumbo-ID: 025f1826-32c9-11ea-b98f-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 025f1826-32c9-11ea-b98f-12813bfff9fa;
 Thu, 09 Jan 2020 10:15:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4F4DCAE19;
 Thu,  9 Jan 2020 10:15:12 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20200109054031.18455-1-jgross@suse.com>
 <791d2e94-3d46-bc8d-b929-280bfe7f2f51@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <beb1d847-caee-ddc0-1688-34a42072095f@suse.com>
Date: Thu, 9 Jan 2020 11:15:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDEuMjAgMTE6MDcsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gT24gMS85LzIwIDU6NDAg
QU0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IEluIGV4cGVydCBtb2RlIGl0IGlzIHBvc3NpYmxl
IHRvIGVuYWJsZSBDT05GSUdfREVCVUdfTE9DS1Mgd2l0aG91dAo+PiBoYXZpbmcgZW5hYmxlZCBD
T05GSUdfREVCVUcuIFRoZSBjb2RpbmcgaXMgZGVwZW5kaW5nIG9uIENPTkZJR19ERUJVRwo+PiBh
cyBpdCBpcyB1c2luZyBBU1NFUlQoKSwgaG93ZXZlci4KPiAKPiBBbnkgcmVhc29uIG5vdCB0byB1
c2UgQlVHX09OKCkgaW4gdGhhdCBjYXNlPwoKVGhlIG1haW4gcmVhc29uIGlzIHRoZSBtaXNzaW5n
IG1lc3NhZ2Ugd2hpY2ggY29uZGl0aW9uIGZhaWxlZC4KCkEgcmVuYW1lICgiQlVHX0FTU0VSVCI/
KSBjb3VsZCBiZSBhbiBhbHRlcm5hdGl2ZSB0byBqdXN0IGRyb3BwaW5nCnRoZSBtZXNzYWdlLiBC
b3RoIHdvdWxkIGJlIGZpbmUgd2l0aCBtZS4KCj4gCj4gSGF2aW5nIHR3byBkaWZmZXJlbnQgYXNz
ZXJ0cyBpcyBhbG1vc3QgY2VydGFpbmx5IGdvaW5nIHRvIGNhdXNlIGJ1Z3MuCgpPYnZpb3VzbHkg
aGF2aW5nIG9ubHkgb25lIGlzIGVub3VnaCBmb3IgYnVncyBhbHJlYWR5LiA7LSkKCgpKdWVyZ2Vu
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
