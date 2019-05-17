Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 246AD214A8
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 09:38:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRXNz-0005RB-4R; Fri, 17 May 2019 07:34:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mYL4=TR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRXNx-0005R6-FA
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 07:34:33 +0000
X-Inumbo-ID: 35c25406-7876-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 35c25406-7876-11e9-8980-bc764e045a96;
 Fri, 17 May 2019 07:34:31 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 17 May 2019 01:34:31 -0600
Message-Id: <5CDE6407020000780022FF63@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 17 May 2019 01:34:31 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Lars Kurth" <lars.kurth@citrix.com>
References: <0648312f1c78e519142ff1829a984e7e965bf3c7.1557957269.git.lars.kurth@citrix.com>
 <5CDD3FA1020000780022F903@prv1-mh.provo.novell.com>
 <530E0649-256F-4A11-B887-E665B3C92979@citrix.com>
In-Reply-To: <530E0649-256F-4A11-B887-E665B3C92979@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] Add TRACKING.IMPORTS to xen.git to more
 easily manage imported files that need to be kept in sync with an upstream
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>,
 committers@xenproject.org, xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE2LjA1LjE5IGF0IDE3OjU0LCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPiB3cm90ZToK
Cj4gCj4g77u/T24gMTYvMDUvMjAxOSwgMDQ6NDcsICJKYW4gQmV1bGljaCIgPEpCZXVsaWNoQHN1
c2UuY29tPiB3cm90ZToKPiAKPiAgICAgPj4+IE9uIDE2LjA1LjE5IGF0IDAwOjE4LCA8bGFycy5r
dXJ0aEBjaXRyaXguY29tPiB3cm90ZToKPiAgICAgPiArIyBNYXBwaW5ncyB0byB0cmFjayBmaWxl
cyBhcmUgb2YgdGhlIGZvbGxvd2luZyBmb3JtYXQKPiAgICAgPiArIyAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgICAgPiArIyBtYW51YWx8YXV0
byB4ZW4tZmlsZSBuYW1lLW9mLW9yaWdpbmFsLXJlcG8gb3JpZ2luYWwtZmlsZSBjb21taXQtaWQK
PiAgICAgPiArIwo+ICAgICA+ICsjIGF1dG86Cj4gICAgID4gKyMgICBUaGUgeGVuLWZpbGUgbmVl
ZHMgdG8gdHJhY2sgdGhlIHRoZSBvcmlnaW5hbC1maWxlIGV4YWN0bHkKPiAgICAgPiArIyAgIElu
IG90aGVyIHdvcmRzLCB3ZSBjYW4gYXV0b21hdGljYWxseSB1cGRhdGUgdGhlIGZpbGUgdXNpbmcg
YSBzY3JpcHQKPiAgICAgCj4gICAgIERvIHdlIGhhdmUgX2FueV8gZXhhbXBsZSBvZiB0aGlzPyBJ
IGNhbid0IGV2ZW4gaW1hZ2luZSBvbmUsIGR1ZQo+ICAgICB0byBlLmcuIG91ciBpbmNsdWRlcyBh
bGwgc3RhcnRpbmcgd2l0aCB4ZW4vIHdoZXJlYXMgTGludXgnZXMgKGp1c3QgdG8KPiAgICAgdGFr
ZSBhcyBleGFtcGxlKSBhbGwgc3RhcnQgd2l0aCBsaW51eC8uIFBlcmhhcHMgImF1dG8iIG5lZWRz
IHRvCj4gICAgIGluY2x1ZGUgc2VkIGV4cHJlc3Npb25zIHRoYXQgbmVlZCB0byBiZSBhcHBsaWVk
IGJlZm9yZSBhY3R1YWxseQo+ICAgICBhcHBseWluZyB0aGUgb3JpZ2luYWwgY2hhbmdlIHRvIG91
ciB0cmVlPwo+IAo+IEkgYW0gbm90IHN1cmUgSSBmdWxseSB1bmRlcnN0YW5kIHlvdXIgY29uY2Vy
bi4gCj4gVGhpcyB3YXMgaW50ZW5kZWQgZm9yIHRoZSBjYXNlIHdoZXJlIHNheSB3ZSB3b3VsZCBl
eGFjdGx5IHRyYWNrIAo+IHhlbi8uLi4vZm9vLmJhciB3aXRoIGxpbnV4Ly4uLi9mb28uYmFyCj4g
SW4gb3RoZXIgd29yZHMsIGF1dG8gb25seSBhcHBsaWVzIHRvIHRoZSBjb250ZW50IG9mIGEgZmls
ZTogdGhlIGZpbGVuYW1lIAo+IGlzbid0IHJlbGV2YW50LCBiZWNhdXNlIGFsbCB0aGUgaW5mb3Jt
YXRpb24gdGhhdCB3b3VsZCBiZSBuZWVkZWQgdG8gZG8gdGhpcyAKPiBpcyBpbiB0aGUgZmlsZS4K
CldoZW4gdGFsa2luZyBhYm91dCBmaWxlIG5hbWVzIGluIG15IHJlcGx5LCBJIHJlZmVycmVkIHRv
IEMgbGFuZ3VhZ2UKI2luY2x1ZGUgZGlyZWN0aXZlcyBpbnNpZGUgdGhlIGZpbGUgaW4gcXVlc3Rp
b24sIGFzIGEgKHByZXR0eSBpbXBvcnRhbnQpCmV4YW1wbGUuIFRoZXJlIHdhcyBubyB0YWxrIGFi
b3V0IHRoZSBjbG9uZWQvY29waWVkIGZpbGUncyBuYW1lIGl0c2VsZi4KSGVuY2UgdGhlIHN1Z2dl
c3Rpb24gdG8gYWNjb21wYW55IGF1dG86IHdpdGggYSBzZXQgb2Ygc2VkCmV4cHJlc3Npb25zLCB3
aGljaCBjb3VsZCB0aGVuIGUuZy4gdHJhbnNmb3JtICNpbmNsdWRlIDxsaW51eC8uLi4+CmludG8g
I2luY2x1ZGUgPHhlbi8uLi4+LgoKPiBASnVsaWVuLCBAU3RlZmFubywgQEphbjogYXJlIGFueSBv
ZiB0aGUgZmlsZXMgeW91IGxpc3RlZCBmYWxsIGludG8gdGhlIAo+ICJzaG91bGQgYmUgdHJhY2tl
ZCBleGFjdGx5IiBjYXRlZ29yeT8KCkFzIEkndmUgc2FpZCBiZWZvcmUgLSBJIGNhbid0IGV2ZW4g
aW1hZ2luZSBzdWNoIGEgZmlsZSB0byBleGlzdC4KCj4gICAgID4gKyMgbWFudWFsOgo+ICAgICA+
ICsjICAgQSBkZXZlbG9wZXIgbmVlZHMgdG8gbWFrZSBhIGRlY2lzaW9uIHdoZXRoZXIgYQo+ICAg
ICA+ICsjICAgc3BlY2lmaWMgY2hhbmdlIGlzIGFwcGxpZWQgb3IgaWdub3JlZCBhbmQgdXBkYXRl
IHRoZSBsYXN0IGNvbW1pdCBpZAo+ICAgICA+ICsjICAgYWNjb3JkaW5nbHkKPiAgICAgPiArIwo+
ICAgICA+ICsjIG5hbWUtb2Ytb3JpZ2luYWwtcmVwbzoKPiAgICAgPiArIyAgIEEgcmVmZXJlbmNl
IHRvIGEgc291cmNlIHJlcG9zaXRvcnkgZGVmaW5lZCBieSAqcmVwbyoga2V5d29yZAo+ICAgICA+
ICsjCj4gICAgID4gKyMgY29tbWl0IGlkOgo+ICAgICA+ICsjICAgTGFzdCBjb21taXQgaWQgb2Yg
c291cmNlIGZpbGUgdGhhdCB3YXMgZGVlbWVkIHRvIGJlIG9rCj4gICAgID4gKyMgICBhbmQgZWl0
aGVyIGltcG9ydGVkIGludG8gdGhlIHRyZWUgb3IgcmVqZWN0ZWQKPiAgICAgPiArIwo+ICAgICA+
ICsjIEZvciBleGFtcGxlOgo+ICAgICA+ICsjICAgbWFudWFsIHhlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL2FybS9zbW11LmMgbGludXgtdG9ydmFsZHMgCj4gbGludXgvZHJpdmVycy9pb21tdS9hcm0t
c21tdS5jIGI3N2NmMTFmMDk0MTM2Cj4gICAgID4gKwo+ICAgICA+ICt2ZXJzaW9uIDEKPiAgICAg
Cj4gICAgIFBlcmhhcHMgaXQgd291bGRuJ3QgaHVydCB0byBpbmNsdWRlIHRoZSBjb2xvbnMgaW4g
dGhlIGFjdHVhbCBlbnRyaWVzIGFzCj4gICAgIHdlbGw/IAo+IAo+IEkgYW0gbm90IHN1cmUgd2hh
dCB5b3UgbWVhbiwgd2hpY2ggY29sb25zPyBBcmUgeW91IHNheWluZywgdGhlIGZvcm1hdCBzaG91
bGQgYmUKPiB2ZXJzaW9uOiAxCj4gcmVwbzogLi4uCgpZZXMuIFRoaXMgd291bGQgbWFrZSBpdCBl
dmVuIG1vcmUgcHJvbWluZW50IHRoYXQgdGhlc2UgYXJlIHRhZ3Mgb2YKc29tZSBzb3J0LiBCdXQg
dGhpcyB3YXMgb25seSBhIHRob3VnaHQgb2YgbWluZSwgaXQncyBpbiBubyB3YXkgbWVhbnQKdG8g
YmUgYSByZXF1aXJlbWVudCBJIGhhdmUuCgo+IEkgdGhpbmsgdGhlIGNvbmZ1c2lvbiBjb21lcyBi
ZWNhdXNlIEkgdXNlZCBjb2xvbnMgYWZ0ZXIgc3RhdGVtZW50cyBpbiB0aGUgCj4gY29tbWVudHMu
IAoKUmlnaHQsIHRoYXQncyBob3cgSSBnb3QgdGhlcmUuCgo+IEkgdGhpbmsgdGhhdCAidmVyc2lv
bjogMSIgaXMgc2xpZ2h0bHkgbW9yZSBodW1hbi1yZWFkYWJsZSwgc28gSSB3b3VsZCBiZSBPSyAK
PiB3aXRoIHRoYXQKCkEgd2VsbCBkZWZpbmVkIG5vbi1ibGFuayBzZXBhcmF0b3IgYWxzbyBhbGxv
d3MgbWFjaGluZSBwcm9jZXNzaW5nCnRvIG5vdGljZSBtb3JlIGVhc2lseSBpZiB0aGVyZSdzIGEg
bWFsZm9ybWVkIGxpbmUuIFBsdXMgKGlmIG5lZWQgYmUpCml0IHdvdWxkIHBlcm1pdCB0YWdzIHdp
dGggYmxhbmtzIGluIHRoZWlyIG5hbWVzLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
