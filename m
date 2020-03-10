Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F7D180161
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 16:16:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBgYl-0006nO-1v; Tue, 10 Mar 2020 15:12:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EhAh=43=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBgYj-0006nJ-Nw
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 15:12:41 +0000
X-Inumbo-ID: 95ac8292-62e1-11ea-adc5-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 95ac8292-62e1-11ea-adc5-12813bfff9fa;
 Tue, 10 Mar 2020 15:12:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2ADE7B2AE;
 Tue, 10 Mar 2020 15:12:40 +0000 (UTC)
To: paul@xen.org
References: <20200309102304.1251-1-paul@xen.org>
 <20200309102304.1251-4-paul@xen.org>
 <ae9cc4a6-0378-571c-9d46-0561e536884f@suse.com>
 <001301d5f6e0$61aa5e00$24ff1a00$@xen.org>
 <bbb910df-2f61-2a67-b360-82b5988810d7@suse.com>
 <002d01d5f6ed$4b0b2000$e1216000$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1b2299fa-c19c-19fc-820a-783642ea85d5@suse.com>
Date: Tue, 10 Mar 2020 16:12:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <002d01d5f6ed$4b0b2000$e1216000$@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 3/6] x86 / pv: do not treat PGC_extra
 pages as RAM
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
Cc: xen-devel@lists.xenproject.org, 'Paul Durrant' <pdurrant@amazon.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 'Wei Liu' <wl@xen.org>, 'Andrew Cooper' <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDMuMjAyMCAxNjowNSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+
IFNlbnQ6IDEwIE1hcmNoIDIwMjAgMTQ6NTkKPj4KPj4gSW4gcmVwbHkgdG8gcGF0Y2ggNiBJIGRp
ZCBzdWdnZXN0IHRvCj4+IGhhdmUgYSBzZXBhcmF0ZSBsaXN0LCBidXQgd2l0aG91dCB0YWtpbmcg
dGhlc2UgcGFnZXMgb2ZmCj4+IGQtPnBhZ2VfbGlzdCwKPiAKPiBIb3cgd291bGQgdGhhdCB3b3Jr
IHdpdGhvdXQgYWRkaW5nIGFuIGV4dHJhIHBhZ2VfbGlzdF9lbnRyeSBpbnRvIHN0cnVjdCBwYWdl
X2luZm8/CgpBcyBzYWlkIHRoZXJlLCBpdCdkIGJlIGEgc2luZ2x5IGxpbmtlZCBsaXN0IHVzaW5n
IGEgX19wZHhfdApmaWVsZCBqdXN0IGxpa2UgdGhlcmUgYWxyZWFkeSBpcyB3aXRoICJuZXh0X3No
YWRvdyIsIGkuZS4KeW91J2QgYWRkIGFub3RoZXIgdW5pb24gbWVtYmVyICJuZXh0X2V4dHJhIiBv
ciBzb21lIHN1Y2guIE9mCmNvdXJzZSB0aGUgbGlzdCBzaG91bGRuJ3QgZ3JvdyB0b28gbG9uZywg
b3IgZWxzZSBpbnNlcnRpb24KYW5kIHJlbW92YWwgbWF5IGJlY29tZSBhIGJvdHRsZW5lY2suIE5v
dCBzdXJlIGhvdyB3ZWxsIHRoaXMKd291bGQgZml0IEFybSwgdGhvdWdoOyBtYXliZSB0aGV5IHdv
dWxkbid0IG5lZWQgdGhpcywgYnV0CnRoYXQgZGVwZW5kcyBvbiB3aGV0aGVyIHRoZSBsaXN0IHdv
dWxkIGJlIHVzZWQgZm9yIHB1cnBvc2VzCmJleW9uZCBkdW1waW5nLgoKSmFuCgo+PiBzdWNoIHRo
YXQgaGVyZSB5b3Ugd291bGQgc2tpcCB0aGVtIGluIHRoZSBtYWluCj4+IGRvbWFpbiBwYWdlIGR1
bXBpbmcgbG9vcCwgYnV0IHlvdSB3b3VsZCB0aGVuIHRyYXZlcnNlIHRoYXQgc2Vjb25kCj4+IGxp
c3QgYW5kIGR1bXAgYWxsIG9mIGl0cyBlbGVtZW50cywganVzdCBsaWtlIHhlbnBhZ2VfbGlzdCBn
ZXRzCj4+IGhhbmRsZWQgdGhlcmUuCj4+Cj4gCj4gV2VsbCwgdGhhdCdzIHdoYXQgSSdtIHRyeWlu
ZyB0byBhY2hpZXZlLCB5ZXMuCj4gCj4gICBQYXVsCj4gCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
