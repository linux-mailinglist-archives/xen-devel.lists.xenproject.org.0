Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B21D207B9
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 15:12:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRG9K-0004ni-8V; Thu, 16 May 2019 13:10:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xQgL=TQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hRG9J-0004nZ-14
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 13:10:17 +0000
X-Inumbo-ID: f1b5d59c-77db-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f1b5d59c-77db-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 13:10:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3AA0CABF4;
 Thu, 16 May 2019 13:10:14 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-38-jgross@suse.com> <5CDD5AC2020000780022FA6A@suse.com>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <d7eadbab-3671-f1df-af07-dac5f8b47f98@suse.com>
Date: Thu, 16 May 2019 15:10:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CDD5AC2020000780022FA6A@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH RFC V2 37/45] x86: optimize loading of GDT
 at context switch
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYvMDUvMjAxOSAxNDo0MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDYuMDUuMTkg
YXQgMDg6NTYsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBJbnN0ZWFkIG9mIGR5bmFtaWNh
bGx5IGRlY2lkZSB3aGV0aGVyIHRoZSBwcmV2aW91cyB2Y3B1IHdhcyB1c2luZyBmdWxsCj4+IG9y
IGRlZmF1bHQgR0RUIGp1c3QgYWRkIGEgcGVyY3B1IHZhcmlhYmxlIGZvciB0aGF0IHB1cnBvc2Uu
IFRoaXMgYXQKPj4gb25jZSByZW1vdmVzIHRoZSBuZWVkIGZvciB0ZXN0aW5nIHZjcHVfaWRzIHRv
IGRpZmZlciB0d2ljZS4KPj4KPj4gQ2FjaGUgdGhlIG5lZWRfZnVsbF9nZHQobmQpIHZhbHVlIGlu
IGEgbG9jYWwgdmFyaWFibGUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4KPiAKPiBUbyBiZSBob25lc3QgSSdtIG5vdCBlbnRpcmVseSBjb252aW5j
ZWQgdGhpcyBpcyBhIGdvb2QgbW92ZS4gQnV0Cj4gc2luY2UgeW91J3ZlIGRvbmUgdGhlIHdvcmss
IGFuZCBzaW5jZSB0aGUgbGFyZ2VyIHNvdXJjZSBzaXplIGlzCj4gaG9wZWZ1bGx5IG91dHdlaWdo
ZWQgYnkgc2xpZ2h0bHkgc21hbGxlciBiaW5hcnkgc2l6ZSAocGVyLUNQVQo+IGRhdGEgYWNjZXNz
ZXMgYXJlbid0IGVudGlyZWx5IGNoZWFwIGVpdGhlciksIEknbSBub3QgZ29pbmcgdG8KPiBvYmpl
Y3QuCj4gCj4+IEBAIC0xNjU4LDYgKzE2NjQsNyBAQCBzdGF0aWMgdm9pZCBfX2NvbnRleHRfc3dp
dGNoKHZvaWQpCj4+ICAgICAgc3RydWN0IHZjcHUgICAgICAgICAgKm4gPSBjdXJyZW50Owo+PiAg
ICAgIHN0cnVjdCBkb21haW4gICAgICAgICpwZCA9IHAtPmRvbWFpbiwgKm5kID0gbi0+ZG9tYWlu
Owo+PiAgICAgIHNlZ19kZXNjX3QgICAgICAgICAgICpnZHQ7Cj4+ICsgICAgYm9vbCAgICAgICAg
ICAgICAgICAgIG5lZWRfZnVsbF9nZHRfbjsKPiAKPiBUaGlzIHZhcmlhYmxlIGlzIHRvbyBsb25n
LCBvciBtb3JlIHByZWNpc2VseSBoYXMgdG9vIG1hbnkgdW5kZXJzY29yZXMKPiBmb3IgbXkgdGFz
dGUuIFNlZWluZyB0aGF0IG9ubHkgYSBzaW5nbGUgaW52b2NhdGlvbiBvZiBuZWVkX2Z1bGxfZ2R0
KCkKPiByZW1haW5zLCBJIGRvbid0IHRoaW5rIGp1c3QgImZ1bGxfZ2R0IiB3b3VsZCBiZSBhbWJp
Z3VvdXMgaW4gYW55IHdheS4KCkZpbmUgd2l0aCBtZS4KCj4gQXQgd2hpY2ggcG9pbnQKPiBSZXZp
ZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKVGhhbmtzLAoKCkp1ZXJn
ZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
