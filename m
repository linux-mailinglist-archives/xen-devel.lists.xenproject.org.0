Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0438E1F0E
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 17:18:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNIMD-0005nk-UI; Wed, 23 Oct 2019 15:15:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Yzoh=YQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iNIMC-0005na-R4
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 15:15:28 +0000
X-Inumbo-ID: f1c26fa8-f5a7-11e9-beca-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f1c26fa8-f5a7-11e9-beca-bc764e2007e4;
 Wed, 23 Oct 2019 15:15:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1516FAE8D;
 Wed, 23 Oct 2019 15:15:27 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <cover.b80738fa53144bc6e5e32c048ccf4e4b95355844.1570918263.git-series.marmarek@invisiblethingslab.com>
 <6817967de825071edd7adedbc6b798199ae292ad.1570918263.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7637d382-e237-be08-1d7b-6b5819f52bea@suse.com>
Date: Wed, 23 Oct 2019 17:15:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6817967de825071edd7adedbc6b798199ae292ad.1570918263.git-series.marmarek@invisiblethingslab.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/2] efi: remove old
 SetVirtualAddressMap() arrangement
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTAuMjAxOSAwMDoxMSwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICB3cm90ZToK
PiBAQCAtMTA5OSw5ICsxMDk2LDYgQEAgc3RhdGljIHZvaWQgX19pbml0IGVmaV9leGl0X2Jvb3Qo
RUZJX0hBTkRMRSBJbWFnZUhhbmRsZSwgRUZJX1NZU1RFTV9UQUJMRSAqU3lzdGUKPiAgCj4gICAg
ICAvKiBBZGp1c3QgcG9pbnRlcnMgaW50byBFRkkuICovCj4gICAgICBlZmlfY3QgPSAodm9pZCAq
KWVmaV9jdCArIERJUkVDVE1BUF9WSVJUX1NUQVJUOwo+IC0jaWZkZWYgVVNFX1NFVF9WSVJUVUFM
X0FERFJFU1NfTUFQCj4gLSAgICBlZmlfcnMgPSAodm9pZCAqKWVmaV9ycyArIERJUkVDVE1BUF9W
SVJUX1NUQVJUOwo+IC0jZW5kaWYKClRoaXMgZG9lc24ndCBnZXQgcmUtaW5zdGF0ZWQgaW4gYW55
IHdheSBieSBwYXRjaCAyLiBIb3cgY29tZSB5b3UKZ2V0IGF3YXkgd2l0aG91dD8gSW4gYW55IGV2
ZW50IHRoaXMgaXMgcGVyaGFwcyB0aGUgYmVzdCBleGFtcGxlCm9mIHdoeSBJIHBlcnNvbmFsbHkg
dGhpbmsgaXQgd291bGQgaGF2ZSBiZWVuIGJldHRlciB0byBjaGFuZ2UKdGhpbmdzIGluIHBsYWNl
LCByYXRoZXIgdGhhbiByZW1vdmUgZXZlcnl0aGluZyBmaXJzdC4gQnV0IGZvcgpzb21lIG9mIHRo
ZSBvdGhlciBjaGFuZ2UgdGhlIHF1ZXN0aW9uIGFsc28gYXJpc2VzIG9mIHdoeSB0aGV5CmRvbid0
IG5lZWQgcmUtaW5zdGF0aW5nIGluIG9uZSBmb3JtIG9yIGFub3RoZXIuCgpKYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
