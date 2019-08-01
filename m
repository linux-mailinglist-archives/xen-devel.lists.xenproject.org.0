Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA057E088
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 18:49:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htEEL-0007kP-PA; Thu, 01 Aug 2019 16:47:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=H9Oh=V5=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1htEEK-0007kK-5C
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 16:47:04 +0000
X-Inumbo-ID: fce64e8f-b47b-11e9-8980-bc764e045a96
Received: from mail-io1-xd41.google.com (unknown [2607:f8b0:4864:20::d41])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fce64e8f-b47b-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 16:47:03 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id j6so26008717ioa.5
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 09:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+qMnYGOQ87swrtsZegCM8YoKM3omAXpZeZx0k8xKSoo=;
 b=fGKpBkVhDG2Ebzw2M89bSLaDYikDl+2csCVt8MLR8efrcUOjMMDk6YVsTIKlzol98G
 AR0WSJxlcH0KWAVKKpaXEi5AiTjiFp1KVu7rSYsC7rTZYj/3br7wHESKM/Qnxgvlo2Ra
 qfOqQeJ5SqqqpJrUjSMRZceVFtcC+9JrkIIWBW6u2ElNYQ1qFyrpR9GYSrkiNtAYEtZF
 Vgp5LruBfl3Gq//bRXsgKArkYH/j9sWu0CM1AeuASBdUGtw+B9QzacjRw2CoWYijnplr
 jxneQx7inMYdPM6BoFYoxXdpI7OLHft3bU/yxF6bYJ3AclB0UVrmYpoX0/2u5qkiZnS7
 nh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+qMnYGOQ87swrtsZegCM8YoKM3omAXpZeZx0k8xKSoo=;
 b=PVXVWHRx0wcQFABwgAkJQVPwiVM7e3TEM9l15s+KkSlaZTvbEHQPu4aNBSk9gg/MB7
 c3+eg+oqfNjzKkKjnPEnTBB/mNV6ps0Xc68bOG6ZOtN+E7jUO3U78mQOL7ypnLGEAiVj
 Eggth9SUuhQYt9EdACRZD9NHnu7SV2MfAInCheAuaDq4NHohbz37jSvLWob2fPzYOs4C
 WFLRttkegsA+yd4TBptTn6/ZUs6npYQZEz7SgqGgVhQBCo3BgY8A4DstoDltVngd/zG6
 tqa09ejgPs+/iNYjKWQbGkdN0cbqjYSmxnY6ieSKcdNbTnEeTUA2K1PvUa9VH0BILCLb
 YPng==
X-Gm-Message-State: APjAAAWjQEHTNygwepZ2EF9NSF2jP78sy6gGdqDH4cXsiC2GcI/9oZWR
 Cr+Gwor4LeILHTVRzpiYU4ArBzZ9sDMhYLwM9mE=
X-Google-Smtp-Source: APXvYqxosiNNcUF5QUi+FQI+5tsS+g+jMEQRQzJSLPzcv1GZPdEkjyTGF+d2k5FZ82vJPVyjnAAszQEIoP+lZ6qeGHQ=
X-Received: by 2002:a6b:b756:: with SMTP id h83mr15847116iof.147.1564678022440; 
 Thu, 01 Aug 2019 09:47:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190801120452.6814-1-viktor.mitin.19@gmail.com>
 <20190801120452.6814-3-viktor.mitin.19@gmail.com> <87zhktgfml.fsf@epam.com>
 <ffa8c4f2-8b49-b32a-8f4f-8931dead0c80@arm.com>
 <43ea6ddd-5f48-865d-c25d-6d0b13845275@arm.com>
