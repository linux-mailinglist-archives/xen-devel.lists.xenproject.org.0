Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5555B7895
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 13:38:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAujy-0002Jw-AJ; Thu, 19 Sep 2019 11:36:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ts4K=XO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iAujw-0002Jg-5z
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 11:36:48 +0000
X-Inumbo-ID: c3578392-dad1-11e9-978d-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id c3578392-dad1-11e9-978d-bc764e2007e4;
 Thu, 19 Sep 2019 11:36:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0740128;
 Thu, 19 Sep 2019 04:36:47 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 382053F67D;
 Thu, 19 Sep 2019 04:36:46 -0700 (PDT)
To: Oleksandr <olekstysh@gmail.com>, Jan Beulich <jbeulich@suse.com>
References: <1568388917-7287-1-git-send-email-olekstysh@gmail.com>
 <1568388917-7287-7-git-send-email-olekstysh@gmail.com>
 <0cdbf4a2-a769-f62c-a547-5c7ad87f0fc3@suse.com>
 <12f7d629-59c9-5922-0217-02c9d610bc28@gmail.com>
 <f10cc304-96f8-f942-0ef2-0a9d4544f288@suse.com>
 <f8ab5e72-2475-3884-c23f-84d07eba11ba@gmail.com>
 <f243004b-9069-566c-1e8c-ba49e401c98d@arm.com>
 <69614adc-d2fb-ea4f-7659-3f65e40116a3@suse.com>
 <f17ed0cd-5401-e3d6-86a7-7067edaeec39@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <afc9b503-665a-5168-5b80-87867d3e5902@arm.com>
