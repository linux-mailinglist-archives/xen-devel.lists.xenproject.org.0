Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 013C2107B7
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 14:00:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLnq0-0006Jm-9i; Wed, 01 May 2019 11:55:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q/fo=TB=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hLnpy-0006Jh-My
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 11:55:46 +0000
X-Inumbo-ID: 0d36df85-6c08-11e9-843c-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 0d36df85-6c08-11e9-843c-bc764e045a96;
 Wed, 01 May 2019 11:55:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0B6C80D;
 Wed,  1 May 2019 04:55:44 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0BEC13F5C1;
 Wed,  1 May 2019 04:55:43 -0700 (PDT)
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
References: <20190501101521.20140-1-ian.jackson@eu.citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <3f8a16d1-5834-84fd-eb32-68058f781a80@arm.com>
Date: Wed, 1 May 2019 12:55:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190501101521.20140-1-ian.jackson@eu.citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [OSSTEST PATCH] Revert "arm64: tolerate host
 allocation failures"
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
Cc: Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwMS8wNS8yMDE5IDExOjE1LCBJYW4gSmFja3NvbiB3cm90ZToKPiBXZSBub3cgaGF2
ZSA0IHdvcmtpbmcgYXJtNjQgYm94ZXMgYW5kIHRoaXMgaXMgcXVpdGUgYW1wbGUgZm9yIG91cgo+
IGN1cnJlbnQgdGVzdCBtYXRyaXguICBXZSBoYXZlIHR3byBraW5kcyBvZiBib3gsIHRvby4gIFNv
LCBncmVhdC4KPiAKPiBUaGlzIHJldmVydHMgY29tbWl0IDA3MDViZWQ5ZTIwZWE0Mzc1ZTdhYzlm
ODEwOWVmOTU1ZWJjNmZlOWMuCj4gCj4gQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFy
bS5jb20+Cj4gQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4K
PiBTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4K
CkZXSVc6CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkNo
ZWVycywKCj4gLS0tCj4gICBhbGxvdy5hbGwgfCAyIC0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYWxsb3cuYWxsIGIvYWxsb3cuYWxsCj4gaW5k
ZXggODk0YjY5ZWEuLjdhMzRhODA5IDEwMDY0NAo+IC0tLSBhL2FsbG93LmFsbAo+ICsrKyBiL2Fs
bG93LmFsbAo+IEBAIC0zLDUgKzMsMyBAQCBidWlsZC1AQCAgICAgICAgICAgICAgICAgICAgICAg
IGxvZ3MtY2FwdHVyZUBACj4gICB0ZXN0LUBALXBjaXB0QEAKPiAgIHRlc3QtQEAtcWVtdXUtQEAJ
CWd1ZXN0LWxvY2FsbWlncmF0ZQo+ICAgdGVzdC1AQC13aW43LUBACQkJZ3Vlc3Qtc3RvcAo+IC1A
QC1hcm02NAkJCWhvc3RzLWFsbG9jYXRlCj4gLUBALWFybTY0LUBACQkJaG9zdHMtYWxsb2NhdGUK
PiAKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
