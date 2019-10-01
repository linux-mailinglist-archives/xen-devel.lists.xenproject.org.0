Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E44C2ED4
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 10:29:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFDTO-0007Ey-4k; Tue, 01 Oct 2019 08:25:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=itvi=X2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iFDTN-0007Et-08
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 08:25:29 +0000
X-Inumbo-ID: 0505994e-e425-11e9-96f4-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 0505994e-e425-11e9-96f4-12813bfff9fa;
 Tue, 01 Oct 2019 08:25:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A4B82AC4A;
 Tue,  1 Oct 2019 08:25:25 +0000 (UTC)
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
Message-ID: <727fc987-e6a0-dda4-1b73-ef864d2e01e3@suse.com>
Date: Tue, 1 Oct 2019 10:25:27 +0200
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
c2ljYWxseSBhZnRlcgo+IGF0dGVtcHRpbmcgdG8gYnVpbGQgb3V0IERvbTApCgpBbGwgMyBsb2dz
IGNvbnRhaW4KCihYRU4pIFRTQ19ERUFETElORSBkaXNhYmxlZCBkdWUgdG8gRXJyYXRhOyBwbGVh
c2UgdXBkYXRlIG1pY3JvY29kZSB0byB2ZXJzaW9uIDB4NTIgKG9yIGxhdGVyKQoKUGxlYXNlIGxv
YWQgdXAtdG8tZGF0ZSBtaWNyb2NvZGUgb24gdGhlIHN5c3RlbSBhbmQsIHByZWZlcmFibHkgd2l0
aApBbmRyZXcncyBzdWdnZXN0aW9ucyBhbHNvIGFwcGxpZWQsIHJlLXBvc3QgdGhlIGxvZ3MuIEkg
bm90aWNlIHRoYXQKZXZlbiBsb2dzIDEgYW5kIDIgaGF2ZSAiQnJvdWdodCB1cCA0IENQVXMiLCBv
dGhlciB0aGFuIHlvdSd2ZQppbmRpY2F0ZWQgaW4geW91ciBpbml0aWFsIHJlcG9ydC4gVGhpcyBz
dWdnZXN0cyBzb21ldGhpbmcncyBicm9rZW4KX2FmdGVyXyBicmluZ3VwIG9mIHNlY29uZGFyeSBD
UFVzLCBub3Qgd2hpbGUgYnJpbmdpbmcgdGhlbSB1cC4gTG9nCjMgZWZmZWN0aXZlbHkgc2VlbXMg
dG8gY29uZmlybSB0aGlzLgoKU2VlaW5nIHRoYXQgIm1heF9jc3RhdGU9MSIgZGlkIGhlbHAsIGFz
IGFub3RoZXIgbmV4dCBzdGVwIGNvdWxkIHlvdQp0cnkgd2hldGhlciAibXdhaXQtaWRsZT0wIiBt
YWtlcyBlbm91Z2ggb2YgYSBkaWZmZXJlbmNlIChpdCdsbApsaWtlbHkgbWFrZSBhIGRpZmZlcmVu
Y2UgaW5pdGlhbGx5LCBhcyBpdCBtYWtlcyB0aGUgc3lzdGVtCmVmZmVjdGl2ZWx5IHN0YXkgaW4g
YSAibWF4X2NzdGF0ZT0xIi1saWtlIG1vZGUgdW50aWwgRG9tMCBoYXMgYm9vdGVkCnVwIGZhciBl
bm91Z2g7IHRoZSBxdWVzdGlvbiB0aGlzIGlzIGdvaW5nIHRvIGJlIHdoZXRoZXIgYSBoYW5nIHN0
aWxsCm9jY3VycyBvbmUgRG9tMCBoYXMgdXBsb2FkZWQgQy1zdGF0ZSBkYXRhKT8KCkphbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
