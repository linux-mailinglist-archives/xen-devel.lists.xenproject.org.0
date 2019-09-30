Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E27D1C1B48
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 08:08:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEooZ-0007I4-Hs; Mon, 30 Sep 2019 06:05:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hbFO=XZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iEooY-0007Hy-8z
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 06:05:42 +0000
X-Inumbo-ID: 53ebb490-e348-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 53ebb490-e348-11e9-bf31-bc764e2007e4;
 Mon, 30 Sep 2019 06:05:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 67F08ACAA;
 Mon, 30 Sep 2019 06:05:39 +0000 (UTC)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190929155627.23493-1-julien.grall@arm.com>
 <20190929155627.23493-2-julien.grall@arm.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <e5cabc32-769e-cda2-ad9d-1561195953bf@suse.com>
Date: Mon, 30 Sep 2019 08:05:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190929155627.23493-2-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 1/2] xen/arm: domain_build: Avoid
 implicit conversion from ULL to UL
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDkuMTkgMTc6NTYsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBDbGFuZyA4LjAgd2lsbCBm
YWlsIHRvIGJ1aWxkIGRvbWFpbl9idWlsZC5jIG9uIEFybTMyIGJlY2F1c2Ugb2YgdGhlCj4gZm9s
bG93aW5nIGVycm9yOgo+IAo+IGRvbWFpbl9idWlsZC5jOjQ0ODoyMTogZXJyb3I6IGltcGxpY2l0
IGNvbnZlcnNpb24gZnJvbSAndW5zaWduZWQgbG9uZyBsb25nJyB0byAndW5zaWduZWQgbG9uZycg
Y2hhbmdlcyB2YWx1ZSBmcm9tIDEwOTA5MjE2OTMxODQgdG8gMAo+IFstV2Vycm9yLC1XY29uc3Rh
bnQtY29udmVyc2lvbl0KPiAgICAgIGJhbmtfc2l6ZSA9IE1JTihHVUVTVF9SQU0xX1NJWkUsIGtp
bmZvLT51bmFzc2lnbmVkX21lbSk7Cj4gCj4gQXJtMzIgaXMgYWJsZSB0byBzdXBwb3J0IG1vcmUg
dGhhbiA0R0Igb2YgcGh5c2ljYWwgbWVtb3J5LCBzbyBpdCB3b3VsZAo+IGJlIHRoZW9yaWNhbGx5
IHBvc3NpYmxlIHRvIGNyZWF0ZSBkb21pYW4gd2l0aCBtb3JlIHRoZSA0R0Igb2YgUkFNLgo+IFRo
ZXJlZm9yZSwgdGhlIHNpemUgb2YgYSBiYW5rIG1heSBub3QgZml0IGluIDMyLWJpdC4KPiAKPiBU
aGlzIGNhbiBiZSByZXNvbHZlZCBieSBzd2l0Y2ggdGhlIHZhcmlhYmxlIGJhbmtfc2l6ZSBhbmQg
dGhlIHBhcmFtZXRlcgo+IHRvdF9zaXplIHRvICJwYWRkcl90Ii4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKUmVsZWFzZS1hY2tlZC1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
