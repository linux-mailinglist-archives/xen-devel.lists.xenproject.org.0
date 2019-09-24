Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 059B7BD080
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 19:21:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCoSD-0002lM-RF; Tue, 24 Sep 2019 17:18:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IFsf=XT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iCoSD-0002l8-6i
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 17:18:21 +0000
X-Inumbo-ID: 4e2fb356-deef-11e9-9625-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 4e2fb356-deef-11e9-9625-12813bfff9fa;
 Tue, 24 Sep 2019 17:18:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C042142F;
 Tue, 24 Sep 2019 10:18:20 -0700 (PDT)
Received: from [10.37.10.95] (unknown [10.37.10.95])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 69F4F3F694;
 Tue, 24 Sep 2019 10:18:19 -0700 (PDT)
To: xen-devel@lists.xenproject.org
References: <20190924171702.25422-1-julien.grall@arm.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <73b6fe2a-9931-a761-ecb1-1aa0f0ec7957@arm.com>
Date: Tue, 24 Sep 2019 18:18:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190924171702.25422-1-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] xen: sched: Fix Arm build after
 commit f855dd9625
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
Cc: jgross@suse.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpJIGZvcmdvdCB0byBDQyB0aGUgbWFpbnRhaW5lcnMgb24gaXQgOi8uIFBsZWFzZSBpZ25v
cmUgdGhpcyBlLW1haWwuCgpTb3JyeSBmb3IgdGhlIG5vaXNlLgoKQ2hlZXJzLAoKT24gOS8yNC8x
OSA2OjE3IFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gQ29tbWl0IGY4NTVkZDk2MjUgInNjaGVk
OiBhZGQgbWluaW1hbGlzdGljIGlkbGUgc2NoZWR1bGVyIGZvciBmcmVlIGNwdXMiCj4gaW50cm9k
dWNlIHRoZSB1c2Ugb2YgWkVST19CTE9DS19QVFIgaW4gdGhlIHNjaGVkdWxlciBjb2RlLiBIb3dl
dmVyLCB0aGUKPiBkZWZpbmUgZG9lcyBub3QgZXhpc3Qgb3V0c2lkZSBvZiB4bWFsbG9jX3RzZi5j
IGZvciBub24teDg2IGFyY2hpdGVjdHVyZS4KPiAKPiBUaGlzIHdpbGwgcmVzdWx0IHRvIGEgY29t
cGlsYXRpb24gZXJyb3Igb24gQXJtOgo+IAo+IHNjaGVkdWxlLmM6IEluIGZ1bmN0aW9uIOKAmHNj
aGVkX2lkbGVfYWxsb2NfdmRhdGHigJk6Cj4gc2NoZWR1bGUuYzoxMDA6MTI6IGVycm9yOiDigJha
RVJPX0JMT0NLX1BUUuKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbikK
PiAgICAgICByZXR1cm4gWkVST19CTE9DS19QVFI7Cj4gICAgICAgICAgICAgICAgICAgXn5+fn5+
fn5+fn5+fn4KPiBzY2hlZHVsZS5jOjEwMDoxMjogbm90ZTogZWFjaCB1bmRlY2xhcmVkIGlkZW50
aWZpZXIgaXMgcmVwb3J0ZWQgb25seSBvbmNlIGZvciBlYWNoIGZ1bmN0aW9uIGl0IGFwcGVhcnMg
aW4KPiBzY2hlZHVsZS5jOjEwMToxOiBlcnJvcjogY29udHJvbCByZWFjaGVzIGVuZCBvZiBub24t
dm9pZCBmdW5jdGlvbiBbLVdlcnJvcj1yZXR1cm4tdHlwZV0KPiAgIH0KPiAgIF4KPiBjYzE6IGFs
bCB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycwo+IAo+IFRvIGF2b2lkIHRoZSBjb21w
aWxhdGlvbiBlcnJvciwgdGhlIGRlZmF1bHQgZGVmaW5pdGlvbiBmb3IKPiBaRVJPX0JMT0NLX1BU
UiBpcyBub3cgbW92ZWQgaW4geGVuL2NvbmZpZy5oIGFsbG93aW5nIGFsbCB0aGUgY29kZSB0byB1
c2UKPiB0aGUgZGVmaW5lLgo+IAo+IEZpeGVzOiBmODU1ZGQ5NjI1ICgnc2NoZWQ6IGFkZCBtaW5p
bWFsaXN0aWMgaWRsZSBzY2hlZHVsZXIgZm9yIGZyZWUgY3B1cycpCj4gU2lnbmVkLW9mZi1ieTog
SnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiAtLS0KPiAgIHhlbi9jb21tb24v
eG1hbGxvY190bHNmLmMgfCA1IC0tLS0tCj4gICB4ZW4vaW5jbHVkZS94ZW4vY29uZmlnLmggIHwg
NSArKysrKwo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24veG1hbGxvY190bHNmLmMgYi94ZW4vY29t
bW9uL3htYWxsb2NfdGxzZi5jCj4gaW5kZXggZTk4YWQ2NTQ1NS4uMWU4ZDcyZGVhMiAxMDA2NDQK
PiAtLS0gYS94ZW4vY29tbW9uL3htYWxsb2NfdGxzZi5jCj4gKysrIGIveGVuL2NvbW1vbi94bWFs
bG9jX3Rsc2YuYwo+IEBAIC01NDksMTEgKzU0OSw2IEBAIHN0YXRpYyB2b2lkIHRsc2ZfaW5pdCh2
b2lkKQo+ICAgICogeG1hbGxvYygpCj4gICAgKi8KPiAgIAo+IC0jaWZuZGVmIFpFUk9fQkxPQ0tf
UFRSCj4gLS8qIFJldHVybiB2YWx1ZSBmb3IgemVyby1zaXplIGFsbG9jYXRpb24sIGRpc3Rpbmd1
aXNoZWQgZnJvbSBOVUxMLiAqLwo+IC0jZGVmaW5lIFpFUk9fQkxPQ0tfUFRSICgodm9pZCAqKS0x
TCkKPiAtI2VuZGlmCj4gLQo+ICAgdm9pZCAqX3htYWxsb2ModW5zaWduZWQgbG9uZyBzaXplLCB1
bnNpZ25lZCBsb25nIGFsaWduKQo+ICAgewo+ICAgICAgIHZvaWQgKnAgPSBOVUxMOwo+IGRpZmYg
LS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vY29uZmlnLmggYi94ZW4vaW5jbHVkZS94ZW4vY29uZmln
LmgKPiBpbmRleCBhMWQwZjk3MGE3Li5hMTA2MzgwYTIzIDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNs
dWRlL3hlbi9jb25maWcuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9jb25maWcuaAo+IEBAIC04
Niw0ICs4Niw5IEBACj4gICAjZGVmaW5lIE5ERUJVRwo+ICAgI2VuZGlmCj4gICAKPiArI2lmbmRl
ZiBaRVJPX0JMT0NLX1BUUgo+ICsvKiBSZXR1cm4gdmFsdWUgZm9yIHplcm8tc2l6ZSBhbGxvY2F0
aW9uLCBkaXN0aW5ndWlzaGVkIGZyb20gTlVMTC4gKi8KPiArI2RlZmluZSBaRVJPX0JMT0NLX1BU
UiAoKHZvaWQgKiktMUwpCj4gKyNlbmRpZgo+ICsKPiAgICNlbmRpZiAvKiBfX1hFTl9DT05GSUdf
SF9fICovCj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
