Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEC234F8A
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 20:06:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYDmz-0004im-F7; Tue, 04 Jun 2019 18:04:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cmcs=UD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hYDmx-0004iZ-8i
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 18:03:59 +0000
X-Inumbo-ID: 1fcf6406-86f3-11e9-82f1-8b68b979e533
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1fcf6406-86f3-11e9-82f1-8b68b979e533;
 Tue, 04 Jun 2019 18:03:58 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 866252075B;
 Tue,  4 Jun 2019 18:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559671437;
 bh=jP3HkM3GfoJRvKb8tDbjo1gsV4wIqqK75sP/WX20eAM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=IQcxB/NypLtm12wPAHZWL36OtD2ymxV9ObN7luHP1Zc1vufQvX9uDh6piZQQQPJJE
 Jgdj/64v/P0FssmYGespVJGnG2zvwPCd09eDlhMUWFJC3eNRHW6KK3VWCV8QmAFZ/r
 sbo0uHGE6YpzDr3E50Hw8c8R+jcGPBCJ4rxFc2l8=
Date: Tue, 4 Jun 2019 11:03:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Ian Jackson <ian.jackson@citrix.com>
In-Reply-To: <23798.45032.193051.369884@mariner.uk.xensource.com>
Message-ID: <alpine.DEB.2.21.1906041059430.14041@sstabellini-ThinkPad-T480s>
References: <osstest-136184-mainreport@xen.org>
 <20190516103727.GB5438@perard.uk.xensource.com>
 <c576ae9d-4a6e-1602-7f05-6fc2c7b26314@arm.com>
 <20190517172344.GE1245@perard.uk.xensource.com>
 <d2ac0071-149e-0c03-016c-d9ad2a423f5e@arm.com>
 <9df7707d-8aa4-2abf-d7c3-0fd101ec3e68@arm.com>
 <20190603171558.GF2126@perard.uk.xensource.com>
 <5CF618900200007800234E5F@prv1-mh.provo.novell.com>
 <5d8eac54-2c4d-3003-4017-0672716d0581@arm.com>
 <alpine.DEB.2.21.1906041000590.14041@sstabellini-ThinkPad-T480s>
 <014113e2-1481-ce57-1807-2cfa01a3a177@arm.com>
 <alpine.DEB.2.21.1906041026110.14041@sstabellini-ThinkPad-T480s>
 <23798.45032.193051.369884@mariner.uk.xensource.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [qemu-upstream-4.11-testing test] 136184:
 regressions - FAIL
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCA0IEp1biAyMDE5LCBJYW4gSmFja3NvbiB3cm90ZToKPiBTdGVmYW5vIFN0YWJlbGxp
bmkgd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtxZW11LXVwc3RyZWFtLTQuMTEtdGVzdGluZyB0
ZXN0XSAxMzYxODQ6IHJlZ3Jlc3Npb25zIC0gRkFJTCIpOgo+ID4gT24gVHVlLCA0IEp1biAyMDE5
LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiA+IFBlciB0aGUgZGlzY3Vzc2lvbiBiZWZvcmUsIHRo
ZSAuY29uZmlnIGlzIGRpZmZlcmVudCBiZXR3ZWVuIHRoZSAyIGZsaWdodHMuCj4gPiA+IFFFTVUg
dGVzdGluZyBpcyBub3Qgc2VsZWN0aW5nIENPTkZJR19MSVZFUEFUQ0ggd2hpbGUgc3RhZ2luZy00
LjExIGlzLgo+ID4gCj4gPiBIYXMgYW55Ym9keSB0cmllZCB0byBzdGFydCBzZWxlY3RpbmcgQ09O
RklHX0xJVkVQQVRDSCBpbiB0aGUgUUVNVSB0ZXN0aW5nCj4gPiBicmFuY2g/IElzIGl0IHBvc3Np
YmxlIHRvIGdpdmUgaXQgYSB0cnk/Cj4gCj4gSSBjYW4gZG8gdGhpcyB3ZSB0aGlua3MgaXQncyBk
ZXNpcmFibGUuICBCdXQgSSB0aGluayBpdCBpcyBwcm9iYWJseQo+IGFjdHVhbGx5IGhlbHBmdWwg
dG8gdGVzdCBib3RoLCBqdXN0IGluIGNhc2Ugbm9uLUxJVkVQQVRDSCBicmVha3MuICBBcwo+IGl0
IGp1c3QgaGF2ZS4KPiAKPiBBSVVJIHRoaXMgaXMgdGhvdWdodCB0byBiZSBxdWl0ZSBhIHJhcmUg
cHJvYmxlbSwgc28gaXQgc2hvd2luZyB1cCBpbiBhCj4gcWVtdSBicmFuY2ggaXMgT0suCj4gCj4g
T3RoZXJ3aXNlIG1heWJlIHdlIHdvdWxkIGhhdmUgdG8gYWRkIGJvdGggd2l0aC0gYW5kIHdpdGhv
dXQtTElWRVBBVENICj4gdGVzdHMgdG8gdGhlIHhlbi0qIGZsaWdodHMuICBXZSBhbHJlYWR5IGhh
dmUgYm90aCB3aXRoLSBhbmQKPiB3aXRob3V0LVhTTSwgYW5kIHRoaXMgd291bGQgYWRkIGFub3Ro
ZXIgZGltZW5zaW9uIHRvIHRoZSBidWlsZCBtYXRyaXguCj4gQW5kIHdlIHdvdWxkIGhhdmUgdG8g
ZGVjaWRlIHdoYXQgc3Vic2V0IG9mIHRoZSB0ZXN0cyBzaG91bGQgYmUgcnVuIGluCj4gZWFjaCBj
b25maWd1cmF0aW9uLgoKSGkgSWFuLAoKSSBhZ3JlZSB3aXRoIHlvdSBpdCB3b3VsZCBiZSBkZXNp
cmFibGUgdG8gdGVzdCBib3RoIExJVkVQQVRDSCBhbmQKbm9uLUxJVkVQQVRDSCwgYW5kIEkgdW5k
ZXJzdGFuZCBhYm91dCBsaW1pdGF0aW9uIG9mIHJlc291cmNlcyBhbmQgdGVzdAptYXRyaXggZXhw
bG9zaW9uLgoKR2l2ZW4gdGhlIGNoYW5jZSwgSSB0aGluayBpdCB3b3VsZCBiZSBiZXR0ZXIgaWYg
d2UgaGFkIGFuIGV4cGxpY2l0IHRlc3QKYWJvdXQgTElWRVBBVENIIHJhdGhlciB0aGFuIGEgImhp
ZGRlbiIgZW5hYmxlbWVudCBvZiBpdCB3aXRoaW4gYW5vdGhlcgpkaWZmZXJlbnQgdGVzdC4gT3Ig
bWF5YmUganVzdCBjYWxsIGl0IG91dCBleHBsaWNpdGx5LCByZW5hbWluZyB0aGUgdGVzdApydW4g
dG8gcWVtdS11cHN0cmVhbS1saXZlcGF0Y2ggb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4gSW4gYW55
IGNhc2UsIEknbGwKbGVhdmUgaXQgdG8geW91LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
