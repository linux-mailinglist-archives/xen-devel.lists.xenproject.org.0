Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE69FB2AA
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 15:34:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUtfx-0007yu-8t; Wed, 13 Nov 2019 14:31:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=J2+i=ZF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iUtfv-0007yl-7c
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 14:31:15 +0000
X-Inumbo-ID: 3ea81ed2-0622-11ea-b678-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3ea81ed2-0622-11ea-b678-bc764e2007e4;
 Wed, 13 Nov 2019 14:31:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8A4F5AD69;
 Wed, 13 Nov 2019 14:31:13 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20191113134136.16180-1-andrew.cooper3@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <7c0e22d3-4a98-e407-3d95-0d72625eee65@suse.com>
Date: Wed, 13 Nov 2019 15:31:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191113134136.16180-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] AMD/IOMMU: Fix crash in 'V'
 debugkey
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
Cc: Jan Beulich <JBeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTEuMTkgMTQ6NDEsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gYy9zIGJiMDM4ZjMxMTY4
ICJBTUQvSU9NTVU6IHJlcGxhY2UgSU5UUkVNQVBfRU5UUklFUyIgaW50cm9kdWNlcyBhIGNhbGwg
dG8KPiBpbnRyZW1hcF90YWJsZV9lbnRyaWVzKCkgaW4gZHVtcF9pbnRyZW1hcF90YWJsZSgpIGJl
Zm9yZSB0YmwucHRyIGlzIGNoZWNrZWQKPiBmb3IgTlVMTC4KPiAKPiBpbnRyZW1hcF90YWJsZV9l
bnRyaWVzKCkgaW50ZXJuYWxseSB1c2VzIHZpcnRfdG9fcGFnZSgpIHdoaWNoIGZhbGxzIG92ZXIK
PiAKPiAgICBBU1NFUlQodmEgPj0gWEVOX1ZJUlRfU1RBUlQpOwo+IAo+IGluIF9fdmlydF90b19w
YWdlKCkuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KClJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
