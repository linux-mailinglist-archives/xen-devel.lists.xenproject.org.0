Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB027A467
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 11:35:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsOVg-00087a-TR; Tue, 30 Jul 2019 09:33:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QE78=V3=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hsOVg-00087U-5T
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 09:33:32 +0000
X-Inumbo-ID: 17d4816a-b2ad-11e9-8d84-6bcd57042597
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 17d4816a-b2ad-11e9-8d84-6bcd57042597;
 Tue, 30 Jul 2019 09:33:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E3040C007359;
 Tue, 30 Jul 2019 09:33:29 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.36.118.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30CBB60BE5;
 Tue, 30 Jul 2019 09:33:28 +0000 (UTC)
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190729153944.24239-1-anthony.perard@citrix.com>
 <20190729153944.24239-7-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <71b514aa-f54f-b262-e544-7a1c46a1dbf9@redhat.com>
Date: Tue, 30 Jul 2019 11:33:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190729153944.24239-7-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Tue, 30 Jul 2019 09:33:30 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v4 06/35]
 OvmfPkg/XenResetVector: Add new entry point for Xen PVH
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jordan Justen <jordan.l.justen@intel.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMjkvMTkgMTc6MzksIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IEFkZCBhIG5ldyBlbnRy
eSBwb2ludCBmb3IgWGVuIFBWSCB0aGF0IGVudGVyIGRpcmVjdGx5IGluIDMyYml0cy4KPiAKPiBJ
bmZvcm1hdGlvbiBvbiB0aGUgZXhwZWN0ZWQgc3RhdGUgb2YgdGhlIG1hY2hpbmUgd2hlbiB0aGlz
IGVudHJ5IHBvaW50Cj4gaXMgdXNlZCBjYW4gYmUgZm91bmQgYXQ6Cj4gaHR0cHM6Ly94ZW5iaXRz
LnhlbnByb2plY3Qub3JnL2RvY3MvdW5zdGFibGUvbWlzYy9wdmguaHRtbAo+IAo+IEFsc28sIGNv
bXBhcmUgdG8gdGhlIG9yaWdpbmFsIGZpbGUgWzFdLCB0aGUgdHdvIGBub3AnIG9mIHRoZSAicmVz
ZXRWZWN0b3IiCj4gZW50cnkgcG9pbnQgYXJlIHJlbW92ZWQuIFRoZXJlIHdlcmUgaW50cm9kdWNl
ZCBieSA4MzMyOTgzZTJlMzMKPiAoIlVlZmlDcHVQa2c6IFJlcGxhY2UgdGhlIHVuLW5lY2Vzc2Fy
eSBXQklOVkQgaW5zdHJ1Y3Rpb24gYXQgdGhlIHJlc2V0Cj4gdmVjdG9yIHdpdGggdHdvIE5PUHMg
aW4gVlRGMC4iLCAyMDExLTA4LTA0KSwgYnV0IGRvbid0IHNlZW1zIHRvIGJlCj4gdXNlZnVsLiBU
aGlzIGlzIHRoZSBlbnRyeSBwb2ludCB1c2VkIGJ5IEhWTSBndWVzdCAoaHZtbG9hZGVyKS4KPiAK
PiBbMV0gVWVmaUNwdVBrZy9SZXNldFZlY3Rvci9WdGYwL0lhMTYvUmVzZXRWZWN0b3JWdGYwLmFz
bQo+IAo+IFJlZjogaHR0cHM6Ly9idWd6aWxsYS50aWFub2NvcmUub3JnL3Nob3dfYnVnLmNnaT9p
ZD0xNjg5Cj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNp
dHJpeC5jb20+Cj4gQWNrZWQtYnk6IExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+Cj4g
LS0tCj4gCj4gTm90ZXM6Cj4gICAgIHY0Ogo+ICAgICAtIHJlbW92ZSB0aGUgdHdvIG5vcCBpbiB0
aGUgSFZNIGVudHJ5IHBvaW50CgpBbHNvLCBuZXcgcGFyYWdyYXBoIGluIHRoZSBjb21taXQgbWVz
c2FnZS4KCkFja2VkLWJ5OiBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