In-Reply-To: <43ea6ddd-5f48-865d-c25d-6d0b13845275@arm.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Thu, 1 Aug 2019 19:46:51 +0300
Message-ID: <CAOcoXZbdDiJWfXDxVvZ-tMw-iAZJakB7iw6vpqEdqiHMjxU0DA@mail.gmail.com>
To: Julien Grall <julien.grall@arm.com>
Subject: Re: [Xen-devel] [PATCH v5 2/2] xen/arm: consolidate make_timer_node
 and make_timer_domU_node
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Viktor Mitin <Viktor_Mitin@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMSwgMjAxOSBhdCA0OjU4IFBNIEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+IHdyb3RlOgo+Cj4KPgo+IE9uIDAxLzA4LzIwMTkgMTQ6NTcsIEp1bGllbiBHcmFs
bCB3cm90ZToKCj4gPj4+ICsgICAgdW5zaWduZWQgaW50IGlycVtNQVhfVElNRVJfUFBJXTsKPiA+
PiBBcyBJIHNhaWQgaW4gdGhlIHByZXZpb3VzIHZlcnNpb24sIHlvdSBhcmUgd2FzdGluZyBzdGFj
ayBzcGFjZQo+ID4+IHRoZXJlLiBBbHNvLCB0aGlzIGlzIG1pc2xlYWRpbmcuIFdoZW4gSSBzZWUg
YXJyYXkgb2YgNCBpdGVtcywgSSBleHBlY3QKPiA+PiB0aGF0IGFsbCA0IGl0ZW1zIHdpbGwgYmUg
dXNlZC4gQnV0IHlvdSBhcmUgdXNpbmcgb25seSAzLCBzbyBpdCBsZWFkcyB0bwo+ID4+IHR3byBj
b25jbHVzaW9uczogZWl0aGVyIHlvdSBtYWRlIGEgbWlzdGFrZSwgb3IgSSBkb24ndCB1bmRlcnN0
YW5kIHdoYXQKPiA+PiBpdCBoYXBwZW5pbmcuIEVpdGhlciBvcHRpb24gaXMgYmFkLgo+ID4KPiA+
IDQgYnl0ZSBvbiBhIHN0YWNrIG9mIDE2S0IuLi4gdGhhdCdzIG5vdCByZWFsbHkgYSB3YXN0ZSB3
b3J0aCBhbiBhcmd1bWVudC4gVGhlCj4gPiBtb3JlIHRoZSBzdGFjayBpcyBwcmV0dHkgZW1wdHkg
YXMgdGhpcyBpcyBib290LiBTbyB5ZXMsIHlvdSB3aWxsIG5vdCB1c2UgdGhlCj4gPiBsYXN0IGlu
ZGV4IGJlY2F1c2UgeW91IGRvbid0IGV4cG9zZSBoeXBlcnZpc29yIHRpbWVyIHRvIGd1ZXN0IHll
dCEgKEltYWdpbmUKPiA+IG5lc3RlZCB2aXJ0KS4gQnV0IGF0IGxlYXN0IGl0IGF2b2lkcyBoYXJk
Y29kaW5nIGEgbnVtYmVyIG9mIGluZGV4IGFuZCBtYXRjaCB0aGUKPiA+IGVudW0uCj4KPiBJIGZv
cmdvdCB0byBtZW50aW9uLiBAVmlrdG9yLCBpdCBpcyBnb29kIHRvIHRyeSB0byByZXBseSB0byBl
YWNoIGNvbW1lbnQgYXQKPiBsZWFzdCB0aG9zZSB5b3UgZG9uJ3QgcGxhbiB0byBhZGRyZXNzLiBT
byB0aGUgcmV2aWV3ZXIgZG9lc24ndCBoYXZlIHRoZSBmZWVsaW5nCj4gY29tbWVudHMgYXJlIGln
bm9yZWQuLi4KCldlbGwsIEkgYWRkcmVzcyBlYWNoIG9mIHRoZSBjb21tZW50cyBvciB3cml0ZSBh
Ym91dCBpdCBleHBsaWNpdGx5IGluCm90aGVyIGNhc2VzLgpJbiB0aGlzIHBhcnRpY3VsYXIgY2Fz
ZSwgSSdkIGFkZGVkICAnLTEnLCBidXQgbGF0ZXIgZGlkIG5vdCBtZXJnZSBpdApkdWUgdG8gbWlz
dGFrZS4KU28gaXQgc3VwcG9zZWQgdG8gYmUgdGhlIG5leHQ6CisgICAgdW5zaWduZWQgaW50IGly
cVtNQVhfVElNRVJfUFBJLTFdCgpUaGVyZSBhcmUgbm8gY29tbWVudHMgaWdub3JlZCBmcm9tIG15
IHNpZGUsIGF0IGxlYXN0IG5vdCBpbnRlbnRpb25hbGx5LgpJbiB0aGlzIGNhc2UsIHRoZXJlIHdl
cmUgbXlyaWFkcyBvZiB0aGUgc21hbGwgdGhpbmdzLCBsaWtlIGFkZCBzcGFjZQpoZXJlIG9yIHJl
bW92ZSBlbXB0eSBsaW5lIHRoZXJlLgpJIGRpZCBub3QgYWdyZWUgd2l0aCBhbGwgb2YgdGhlbSwg
aG93ZXZlciwgaW4gdGhlIG5leHQgdmVyc2lvbiAoaW4KdjUpLCBhbGwgb2YgdGhlbSBoYXZlIGJl
ZW4gYWRkcmVzc2VkLgoKVGhhbmtzCgo+IENoZWVycywKPgo+IC0tCj4gSnVsaWVuIEdyYWxsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
