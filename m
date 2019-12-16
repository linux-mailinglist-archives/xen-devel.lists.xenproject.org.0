Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1753120221
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 11:20:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ignQW-0007Md-HY; Mon, 16 Dec 2019 10:16:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=L813=2G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ignQV-0007MY-5k
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 10:16:31 +0000
X-Inumbo-ID: 1eda23ce-1fed-11ea-937b-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1eda23ce-1fed-11ea-937b-12813bfff9fa;
 Mon, 16 Dec 2019 10:16:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 80414AA35;
 Mon, 16 Dec 2019 10:16:27 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191212182740.2190199-1-anthony.perard@citrix.com>
 <20191212182740.2190199-4-anthony.perard@citrix.com>
 <9073662c-9cc4-cb6c-8402-941864cc779a@suse.com>
 <20191213154946.GM1155@perard.uk.xensource.com>
 <4022441e-bdbd-e78b-c8a4-d3fd9a09311a@suse.com>
 <b6dc71f0-1158-c6ac-18b6-fe72d495cde4@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ad54009f-8cc1-20f6-a9bb-630fda7f8d54@suse.com>
Date: Mon, 16 Dec 2019 11:16:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <b6dc71f0-1158-c6ac-18b6-fe72d495cde4@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH 3/8] xen: Update Kconfig to Linux v5.4
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTIuMjAxOSAyMDoxNywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMy8xMi8yMDE5
IDE2OjU5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTMuMTIuMjAxOSAxNjo0OSwgQW50aG9u
eSBQRVJBUkQgd3JvdGU6Cj4+PiBPbiBGcmksIERlYyAxMywgMjAxOSBhdCAxMjowNToxMVBNICsw
MTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAxMi4xMi4yMDE5IDE5OjI3LCBBbnRob255
IFBFUkFSRCB3cm90ZToKPj4+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4+PiArKysgYi94ZW4vLmdpdGln
bm9yZQo+Pj4+PiBAQCAtMCwwICsxLDIgQEAKPj4+Pj4gKyoubGV4LmMKPj4+Pj4gKyoudGFiLltj
aF0KPj4+PiBXaHkgZG8gdGhlc2UgZ2V0IG1vdmVkIGhlcmUgZnJvbSAuLi4KPj4+Pgo+Pj4+PiAt
LS0gYS94ZW4vdG9vbHMva2NvbmZpZy8uZ2l0aWdub3JlCj4+Pj4+ICsrKyBiL3hlbi90b29scy9r
Y29uZmlnLy5naXRpZ25vcmUKPj4+Pj4gQEAgLTEsMTIgKzEsOCBAQAo+Pj4+PiAgIwo+Pj4+PiAg
IyBHZW5lcmF0ZWQgZmlsZXMKPj4+Pj4gICMKPj4+Pj4gLWNvbmZpZyoKPj4+Pj4gLSoubGV4LmMK
Pj4+Pj4gLSoudGFiLmMKPj4+Pj4gLSoudGFiLmgKPj4+Pj4gLXpjb25mLmhhc2guYwo+Pj4+PiAg
Ki5tb2MKPj4+Pj4gKypjb25mLWNmZwo+Pj4+IGhlcmU/Cj4+PiBXZWxsLCBpdCdzIG1vcmUgbGlr
ZSB0aGV5IG1vdmUgZnJvbSBsaW51eC5naXQvc2NyaXB0cy9rY29uZmlnLy5naXRpZ25vcmUKPj4+
IHRvIGxpbnV4LmdpdC8uZ2l0aWdub3JlCj4+IFdoaWNoIGRvZXNuJ3QgYW5zd2VyIHRoZSB3aHkg
KGZvciBvdXIgcmVwbykuCj4gCj4gc3JzbHk/Cj4gCj4gV2Ugc2hvdWxkbid0IGVkaXQgaGVhZGVy
cyB3ZSBkb24ndCBhY3R1YWxseSByZXN5bmMgYmVjYXVzZSBpdCBtYXkgbWFrZQo+IHJlc3luY2lu
ZyBoYXJkZXIgKGFsbGVnZWRseSksIHlldCB3ZSBzaG91bGRuJ3Qga2VlcCBhbiBpbi1zeW5jIGRp
cmVjdG9yeQo+IGluIHN5bmMgd2hlbiB3ZSBkbyBhY3R1YWxseSByZXN5bmMgaXQ/CgpXaGF0IGhl
YWRlcnMgYXJlIHlvdSB0YWtpbmcgYWJvdXQ/IE15IHF1ZXN0aW9uIHdhcyBhYm91dCB0aGUgcGxh
Y2VtZW50Cm9mIC5naXRpZ25vcmUgZW50cmllcyBvbmx5LiBJJ20gcHJldHR5IHN1cmUgSSBoYWQg
cHJldmlvdXNseSBleHByZXNzZWQKdGhhdCBJJ20gbm90IG92ZXJseSBoYXBweSB0byBzZWUgbmVl
ZGxlc3Mgc2NhdHRlcmluZyBhcm91bmQgb2YgdGhlbS4KSSdtIG1lcmVseSB0cnlpbmcgdG8gdW5k
ZXJzdGFuZCBpZiBoZXJlIHdlIGhhdmUgYSBjYXNlIG9mICJuZWVkbGVzcyIuCgo+IEkgZmluZCB5
b3VyIGxhY2sgb2YgY29uc2lzdGVuY3kgaW4gcmV2aWV3IHJlcXVlc3RzIGltcG9zc2libGUgdG8g
cHJlZGljdC4KCldoYXQgY29uc2lzdGVuY3k/IFdoYXQncyB3cm9uZyB3aXRoIHB1dHRpbmcgdGhl
IHR3byBsaW5lcyBpbiB0aGUgdG9wCmxldmVsIC5naXRpZ25vcmUsIG9yIGtlZXBpbmcgdGhlbSB3
aGVyZSB0aGV5IGFyZT8gSSBhbnl3YXkgZG91YnQKdGhlcmUncyBhIG5lZWQgdG8ga2VlcCBvdXIg
LmdpdGlnbm9yZSBpbiBzeW5jIHdpdGggTGludXgnZXMuCgpKYW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
