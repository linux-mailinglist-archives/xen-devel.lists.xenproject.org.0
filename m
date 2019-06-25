Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 145B852712
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 10:49:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfh5d-0006z0-MX; Tue, 25 Jun 2019 08:46:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HbZU=UY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hfh5c-0006yv-Kv
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 08:46:08 +0000
X-Inumbo-ID: a9bdf712-9725-11e9-9f9c-df31078f3150
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a9bdf712-9725-11e9-9f9c-df31078f3150;
 Tue, 25 Jun 2019 08:46:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7AF7D2B;
 Tue, 25 Jun 2019 01:46:02 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C6E33F718;
 Tue, 25 Jun 2019 01:46:01 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <a7c44d926cbe4a0e6447c4aaf8d9862e@sslemail.net>
 <af3fe48d-afaa-3184-e142-9a1e2b8574f4@arm.com>
 <2ed30cde-e2ab-745e-94f5-0cf6155c9122@mxnavi.com>
 <7c645dfb-72f5-5fc2-b559-0a4d09ba8801@arm.com>
 <36531850-15de-2642-6f28-c752a360959c@mxnavi.com>
 <alpine.DEB.2.21.1906241109440.2468@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1906241121070.2468@sstabellini-ThinkPad-T480s>
 <bc042ae4-db0a-6b25-1e9c-d71a73a0315d@arm.com>
 <alpine.DEB.2.21.1906241313480.2468@sstabellini-ThinkPad-T480s>
 <c253cdaf-658d-01ce-9d32-273db4a84f17@arm.com>
 <alpine.DEB.2.21.1906241435510.2468@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <7975c4d5-310f-3041-a32c-128d9237616d@arm.com>
