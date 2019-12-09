Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A51116E63
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 15:00:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieJXs-00053J-Gs; Mon, 09 Dec 2019 13:57:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HzjL=Z7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ieJXr-00053E-DK
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 13:57:51 +0000
X-Inumbo-ID: e2cd2dc3-1a8b-11ea-87d8-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2cd2dc3-1a8b-11ea-87d8-12813bfff9fa;
 Mon, 09 Dec 2019 13:57:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DC6FAAC3C;
 Mon,  9 Dec 2019 13:57:49 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20191205140123.3817-1-pdurrant@amazon.com>
 <20191205140123.3817-5-pdurrant@amazon.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <bbf958af-d435-3a56-1e91-e068125a9ce7@suse.com>
Date: Mon, 9 Dec 2019 14:57:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191205140123.3817-5-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/4] xen-blkback: support dynamic unbind/bind
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
Cc: Jens Axboe <axboe@kernel.dk>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMTIuMTkgMTU6MDEsIFBhdWwgRHVycmFudCB3cm90ZToKPiBCeSBzaW1wbHkgcmUtYXR0
YWNoaW5nIHRvIHNoYXJlZCByaW5ncyBkdXJpbmcgY29ubmVjdF9yaW5nKCkgcmF0aGVyIHRoYW4K
PiBhc3N1bWluZyB0aGV5IGFyZSBmcmVzaGx5IGFsbG9jYXRlZCAoaS5lIGFzc3VtaW5nIHRoZSBj
b3VudGVycyBhcmUgemVybykKPiBpdCBpcyBwb3NzaWJsZSBmb3IgdmJkIGluc3RhbmNlcyB0byBi
ZSB1bmJvdW5kIGFuZCByZS1ib3VuZCBmcm9tIGFuZCB0bwo+IChyZXNwZWN0aXZlbHkpIGEgcnVu
bmluZyBndWVzdC4KPiAKPiBUaGlzIGhhcyBiZWVuIHRlc3RlZCBieSBydW5uaW5nOgo+IAo+IHdo
aWxlIHRydWU7IGRvIGRkIGlmPS9kZXYvdXJhbmRvbSBvZj10ZXN0LmltZyBicz0xTSBjb3VudD0x
MDI0OyBkb25lCj4gCj4gaW4gYSBQViBndWVzdCB3aGlsc3QgcnVubmluZzoKPiAKPiB3aGlsZSB0
cnVlOwo+ICAgIGRvIGVjaG8gdmJkLSRET01JRC0kVkJEID51bmJpbmQ7Cj4gICAgZWNobyB1bmJv
dW5kOwo+ICAgIHNsZWVwIDU7Cj4gICAgZWNobyB2YmQtJERPTUlELSRWQkQgPmJpbmQ7Cj4gICAg
ZWNobyBib3VuZDsKPiAgICBzbGVlcCAzOwo+ICAgIGRvbmUKPiAKPiBpbiBkb20wIGZyb20gL3N5
cy9idXMveGVuLWJhY2tlbmQvZHJpdmVycy92YmQgdG8gY29udGludW91c2x5IHVuYmluZCBhbmQK
PiByZS1iaW5kIGl0cyBzeXN0ZW0gZGlzayBpbWFnZS4KCkNvdWxkIHlvdSBkbyB0aGUgc2FtZSB0
ZXN0IHdpdGggbWl4ZWQgcmVhZHMvd3JpdGVzIGFuZCB2ZXJpZmljYXRpb24gb2YKdGhlIHJlYWQv
d3JpdHRlbiBkYXRhLCBwbGVhc2U/IEEgd3JpdGUtb25seSB0ZXN0IGlzIG5vdCBfdGhhdF8KY29u
dmluY2luZyByZWdhcmRpbmcgY29ycmVjdG5lc3MuIEl0IG9ubHkgcHJvdmVzIHRoZSBndWVzdCBp
cyBub3QKY3Jhc2hpbmcuCgpJJ20gZmluZSB3aXRoIHRoZSBnZW5lcmFsIGFwcHJvYWNoLCB0aG91
Z2guCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
