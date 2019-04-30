Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F40B9F0D1
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 09:01:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLMhg-0000HR-EW; Tue, 30 Apr 2019 06:57:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xzkl=TA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hLMhe-0000HM-Pt
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 06:57:22 +0000
X-Inumbo-ID: 336a3724-6b15-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 336a3724-6b15-11e9-843c-bc764e045a96;
 Tue, 30 Apr 2019 06:57:21 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 30 Apr 2019 00:57:20 -0600
Message-Id: <5CC7F1CE020000780022A3C4@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 30 Apr 2019 00:57:18 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-2-julien.grall@arm.com>
 <5CC1A4DD0200007800229083@prv1-mh.provo.novell.com>
 <e48677c1-45c1-b6bd-a0f3-d7f106608b76@arm.com>
In-Reply-To: <e48677c1-45c1-b6bd-a0f3-d7f106608b76@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 01/20] xen/const: Introduce _BITUL and
 _BITULL
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 oleksandr_tyshchenko@epam.com, xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI5LjA0LjE5IGF0IDE4OjQ3LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDI1LzA0LzIwMTkgMTM6MTUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyMi4wNC4x
OSBhdCAxODo0OSwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+IFRoZSBwYXR0ZXJu
IF9BQygxLCBVTHssTH0pIDw8IFggaXMgY29tbW9ubHkgdXNlZCBpbiB0aGUgaGVhZGVycyB0byBt
YWtlCj4+PiBkZWZpbmUgdXN1YWJsZSBpbiBib3RoIGFzc2VtYmx5IGFuZCBDLgo+Pj4KPj4+IFNv
IGludHJvZHVjZSBfQklUVUwgYW5kIF9CSVRVTEwgdG8gbWFrZSB0aGUgY29kZSBzbGlnaHRseSBt
b3JlIHJlYWRhYmxlLgo+PiAKPj4gSSBkb24ndCBwYXJ0aWN1bGFybHkgbGlrZSB0aGUgbmFtZXMs
IGFuZCBJIHNwZWNpZmljYWxseSBvYmplY3QgdG8KPj4gdGhlIGxlYWRpbmcgdW5kZXJzY29yZXMu
IEknbSBhZnJhaWQgSSBkb24ndCBoYXZlIGJldHRlcgo+PiBzdWdnZXN0aW9ucyBmb3IgdGhlIG5h
bWVzLCBidXQgd2hhdCBJJ2QgbGlrZSB0byBhc2sgZm9yIGlzIHRoYXQKPj4gYXQgbGVhc3QgdGhl
IFVMIC8gVUxMIGJlIHNvbWVob3cgc2VwYXJhdGVkIGZyb20gQklULiBPbmUKPj4gb3B0aW9uIG1p
Z2h0IGJlIHNvbWV0aGluZyBsaWtlCj4gCj4gVGhlIF8gbWF0Y2ggdGhlIG90aGVyIGFzc2VtYmx5
IG1hY3JvIHdlIGhhdmUgZGVmaW5lZCBpbiBjb25zdC5oLiBJIHVuZGVyc3RhbmQgCj4geW91IGRv
bid0IGxpa2UgdGhlIGxlYWRpbmcgdW5kZXJzY29yZXMsIGJ1dCBJIHRoaW5rIGNvbnNpc3RlbmN5
IGlzIGJldHRlciBoZXJlLgoKV2VsbCwgImRvbid0IGxpa2UiIHNvdW5kcyBsaWtlIHBlcnNvbmFs
IHRhc3RlLCBidXQgaXQgZ29lcyBiZXlvbmQKdGhhdDogSXQncyBhIG5hbWUgc3BhY2UgdmlvbGF0
aW9uLiBJJ20gYWxsIGZvciBjb25zaXN0ZW5jeSwgYnV0IG5vdAphdCB0aGUgZXhwZW5zZSBvZiB2
aW9sYXRpbmcgd2hhdCB0aGUgbGFuZ3VhZ2Ugc3RhbmRhcmQgZGVtYW5kcy4KSWYgY29uc2lzdGVu
Y3kgaXMgYSBnb2FsIGhlcmUsIHRoZSBvdGhlciBtYWNybyBuYW1lcyBzaG91bGQgYmUKY2hhbmdl
ZCByYXRoZXIgdGhhbiBpbnRyb2R1Y2luZyBtb3JlIG9mZmVuZGVycy4KCj4gVGhlIG1vcmUga2Vl
cGluZyB0aGUgc2FtZSBnZW5lcmljIG5hbWluZyBsb3dlciBkb3duIHRoZSBjaHVybiB0byBpbXBv
cnQgY29kZSAKPiBmcm9tIExpbnV4LgoKV2hpbGUgdGhpcyBpcyBhIGRlc2lyYWJsZSBnb2FsLCBh
cyBsb25nIGFzIExpbnV4IGRvZXNuJ3QgY2FyZSBhYm91dApuYW1lIHNwYWNlIHZpb2xhdGlvbnMg
d2Ugc2hvdWxkbid0IGZvbGxvdyB0aGVtIHNsYXZpc2hseSAob3IKZXN0YWJsaXNoIGZpcm1seSB0
aGF0IHdlIGRvbiN0IGNhcmUgYWJvdXQgbmFtZSBzcGFjZSB2aW9sYXRpb25zCmVpdGhlcikuCgo+
PiAjZGVmaW5lIEJJVChwb3MsIHNmeCkgKF9BQygxLCBzZngpIDw8IChwb3MpKQo+IAo+IEJJVCgp
IGlzIGFscmVhZHkgZGVmaW5lIGluIFhlbiBhbmQgdXNlZCBpbiBjb2RlIGNvbWluZyBmcm9tIExp
bnV4LiBJIHdvdWxkIAo+IHJhdGhlciBub3QgY2hhbmdlIHRoZSBwcm90b3R5cGUgZm9yIHRoaXMg
cmVhc29uLgoKVGhhdCdzIHVwIGZvciBkZWJhdGUuIE15IHByb3Bvc2FsIGlzIG1vcmUgZmxleGli
bGUgdGhhbiB3aGF0IHdlCmN1cnJlbnRseSBoYXZlLiBXaGV0aGVyIHRoYXQgb3V0d2VpZ2hzIGJl
Y29taW5nIGluY29tcGF0aWJsZQp3aXRoIExpbnV4J2VzIHNpbWlsYXJseSBuYW1lZCBtYWNyby4K
ClRhbGtpbmcgb2YgTGludXg6IE5vdyB0aGF0IEkndmUgbG9va2VkLCBJIGNhbid0IHJlYWxseSBm
aWd1cmUgd2h5CnRoZXkgaGF2ZSBib3RoIEJJVF9VTEwoKSAobGludXgvYml0cy5oKSBhbmQgQklU
VUxMIChsaW51eC9jb25zdC5oKS4KVGhlIGZvcm1lciBpcyBjbGVhcmx5IHJlZHVuZGFudCB3aXRo
IHRoZSBsYXR0ZXIgKGFuZCBCSVQoKSB3aXRoCkJJVFVMKCkpLiBJIGRvbid0IHRoaW5rIHdlIHNo
b3VsZCBmb2xsb3cgdGhhdCBtb2RlbC4gSW4gZmFjdCBJIHRoaW5rCkJJVCgpIGFzIHByb3Bvc2Vk
IGFib3ZlIGlzIHRoZW4gcmVhbGx5IHRoZSBiZXN0IHNvbHV0aW9uLCBjb3ZlcmluZwpldmVyeXRo
aW5nIHRoYXQncyBuZWVkZWQgaW4gb25lIGdvLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
