Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4EA76FAF
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 19:22:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr3sW-0002UK-B6; Fri, 26 Jul 2019 17:19:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+GT9=VX=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hr3sU-0002UF-TU
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 17:19:34 +0000
X-Inumbo-ID: 8944da66-afc9-11e9-b8be-2737aaff46fc
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8944da66-afc9-11e9-b8be-2737aaff46fc;
 Fri, 26 Jul 2019 17:19:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 60AFA2EED3D;
 Fri, 26 Jul 2019 17:19:33 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-40.ams2.redhat.com
 [10.36.116.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2A36620CA;
 Fri, 26 Jul 2019 17:19:31 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
 <20190704144233.27968-34-anthony.perard@citrix.com>
 <4badd535-c23d-c64d-7bb3-fb42bbbf538a@redhat.com>
 <20190726160642.GG1242@perard.uk.xensource.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <a2cc4fa2-becb-af51-92e7-81e30ee5a1a1@redhat.com>
Date: Fri, 26 Jul 2019 19:19:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190726160642.GG1242@perard.uk.xensource.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Fri, 26 Jul 2019 17:19:33 +0000 (UTC)
Subject: Re: [Xen-devel] [PATCH v3 33/35] OvmfPkg: Introduce XenIoPvhDxe to
 initialize Grant Tables
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
Cc: xen-devel@lists.xenproject.org, devel@edk2.groups.io,
 Julien Grall <julien.grall@arm.com>, Jordan Justen <jordan.l.justen@intel.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMjYvMTkgMTg6MDYsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IE9uIFdlZCwgSnVsIDEw
LCAyMDE5IGF0IDA0OjA1OjAyUE0gKzAyMDAsIExhc3psbyBFcnNlayB3cm90ZToKPj4gT24gMDcv
MDQvMTkgMTY6NDIsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgoKPj4+ICsgIGlmIChTdGF0ZSA9PSBO
VUxMKSB7Cj4+PiArICAgIFN0YXR1cyA9IEVGSV9PVVRfT0ZfUkVTT1VSQ0VTOwo+Pj4gKyAgICBn
b3RvIEVycm9yOwo+Pj4gKyAgfQo+Pj4gKwo+Pj4gKyAgQWxsb2NhdGlvbiA9IEFsbG9jYXRlUmVz
ZXJ2ZWRQYWdlcyAoWEVOX0dSQU5UX0ZSQU1FUyk7Cj4+Cj4+ICg1KSBTbywgYWdhaW4sIHBsZWFz
ZSBldmFsdWF0ZSBpZiB0aGlzIGNvdWxkIHNpbXBseSBiZSBBbGxvY2F0ZVBhZ2VzKCkuCj4gCj4g
SSB3b3VsZCBwcmVmZXIgdG8gbGV0IGtub3cgdGhlIG9wZXJhdGluZyBzeXN0ZW0gdGhhdCB0aG9z
ZSBwYWdlcyBhcmUKPiBwb3RlbnRpYWxseSB1c2VkLCB1bmxlc3MgSSdtIHN1cmUgT1ZNRiBoYXMg
bGV0IGtub3cgWGVuIHRoYXQgdGhvc2UKPiBwYWdlcyBkb24ndCBjb250YWluIHRoZSBncmFudCB0
YWJsZSBhbnltb3JlLgo+IAo+IEknbGwgcHJvYmFibHkgdHJ5IHRvIG1ha2Ugc29tZSBjaGFuZ2Vz
IGluIE9WTUYgdG8gYWxsb3cgdG8gZ2l2ZSBiYWNrCj4gdGhvc2UgcGFnZXMsIGJ1dCBmb3Igbm93
IEkgdGhpbmsga2VlcGluZyB0aG9zZSBwYWdlcyBhcyByZXNlcnZlZCB3aWxsCj4gYmUgZ29vZCBl
bm91Z2guCgpGYWlyIGVub3VnaCEKClRoYW5rcywKTGFzemxvCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
