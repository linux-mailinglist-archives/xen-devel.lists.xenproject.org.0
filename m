Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF10D181809
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 13:31:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jC0Tu-00063Y-9k; Wed, 11 Mar 2020 12:29:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TdBs=44=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jC0Tt-00063T-BC
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 12:29:01 +0000
X-Inumbo-ID: e2312fc1-6393-11ea-af77-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2312fc1-6393-11ea-af77-12813bfff9fa;
 Wed, 11 Mar 2020 12:28:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 71F25AE2E;
 Wed, 11 Mar 2020 12:28:58 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200310072853.27567-1-jgross@suse.com>
 <20200310072853.27567-7-jgross@suse.com>
 <e14ea646-7edc-70e8-ec3f-4752635dc639@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <a74cc753-3af3-0781-f74c-5b3b31ac786f@suse.com>
Date: Wed, 11 Mar 2020 13:28:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <e14ea646-7edc-70e8-ec3f-4752635dc639@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 6/6] xen/rcu: add per-lock counter in
 debug builds
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDMuMjAgMTM6MTQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDEwLjAzLjIwMjAgMDg6
MjgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IEFkZCBhIGxvY2sgc3BlY2lmaWMgY291bnRlciB0
byByY3UgcmVhZCBsb2NrcyBpbiBkZWJ1ZyBidWlsZHMuIFRoaXMKPj4gYWxsb3dzIHRvIHRlc3Qg
Zm9yIG1hdGNoaW5nIGxvY2svdW5sb2NrIGNhbGxzLgo+IAo+IFNpbWlsYXIgY2hlY2tpbmcgZG9l
c24ndCBleGlzdCBmb3IgZS5nLiBzcGluIGxvY2tzIGlpcmMsIGFuZCBoZW5jZQo+IEkgdGhpbmsg
eW91IHdhbnQgdG8gc3BlbmQgdGhlIHdvcmQgb24gdGhlICJ3aHkiIGhlcmUuCgpXaXRoIHNwaW5s
b2NrIGRlYnVnZ2luZyB0dXJuZWQgb24gdGhlcmUgaXMgc3VjaCBhIGNoZWNrIGluIHJlbF9sb2Nr
KCk6ClRoZSBsb2NraW5nIGNwdSBoYXMgdG8gbWF0Y2ggYW5kIG9uIHVubG9jayB0aGUgbG9ja2lu
ZyBjcHUgaXMgc2V0IHRvClNQSU5MT0NLX05PX0NQVS4KCkkgY2FuIGFkZCBzb21ldGhpbmcgbGlr
ZToKCiJUaGlzIHdpbGwgaGVscCB0b3AgYXZvaWQgY2FzZXMgbGlrZSB0aGUgb25lIGZpeGVkIGJ5
IGNvbW1pdAogIDk4ZWQxZjQzY2MyYzg5IHdoZXJlIGRpZmZlcmVudCByY3UgcmVhZCBsb2NrcyB3
ZXJlIHJlZmVyZW5jZWQgaW4gdGhlCiAgbG9jayBhbmQgdW5sb2NrIGNhbGxzLiIKCgpKdWVyZ2Vu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