Date: Tue, 25 Jun 2019 09:46:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906241435510.2468@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: io: add function
 swap_mmio_handler()
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
Cc: chenbaodong <chenbaodong@mxnavi.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGlTdGVmYW5vLAoKT24gMjUvMDYvMjAxOSAwMDo1OSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+IE9uIE1vbiwgMjQgSnVuIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGksCj4+Cj4+
IE9uIDYvMjQvMTkgOToxNyBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+Pj4gT24gTW9u
LCAyNCBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+IEhpIFN0ZWZhbm8sCj4+Pj4K
Pj4+PiBPbiAyNC8wNi8yMDE5IDE5OjI3LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+Pj4+
IE9uIE1vbiwgMjQgSnVuIDIwMTksIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+Pj4+IE9u
IFRodSwgMTMgSnVuIDIwMTksIGNoZW5iYW9kb25nIHdyb3RlOgo+Pj4+PiBMZXQgbWUgYWRkIHRo
YXQgaWYgeW91IHByZWZlciB0byBkb2N1bWVudCBvbmUgb2YgdGhlIG90aGVyIGludGVyZmFjZXMK
Pj4+Pj4gbGlzdGVkIGFib3ZlIGluIG15IGVtYWlsLCB5b3UgYXJlIHdlbGNvbWUgdG8gcGljayBh
bm90aGVyIG9uZS4gRm9yCj4+Pj4+IGV4YW1wbGUsIHdlIGFyZSBhbHNvIG1pc3NpbmcgYSBkb2Mg
YWJvdXQgdGhlIERvbVUgbWVtb3J5IG1hcCwgbGlzdGluZwo+Pj4+PiBhbGwgbWVtb3J5IHJlZ2lv
bnMgd2l0aCBhZGRyZXNzZXMgYW5kIHNpemVzLCBib3RoIE1NSU8gYW5kIG5vcm1hbAo+Pj4+PiBt
ZW1vcnkuIEZvciB0aGF0LCBtb3N0IG9mIHRoZSBpbmZvcm1hdGlvbiBpczoKPj4+Pj4KPj4+Pj4g
eGVuL2luY2x1ZGUvcHVibGljL2FyY2gtYXJtLmgKPj4+Pj4KPj4+Pj4gQSB3ZWxsIHdyaXR0ZW4g
aW4tY29kZSBjb21tZW50IGluIGFyY2gtYXJtLmggd291bGQgYmUgT0ssIG9yIGFsc28gYQo+Pj4+
PiBkb2N1bWVudCB1bmRlciBkb2NzL21pc2MvYXJtLgo+Pj4+Cj4+Pj4gUGxlYXNlIG5vIGR1cGxp
Y2F0aW9uLCBpdCBpcyBhbHJlYWR5IHF1aXRlIGhhcmQgdG8gbWFpbnRhaW4gb25lIHBsYWNlLgo+
Pj4+IEluc3RlYWQsIHdlIHNob3VsZCBkb2N1bWVudCBhbGwgdGhlIGhlYWRlcnMgaW4gYSBkb2N1
bWVudGVkIGZvcm1hdCB0aGF0Cj4+Pj4gY2FuIGJlIGV4dHJhY3RlZCBhdXRvbWF0aWNhbGx5Lgo+
Pj4KPj4+IEFzIHdlIGhhdmUgbm8gc3VjaCB0aGluZyB0b2RheSAoYXMgZmFyIGFzIEkgYW0gYXdh
cmUpLCBwbGVhc2UgbWFrZSBhCj4+PiBwcm9wb3NhbCB3aXRoIGEgYml0IG1vcmUgZGV0YWlscywg
b3RoZXJ3aXNlIEkgZG9uJ3QgdGhpbmsgQmFvZG9uZyB3aWxsCj4+PiBiZSBhYmxlIHRvIHRha2Ug
dGhlIG5leHQgc3RlcC4KPj4KPj4gSSBkb24ndCBoYXZlIGEgY29uY3JldGUgcHJvcG9zYWwgc28g
ZmFyLiBFeGNlcHQgdGhhdCBkb2N1bWVudGF0aW9uIG91dHNpZGUgb2YKPj4gdGhlIGhlYWRlcnMg
aXMgYSBuby1nbyBmcm9tIG15IHNpZGUuIFRoZSBnb2FsIG9mIGRvY3VtZW50aW5nIHdpdGhpbiB0
aGUKPj4gaGVhZGVycyByYXRoZXIgdGhhbiBvdXRzaWRlIGlzIHlvdSBhbHNvIGhlbHAgdGhlIGRl
dmVsb3BlciBvZiBndWVzdCBPUy4KPj4KPj4gQSBmZXcgd2Vla3MgYWdvIElhbiBKYWNrc29uIHBv
aW50ZWQgdG8gZG9jcy94ZW4taGVhZGVycyBmb3IgYSBwb3RlbnRpYWwKPj4gc3ludGF4LiBTYWRs
eSwgdGhlcmUgYXJlIG5vIGRvY3VtZW50YXRpb24gb2YgdGhlIHNjcmlwdCBzbyBmYXIuIEkgaGF2
ZW4ndCBoYWQKPj4gdGltZSB0byBsb29rIGl0IHNvIGZhci4KPiAKPiBJbiB0aGF0IGNhc2UsIEkn
ZCBzdWdnZXN0IGZvciBCYW9kb25nIHRvIGVpdGhlciBwaWNrIHRoZSBkZXZpY2UgdHJlZQo+IGRv
Y3VtZW50YXRpb24gaXRlbSAoYXNzdW1pbmcgeW91IGFyZSBPSyB3aXRoIHRoYXQgb25lIGJlaW5n
IHVuZGVyCj4gZG9jcy9taXNjL2FybSkgb3IganVzdCB3cml0ZSBhIG5vcm1hbCBpbi1jb2RlIGNv
bW1lbnQgaW4gYXJjaC1hcm0uaCBmb3IKPiB0aGUgZG9tVSBtZW1vcnkgbWFwIG5vdCB3b3JyeWlu
ZyBhYm91dCB0aGUgZm9ybWF0IG9mIHRoZSBpbi1jb2RlIGNvbW1lbnQKPiBmb3Igbm93LgoKSSBk
b24ndCB0aGluayB3ZSBoYXZlIHNwZWNpZmljIHBsYWNlIGZvciBkb2N1bWVudGluZyBkZXZpY2Ut
dHJlZSBzbyAKZG9jcy9taXNjL2FybSB3b3VsZCBiZSBzdWl0YWJsZS4KClJlZ2FyZGluZyBpbi1j
b2RlIGNvbW1lbnQgaW4gYXJjaC1hcm0uaCBUaGlzIHdpbGwgYWx3YXlzIGJlIGFuIGltcHJvdmVt
ZW50IHRvIAp3aGF0IHdlIGhhdmUuIEhvd2V2ZXIsIGl0IHdvdWxkIGJlIGdvb2QgaWYgc29tZW9u
ZSB0YWtlIGFuIGFjdGlvbiB0byBmb3JtYWxpemUgCnRoZSBkb2N1bWVudGF0aW9uIGZvcm1hdC4K
CkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
