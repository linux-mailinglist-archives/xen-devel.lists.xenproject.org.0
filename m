Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0886A13ADDC
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 16:42:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irOGw-0006Rw-UJ; Tue, 14 Jan 2020 15:38:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XZPm=3D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1irOGw-0006Rr-25
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 15:38:26 +0000
X-Inumbo-ID: e21cada2-36e3-11ea-a2eb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e21cada2-36e3-11ea-a2eb-bc764e2007e4;
 Tue, 14 Jan 2020 15:38:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 35862AB7D;
 Tue, 14 Jan 2020 15:38:16 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20200108152328.27194-1-jgross@suse.com>
 <20200108152328.27194-4-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <07d8090e-bec9-e175-7f21-395080031115@suse.com>
Date: Tue, 14 Jan 2020 16:38:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200108152328.27194-4-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 3/9] xen/sched: cleanup sched.h
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDEuMjAyMCAxNjoyMywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiAtLS0gYS94ZW4vY29t
bW9uL3NjaGVkL3ByaXZhdGUuaAo+ICsrKyBiL3hlbi9jb21tb24vc2NoZWQvcHJpdmF0ZS5oCj4g
QEAgLTUzMyw2ICs1MzMsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgc2NoZWRfdW5pdF91bnBhdXNl
KGNvbnN0IHN0cnVjdCBzY2hlZF91bml0ICp1bml0KQo+ICBzdHJ1Y3QgY3B1cG9vbAo+ICB7Cj4g
ICAgICBpbnQgICAgICAgICAgICAgIGNwdXBvb2xfaWQ7Cj4gKyNkZWZpbmUgQ1BVUE9PTElEX05P
TkUgICAgLTEKCldvdWxkIHlvdSBtaW5kIHRha2luZyB0aGUgb3Bwb3J0dW5pdHkgYW5kIGdpdmlu
ZyB0aGlzIHRoZQpwYXJlbnRoZXNlcyBpdCBoYXMgYmVlbiBsYWNraW5nPwoKSmFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
