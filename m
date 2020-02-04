Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 021311517F5
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 10:36:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyuZY-0000zx-Bd; Tue, 04 Feb 2020 09:32:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fS9R=3Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iyuZX-0000zs-IH
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 09:32:43 +0000
X-Inumbo-ID: 4af55182-4731-11ea-8ef9-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4af55182-4731-11ea-8ef9-12813bfff9fa;
 Tue, 04 Feb 2020 09:32:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B636AAC2C;
 Tue,  4 Feb 2020 09:32:41 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200203173728.18135-1-roger.pau@citrix.com>
 <20200203173728.18135-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <99dbde26-e11e-5bc5-b702-3c76a8370d91@suse.com>
Date: Tue, 4 Feb 2020 10:32:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200203173728.18135-2-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/2] nvmx: implement support for MSR
 bitmaps
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
Cc: xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDIuMjAyMCAxODozNywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEBAIC0xODIsNiAr
MTkyLDExIEBAIHZvaWQgbnZteF92Y3B1X2Rlc3Ryb3koc3RydWN0IHZjcHUgKnYpCj4gICAgICAg
ICAgZnJlZV9kb21oZWFwX3BhZ2Uodi0+YXJjaC5odm0udm14LnZtd3JpdGVfYml0bWFwKTsKPiAg
ICAgICAgICB2LT5hcmNoLmh2bS52bXgudm13cml0ZV9iaXRtYXAgPSBOVUxMOwo+ICAgICAgfQo+
ICsgICAgaWYgKCBudm14LT5tc3JfbWVyZ2VkICkKPiArICAgIHsKPiArICAgICAgICBmcmVlX2Rv
bWhlYXBfcGFnZShudm14LT5tc3JfbWVyZ2VkKTsKPiArICAgICAgICBudm14LT5tc3JfbWVyZ2Vk
ID0gTlVMTDsKPiArICAgIH0KCkNhbiB0aGlzIG5vdCBiZSBkb25lIC4uLgoKPiAgfQo+ICAgCj4g
IHZvaWQgbnZteF9kb21haW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMoc3RydWN0IGRvbWFpbiAqZCkK
Ci4uLiBpbiB0aGlzIGZ1bmN0aW9uLCB0aHVzIGhhcHBlbmluZyBlYXJsaWVyIHVwb24gZG9tYWlu
CmNsZWFudXAsIGFuZCBsZWF2aW5nIGxlc3MgcmVzb3VyY2VzIGFsbG9jYXRlZCBpbiBjYXNlIGEg
ZG9tYWluCmVuZHMgdXAgYXMgem9tYmllIChkdWUgdG8gYW5vdGhlciBidWcgZWxzZXdoZXJlKT8g
QWN0dWFsbHkgLQphcmVuJ3QgeW91IGV4dGVuZGluZyBhbiBleGlzdGluZyBidWcgdGhpcyB3YXk/
IFdoZW4KbmVzdGVkaHZtX3ZjcHVfaW5pdGlhbGlzZSgpIGZhaWxzLCBuZXN0ZWRodm1fdmNwdV9k
ZXN0cm95KCkKd29uJ3QgYmUgY2FsbGVkIGFmYWljdC4gSGVuY2UgbnZteF92Y3B1X2luaXRpYWxp
c2UoKSBub3QKY2xlYW5pbmcgdXAgYWZ0ZXIgaXRzZWxmIGluIGNhc2Ugb2YgZmFpbHVyZSBsb29r
cyB0byBiZSBhCm1lbW9yeSBsZWFrLiBBcyBvZiBiMzM0NGJiMWNhZTAgYW55IHN1Y2ggd2lsbCBi
ZSB0YWtlbiBjYXJlCm9mIGltcGxpY2l0bHkgYXMgbG9uZyBhcyB0aGUgZnJlZWluZyBoYXBwZW5z
IG9uIHRoZQpyZWxpbnF1aXNoLXJlc291cmNlcyBwYXRocy4KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
