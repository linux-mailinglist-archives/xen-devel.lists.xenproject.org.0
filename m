Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1092C12F8BB
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 14:24:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inMt4-0006Fw-Sp; Fri, 03 Jan 2020 13:21:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1inMt3-0006Fr-ID
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 13:21:09 +0000
X-Inumbo-ID: e6b85427-2e2b-11ea-a485-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e6b85427-2e2b-11ea-a485-12813bfff9fa;
 Fri, 03 Jan 2020 13:21:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5B6BFAD55;
 Fri,  3 Jan 2020 13:21:07 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200102162104.5102-1-andrew.cooper3@citrix.com>
 <CAK9nU=rN2622Jmeo8efB+ymRcbQXXqQ-NQ7vY_hXHcbr_7ryGw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c0becf4b-b798-bfe5-3338-885ad187f52e@suse.com>
Date: Fri, 3 Jan 2020 14:21:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAK9nU=rN2622Jmeo8efB+ymRcbQXXqQ-NQ7vY_hXHcbr_7ryGw@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/trampoline: Drop stale comment
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDEuMjAyMCAxNzo0MywgV2VpIExpdSB3cm90ZToKPiBPbiBUaHUsIDIgSmFuIDIwMjAg
YXQgMTY6MjEsIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3Rl
Ogo+Pgo+PiBUaGlzIG91Z2h0IHRvIGhhdmUgZGlzYXBwZWFyZWQgaW4gYy9zIDYwNjg1MDg5Y2Iw
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CgpBY2tlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
