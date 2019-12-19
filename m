Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BFE125F27
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 11:35:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iht6e-0000lP-BU; Thu, 19 Dec 2019 10:32:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ScRH=2J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iht6b-0000lI-Vz
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 10:32:30 +0000
X-Inumbo-ID: d574d546-224a-11ea-88e7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d574d546-224a-11ea-88e7-bc764e2007e4;
 Thu, 19 Dec 2019 10:32:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C6F2BABCD;
 Thu, 19 Dec 2019 10:32:18 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>
References: <20191218160926.12538-1-pdurrant@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <56e0a08f-bad9-f3ca-0e65-8b75de19f37c@suse.com>
Date: Thu, 19 Dec 2019 11:32:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191218160926.12538-1-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/save: reserve HVM save record numbers
 that have been consumed...
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMTIuMjAxOSAxNzowOSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IC0tLSBhL3hlbi9pbmNs
dWRlL3B1YmxpYy9hcmNoLXg4Ni9odm0vc2F2ZS5oCj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGlj
L2FyY2gteDg2L2h2bS9zYXZlLmgKPiBAQCAtNjM5LDEwICs2MzksMTIgQEAgc3RydWN0IGh2bV9t
c3Igewo+ICAKPiAgI2RlZmluZSBDUFVfTVNSX0NPREUgIDIwCj4gIAo+ICsvKiBSYW5nZSAyMiAt
IDQwIHJlc2VydmVkIGZvciBBbWF6b24gKi8KPiArCj4gIC8qCj4gICAqIExhcmdlc3QgdHlwZS1j
b2RlIGluIHVzZQo+ICAgKi8KPiAtI2RlZmluZSBIVk1fU0FWRV9DT0RFX01BWCAyMAo+ICsjZGVm
aW5lIEhWTV9TQVZFX0NPREVfTUFYIDQwCgpJJ20gbm90IG92ZXJseSBoYXBweSB0byBzZWUgdGhl
IHJlc3BlY3RpdmUgaW4tWGVuIGFycmF5IGRvdWJsZSBpdHMKc2l6ZSBmb3Igbm8gdXNlIGF0IGFs
bC4gSSBhbHNvIGRvbid0IHRoaW5rIG91dC1vZi10cmVlIGV4dGVuc2lvbnMKc2hvdWxkIGhhdmUg
YmVlbiBhZGRlZCB1c2luZyBudW1iZXJzIGNvbnNlY3V0aXZlIHRvIHRoZSB1cHN0cmVhbQpvbmVz
LiBJbnN0ZWFkLCBhbiBBbWF6b24gcmFuZ2Ugc2hvdWxkIGhhdmUgYmVlbiBwaWNrZWQgaGlnaCB1
cCBpbgp0aGUgbnVtYmVyIHNwYWNlIChlLmcuIHdpdGggdGhlIHVwcGVyIGJ5dGUgYmVpbmcgQVND
SUkgJ0EnKS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
