Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6679F444
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 12:34:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLQ3N-0003aj-Fq; Tue, 30 Apr 2019 10:32:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=s5V/=TA=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hLQ3L-0003ae-MG
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 10:31:59 +0000
X-Inumbo-ID: 2e89640a-6b33-11e9-95f0-9709415d3400
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 2e89640a-6b33-11e9-95f0-9709415d3400;
 Tue, 30 Apr 2019 10:31:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A489615A2;
 Tue, 30 Apr 2019 03:31:57 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE0BE3F5C1;
 Tue, 30 Apr 2019 03:31:56 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>, Juergen Gross <jgross@suse.com>
References: <3ce4998b-a8a8-37bd-bb26-9550571709b6@suse.com>
 <5CC82306020000780022A4E3@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <ae94fdca-bd2a-2086-450e-c485ca4e59f0@arm.com>
Date: Tue, 30 Apr 2019 11:31:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CC82306020000780022A4E3@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] vcpu_block() and do_poll() question
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAzMC8wNC8yMDE5IDExOjI3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAzMC4wNC4x
OSBhdCAxMToxMywgPGpncm9zc0BzdXNlLmNvbT4gd3JvdGU6Cj4+IEluIHhlbi9jb21tb24vc2No
ZWR1bGUuYyB0aGVyZSBpcyBhIHdlaXJkICIjaWZuZGVmIENPTkZJR19YODYiIGluCj4+IGRvX3Bv
bGwoKS4KPj4KPj4gSXQgd2FzIGludHJvZHVjZWQgd2F5IGJlZm9yZSBhbnlvbmUgd291bGQgdGhp
bmsgYWJvdXQgQVJNIGJ5IGNvbW1pdAo+PiBlZjRjNmIwNzljYzU1ZSAoSSBjb3VsZG4ndCBmaW5k
IGFueSB4ZW4tZGV2ZWwgbWFpbCByZWxhdGVkIHRvIHRoYXQKPj4gY29tbWl0KSwgc28gSSBndWVz
cyBpdCBpcyByZWxhdGVkIHRvIElBNjQ/Cj4gCj4gUXVpdGUgY2VydGFpbmx5LCB5ZXMgKG9yIFBQ
QyBhcyBhbiBhbHRlcm5hdGl2ZSwgYnV0IEkga25vdyBub3RoaW5nCj4gYWJvdXQgdGhlaXIgbWVt
b3J5IG9yZGVyaW5nIG1vZGVsKS4KPiAKPj4gUXVlc3Rpb24gaXM6IGNhbiB3ZSBqdXN0IGRyb3Ag
aXQsIG9yIGRvZXMgQVJNIGRlcGVuZCBvbiBpdD8gQW5kIGlmIEFSTQo+PiByZWFsbHkgbmVlZHMg
aXQsIGlzIGl0IHRoZSBtZW1vcnkgYmFycmllciBvbmx5PyBBbmQgd2h5IHdvdWxkbid0IGEKPj4g
c2ltaWxhciBiYXJyaWVyIGJlIG5lZWRlZCBpbiB2Y3B1X2Jsb2NrKCkgdGhlbj8KPiAKPiBJdCdz
IG5vdCB0aGUgbWVtb3J5IGJhcnJpZXIsIGJ1dCB0aGUgc3Vic2VxdWVudCBjaGVja3MuIFRoZSBi
YXJyaWVyCj4gaXMgdGhlcmUgb25seSB0byBtYWtlIHN1cmUgdGhlIGNoZWNrcyBkb24ndCBoYXBw
ZW4gYmVmb3JlIHRoZQo+IGVhcmxpZXIgd3JpdGVzLiBBbmQgYXMgdGhlIGNvbW1lbnQgc2F5cyAt
IGl0J3MgdGhlIGNvbWJpbmF0aW9uIG9mCj4gdGhlIDMgd3JpdGVzIHRoYXQgbWF5IGdldCBtaXMt
b3JkZXJlZCBhbmQgaGVuY2UgbWlzLWludGVycHJldGVkIGJ5Cj4gb3RoZXIgKHJlYWRpbmcpIHBh
cnRpZXMuIHZjcHVfYmxvY2soKSwgb3RvaCwgc2V0cyB0aGUgVlBGX2Jsb2NrZWQKPiBiaXQgb25s
eSwgc28gdGhlcmUncyBubyBwb3RlbnRpYWwgb3JkZXJpbmcgaXNzdWUgdGhlcmUuCgpBcmUgeW91
IHN1Z2dlc3RpbmcgdGhlIGNvbW1lbnQgaW4gdmNwdV9ibG9jayBpcyBub3QgY29ycmVjdD8KCkNo
ZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
