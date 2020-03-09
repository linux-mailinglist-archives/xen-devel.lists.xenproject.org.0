Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4BA17E27E
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 15:25:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBJIv-0007oM-Sm; Mon, 09 Mar 2020 14:22:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=k1Ob=42=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBJIu-0007oH-Jo
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 14:22:48 +0000
X-Inumbo-ID: 72f4f4ee-6211-11ea-90c4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 72f4f4ee-6211-11ea-90c4-bc764e2007e4;
 Mon, 09 Mar 2020 14:22:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6D160B2CE;
 Mon,  9 Mar 2020 14:22:46 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <e0b6b003-18c6-56a0-f791-1ebd4172f5fc@suse.com>
 <22a7eb01-deb6-4b05-28b4-6e24a3869636@suse.com>
 <1485d0a8-6b55-f7f5-b0f0-a85f63bf4555@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dafc7f7f-188c-a0e4-ad3f-af34a73c713b@suse.com>
Date: Mon, 9 Mar 2020 15:22:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1485d0a8-6b55-f7f5-b0f0-a85f63bf4555@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/9] x86/HVM: reduce domain.h include
 dependencies
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
 Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDMuMjAyMCAxNDozMywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwOS8wMy8yMDIw
IDEyOjA2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gRHJvcCAjaW5jbHVkZS1zIG5vdCBuZWVkZWQg
YnkgdGhlIGhlYWRlciBpdHNlbGYuIFB1dCB0aGUgb25lcyBuZWVkZWQKPj4gaW50byB3aGljaGV2
ZXIgb3RoZXIgZmlsZXMgYWN0dWFsbHkgbmVlZCB0aGVtLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gSGF2aW5nIGF0dGVtcHRlZCB0byBj
b21waWxlIHRoaXMgbXlzZWxmLCB5b3UncmUgYXQgYSBtaW5pbXVtIG1pc3NpbmcKPiBGbGFzaywg
dmlyaWRpYW4sIGdlbmVyYWwgSFZNIChiZWNhdXNlIEkgY2FuJ3Qgc3BvdCBhbnkgb3RoZXIgd2F5
IGRtLmMKPiB3b3VsZG4ndCBiZSBjb21waWxlZCksIHhlbiBndWVzdCBhbmQgc2hpbS4KClNvIG90
aGVyIHRoYW4gSSBmaXJzdCB1bmRlcnN0b29kIChpbiBwYXJ0aWN1bGFyIGJlY2F1c2UgeW91CnNw
ZWNpZmljYWxseSBtZW50aW9uIGRtLmMgYW5kIGl0IHBvdGVudGlhbGx5IG5vdCBnZXR0aW5nIGJ1
aWx0IGluCndoYXRldmVyIFtzdHJhbmdlXSBjb25maWcgeW91IG1heSBoYXZlIHN1c3BlY3QgSSBk
aWQgdXNlKSB0aGlzCmxvb2tzIHRvIGJlIGZhbGxvdXQgZnJvbSBhbGwgdGhlIHNhbWUgKFhTTS1l
bmFibGVkKSBidWlsZCwgYXMgSQpjYW4gc2VlIHRoYXQgdG9vLiBUaGUgaXNzdWVzLCBhZmFpY3Mg
Zm9yIG5vdywgYWxsIHN0ZW0gZnJvbSB0aGUKZmFjdCB0aGF0IGR1bW15LmggaW5jbHVkZSBwdWJs
aWMvaHZtL3BhcmFtcy5oLCBidXQgd2l0aCBYU00KZW5hYmxlZCB0aGVyZSdzIG5vIG90aGVyIHBs
YWNlIHRoaXMgaW5jbHVzaW9uIHdvdWxkIG5vdyBjb21lIGZyb20uClByZXR0eSBmcmFnaWxlLCBi
dXQgZml4YWJsZS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
