Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C789EBA6
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 16:55:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2cq7-0003GI-EI; Tue, 27 Aug 2019 14:52:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=72vU=WX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i2cq6-0003GA-Ow
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 14:52:54 +0000
X-Inumbo-ID: 58f770d8-c8da-11e9-ac23-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58f770d8-c8da-11e9-ac23-bc764e2007e4;
 Tue, 27 Aug 2019 14:52:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F1C7EACC1;
 Tue, 27 Aug 2019 14:52:52 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190819134213.1628-1-andrew.cooper3@citrix.com>
 <20190819134213.1628-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <053f5923-19fb-bca7-041a-728614fd10f4@suse.com>
Date: Tue, 27 Aug 2019 16:52:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190819134213.1628-4-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/boot: Drop all use of lmsw
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDguMjAxOSAxNTo0MiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBsbXN3IGlzIGFuIG9i
c29sZXRlIHJlbGljIG9mIHRoZSAyODYgcHJvY2Vzc29yIC0gc28gbXVjaCBzbyB0aGF0IGl0IGV2
ZW4gbGFja3MKPiBpbnRlcmNlcHQgYXNzaXN0YW5jZSBvbiBBTUQgcHJvY2Vzc29ycy4KPiAKPiBV
c2UgYSBwbGFpbiBtb3YgdG8gJWNyMCB3aGljaCBpcyBlYXNpZXIgdG8gZm9sbG93LCBjZXJ0YWlu
bHkgZmFzdGVyIHRvCj4gdmlydHVhbGlzZSBvbiBBTUQgaGFyZHdhcmUsIGFuZCBhbG1vc3QgY2Vy
dGFpbmx5IGEgZmFzdGVyIG1pY3JvY29kZSBwYXRoIGluCj4gcmVhbCBoYXJkd2FyZS4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoK
QWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCndpdGggb25lIGZ1cnRo
ZXIgc3VnZ2VzdGlvbjoKCj4gLS0tIGEveGVuL2FyY2gveDg2L2Jvb3QvdHJhbXBvbGluZS5TCj4g
KysrIGIveGVuL2FyY2gveDg2L2Jvb3QvdHJhbXBvbGluZS5TCj4gQEAgLTU0LDkgKzU0LDEwIEBA
IEdMT0JBTCh0cmFtcG9saW5lX3JlYWxtb2RlX2VudHJ5KQo+ICAgICAgICAgIGxpZHQgICAgYm9v
dHN5bShpZHRfNDgpCj4gICAgICAgICAgbGdkdCAgICBib290c3ltKGdkdF80OCkKPiAgICAgICAg
ICBtb3YgICAgICQxLCVibCAgICAgICAgICAgICAgICAgICAgIyBFQlggIT0gMCBpbmRpY2F0ZXMg
d2UgYXJlIGFuIEFQCj4gLSAgICAgICAgeG9yICAgICAlYXgsICVheAo+IC0gICAgICAgIGluYyAg
ICAgJWF4Cj4gLSAgICAgICAgbG1zdyAgICAlYXggICAgICAgICAgICAgICAgICAgICAgICMgQ1Iw
LlBFID0gMSAoZW50ZXIgcHJvdGVjdGVkIG1vZGUpCj4gKwo+ICsgICAgICAgIG1vdiAgICAgJFg4
Nl9DUjBfUEUsICVlYXgKPiArICAgICAgICBtb3YgICAgICVlYXgsICVjcjAKCldoeSBkb24ndCB5
b3UgdXNlICVlYnggaGVyZSwgYWxsb3dpbmcgdGhlIG1vdmUgdG8gJWJsIHRvIGJlCmRyb3BwZWQg
YXQgdGhlIHNhbWUgdGltZT8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
