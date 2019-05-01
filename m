Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE1610C49
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 19:42:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLtBq-0003kF-NW; Wed, 01 May 2019 17:38:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4/tq=TB=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hLtBo-0003kA-At
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 17:38:40 +0000
X-Inumbo-ID: f4153e67-6c37-11e9-843c-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f4153e67-6c37-11e9-843c-bc764e045a96;
 Wed, 01 May 2019 17:38:39 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 25CF02081C;
 Wed,  1 May 2019 17:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556732318;
 bh=MRU+xCoXaQnRN2wf0UaBdaIfQGvJywu4JazBFAJN/co=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=1KC3deE5d4cTjzy4B0jHNbykgMJaeQjp7plttk43XtmkGWxBHalLGCmK/xROnQ+5Y
 WZWmrPTbH4PfFS4hMB8EumjEY2jOZ7I/jbgROjZOUh/7FjSwMH9djHQNhUoOokH6Vi
 iUD90/GsivalXL8r8jOFZ18rzt8SOEUwoYGssUNg=
Date: Wed, 1 May 2019 10:38:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Ian Jackson <ian.jackson@eu.citrix.com>
In-Reply-To: <20190501101521.20140-1-ian.jackson@eu.citrix.com>
Message-ID: <alpine.DEB.2.10.1905011038220.23881@sstabellini-ThinkPad-X260>
References: <20190501101521.20140-1-ian.jackson@eu.citrix.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAxIE1heSAyMDE5LCBJYW4gSmFja3NvbiB3cm90ZToKPiBXZSBub3cgaGF2ZSA0IHdv
cmtpbmcgYXJtNjQgYm94ZXMgYW5kIHRoaXMgaXMgcXVpdGUgYW1wbGUgZm9yIG91cgo+IGN1cnJl
bnQgdGVzdCBtYXRyaXguICBXZSBoYXZlIHR3byBraW5kcyBvZiBib3gsIHRvby4gIFNvLCBncmVh
dC4KPiAKPiBUaGlzIHJldmVydHMgY29tbWl0IDA3MDViZWQ5ZTIwZWE0Mzc1ZTdhYzlmODEwOWVm
OTU1ZWJjNmZlOWMuCgpBd2Vzb21lIQoKCj4gQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+Cj4gQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz4KPiBTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNv
bT4KPiAtLS0KPiAgYWxsb3cuYWxsIHwgMiAtLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYWxsb3cuYWxsIGIvYWxsb3cuYWxsCj4gaW5kZXggODk0
YjY5ZWEuLjdhMzRhODA5IDEwMDY0NAo+IC0tLSBhL2FsbG93LmFsbAo+ICsrKyBiL2FsbG93LmFs
bAo+IEBAIC0zLDUgKzMsMyBAQCBidWlsZC1AQCAgICAgICAgICAgICAgICAgICAgICAgIGxvZ3Mt
Y2FwdHVyZUBACj4gIHRlc3QtQEAtcGNpcHRAQAo+ICB0ZXN0LUBALXFlbXV1LUBACQlndWVzdC1s
b2NhbG1pZ3JhdGUKPiAgdGVzdC1AQC13aW43LUBACQkJZ3Vlc3Qtc3RvcAo+IC1AQC1hcm02NAkJ
CWhvc3RzLWFsbG9jYXRlCj4gLUBALWFybTY0LUBACQkJaG9zdHMtYWxsb2NhdGUKPiAtLSAKPiAy
LjExLjAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
