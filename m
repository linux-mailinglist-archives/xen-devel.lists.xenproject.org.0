Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACBC14DDBC
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 16:25:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixBeJ-0007M4-AK; Thu, 30 Jan 2020 15:22:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=suiz=3T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ixBeH-0007Lx-O3
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 15:22:29 +0000
X-Inumbo-ID: 53a6e0c2-4374-11ea-8396-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 53a6e0c2-4374-11ea-8396-bc764e2007e4;
 Thu, 30 Jan 2020 15:22:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 52A35AF87;
 Thu, 30 Jan 2020 15:22:28 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <fd03b80e-ff1a-f2c7-20db-4604ad4d0b2f@suse.com>
 <ed4f232e-a413-da76-92f4-a05ef91665df@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5a0c1690-188c-5dcb-efee-8aa5a32ac1fd@suse.com>
Date: Thu, 30 Jan 2020 16:22:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <ed4f232e-a413-da76-92f4-a05ef91665df@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86: fold linker script pre-processing rules
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDEuMjAyMCAxNTo0NywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAzMC8wMS8yMDIw
IDE0OjQ0LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gVGhlcmUncyBubyBuZWVkIHRvIGhhdmUgdHdp
Y2UgYWxtb3N0IHRoZSBzYW1lIHJ1bGUuIFNpbXBseSBhZGQgdGhlIGV4dHJhCj4+IC1ERUZJIHRv
IEFGTEFHUyBmb3IgdGhlIEVGSSB2YXJpYW50LCBhbmQgc3BlY2lmeSBib3RoIHRhcmdldHMgZm9y
IHRoZQo+PiB0aGVuIHNpbmdsZSBydWxlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+Cj4+Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQo+
PiArKysgYi94ZW4vYXJjaC94ODYvTWFrZWZpbGUKPj4gQEAgLTI0MSwxNSArMjQxLDEyIEBAICQo
QkFTRURJUikvaW5jbHVkZS9nZW5lcmF0ZWQvY29uZmlnLmg6IEYKPj4gIAllY2hvICcjZW5kaWYn
ID4+JEAubmV3Cj4+ICAJJChjYWxsIG1vdmUtaWYtY2hhbmdlZCwkQC5uZXcsJEApCj4+ICAKPj4g
LXhlbi5sZHM6IHhlbi5sZHMuUwo+PiAreGVuLmxkcyBlZmkubGRzOiB4ZW4ubGRzLlMKPj4gIAkk
KENDKSAtUCAtRSAtVWkzODYgJChmaWx0ZXItb3V0IC1XYSQoY29tbWEpJSwkKEFGTEFHUykpIC1v
ICRAICQ8Cj4+ICAJc2VkIC1lICdzLy4qXC5sZHNcLm86LyQoQEYpOi9nJyA8LiQoQEYpLmQgPi4k
KEBGKS5kLm5ldwo+PiAgCW12IC1mIC4kKEBGKS5kLm5ldyAuJChARikuZAo+PiAgCj4+IC1lZmku
bGRzOiB4ZW4ubGRzLlMKPj4gLQkkKENDKSAtUCAtRSAtVWkzODYgLURFRkkgJChmaWx0ZXItb3V0
IC1XYSQoY29tbWEpJSwkKEFGTEFHUykpIC1vICRAICQ8Cj4+IC0Jc2VkIC1lICdzLy4qXC5sZHNc
Lm86LyQoQEYpOi9nJyA8LiQoQEYpLmQgPi4kKEBGKS5kLm5ldwo+PiAtCW12IC1mIC4kKEBGKS5k
Lm5ldyAuJChARikuZAo+PiArZWZpLmxkczogQUZMQUdTICs9IC1ERUZJCj4gCj4gSSB0aGluayBp
dCB3b3VsZCBiZSBtb3JlIG5hdHVyYWwgdG8gcmVhZCB3aXRoIHRoaXMgbGluZSBhdCB0aGUgdG9w
LAo+IGFoZWFkIG9mIHRoZSBydWxlOgo+IAo+IGVmaS5sZHM6IEFGTEFHUyArPSAtREVGSQo+IHhl
bi5sZHMgZWZpLmxkczogeGVuLmxkcy5TCj4gwqDCoMKgwqDCoMKgwqAgLi4uCgpJbiBmYWN0IEkg
Zmlyc3Qgd2FudGVkIHRvIGRvIGl0IHRoaXMgd2F5LCB0aGVuIHRob3VnaHQgdGhlIEVGSQpzcGVj
aWFsIGNhc2Ugc2hvdWxkbid0IGNvbWUgZWFybGllciB0aGFuIHRoZSBnZW5lcmFsIG9uZS4gQnV0
CnNpbmNlIHlvdSBhc2sgZm9yIGl0IC4uLgoKPiBFaXRoZXIgd2F5LCBBY2tlZC1ieTogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClRoYW5rcy4KCkphbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
