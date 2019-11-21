Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A8B104A91
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 07:07:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXfas-0007rm-Uz; Thu, 21 Nov 2019 06:05:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=N53E=ZN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iXfas-0007rh-1t
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 06:05:30 +0000
X-Inumbo-ID: e9a03d12-0c24-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e9a03d12-0c24-11ea-9631-bc764e2007e4;
 Thu, 21 Nov 2019 06:05:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2DF4CAAC3;
 Thu, 21 Nov 2019 06:05:26 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
Date: Thu, 21 Nov 2019 07:05:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] Status of 4.13
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlcmUgZG8gd2Ugc3RhbmQgd2l0aCBYZW4gNC4xMyByZWdhcmRpbmcgYmxvY2tlcnMgYW5kIHJl
bGF0ZWQgcGF0Y2hlcz8KCjEuIE9TU3Rlc3QgZmFpbHVyZSByZWdhcmRpbmcgbmVzdGVkIHRlc3Q6
CiAgICBJJ20gbm90IHF1aXRlIHN1cmUgd2hldGhlciB0aGUgY3VycmVudGx5IGRlYmF0ZWQgcGF0
Y2ggb2YgQW5kcmV3IGlzCiAgICBmaXhpbmcgdGhlIHByb2JsZW0uIElmIG5vdCwgZG8gd2Uga25v
dyB3aGF0IGlzIG1pc3Npbmcgb3IgaG93IHRvCiAgICBhZGRyZXNzIHRoZSBpc3N1ZT8gSWYgeWVz
LCBjb3VsZCB3ZSBwbGVhc2UgY29tZSB0byBhbiBhZ3JlZW1lbnQ/CiAgICBBcyBhbiBhbHRlcm5h
dGl2ZTogYW55IHRob3VnaHRzIGFib3V0IGlnbm9yaW5nIHRoaXMgdGVzdCBmYWlsdXJlIGZvcgog
ICAgNC4xMy1SQzMgKElPVzogZG9pbmcgYSBmb3JjZSBwdXNoKT8KCjIuIFJ5emVuL1JvbWUgZmFp
bHVyZXMgd2l0aCBXaW5kb3dzIGd1ZXN0czoKICAgIFdoYXQgaXMgdGhlIGN1cnJlbnRseSBwbGFu
bmVkIHdheSB0byBhZGRyZXNzIHRoZSBwcm9ibGVtPyBXaG8gaXMKICAgIHdvcmtpbmcgb24gdGhh
dD8KCjMuIFBlbmRpbmcgcGF0Y2hlcyBmb3IgNC4xMzoKICAgIENvdWxkIEkgcGxlYXNlIGhhdmUg
ZmVlZGJhY2sgd2hpY2ggcGF0Y2hlcyB0YWdnZWQgYXMgImZvci00LjEzIiBhcmUKICAgIGZpeGlu
ZyByZWFsIHJlZ3Jlc3Npb25zIG9yIGlzc3Vlcz8gSSBkb24ndCB3YW50IHRvIHRha2UgYW55IHBh
dGNoZXMKICAgIG5vdCBmaXhpbmcgcmVhbCBwcm9ibGVtcyBhZnRlciBSQzMsIGFuZCBJIGhvcGUg
dG8gYmUgYWJsZSB0byBnZXQgYQogICAgcHVzaCByYXRoZXIgc29vbmVyIHRoYW4gbGF0ZXIgdG8g
YmUgYWJsZSB0byBsZXQgSWFuIGN1dCBSQzMuCgo0LiBBcmUgdGhlcmUgYW55IGJsb2NrZXJzIGZv
ciA0LjEzIG90aGVyIHRoYW4gMS4gYW5kIDIuIChhcGFydCBvZiBhbnkKICAgIHBlbmRpbmcgWFNB
cyk/CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
