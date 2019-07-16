Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC616A10F
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 05:57:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnEYq-0002y4-CM; Tue, 16 Jul 2019 03:55:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YMz1=VN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hnEYp-0002xz-7y
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 03:55:27 +0000
X-Inumbo-ID: 88b076cc-a77d-11e9-915b-c71feea7f2c7
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 88b076cc-a77d-11e9-915b-c71feea7f2c7;
 Tue, 16 Jul 2019 03:55:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3C1C7AB9D;
 Tue, 16 Jul 2019 03:55:21 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Andy Lutomirski <luto@kernel.org>, Andi Kleen <ak@linux.intel.com>
References: <20190715113739.17694-1-jgross@suse.com>
 <87y30zfe9z.fsf@linux.intel.com>
 <CALCETrUn=gho5Oug-yYvF2d1WYCe7gvtx+bXuhJ8LTjb9guvuA@mail.gmail.com>
 <bbf1ea2d-1206-eb54-3611-4c9b9fad4aa4@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <b466e2eb-2d9c-46cb-c239-a93967ccf74c@suse.com>
Date: Tue, 16 Jul 2019 05:55:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <bbf1ea2d-1206-eb54-3611-4c9b9fad4aa4@citrix.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 0/2] Remove 32-bit Xen PV guest support
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, X86 ML <x86@kernel.org>,
 Alok Kataria <akataria@vmware.com>, LKML <linux-kernel@vger.kernel.org>,
 LinuxVirtualization <virtualization@lists.linux-foundation.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMDcuMTkgMTk6MzksIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMTUvMDcvMjAxOSAx
ODoyOCwgQW5keSBMdXRvbWlyc2tpIHdyb3RlOgo+PiBPbiBNb24sIEp1bCAxNSwgMjAxOSBhdCA5
OjM0IEFNIEFuZGkgS2xlZW4gPGFrQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4+PiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+IHdyaXRlczoKPj4+Cj4+Pj4gVGhlIGxvbmcgdGVybSBw
bGFuIGhhcyBiZWVuIHRvIHJlcGxhY2UgWGVuIFBWIGd1ZXN0cyBieSBQVkguIFRoZSBmaXJzdAo+
Pj4+IHZpY3RpbSBvZiB0aGF0IHBsYW4gYXJlIG5vdyAzMi1iaXQgUFYgZ3Vlc3RzLCBhcyB0aG9z
ZSBhcmUgdXNlZCBvbmx5Cj4+Pj4gcmF0aGVyIHNlbGRvbSB0aGVzZSBkYXlzLiBYZW4gb24geDg2
IHJlcXVpcmVzIDY0LWJpdCBzdXBwb3J0IGFuZCB3aXRoCj4+Pj4gR3J1YjIgbm93IHN1cHBvcnRp
bmcgUFZIIG9mZmljaWFsbHkgc2luY2UgdmVyc2lvbiAyLjA0IHRoZXJlIGlzIG5vCj4+Pj4gbmVl
ZCB0byBrZWVwIDMyLWJpdCBQViBndWVzdCBzdXBwb3J0IGFsaXZlIGluIHRoZSBMaW51eCBrZXJu
ZWwuCj4+Pj4gQWRkaXRpb25hbGx5IE1lbHRkb3duIG1pdGlnYXRpb24gaXMgbm90IGF2YWlsYWJs
ZSBpbiB0aGUga2VybmVsIHJ1bm5pbmcKPj4+PiBhcyAzMi1iaXQgUFYgZ3Vlc3QsIHNvIGRyb3Bw
aW5nIHRoaXMgbW9kZSBtYWtlcyBzZW5zZSBmcm9tIHNlY3VyaXR5Cj4+Pj4gcG9pbnQgb2Ygdmll
dywgdG9vLgo+Pj4gTm9ybWFsbHkgd2UgaGF2ZSBhIGRlcHJlY2F0aW9uIHBlcmlvZCBmb3IgZmVh
dHVyZSByZW1vdmFscyBsaWtlIHRoaXMuCj4+PiBZb3Ugd291bGQgbWFrZSB0aGUga2VybmVsIHBy
aW50IGEgd2FybmluZyBmb3Igc29tZSByZWxlYXNlcywgYW5kIHdoZW4KPj4+IG5vIHVzZXIgY29t
cGxhaW5zIHlvdSBjYW4gdGhlbiByZW1vdmUuIElmIGEgdXNlciBjb21wbGFpbnMgeW91IGNhbid0
Lgo+Pj4KPj4gQXMgSSB1bmRlcnN0YW5kIGl0LCB0aGUga2VybmVsIHJ1bGVzIGRvIGFsbG93IGNo
YW5nZXMgbGlrZSB0aGlzIGV2ZW4KPj4gaWYgdGhlcmUncyBhIGNvbXBsYWludDogdGhpcyBpcyBh
IHBhdGNoIHRoYXQgcmVtb3ZlcyB3aGF0IGlzCj4+IGVmZmVjdGl2ZWx5IGhhcmR3YXJlIHN1cHBv
cnQuICBJZiB0aGUgbWFpbnRlbmFuY2UgY29zdCBleGNlZWRzIHRoZQo+PiB2YWx1ZSwgdGhlbiBy
ZW1vdmFsIGlzIGZhaXIgZ2FtZS4gIChPYnZpb3VzbHkgd2Ugd2VpZ2h0IHRoZSB2YWx1ZSB0bwo+
PiBwcmVzZXJ2aW5nIGNvbXBhdGliaWxpdHkgcXVpdGUgaGlnaGx5LCBidXQgaW4gdGhpcyBjYXNl
LCBYZW4gZHJvcHBlZAo+PiAzMi1iaXQgaGFyZHdhcmUgc3VwcG9ydCBhIGxvbmcgdGltZSBhZ28u
ICBJZiB0aGUgWGVuIGh5cGVydmlzb3Igc2F5cwo+PiB0aGF0IDMyLWJpdCBQViBndWVzdCBzdXBw
b3J0IGlzIGRlcHJlY2F0ZWQsIGl0J3MgZGVwcmVjYXRlZC4pCj4+Cj4+IFRoYXQgYmVpbmcgc2Fp
ZCwgYSB3YXJuaW5nIG1pZ2h0IG5vdCBiZSBhIGJhZCBpZGVhLiAgV2hhdCdzIHRoZQo+PiBjdXJy
ZW50IHN0YXR1cyBvZiB0aGlzIGluIHVwc3RyZWFtIFhlbj8KPiAKPiBTbyBwZXJzb25hbGx5LCBJ
J2QgcHJlZmVyIHRvIHNlZSBzdXBwb3J0IHN0YXksIGJ1dCBhdCB0aGUgZW5kIG9mIHRoZSBkYXkK
PiBpdCBpcyBKdWVyZ2VuJ3MgY2hvaWNlIGFzIHRoZSBtYWludGFpbmVyIG9mIHRoZSBjb2RlLgoK
RXNwZWNpYWxseSBvbiB0aGUgc2VjdXJpdHkgZnJvbnQgd2UgYXJlIHVuc2FmZSB3aXRoIDMyLWJp
dCBQViBMaW51eC4KQW5kIG1ha2luZyBpdCBzYWZlIHdpbGwgbWFrZSBpdCBzbyBzbG93IHRoYXQg
dGhlIG5lZWRlZCBlZmZvcnQgaXMgbm90CnNwZW50IHZlcnkgd2VsbC4KCgpKdWVyZ2VuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
