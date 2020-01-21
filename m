Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F6B143C44
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 12:48:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itry0-0004iW-50; Tue, 21 Jan 2020 11:45:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aBqa=3K=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1itrxy-0004hz-IZ
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 11:45:06 +0000
X-Inumbo-ID: 72d19128-3c43-11ea-b833-bc764e2007e4
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 72d19128-3c43-11ea-b833-bc764e2007e4;
 Tue, 21 Jan 2020 11:44:58 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id w15so2835708wru.4
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2020 03:44:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LAk4WbzWTxaxYXJd70COLNKEiX7ywaS8y2e9u6wLSlk=;
 b=VofABCeRjfjdpyQqSH2UkXHrL5aU3CmFeWuiZe3VW9pArA3IC/gug6XkEwzP15MBGf
 qgSjxvlIl+hCmj1TP52eXHCbisGkJB46Ja9z/je3E0SGAIY2RF/thHmJ0sQLP4mEOGTC
 /2HcqHumzLoERse8hAh1GnJEse8zQsQtb8fzIXuCju3QzzZN4ukXIxZQ9HtvShgdVUP5
 gIG3Cvtn6A7aYCvp5YkAJd3X5VUz5AF9JZM59roTHKwsDJt/SWZKzBXfYLexzgcMh0zG
 mAx20DmMdoczqML7zUt0komzE+YN9dns/10tHaVGXc3WeJHYILyZC3bGmFYKZ8JUblAV
 YOIQ==
X-Gm-Message-State: APjAAAXyIYja74eufQ4w2/ni626npP7zsRaVjfZswEJry9Y4rAOsePCx
 +40uCBLY2bPsxfZp65GnOTo=
X-Google-Smtp-Source: APXvYqyR/LjUROFHD7+FQcGTdWAq0O+UVnPS94acNi9GgoUpw4SVII3frqLMZZZEn0wqVHFYzP21qA==
X-Received: by 2002:adf:a48e:: with SMTP id g14mr4840102wrb.409.1579607097134; 
 Tue, 21 Jan 2020 03:44:57 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-238.amazon.com.
 [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id w83sm3577025wmb.42.2020.01.21.03.44.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2020 03:44:56 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>
References: <5E26738C.1060605@hisilicon.com>
 <f067440e-7df6-b40e-ed98-6b14c5c5f53d@suse.com>
 <6297d097-dc86-fe23-abaa-ca26b6c35a0d@xen.org>
 <7b5bf0ed-6b28-8c5c-d8e4-2efb992c86e4@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3705e688-8366-c8ff-4b12-b3b4b5a60f29@xen.org>
Date: Tue, 21 Jan 2020 11:44:55 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <7b5bf0ed-6b28-8c5c-d8e4-2efb992c86e4@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v2] ns16550: Add ACPI support for ARM only
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Linuxarm <linuxarm@huawei.com>,
 Wei Xu <xuwei5@hisilicon.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMjEvMDEvMjAyMCAxMToyNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjEu
MDEuMjAyMCAxMjoxNiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBPbiAyMS8wMS8yMDIwIDExOjEz
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Cj4+Pj4gKyAgICBpZiAoIEFDUElfRkFJTFVSRShzdGF0
dXMpICkKPj4+PiArICAgIHsKPj4+PiArICAgICAgICBwcmludGsoIm5zMTY1NTA6IEZhaWxlZCB0
byBnZXQgU1BDUiB0YWJsZVxuIik7Cj4+Pgo+Pj4gSXMgc3VjaCBhIG1lc3NhZ2Ugd2FycmFudGVk
PyBJLmUuIHdvdWxkbid0IGl0IHRyaWdnZXIgb24gYWxsCj4+PiBzeXN0ZW1zIG5vdCBoYXZpbmcg
dGhlIHRhYmxlLCB3aGljaCBpcyBoYXJkbHkgd2hhdCB5b3Uvd2Ugd2FudD8KPj4+Cj4+Pj4gKyAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+Pgo+Pj4gQWxzbywgaXMgaXQgcmVhbGx5IGFuIGVycm9y
IGlmIHRoZXJlJ3Mgbm8gc3VjaCB0YWJsZT8KPj4KPj4gWW91IGNhbiBvbmx5IGJlIHRoZXJlIGlm
IHRoZSBhcm0tdWFydC5jIGZvdW5kIGFuIFNQQ1IgdGFibGUuIFNvIHRoaXMgaXMKPj4gYSBzYW5p
dHkgY2hlY2suIFRoZXJlZm9yZSBJIHRoaW5rIHRoZSBlcnJvciBtZXNzYWdlIGlzIHdhcnJhbnQg
aGVyZS4KPiAKPiBJZiBzbyAtIGZpbmUuIEJ1dCBmcm9tCj4gCj4gQUNQSV9ERVZJQ0VfU1RBUlQo
YW5zMTY1NTAsICJOUzE2NTUwIFVBUlQiLCBERVZJQ0VfU0VSSUFMKQo+ICAgICAgLmNsYXNzX3R5
cGUgPSBBQ1BJX0RCRzJfMTY1NTBfQ09NUEFUSUJMRSwKPiAgICAgIC5pbml0ID0gbnMxNjU1MF9h
Y3BpX3VhcnRfaW5pdCwKPiBBQ1BJX0RFVklDRV9FTkQKPiAKPiBJIGNhbid0IHNlZSB3aHkgdGhp
cyB3b3VsZCBiZS4gV291bGQgeW91IG1pbmQgZWR1Y2F0aW5nIG1lPwoKVGhlIGJpdHMgeW91IHBh
c3RlZCBvbmx5IHJlZ2lzdGVyIGEgZHJpdmVyIGZvciBhbnkgc2VyaWFsIGRldmljZSB3aXRoIAp0
aGUgY2xhc3MgMTY1NTBfQ09NUEFUSUJMRS4gVGhpcyBpcyB1cCB0byBhbiB1cHBlciBsYXllciB0
byBkZWNpZGUgaG93IApjbGFzc190eXBlIHdpbGwgYmUgaW50ZXJwcmV0ZWQuCgpBcyBJIG1lbnRp
b25lZCBpbiB2MSwgaW4gdGhlIGNhc2Ugb2Ygc2VyaWFsLCB0aGUgY2xhc3NfdHlwZSB3aWxsIGJl
IAptYXRjaGVzIGFnYWluc3QgdGhlIGZpZWxkIGludGVyZmFjZV90eXBlIGluIHRoZSBTUENSIHRh
YmxlLiBUaGlzIGlzIGRvbmUgCmluIHRoZSBmdW5jdGlvbiBhY3BpX3VhcnRfaW5pdCgpLgoKVGhl
IGZ1bmN0aW9uIHdpbGwgdHJ5IHRvIHJldHJpZXZlIHRoZSBTUENSIHRhYmxlLiBJZiB0aGVyZSBp
cyBub25lLCB0aGVuIAppdCB3aWxsIGJhaWwgb3V0LiBPdGhlcndpc2UsIGl0IHdpbGwgY2FsbCB0
aGUgZ2VuZXJpYyBkZXZpY2UgZnJhbWV3b3JrIAp0byBsb29rdXAgZm9yIHRoZSBkcml2ZXIuCgpU
aGVyZWZvcmUgYSBzZXJpYWwgZHJpdmVyIGNhbiBvbmx5IGJlIGNhbGxlZCB3aXRoIHRoZSBTUENS
IHRhYmxlIAphY3R1YWxseSBleGlzdHMuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
