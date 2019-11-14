Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8543CFC64D
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2019 13:29:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVEC0-0003JG-EG; Thu, 14 Nov 2019 12:25:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H8L6=ZG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iVEBz-0003J7-0K
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 12:25:43 +0000
X-Inumbo-ID: dec8d34a-06d9-11ea-a24a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dec8d34a-06d9-11ea-a24a-12813bfff9fa;
 Thu, 14 Nov 2019 12:25:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3F9D4B31C;
 Thu, 14 Nov 2019 12:25:39 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191113155940.81837-1-roger.pau@citrix.com>
 <20191113155940.81837-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d011e557-e65f-8362-91e7-aa0c6df029c3@suse.com>
Date: Thu, 14 Nov 2019 13:25:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191113155940.81837-2-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 v4 1/3] vmx: add ASSERT to prevent
 syncing PIR to IRR...
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTEuMjAxOSAxNjo1OSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9odm0vdm14L3ZteC5jCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMK
PiBAQCAtMjA1NCw2ICsyMDU0LDE3IEBAIHN0YXRpYyB2b2lkIHZteF9zeW5jX3Bpcl90b19pcnIo
c3RydWN0IHZjcHUgKnYpCj4gICAgICB1bnNpZ25lZCBpbnQgZ3JvdXAsIGk7Cj4gICAgICBERUNM
QVJFX0JJVE1BUChwZW5kaW5nX2ludHIsIE5SX1ZFQ1RPUlMpOwo+ICAKPiArICAgIGlmICggdiAh
PSBjdXJyZW50ICYmIHYtPmlzX3J1bm5pbmcgKQoKSWlyYyBpdCB3YXMgc3VnZ2VzdGVkIHRvIHVz
ZSB2Y3B1X3J1bm5hYmxlKCkgaGVyZS4gSXMgdGhlcmUgYSByZWFzb24KeW91IHVzZWQgdGhlIGxl
c3MgcmVsaWFibGUgKG1vcmUgcHJvbmUgdG8gcmFjZXMpIC0+aXNfcnVubmluZz8KCkphbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
