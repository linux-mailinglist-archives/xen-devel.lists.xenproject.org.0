Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2FC70D26
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 01:11:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hphPs-00032d-57; Mon, 22 Jul 2019 23:08:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=V0js=VT=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hphPq-00032Y-UB
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 23:08:22 +0000
X-Inumbo-ID: 996c67ac-acd5-11e9-bbfb-d37ea83cb6d0
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 996c67ac-acd5-11e9-bbfb-d37ea83cb6d0;
 Mon, 22 Jul 2019 23:08:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1E50259449;
 Mon, 22 Jul 2019 23:08:21 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-117-23.ams2.redhat.com
 [10.36.117.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B8F26012D;
 Mon, 22 Jul 2019 23:08:19 +0000 (UTC)
From: Laszlo Ersek <lersek@redhat.com>
To: Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
 <20190704144233.27968-25-anthony.perard@citrix.com>
 <20190715141521.aqmpchgzyleoergc@MacBook-Air-de-Roger.local>
 <20190722145319.GG1208@perard.uk.xensource.com>
 <8b9cb231-e9e5-8f92-f8d4-a6f05efaa888@redhat.com>
Message-ID: <87f9398f-9ce6-7938-e321-cd97d68b85d6@redhat.com>
Date: Tue, 23 Jul 2019 01:08:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <8b9cb231-e9e5-8f92-f8d4-a6f05efaa888@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Mon, 22 Jul 2019 23:08:21 +0000 (UTC)
Subject: Re: [Xen-devel] [PATCH v3 24/35] OvmfPkg/XenPlatformPei: Rework
 memory detection
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
 Andrew Cooper <andrew.cooper3@citrix.com>, devel@edk2.groups.io,
 Julien Grall <julien.grall@arm.com>, Jordan Justen <jordan.l.justen@intel.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMjIvMTkgMjE6NDUsIExhc3psbyBFcnNlayB3cm90ZToKCj4gd2UgcGxhY2UgdGhlIDMy
LWJpdCBQQ0kgSU9NTVUgYXBlcnR1cmUgYmFzZWQgb24gWy4uLl0KCkRvIEkgZ2V0IGEgbWVkYWwg
Zm9yIHRoaXMgaHVnZWx5IGNvbmZ1c2luZyB0eXBvPyA6KQoKSW4gZWFybmVzdCwgSSdtIHNvcnJ5
IGFib3V0IGl0IC0tIG15IGNvbW1lbnQgaGFkIG5vdGhpbmcgdG8gZG8gd2l0aAoiSU9NTVUiOyBJ
IG1lYW50ICJNTUlPIi4gKEF0IGxlYXN0IEkgZ290IGl0IHJpZ2h0IGluIHRoZSByZXN0IG9mIHRo
ZSBlbWFpbC4pCgpTb3JyeSEKTGFzemxvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
