Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B07BE47B
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 16:17:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL73d-0007pq-D7; Mon, 29 Apr 2019 14:15:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C3NY=S7=citrix.com=prvs=015693d2f=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1hL73b-0007pl-GB
 for xen-devel@lists.xen.org; Mon, 29 Apr 2019 14:14:59 +0000
X-Inumbo-ID: 2b35f890-6a89-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2b35f890-6a89-11e9-843c-bc764e045a96;
 Mon, 29 Apr 2019 14:14:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,409,1549929600"; d="scan'208";a="84645803"
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Pawel Wieczorkiewicz
 <wipawel@amazon.de>
References: <20190416120716.26269-1-wipawel@amazon.de>
 <20190416120716.26269-4-wipawel@amazon.de>
 <20190425045339.GE11831@char.us.oracle.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <2a5512e7-7f82-340d-75cf-cd14be0018b9@citrix.com>
Date: Mon, 29 Apr 2019 15:14:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190425045339.GE11831@char.us.oracle.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [livepatch-build-tools part2 4/6] livepatch-build:
 detect special section group sizes
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
Cc: mpohlack@amazon.de, Glenn Enright <glenn@rimuhosting.com>,
 xen-devel@lists.xen.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNC8yNS8xOSA1OjUzIEFNLCBLb25yYWQgUnplc3p1dGVrIFdpbGsgd3JvdGU6Cj4gT24gVHVl
LCBBcHIgMTYsIDIwMTkgYXQgMTI6MDc6MTRQTSArMDAwMCwgUGF3ZWwgV2llY3pvcmtpZXdpY3og
d3JvdGU6Cj4+IEhhcmQtY29kaW5nIHRoZSBzcGVjaWFsIHNlY3Rpb24gZ3JvdXAgc2l6ZXMgaXMg
dW5yZWxpYWJsZS4gSW5zdGVhZCwKPj4gZGV0ZXJtaW5lIHRoZW0gZHluYW1pY2FsbHkgYnkgZmlu
ZGluZyB0aGUgcmVsYXRlZCBzdHJ1Y3QgZGVmaW5pdGlvbnMKPj4gaW4gdGhlIERXQVJGIG1ldGFk
YXRhLgo+Pgo+PiBUaGlzIGlzIGEgbGl2ZXBhdGNoIGJhY2twb3J0IG9mIGtwYXRjaCB1cHN0cmVh
bSBjb21taXQgWzFdOgo+PiBrcGF0Y2gtYnVpbGQ6IGRldGVjdCBzcGVjaWFsIHNlY3Rpb24gZ3Jv
dXAgc2l6ZXMgMTcwNDQ5ODQ3MTM2YTQ4YjE5ZmMKPj4KPj4gWGVuIG9ubHkgZGVhbHMgd2l0aCBh
bHRfaW5zdHIsIGJ1Z19mcmFtZSBhbmQgZXhjZXB0aW9uX3RhYmxlX2VudHJ5Cj4+IHN0cnVjdHVy
ZXMsIHNvIHNpemVzIG9mIHRoZXNlIHN0cnVjdGVycyBhcmUgb2J0YWluZWQgZnJvbSB4ZW4tc3lt
cy4KPj4KPj4gVGhpcyBjaGFuZ2UgaXMgbmVlZGVkIHNpbmNlIHdpdGggcmVjZW50IFhlbiB0aGUg
YWx0X2luc3RyIHN0cnVjdHVyZQo+PiBoYXMgY2hhbmdlZCBzaXplIGZyb20gMTIgdG8gMTQgYnl0
ZXMuCj4gCj4gT2ggdGhpcyBpcyBzbyBtdWNoIGJldHRlciB0aGFuIHRoZSAic29sdXRpb24iIHdl
IGNvZGVkLgo+IAo+IFRoYW5rIHlvdSEKPiAKPiBSb3NzLCB3aWxsIGNvbW1pdCB0byByZXBvIHVu
bGVzcyB5b3UgaGF2ZSBjb25jZXJucy4uCkkgaGF2ZSByZXZpZXdlZCBpdCB3aXRoIGEgZmV3IGNv
bW1lbnRzLiBOb3RlIHRoYXQgdGhpcyBpcyBiYXNpY2FsbHkgdGhlIApzYW1lIGFzIEdsZW5uIEVu
cmlnaHQncyByZWNlbnQgcGF0Y2ggKCJsaXZlcGF0Y2gtYnVpbGQtdG9vbHM6IERldGVjdCAKc3Bl
Y2lhbCBzZWN0aW9uIGdyb3VwIHNpemVzIikgYnV0IHNsaWdodGx5IG1vcmUgY29tcGxldGUgYXMg
aXQgZGV0ZWN0cyAKc2l6ZXMgZm9yIHRoZSBidWcgZnJhbWVzIHRvbyBzbyBpdCBzaG91bGQgcHJv
YmFibHkgYmUgdXNlZCBpbnN0ZWFkLgoKVGhhbmtzLAotLSAKUm9zcyBMYWdlcndhbGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
