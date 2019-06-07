Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 797C438772
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2019 11:57:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hZBZQ-0006Sf-OS; Fri, 07 Jun 2019 09:54:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8c+z=UG=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hZBZO-0006Sa-HY
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2019 09:53:58 +0000
X-Inumbo-ID: 2aa01f3c-890a-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 2aa01f3c-890a-11e9-8980-bc764e045a96;
 Fri, 07 Jun 2019 09:53:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A1BC346;
 Fri,  7 Jun 2019 02:36:20 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D65DA3F96A;
 Fri,  7 Jun 2019 02:36:18 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190521212530.12706-1-volodymyr_babchuk@epam.com>
 <20190521212530.12706-2-volodymyr_babchuk@epam.com>
 <1183ab3f-e483-9ad8-ede3-c905bc2d9331@arm.com>
Message-ID: <73a3c967-66f8-5d26-f657-5093c25cc76b@arm.com>
Date: Fri, 7 Jun 2019 10:36:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1183ab3f-e483-9ad8-ede3-c905bc2d9331@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 01/10] xen/arm: add generic TEE mediator
 framework
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwNi8wNi8yMDE5IDE3OjAyLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgVm9sb2R5bXly
LAo+IAo+IE9uIDUvMjEvMTkgMTA6MjUgUE0sIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgo+PiAr
c3RhdGljIGlubGluZSBib29sIHRlZV9oYW5kbGVfY2FsbChzdHJ1Y3QgY3B1X3VzZXJfcmVncyAq
cmVncykKPj4gK3sKPj4gK8KgwqDCoCByZXR1cm4gZmFsc2U7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRp
YyBpbmxpbmUgaW50IHRlZV9kb21haW5faW5pdChzdHJ1Y3QgZG9tYWluICpkLCB1aW50MTZfdCB0
ZWVfdHlwZSkKPj4gK3sKPj4gK8KgwqDCoCByZXR1cm4gLUVOT0RFVjsKPj4gK30KPiAKPiBJIGhh
ZCBhIHJlcG9ydCB0aGF0IFhlbiBmYWlscyB0byBib290IHdpdGggdGhpcyBzZXJpZXMgYW5kICFD
T05GSUdfVEVFLiBUaGlzIGlzIAo+IGJlY2F1c2UgeW91IHJldHVybiBhbiBlcnJvciBoZXJlIGlu
IGFsbCB0aGUgY2FzZSBzb21lIGRvbWFpbiBjcmVhdGlvbiB3aWxsIAo+IGFsd2F5cyBmYWlsLgo+
IAo+IEluc3RlYWQgdGhpcyBzaG91bGQgY2hlY2sgdGhhdCB0ZWVfdHlwZSBpcyBhbHdheXMgTk9O
RSBvciBlbHNlIHJldHVybiBhbiBlcnJvci4KPiAKPiBBbHNvLCBwbGVhc2UgYXQgbGVhc3QgY2hl
Y2sgdGhhdCB5b3VyIHNlcmllcyBkb2VzIG5vdCBicmVhayBib290IHdoZW4gQ09ORklHX1RFRSAK
PiBpcyBub3Qgc2VsZWN0ZWQuIEl0IHdvdWxkIGFsc28gYmUgaWRlYWwgKGJ1dCBub3QgbWFuZGF0
b3J5KSBpZiB5b3UgY2FuIGNoZWNrIAo+IHRoYXQgaXQgZG9lcyBub3QgYnJlYWsgb24gbm9uLU9Q
VEVFIHBsYXRmb3JtIHdoZW4gIUNPTkZJR19URUUgaXMgc2VsZWN0ZWQuCgpJIGp1c3QgcmVhbGl6
ZWQgdGhpcyBwYXJhZ3JhcGggbWF5IG5vdCBiZSBjbGVhci4gV2hhdCBJIG1lYW50IGlzIHdlIG5l
ZWQgdG8gYXQgCmxlYXN0IHRlc3QgdGhlcmUgYXJlIG5vIHJlZ3Jlc3Npb24gd2hlbiBib290aW5n
IHdoZW4gd2l0aCBDT05GSUdfVEVFPW4uCgpGb3IgQ09ORklHX1RFRT15LCBpdCB3b3VsZCBiZSBn
b29kIHRvIHRlc3QgdGhhdCBpdCBzdGlsbCBib290cyBvbiBwbGF0Zm9ybSBub3QgCnByb3ZpZGlu
ZyBPUC1URUUuIFRoaXMgaXMgbm90IGNyaXRpY2FsIGJlY2F1c2UgdGhlIGNvbmZpZyBjYW5ub3Qg
YmUgc2VsZWN0ZWQgCndpdGhvdXQgQ09ORklHX1hFTl9FWFBFUlQ9eS4KCkNoZWVycywKCj4gCj4g
Q2hlZXJzLAo+IAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
