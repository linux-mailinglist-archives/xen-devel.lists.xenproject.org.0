Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E595E182BC3
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 10:02:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCJh1-0008FY-8P; Thu, 12 Mar 2020 08:59:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7iz2=45=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jCJgz-0008FT-RE
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 08:59:49 +0000
X-Inumbo-ID: d39649da-643f-11ea-b34e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d39649da-643f-11ea-b34e-bc764e2007e4;
 Thu, 12 Mar 2020 08:59:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8CDE1AC2D;
 Thu, 12 Mar 2020 08:59:47 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <8a151dd0-d083-d242-566c-f1faee084ae2@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <658ef23d-f6e1-dbf8-8805-b84e32ffb6fa@suse.com>
Date: Thu, 12 Mar 2020 09:59:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <8a151dd0-d083-d242-566c-f1faee084ae2@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] nvmx deadlock with MSR bitmaps
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDMuMjAyMCAxOTowNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBTcGVjaWZpY2FsbHks
IHRoaXMgaXMgYSBzd2l0Y2ggZnJvbSBhbiBIVk0gdmNwdSwgdG8gYSBQViB2Y3B1LCB3aGVyZSB0
aGUKPiBtYXBjYWNoZSBjb2RlIHRyaWVzIHRvIGFjY2VzcyB0aGUgcGVyLWRvbWFpbiBtYXBwaW5n
cyBvbiB0aGUgSFZNIG1vbml0b3IKPiB0YWJsZS7CoCBJdCBlbmRzIHVwIHRyeWluZyB0byByZWN1
cnNpdmVseSBhY3F1aXJlIHRoZSBtYXBjYWNoZSBsb2NrIHdoaWxlCj4gdHJ5aW5nIHRvIHdhbGsg
JWNyMiB0byBpZGVudGlmeSB0aGUgc291cmNlIG9mIHRoZSBmYXVsdC4KPiAKPiBGb3IgbnZteC0+
bXNyX21lcmdlZCwgdGhpcyBuZWVkcyB0byBlaXRoZXIgYmUgYSB4ZW5oZWFwIHBhZ2UsIG9yIGEK
PiBnbG9iYWxseSBtYXBwZWQgZG9taGVhcCBwYWdlLsKgIEknbGwgZHJhZnQgYSBwYXRjaCBpbiBh
IG1vbWVudC4KPiAKPiBGb3IgbWFwX2RvbWFpbl9wYWdlKCksIGlzIHRoZXJlIGFueXRoaW5nIHdl
IGNhbiByYXRpb25hbGx5IGRvIHRvIGFzc2VydAo+IHRoYXQgaXQgaXNuJ3QgY2FsbGVkIGluIHRo
ZSBtaWRkbGUgb2YgYSBjb250ZXh0IHN3aXRjaD/CoCBUaGlzIGlzIHRoZQo+IGtpbmQgb2YgdGhp
bmcgd2hpY2ggbmVlZHMgdG8gYmxvdyB1cCByZWxpYWJseSBpbiBhIGRlYnVnIGJ1aWxkLgoKV2Vs
bCwgaXQncyBub3QgaW5oZXJlbnRseSB1bnNhZmUgdG8gZG8sIGl0J3MganVzdCB0aGF0Cm1hcGNh
Y2hlX2N1cnJlbnRfdmNwdSgpIHdvdWxkIG5lZWQgdG8gYXZvaWQgdXNpbmcgY3VycmVudCBmcm9t
CmNvbnRleHRfc3dpdGNoKCkncyBjYWxsIHRvIHNldF9jdXJyZW50KCkgdGhyb3VnaCB0bwpfX2Nv
bnRleHRfc3dpdGNoKCkncyBjYWxsIHRvIHdyaXRlX3B0YmFzZSgpLiBBIHBvc3NpYmxlCmRldGVj
dGlvbiAoaWYgd2UgZG9uJ3Qgd2FudCB0byBtYWtlIHRoZSBjYXNlIHdvcmspIHdvdWxkCnNlZW0g
dG8gYmUgQVNTRVJUKGN1cnJlbnQgPT0gdGhpc19jcHUoY3Vycl92Y3B1KSkuIEJ1dCBvZiBjb3Vy
c2UKdGhlcmUncyBhbHNvIHRoaXMgZXh0cmEgbG9naWMgaW4gbWFwY2FjaGVfY3VycmVudF92Y3B1
KCkgdG8gZGVhbAp3aXRoIGEgUFYgdkNQVSBoYXZpbmcgYSBudWxsIHYtPmFyY2guZ3Vlc3RfdGFi
bGUsIHdoaWNoIEknbSBvbmNlCmFnYWluIHN0cnVnZ2xpbmcgdG8gc2VlIHVuZGVyIHdoYXQgY29u
ZGl0aW9ucyBpdCBtaWdodCBoYXBwZW4uClRoZSBEb20wIGJ1aWxkaW5nIGNhc2UgY2FuJ3QgYmUg
bWVhbnQgd2l0aCB0aGVyZSBiZWluZwptYXBjYWNoZV9vdmVycmlkZV9jdXJyZW50KCkgb24gdGhh
dCBwYXRoLiBJJ20gd29uZGVyaW5nIGlmIHRoZQpjb21tZW50IHRoZXJlIGlzIG1pc2xlYWRpbmcg
YW5kIGl0J3MgcmVhbGx5IHRvIGNvdmVyIHRoZSBjYXNlCndoZXJlLCBjb21pbmcgZnJvbSBhIFBW
IHZDUFUsIGN1cnJlbnQgd2FzIGFscmVhZHkgc2V0IHRvIHRoZQppZGxlIHZDUFUgYnkgY29udGV4
dF9zd2l0Y2goKSAod2hpY2ggd291bGQgaGF2ZSBhIG51bGwKdi0+YXJjaC5ndWVzdF90YWJsZSkg
LSBJIHdvdWxkbid0IGNhbGwgdGhpcyAid2UgYXJlIHJ1bm5pbmcgYQpwYXJhdmlydHVhbGlzZWQg
Z3Vlc3QiLiBCdXQgaW4gc3VjaCBhIGNhc2UgdGhlIGxvZ2ljIGhlcmUgd291bGQKc2ltcGx5IGJl
IGEgKHRvbykgc3BlY2lhbCBjYXNlIG9mIHdoYXQgeW91J3JlIGRlc2NyaWJpbmcgYXMgdGhlCmlz
c3VlIHdpdGggblZNWC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
