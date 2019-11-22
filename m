Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3B61069BF
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 11:16:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iY5wU-0005jD-DO; Fri, 22 Nov 2019 10:13:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Q7nr=ZO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iY5wT-0005j8-A2
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 10:13:33 +0000
X-Inumbo-ID: bbee84a4-0d10-11ea-a34b-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bbee84a4-0d10-11ea-a34b-12813bfff9fa;
 Fri, 22 Nov 2019 10:13:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AC6ADB1D8;
 Fri, 22 Nov 2019 10:13:30 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20191105194317.16232-3-andrew.cooper3@citrix.com>
 <20191105194909.32234-1-andrew.cooper3@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <492ecee9-9e1c-52c2-e89d-ec02f95bf3c9@suse.com>
Date: Fri, 22 Nov 2019 11:13:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191105194909.32234-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v1.5] x86/livepatch: Prevent patching with
 active waitqueues
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
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMTEuMTkgMjA6NDksIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gVGhlIHNhZmV0eSBvZiBs
aXZlcGF0Y2hpbmcgZGVwZW5kcyBvbiBldmVyeSBzdGFjayBoYXZpbmcgYmVlbiB1bndvdW5kLCBi
dXQKPiB0aGVyZSBpcyBvbmUgY29ybmVyIGNhc2Ugd2hlcmUgdGhpcyBpcyBub3QgdHJ1ZS4gIFRo
ZSBTaGFyaW5nL1BhZ2luZy9Nb25pdG9yCj4gaW5mcmFzdHJ1Y3R1cmUgbWF5IHVzZSB3YWl0cXVl
dWVzLCB3aGljaCBjb3B5IHRoZSBzdGFjayBmcmFtZSBzaWRld2F5cyBhbmQKPiBsb25nam1wKCkg
dG8gYSBkaWZmZXJlbnQgdmNwdS4KPiAKPiBUaGlzIGNhc2UgaXMgcmFyZSwgYW5kIGNhbiBiZSB3
b3JrZWQgYXJvdW5kIGJ5IHBhdXNpbmcgdGhlIG9mZmVuZGluZwo+IGRvbWFpbihzKSwgd2FpdGlu
ZyBmb3IgdGhlaXIgcmluZ3MgdG8gZHJhaW4sIHRoZW4gcGVyZm9ybWluZyBhIGxpdmVwYXRjaC4K
PiAKPiBJbiB0aGUgY2FzZSB0aGF0IHRoZXJlIGlzIGFuIGFjdGl2ZSB3YWl0cXVldWUsIGZhaWwg
dGhlIGxpdmVwYXRjaCBhdHRlbXB0IHdpdGgKPiAtRUJVU1ksIHdoaWNoIGlzIHByZWZvcmFibGUg
dG8gdGhlIGZpcmV3b3JrcyB3aGljaCBvY2N1ciBmcm9tIHRyeWluZyB0byB1bndpbmQKPiB0aGUg
b2xkIHN0YWNrIGZyYW1lIGF0IGEgbGF0ZXIgcG9pbnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJlbGVhc2UtYWNrZWQtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
