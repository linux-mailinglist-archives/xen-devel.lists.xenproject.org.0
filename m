Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA59154341
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 12:40:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izfTQ-0001C7-KO; Thu, 06 Feb 2020 11:37:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ya+N=32=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izfTP-0001Bu-0O
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 11:37:31 +0000
X-Inumbo-ID: 0e16246c-48d5-11ea-af41-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e16246c-48d5-11ea-af41-12813bfff9fa;
 Thu, 06 Feb 2020 11:37:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 68262AE3D;
 Thu,  6 Feb 2020 11:37:28 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200205165056.11734-1-andrew.cooper3@citrix.com>
 <20200205165056.11734-7-andrew.cooper3@citrix.com>
 <9c7f9930-02d7-13d3-88ab-bad236993e31@suse.com>
 <5227980e-5938-f23b-7b1d-eac67bba792e@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <18fa5048-0fc7-c60d-bf93-d02442bae70d@suse.com>
Date: Thu, 6 Feb 2020 12:37:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <5227980e-5938-f23b-7b1d-eac67bba792e@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 6/6] xen/public: Obsolete
 HVM_PARAM_PAE_ENABLED
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
 Wei Liu <wl@xen.org>, Ian Jackson <Ian.Jackson@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDIuMjAyMCAxMjozMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNi8wMi8yMDIw
IDA5OjI4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDUuMDIuMjAyMCAxNzo1MCwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9odm0vcGFyYW1zLmgK
Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9odm0vcGFyYW1zLmgKPj4+IEBAIC04Niw3ICs4
Niw3IEBACj4+PiAgI2RlZmluZSBIVk1fUEFSQU1fU1RPUkVfUEZOICAgIDEKPj4+ICAjZGVmaW5l
IEhWTV9QQVJBTV9TVE9SRV9FVlRDSE4gMgo+Pj4gIAo+Pj4gLSNkZWZpbmUgSFZNX1BBUkFNX1BB
RV9FTkFCTEVEICA0Cj4+PiArI2RlZmluZSBIVk1fUEFSQU1fUEFFX0VOQUJMRUQgIDQgLyogT2Jz
b2xldGUuICBEbyBub3QgdXNlLiAqLwo+PiBJIHRoaW5rIHRoaXMgc2hvdWxkIGJlIG1vdmVkIHVw
IGluIHRoZSBkZXByZWNhdGVkIHNlY3Rpb24uCj4gCj4gVGhlcmUgaXNuJ3QgYSBkZXByZWNhdGVk
IHNlY3Rpb24uCj4gCj4gVGhlIHBhcmFtcyBhcmUgY3VycmVudGx5IHNvcnRlZCBudW1lcmljYWxs
eS7CoCBQbGF5aW5nICJ3aGljaCBwYXJhbSBpcwo+IHRoaXMgaW50ZWdlcj8iIHdpdGggYW4gdW5z
b3J0ZWQgcGFyYW1zLmggaXMgYW4gZXhwZXJpZW5jZSBJIHdpc2ggbmV2ZXIKPiB0byByZXBlYXQg
YWdhaW4uCgpZb3UnbGwgZmluZAoKLyogVGhlc2UgcGFyYW1ldGVycyBhcmUgZGVwcmVjYXRlZCBh
bmQgdGhlaXIgbWVhbmluZyBpcyB1bmRlZmluZWQuICovCgpuZWFyIHRoZSB0b3Agb2YgdGhlIGZp
bGUuIEkgY2FuIHNlZSB5b3VyIGNvbmNlcm4gYWJvdXQgdGhlIGZpbGUgbm90CmJlaW5nIHNvcnRl
ZCwgYnV0IGl0IGFscmVhZHkgaXNuJ3QuIFRoZSBhbHRlcm5hdGl2ZSB0aGVuIGlzIHRvIGZyYW1l
CmVhY2ggZGVwcmVjYXRlZCBwYXJhbSBieSAjaWZkZWYgX19YRU5fXyAtIEknZCBiZSBva2F5IHdp
dGggdGhhdCBpZgp0aGF0J3MgcHJlZmVycmVkIGJ5IHlvdS4KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
