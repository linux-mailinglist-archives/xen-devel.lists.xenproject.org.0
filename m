Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8CF8EF86
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 17:39:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyHnN-0003JT-D5; Thu, 15 Aug 2019 15:36:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y4W9=WL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hyHnM-0003JM-Kh
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 15:36:08 +0000
X-Inumbo-ID: 6673a4a0-bf72-11e9-a661-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 6673a4a0-bf72-11e9-a661-bc764e2007e4;
 Thu, 15 Aug 2019 15:36:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 928DC28;
 Thu, 15 Aug 2019 08:36:07 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7E403F706;
 Thu, 15 Aug 2019 08:36:05 -0700 (PDT)
To: George Dunlap <george.dunlap@citrix.com>,
 "Wieczorkiewicz, Pawel" <wipawel@amazon.de>,
 Lars Kurth <lars.kurth.xen@gmail.com>
References: <20190815112708.11474-1-wipawel@amazon.de>
 <8d5350af-2ca8-a651-c43c-07372779322d@arm.com>
 <3E431F27-7D89-4CE8-8FBA-86A38EBA580F@xenproject.org>
 <A373327B-1B2B-4892-97DB-132D1EA7084E@amazon.com>
 <664a5f94-bf16-42b1-ff99-e3cee5170563@arm.com>
 <8dd1e706-72a9-da4f-89a1-cde419b6c11d@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e8b045af-92c3-0cd6-c8f0-fad184569408@arm.com>
Date: Thu, 15 Aug 2019 16:36:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8dd1e706-72a9-da4f-89a1-cde419b6c11d@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH lp-metadata 2/3] livepatch: Handle arbitrary
 size names with the list operation
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
Cc: "Tim \(Xen.org\)" <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xen.org>,
 "Pohlack, Martin" <mpohlack@amazon.de>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgR2VvcmdlLAoKT24gMTUvMDgvMjAxOSAxNjozMiwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBP
biA4LzE1LzE5IDQ6MjkgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToKPj4KPj4KPj4gT24gMTUvMDgv
MjAxOSAxNjoxOSwgV2llY3pvcmtpZXdpY3osIFBhd2VsIHdyb3RlOgo+Pj4gSGkgTGFycywgSnVs
aWVuLAo+Pgo+PiBIaSwKPj4KPj4+IFRoYW5rcyBmb3IgdGhlIHBvaW50ZXJzLCBJIHdpbGwgcmVh
ZCB0aGVtIHVwIGFuZCBmb2xsb3cgdGhlCj4+PiByZWNvbW1lbmRhdGlvbnMgd2l0aCBteSBmdXR1
cmUgY29udHJpYnV0aW9ucy4KPj4+IFNvcnJ5IGZvciB0aGUgbWVzc+KApgo+Pj4KPj4+IEJ1dCwg
bGV0IG1lIGFzayBmaXJzdCBiZWZvcmUgcmVhZGluZyB0aGUgd2lraXMsIGhvdyBkbyB5b3UgcHJl
ZmVyCj4+PiBzdWJtaXR0aW5nIHNlcmllcyB0aGF0IGNvbnRhaW4gcGF0Y2hlcyBiZWxvbmdpbmcg
dG8gMiBkaXN0aW5jdCByZXBvcwo+Pj4gKGUuZy4geGVuIGFuZCBsaXZlcGF0Y2gtYnVpbGQtdG9v
bHMpPwo+Pgo+PiBJIGNhbiBzZWUgdHdvIHdheXM6Cj4+Cj4+ICDCoCAxKSBPbmUgc2VyaWVzIHBl
ciBwcm9qZWN0IGFuZCBtZW50aW9uIGluIHRoZSBjb3ZlciBsZXR0ZXIgdGhhdAo+PiBtb2RpZmlj
YXRpb25zIGFyZSByZXF1aXJlZCBpbiBhbm90aGVyIHByb2plY3QgKHdpdGggbGluay90aXRsZSku
Cj4+ICDCoCAyKSBDb21iaW5lIGFsbCB0aGUgcGF0Y2hlcyBpbiBvbmUgc2VyaWVzIGFuZCB0YWcg
dGhlbSBkaWZmZXJlbnRseS4gSS5lCj4+IFtYRU5dIFtMSVZFUEFUQ0hdLgo+Pgo+PiAxKSBpcyBw
cmVmZXJhYmxlIGlmIHlvdSBoYXZlIGEgbG90IG9mIHBhdGNoZXMgaW4gZWFjaCByZXBvLiAyKSBj
YW4gYmUKPj4gaGFuZHkgaWYgeW91IGhhdmUgb25seSBhIGNvdXBsZSBvZiBwYXRjaGVzIGZvciBv
bmUgcmVwby4KPiAKPiAxIGlzIGFsc28gZWFzaWVyIGZvciBhdXRvbWF0ZWQgdG9vbHMgKGxpa2Ug
cGF0Y2hldykgdG8gZGVhbCB3aXRoLgoKT3V0IG9mIGludGVyZXN0LCBpbiBnZW5lcmFsIGRldmVs
b3BlciB3aWxsIHRlbmQgdG8gY3Jvc3MtcG9zdCB0aG9zZSBwYXRjaGVzLiBTbyAKaW4gd2hhdCB3
YXkgdGhpcyB3b3VsZCBtYWtlIGl0IGVhc2llcj8KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
