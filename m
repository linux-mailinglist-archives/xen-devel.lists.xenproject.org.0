Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC9EC4A2F
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 11:04:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFaX1-0004s4-HB; Wed, 02 Oct 2019 09:02:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2BXq=X3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFaX0-0004rw-4v
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 09:02:46 +0000
X-Inumbo-ID: 661d5004-e4f3-11e9-bf31-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 661d5004-e4f3-11e9-bf31-bc764e2007e4;
 Wed, 02 Oct 2019 09:02:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 111EF1000;
 Wed,  2 Oct 2019 02:02:45 -0700 (PDT)
Received: from [10.37.10.48] (unknown [10.37.10.48])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EEADB3F706;
 Wed,  2 Oct 2019 02:02:42 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>
References: <1569507722-16981-1-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.1910011108040.20899@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <1cdb3e94-4a98-a0f9-4681-24af37e82f01@arm.com>
Date: Wed, 2 Oct 2019 10:02:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1910011108040.20899@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] SUPPORT.md: Describe Renesas IPMMU-VMSA
 support (Arm)
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
Cc: Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 volodymyr_babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxMC8xLzE5IDc6MDggUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBPbiBU
aHUsIDI2IFNlcCAyMDE5LCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3cm90ZToKPj4gRnJvbTogT2xl
a3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgo+Pgo+PiBS
ZW5lc2FzIElQTU1VLVZNU0Egc3VwcG9ydCAoQXJtKSBjYW4gYmUgY29uc2lkZXJlZAo+PiBhcyBU
ZWNobm9sb2dpY2FsIFByZXZpZXcgZmVhdHVyZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogT2xla3Nh
bmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgo+IAo+IEFja2Vk
LWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgpJIGhhdmUg
Y29tbWl0dGVkIHRoZSBwYXRjaC4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
