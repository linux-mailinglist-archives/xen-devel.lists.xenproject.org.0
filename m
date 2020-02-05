Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BD2152996
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 12:03:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izIQS-0000iL-4S; Wed, 05 Feb 2020 11:00:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rprq=3Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izIQQ-0000iG-1L
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 11:00:54 +0000
X-Inumbo-ID: c6b3a8c0-4806-11ea-90c9-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c6b3a8c0-4806-11ea-90c9-12813bfff9fa;
 Wed, 05 Feb 2020 11:00:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 23B2FAD61;
 Wed,  5 Feb 2020 11:00:52 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <4d9bf13e-8f1b-4c9c-a4c4-5680a85dfbf0@suse.com>
Message-ID: <d3154dcc-ccde-9926-f955-2911a61c4520@suse.com>
Date: Wed, 5 Feb 2020 12:00:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <4d9bf13e-8f1b-4c9c-a4c4-5680a85dfbf0@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] dom0-build: fix build with clang5
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDEuMjAyMCAxMjozNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gV2l0aCBub24tZW1wdHkg
Q09ORklHX0RPTTBfTUVNIGNsYW5nNSBwcm9kdWNlcwo+IAo+IGRvbTBfYnVpbGQuYzozNDQ6MjQ6
IGVycm9yOiB1c2Ugb2YgbG9naWNhbCAnJiYnIHdpdGggY29uc3RhbnQgb3BlcmFuZCBbLVdlcnJv
ciwtV2NvbnN0YW50LWxvZ2ljYWwtb3BlcmFuZF0KPiAgICAgaWYgKCAhZG9tMF9tZW1fc2V0ICYm
IENPTkZJR19ET00wX01FTVswXSApCj4gICAgICAgICAgICAgICAgICAgICAgICBeICB+fn5+fn5+
fn5+fn5+fn5+fn4KPiBkb20wX2J1aWxkLmM6MzQ0OjI0OiBub3RlOiB1c2UgJyYnIGZvciBhIGJp
dHdpc2Ugb3BlcmF0aW9uCj4gICAgIGlmICggIWRvbTBfbWVtX3NldCAmJiBDT05GSUdfRE9NMF9N
RU1bMF0gKQo+ICAgICAgICAgICAgICAgICAgICAgICAgXn4KPiAgICAgICAgICAgICAgICAgICAg
ICAgICYKPiBkb20wX2J1aWxkLmM6MzQ0OjI0OiBub3RlOiByZW1vdmUgY29uc3RhbnQgdG8gc2ls
ZW5jZSB0aGlzIHdhcm5pbmcKPiAgICAgaWYgKCAhZG9tMF9tZW1fc2V0ICYmIENPTkZJR19ET00w
X01FTVswXSApCj4gICAgICAgICAgICAgICAgICAgICAgIH5efn5+fn5+fn5+fn5+fn5+fn5+fn4K
PiAxIGVycm9yIGdlbmVyYXRlZC4KPiAKPiBPYnZpb3VzbHkgbmVpdGhlciBvZiB0aGUgdHdvIHN1
Z2dlc3Rpb25zIGFyZSBhbiBvcHRpb24gaGVyZS4gT2RkbHkKPiBlbm91Z2ggc3dhcHBpbmcgdGhl
IG9wZXJhbmRzIG9mIHRoZSAmJiBoZWxwcywgd2hpbGUgZS5nLiBjYXN0aW5nIG9yCj4gcGFyZW50
aGVzaXppbmcgZG9lc24ndC4gQW5vdGhlciB3b3JrYWJsZSB2YXJpYW50IGxvb2tzIHRvIGJlIHRo
ZSB1c2Ugb2YKPiAhISBvbiB0aGUgY29uc3RhbnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IEFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGll
bkB4ZW4ub3JnPgo+IEFja2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT4KCkJ0dywgcmF0aGVyIHRoYW4ga2VlcGluZyB0aGUgaXNzdWUgdW5maXhlZCwgSSB0aGlu
ayBJJ2xsIGNvbW1pdCB0aGlzCndpdGhpbiB0aGUgbmV4dCBjb3VwbGUgb2YgZGF5cywgdW5sZXNz
IEkgaGVhciBhbiBleHBsaWNpdCBvYmplY3Rpb24KYWNjb21wYW5pZWQgYnkgYW4gYWx0ZXJuYXRp
dmUgc3VnZ2VzdGlvbiBiZXR0ZXIgdGhhbiB0aGUgc3RybGVuKCkKb25lLiBPZiBjb3Vyc2UgYW4g
YWNrIGJ5IHlvdSB3b3VsZCBiZSBtdWNoIGFwcHJlY2lhdGVkIGFuZCBldmVuCmJldHRlci4KCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
