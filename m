Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E68A0AACAD
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 22:01:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5xuX-0006iM-18; Thu, 05 Sep 2019 19:59:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/daD=XA=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i5xuV-0006iH-An
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 19:59:15 +0000
X-Inumbo-ID: a111955a-d017-11e9-abda-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a111955a-d017-11e9-abda-12813bfff9fa;
 Thu, 05 Sep 2019 19:59:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B90D28;
 Thu,  5 Sep 2019 12:59:11 -0700 (PDT)
Received: from [10.37.12.167] (unknown [10.37.12.167])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2E0CF3F67D;
 Thu,  5 Sep 2019 12:59:08 -0700 (PDT)
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
References: <20190902145014.36442-1-paul.durrant@citrix.com>
 <20190902145014.36442-7-paul.durrant@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e4c93c53-389e-c31d-cba5-19eb1c06ed24@arm.com>
Date: Thu, 5 Sep 2019 20:59:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190902145014.36442-7-paul.durrant@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v8 6/6] introduce a 'passthrough'
 configuration option to xl.cfg...
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
 Christian Lindig <christian.lindig@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, David Scott <dave@recoil.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA5LzIvMTkgMzo1MCBQTSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IEBAIC0yNjMsOSAr
MjYzLDE3IEBAIHN0cnVjdCBkb21haW5faW9tbXUgewo+ICAgICAgIERFQ0xBUkVfQklUTUFQKGZl
YXR1cmVzLCBJT01NVV9GRUFUX2NvdW50KTsKPiAgIAo+ICAgICAgIC8qCj4gLSAgICAgKiBEb2Vz
IHRoZSBndWVzdCByZXFpcmUgbWFwcGluZ3MgdG8gYmUgc3luY2hvbml6ZWQsIHRvIG1haW50YWlu
Cj4gLSAgICAgKiB0aGUgZGVmYXVsdCBkZm4gPT0gcGZuIG1hcC4gKFNlZSBjb21tZW50IG9uIGRm
biBhdCB0aGUgdG9wIG9mCj4gLSAgICAgKiBpbmNsdWRlL3hlbi9tbS5oKS4KPiArICAgICAqIERv
ZXMgdGhlIGd1ZXN0IHNoYXJlIEhBUCBtYXBwaW5nIHdpdGggdGhlIElPTU1VPyBUaGlzIGlzIGFs
d2F5cwo+ICsgICAgICogdHJ1ZSBmb3IgQVJNIHN5c3RlbXMgYW5kIG1heSBiZSB0cnVlIGZvciB4
ODYgc3lzdGVtcyB3aGVyZSB0aGUKPiArICAgICAqIHRoZSBoYXJkd2FyZSBpcyBjYXBhYmxlLgo+
ICsgICAgICovCgpJIGFtIHdvcnJpZWQgdGhhdCBzdWNoIGNvbW1lbnQgbWF5IHJvdCBvdmVyIHRo
ZSB0aW1lLiBGb3IgaW5zdGFuY2UsIGlmIAp3ZSBlaXRoZXIgYWRkIGEgbmV3IGFyY2hpdGVjdHVy
ZSBvciBkZWNpZGUgdG8gc3RvcCBzaGFyaW5nIFBUIG9uIEFybS4KCkkgdmFndWVseSByZWNhbGwg
c29tZSBwb3RlbnRpYWwgaXNzdWVzIHdpdGggdGhlIE1TSSBkb29yYmVsbHMgdGhhdCB3b3VsZCAK
cmVxdWlyZSB1cyB0byB1bnNoYXJlIHRoZSBQVCB3aGVuIHRoZXkgd2lsbCBiZSBzdXBwb3J0ZWQg
aW4gZ3Vlc3QuCgpJIHdvdWxkIHN1Z2dlc3QgdG8gZWl0aGVyIHJlZmVycyB0byB0aGUgaW1wbGVt
ZW50YXRpb24gb2YgCmlvbW11X3VzZV9oYXBfcHQoKSBvciBkcm9wIGNvbXBsZXRlbHkgdGhlIHNl
Y29uZCBzZW50ZW5jZS4KCj4gKyAgICBib29sIGhhcF9wdF9zaGFyZTsKPiArCj4gKyAgICAvKgo+
ICsgICAgICogRG9lcyB0aGUgZ3Vlc3QgcmVxdWlyZSBtYXBwaW5ncyB0byBiZSBzeW5jaHJvbml6
ZWQsIHRvIG1haW50YWluCj4gKyAgICAgKiB0aGUgZGVmYXVsdCBkZm4gPT0gcGZuIG1hcD8gKFNl
ZSBjb21tZW50IG9uIGRmbiBhdCB0aGUgdG9wIG9mCj4gKyAgICAgKiBpbmNsdWRlL3hlbi9tbS5o
KS4gTm90ZSB0aGF0IGhhcF9wdF9zaGFyZSA9PSBmYWxzZSBkb2VzIG5vdAo+ICsgICAgICogbmVj
ZXNzYXJpbHkgaW1wbHkgdGhpcyBpcyB0cnVlLgo+ICAgICAgICAqLwo+ICAgICAgIGJvb2wgbmVl
ZF9zeW5jOwo+ICAgfTsKPiBAQCAtMjc1LDggKzI4Myw3IEBAIHN0cnVjdCBkb21haW5faW9tbXUg
ewo+ICAgI2RlZmluZSBpb21tdV9jbGVhcl9mZWF0dXJlKGQsIGYpIGNsZWFyX2JpdChmLCBkb21f
aW9tbXUoZCktPmZlYXR1cmVzKQo+ICAgCj4gICAvKiBBcmUgd2UgdXNpbmcgdGhlIGRvbWFpbiBQ
Mk0gdGFibGUgYXMgaXRzIElPTU1VIHBhZ2V0YWJsZT8gKi8KPiAtI2RlZmluZSBpb21tdV91c2Vf
aGFwX3B0KGQpIFwKPiAtICAgIChoYXBfZW5hYmxlZChkKSAmJiBpc19pb21tdV9lbmFibGVkKGQp
ICYmIGlvbW11X2hhcF9wdF9zaGFyZSkKPiArI2RlZmluZSBpb21tdV91c2VfaGFwX3B0KGQpICAg
ICAgIChkb21faW9tbXUoZCktPmhhcF9wdF9zaGFyZSkKPiAgIAo+ICAgLyogRG9lcyB0aGUgSU9N
TVUgcGFnZXRhYmxlIG5lZWQgdG8gYmUga2VwdCBzeW5jaHJvbml6ZWQgd2l0aCB0aGUgUDJNICov
Cj4gICAjaWZkZWYgQ09ORklHX0hBU19QQVNTVEhST1VHSAo+IAoKQ2hlZXJzLAoKLS0gCkp1bGll
biBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
