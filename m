Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E2DFC5B9
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2019 12:55:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVDgX-0000Uf-5m; Thu, 14 Nov 2019 11:53:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H8L6=ZG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iVDgV-0000Ua-Bm
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 11:53:11 +0000
X-Inumbo-ID: 5476a63a-06d5-11ea-984a-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5476a63a-06d5-11ea-984a-bc764e2007e4;
 Thu, 14 Nov 2019 11:53:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0E9E9ACCA;
 Thu, 14 Nov 2019 11:53:10 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20191114095737.23287-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7c7b4297-f145-72ed-18dc-259d43f8f4d0@suse.com>
Date: Thu, 14 Nov 2019 12:53:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191114095737.23287-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/x86: add debug key for
 printing vulnerability settings
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

T24gMTQuMTEuMjAxOSAxMDo1NywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBUaGUgb25seSB3YXkg
dG8gb2J0YWluIHRoZSBjdXJyZW50IHZ1bG5lcmFiaWxpdHkgc2V0dGluZ3Mgb2YgWGVuIGlzIHRv
Cj4gbG9vayBhdCB0aGUgaHlwZXJ2aXNvciBib290IG1lc3NhZ2VzLiBPZnRlbiBlbm91Z2ggdGhl
IGJ1ZmZlciBoYXMKPiB3cmFwcGVkIG1ha2luZyBpdCBpbXBvc3NpYmxlIHRvIHJldHJpZXZlIHRo
YXQgaW5mb3JtYXRpb24uCj4gCj4gQWRkIGEgZGVidWcga2V5ICdiJyAobGlrZSAiYnVncyIpIGZv
ciB0aGF0IHB1cnBvc2UuCgpBcyBzYWlkIGVsc2V3aGVyZSwgSSBkb24ndCB0aGluayBhIGRlYnVn
IGtleSBpcyB0aGUgd2F5IHRvIGdvIGhlcmUuClRoYXQncyBiZWNhdXNlCi0gdXNpbmcgYSBkZWJ1
ZyBrZXkgaXMgZ2VuZXJhbGx5IGRlZW1lZCB0byByZW5kZXIgYSBzeXN0ZW0gdW5zdXBwb3J0ZWQs
Ci0gd2UncmUgbm90IHJlYWxseSB0YWxraW5nIGFib3V0ICJkZWJ1ZyIga2luZCBvZiBpbmZvcm1h
dGlvbiBoZXJlIChidXQKICByYXRoZXIgZ2VuZXJhbGx5IHVzZWZ1bCBvbmUpLCBhbmQKLSB3ZSBz
aG91bGQgYmUgcmF0aGVyIGNhcmVmdWwgd2l0aCB3aGF0IHdlIHNwZW5kIHRoZSByZW1haW5pbmcg
YXZhaWxhYmxlCiAgY2hhcmFjdGVycyBmb3IuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
