Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D3C728B4
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 08:57:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqBAH-0007QO-D3; Wed, 24 Jul 2019 06:54:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Fm8U=VV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hqBAG-0007QJ-Bz
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 06:54:16 +0000
X-Inumbo-ID: d8ea85c4-addf-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d8ea85c4-addf-11e9-8980-bc764e045a96;
 Wed, 24 Jul 2019 06:54:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 734B7ABF1;
 Wed, 24 Jul 2019 06:54:13 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20190723195830.4524-1-andrew.cooper3@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <bbb4cf9f-f80b-409d-7879-4912695dc8cb@suse.com>
Date: Wed, 24 Jul 2019 08:54:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190723195830.4524-1-andrew.cooper3@citrix.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH] x86/pv: Move async_exception_cleanup() into
 pv/iret.c
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
Cc: Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDcuMTkgMjE6NTgsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gQWxsIGNhbGxlcnMgYXJl
IGluIHB2L2lyZXQuYy4gIE1vdmUgdGhlIGZ1bmN0aW9uIGFuZCBtYWtlIGl0IHN0YXRpYy4KPiAK
PiBFdmVuIGJlZm9yZSB0aGUgcGlubmluZyBjbGVhbnVwLCB0aGVyZSB3YXMgbm90aGluZyB3aGlj
aCBpcyBzcGVjaWZpYyB0bwo+IG9wZXJhdGluZyBvbiBjdXJyLCBzbyByZW5hbWUgdGhlIHZhcmlh
YmxlIGJhY2sgdG8gdi4KPiAKPiBObyBmdW5jdGlvbmFsIGNoYW5nZS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQt
Ynk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
