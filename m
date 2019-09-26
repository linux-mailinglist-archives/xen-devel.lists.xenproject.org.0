Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28140BF5AF
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 17:15:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDVSO-0006Rg-ON; Thu, 26 Sep 2019 15:13:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=breC=XV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iDVSO-0006Rb-4g
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 15:13:24 +0000
X-Inumbo-ID: 2e196a12-e070-11e9-8628-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 2e196a12-e070-11e9-8628-bc764e2007e4;
 Thu, 26 Sep 2019 15:13:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 249E9AE0C;
 Thu, 26 Sep 2019 15:13:22 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20190903161428.7159-1-roger.pau@citrix.com>
 <20190903161428.7159-7-roger.pau@citrix.com>
 <d82bc404-c417-591d-d436-461b8100c44d@suse.com>
 <20190926111404.co5krpzvbf5k5oq3@Air-de-Roger>
 <0c261f5e-735a-cf05-5d1a-9f3b0b2c83ed@suse.com>
 <20190926134644.tcp7pyalzk42hesg@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <765f32ca-e5f2-fddd-9570-d043596d8948@suse.com>
Date: Thu, 26 Sep 2019 17:13:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190926134644.tcp7pyalzk42hesg@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 06/11] ioreq: allow dispatching ioreqs to
 internal servers
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDkuMjAxOSAxNTo0NiwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gVGh1LCBT
ZXAgMjYsIDIwMTkgYXQgMDM6MTc6MTVQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9u
IDI2LjA5LjIwMTkgMTM6MTQsIFJvZ2VyIFBhdSBNb25uw6kgIHdyb3RlOgo+Pj4gT24gRnJpLCBT
ZXAgMjAsIDIwMTkgYXQgMDE6MzU6MTNQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4g
SGF2aW5nIHNhaWQgdGhpcywgYXMgYSByZXN1bHQgb2YgaGF2aW5nIGxvb2tlZCBhdCBzb21lIG9m
IHRoZQo+Pj4+IGludm9sdmVkIGNvZGUsIGFuZCB3aXRoIHRoZSBjb3ZlciBsZXR0ZXIgbm90IGNs
YXJpZnlpbmcgdGhpcywKPj4+PiB3aGF0J3MgdGhlIHJlYXNvbiBmb3IgZ29pbmcgdGhpcyBzZWVt
aW5nbHkgbW9yZSBjb21wbGljYXRlZAo+Pj4+IHJvdXRlLCByYXRoZXIgdGhhbiBwdXR0aW5nIHZQ
Q0kgYmVoaW5kIHRoZSBodm1faW9faW50ZXJjZXB0KCkKPj4+PiBtYWNoaW5lcnksIGp1c3QgbGlr
ZSBpcyB0aGUgY2FzZSBmb3Igb3RoZXIgaW50ZXJuYWwgaGFuZGxpbmc/Cj4+Pgo+Pj4gSWYgdlBD
SSBpcyBoYW5kbGVkIGF0IHRoZSBodm1faW9faW50ZXJjZXB0IGxldmVsIChsaWtlIGl0cyBkb25l
IEFUTSkKPj4+IHRoZW4gaXQncyBub3QgcG9zc2libGUgdG8gaGF2ZSBib3RoIChleHRlcm5hbCkg
aW9yZXEgc2VydmVycyBhbmQgdlBDSQo+Pj4gaGFuZGxpbmcgYWNjZXNzZXMgdG8gZGlmZmVyZW50
IGRldmljZXMgaW4gdGhlIFBDSSBjb25maWcgc3BhY2UsIHNpbmNlCj4+PiB2UENJIHdvdWxkIHRy
YXAgYWxsIGFjY2Vzc2VzIHRvIHRoZSBQQ0kgSU8gcG9ydHMgYW5kIHRoZSBNQ0ZHIHJlZ2lvbnMK
Pj4+IGFuZCB0aG9zZSB3b3VsZCBuZXZlciByZWFjaCB0aGUgaW9yZXEgcHJvY2Vzc2luZy4KPj4K
Pj4gV2h5IHdvdWxkIHZQQ0kgKHdhbnQgdG8pIGRvIHRoYXQ/IFRoZSBhY2NlcHQoKSBoYW5kbGVy
IHNob3VsZAo+PiBzdWItY2xhc3MgdGhlIENGOC1DRkYgcG9ydCByYW5nZTsgdGhlcmUgd291bGQg
bGlrZWx5IHdhbnQgdG8KPj4gYmUgYW5vdGhlciBzdHJ1Y3QgaHZtX2lvX29wcyBpbnN0YW5jZSBk
ZWFsaW5nIHdpdGggY29uZmlnCj4+IHNwYWNlIGFjY2Vzc2VzIChhbmQgcGVyaGFwcyB3aXRoIG9u
ZXMgdGhyb3VnaCBwb3J0IEkvTyBhbmQKPj4gdGhyb3VnaCBNQ0ZHIGF0IHRoZSBzYW1lIHRpbWUp
Lgo+IAo+IERvIHlvdSBtZWFuIHRvIGV4cGFuZCBodm1faW9faGFuZGxlciB0byBhZGQgc29tZXRo
aW5nIGxpa2UgYSBwY2ljb25mCj4gc3ViLXN0cnVjdHVyZSB0byB0aGUgZXhpc3RpbmcgdW5pb24g
b2YgcG9ydGlvIGFuZCBtbWlvPwoKWWVzLCBzb21ldGhpbmcgYWxvbmcgdGhlc2UgbGluZXMuCgo+
IFRoYXQncyBpbmRlZWQgZmVhc2libGUsIGJ1dCBJJ20gbm90IHN1cmUgd2h5IGl0J3MgYmV0dGVy
IHRoYXQgdGhlCj4gYXBwcm9hY2ggcHJvcG9zZWQgb24gdGhpcyBzZXJpZXMuIExvbmcgdGVybSBJ
IHRoaW5rIHdlIHdvdWxkIGxpa2UgYWxsCj4gaW50ZXJjZXB0IGhhbmRsZXJzIHRvIHVzZSB0aGUg
aW9yZXEgaW5mcmFzdHJ1Y3R1cmUgYW5kIHJlbW92ZSB0aGUKPiB1c2FnZSBvZiBodm1faW9faW50
ZXJjZXB0Lgo+IAo+PiBJbiB0aGUgZW5kIHRoaXMgd291bGQgbGlrZWx5Cj4+IG1vcmUgc2ltaWxh
ciB0byBob3cgY2hpcHNldHMgaGFuZGxlIHRoaXMgb24gcmVhbCBoYXJkd2FyZQo+PiB0aGFuIHlv
dXIgImludGVybmFsIHNlcnZlciIgc29sdXRpb24gKGFsYmVpdCBJIGFncmVlIHRvIGEKPj4gZGVn
cmVlIGl0J3MgaW4gaW1wbGVtZW50YXRpb24gZGV0YWlsIGFueXdheSkuCj4gCj4gSSB0aGluayB0
aGUgZW5kIGdvYWwgc2hvdWxkIGJlIHRvIHVuaWZ5IHRoZSBpbnRlcm5hbCBhbmQgZXh0ZXJuYWwK
PiBpbnRlcmNlcHRzIGludG8gYSBzaW5nbGUgcG9pbnQsIGFuZCB0aGUgb25seSBmZWFzaWJsZSB3
YXkgdG8gZG8gdGhpcwo+IGlzIHRvIHN3aXRjaCB0aGUgaW50ZXJuYWwgaW50ZXJjZXB0cyB0byB1
c2UgdGhlIGlvcmVxIGluZnJhc3RydWN0dXJlLgoKV2VsbCwgSSByZWNhbGwgdGhpcyBoYXZpbmcg
YmVlbiBtZW50aW9uZWQgYXMgYW4gb3B0aW9uOyBJIGRvbid0CnJlY2FsbCB0aGlzIGJlaW5nIGEg
ZmlybSBwbGFuLiBUaGVyZSBhcmUgY2VydGFpbmx5IGJlbmVmaXRzIHRvCnN1Y2ggYSBtb2RlbCwg
YnV0IHRoZXJlJ3MgYWxzbyBwb3RlbnRpYWxseSBtb3JlIG92ZXJoZWFkIChhdCB0aGUKdmVyeSBs
ZWFzdCB0aGUgaW9yZXFfdCB3aWxsIHRoZW4gbmVlZCBzZXR0aW5nIHVwIC8gbWFpbnRhaW5pbmcK
ZXZlcnl3aGVyZSwgd2hlbiByaWdodCBub3cgdGhlIGludGVyZmFjZXMgYXJlIHVzaW5nIG1vcmUK
aW1tZWRpYXRlIHBhcmFtZXRlcnMpLgoKQnV0IHllcywgaWYgdGhpcyBfaXNfIHRoZSBwbGFuLCB0
aGVuIGdvaW5nIHRoYXQgcm91dGUgcmlnaHQgYXdheQpmb3IgdlBDSSBpcyBkZXNpcmFibGUuCgpK
YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
