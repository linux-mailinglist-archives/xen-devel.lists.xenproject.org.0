Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 041C5365BE
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 22:43:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYciF-0002ix-Fu; Wed, 05 Jun 2019 20:40:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LYjy=UE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hYciD-0002is-N9
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 20:40:45 +0000
X-Inumbo-ID: 3084bbd1-87d2-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3084bbd1-87d2-11e9-8980-bc764e045a96;
 Wed, 05 Jun 2019 20:40:44 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 50F302067C;
 Wed,  5 Jun 2019 20:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559767243;
 bh=Zgmm3hoaflVM8o9Ei0Q6knJXwgsIkbiQz4QVAvvSTd8=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=pvtaFJTOH8rOoocjCHZaiYRj0ACydXmcb/v8Ju0qAEubqMcYZgNUrHPis3uSHiH5W
 f8FDwXvKyDnYW7rUUu2bPcbdWsBqkM6PjgMQiGH4+w0kWEEzuczeyo4cBcTdYDaa0N
 Qn1LWQMlw1jDWrtxZwqu31kkileBhcp6sOms3iGI=
Date: Wed, 5 Jun 2019 13:40:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <JBeulich@suse.com>
In-Reply-To: <5CF7BE9A0200007800235895@prv1-mh.provo.novell.com>
Message-ID: <alpine.DEB.2.21.1906051333170.14041@sstabellini-ThinkPad-T480s>
References: <E3AA6DAA6DCE974798849C41CE0968F8@citrix.com>
 <20190605111356.10429-2-ian.jackson@eu.citrix.com>
 <5CF7A5A802000078002357E8@prv1-mh.provo.novell.com>
 <aeb9f88b-f260-b125-02a0-5d22c6ff3b1c@arm.com><aeb9f88b-f260-b125-02a0-5d22c6ff3b1c@arm.com>,
 <5CF7A5A802000078002357E8@prv1-mh.provo.novell.com>
 <23799.43045.610265.697616@mariner.uk.xensource.com>
 <5CF7BE9A0200007800235895@prv1-mh.provo.novell.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [OSSTEST PATCH 2/2] RFC: enable CONFIG_LIVEPATCH in
 all relevant arm64 builds [and 1 more messages]
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCA1IEp1biAyMDE5LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+Pj4gT24gMDUuMDYuMTkg
YXQgMTM6MzEsIDxpYW4uamFja3NvbkBjaXRyaXguY29tPiB3cm90ZToKPiA+IEkgc3RpbGwgdGhp
bmsgaXQgd291bGQgYmUgYmV0dGVyIHRvIGZpeCB0aGlzIGluIHRoZSBYZW4gY29kZS4KPiAKPiBG
dWxseSBhZ3JlZS4gQnV0IGFzIEp1bGllbiBzYXlzIC0gZnVsbHkgZml4aW5nIHRoaXMgbWF5IGJl
IHRvbyBpbnRydXNpdmUKPiBmb3Igb2xkIGJyYW5jaGVzIChwcm92aWRlZCBpdCBnZXRzIGZpeGVk
IG9uIG1hc3RlciBhdCBhbGwpLgoKSW4gY2FzZSBpdCBsb29rZWQgbGlrZSBJIHdhcyBvZiBhIGRp
ZmZlcmVudCBvcGluaW9uIGxldCBtZSBleHBhbmQgb24Kd2hhdCBJIHdyb3RlIGJlZm9yZS4KCkkg
ZnVsbHkgYWdyZWUgdGhhdCB3ZSBzaG91bGQgZml4IGl0IGluIHRoZSBYZW4gY29kZSwgaW4gdGhl
IHN0YWJsZQp0cmVlcy4gRXNwZWNpYWxseSBnaXZlbiB0aGF0IHdlIGhhdmUgYSAiZml4IiB0byBi
YWNrcG9ydC4KV29yay1hcm91bmRpbmcgaXQgaW4gT1NTVGVzdCBpcyBvbmx5IGEgbGFzdCByZXNv
cnQuCgpIb3dldmVyLCB0aGVyZSBpcyBhIHNlcGFyYXRlIHBvaW50IGFib3V0IGhhdmluZyBjb25z
aXN0ZW50IGJ1aWxkIGZsYWdzCmFjcm9zcyB0aGUgT1NTVGVzdCB0ZXN0cyB0aGF0IEkgdGhpbmsg
aXQgaXMgd29ydGggY29uc2lkZXJpbmcsIHRoYXQgZ29lcwpiZXlvbmQgdGhpcyBzcGVjaWZpYyBp
c3N1ZS4gSSB3cm90ZSBhIGxvbmdlciByZXBseSBpbiBbMV0uIEluIHRoaXMKcmVnYXJkIEkgdGhp
bmsgdGhhdCBlbmFibGluZyBDT05GSUdfTElWRVBBVENIIGZvciBhbGwgb3VyIGJyYW5jaGVzLCBh
cwpKYW4gbWVudGlvbmVkLCB0aGVuIGludHJvZHVjaW5nIHNlcGFyYXRlIGZsaWdodHMgd2l0aCBh
IGRpZmZlcmVudCBzZXQgb2YKQ09ORklHXyogd291bGQgcHJvYmFibHkgYmUgYSBnb29kIHdheSBm
b3J3YXJkLgoKClsxXSBhbHBpbmUuREVCLjIuMjEuMTkwNjA0MTEzMjAzMC4xNDA0MUBzc3RhYmVs
bGluaS1UaGlua1BhZC1UNDgwcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
