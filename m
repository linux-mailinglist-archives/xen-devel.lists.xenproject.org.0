Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0559A5A05
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 17:02:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4nns-0007f2-0W; Mon, 02 Sep 2019 14:59:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kzGk=W5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i4nnq-0007ew-BQ
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 14:59:34 +0000
X-Inumbo-ID: 45e62ce8-cd92-11e9-8980-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 45e62ce8-cd92-11e9-8980-bc764e2007e4;
 Mon, 02 Sep 2019 14:59:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F423EB694;
 Mon,  2 Sep 2019 14:59:32 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20190703105639.23081-1-aisaila@bitdefender.com>
 <7a4c824d-3ccd-b289-3e8e-ff94ea916b3e@suse.com>
 <0d1ab92f-171b-98d9-a69e-5aa7cfbe0d85@bitdefender.com>
 <e61a882e-d2ea-a03d-fde8-2c2befd865da@suse.com>
 <23cebb01-38fc-ba49-5a71-e6129152e488@bitdefender.com>
 <1bdaee7b-a01f-7be8-426f-fe6c678c2859@bitdefender.com>
 <60651ad5-f0bd-caad-77f6-5f8fb71a8319@suse.com>
 <c7060d91-851a-ba04-56c3-90f1aed65913@bitdefender.com>
 <b7c16027-2f50-4011-3866-0b4904596249@suse.com>
 <7d8888b6-ae1b-d059-938e-14fb72e6f9bc@citrix.com>
 <958de8dd-0d66-aa4d-d815-fff01ffc2abf@suse.com>
 <08dc2694-f10b-ad08-12c2-2b04d58897ad@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <888b5b7b-6615-1c28-744d-2637a7a5055d@suse.com>
Date: Mon, 2 Sep 2019 16:59:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <08dc2694-f10b-ad08-12c2-2b04d58897ad@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7] x86/emulate: Send vm_event from emulate
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>, "wl@xen.org" <wl@xen.org>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDkuMjAxOSAxNjozNiwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gSXMg
dGhlcmUgYSB3YXkgd2UgY2FuIGdvIG9uIHdpdGggdGhpcyBpc3N1ZT8KCkFzIGxvbmcgYXMgQW5k
cmV3IHdvdWxkbid0IGNoYW5nZSBoaXMgbWluZCwgYWxsIEkgY2FuIHN1Z2dlc3QgaXMKdGhhdCB5
b3UgYXZvaWQgbWFraW5nIHlvdXIgY2hhbmdlIGRlcGVuZGVudCB1cG9uIG1pbmUuIElmIEkgKGFn
YWluKQplbmQgdXAgcmV2aWV3aW5nIGl0LCBJJ2xsIGhhdmUgdG8ga2VlcCBpbiBtaW5kIHRvIGp1
ZGdlIG9uIGl0IHVzaW5nCnBsYWluIG1hc3Rlciwgbm90IG15IG93biB0cmVlLgoKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
