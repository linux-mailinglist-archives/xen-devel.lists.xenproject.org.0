Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17586F8ABC
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 09:38:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iURe9-0007DI-S5; Tue, 12 Nov 2019 08:35:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CoZ6=ZE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iURe8-0007DD-Hw
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 08:35:32 +0000
X-Inumbo-ID: 626a4256-0527-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 626a4256-0527-11ea-9631-bc764e2007e4;
 Tue, 12 Nov 2019 08:35:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 92D39B48D;
 Tue, 12 Nov 2019 08:35:29 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191111202443.7154-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ac802294-a1c6-d6cc-8684-2f50248d85ea@suse.com>
Date: Tue, 12 Nov 2019 09:35:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191111202443.7154-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] xen: Drop bogus BOOLEAN
 definitions, TRUE and FALSE
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
Cc: Juergen Gross <jgross@suse.com>, StefanoStabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMTEuMjAxOSAyMToyNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiAtLS0gYS94ZW4vYXJj
aC94ODYveDg2XzY0L21tLmMKPiArKysgYi94ZW4vYXJjaC94ODYveDg2XzY0L21tLmMKPiBAQCAt
MTA3Nyw3ICsxMDc3LDcgQEAgbG9uZyBkb19zZXRfc2VnbWVudF9iYXNlKHVuc2lnbmVkIGludCB3
aGljaCwgdW5zaWduZWQgbG9uZyBiYXNlKQo+ICB9Cj4gIAo+ICAKPiAtLyogUmV0dXJucyBUUlVF
IGlmIGdpdmVuIGRlc2NyaXB0b3IgaXMgdmFsaWQgZm9yIEdEVCBvciBMRFQuICovCj4gKy8qIFJl
dHVybnMgdHJ1ZSBpZiBnaXZlbiBkZXNjcmlwdG9yIGlzIHZhbGlkIGZvciBHRFQgb3IgTERULiAq
Lwo+ICBpbnQgY2hlY2tfZGVzY3JpcHRvcihjb25zdCBzdHJ1Y3QgZG9tYWluICpkb20sIHNlZ19k
ZXNjX3QgKmQpCgpXb3VsZG4ndCBjaGFuZ2VzIGxpa2UgdGhpcyBvbmUgYmV0dGVyIGJlIGFjY29t
cGFuaWVkIGJ5IGFsc28gYWRqdXN0aW5nCnRoZSByZXR1cm4gdHlwZSBvZiB0aGUgZnVuY3Rpb24g
KHRoZXJlIGFyZSBtb3JlIGV4YW1wbGVzIGZ1cnRoZXIgZG93bgppbiBjb21tb24vdGltZXIuYyk/
Cgo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vYXJtNjQvZWZpYmluZC5oCj4gKysrIGIveGVu
L2luY2x1ZGUvYXNtLWFybS9hcm02NC9lZmliaW5kLmgKPiBAQCAtMTA3LDcgKzEwNyw3IEBAIHR5
cGVkZWYgdWludDY0X3QgICBVSU5UTjsKPiAgI2RlZmluZSBQT1NUX0NPREUoX0RhdGEpCj4gIAo+
ICAKPiAtI2RlZmluZSBCUkVBS1BPSU5UKCkgICAgICAgIHdoaWxlIChUUlVFKTsgICAgLy8gTWFr
ZSBpdCBoYW5nIG9uIEJpb3NbRGJnXTMyCj4gKyNkZWZpbmUgQlJFQUtQT0lOVCgpICAgICAgICB3
aGlsZSAodHJ1ZSk7ICAgIC8vIE1ha2UgaXQgaGFuZyBvbiBCaW9zW0RiZ10zMgoKWW91IGRvIHJl
YWxpemUgdGhhdCB0aGlzIGFuZCBvdGhlciBFRkkgaGVhZGVycyAoYW5kIHBlcmhhcHMgYWxzbwpB
Q1BJIG9uZXMpIGFyZSBsYXJnZWx5IHZlcmJhdGltIGltcG9ydHMgZnJvbSBvdGhlciBwcm9qZWN0
cywKdXBkYXRpbmcgb2Ygd2hpY2ggd2lsbCBiZWNvbWUgbGVzcyBzdHJhaWdodGZvcndhcmQgYnkg
c3VjaApyZXBsYWNlbWVudHM/IFdoZW4gcHVsbGluZyBpbiB0aGUgRUZJIG9uZXMgSSBpbnRlbnRp
b25hbGx5IGRpZCBub3QKZmlkZGxlIHdpdGggdGhlbSBtb3JlIHRoYW4gYWJzb2x1dGVseSBuZWNl
c3NhcnkuCgpJZiBpdCB3YXNuJ3QgZm9yIHRoaXMsIEknZCBoYXZlIGFjay1lZCB0aGUgcGF0Y2gg
ZGVzcGl0ZSB0aGUgb3RoZXIKcmVtYXJrIGFib3ZlLgoKPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4v
bW0uaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9tbS5oCj4gQEAgLTYwNyw3ICs2MDcsNyBAQCBp
bnQgX19tdXN0X2NoZWNrIGRvbmF0ZV9wYWdlKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBwYWdl
X2luZm8gKnBhZ2UsCj4gICNkZWZpbmUgUkFNX1RZUEVfVU5VU0FCTEUgICAgIDB4MDAwMDAwMDQK
PiAgI2RlZmluZSBSQU1fVFlQRV9BQ1BJICAgICAgICAgMHgwMDAwMDAwOAo+ICAjZGVmaW5lIFJB
TV9UWVBFX1VOS05PV04gICAgICAweDAwMDAwMDEwCj4gLS8qIFRSVUUgaWYgdGhlIHdob2xlIHBh
Z2UgYXQgQG1mbiBpcyBvZiB0aGUgcmVxdWVzdGVkIFJBTSB0eXBlKHMpIGFib3ZlLiAqLwo+ICsv
KiB0cnVlIGlmIHRoZSB3aG9sZSBwYWdlIGF0IEBtZm4gaXMgb2YgdGhlIHJlcXVlc3RlZCBSQU0g
dHlwZShzKSBhYm92ZS4gKi8KPiAgaW50IHBhZ2VfaXNfcmFtX3R5cGUodW5zaWduZWQgbG9uZyBt
Zm4sIHVuc2lnbmVkIGxvbmcgbWVtX3R5cGUpOwoKSW4gb3RoZXIgY29tbWVudHMgSSBhbHJlYWR5
IHdhc24ndCBzdXJlIGFib3V0IHN1Y2ggcmVwbGFjZW1lbnRzLCBidXQKbGV0IHRoZW0gYmUuIEhl
cmUsIGhvd2V2ZXIsIHlvdSB2aW9sYXRlIGNvZGluZyBzdHlsZSBieSB1c2luZyAidHJ1ZSIKaW5z
dGVhZCBvZiAiVHJ1ZSIgKHRoZSBmdW5jdGlvbiByZXR1cm5pbmcgImludCIgZm9yIG5vdyBkb2Vz
bid0IGV2ZW4KYWxsb3cgdGhlIGV4Y3VzZSBvZiBtZWFuaW5nIHRoZSBpZGVudGlmaWVyIHJhdGhl
ciB0aGFuIHRoZSB3b3JkKS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
