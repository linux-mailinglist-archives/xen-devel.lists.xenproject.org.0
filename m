Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B91B5AF3
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 07:35:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iASZ4-0002gq-AJ; Wed, 18 Sep 2019 05:31:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t/Gy=XN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iASZ3-0002ge-2x
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 05:31:41 +0000
X-Inumbo-ID: 958fd4fc-d9d5-11e9-9624-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 958fd4fc-d9d5-11e9-9624-12813bfff9fa;
 Wed, 18 Sep 2019 05:31:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8EA21AF23;
 Wed, 18 Sep 2019 05:31:36 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a44a8443-387d-fcb9-01b1-c8219f0e1e12@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <367834d3-80c9-6d13-9824-a5a882474b1b@suse.com>
Date: Wed, 18 Sep 2019 07:31:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a44a8443-387d-fcb9-01b1-c8219f0e1e12@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 0/2] x86emul: vendor specific treatment
 adjustments
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDkuMTkgMTE6NDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEkndmUgbm90aWNlZCB0aGUg
aXNzdWUgdGhlIDFzdCBwYXRjaCBtZWFucyB0byBhZGRyZXNzIG9ubHkgd2hpbGUKPiBwdXR0aW5n
IHRvZ2V0aGVyIHRoZSAybmQuIENvbnNpZGVyaW5nIHRoZSBvdGhlciBIeWdvbiBlbmFibGVtZW50
Cj4gaW4gdGhpcyByZWxlYXNlIGN5Y2xlIEkgdGhpbmsgd2Ugd2FudCBwYXRjaCAxIGZvciA0LjEz
LiBQYXRjaCAyCj4gc2hvdWxkIGJlIGNvbnNpZGVyZWQgdG9vLCBidXQgd2UndmUgYmVlbiBlZmZl
Y3RpdmVseSBtaXMtZW11bGF0aW5nCj4gTU9WU1hEIG9uIG1vZGVybiBJbnRlbCBoYXJkd2FyZSBm
b3IgcXVpdGUgc29tZSB0aW1lLCBzbyBpdCBnZXR0aW5nCj4gZGVsYXllZCB1bnRpbCBhZnRlciA0
LjEzIChhbmQgdGhlbiBwb3NzaWJsZSBiZSBiYWNrcG9ydGVkKSB3b3VsZG4ndAo+IGJlIG92ZXJs
eSBiYWQuCj4gCj4gMTogdHJlYXQgSHlnb24gZ3Vlc3RzIGxpa2UgQU1EIG9uZXMKPiAyOiBhZGp1
c3QgTU9WU1hEIHNvdXJjZSBvcGVyYW5kIGhhbmRsaW5nCgpGb3IgdGhlIHNlcmllczoKClJlbGVh
c2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
