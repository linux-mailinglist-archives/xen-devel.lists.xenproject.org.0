Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CF713DEBD
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 16:26:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is6zT-0003io-Q3; Thu, 16 Jan 2020 15:23:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1is6zS-0003iH-Ey
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 15:23:22 +0000
X-Inumbo-ID: 1c8d3448-3874-11ea-b89f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c8d3448-3874-11ea-b89f-bc764e2007e4;
 Thu, 16 Jan 2020 15:23:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 046EC6A0C7;
 Thu, 16 Jan 2020 15:23:13 +0000 (UTC)
To: Tamas K Lengyel <tamas.lengyel@intel.com>
References: <cover.1578503483.git.tamas.lengyel@intel.com>
 <3f8ab6b4cf686e814d91961b564fede6d0c64030.1578503483.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e1fe9e56-919a-409d-c01a-1453d0338dcf@suse.com>
Date: Thu, 16 Jan 2020 16:23:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <3f8ab6b4cf686e814d91961b564fede6d0c64030.1578503483.git.tamas.lengyel@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 06/18] x86/mem_sharing: define
 mem_sharing_domain to hold some scattered variables
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDEuMjAyMCAxODoxNCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IENyZWF0ZSBzdHJ1
Y3QgbWVtX3NoYXJpbmdfZG9tYWluIHVuZGVyIGh2bV9kb21haW4gYW5kIG1vdmUgbWVtIHNoYXJp
bmcKPiB2YXJpYWJsZXMgaW50byBpdCBmcm9tIHAybV9kb21haW4gYW5kIGh2bV9kb21haW4uCj4g
Cj4gRXhwb3NlIHRoZSBtZW1fc2hhcmluZ19lbmFibGVkIG1hY3JvIHRvIGJlIHVzZWQgY29uc2lz
dGVudGx5IGFjcm9zcyBYZW4uCj4gCj4gUmVtb3ZlIHNvbWUgZHVwbGljYXRlIGNhbGxzIHRvIG1l
bV9zaGFyaW5nX2VuYWJsZWQgaW4gbWVtX3NoYXJpbmcuYwo+IAo+IFNpZ25lZC1vZmYtYnk6IFRh
bWFzIEsgTGVuZ3llbCA8dGFtYXMubGVuZ3llbEBpbnRlbC5jb20+CgpBY2tlZC1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgp3aXRoIG9uZSBxdWVzdGlvbjoKCj4gQEAgLTE5Miw2
ICsxOTIsMTAgQEAgc3RydWN0IGh2bV9kb21haW4gewo+ICAgICAgICAgIHN0cnVjdCB2bXhfZG9t
YWluIHZteDsKPiAgICAgICAgICBzdHJ1Y3Qgc3ZtX2RvbWFpbiBzdm07Cj4gICAgICB9Owo+ICsK
PiArI2lmZGVmIENPTkZJR19NRU1fU0hBUklORwo+ICsgICAgc3RydWN0IG1lbV9zaGFyaW5nX2Rv
bWFpbiBtZW1fc2hhcmluZzsKPiArI2VuZGlmCgpBcmUgeW91IGludGVuZGluZyB0byBhZGQgZmll
bGRzIHRvIHRoaXMgbmV3IHN0cnVjdD8gSWYgc28sCnNob3VsZCB0aGUgZmllbGQgaGVyZSBiZWNv
bWUgYSBwb2ludGVyLCBhbmQgdGhlIHN0cnVjdHVyZQphbGxvY2F0ZWQgb25seSB3aGVuIGFjdHVh
bGx5IG5lZWRlZD8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
