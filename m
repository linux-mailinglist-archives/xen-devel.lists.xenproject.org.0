Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F68FDF53
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 14:51:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVbyq-0007rF-3b; Fri, 15 Nov 2019 13:49:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iVbyn-0007r7-TF
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 13:49:41 +0000
X-Inumbo-ID: c57897ba-07ae-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c57897ba-07ae-11ea-9631-bc764e2007e4;
 Fri, 15 Nov 2019 13:49:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6B696AEC4;
 Fri, 15 Nov 2019 13:49:40 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20191021155718.28653-1-liuwe@microsoft.com>
 <20191021155718.28653-7-liuwe@microsoft.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5ae30e58-29a0-804d-3b08-7904c2bf2f9b@suse.com>
Date: Fri, 15 Nov 2019 14:49:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191021155718.28653-7-liuwe@microsoft.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-next v3 6/9] x86: rename
 hypervisor_{alloc, free}_unused_page
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMTAuMjAxOSAxNzo1NywgV2VpIExpdSB3cm90ZToKPiAtLS0gYS94ZW4vYXJjaC94ODYv
Z3Vlc3QveGVuL3hlbi5jCj4gKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L3hlbi94ZW4uYwo+IEBA
IC05Nyw3ICs5Nyw3IEBAIHN0YXRpYyB2b2lkIG1hcF9zaGFyZWRfaW5mbyh2b2lkKQo+ICAgICAg
dW5zaWduZWQgaW50IGk7Cj4gICAgICB1bnNpZ25lZCBsb25nIHJjOwo+ICAKPiAtICAgIGlmICgg
aHlwZXJ2aXNvcl9hbGxvY191bnVzZWRfcGFnZSgmbWZuKSApCj4gKyAgICBpZiAoIHhlbl9hbGxv
Y191bnVzZWRfcGFnZSgmbWZuKSApCgpCdXQgaXMganVzdCAieGVuXyIgYXMgYSBwcmVmaXggYSBn
b29kIG5hbWUgaW4gWGVuIGNvZGU/IFBlcmhhcHMKInhlbl9ndWVzdF8iIG9yIChzaG9ydGVyKSAi
eGdfIj8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
