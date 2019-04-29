Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1681E108
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 13:07:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL44X-00068Z-JH; Mon, 29 Apr 2019 11:03:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cijb=S7=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hL44W-00068U-4b
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 11:03:44 +0000
X-Inumbo-ID: 733af1a6-6a6e-11e9-99dd-b31bf714cecf
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 733af1a6-6a6e-11e9-99dd-b31bf714cecf;
 Mon, 29 Apr 2019 11:03:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2591B80D;
 Mon, 29 Apr 2019 04:03:42 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4FB783F5AF;
 Mon, 29 Apr 2019 04:03:41 -0700 (PDT)
To: Amit Tomer <amittomer25@gmail.com>
References: <1555252419-17121-1-git-send-email-amittomer25@gmail.com>
 <58cbfc08-720c-0d55-75ac-f14dc3799036@arm.com>
 <e60a9e5a-6492-4232-2400-128fce246cc8@arm.com>
 <CABHD4K98oAZURhvraK5F1RHkv0j2YzaCkV8bsBX-=Cc3xc0irA@mail.gmail.com>
 <20190415094139.25256f06@donnerap.cambridge.arm.com>
 <9055daf1-7ab7-f24f-01e8-09e33d503d02@arm.com>
 <CABHD4K-cbhcYm5xHmJZQJHD2xP0v6zUQr4cyGvpJC5TVAcki=w@mail.gmail.com>
 <45f4b57a-eb74-ca4d-c9e3-6e9e1a1bca20@arm.com>
 <CABHD4K_XCtRbVX17L3v2JbV5NcGwLZd7Medc-qdg=23Z=rtLdw@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e6438cbc-fb39-56d3-8aa0-7762eaad8642@arm.com>
Date: Mon, 29 Apr 2019 12:03:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CABHD4K_XCtRbVX17L3v2JbV5NcGwLZd7Medc-qdg=23Z=rtLdw@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: Blacklist PMU with "arm,
 cortex-a53-pmu"
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
Cc: Andre Przywara <andre.przywara@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkvMDQvMjAxOSAxMTo1MiwgQW1pdCBUb21lciB3cm90ZToKPiBIZWxsbywKCkhpLAoKPj4K
Pj4gVGhlIHByb3BlciB3YXkgaXMgdG8gZGV0ZWN0IFBQSSBiZWZvcmUgaGFuZCBhbmQgY29tcGxl
dGVseSBza2lwIHRoZSBub2RlIGlmIGFueS4KPiAKPiBJIHRyaWVkIHRoZSBmb2xsb3dpbmcgY2hh
bmdlOgo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4v
YXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiBpbmRleCBkOTgzNjc3Li5hOWVjZmVkIDEwMDY0NAo+
IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9k
b21haW5fYnVpbGQuYwo+IEBAIC0xMzUzLDcgKzEzNTMsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBo
YW5kbGVfbm9kZShzdHJ1Y3QgZG9tYWluICpkLAo+IHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8s
Cj4gICAgICAgICAgIHsgLyogc2VudGluZWwgKi8gfSwKPiAgICAgICB9Owo+ICAgICAgIHN0cnVj
dCBkdF9kZXZpY2Vfbm9kZSAqY2hpbGQ7Cj4gLSAgICBpbnQgcmVzOwo+ICsgICAgaW50IHJlcywg
aXJxX2lkOwo+ICAgICAgIGNvbnN0IGNoYXIgKm5hbWU7Cj4gICAgICAgY29uc3QgY2hhciAqcGF0
aDsKPiAKPiBAQCAtMTM5OSw2ICsxMzk5LDE2IEBAIHN0YXRpYyBpbnQgX19pbml0IGhhbmRsZV9u
b2RlKHN0cnVjdCBkb21haW4gKmQsCj4gc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbywKPiAgICAg
ICAgICAgcmV0dXJuIDA7Cj4gICAgICAgfQo+IAo+ICsgICAgLypTa2lwIHRoZSBub2RlLCB1c2lu
ZyBQUEkgc291cmNlICovCj4gKyAgICBpcnFfaWQgPSBwbGF0Zm9ybV9nZXRfaXJxKG5vZGUsIDAp
OwoKVGhhdCdzIG9ubHkgY292ZXIgdGhlIGZpcnN0IGludGVycnVwdCBvZiBhIGRldmljZS4gV2hh
dCBpZiB0aGUgZmlyc3QgaW50ZXJydXB0IAppcyBhbiBTUEkgYnV0IGFsbCB0aGUgb3RoZXIgYXJl
IGFjdHVhbGx5IFBQSXM/CgpJbiBvcmRlciB0byBibGFjayBhbGwgZGV2aWNlcyB1c2luZyBQUEks
IHdlIG5lZWQgdG8gZ28gdGhyb3VnaCAqYWxsKiB0aGUgCmludGVycnVwdHMgb2YgdGhlIGRldmlj
ZS4gT3RoZXJ3aXNlIHlvdSB3aWxsIG1pc3Mgc29tZS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3Jh
bGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
