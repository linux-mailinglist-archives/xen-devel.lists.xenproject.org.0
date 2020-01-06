Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9971B131152
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 12:20:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioQOU-00023Z-9X; Mon, 06 Jan 2020 11:17:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ioQOS-00023U-IU
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 11:17:56 +0000
X-Inumbo-ID: 2aa1d346-3076-11ea-b6f1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2aa1d346-3076-11ea-b6f1-bc764e2007e4;
 Mon, 06 Jan 2020 11:17:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 50705AA35;
 Mon,  6 Jan 2020 11:17:46 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <20200104010759.GA2507@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b40c6f0d-374e-b771-1463-74c40bf4a340@suse.com>
Date: Mon, 6 Jan 2020 12:18:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200104010759.GA2507@mail-itl>
Content-Language: en-US
Subject: Re: [Xen-devel] Broken PCI device passthrough, after XSA-302 fix?
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDEuMjAyMCAwMjowNywgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICB3cm90ZToK
PiBJIGhhdmUgYSBtdWx0aS1mdW5jdGlvbiBQQ0kgZGV2aWNlLCBiZWhpbmQgYSBQQ0kgYnJpZGdl
LCB0aGF0IG5vcm1hbGx5Cj4gSSBhc3NpZ24gdG8gYSBzaW5nbGUgZG9tYWluLiBCdXQgbm93IGl0
IGZhaWxzIHdpdGg6Cj4gCj4gKFhFTikgW1ZULURdZDE0OiAwMDAwOjA0OjAwLjAgb3duZWQgYnkg
ZDAhPEc+PDA+YXNzaWduIDAwMDA6MDU6MDAuMCB0byBkb20xNCBmYWlsZWQgKC0yMikKCklzIHRo
aXMgb24gdGhlIDFzdCBhdHRlbXB0LCBvciBhZnRlciB0aGUgZGV2aWNlIGhhZCBhbHJlYWR5IGJl
ZW4KYXNzaWduZWQgdG8gc29tZSAoc2FtZSBvciBvdGhlcikgZ3Vlc3Q/IEFmdGVyIHF1aXRlIGEg
Yml0IG9mCnN0YXJpbmcgYXQgdGhlIGNvZGUgSSBjYW4ndCBzZWVtIHRvIGJlIGFibGUgdG8gc3Bv
dCBhIGRpZmZlcmVuY2UKaW4gYmVoYXZpb3IgZm9yIHRoZSAxc3QgYXR0ZW1wdCwgYnV0IHlvdSBu
b3Qgc2F5aW5nIGV4cGxpY2l0bHkKdGhhdCBpdCB3b3VsZCBvbmx5IGhhcHBlbiBvbiBzdWJzZXF1
ZW50IG9uZXMgbWFrZXMgbWUgYXNzdW1lIHlvdQpydW4gaW50byB0aGUgaXNzdWUgcmlnaHQgYXdh
eS4KCj4gVGhpcyBpcyBYZW4gNC44LjUgKyBYU0EgcGF0Y2hlcy4gSXQgc3RhcnRlZCBoYXBwZW5p
bmcgYWZ0ZXIgc29tZSB1cGRhdGUKPiBkdXJpbmcgbGFzdCBmZXcgbW9udGhzLCBub3QgcmVhbGx5
IHN1cmUgd2hpY2ggb25lLgoKSGF2aW5nIGEgc21hbGxlciB3aW5kb3cgd291bGQgb2YgY291cnNl
IGhlbHAsIGFzIHdvdWxkIC4uLgoKPiBJIGd1ZXNzIGl0IGlzIGJlY2F1c2UgcXVhcmFudGluZSBm
ZWF0dXJlLCBzbyBpbml0aWFsIG93bmVyc2hpcCBvZgo+IDAwMDA6MDU6MDAuMCBpcyBkaWZmZXJl
bnQgdGhhbiB0aGUgYnJpZGdlIGl0IGlzIGNvbm5lY3RlZCB0by4KPiBJJ20gbm90IHN1cmUgaWYg
cmVsZXZhbnQgZm9yIHRoaXMgY2FzZSwgYnV0IEkgYWxzbyBzZXQKPiBwY2lkZXYtPnJkbV9wb2xp
Y3kgPSBMSUJYTF9SRE1fUkVTRVJWRV9QT0xJQ1lfUkVMQVhFRC4KPiAKPiBCb290aW5nIHdpdGgg
aW9tbXU9bm8tcXVhcmFudGluZSBoZWxwcy4gTm90ZSBJIGRvIG5vdCB1c2UgYHhsCj4gcGNpLWFz
c2lnbmFibGUtYWRkYCBjb21tYW5kLCBvbmx5IGJpbmQgdGhlIGRldmljZSB0byB0aGUgcGNpYmFj
ayBkcml2ZXIKPiBpbiBkb20wLgoKLi4uIGtub3dpbmcgd2hldGhlciBiZWhhdmlvciBkaWZmZXJz
IHdoZW4gdXNpbmcgdGhpcyBwcmVwYXJhdG9yeQpzdGVwLgoKSmFuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
