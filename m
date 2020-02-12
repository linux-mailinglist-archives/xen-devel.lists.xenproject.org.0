Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5560915A504
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 10:39:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1oRe-0002nA-MP; Wed, 12 Feb 2020 09:36:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JFaq=4A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j1oRc-0002n5-O9
 for xen-devel@lists.xen.org; Wed, 12 Feb 2020 09:36:32 +0000
X-Inumbo-ID: 26065f1a-4d7b-11ea-b704-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 26065f1a-4d7b-11ea-b704-12813bfff9fa;
 Wed, 12 Feb 2020 09:36:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E37AAAC46;
 Wed, 12 Feb 2020 09:36:29 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200211134220.9194-1-sergey.dyasli@citrix.com>
 <20200211134220.9194-2-sergey.dyasli@citrix.com>
 <d57d5efa-2bc6-8fdc-a8a1-734d6957b577@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3293e873-1946-f6a7-6cda-dd8c3cb4a29f@suse.com>
Date: Wed, 12 Feb 2020 10:36:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <d57d5efa-2bc6-8fdc-a8a1-734d6957b577@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 1/2] xsm: add Kconfig option for denied
 string
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 xen-devel@lists.xen.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDIuMjAyMCAxNDo1NiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMS8wMi8yMDIw
IDEzOjQyLCBTZXJnZXkgRHlhc2xpIHdyb3RlOgo+PiBBZGQgS2NvbmZpZyBvcHRpb24gdG8gbWFr
ZSBpdCBwb3NzaWJsZSB0byBjb25maWd1cmUgdGhlIHN0cmluZyByZXR1cm5lZAo+PiB0byBub24t
cHJpdmlsZWdlZCBndWVzdHMgaW5zdGVhZCBvZiB0aGUgZGVmYXVsdCAiPGRlbmllZD4iIHdoaWNo
IGNvdWxkCj4+IHByb3BhZ2F0ZSB0byBVSSAvIGxvZ3MgYWZ0ZXIgdGhlIHN1YnNlcXVlbnQgcGF0
Y2ggdGhhdCBoaWRlcyBkZXRhaWxlZAo+PiBYZW4gdmVyc2lvbiBpbmZvcm1hdGlvbiBmcm9tIHVu
cHJpdmlsZWdlZCBndWVzdHMuCj4+Cj4+IEludHJvZHVjZSBYRU5WRVJfZGVuaWVkX3N0cmluZyB0
byBhbGxvdyBndWVzdHMgdG8gc2V0IHVwIFVJIC8gbG9ncwo+PiBmaWx0ZXJpbmcgd2hpY2ggZGVw
ZW5kZW5zIG9uIHRoZSBuZXcgQ09ORklHX1hTTV9ERU5JRURfU1RSSU5HLgo+IAo+IE5vLsKgIFRo
aXMgaXMgZXZlbiB3b3JzZSB0aGFuIG90aGVyIHN1Z2dlc3Rpb25zLgo+IAo+IEl0IGlzIGVudGly
ZWx5IHVuYWNjZXB0YWJsZSB0byBleHBlY3QgZ3Vlc3RzIHRvIGhhdmUgdG8gbW9kaWZ5IHRoZW0g
dG8KPiBmaWd1cmUgb3V0IHdoZW4gdGhleSdyZSBiZWluZyBsaWVkIHRvLgoKV2h5ICJsaWVkIHRv
Ij8gRGVueWluZyBkYXRhIGFjY2VzcyBpcyBkaWZmZXJlbnQgZnJvbSBseWluZyBpbW8uClBsdXMg
eW91ciBwcm9wb3NhbCB0byByZXR1cm4gZW1wdHkgc3RyaW5ncyB0aGVuIGlzIGV2ZW4gbW9yZSBv
ZgphIGxpZSwgZm9yIGJlaW5nIG5vdCBldmVuIHJlY29nbml6YWJsZSBhICJhY2Nlc3MgZGVuaWVk
Ii4KCj4gQW5kIGl0IGlzIG5vdyBwb3NzaWJsZSAqd2l0aG91dCBzb3VyY2UgY29kZSBtb2RpZmlj
YXRpb25zKiB0byBjcmVhdGUgYQo+IFhlbiB3aGljaCByZXBvcnRzIG9uZSBzdHJpbmcgaW4gdGhp
cyBoeXBlcmNhbGwsIGFuZCBoYXMgZW1wdHkgc3RyaW5ncwo+IGVsc2V3aGVyZSwgd2hpY2ggaXMg
ZXZlbiBtb3JlIGNoYW90aWMgZm9yIGd1ZXN0cy4KCkVtcHR5IHN0cmluZ3MgZWxzZXdoZXJlPyBE
byB5b3UgbWVhbiBiZWNhdXNlIG9mIGFjY2VzcyBoYXZpbmcKYmVlbiBkZW5pZWQsIG9yIGJlY2F1
c2UgdGhleSBpbiBmYWN0IGFyZSBlbXB0eT8gSW4gdGhlIGZvcm1lcgpjYXNlIEknZCBsaWtlIHRv
IGFzayBmb3IgYXQgbGVhc3Qgb25lIGV4YW1wbGUsIHdoaWxlIGluIHRoZQpsYXR0ZXIgY2FzZSBJ
IGRvbid0IHNlZSB3aGF0IHdyb25nIHlvdSBzZWUuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
