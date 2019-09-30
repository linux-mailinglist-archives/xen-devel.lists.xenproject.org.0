Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D056C1EC3
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:17:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEsh7-0004lT-P8; Mon, 30 Sep 2019 10:14:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H1QO=XZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iEsh6-0004lO-5u
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:14:16 +0000
X-Inumbo-ID: 0e20619a-e36b-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 0e20619a-e36b-11e9-bf31-bc764e2007e4;
 Mon, 30 Sep 2019 10:14:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 98491AF19;
 Mon, 30 Sep 2019 10:14:14 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: Roman Shaposhnik <roman@zededa.com>
References: <CAMmSBy-seCk9rW3GM3Aij1O+F2AtmQR1Yrxb180Wndqd3hATcw@mail.gmail.com>
 <0bc03d80-0696-8c5b-2189-24509c7ea3e6@suse.com>
 <CAMmSBy-41DseRA7MjY=Ux1r99VwFG7B2LHe-Udv+5KxURfbr2A@mail.gmail.com>
 <f23f1805-52fa-7d0f-7423-35bf644277dd@suse.com>
 <CAMmSBy8MGk01ZFF20N21ZWNMJaFhaj0VKomU48YQvvr7ah6v_w@mail.gmail.com>
 <1e875ef2-6093-d1f6-38d6-36093206d36d@suse.com>
Message-ID: <6bb7cd12-ca6c-67c1-44d5-870ab6c9e02f@suse.com>
Date: Mon, 30 Sep 2019 12:14:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1e875ef2-6093-d1f6-38d6-36093206d36d@suse.com>
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

T24gMzAuMDkuMjAxOSAxMTo1NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjguMDkuMjAxOSAw
NTowNywgUm9tYW4gU2hhcG9zaG5payB3cm90ZToKPj4gQ2FuIHlvdSBwbGVhc2UgZWxhYm9yYXRl
IG9uICJ3ZSdkIHRoZW4gaGF2ZSB0byBmaXJzdCBvZiBhbGwgZ28gdGhyb3VnaAo+PiBlcnJhdGEg
Zm9yIHRoZSBwYXJ0IHlvdXIgc3lzdGVtIGlzIHVzaW5nIgo+IAo+IFdlbGwsIGl0IHdvdWxkbid0
IGJlIHRoZSBmaXJzdCB0aW1lIHRoYXQgaGFyZHdhcmUgaGFkIGlzc3VlcyB3aXRoIEMKPiBzdGF0
ZSBoYW5kbGluZy4gVGhlcmVmb3JlIHdlJ2QgbmVlZCB0byAoYSkgYmUgc3VyZSB5b3UgdXNlIHVw
LXRvLWRhdGUKPiBtaWNyb2NvZGUgYW5kIChiKSB0aGVyZSBhcmUgbm8gZXJyYXRhIGRvY3VtZW50
ZWQgZm9yIHlvdXIgQ1BVIG1vZGVsCj4gd29ya2Fyb3VuZHMgZm9yIHdoaWNoIGJhc2ljYWxseSBz
dWdnZXN0IHRvIGF2b2lkIHVzZSBvZiBkZWVwIEMgc3RhdGVzLgoKQW5kIEkndmUganVzdCBkb25l
IChiKSB3aXRob3V0IGZpbmRpbmcgYW55dGhpbmcgdGhhdCB3b3VsZCBzdWdnZXN0IGEKY29ubmVj
dGlvbiB0byB0aGUgaXNzdWUgeW91IG9ic2VydmUuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
