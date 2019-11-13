Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A57FFB2A3
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 15:31:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUtdG-0007Bx-G7; Wed, 13 Nov 2019 14:28:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SDLk=ZF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iUtdE-0007Bs-QM
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 14:28:28 +0000
X-Inumbo-ID: db1a7b44-0621-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db1a7b44-0621-11ea-9631-bc764e2007e4;
 Wed, 13 Nov 2019 14:28:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6801FB365;
 Wed, 13 Nov 2019 14:28:26 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191113134417.17299-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2db94ef5-4980-d96c-10b3-a6f78f8eb7c2@suse.com>
Date: Wed, 13 Nov 2019 15:28:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191113134417.17299-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/passthrough: Render domains
 with %pd in the 'Q' debug handler
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTEuMjAxOSAxNDo0NCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBJT01NVXMgYXJlIG93
bmVkIGJ5IERPTV9YRU4sIGFuZCB3aXRoIFhTQS0zMDIsIERPTV9JTyBpcyB1c2VkIGZvcgo+IHF1
YXJhbnRpbmVkIGRvbWFpbnMuICBVc2UgJXBkIGluIHRoZSBwcmludGsgdG8gcmVuZGVyIHRoZSBz
eXN0ZW0KPiBkb21haW5zIG1vcmUgaW50ZWxsaWdlbnRseS4KPiAKPiBCZWZvcmU6Cj4gICAoWEVO
KSAwMDAwOjAwOjAxLjAgLSBkb20gMCAgIC0gbm9kZSAwICAgLSBNU0lzIDwgPgo+ICAgKFhFTikg
MDAwMDowMDowMC4wIC0gZG9tIDAgICAtIG5vZGUgMCAgIC0gTVNJcyA8ID4KPiAgIChYRU4pIDAw
MDA6ODA6MDAuMiAtIGRvbSAzMjc1NCAtIG5vZGUgMSAgIC0gTVNJcyA8ID4KPiAgIChYRU4pIDAw
MDA6YTA6MDAuMiAtIGRvbSAzMjc1NCAtIG5vZGUgMSAgIC0gTVNJcyA8ID4KPiAgIChYRU4pIDAw
MDA6YzA6MDAuMiAtIGRvbSAzMjc1NCAtIG5vZGUgMSAgIC0gTVNJcyA8ID4KPiAgIChYRU4pIDAw
MDA6ZTA6MDAuMiAtIGRvbSAzMjc1NCAtIG5vZGUgMSAgIC0gTVNJcyA8ID4KPiAgIChYRU4pIDAw
MDA6MDA6MDAuMiAtIGRvbSAzMjc1NCAtIG5vZGUgMCAgIC0gTVNJcyA8ID4KPiAgIChYRU4pIDAw
MDA6MjA6MDAuMiAtIGRvbSAzMjc1NCAtIG5vZGUgMCAgIC0gTVNJcyA8ID4KPiAgIChYRU4pIDAw
MDA6NDA6MDAuMiAtIGRvbSAzMjc1NCAtIG5vZGUgMCAgIC0gTVNJcyA8ID4KPiAgIChYRU4pIDAw
MDA6NjA6MDAuMiAtIGRvbSAzMjc1NCAtIG5vZGUgMCAgIC0gTVNJcyA8ID4KPiAKPiBBZnRlcjoK
PiAgIChYRU4pIDAwMDA6MDA6MDEuMCAtIGQwIC0gbm9kZSAwICAgLSBNU0lzIDwgPgo+ICAgKFhF
TikgMDAwMDowMDowMC4wIC0gZDAgLSBub2RlIDAgICAtIE1TSXMgPCA+Cj4gICAoWEVOKSAwMDAw
OjgwOjAwLjIgLSBkW1hFTl0gLSBub2RlIDEgICAtIE1TSXMgPCA+Cj4gICAoWEVOKSAwMDAwOmEw
OjAwLjIgLSBkW1hFTl0gLSBub2RlIDEgICAtIE1TSXMgPCA+Cj4gICAoWEVOKSAwMDAwOmMwOjAw
LjIgLSBkW1hFTl0gLSBub2RlIDEgICAtIE1TSXMgPCA+Cj4gICAoWEVOKSAwMDAwOmUwOjAwLjIg
LSBkW1hFTl0gLSBub2RlIDEgICAtIE1TSXMgPCA+Cj4gICAoWEVOKSAwMDAwOjAwOjAwLjIgLSBk
W1hFTl0gLSBub2RlIDAgICAtIE1TSXMgPCA+Cj4gICAoWEVOKSAwMDAwOjIwOjAwLjIgLSBkW1hF
Tl0gLSBub2RlIDAgICAtIE1TSXMgPCA+Cj4gICAoWEVOKSAwMDAwOjQwOjAwLjIgLSBkW1hFTl0g
LSBub2RlIDAgICAtIE1TSXMgPCA+Cj4gICAoWEVOKSAwMDAwOjYwOjAwLjIgLSBkW1hFTl0gLSBu
b2RlIDAgICAtIE1TSXMgPCA+Cj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
