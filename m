Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8428118C9B
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 16:35:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iehW3-0001cP-RT; Tue, 10 Dec 2019 15:33:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1mH3=2A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iehW2-0001cK-BV
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 15:33:34 +0000
X-Inumbo-ID: 6ca7e3d0-1b62-11ea-b6f1-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6ca7e3d0-1b62-11ea-b6f1-bc764e2007e4;
 Tue, 10 Dec 2019 15:33:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 89C6AAF11;
 Tue, 10 Dec 2019 15:33:32 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20191025091618.10153-1-liuwe@microsoft.com>
 <20191025091618.10153-2-liuwe@microsoft.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <97016273-46d8-423d-8eef-f448f2d04845@suse.com>
Date: Tue, 10 Dec 2019 16:33:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191025091618.10153-2-liuwe@microsoft.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-next 1/7] x86: import hyperv-tlfs.h from
 Linux
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
Cc: Wei Liu <liuwe@microsoft.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMTAuMjAxOSAxMToxNiwgV2VpIExpdSB3cm90ZToKPiBUYWtlbiBmcm9tIExpbnV4IGNv
bW1pdCBiMmQ4YjE2N2UxNWJiNWVjMjY5MWQxMTE5YzAyNTYzMGEyNDdmNjQ5Lgo+IAo+IFRoaXMg
aXMgYSBwcmlzdGluZSBjb3B5IGZyb20gTGludXguIEl0IGlzIG5vdCB1c2VkIHlldCBhbmQgcHJv
YmFibHkKPiBkb2Vzbid0IGNvbXBpbGUuIENoYW5nZXMgdG8gbWFrZSBpdCB3b3JrIHdpbGwgY29t
ZSBsYXRlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29t
PgoKVGhpcyBjb21pbmcgZnJvbSBMaW51eCBhbmQgYXNzdW1pbmcgYXQgbGVhc3QgYSBmYWlyIHBh
cnQgb2YgaXQgaXMKZ29pbmcgdG8gYmUgdXNlZCwgaW4gcHJpbmNpcGxlCkFja2VkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpIb3dldmVyLCB0aGVyZSBhcmUgbWFueSBzZWVt
aW5nbHkgdW5uZWNlc3NhcnkgdXNlcyBvZiBfX3BhY2tlZApoZXJlLCB3aGljaCBJJ2QgcmF0aGVy
IG5vdCBzZWUgZ28gaW4gYXQgYWxsIChpLmUuIG5vdCBiZSBkcm9wcGVkCmxhdGVyIG9uLCBhbmQg
dGhlbiBwb3RlbnRpYWxseSBtaXNzaW5nIHNvbWUpLiBJIGZpbmQgLi4uCgo+ICt0eXBlZGVmIHN0
cnVjdCBfSFZfUkVGRVJFTkNFX1RTQ19QQUdFIHsKPiArCV9fdTMyIHRzY19zZXF1ZW5jZTsKPiAr
CV9fdTMyIHJlczE7Cj4gKwlfX3U2NCB0c2Nfc2NhbGU7Cj4gKwlfX3M2NCB0c2Nfb2Zmc2V0Owo+
ICt9ICBfX3BhY2tlZCBIVl9SRUZFUkVOQ0VfVFNDX1BBR0UsICpQSFZfUkVGRVJFTkNFX1RTQ19Q
QUdFOwoKLi4gdGhpcyBvbmUgcGFydGljdWxhcmx5IHN1c3BpY2lvdXM6IEkgZG9uJ3QgdGhpbmsg
aXQgaXMgd2VsbApkZWZpbmVkIGZvciBfX3BhY2tlZCB0byBhbHNvIGFwcGx5IHRvIHRoZSB0eXBl
ClBIVl9SRUZFUkVOQ0VfVFNDX1BBR0UgcG9pbnRzIHRvIChhbmQgSSBzdXNwZWN0IGl0IGRvZXNu
J3QpLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