Date: Thu, 19 Sep 2019 12:36:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f17ed0cd-5401-e3d6-86a7-7067edaeec39@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 6/8] iommu/arm: Add lightweight
 iommu_fwspec support
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxOS8wOS8yMDE5IDExOjU3LCBPbGVrc2FuZHIgd3JvdGU6Cj4gCj4gSGksIGFsbC4KCkhp
LAoKPiAKPiAKPj4+Pj4+Pj4gK3N0cnVjdCBpb21tdV9md3NwZWMgewo+Pj4+Pj4+PiArwqDCoMKg
IC8qIHRoaXMgZGV2aWNlJ3MgSU9NTVUgKi8KPj4+Pj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgZGV2aWNl
ICppb21tdV9kZXY7Cj4+Pj4+Pj4+ICvCoMKgwqAgLyogSU9NTVUgZHJpdmVyIHByaXZhdGUgZGF0
YSBmb3IgdGhpcyBkZXZpY2UgKi8KPj4+Pj4+Pj4gK8KgwqDCoCB2b2lkICppb21tdV9wcml2Owo+
Pj4+Pj4+PiArwqDCoMKgIC8qIG51bWJlciBvZiBhc3NvY2lhdGVkIGRldmljZSBJRHMgKi8KPj4+
Pj4+Pj4gK8KgwqDCoCB1bnNpZ25lZCBpbnQgbnVtX2lkczsKPj4+Pj4+Pj4gK8KgwqDCoCAvKiBJ
RHMgd2hpY2ggdGhpcyBkZXZpY2UgbWF5IHByZXNlbnQgdG8gdGhlIElPTU1VICovCj4+Pj4+Pj4+
ICvCoMKgwqAgdWludDMyX3QgaWRzWzFdOwo+Pj4+Pj4+PiArfTsKPj4+Pj4+PiBOb3RlIHRoYXQg
eW91IGFidXNlIHhyZWFsbG9jX2ZsZXhfc3RydWN0KCkgd2hlbiB1c2luZyBpdCB3aXRoIHN1Y2gK
Pj4+Pj4+PiBhIHR5cGU6IFRoZSBsYXN0IGZpZWxkIGlzIF9ub3RfIGEgZmxleGlibGUgYXJyYXkg
bWVtYmVyLiBDb21waWxlcnMKPj4+Pj4+PiBtaWdodCBsZWdpdGltYXRlbHkgd2FybiBpZiB0aGV5
IGNhbiBwcm92ZSB0aGF0IHlvdSBhY2Nlc3MKPj4+Pj4+PiBwLT5pZHNbMV0gYW55d2hlcmUsIGRl
c3BpdGUgeW91IChwcmVzdW1hYmx5KSBoYXZpbmcgYWxsb2NhdGVkIGVub3VnaAo+Pj4+Pj4+IHNw
YWNlLiAoSSBoYXZlbid0IGJlZW4gYWJsZSB0byB0aGluayBvZiBhIHdheSBmb3IgdGhlIG1hY3Jv
IHRvCj4+Pj4+Pj4gYWN0dWFsbHkgZGV0ZWN0IGFuZCBoZW5jZSByZWZ1c2Ugc3VjaCB3cm9uZyB1
c2VzLikKPj4+Pj4+IEluZGVlZCwgeW91IGFyZSByaWdodC4gSSBhbSBpbiBkb3VidCwgd2hldGhl
ciB0byByZXRhaW4gcG9ydGVkIGZyb20KPj4+Pj4+IExpbnV4IGNvZGUgKGlkc1sxXSkKPj4+Pj4+
Cj4+Pj4+PiBhbmQgbWVudGlvbiBhYm91dCBzdWNoIGFidXNlIG9yIGNoYW5nZSBpdCB0byBkZWFs
IHdpdGggcmVhbCBmbGV4aWJsZQo+Pj4+Pj4gYXJyYXkgbWVtYmVyIChpZHNbXSkuIEFueSB0aG91
Z2h0cz8KPj4+Pj4gSSdtIG9mIHRoZSBzdHJvbmcgb3BpbmlvbiB0aGF0IHlvdSBzaG91bGQgc3dp
dGNoIHRvIFtdIChvciBhdAo+Pj4+PiBsZWFzdCBbMF0pIG5vdGF0aW9uLgo+Pj4+IEkgZ290IGl0
LiBXZWxsLCB3aWxsIHN3aXRjaCB0byBpZHNbXSBpZiB0aGVyZSBhcmUgbm8gb2JqZWN0aW9ucy4K
Pj4+IEkgc3VzcGVjdCB0aGUgcmF0aW9uYWxlIHRvIHVzZSAxIHJhdGhlciB0aGFuIDAgaXMgdG8g
YXZvaWQgdGhlIHJlLWFsbG9jYXRpb24gaW4KPj4+IHRoZSBjb21tb24gY2FzZSB3aGVyZSBhIGRl
dmljZSBoYXMgYSBzaW5nbGUgSUQuCj4+Pgo+Pj4gSSB3b3VsZCBsaWtlIHRvIHJldGFpbiB0aGUg
c2ltaWxhciBiZWhhdmlvci4gVGhlIGlkc1sxXSBpcyBwcm9iYWJseSB0aGUgbW9zdAo+Pj4gcHJl
dHR5IHdheSB0byBkbyBpdC4KPj4+Cj4+PiBBbm90aGVyIHNvbHV0aW9uIHdvdWxkIHRvIHVzZSB4
bWFsbG9jX2J5dGVzKCkgZm9yIHRoZSBpbml0aWFsIGFsbG9jYXRpb24gb2YKPj4+IHhtYWxsb2Nf
Ynl0ZXMoKS4KPj4gV2h5IG5vdCB1c2UgeG1hbGxvY19mbGV4Xzx3aGF0ZXZlcj4oKSBvbiB0aGUg
Zmlyc3QgYWxsb2NhdGlvbiwgdG9vPwo+IEhtbSwgd2h5IG5vdD8gTG9va3MgbGlrZSB0aGUgeG1h
bGxvY19mbGV4X3N0cnVjdCBmaXRzIGhlcmUuCj4gCj4gVGhlIGZpcnN0IGFsbG9jYXRpb24gd291
bGQgYmU6Cj4gCj4gZndzcGVjID0geG1hbGxvY19mbGV4X3N0cnVjdChzdHJ1Y3QgaW9tbXVfZndz
cGVjLMKgIGlkcywgMSk7Cj4gCj4gCj4gVGhlIHJlLWFsbG9jYXRpb24gZm9yIHRoZSBkZXZpY2Vz
IHdpdGggc2luZ2xlIElEIHdvdWxkIGRvIGVmZmVjdGl2ZWx5IG5vdGhpbmcgCj4gKGFzc3VtaW5n
IHRoYXQgX3hyZWFsbG9jIHdpbGwgcmVjb2duaXplIHRoYXQgc2l6ZSBpcyB0aGUgc2FtZSk6Cj4g
Cj4gZndzcGVjID0geHJlYWxsb2NfZmxleF9zdHJ1Y3QoZndzcGVjLCBpZHMsIGZ3c3BlYy0+bnVt
X2lkcyArIG51bV9pZHMpOwo+IAo+IAo+IEp1bGllbiwgd2hhdCBkbyB5b3UgdGhpbms/CgpJIGFt
IGhhcHB5IHdpdGggdGhhdC4gVGhlIGZpcnN0IGFsbG9jYXRpb24gd291bGQgbmVlZCBhIGNvbW1l
bnQgb24gdG9wIApleHBsYWluaW5nIHRoZSByZWFzb24gb2YgdGhlICIxIi4KCkNoZWVycywKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
