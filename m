Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D8BEE11B
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2019 14:28:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRcLx-0003oK-OO; Mon, 04 Nov 2019 13:25:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=M3pU=Y4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iRcLv-0003oF-MH
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2019 13:25:03 +0000
X-Inumbo-ID: 80d68852-ff06-11e9-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80d68852-ff06-11e9-9631-bc764e2007e4;
 Mon, 04 Nov 2019 13:25:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 60523B377;
 Mon,  4 Nov 2019 13:25:00 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191101202502.31750-1-andrew.cooper3@citrix.com>
 <20191101202502.31750-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <618aa239-278d-ab34-0f91-3cf7f257a612@suse.com>
Date: Mon, 4 Nov 2019 14:25:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191101202502.31750-2-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/3] x86/boot: Remove cached CPUID data from
 the trampoline
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMTEuMjAxOSAyMToyNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiAtLS0gYS94ZW4vYXJj
aC94ODYvY3B1L2ludGVsLmMKPiArKysgYi94ZW4vYXJjaC94ODYvY3B1L2ludGVsLmMKPiBAQCAt
MjcwLDYgKzI3MCw3IEBAIHN0YXRpYyB2b2lkIGVhcmx5X2luaXRfaW50ZWwoc3RydWN0IGNwdWlu
Zm9feDg2ICpjKQo+ICAJaWYgKGRpc2FibGUpIHsKPiAgCQl3cm1zcmwoTVNSX0lBMzJfTUlTQ19F
TkFCTEUsIG1pc2NfZW5hYmxlICYgfmRpc2FibGUpOwo+ICAJCWJvb3RzeW0odHJhbXBvbGluZV9t
aXNjX2VuYWJsZV9vZmYpIHw9IGRpc2FibGU7Cj4gKwkJYm9vdHN5bSh0cmFtcG9saW5lX2VmZXIp
IHw9IEVGRVJfTlg7Cj4gIAl9CgpJJ20gZmluZSB3aXRoIGFsbCBvdGhlciBjaGFuZ2VzIGhlcmUs
IGp1c3QgdGhpcyBvbmUgY29uY2VybnMgbWU6CkJlZm9yZSB5b3VyIGNoYW5nZSB3ZSBsYXRjaCBh
IHZhbHVlIGludG8gdHJhbXBvbGluZV9taXNjX2VuYWJsZV9vZmYKanVzdCB0byBiZSB1c2VkIGZv
ciBzdWJzZXF1ZW50IElBMzJfTUlTQ19FTkFCTEUgd3JpdGVzIHdlIGRvLiBUaGlzCm1lYW5zIHRo
YXQsIG9uIGEgaHlwZXJ2aXNvciAobGlrZSBYZW4gaXRzZWxmKSBzaW1wbHkgZGlzY2FyZGluZwpn
dWVzdCB3cml0ZXMgdG8gdGhlIE1TUiAod2hpY2ggaXMgImZpbmUiIHdpdGggdGhlIGRlc2NyaWJl
ZCB1c2FnZQpvZiBvdXJzIHVwIHRvIG5vdyksIHdpdGggeW91ciBjaGFuZ2Ugd2UnZCBub3cgZW5k
IHVwIHRyeWluZyB0byBzZXQKRUZFUi5OWCB3aGVuIHRoZSBmZWF0dXJlIG1heSBub3QgYWN0dWFs
bHkgYmUgZW5hYmxlZCBpbgpJQTMyX01JU0NfRU5BQkxFLiBXb3VsZG4ndCBzdWNoIGFuIEVGRVIg
d3JpdGUgYmUgbGlhYmxlIHRvICNHUCgwKT8KSS5lLiBkb24ndCB3ZSBuZWVkIHRvIHJlYWQgYmFj
ayB0aGUgTVNSIHZhbHVlIGhlcmUsIGFuZCB2ZXJpZnkKd2UgYWN0dWFsbHkgbWFuYWdlZCB0byBj
bGVhciB0aGUgYml0IGJlZm9yZSBhY3R1YWxseSBPUi1pbmcgaW4KRUZFUl9OWD8KCkphbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
