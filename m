Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7311134639
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 16:30:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipDG7-0005fp-3m; Wed, 08 Jan 2020 15:28:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jtyv=25=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ipDG5-0005fi-T9
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 15:28:33 +0000
X-Inumbo-ID: 86a5d658-322b-11ea-b830-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 86a5d658-322b-11ea-b830-12813bfff9fa;
 Wed, 08 Jan 2020 15:28:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4F7D2AAD0;
 Wed,  8 Jan 2020 15:28:32 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20191217105901.68158-1-anthony.perard@citrix.com>
 <20191217105901.68158-3-anthony.perard@citrix.com>
 <c2285ab6-8627-545b-eedc-61e3c9e46769@suse.com>
 <20200106140147.GI1267@perard.uk.xensource.com>
 <0a9b734c-b6fd-046f-83c9-68fe486d46d6@suse.com>
 <20200108144729.GK1267@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c0f6ad77-57dc-a297-f536-97b0935d3f94@suse.com>
Date: Wed, 8 Jan 2020 16:28:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200108144729.GK1267@perard.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v2 2/6] xen: Have Kconfig check $(CC)'s
 version
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDEuMjAyMCAxNTo0NywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gT24gTW9uLCBKYW4g
MDYsIDIwMjAgYXQgMDM6MzQ6NDNQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA2
LjAxLjIwMjAgMTU6MDEsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+Pj4gT24gRnJpLCBKYW4gMDMs
IDIwMjAgYXQgMDU6NDI6MThQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gV291bGRu
J3QgYm90aCBiZXR0ZXIKPj4+PiBoYXZlIGEgImRlcGVuZHMgb24gQ0NfSVNfKiIgbGluZSBpbnN0
ZWFkPyBUaGlzIHdvdWxkIHRoZW4gYWxzbwo+Pj4+IHJlc3VsdCAoYWZhaWN0KSBpbiBubyBDT05G
SUdfQ0xBTkdfVkVSU0lPTiBpbiAuY29uZmlnIGlmIGJ1aWxkaW5nCj4+Pj4gd2l0aCBnY2MgKGFu
ZCB2aWNlIHZlcnNhKSwgaW5zdGVhZCBvZiBhIGJvZ3VzIENPTkZJR19DTEFOR19WRVJTSU9OPTAu
Cj4+Pgo+Pj4gSXQgc291bmRzIGF0dHJhY3RpbmcgdG8gcmVtb3ZlIHZhcmlhYmxlcyBmcm9tIC5j
b25maWcsIGJ1dCBpdCBpcyBlcXVhbGx5Cj4+PiBhdHRyYWN0aW5nIHRvIGFsd2F5cyBoYXZlIGEg
dmFyaWFibGUgc2V0LiBJdCBjYW4gYmUgdXNlZAo+Pj4gdW5jb25kaXRpb25hbGx5IHdoZW4gYWx3
YXlzIHNldCAod2l0aG91dCByaXNraW5nIGludmFsaWQgc3ludGF4IGZvcgo+Pj4gZXhhbXBsZSku
Cj4+Cj4+IEhtbSwgeWVzLCBhcyBsb25nIGFzIHdlIGRvbid0IGhhdmUgKGJ5IG1lY2hhbmljYWwg
Y29udmVyc2lvbikgb3IgZ2Fpbgo+PiBjb25zdHJ1Y3RzIGxpa2UKPj4KPj4gI2lmIENPTkZJR19H
Q0NfVkVSU0lPTiA8IDUwMDAwIC8qIG11c3QgYmUgZ2NjIDQueCAqLwo+Pgo+PiBQbHVzIC0gd2hh
dCdzIENPTkZJR19DQ19JU197R0NDLENMQU5HfSBnb29kIGZvciB0aGVuPyBUaGUgc2FtZSBjYW4K
Pj4gdGhlbiBiZSBhY2hpZXZlZCBieSBjb21wYXJpbmcgQ09ORklHX3tHQ0MsQ0xBTkd9X1ZFUlNJ
T04gYWdhaW5zdCB6ZXJvLgo+IAo+IFN1cmUsIGJ1dCBpdCBpcyBtdWNoIGVhc2llciB0byB1bmRl
cnN0YW5kIHdoYXQgImlmZGVmIENPTkZJR19DQ19JU19HQ0MiCj4gaXMgYWN0dWFsbHkgY2hlY2tp
bmcgdGhhbiBpdCBpcyB0byB1bmRlcnN0YW5kIHdoYXQKPiAiWyAkQ09ORklHX0dDQ19WRVJTSU9O
IC1uZSAwIF0iIGlzIGZvci4gSW4gdGhlIHNlY29uZCBmb3JtLCBpdCBpc24ndAo+IGltbWVkaWF0
bHkgb2J2aW91cyBmb3IgaHVtYW5zIHRoYXQgd2UgYXJlIHNpbXBseSBjaGVja2luZyB3aGljaCBj
b21waWxlcgo+IGlzIGluIHVzZS4KCkFuZCBJIHdhc24ndCByZWFsbHkgc3VnZ2VzdGluZyB0byBk
cm9wIHRoZSBDQ19JU18qIG9uZXMuIFdoYXQgSQpkaXNsaWtlIGlzIHRoZSBkdXBsaWNhdGlvbiBy
ZXN1bHRpbmcgZnJvbSB0aGUgKl9WRVJTSU9OIG9uZXMgbm90CmhhdmluZyBhICJkZXBlbmRzIG9u
IENDX0lTXyoiLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
