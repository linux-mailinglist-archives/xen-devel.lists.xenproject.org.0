Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77646F2CF2
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 12:02:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSfWC-0008H4-Ax; Thu, 07 Nov 2019 11:00:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jh7D=Y7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iSfWA-0008Gz-H6
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 10:59:58 +0000
X-Inumbo-ID: bc05154e-014d-11ea-a1c0-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bc05154e-014d-11ea-a1c0-12813bfff9fa;
 Thu, 07 Nov 2019 10:59:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3B0EAB3C9;
 Thu,  7 Nov 2019 10:59:56 +0000 (UTC)
To: Roman Shaposhnik <roman@zededa.com>
References: <CAMmSBy-seCk9rW3GM3Aij1O+F2AtmQR1Yrxb180Wndqd3hATcw@mail.gmail.com>
 <0bc03d80-0696-8c5b-2189-24509c7ea3e6@suse.com>
 <CAMmSBy-41DseRA7MjY=Ux1r99VwFG7B2LHe-Udv+5KxURfbr2A@mail.gmail.com>
 <f23f1805-52fa-7d0f-7423-35bf644277dd@suse.com>
 <CAMmSBy8MGk01ZFF20N21ZWNMJaFhaj0VKomU48YQvvr7ah6v_w@mail.gmail.com>
 <1e875ef2-6093-d1f6-38d6-36093206d36d@suse.com>
 <CAMmSBy_+uGe1QefqUgmhU48=D8V3+g9EKMM==hV4rkAtR1Dx1w@mail.gmail.com>
 <CAMmSBy_ZXrFRHAsLUpnhpLNag+Szn_L-40wOn_r2Xpjrx+akmA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <75b272ff-d6c7-1239-5519-14ae409b322b@suse.com>
Date: Thu, 7 Nov 2019 12:00:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAMmSBy_ZXrFRHAsLUpnhpLNag+Szn_L-40wOn_r2Xpjrx+akmA@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Latest development (master) Xen fails to boot on HP
 ProLiant DL20 GEN10
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMTAuMjAxOSAwMDozOCwgUm9tYW4gU2hhcG9zaG5payB3cm90ZToKPiBCdHcsIGZvcmdv
dCB0byBhdHRhY2ggdGhlIHBhdGNoIHdpdGggbWF4Y3B1cz0yIC0tIGludGVyZXN0aW5nbHkgZW5v
dWdoCj4gWGVuIHNlZW1zIHRvIGhhbmcgbXVjaCBmdXJ0aGVyIGRvd24gdGhhbiBiZWZvcmUgKGJh
c2ljYWxseSBhZnRlcgo+IGF0dGVtcHRpbmcgdG8gYnVpbGQgb3V0IERvbTApCgpIYXZlIHlvdSBt
ZWFud2hpbGUgaGFkIGEgY2hhbmNlIHRvIHJldHJ5IHdpdGggbGF0ZXN0IG1pY3JvY29kZT8KCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
