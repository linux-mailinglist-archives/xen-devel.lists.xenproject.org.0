Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D3E183442
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 16:16:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCPUh-00040l-GS; Thu, 12 Mar 2020 15:11:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7iz2=45=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jCPUf-00040Z-WF
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 15:11:30 +0000
X-Inumbo-ID: bfa9e510-6473-11ea-a6c1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bfa9e510-6473-11ea-a6c1-bc764e2007e4;
 Thu, 12 Mar 2020 15:11:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 39BF0ABF4;
 Thu, 12 Mar 2020 15:11:28 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <8a151dd0-d083-d242-566c-f1faee084ae2@citrix.com>
 <658ef23d-f6e1-dbf8-8805-b84e32ffb6fa@suse.com>
 <20200312105639.GG24458@Air-de-Roger.citrite.net>
 <7c1fea74-15eb-0006-a99c-53fb4c4a676f@suse.com>
 <20200312134435.GJ24458@Air-de-Roger.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8593845b-52e1-76c7-5b0e-8a8864fc9856@suse.com>
Date: Thu, 12 Mar 2020 16:11:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200312134435.GJ24458@Air-de-Roger.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] nvmx deadlock with MSR bitmaps
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
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDMuMjAyMCAxNDo0NCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUaHUsIE1h
ciAxMiwgMjAyMCBhdCAxMjoxMjoxMlBNICswMTAwLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+PiBP
biAxMi4wMy4yMCAxMTo1NiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+IE9uIFRodSwgTWFy
IDEyLCAyMDIwIGF0IDA5OjU5OjQ4QU0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9u
IDExLjAzLjIwMjAgMTk6MDQsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4+IFNwZWNpZmljYWxs
eSwgdGhpcyBpcyBhIHN3aXRjaCBmcm9tIGFuIEhWTSB2Y3B1LCB0byBhIFBWIHZjcHUsIHdoZXJl
IHRoZQo+Pj4+PiBtYXBjYWNoZSBjb2RlIHRyaWVzIHRvIGFjY2VzcyB0aGUgcGVyLWRvbWFpbiBt
YXBwaW5ncyBvbiB0aGUgSFZNIG1vbml0b3IKPj4+Pj4gdGFibGUuwqAgSXQgZW5kcyB1cCB0cnlp
bmcgdG8gcmVjdXJzaXZlbHkgYWNxdWlyZSB0aGUgbWFwY2FjaGUgbG9jayB3aGlsZQo+Pj4+PiB0
cnlpbmcgdG8gd2FsayAlY3IyIHRvIGlkZW50aWZ5IHRoZSBzb3VyY2Ugb2YgdGhlIGZhdWx0Lgo+
Pj4+Pgo+Pj4+PiBGb3IgbnZteC0+bXNyX21lcmdlZCwgdGhpcyBuZWVkcyB0byBlaXRoZXIgYmUg
YSB4ZW5oZWFwIHBhZ2UsIG9yIGEKPj4+Pj4gZ2xvYmFsbHkgbWFwcGVkIGRvbWhlYXAgcGFnZS7C
oCBJJ2xsIGRyYWZ0IGEgcGF0Y2ggaW4gYSBtb21lbnQuCj4+Pj4+Cj4+Pj4+IEZvciBtYXBfZG9t
YWluX3BhZ2UoKSwgaXMgdGhlcmUgYW55dGhpbmcgd2UgY2FuIHJhdGlvbmFsbHkgZG8gdG8gYXNz
ZXJ0Cj4+Pj4+IHRoYXQgaXQgaXNuJ3QgY2FsbGVkIGluIHRoZSBtaWRkbGUgb2YgYSBjb250ZXh0
IHN3aXRjaD/CoCBUaGlzIGlzIHRoZQo+Pj4+PiBraW5kIG9mIHRoaW5nIHdoaWNoIG5lZWRzIHRv
IGJsb3cgdXAgcmVsaWFibHkgaW4gYSBkZWJ1ZyBidWlsZC4KPj4+Pgo+Pj4+IFdlbGwsIGl0J3Mg
bm90IGluaGVyZW50bHkgdW5zYWZlIHRvIGRvLCBpdCdzIGp1c3QgdGhhdAo+Pj4+IG1hcGNhY2hl
X2N1cnJlbnRfdmNwdSgpIHdvdWxkIG5lZWQgdG8gYXZvaWQgdXNpbmcgY3VycmVudCBmcm9tCj4+
Pj4gY29udGV4dF9zd2l0Y2goKSdzIGNhbGwgdG8gc2V0X2N1cnJlbnQoKSB0aHJvdWdoIHRvCj4+
Pj4gX19jb250ZXh0X3N3aXRjaCgpJ3MgY2FsbCB0byB3cml0ZV9wdGJhc2UoKS4gQSBwb3NzaWJs
ZQo+Pj4+IGRldGVjdGlvbiAoaWYgd2UgZG9uJ3Qgd2FudCB0byBtYWtlIHRoZSBjYXNlIHdvcmsp
IHdvdWxkCj4+Pj4gc2VlbSB0byBiZSBBU1NFUlQoY3VycmVudCA9PSB0aGlzX2NwdShjdXJyX3Zj
cHUpKS4gQnV0IG9mIGNvdXJzZQo+Pj4+IHRoZXJlJ3MgYWxzbyB0aGlzIGV4dHJhIGxvZ2ljIGlu
IG1hcGNhY2hlX2N1cnJlbnRfdmNwdSgpIHRvIGRlYWwKPj4+PiB3aXRoIGEgUFYgdkNQVSBoYXZp
bmcgYSBudWxsIHYtPmFyY2guZ3Vlc3RfdGFibGUsIHdoaWNoIEknbSBvbmNlCj4+Pj4gYWdhaW4g
c3RydWdnbGluZyB0byBzZWUgdW5kZXIgd2hhdCBjb25kaXRpb25zIGl0IG1pZ2h0IGhhcHBlbi4K
Pj4+PiBUaGUgRG9tMCBidWlsZGluZyBjYXNlIGNhbid0IGJlIG1lYW50IHdpdGggdGhlcmUgYmVp
bmcKPj4+PiBtYXBjYWNoZV9vdmVycmlkZV9jdXJyZW50KCkgb24gdGhhdCBwYXRoLiBJJ20gd29u
ZGVyaW5nIGlmIHRoZQo+Pj4+IGNvbW1lbnQgdGhlcmUgaXMgbWlzbGVhZGluZyBhbmQgaXQncyBy
ZWFsbHkgdG8gY292ZXIgdGhlIGNhc2UKPj4+PiB3aGVyZSwgY29taW5nIGZyb20gYSBQViB2Q1BV
LCBjdXJyZW50IHdhcyBhbHJlYWR5IHNldCB0byB0aGUKPj4+PiBpZGxlIHZDUFUgYnkgY29udGV4
dF9zd2l0Y2goKSAod2hpY2ggd291bGQgaGF2ZSBhIG51bGwKPj4+PiB2LT5hcmNoLmd1ZXN0X3Rh
YmxlKSAtIEkgd291bGRuJ3QgY2FsbCB0aGlzICJ3ZSBhcmUgcnVubmluZyBhCj4+Pj4gcGFyYXZp
cnR1YWxpc2VkIGd1ZXN0Ii4gQnV0IGluIHN1Y2ggYSBjYXNlIHRoZSBsb2dpYyBoZXJlIHdvdWxk
Cj4+Pj4gc2ltcGx5IGJlIGEgKHRvbykgc3BlY2lhbCBjYXNlIG9mIHdoYXQgeW91J3JlIGRlc2Ny
aWJpbmcgYXMgdGhlCj4+Pj4gaXNzdWUgd2l0aCBuVk1YLgo+Pj4KPj4+IExvb2tpbmcgYXQgdGhl
IGNvZGUgaW4gY29udGV4dF9zd2l0Y2ggYW5kIF9fY29udGV4dF9zd2l0Y2ggd291bGQgaXQgYmUK
Pj4+IHBvc3NpYmxlIHRvIHNldCBjdXJyZW50IHRvIHRoZSBuZXh0IHZDUFUgYWZ0ZXIgYWxsIHRo
ZSBmcm9tIGhvb2tzIGhhdmUKPj4+IGJlZW4gY2FsbGVkPwo+Pj4KPj4+IEllOiBzZXRfY3VycmVu
dCBjb3VsZCBiZSBtb3ZlZCBpbnRvIF9fY29udGV4dF9zd2l0Y2ggYWZ0ZXIgdGhlIGNhbGwgdG8K
Pj4+IHBkLT5hcmNoLmN0eHRfc3dpdGNoLT5mcm9tKHApLgo+Pgo+PiBObywgd291bGRuJ3Qgd29y
ay4gV2hlbiBzd2l0Y2hpbmcgdG8gaWRsZSBfX2NvbnRleHRfc3dpdGNoKCkgaXMgbm9ybWFsbHkK
Pj4gbm90IGNhbGxlZCBpbiBvcmRlciB0byBhdm9pZCBzd2l0Y2hpbmcgdGhlIGFkZHJlc3Mgc3Bh
Y2UgaW4gY2FzZSB0aGUKPj4gc2FtZSB2Y3B1IHdpbGwgYmUgc2NoZWR1bGVkIGFnYWluIGFmdGVy
IGlkbGUuIFRoaXMgaXMgdGhlIHJlYXNvbiB3aHkKPj4gY3VycmVudCBhbmQgY3Vycl92Y3B1IGNh
biBiZSBkaWZmZXJlbnQuCj4gCj4gU2luY2UgdGhlIGlkbGUgdkNQVSBjb250ZXh0IHN3aXRjaCBp
cyBhbHJlYWR5IGEgc3BlY2lhbCBjYXNlIHdlIGNvdWxkCj4gbWF5YmUgcGxhY2UgdGhlIGNhbGwg
dG8gc2V0X2N1cnJlbnQgaW4gc3VjaCBzcGVjaWFsIGhhbmRsaW5nLCB3aGlsZQo+IGxlYXZpbmcg
dGhlIGNhbGwgZm9yIHRoZSByZXN0IG9mIHZDUFVzIGluIF9fY29udGV4dF9zd2l0Y2ggYWZ0ZXIg
dGhlCj4gLT5mcm9tIGhvb2tzIGhhdmUgYmVlbiBleGVjdXRlZD8KPiAKPj4+IEknbSBhbHNvIG5v
dCBzdXJlIEkgdW5kZXJzdGFuZCB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIGNvbnRleHRfc3dpdGNo
Cj4+PiBhbmQgX19jb250ZXh0X3N3aXRjaCwgYW5kIGhvdyBhcmUgY2FsbGVycyBzdXBwb3NlZCB0
byB1c2UgdGhlbS4KPiAKPiBKYW4gcG9pbnRzIG91dCB0aGF0IF9fY29udGV4dF9zd2l0Y2ggc2ln
bmFscyBhIHBlbmRpbmcgY29udGV4dCBzd2l0Y2gsCj4gaW4gd2hpY2ggY2FzZSBteSBwcm9wb3Nh
bCB0byB1c2Ugc2V0X2N1cnJlbnQgbWlnaHQgbm90IGJlIHN1aXRhYmxlLCBhcwo+IHdlIHdvdWxk
IGJlIGNoYW5naW5nIGN1cnJlbnQgd2l0aG91dCBhY3R1YWxseSBkb2luZyB0aGUgY29udGV4dAo+
IHN3aXRjaD8KPiAKPiBJIGFsc28gd29uZGVyIHdoeSBfX2NvbnRleHRfc3dpdGNoIHRoZW4gbmVl
ZHMgdG8gY2FsbCB0aGUgLT5mcm9tIGhvb2sKPiBqdXN0IHRvIHNpZ25hbCBhIHBlbmRpbmcgY29u
dGV4dCBzd2l0Y2guIEl0IHNlZW1zIGxpa2UKPiBfX2NvbnRleHRfc3dpdGNoIGRvZXMgYSBsb3Qg
b2Ygd29yayBqdXN0IHRvIHNpZ25hbCBhIGNvbnRleHQgc3dpdGNoLAo+IHdoaWNoIHdpbGwgdGhl
biBiZSByZWRvbmUgd2hlbiBjb250ZXh0X3N3aXRjaCBpcyBhY3R1YWxseSBjYWxsZWQ/CgpXZWxs
LCAic2lnbmFsIiB3YXMgcGVyaGFwcyBub3QgdGhlIGJlc3QgY2hvaWNlIG9mIGEgd29yZC4KCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
