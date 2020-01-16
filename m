Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6A013DF9E
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 17:09:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is7gM-0000J1-9M; Thu, 16 Jan 2020 16:07:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1is7gK-0000Iu-Pw
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 16:07:40 +0000
X-Inumbo-ID: 4d1816cc-387a-11ea-ac27-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4d1816cc-387a-11ea-ac27-bc764e2007e4;
 Thu, 16 Jan 2020 16:07:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 771F9B2742;
 Thu, 16 Jan 2020 16:07:31 +0000 (UTC)
To: Tamas K Lengyel <tamas.lengyel@intel.com>
References: <cover.1578503483.git.tamas.lengyel@intel.com>
 <631aece1177fcd2326855f0ff4b53dadfcfc3680.1578503483.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1ea9f58b-5f86-7450-d0e3-d17252b94b20@suse.com>
Date: Thu, 16 Jan 2020 17:07:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <631aece1177fcd2326855f0ff4b53dadfcfc3680.1578503483.git.tamas.lengyel@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 11/18] x86/mem_sharing: ASSERT that
 p2m_set_entry succeeds
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

T24gMDguMDEuMjAyMCAxODoxNCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IFNpZ25lZC1vZmYt
Ynk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXMubGVuZ3llbEBpbnRlbC5jb20+Cj4gLS0tCj4gIHhl
bi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jIHwgNDIgKysrKysrKysrKysrKysrKystLS0tLS0t
LS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDIxIGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYyBi
L3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jCj4gaW5kZXggOTNlNzYwNTkwMC4uM2YzNmNk
NmJiYyAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYwo+ICsrKyBi
L3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jCj4gQEAgLTExMTcsMTEgKzExMTcsMTkgQEAg
aW50IGFkZF90b19waHlzbWFwKHN0cnVjdCBkb21haW4gKnNkLCB1bnNpZ25lZCBsb25nIHNnZm4s
IHNocl9oYW5kbGVfdCBzaCwKPiAgICAgICAgICBnb3RvIGVycl91bmxvY2s7Cj4gICAgICB9Cj4g
IAo+ICsgICAgLyoKPiArICAgICAqIE11c3Qgc3VjY2VlZCwgd2UganVzdCByZWFkIHRoZSBlbnRy
eSBhbmQgaG9sZCB0aGUgcDJtIGxvY2sKPiArICAgICAqIHZpYSBnZXRfdHdvX2dmbnMuCj4gKyAg
ICAgKi8KPiAgICAgIHJldCA9IHAybV9zZXRfZW50cnkocDJtLCBfZ2ZuKGNnZm4pLCBzbWZuLCBQ
QUdFX09SREVSXzRLLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICBwMm1fcmFtX3NoYXJlZCwg
YSk7Cj4gKyAgICBBU1NFUlQoIXJldCk7CgpBbmQgdGhlcmUncyBubyByaXNrIG9mIC1FTk9NRU0g
YmVjYXVzZSBvZiBuZWVkaW5nIHRvIHNwbGl0IGEKbGFyZ2VyIG9yZGVyIHBhZ2U/IEF0IHRoZSB2
ZXJ5IGxlYXN0IHRoZSByZWFzb25pbmcgaW4gdGhlCmNvbW1lbnQgd291bGQgbmVlZCBmdXJ0aGVy
IGV4dGVuZGluZy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
