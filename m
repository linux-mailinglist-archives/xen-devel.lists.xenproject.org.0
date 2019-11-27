Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC6710B30C
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 17:16:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZzxb-0005ZC-Es; Wed, 27 Nov 2019 16:14:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zCzl=ZT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZzxZ-0005Yx-H8
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 16:14:33 +0000
X-Inumbo-ID: fed40a04-1130-11ea-83b8-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fed40a04-1130-11ea-83b8-bc764e2007e4;
 Wed, 27 Nov 2019 16:14:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4C3F8BA32;
 Wed, 27 Nov 2019 16:14:31 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191127160108.12490-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <38400e64-4ace-77a9-6b95-58f1754ca690@suse.com>
Date: Wed, 27 Nov 2019 17:14:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191127160108.12490-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] clang: do not enable live-patching
 support
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMTEuMjAxOSAxNzowMSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IExpdmUtcGF0Y2hp
bmcgcmVxdWlyZXMgdW5pcXVlIHN5bWJvbHMsIGFuZCBzYWRseSB0aGUgY2xhbmcgYnVpbGQKPiBn
ZW5lcmF0ZXMgYSBsb3Qgb2YgZHVwbGljYXRlIHN5bWJvbHM6Cj4gCj4gRHVwbGljYXRlIHN5bWJv
bCAnYXNpZC5jI2dldF9jcHVfaW5mbycgKGZmZmY4MmQwODAzMDMyYzAgIT0gZmZmZjgyZDA4MDJl
MGY1MCkKPiBEdXBsaWNhdGUgc3ltYm9sICdhc2lkLmMjZ2V0X2NwdV9pbmZvX2Zyb21fc3RhY2sn
IChmZmZmODJkMDgwMmUxMDgwICE9IGZmZmY4MmQwODAzMDMyZjApCj4gRHVwbGljYXRlIHN5bWJv
bCAnYXRzLmMjX19saXN0X2FkZCcgKGZmZmY4MmQwODAyNjBhMDAgIT0gZmZmZjgyZDA4MDI2N2M3
MCkKPiBEdXBsaWNhdGUgc3ltYm9sICdib290LmMjY29uc3RhbnRfdGVzdF9iaXQnIChmZmZmODJk
MDgwNDBlYTYwICE9IGZmZmY4MmQwODA0MzcyZjApCj4gRHVwbGljYXRlIHN5bWJvbCAnY29tbW9u
LmMjY2xlYXJfYml0JyAoZmZmZjgyZDA4MDMzMjQ0MCAhPSBmZmZmODJkMDgwMmQzM2IwKQo+IER1
cGxpY2F0ZSBzeW1ib2wgJ2NvbW1vbi5jI2NvbnN0YW50X3Rlc3RfYml0JyAoZmZmZjgyZDA4MDMz
MjM0MCAhPSBmZmZmODJkMDgwMmQyMjIwKQo+IER1cGxpY2F0ZSBzeW1ib2wgJ2NvbW1vbi5jI2Nw
dW1hc2tfY2hlY2snIChmZmZmODJkMDgwMmQzMzcwICE9IGZmZmY4MmQwODAzMzdiNjApCj4gRHVw
bGljYXRlIHN5bWJvbCAnY29tbW9uLmMjZ2V0X2NwdV9pbmZvJyAoZmZmZjgyZDA4MDJkMjJiMCAh
PSBmZmZmODJkMDgwMzMxNTkwKQo+IER1cGxpY2F0ZSBzeW1ib2wgJ2NvbW1vbi5jI2dldF9jcHVf
aW5mb19mcm9tX3N0YWNrJyAoZmZmZjgyZDA4MDJkMzFjMCAhPSBmZmZmODJkMDgwMzM3NGIwKQo+
IER1cGxpY2F0ZSBzeW1ib2wgJ2NvbW1vbi5jI3Bmbl90b19wZHgnIChmZmZmODJkMDgwMmQzMjcw
ICE9IGZmZmY4MmQwODAzMzFlMDApCj4gRHVwbGljYXRlIHN5bWJvbCAnY29tbW9uLmMjdGVzdF9h
bmRfc2V0X2JpdCcgKGZmZmY4MmQwODAyZDMzNjAgIT0gZmZmZjgyZDA4MDMzMjI1MCkKPiBEdXBs
aWNhdGUgc3ltYm9sICdjb21tb24uYyN2YXJpYWJsZV9jbGVhcl9iaXQnIChmZmZmODJkMDgwMmQy
MjcwICE9IGZmZmY4MmQwODAzMzdiNTApCj4gRHVwbGljYXRlIHN5bWJvbCAnY29tcGF0LmMjZ2V0
X2NwdV9pbmZvJyAoZmZmZjgyZDA4MDI2ZWFiMCAhPSBmZmZmODJkMDgwMjAwNDYwKQo+IER1cGxp
Y2F0ZSBzeW1ib2wgJ2NvbXBhdC5jI2dldF9jcHVfaW5mb19mcm9tX3N0YWNrJyAoZmZmZjgyZDA4
MDI2ZWJkMCAhPSBmZmZmODJkMDgwMjAwZjcwKQo+IER1cGxpY2F0ZSBzeW1ib2wgJ2NwdV9pZGxl
LmMjZ2V0X2NwdV9pbmZvJyAoZmZmZjgyZDA4MDJjY2IwMCAhPSBmZmZmODJkMDgwMzVmY2MwKQo+
IFsuLi5dCj4gCj4gRm9yIHRoZSB0aW1lIGJlaW5nIGRpc2FibGUgbGl2ZS1wYXRjaGluZyB3aGVu
IGJ1aWxkaW5nIHdpdGggY2xhbmcsCj4gc2luY2UgZHVwbGljYXRlIHN5bWJvbHMgd2lsbCB0cmln
Z2VyIGEgYnVpbGQgZmFpbHVyZSBiZWNhdXNlCj4gRU5GT1JDRV9VTklRVUVfU1lNQk9MUyBpcyBu
b3cgYWxzbyBlbmFibGVkIGJ5IGRlZmF1bHQgaW4gY29uanVuY3Rpb24KPiB3aXRoIGxpdmUtcGF0
Y2hpbmcuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+CgpUbyBiZSBob25lc3QsIGFzIGluZGljYXRlZCBiZWZvcmUgSSdtIGluY2xpbmVk
IHRvIG5hayB0aGlzIHBhdGNoCm9uIHRoZSBiYXNpcyB0aGF0IGEgcHJvcGVyIHNvbHV0aW9uIGhh
cyBiZWVuIHBvc3RlZCBhbG1vc3QgMyB3ZWVrcwphZ28gKGFuZCB0aGlzIHdhcyBhbHJlYWR5IHYy
KS4gTmV2ZXJ0aGVsZXNzIGEgcmVtYXJrIGhlcmU6Cgo+IC0tLSBhL3hlbi9jb21tb24vS2NvbmZp
Zwo+ICsrKyBiL3hlbi9jb21tb24vS2NvbmZpZwo+IEBAIC04MCw2ICs4MCwxMCBAQCBjb25maWcg
SEFTX0NIRUNLUE9MSUNZCj4gIAlzdHJpbmcKPiAgCW9wdGlvbiBlbnY9IlhFTl9IQVNfQ0hFQ0tQ
T0xJQ1kiCj4gIAo+ICtjb25maWcgQlVJTERfV0lUSF9DTEFORwo+ICsJc3RyaW5nCj4gKwlvcHRp
b24gZW52PSJYRU5fQlVJTERfV0lUSF9DTEFORyIKCkluc3RlYWQgb2YgaW50cm9kdWNpbmcgYSBu
ZXcgb3B0aW9uIGhlcmUsIC4uLgoKPiBAQCAtMzUwLDcgKzM1NCw3IEBAIGNvbmZpZyBDUllQVE8K
PiAgY29uZmlnIExJVkVQQVRDSAo+ICAJYm9vbCAiTGl2ZSBwYXRjaGluZyBzdXBwb3J0Igo+ICAJ
ZGVmYXVsdCBYODYKPiAtCWRlcGVuZHMgb24gSEFTX0JVSUxEX0lEID0gInkiCj4gKwlkZXBlbmRz
IG9uIEhBU19CVUlMRF9JRCA9ICJ5IiAmJiBCVUlMRF9XSVRIX0NMQU5HICE9ICJ5IgoKLi4uIHNl
ZWluZyB0aGlzLCB3aHkgZG9uJ3QgeW91IHNpbXBseSBzdXBwcmVzcyBIQVNfQlVJTERfSUQgYWNx
dWlyaW5nCmEgdmFsdWUgb2YgeSBpbiAuL0NvbmZpZy5tayAoYWNjb21wYW5pZWQgYnkgYSBzdWl0
YWJsZSBjb21tZW50KT8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
