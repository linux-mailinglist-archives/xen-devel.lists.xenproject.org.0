Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1AA84EFC
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 16:43:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvN7w-0002Lz-D0; Wed, 07 Aug 2019 14:41:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WZHT=WD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hvN7v-0002Lu-0Y
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 14:41:19 +0000
X-Inumbo-ID: 694744f4-b921-11e9-9916-7f1330c6053d
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 694744f4-b921-11e9-9916-7f1330c6053d;
 Wed, 07 Aug 2019 14:41:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 079E0344;
 Wed,  7 Aug 2019 07:41:16 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B5C63F706;
 Wed,  7 Aug 2019 07:41:14 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>, Eslam Elnikety <elnikety@amazon.com>
References: <20190807112024.19480-1-elnikety@amazon.com>
 <36fedb78-e68a-60f8-f14c-387e720c4975@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <6fb1b815-9a04-9f9f-715b-3184089cdd4e@arm.com>
Date: Wed, 7 Aug 2019 15:41:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <36fedb78-e68a-60f8-f14c-387e720c4975@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] evtchn: make support for different ABIs
 tunable
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 David Woodhouse <dwmw@amazon.co.uk>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwNy8wOC8yMDE5IDE1OjM1LCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAwNy4wOC4y
MDE5IDEzOjIwLCBFc2xhbSBFbG5pa2V0eSB3cm90ZToKICA+PiAtLS0gYS94ZW4vaW5jbHVkZS94
ZW4vc2NoZWQuaAo+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAo+PiBAQCAtMzM4LDYg
KzMzOCw3IEBAIHN0cnVjdCBkb21haW4KPj4gwqDCoMKgwqAgc3RydWN0IGV2dGNobsKgICoqZXZ0
Y2huX2dyb3VwW05SX0VWVENITl9HUk9VUFNdOyAvKiBhbGwgb3RoZXIgYnVja2V0cyAqLwo+PiDC
oMKgwqDCoCB1bnNpZ25lZCBpbnTCoMKgwqDCoCBtYXhfZXZ0Y2huczvCoMKgwqDCoCAvKiBudW1i
ZXIgc3VwcG9ydGVkIGJ5IEFCSSAqLwo+PiDCoMKgwqDCoCB1bnNpZ25lZCBpbnTCoMKgwqDCoCBt
YXhfZXZ0Y2huX3BvcnQ7IC8qIG1heCBwZXJtaXR0ZWQgcG9ydCBudW1iZXIgKi8KPj4gK8KgwqDC
oCBib29swqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRpc2FibGVfZXZ0Y2huX2ZpZm87wqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAvKiBmb3JjZSAybCBBQkkgKi8KPj4gwqDCoMKgwqAgdW5zaWduZWQg
aW50wqDCoMKgwqAgdmFsaWRfZXZ0Y2huczvCoMKgIC8qIG51bWJlciBvZiBhbGxvY2F0ZWQgZXZl
bnQgY2hhbm5lbHMgKi8KPj4gwqDCoMKgwqAgc3BpbmxvY2tfdMKgwqDCoMKgwqDCoCBldmVudF9s
b2NrOwo+PiDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgZXZ0Y2huX3BvcnRfb3BzICpldnRjaG5fcG9y
dF9vcHM7Cj4gCj4gSSBzdXBwb3NlIHlvdSBjYW4gZmluZCBhIGJldHRlciBwbGFjZSB0byBwdXQg
dGhpcyAxLWJ5dGUgZmllbGQKPiB0aGFuIGJldHdlZW4gdHdvIDMyLWJpdCBvbmVzLCBsZWF2aW5n
IGEgMy1ieXRlIGhvbGUuCgpPciBqdXN0IHJlbW92ZSB0aGUgZmllbGQgYmVjYXVzZSB0aGUgc2Ft
ZSB2YWx1ZSBpcyBhbHJlYWR5IHN0b3JlZCBpbiBkLT5vcHRpb25zLi4uCgpDaGVlcnMsCgotLSAK
SnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
