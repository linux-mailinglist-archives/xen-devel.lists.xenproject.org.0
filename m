Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CB2B35C2
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 09:37:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9lXO-0008QQ-1Q; Mon, 16 Sep 2019 07:35:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i9lXM-0008QH-AL
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 07:35:04 +0000
X-Inumbo-ID: 7ed30748-d854-11e9-a337-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ed30748-d854-11e9-a337-bc764e2007e4;
 Mon, 16 Sep 2019 07:35:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8E89EAECA;
 Mon, 16 Sep 2019 07:35:02 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190913162021.23329-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <18c6a334-2061-b344-9c01-5686dab93ff7@suse.com>
Date: Mon, 16 Sep 2019 09:35:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190913162021.23329-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] drivers/acpi: Drop "ERST table was not
 found" message
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDkuMjAxOSAxODoyMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBFUlNUIGlzbid0IGEg
bWFuZGF0b3J5IHRhYmxlLCBhbmQgYWxzbyBpc24ndCB2ZXJ5IGNvbW1vbiB0byBmaW5kLiAgVGhl
IG1lc3NhZ2UKPiBpcyB1bm5lY2Vzc2FyeSBub2lzZSBkdXJpbmcgYm9vdC4gIEZ1cnRoZXJtb3Jl
LCBpdCBpcyByZWR1bmRhbnQgd2l0aCB0aGUgbGlzdAo+IG9mIGZvdW5kIEFDUEkgdGFibGVzIHBy
aW50ZWQganVzdCBhaGVhZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
