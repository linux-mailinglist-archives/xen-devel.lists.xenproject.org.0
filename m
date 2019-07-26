Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E0176BBB
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 16:37:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr1Js-0004u8-Pu; Fri, 26 Jul 2019 14:35:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ymAH=VX=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hr1Jr-0004u3-Jd
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 14:35:39 +0000
X-Inumbo-ID: a282b4fe-afb2-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id a282b4fe-afb2-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 14:35:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80393152D;
 Fri, 26 Jul 2019 07:35:37 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F55B3F71F;
 Fri, 26 Jul 2019 07:35:36 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20190723213553.22300-1-julien.grall@arm.com>
 <20190723213553.22300-8-julien.grall@arm.com> <87imrphshw.fsf@epam.com>
 <b10a87d5-9fad-c051-774c-cd2d58fbc8dd@arm.com> <87d0hwj2q7.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <bb81debd-4205-d190-31e3-93d6076ce246@arm.com>
Date: Fri, 26 Jul 2019 15:35:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87d0hwj2q7.fsf@epam.com>
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

CgpPbiAyNi8wNy8yMDE5IDE1OjIxLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPiAKPiBKdWxp
ZW4gR3JhbGwgd3JpdGVzOgo+IAo+PiBIaSwKPj4KPj4gT24gMjYvMDcvMjAxOSAxMzo0NywgVm9s
b2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+Pgo+Pj4gSnVsaWVuIEdyYWxsIHdyaXRlczoKPj4+Cj4+
Pj4gVGhlIGRlZmluaXRpb24gb2YgUFJJcmVnaXN0ZXIgdmFyaWVzIGJldHdlZW4gQXJtMzIgYW5k
IEFybTY0ICgzMi1iaXQgdnMKPj4+PiA2NC1iaXQpLiBIb3dldmVyLCBzb21lIG9mIHRoZSB1c2Vy
cyB1c2VzIHRoZSB3cm9uZyBwYWRkaW5nLgo+Pj4gdHlwZTogInVzZXJzIHVzZSIKPj4+Cj4+Pj4g
Rm9yIG1vcmUgY29uc2lzdGVuY3ksIHRoZSBwYWRkaW5nIGlzIG5vdyBtb3ZlZCBpbnRvIHRoZSBQ
UklyZWdpc3RlciBhbmQKPj4+PiB2YXJpZXMgZGVwZW5kaW5nIG9uIHRoZSBhcmNoaXRlY3R1cmUu
Cj4+PiBJJ20gbm90IHN1cmUgdGhpcyBpcyB0aGUgcmlnaHQgdGhpbmcgdG8gZG8uIFRoZXJlIGFy
ZSBsb3RzIG9mIGNvZGUKPj4+IChlc3BlY2lhbGx5IGluIHZnaWMpIHRoYXQgZG9lcyBub3QgdXNl
IHBhZGRpbmcgYXQgYWxsLiBOb3cgaXQgd2lsbCBwcmludAo+Pj4gcGFkZGluZywgZXZlbiBpZiBv
cmlnaW5hbCBhdXRob3IgZG9lcyBub3Qgd2FudGVkIHRvLiBBbmQsIGhvbmVzdGx5IGl0IGlzCj4+
PiBoYXJkIHRvIHBhcnNlIDE1LTE2IHplcm9lcyBpbiBhIHJvdy4KPj4KPj4gV2VsbCwgSSBhbSB1
c3VhbGx5IHN0YXJ0aW5nIHRvIHJlYWQgZnJvbSB0aGUgcmlnaHQgdG8gbGVmdC4gU28sIGZvcgo+
PiBtZSwgMTUtMTYgemVyb2VzIGFyZSBlYXN5IHRvIGlnbm9yZSA7KS4KPiBBbmQgd2hhdCBpZiB0
aGVyZSBvbmx5IG9uZSBiaXQgc2V0IG9uIHBvc2l0aW9uIDMxIG9yIDM1PyA6KQoKVGhhdCdzIHdo
eSB5b3UgaGF2ZSB0b29scyB0byBoZWxwIHlvdSBmaWd1cmluZyBvdXQgdGhlIHBvc2l0aW9uIG9m
IGEgYml0Li4uCgo+IFBlcnNvbmFsbHksIEknZCBsaWtlIHRvIHNlZSBzdWNoIG51bWJlciBncm91
cGVkIGxpa2UgIkZFRENCQTk4IDc2NTQzMjEwIgo+IEFueXdheXMsIHRoaXMgaXMgbWF0dGVyIG9m
IHBlcnNvbmFsIHRhc3RlLiBJJ20gb2theSB3aXRoIHBhZGRpbmcuCgpQYXRjaCBhcmUgd2VsY29t
ZWQgOykuCgo+IAo+Pj4KPj4+IEkgYW0gc3VnZ2VzdGluZyB0byBhZGQgYW5vdGhlciBtYWNybyBs
aWtlIFBSSXJlZ2lzdGVyX3BhZCBvciBzb21ldGhpbmcKPj4+IGxpa2UgdGhhdC4KPj4KPj4gTm8s
IHdlIHNob3VsZCBwcmludCByZWdpc3RlciB0aGUgc2FtZSB3YXkgZXZlcnl3aGVyZS4gSSBhbSBj
bGVhcmx5IGFnYWluc3QKPj4gcHJvdmlkaW5nIHR3byBkaWZmZXJlbnQgZm9ybWF0cyBoZXJlIGZv
ciB0aGUgc2FtZSB0eXBlLiBPdGhlcndpc2UgdGhpcwo+PiB3aWxsIGxlYWQgdG8gZW5kbGVzcyBk
ZWJhdGUgb24gd2hpY2ggb25lIHlvdSB3aWxsIGNob3NlIGluIHRoZSBjb2RlLgo+IE9rYXkgdGhl
bi4gQnV0IGF0IGxlYXN0IHlvdSBzaG91bGQgbWVudGlvbiBpbiB0aGUgY29tbWl0IG1lc3NhZ2Us
IHRoYXQKPiB0aGlzIGNoYW5nZSB3aWxsIGFmZmVjdCBvdGhlciBwcmludHMsIG5vdCBvbmx5IHRo
ZSBvbmVzIGluIHRoZSBkaWZmLgoKVGhpcyB3YXMga2luZCBvZiBpbXBsaWVkIHdpdGggImNvbnNp
c3RlbmN5Ii4gQnV0IEkgYW0gbm90IGdvaW5nIHRvIGFyZ3VlIGhlcmUsIAp0aGVyZSBhcmUgbW9y
ZSBpbXBvcnRhbnQgc3R1ZmYgdG8gZm9jdXMuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
