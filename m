Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0466F13C957
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 17:30:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irlWC-0004Ll-C9; Wed, 15 Jan 2020 16:27:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wJf7=3E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1irlWB-0004Lg-97
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 16:27:43 +0000
X-Inumbo-ID: f27c690a-37b3-11ea-85a3-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f27c690a-37b3-11ea-85a3-12813bfff9fa;
 Wed, 15 Jan 2020 16:27:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 08DB4ABF5;
 Wed, 15 Jan 2020 16:27:39 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <39b51904-37d8-f0c0-2ad3-6a0dd7df59d7@suse.com>
 <b68451ec-6594-d4a4-1227-fa3026608122@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0d70e32d-b1ff-8b3e-e6f6-dee52734534f@suse.com>
Date: Wed, 15 Jan 2020 17:27:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <b68451ec-6594-d4a4-1227-fa3026608122@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86: refine link time stub area related
 assertion
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

T24gMTUuMDEuMjAyMCAxNTozNiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxNS8wMS8yMDIw
IDEwOjI2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gV2hpbGUgaXQgaGFzIGJlZW4gbWUgdG8gaW50
cm9kdWNlIHRoaXMsIHRoZSB1c2Ugb2YgfCB0aGVyZSBoYXMgYmVjb21lCj4+IChhbmQgcGVyaGFw
cyB3YXMgZnJvbSB0aGUgdmVyeSBiZWdpbm5pbmcpIG1pc2xlYWRpbmcuIFJhdGhlciB0aGFuCj4+
IGF2b2lkaW5nIHRoZSByaWdodCBzaWRlIG9mIGl0IHdoZW4gbGlua2luZyB0aGUgeGVuLmVmaSBp
bnRlcm1lZGlhdGUgZmlsZQo+PiBhdCBhIGRpZmZlcmVudCBiYXNlIGFkZHJlc3MsIG1ha2UgdGhl
IGV4cHJlc3Npb24gY29wZSB3aXRoIHRoYXQgY2FzZSwKPj4gdGh1cyB2ZXJpZnlpbmcgcGxhY2Vt
ZW50IG9uIGV2ZXJ5IHN0ZXAuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KPiAKPiBBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4gYXMgdGhpcyBpcyBzaW1wbHkgYQo+IHJlYXJyYW5naW5nLCBidXQuLi4K
PiAKPj4KPj4gLS0tIGEveGVuL2FyY2gveDg2L3hlbi5sZHMuUwo+PiArKysgYi94ZW4vYXJjaC94
ODYveGVuLmxkcy5TCj4+IEBAIC0zNTEsOCArMzUxLDggQEAgU0VDVElPTlMKPj4gICAgLmNvbW1l
bnQgMCA6IHsgKiguY29tbWVudCkgfQo+PiAgfQo+PiAgCj4+IC1BU1NFUlQoX19pbWFnZV9iYXNl
X18gPiBYRU5fVklSVF9TVEFSVCB8Cj4+IC0gICAgICAgX18yTV9yd2RhdGFfZW5kIDw9IFhFTl9W
SVJUX0VORCAtIE5SX0NQVVMgKiBQQUdFX1NJWkUsCj4+ICtBU1NFUlQoX18yTV9yd2RhdGFfZW5k
IDw9IFhFTl9WSVJUX0VORCAtIFhFTl9WSVJUX1NUQVJUICsgX19YRU5fVklSVF9TVEFSVCAtCj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgIE5SX0NQVVMgKiBQQUdFX1NJWkUsCj4gCj4gLi4u
IGRvZXNuJ3QgdGhpcyB3YW50IGEgc3R1YnNfcGVyX3BhZ2UgdGVybT/CoCBXZSBkb24ndCBoYXZl
IDRrIHBlciBjcHUuCgpHb29kIHBvaW50IC0gbGV0IG1lIHNlZSBpZiBJIGNhbiBmaXggdGhpcyBh
dCB0aGlzIHNhbWUgb2NjYXNpb24uCkkgZ3Vlc3Mgd2hlbiBpbnRyb2R1Y2luZyB0aGVzZSBwYWdl
cyBJIGhhZCBvbmUgcGVyIENQVSBpbml0aWFsbHksCmFuZCB0aGVuIGZvcmdvdCB0byB1cGRhdGUg
dGhlIGFzc2VydGlvbiBoZXJlIChpdCBiZWluZyB0b28gc3RyaWN0Cm9mIGNvdXJzZSBpcyBiZXR0
ZXIgdGhhbiBpdCBiZWluZyB0b28gbGF4KS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
