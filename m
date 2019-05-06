Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F798145BD
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 10:07:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNYcI-0005rt-LT; Mon, 06 May 2019 08:04:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XZcu=TG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hNYcH-0005ro-AI
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 08:04:53 +0000
X-Inumbo-ID: 9b9d4998-6fd5-11e9-ba9d-8363270e54e8
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9b9d4998-6fd5-11e9-ba9d-8363270e54e8;
 Mon, 06 May 2019 08:04:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A65A0AE56;
 Mon,  6 May 2019 08:04:43 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <20190505132740.GT1728@mail-itl>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <a4435002-24ef-9565-f1fb-3de6c54b1fe7@suse.com>
Date: Mon, 6 May 2019 10:04:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190505132740.GT1728@mail-itl>
Content-Language: de-DE
Subject: Re: [Xen-devel] {xen,
 dom0}_vga_console_info.u.vesa_lfb.lfb_base field too small
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUvMDUvMjAxOSAxNToyNywgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOgo+
IEhpLAo+IAo+IEkgaGF2ZSBhIG1hY2hpbmUgdGhhdCBhbGxvY2F0ZSB2ZXNhIExGQiBhYm92ZSA0
R0IsIGFzIHJlcG9ydGVkIGJ5IFVFRkkKPiBHT1AuIEF0IDB4NDAwMDAwMDAwMCB0byBiZSBzcGVj
aWZpYy4KPiB2Z2FfY29uc29sZV9pbmZvLnUudmVzYV9sZmIubGZiX2Jhc2UgaXMgYSAzMmJpdCBm
aWVsZCwgc28gaXQgZ2V0cwo+IHRydW5jYXRlZCwgbGVhZGluZyB0byBhbGwga2luZCBvZiBtZW1v
cnkgY29ycnVwdGlvbnMgd2hlbiBzb21ldGhpbmcKPiB3cml0ZXMgdGhlcmUuCj4gSWYgdGhhdCB3
b3VsZCBiZSBvbmx5IGFib3V0IFhlbiwgdGhhdCB3b3VsZG4ndCBiZSB0aGF0IGJhZCwgYnV0Cj4g
dW5mb3J0dW5hdGVseSBleGFjdGx5IHRoZSBzYW1lIHN0cnVjdHVyZSBpcyB1c2VkIGFzIGFuIGlu
dGVyZmFjZSBmb3IKPiBkb20wIHN0YXJ0IGluZm8gKGF0IGxlYXN0IFBWIG9uZSkuCj4gTXkgb25s
eSBpZGVhIGlzIHRvIGludHJvZHVjZSB5ZXQgYW5vdGhlciBlbnRyeSBpbiAqX3ZnYV9jb25zb2xl
X2luZm8udQo+IHVuaW9uIChlZmlfbGZiNjQ/KSB3aXRoIGEgNjRiaXQgbGZiX2Jhc2UgZmllbGQu
IEFuZCBtYXJrIGl0IGluCj4gdmlkZW9fdHlwZSAoWEVOX1ZHQVRZUEVfRUZJX0xGQjY0PykuIEJ1
dCBJJ20gbm90IHN1cmUgaG93IG5vbi1wYXRjaGVkCj4gTGludXggKG9yIG90aGVyIHN1cHBvcnRl
ZCBPU2VzKSB3b3VsZCByZXNwb25kIHRvIHRoaXMuIHhlbl9pbml0X3ZnYSgpIGluCj4gTGludXgg
ZG9lc24ndCBzZWVtIHRvIGJhaWwgb24gdW5rbm93biB2aWRlb190eXBlLCBzbyBpdCBtYXkgYmUg
ZnJhZ2lsZS4KPiAKPiBBbnkgYmV0dGVyIGlkZWFzPwoKSW4gTGludXgga2VybmVsIHRoZSBzY3Jl
ZW5faW5mbyBzdHJ1Y3R1cmUgaGFzIGV4dF9sZmJfYmFzZSBmb3IgdGhhdApwdXJwb3NlIChpdCBj
b250YWlucyB0aGUgdXBwZXIgMzIgYml0cyBvZiBsZmJfYmFzZSkuCgpXZSBjb3VsZCBhZGQgYSBz
aW1pbGFyIG1lbWJlciB0byBYZW4ncyBkb20wX3ZnYV9jb25zb2xlX2luZm8udS52ZXNhX2xmYgph
bmQgbGV0IHRoZSBrZXJuZWwgZGV0ZWN0IGl0cyBwcmVzZW5jZSBieSB1c2luZyB0aGUgdmFsdWUg
b2YKc3RhcnRfaW5mby5jb25zb2xlLmRvbTAuaW5mb19zaXplIC0gdGhpcyB3b3VsZG4ndCByZXF1
aXJlIGEgbmV3IHZpZGVvCnR5cGUgYW5kIG9sZCBrZXJuZWxzIHdvdWxkIHJ1biBhcyB0b2RheS4g
VGhlIHNhbWUgc2NoZW1lIGlzIHVzZWQgZm9yCmdibF9jYXBzIGFuZCBtb2RlX2F0dHJzIGFscmVh
ZHkuCgpSZWxlYXRlZCB0byB0aGF0OiBJIGFzc3VtZSB0aGUgY29tbWVudCBpbiB4ZW4uaCByZWdh
cmRpbmcgbGZiX2Jhc2UgYW5kCmxmYl9zaXplIGJlaW5nIGluIHVuaXRzIG9mIDY0a0IgaXMgd3Jv
bmcgYW5kIHNob3VsZCBiZSByZW1vdmVkPwoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
