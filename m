Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CB77673D
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 15:22:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr07r-00052U-Vu; Fri, 26 Jul 2019 13:19:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ymAH=VX=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hr07q-00052I-0g
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 13:19:10 +0000
X-Inumbo-ID: f32430d8-afa7-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id f32430d8-afa7-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 13:19:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CDF6337;
 Fri, 26 Jul 2019 06:19:08 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D15753F694;
 Fri, 26 Jul 2019 06:19:07 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20190723213553.22300-1-julien.grall@arm.com>
 <20190723213553.22300-8-julien.grall@arm.com> <87imrphshw.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <b10a87d5-9fad-c051-774c-cd2d58fbc8dd@arm.com>
Date: Fri, 26 Jul 2019 14:19:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87imrphshw.fsf@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 7/7] xen/arm: types: Specify the zero
 padding in the definition of PRIregister
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
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyNi8wNy8yMDE5IDEzOjQ3LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPiAKPiBK
dWxpZW4gR3JhbGwgd3JpdGVzOgo+IAo+PiBUaGUgZGVmaW5pdGlvbiBvZiBQUklyZWdpc3RlciB2
YXJpZXMgYmV0d2VlbiBBcm0zMiBhbmQgQXJtNjQgKDMyLWJpdCB2cwo+PiA2NC1iaXQpLiBIb3dl
dmVyLCBzb21lIG9mIHRoZSB1c2VycyB1c2VzIHRoZSB3cm9uZyBwYWRkaW5nLgo+IHR5cGU6ICJ1
c2VycyB1c2UiCj4gCj4+IEZvciBtb3JlIGNvbnNpc3RlbmN5LCB0aGUgcGFkZGluZyBpcyBub3cg
bW92ZWQgaW50byB0aGUgUFJJcmVnaXN0ZXIgYW5kCj4+IHZhcmllcyBkZXBlbmRpbmcgb24gdGhl
IGFyY2hpdGVjdHVyZS4KPiBJJ20gbm90IHN1cmUgdGhpcyBpcyB0aGUgcmlnaHQgdGhpbmcgdG8g
ZG8uIFRoZXJlIGFyZSBsb3RzIG9mIGNvZGUKPiAoZXNwZWNpYWxseSBpbiB2Z2ljKSB0aGF0IGRv
ZXMgbm90IHVzZSBwYWRkaW5nIGF0IGFsbC4gTm93IGl0IHdpbGwgcHJpbnQKPiBwYWRkaW5nLCBl
dmVuIGlmIG9yaWdpbmFsIGF1dGhvciBkb2VzIG5vdCB3YW50ZWQgdG8uIEFuZCwgaG9uZXN0bHkg
aXQgaXMKPiBoYXJkIHRvIHBhcnNlIDE1LTE2IHplcm9lcyBpbiBhIHJvdy4KCldlbGwsIEkgYW0g
dXN1YWxseSBzdGFydGluZyB0byByZWFkIGZyb20gdGhlIHJpZ2h0IHRvIGxlZnQuIFNvLCBmb3Ig
bWUsIDE1LTE2IAp6ZXJvZXMgYXJlIGVhc3kgdG8gaWdub3JlIDspLgoKPiAKPiBJIGFtIHN1Z2dl
c3RpbmcgdG8gYWRkIGFub3RoZXIgbWFjcm8gbGlrZSBQUklyZWdpc3Rlcl9wYWQgb3Igc29tZXRo
aW5nCj4gbGlrZSB0aGF0LgoKTm8sIHdlIHNob3VsZCBwcmludCByZWdpc3RlciB0aGUgc2FtZSB3
YXkgZXZlcnl3aGVyZS4gSSBhbSBjbGVhcmx5IGFnYWluc3QKcHJvdmlkaW5nIHR3byBkaWZmZXJl
bnQgZm9ybWF0cyBoZXJlIGZvciB0aGUgc2FtZSB0eXBlLiBPdGhlcndpc2UgdGhpcyB3aWxsIGxl
YWQgCnRvIGVuZGxlc3MgZGViYXRlIG9uIHdoaWNoIG9uZSB5b3Ugd2lsbCBjaG9zZSBpbiB0aGUg
Y29kZS4KCkxvb2tpbmcgYXQgdGhlIHZHSUMsIHRoZXkgYXJlIG1vc3RseSBwcmludCBmb3IgZGVi
dWcuIElmIHlvdSByZWFjaCB0aGVtIHRoZW4gCnRoZXJlIGFyZSBwcm9iYWJseSBhbHJlYWR5IHNv
bWV0aGluZyB3cm9uZyBoYXBwZW5pbmcuIFNvIEkgdGhpbmsgd2UgY2FuIGxlYXZlIAp0aGUgZXh0
cmEgemVyb2VzIHRoZXJlLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
