Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DAB16FFB3
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 14:11:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6wR0-0005Uc-JP; Wed, 26 Feb 2020 13:09:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=joxT=4O=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j6wQz-0005UX-82
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 13:09:05 +0000
X-Inumbo-ID: 29b0a660-5899-11ea-a490-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29b0a660-5899-11ea-a490-bc764e2007e4;
 Wed, 26 Feb 2020 13:09:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 971FCB143;
 Wed, 26 Feb 2020 13:09:03 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200226121921.28627-1-roger.pau@citrix.com>
 <20200226121921.28627-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <18596fb5-512d-3519-7dc4-fc68efb4c09a@suse.com>
Date: Wed, 26 Feb 2020 14:09:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226121921.28627-4-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 3/4] x86: track when in #MC context
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDIuMjAyMCAxMzoxOSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEFkZCBoZWxwZXJz
IHRvIHRyYWNrIHdoZW4gZXhlY3V0aW5nIGluICNNQyBoYW5kbGVyIGNvbnRleHQuIFRoaXMgaXMK
PiBtb2RlbGVkIGFmdGVyIHRoZSBpbl9pcnEgaGVscGVycy4KPiAKPiBOb3RlIHRoYXQgdGhlcmUg
YXJlIG5vIHVzZXJzIG9mIGluX21jZV9oYW5kbGVyKCkgaW50cm9kdWNlZCBieSB0aGUKPiBjaGFu
Z2UsIGZ1cnRoZXIgdXNlcnMgd2lsbCBiZSBhZGRlZCBieSBmb2xsb3d1cCBjaGFuZ2VzLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoK
UmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkZUUiBJJ20gbm90
IGZpbmFsbHkgY2VydGFpbiB0aGlzIGRvZXNuJ3QgZ28gYSBsaXR0bGUgdG9vIGZhci4KI01DIGhh
bmRsaW5nIHBhdGhzIGhhdmUgdG8gYmUgdmVyeSBjYXJlZnVsIGFueXdheSBpbiB3aGF0IHRoZXkK
Y2FsbCBvciBkby4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
