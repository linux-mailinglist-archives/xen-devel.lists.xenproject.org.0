Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FF1BD12F
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 20:06:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCpAg-0007h6-8d; Tue, 24 Sep 2019 18:04:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IFsf=XT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iCpAe-0007h1-EA
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 18:04:16 +0000
X-Inumbo-ID: b86590be-def5-11e9-9625-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id b86590be-def5-11e9-9625-12813bfff9fa;
 Tue, 24 Sep 2019 18:04:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F853142F;
 Tue, 24 Sep 2019 11:04:15 -0700 (PDT)
Received: from [10.37.10.95] (unknown [10.37.10.95])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2766B3F694;
 Tue, 24 Sep 2019 11:04:12 -0700 (PDT)
To: xen-devel@lists.xenproject.org
References: <20190924171742.25480-1-julien.grall@arm.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <3510bd45-7e09-5de3-3f94-f6cb0422dd7c@arm.com>
Date: Tue, 24 Sep 2019 19:04:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190924171742.25480-1-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RESEND][PATCH for-4.13] xen: sched: Fix Arm build
 after commit f855dd9625
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
Cc: jgross@suse.com, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKT24gOS8yNC8xOSA2OjE3IFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gQ29tbWl0
IGY4NTVkZDk2MjUgInNjaGVkOiBhZGQgbWluaW1hbGlzdGljIGlkbGUgc2NoZWR1bGVyIGZvciBm
cmVlIGNwdXMiCj4gaW50cm9kdWNlIHRoZSB1c2Ugb2YgWkVST19CTE9DS19QVFIgaW4gdGhlIHNj
aGVkdWxlciBjb2RlLiBIb3dldmVyLCB0aGUKPiBkZWZpbmUgZG9lcyBub3QgZXhpc3Qgb3V0c2lk
ZSBvZiB4bWFsbG9jX3RzZi5jIGZvciBub24teDg2IGFyY2hpdGVjdHVyZS4KPiAKPiBUaGlzIHdp
bGwgcmVzdWx0IHRvIGEgY29tcGlsYXRpb24gZXJyb3Igb24gQXJtOgo+IAo+IHNjaGVkdWxlLmM6
IEluIGZ1bmN0aW9uIOKAmHNjaGVkX2lkbGVfYWxsb2NfdmRhdGHigJk6Cj4gc2NoZWR1bGUuYzox
MDA6MTI6IGVycm9yOiDigJhaRVJPX0JMT0NLX1BUUuKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2Ug
aW4gdGhpcyBmdW5jdGlvbikKPiAgICAgICByZXR1cm4gWkVST19CTE9DS19QVFI7Cj4gICAgICAg
ICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn4KPiBzY2hlZHVsZS5jOjEwMDoxMjogbm90ZTogZWFj
aCB1bmRlY2xhcmVkIGlkZW50aWZpZXIgaXMgcmVwb3J0ZWQgb25seSBvbmNlIGZvciBlYWNoIGZ1
bmN0aW9uIGl0IGFwcGVhcnMgaW4KPiBzY2hlZHVsZS5jOjEwMToxOiBlcnJvcjogY29udHJvbCBy
ZWFjaGVzIGVuZCBvZiBub24tdm9pZCBmdW5jdGlvbiBbLVdlcnJvcj1yZXR1cm4tdHlwZV0KPiAg
IH0KPiAgIF4KPiBjYzE6IGFsbCB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycwo+IAo+
IFRvIGF2b2lkIHRoZSBjb21waWxhdGlvbiBlcnJvciwgdGhlIGRlZmF1bHQgZGVmaW5pdGlvbiBm
b3IKPiBaRVJPX0JMT0NLX1BUUiBpcyBub3cgbW92ZWQgaW4geGVuL2NvbmZpZy5oIGFsbG93aW5n
IGFsbCB0aGUgY29kZSB0byB1c2UKPiB0aGUgZGVmaW5lLgo+IAo+IEZpeGVzOiBmODU1ZGQ5NjI1
ICgnc2NoZWQ6IGFkZCBtaW5pbWFsaXN0aWMgaWRsZSBzY2hlZHVsZXIgZm9yIGZyZWUgY3B1cycp
Cj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkZZ
SSwgQW5kcmV3IGFja2VkIHRoZSBwYXRjaCBvbiBJUkMsIHNvIEkgaGF2ZSBjb21taXR0ZWQgaXQu
CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
