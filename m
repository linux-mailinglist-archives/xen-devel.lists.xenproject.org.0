Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AF4131293
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 14:07:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioS4i-0003sy-P3; Mon, 06 Jan 2020 13:05:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ioS4g-0003st-LW
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 13:05:38 +0000
X-Inumbo-ID: 365f1a86-3085-11ea-a1e1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 365f1a86-3085-11ea-a1e1-bc764e2007e4;
 Mon, 06 Jan 2020 13:05:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AA507AC50;
 Mon,  6 Jan 2020 13:05:28 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <20200104010759.GA2507@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ee338bbe-647e-36c9-a22e-8a082f97b08c@suse.com>
Date: Mon, 6 Jan 2020 14:06:14 +0100
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
ZDAhPEc+PDA+YXNzaWduIDAwMDA6MDU6MDAuMCB0byBkb20xNCBmYWlsZWQgKC0yMikKCkkndmUg
dHJpZWQgdGhpcyBvdXQgaW4gYXMgY2xvc2UgYSBzZXR1cCBhcyBJIGNvdWxkIGFycmFuZ2UgZm9y
LCBidXQKbm90IG9uZSBtYXRjaGluZyB5b3VyIHNjZW5hcmlvLiBJIGRpZG4ndCBmaW5kIGEgc3lz
dGVtIHdpdGggYQpzdWl0YWJseSBwbGFjZWQgKGluIHRoZSB0b3BvbG9neSkgbXVsdGktZnVuY3Rp
b24gZGV2aWNlIChoYWQgdG8gdXNlCmEgc2luZ2xlLWZ1bmN0aW9uIG9uZSksIGFuZCBvZiBjb3Vy
c2UgSSBkaWQgdGhpcyBvbiAoY2xvc2UgdG8pCm1hc3Rlci4gTm8gYW5vbWFsaWVzLiBIZW5jZSBJ
IHdvbmRlciB3aGV0aGVyIGVpdGhlciBvZiB0aGUgdHdvCmRpZmZlcmVuY2VzIG1lbnRpb25lZCBt
YXR0ZXJzLCBhbmQgLSBpZiwgYXMgSSBzdXNwZWN0LCBpdCdzIHRoZQptdWx0aS1mdW5jdGlvbiBh
c3BlY3QgdGhhdCBpcyByZWxldmFudCBoZXJlIC0gaG93IHRoaW5ncyB3b3VsZCBoYXZlCndvcmtl
ZCBhdCBhbGwgYmVmb3JlIHRob3NlIHJlY2VudCBjaGFuZ2VzLiBUaGlzIGlzIGJlY2F1c2UgSSB0
aGluawp5b3Ugc2hvdWxkIGhhdmUgaGl0IHRoZSBzYW1lIGVycm9yIHBhdGggZXZlbiBiZWZvcmUs
IGFuZCBpdCB3b3VsZApzZWVtIHRvIG1lIHRoYXQgdGhlIHBhdGNoIGJlbG93IG1pZ2h0IGJlIChh
bmQgaGF2ZSBiZWVuKSBuZWVkZWQuCgpKYW4KCi0tLSB1bnN0YWJsZS5vcmlnL3hlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jCisrKyB1bnN0YWJsZS94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC92dGQvaW9tbXUuYwpAQCAtMTUwNSw3ICsxNTA1LDcgQEAgc3RhdGljIGludCBkb21haW5f
Y29udGV4dF9tYXBwaW5nKHN0cnVjdAogICAgICAgICAgICAgYnJlYWs7CiAKICAgICAgICAgcmV0
ID0gZG9tYWluX2NvbnRleHRfbWFwcGluZ19vbmUoZG9tYWluLCBkcmhkLT5pb21tdSwgYnVzLCBk
ZXZmbiwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGNpX2dldF9w
ZGV2KHNlZywgYnVzLCBkZXZmbikpOworICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBOVUxMKTsKIAogICAgICAgICAvKgogICAgICAgICAgKiBEZXZpY2VzIGJlaGluZCBQ
Q0llLXRvLVBDSS9QQ0l4IGJyaWRnZSBtYXkgZ2VuZXJhdGUgZGlmZmVyZW50CkBAIC0xNTE1LDcg
KzE1MTUsNyBAQCBzdGF0aWMgaW50IGRvbWFpbl9jb250ZXh0X21hcHBpbmcoc3RydWN0CiAgICAg
ICAgIGlmICggIXJldCAmJiBwZGV2X3R5cGUoc2VnLCBidXMsIGRldmZuKSA9PSBERVZfVFlQRV9Q
Q0llMlBDSV9CUklER0UgJiYKICAgICAgICAgICAgICAoc2VjYnVzICE9IHBkZXYtPmJ1cyB8fCBw
ZGV2LT5kZXZmbiAhPSAwKSApCiAgICAgICAgICAgICByZXQgPSBkb21haW5fY29udGV4dF9tYXBw
aW5nX29uZShkb21haW4sIGRyaGQtPmlvbW11LCBzZWNidXMsIDAsCi0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwY2lfZ2V0X3BkZXYoc2VnLCBzZWNidXMsIDAp
KTsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE5VTEwpOwog
CiAgICAgICAgIGJyZWFrOwogCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
