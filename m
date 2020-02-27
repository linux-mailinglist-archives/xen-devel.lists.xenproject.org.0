Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2130217160E
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 12:32:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7HMJ-0001Z3-LI; Thu, 27 Feb 2020 11:29:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Qtag=4P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7HMH-0001Yy-84
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 11:29:37 +0000
X-Inumbo-ID: 6ef48550-5954-11ea-964b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6ef48550-5954-11ea-964b-12813bfff9fa;
 Thu, 27 Feb 2020 11:29:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F410AAC53;
 Thu, 27 Feb 2020 11:29:35 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200226202221.6555-1-andrew.cooper3@citrix.com>
 <20200226202221.6555-9-andrew.cooper3@citrix.com>
 <af3fe9fc-0d3c-4a9a-336c-b316f31fbfed@suse.com>
 <18c894ad-dbaa-2fd5-93e3-391cd3fee5c1@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3546d0ce-51e2-8aa8-d2c4-d883ca784e9a@suse.com>
Date: Thu, 27 Feb 2020 12:29:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <18c894ad-dbaa-2fd5-93e3-391cd3fee5c1@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 08/10] x86/cpuid: Introduce and use default
 CPUID policies
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDIuMjAyMCAxMTo1NSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyNy8wMi8yMDIw
IDA4OjE5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjYuMDIuMjAyMCAyMToyMiwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IEZvciBub3csIHRoZSBkZWZhdWx0IGFuZCBtYXggcG9saWNpZXMg
cmVtYWluIGlkZW50aWNhbCwgYnV0IHRoaXMgd2lsbCBjaGFuZ2UKPj4+IGluIHRoZSBmdXR1cmUu
ICBXcml0ZSBjYWxjdWxhdGVfe3B2LGh2bX1fZGVmX3BvbGljeSgpIGluIGEgd2F5IHdoaWNoIHdp
bGwgY29wZQo+Pj4gd2l0aCBzaW1wbGUgZmVhdHVyZSBkaWZmZXJlbmNlcyBmb3Igbm93Lgo+Pj4K
Pj4+IFVwZGF0ZSBYRU5fU1lTQ1RMX2dldF9jcHVfcG9saWN5IGFuZCBpbml0X2RvbWFpbl9jcHVp
ZF9wb2xpY3koKSB0byB1c2UgdGhlCj4+PiBkZWZhdWx0IHBvbGljaWVzLgo+PiBGb3IgdGhlIHN5
c2N0bCB0aGUgc3RhdGVtZW50IGxvb2tzIHRvIGJlIGJyb2FkZXIgdGhhbiByZWFsaXR5LAo+PiBh
cyAob2YgY291cnNlKSB5b3UgZG9uJ3QgdG91Y2ggWEVOX1NZU0NUTF9jcHVfcG9saWN5XypfbWF4
Lgo+IAo+IEknbSBhZnJhaWQgSSBkb24ndCB1bmRlcnN0YW5kIHdoYXQgeW91IG1lYW4gaGVyZS7C
oCBXaGF0IHdvdWxkIEkgbmVlZCB0bwo+IHRvdWNoIGluIFhFTl9TWVNDVExfY3B1X3BvbGljeV8q
X21heCBhdCBhbGw/CgpOb3RoaW5nLCBhbmQgaGVuY2UgbXkgInRvbyBicm9hZCIgcmVzcG9uc2Uu
IE9ubHkgcGFydCBvZgpYRU5fU1lTQ1RMX2dldF9jcHVfcG9saWN5IGdldHMgdXBkYXRlZC4gQnV0
IHllcywgdGhpbmtpbmcgYWJvdXQgaXQKYWdhaW4sIEkgdGhpbmsgSSBzZWUgbm93IGhvdyB5b3Ug
bWVhbiB0aGlzLiBTbyBuZXZlciBtaW5kLgoKPj4+IEBAIC0zODEsNiArMzg2LDIzIEBAIHN0YXRp
YyB2b2lkIF9faW5pdCBjYWxjdWxhdGVfcHZfbWF4X3BvbGljeSh2b2lkKQo+Pj4gICAgICBwLT5l
eHRkLnJhd1sweGFdID0gRU1QVFlfTEVBRjsgLyogTm8gU1ZNIGZvciBQViBndWVzdHMuICovCj4+
PiAgfQo+Pj4gIAo+Pj4gK3N0YXRpYyB2b2lkIF9faW5pdCBjYWxjdWxhdGVfcHZfZGVmX3BvbGlj
eSh2b2lkKQo+Pj4gK3sKPj4+ICsgICAgc3RydWN0IGNwdWlkX3BvbGljeSAqcCA9ICZwdl9kZWZf
Y3B1aWRfcG9saWN5Owo+Pj4gKyAgICB1aW50MzJfdCBwdl9mZWF0dXJlc2V0W0ZTQ0FQSU5UU107
Cj4+PiArICAgIHVuc2lnbmVkIGludCBpOwo+Pj4gKwo+Pj4gKyAgICAqcCA9IHB2X21heF9jcHVp
ZF9wb2xpY3k7Cj4+PiArICAgIGNwdWlkX3BvbGljeV90b19mZWF0dXJlc2V0KHAsIHB2X2ZlYXR1
cmVzZXQpOwo+Pj4gKwo+Pj4gKyAgICBmb3IgKCBpID0gMDsgaSA8IEFSUkFZX1NJWkUocHZfZmVh
dHVyZXNldCk7ICsraSApCj4+PiArICAgICAgICBwdl9mZWF0dXJlc2V0W2ldICY9IHB2X2RlZl9m
ZWF0dXJlbWFza1tpXTsKPj4+ICsKPj4+ICsgICAgc2FuaXRpc2VfZmVhdHVyZXNldChwdl9mZWF0
dXJlc2V0KTsKPj4+ICsgICAgY3B1aWRfZmVhdHVyZXNldF90b19wb2xpY3kocHZfZmVhdHVyZXNl
dCwgcCk7Cj4+PiArICAgIHJlY2FsY3VsYXRlX3hzdGF0ZShwKTsKPj4+ICt9Cj4+IElzIHRoZXJl
IGEgcmVhc29uIHRoZSBjYWxsIHRvIGd1ZXN0X2NvbW1vbl9mZWF0dXJlX2FkanVzdG1lbnRzKCkK
Pj4gaXMgbWlzc2luZyBoZXJlPwo+IAo+IFllcywgZm9yIHRoZSBzYW1lIHJlYXNvbiB0aGF0IG90
aGVyIGxvZ2ljIGlzIGRyb3BwZWQuwqAgSW5oZXJpdGluZyBmcm9tCj4gcHZfbWF4X2NwdWlkX3Bv
bGljeSBtZWFucyB0aGF0IGl0IGhhcyBhbHJlYWR5IGJlZW4gcnVuIG9uIHRoaXMgb2JqZWN0Lgo+
IAo+IFRoZSBob3N0IHRvICpfbWF4IGRlcml2YXRpb24gaXMgbm9uLXRyaXZpYWwuwqAgU29tZSBm
ZWF0dXJlcyBnZXQgYWRkZWQKPiBpbiwgb3RoZXJzIGFyZSBjb25kaXRpb25hbCBvbiBleHRlcm5h
bCBmYWN0b3JzLsKgIFRoZSAqX21heCB0byAqX2RlZgo+IGRlcml2YXRpb24gaXMgbXVjaCBtb3Jl
IHNpbXBsZSBpbiBjb21wYXJpc29uLgo+IAo+IExvbmcgdGVybSwgSSBleHBlY3QgdGhpcyBsb2dp
YyB0byBtb3ZlIGludG8gbGlieDg2IGFuZCBmdXJ0aGVyIHNpbXBsaWZ5Cj4gY3B1aWQuYwo+IAo+
IEhvd2V2ZXIsIEknbSBub3Qgc3VyZSB3aHkgZ3Vlc3RfY29tbW9uX2ZlYXR1cmVfYWRqdXN0bWVu
dHMoKSBpcyBzcGVjaWFsCj4gY29tcGFyZWQgdG8gdGhlIG90aGVyIHJlbW92ZWQgbG9naWMsIGFu
ZCB3aHkgaXQgc2hvdWxkIGJlIGNhbGxlZCBvdXQuCgpXZWxsLCB0aGUgb2RkaXR5IGlzbid0IHdp
dGggcmVtb3ZlZCBsb2dpYyAoYW5kIGluIGZhY3QgaW4gdGhpcyBwYXRjaCBJCmNhbid0IHNlZSBt
dWNoIG9mIGEgcmVtb3ZhbCBvZiBhbnl0aGluZyksIGJ1dCB3aXRoIHRoZSBjYWxsIGJlaW5nIHRo
ZXJlCmluIGNhbGN1bGF0ZV9odm1fZGVmX3BvbGljeSgpLiBUaGlzIGRpZmZlcmVuY2UsIGlmIGlu
dGVudGlvbmFsLCBpcyB3aGF0CkkgdGhpbmsgbmVlZHMgY2FsbGluZyBvdXQuCgpKYW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
