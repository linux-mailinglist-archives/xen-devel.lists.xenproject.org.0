Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C49B87FE
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 01:21:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iB5gL-0003yg-60; Thu, 19 Sep 2019 23:17:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z9bl=XO=ellerman.id.au=michael@srs-us1.protection.inumbo.net>)
 id 1iB5gJ-0003yb-Mv
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 23:17:47 +0000
X-Inumbo-ID: ae5bbafa-db33-11e9-978d-bc764e2007e4
Received: from ozlabs.org (unknown [203.11.71.1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae5bbafa-db33-11e9-978d-bc764e2007e4;
 Thu, 19 Sep 2019 23:17:44 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46ZCS303qyz9s7T;
 Fri, 20 Sep 2019 09:17:38 +1000 (AEST)
Date: Fri, 20 Sep 2019 09:17:30 +1000
User-Agent: K-9 Mail for Android
In-Reply-To: <CAHk-=wjXF63BKNJH=GtnnoJmXZHEnRwjgeu4foJQvFYYBm9HHA@mail.gmail.com>
References: <20190918152748.GA21241@infradead.org>
 <CAHk-=wjXF63BKNJH=GtnnoJmXZHEnRwjgeu4foJQvFYYBm9HHA@mail.gmail.com>
MIME-Version: 1.0
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Simek <monstr@monstr.eu>
From: Michael Ellerman <michael@ellerman.id.au>
Message-ID: <D422FEED-06F6-44BE-955F-90318693FD96@ellerman.id.au>
Subject: Re: [Xen-devel] [GIT PULL] dma-mapping updates for 5.4
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
Cc: xen-devel@lists.xenproject.org, iommu <iommu@lists.linux-foundation.org>,
 linux-mmc@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyMCBTZXB0ZW1iZXIgMjAxOSA2OjMzOjUwIGFtIEFFU1QsIExpbnVzIFRvcnZhbGRzIDx0
b3J2YWxkc0BsaW51eC1mb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj5PbiBXZWQsIFNlcCAxOCwgMjAx
OSBhdCA4OjI3IEFNIENocmlzdG9waCBIZWxsd2lnIDxoY2hAaW5mcmFkZWFkLm9yZz4KPndyb3Rl
Ogo+Pgo+PiBwbGVhc2UgcHVsbCB0aGUgZG1hLW1hcHBpbmcgdXBkYXRlcyBmb3IgNS40Lgo+Cj5Q
dWxsZWQuCj4KPj4gSW4gYWRkaXRpb24gdG8gdGhlIHVzdWFsIEtjb25maWcgY29uZmxpY3Mgd2hl
cmUgeW91IGp1c3Qgd2FudCB0byBrZWVwCj4+IGJvdGggZWRpdHMgdGhlcmUgYXJlIGEgZmV3IG1v
cmUgaW50ZXJlc3RpbmcgbWVyZ2UgaXNzdWVzIHRoaXMgdGltZToKPj4KPj4gIC0gbW9zdCBpbXBv
cnRhbmx5IHBvd2VycGMgYW5kIG1pY3JvYmxhemUgYWRkIG5ldyBjYWxsZXJzIG9mCj4+ICAgIGRt
YV9hdG9taWNfcG9vbF9pbml0LCB3aGlsZSB0aGlzIHRyZWUgbWFya3MgdGhlIGZ1bmN0aW9uIHN0
YXRpYwo+PiAgICBhbmQgY2FsbHMgaXQgZnJvbSBhIGNvbW1vbiBwb3N0Y29yZV9pbml0Y2FsbCgp
LiAgVGhlIHRyaXZpYWwKPj4gICAgZnVuY3Rpb25zIGFkZGVkIGluIHBvd2VycGMgYW5kIG1pY3Jv
YmxhemUgYWRkaW5nIHRoZSBjYWxscwo+PiAgICBuZWVkIHRvIGJlIHJlbW92ZWQgZm9yIHRoZSBj
b2RlIHRvIGNvbXBpbGUuICBUaGlzIHdpbGwgbm90IHNob3cgdXAKPj4gICAgYXMgYSBtZXJnZSBj
b25mbGljdCBhbmQgbmVlZHMgdG8gYmUgZGVhbHQgd2l0aCBtYW51YWxseSEKPgo+U28gSSBoYXZl
bid0IGdvdHRlbiB0aGUgcG93ZXJwYyBvciBtaWNyb2JsYXplIHB1bGwgcmVxdWVzdHMgeWV0LCBz
bwo+SSdtIG5vdCBhYmxlIHRvIGZpeCB0aGF0IHBhcnQgdXAgeWV0Lgo+Cj5JbnRlYWQsIEknbSBj
YydpbmcgTWljaGFlbCBFbGxlcm1hbiBhbmQgTWljaGFsIFNpbWVrIHRvIGFzayB0aGVtIHRvCj5y
ZW1pbmQgbWUgd2hlbiB0aGV5IF9kb18gc2VuZCB0aG9zZSBwdWxsIHJlcXVlc3RzLCBzaW5jZSBv
dGhlcndpc2UgSQo+bWF5IHdlbGwgZm9yZ2V0IGFuZCBtaXNzIGl0LiBXaXRob3V0IGFuIGFjdHVh
bCBkYXRhIGNvbmZsaWN0LCBhbmQKPnNpbmNlIHRoaXMgd29uJ3Qgc2hvdyB1cCBpbiBteSBidWls
ZCB0ZXN0cyBlaXRoZXIsIGl0IHdvdWxkIGJlIHZlcnkKPmVhc3kgZm9yIG1lIHRvIGZvcmdldC4K
Pgo+TWljaGFbZV1sLCBjYW4geW91IGJvdGggcGxlYXNlIG1ha2Ugc3VyZSB0byByZW1pbmQgbWU/
CgpZZWFoIEkgd2FzIGF3YXJlIG9mIGl0LCBhbmQgd2lsbCBtYWtlIHN1cmUgdG8gcmVtaW5kIHlv
dSBpbiBteSBwdWxsIHJlcXVlc3QuCgpjaGVlcnMKCi0tIApTZW50IGZyb20gbXkgQW5kcm9pZCBw
aG9uZSB3aXRoIEstOSBNYWlsLiBQbGVhc2UgZXhjdXNlIG15IGJyZXZpdHkuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
