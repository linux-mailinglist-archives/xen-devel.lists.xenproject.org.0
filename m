Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAE887A87
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 14:52:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw4Lb-0005Ta-9Z; Fri, 09 Aug 2019 12:50:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hw4LZ-0005TS-Pu
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 12:50:17 +0000
X-Inumbo-ID: 3bf70fbe-baa4-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3bf70fbe-baa4-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 12:50:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 13A97AF79;
 Fri,  9 Aug 2019 12:50:15 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <a9651ce7-bdd2-ac6d-6670-0abbe4442b14@suse.com>
 <20190809123927.29751-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cf80bbdd-bddb-fb8f-f49b-1ef205422f67@suse.com>
Date: Fri, 9 Aug 2019 14:50:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809123927.29751-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/2] x86/desc: Drop __HYPERVISOR_CS32
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDguMjAxOSAxNDozOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBYZW4sIGJlaW5nIDY0
Yml0IG9ubHkgdGhlc2UgZGF5cywgaGFzIG5vIHVzZSBmb3IgYSAzMmJpdCBSaW5nIDAgY29kZSBz
ZWdtZW50Lgo+IAo+IERlbGV0ZSBfX0hZUEVSVklTT1JfQ1MzMiBhbmQgcmVtb3ZlIGl0IGZyb20g
dGhlIEdEVHMuICBBbHNvIGRlbGV0ZQo+IF9fSFlQRVJWSVNPUl9DUzY0IGFuZCB1c2UgX19IWVBF
UlZJU09SX0NTIHVuaWZvcm1seS4KCkxvbmcsIGxvbmcgYWdvIHdlJ3ZlIGJlZW4gY29uc2lkZXJp
bmcgZG9pbmcgdGhpcy4gQWdyZWVkLApub3RoaW5nIGhhcyBzdXJmYWNlZCB0byBhY3R1YWxseSB1
c2UgaXQsIGJ1dCBJIHdvdWxkbid0CnN1YnNjcmliZSB0byAiaGFzIG5vIHVzZSI6IFdlIHdpbGwg
bmVlZCBpdCBpZiB3ZSBldmVyIHdhbnQKdG8gYmUgYWJsZSB0byBydW4gb24gMzItYml0IEVGSSBf
YW5kXyBpbnZva2UgcnVudGltZQpzZXJ2aWNlcyB0aGVyZS4gQmFjayB0aGVuIHRocm91Z2ggdGhl
IGNvbnNpZGVyYXRpb24gYWdhaW5zdApkcm9wcGluZyBpdCB3YXMgdGhhdCB3ZSBtYXkgd2FudCB0
byBpbnZva2UgMzItYml0IEJJT1MKc2VydmljZXMgKFBDSSwgVkdBKSBmcm9tIHRoZSBoeXBlcnZp
c29yLgoKT2YgY291cnNlIGl0IHdvdWxkbid0IGJlIHRlcnJpYmx5IGRpZmZpY3VsdCB0byByZS1p
bnN0YXRlCnRoZXNlIHNlbGVjdG9ycyAvIGRlc2NyaXB0b3JzLCBidXQgc3RpbGwuIE5ldmVydGhl
bGVzcywgaWYKeW91J3JlIGNvbnZpbmNlZCBvZiB0aGUgbW92ZSBkZXNwaXRlIHRoZSByZW1hcmtz
IGFib3ZlIC4uLgoKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
CkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
