Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3941AC2BF
	for <lists+xen-devel@lfdr.de>; Sat,  7 Sep 2019 00:55:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6N5g-0001SI-To; Fri, 06 Sep 2019 22:52:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7/kl=XB=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i6N5f-0001S2-8c
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 22:52:27 +0000
X-Inumbo-ID: fee91a34-d0f8-11e9-abfd-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id fee91a34-d0f8-11e9-abfd-12813bfff9fa;
 Fri, 06 Sep 2019 22:52:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93A8B1570;
 Fri,  6 Sep 2019 15:52:25 -0700 (PDT)
Received: from [10.37.13.72] (unknown [10.37.13.72])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D95653F67D;
 Fri,  6 Sep 2019 15:52:21 -0700 (PDT)
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Pawel Wieczorkiewicz <wipawel@amazon.de>
References: <20190821081931.90887-1-wipawel@amazon.de>
 <20190827084624.116917-1-wipawel@amazon.de>
 <20190905191345.GA6846@char.us.oracle.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <13455e30-86f5-e350-abbc-103760ec672e@arm.com>
Date: Fri, 6 Sep 2019 23:52:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905191345.GA6846@char.us.oracle.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 00/12] livepatch: new features and fixes
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
Cc: Tim Deegan <tim@xen.org>, wipawel@amazon.com,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 xen-devel@lists.xen.org, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgS29ucmFkLAoKT24gOS81LzE5IDg6MTMgUE0sIEtvbnJhZCBSemVzenV0ZWsgV2lsayB3cm90
ZToKPiBPbiBUdWUsIEF1ZyAyNywgMjAxOSBhdCAwODo0NjoxMkFNICswMDAwLCBQYXdlbCBXaWVj
em9ya2lld2ljeiB3cm90ZToKPj4gVGhpcyBzZXJpZXMgaW50cm9kdWNlcyBuZXcgZmVhdHVyZXMg
dG8gdGhlIGxpdmVwYXRjaCBmdW5jdGlvbmFsaXR5IGFzCj4+IGJyaWVmbHkgZGlzY3Vzc2VkIGR1
cmluZyBYZW4gRGV2ZWxvcGVyIFN1bW1pdCAyMDE5OiBbYV0gYW5kIFtiXS4KPj4gSXQgYWxzbyBw
cm92aWRlcyBhIGZldyBmaXhlcyBhbmQgc29tZSBzbWFsbCBpbXByb3ZlbWVudHMuCj4+Cj4+IE1h
aW4gY2hhbmdlcyBpbiB2MjoKPj4gLSBhZGRlZCBuZXcgZmVhdHVyZXMgdG8gbGl2ZXBhdGNoIGRv
Y3VtZW50YXRpb24KPj4gLSBhZGRlZCBsaXZlcGF0Y2ggdGVzdHMKPj4gLSBlbmFibGVkIEFybSBz
dXBwb3J0IGZvciBbNV0KPj4gLSBtYWtlIC5tb2RpbmZvIG9wdGlvbmFsIGZvciBbMTFdCj4+IC0g
Zml4ZWQgdHlwb3MKPiAKPiBJIHRvb2sgeW91ciBwYXRjaGVzLCByZWRpZCB0aGVtIHBlciB3aGF0
IEkgaGFkIHJlc3BvbmRlZCBvbiB0aGVzZSBwYXRjaGVzCj4gKGFuZCBzcXVhc2hlZCB5b3VyIGZp
eCBmb3IgeGVuX2V4cGVjdGF0aW9ucykgYW5kIHN0dWNrIHRoZW0gaW4gbXkgYnJhbmNoOgo+IAo+
IGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXBlb3BsZS9rb25yYWR3aWxrL3hlbi5n
aXQ7YT1zaG9ydGxvZztoPXJlZnMvaGVhZHMvbGl2ZXBhdGNoLmF3cy52Mwo+IAo+IFRoZXJlIGFy
ZSB0aHJlZSBleHRyYSBwYXRjaGVzIHRoYXQgd2VyZSBuZWVkZWQgZm9yIG1lIHRvIHRlc3Qgb24g
QVJNMzIgLSB0aG9zZQo+IGFyZSBrbm93biBpc3N1ZXMgYW5kIHRoZXkgZG9uJ3QgYmxvY2sgeW91
ciBwYXRjaGVzLiBJIHdpbGwgcG9zdCB0aGVtIGluZGVwZW5kZW50Cj4gb2YgeW91ciBwYXRjaGVz
Lgo+IAo+ICBGcm9tIG15IHBlcnNwZWN0aXZlLCB5b3VyIHBhdGNoZXMgYXJlIGdvb2QgdG8gZ28u
Cj4gCj4gQnV0IEkgYmVsaWV2ZSBJIG5lZWQ6Cj4gICAtIHRoZSB0b29scyBmb2xrcyBBY2sgb24g
dGhlIGxpYnhjIGNvZGUgY2hhbmdlcywKPiAgIC0gYW5kIGFsc28gYW4gQWNrIGZyb20gdGhlIFJF
U1Qgb24gc3lzY3RsLmgsCj4gICAtIGFuZCBKdWxpYW4gT0sgb24gdGhlIEFSTTMyL0FSTTY0IGNv
ZGUgY2hhbmdlcyB3aGljaCBhcmUgdGlueSwgYnV0IG5vbmV0aGxlc3MgYXJlIGhpcy4KCkkgYmVs
aWV2ZSBhbGwgdGhlIG1vZGlmaWNhdGlvbnMgYXJlIHVuZGVyIGluIGxpdmVwYXRjaC5jIGZpbGVz
LiBTbyB5b3VyIApBY2sgc2hvdWxkIGJlIHN1ZmZpY2llbnQgaGVyZSA6KS4KCkFueXdheSwgZmVl
bCBmcmVlIHRvIGFkZCBtaW5lIG9uIEFybSBzcGVjaWZpYyBtb2RpZmljYXRpb25zLgoKQ2hlZXJz
LAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
