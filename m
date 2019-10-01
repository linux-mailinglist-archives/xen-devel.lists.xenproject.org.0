Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F88C2D8A
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 08:38:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFBl4-0006Ah-Qr; Tue, 01 Oct 2019 06:35:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hN/W=X2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iFBl3-0006Aa-5j
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 06:35:37 +0000
X-Inumbo-ID: ac58fae8-e415-11e9-96f2-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id ac58fae8-e415-11e9-96f2-12813bfff9fa;
 Tue, 01 Oct 2019 06:35:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8C536ACC9;
 Tue,  1 Oct 2019 06:35:34 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20190930182437.25478-1-andrew.cooper3@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <0f40b13c-1626-4b17-b415-3ae87dbd8cb8@suse.com>
Date: Tue, 1 Oct 2019 08:35:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190930182437.25478-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 0/2] xen/nospec: Add Kconfig
 options for speculative hardening
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
Cc: Wei Liu <wl@xen.org>, Norbert Manthey <nmanthey@amazon.de>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDkuMTkgMjA6MjQsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gVGhlIG1haW4gcHVycG9z
ZSBpcyBwYXRjaCAyLiAgVGhlICJsMXRmLWJhcnJpZXIiIHdvcmsgY3VycmVudGx5IGNhdXNlcyBh
IHBlcmYKPiBoaXQgYW5kIGdhaW5zIG5vIHNhZmV0eSwgYW5kIGlzIHRoZXJlZm9yZSB1bmZpdCBm
b3IgaW5jbHVzaW9uIGludG8gWGVuIDQuMTMgYXQKPiB0aGlzIHRpbWUuCj4gCj4gQW5kcmV3IENv
b3BlciAoMik6Cj4gICAgeGVuL25vc3BlYzogSW50cm9kdWNlIENPTkZJR19TUEVDVUxBVElWRV9B
UlJBWV9IQVJERU4KPiAgICB4ZW4vbm9zcGVjOiBJbnRyb2R1Y2UgQ09ORklHX1NQRUNVTEFUSVZF
X0JSQU5DSF9IQVJERU4gYW5kIGRpc2FibGUgaXQKPiAKPiAgIGRvY3MvbWlzYy94ZW4tY29tbWFu
ZC1saW5lLnBhbmRvYyB8ICA4ICstLS0tLS0tCj4gICB4ZW4vYXJjaC94ODYvc3BlY19jdHJsLmMg
ICAgICAgICAgfCAxNyArKy0tLS0tLS0tLS0tLS0tLQo+ICAgeGVuL2NvbW1vbi9LY29uZmlnICAg
ICAgICAgICAgICAgIHwgMzggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
PiAgIHhlbi9pbmNsdWRlL2FzbS14ODYvY3B1ZmVhdHVyZXMuaCB8ICAyICstCj4gICB4ZW4vaW5j
bHVkZS9hc20teDg2L25vc3BlYy5oICAgICAgfCAgNCArKy0tCj4gICB4ZW4vaW5jbHVkZS9hc20t
eDg2L3NwZWNfY3RybC5oICAgfCAgMSAtCj4gICB4ZW4vaW5jbHVkZS94ZW4vbm9zcGVjLmggICAg
ICAgICAgfCAxMiArKysrKysrKysrKysKPiAgIDcgZmlsZXMgY2hhbmdlZCwgNTYgaW5zZXJ0aW9u
cygrKSwgMjYgZGVsZXRpb25zKC0pCj4gCgpGb3IgdGhlIHNlcmllczoKClJlbGVhc2UtYWNrZWQt
Ynk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
