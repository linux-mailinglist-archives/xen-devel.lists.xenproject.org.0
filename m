Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12693CF624
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 11:36:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHlrS-00005M-0N; Tue, 08 Oct 2019 09:32:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aTbt=YB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iHlrQ-00005H-TC
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 09:32:52 +0000
X-Inumbo-ID: 98d3b42e-e9ae-11e9-9bee-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 98d3b42e-e9ae-11e9-9bee-bc764e2007e4;
 Tue, 08 Oct 2019 09:32:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5F960B116;
 Tue,  8 Oct 2019 09:32:50 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <052b6003-53a7-0563-72ac-48fe558ac549@suse.com>
Message-ID: <f40f77fc-0f8b-b5bc-e3e0-cf411cddc47d@suse.com>
Date: Tue, 8 Oct 2019 11:32:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <052b6003-53a7-0563-72ac-48fe558ac549@suse.com>
Content-Language: en-US
Subject: [Xen-devel] Ping: [PATCH] x86/CPUID: RSTR_FP_ERR_PTRS depends on FPU
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDkuMjAxOSAxNzoyNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhlcmUncyBub3RoaW5n
IHRvIHJlc3RvcmUgaGVyZSBpZiB0aGVyZSdzIG5vIEZQVSBpbiB0aGUgZmlyc3QgcGxhY2UuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IC0tLQo+
IFRvIGJlIGNvbnNpZGVyZWQgZm9yIDQuMTMgc2luY2UgUlNUUl9GUF9FUlJfUFRSUyBzdXBwb3J0
IHdhcyBpbnRyb2R1Y2VkCj4ganVzdCByZWNlbnRseS4KCkFuZCBhbHJlYWR5IHJlbGVhc2UtYWNr
ZWQgYnkgSsO8cmdlbi4KCkphbgoKPiAtLS0gYS94ZW4vdG9vbHMvZ2VuLWNwdWlkLnB5Cj4gKysr
IGIveGVuL3Rvb2xzL2dlbi1jcHVpZC5weQo+IEBAIC0xNjgsOCArMTY4LDkgQEAgZGVmIGNydW5j
aF9udW1iZXJzKHN0YXRlKToKPiAgICAgIGRlcHMgPSB7Cj4gICAgICAgICAgIyBGUFUgaXMgdGFr
ZW4gdG8gbWVhbiBzdXBwb3J0IGZvciB0aGUgeDg3IHJlZ2lzZXJzIGFzIHdlbGwgYXMgdGhlCj4g
ICAgICAgICAgIyBpbnN0cnVjdGlvbnMuICBNTVggaXMgZG9jdW1lbnRlZCB0byBhbGlhcyB0aGUg
JU1NIHJlZ2lzdGVycyBvdmVyIHRoZQo+IC0gICAgICAgICMgeDg3ICVTVCByZWdpc3RlcnMgaW4g
aGFyZHdhcmUuCj4gLSAgICAgICAgRlBVOiBbTU1YXSwKPiArICAgICAgICAjIHg4NyAlU1QgcmVn
aXN0ZXJzIGluIGhhcmR3YXJlLiAgQ29ycmVjdCByZXN0b3Jpbmcgb2YgZXJyb3IgcG9pbnRlcnMK
PiArICAgICAgICAjIG9mIGNvdXJzZSBtYWtlcyBubyBzZW5zZSB3aXRob3V0IHRoZXJlIGJlaW5n
IGFueXRoaW5nIHRvIHJlc3RvcmUuCj4gKyAgICAgICAgRlBVOiBbTU1YLCBSU1RSX0ZQX0VSUl9Q
VFJTXSwKPiAgCj4gICAgICAgICAgIyBUaGUgUFNFMzYgZmVhdHVyZSBpbmRpY2F0ZXMgdGhhdCBy
ZXNlcnZlZCBiaXRzIGluIGEgUFNFIHN1cGVycGFnZQo+ICAgICAgICAgICMgbWF5IGJlIHVzZWQg
YXMgZXh0cmEgcGh5c2ljYWwgYWRkcmVzcyBiaXRzLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
