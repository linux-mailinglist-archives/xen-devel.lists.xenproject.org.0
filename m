Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 711C41153E
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 10:21:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hM6ut-0007xf-Br; Thu, 02 May 2019 08:18:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hM6us-0007xa-HK
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 08:18:06 +0000
X-Inumbo-ID: c781a12e-6cb2-11e9-9ccf-ffbfebfd410e
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c781a12e-6cb2-11e9-9ccf-ffbfebfd410e;
 Thu, 02 May 2019 08:17:54 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 02 May 2019 02:17:51 -0600
Message-Id: <5CCAA7AE020000780022B0B4@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 02 May 2019 02:17:50 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Ian Jackson" <Ian.Jackson@eu.citrix.com>
References: <20190501104604.21416-1-ian.jackson@eu.citrix.com>
In-Reply-To: <20190501104604.21416-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [OSSTEST PATCH] Drop Xen 4.5 and earlier
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, committers@xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAxLjA1LjE5IGF0IDEyOjQ2LCA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhlc2UgcmVsZWFzZXMgYXJlIG91dCBvZiBzZWN1cml0eSBzdXBwb3J0LiAgVGhleSBh
cmUga25vd24gbm90IHRvCj4gYnVpbGQgb24gRGViaWFuIHN0cmV0Y2gsIHdoaWNoIGlzIHdoYXQg
d2UgYXJlIHVzaW5nLCBhbmQgd2UgZG8gbm90Cj4gaW50ZW5kIHRvIGV2ZXIgdXBkYXRlIHRoZW0g
dG8gZml4IHRoYXQuCj4gCj4gWGVuIDQuNiBpcyBhbHNvIG91dCBvZiBzZWN1cml0eSBzdXBwb3J0
IGJ1dCB3ZSB3YW50IG9zc3Rlc3QgdG8gYmUgYWJsZQo+IHRvIGNvbnRpbnVlIHRvIGJ1aWxkIGl0
IHNvIHRoYXQgd2UgY2FuIHRlc3QgNC42LT40LjcgbWlncmF0aW9uLCBmb3IKPiB0aGUgcHVycG9z
ZXMgb2YgdGVzdGluZyBYZW4gNC43LCB3aGljaCBpcyBzdGlsbCBzdXBwb3J0ZWQgcmlnaHQgbm93
Lgo+IAo+IFNvIHdlIGhhdmUgcmVjZW50bHkgYXBwbGllZCBzb21lIGJ1aWxkIGZpeGVzIHRvIHRo
ZSA0LjYgdHJlZSwgYW5kIGZvcgo+IG5vdyB3ZSByZXRhaW4gNC42IGluIG9zc3Rlc3Qgc28gdGhh
dCBidWlsZCBmaXhlcyBhcHBsaWVkIHRvCj4gc3RhZ2luZy00LjYgY2FuIHByb3BhZ2F0ZSB0byBz
dGFibGUtNC42Lgo+IAo+IENDOiBjb21taXR0ZXJzQHhlbnByb2plY3Qub3JnIAo+IFNpZ25lZC1v
ZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKSW4gY2FzZSBp
dCBtYXR0ZXJzCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpIb3dl
dmVyLCAuLi4KCj4gLS0tIGEvY3ItZm9yLWJyYW5jaGVzCj4gKysrIGIvY3ItZm9yLWJyYW5jaGVz
Cj4gQEAgLTMxLDcgKzMxLDcgQEAgc2NyaXB0b3B0aW9ucz0iJDEiOyBzaGlmdAo+ICBMT0dGSUxF
PXRtcC9jci1mb3ItYnJhbmNoZXMubG9nCj4gIGV4cG9ydCBMT0dGSUxFCj4gIAo+IC06ICR7QlJB
TkNIRVM6PW9zc3Rlc3QgeGVuLTQuMC10ZXN0aW5nIHhlbi00LjEtdGVzdGluZyB4ZW4tNC4yLXRl
c3RpbmcgCj4geGVuLTQuMy10ZXN0aW5nIHhlbi00LjQtdGVzdGluZyB4ZW4tNC41LXRlc3Rpbmcg
eGVuLTQuNi10ZXN0aW5nIHhlbi00LjctdGVzdGluZyAKPiB4ZW4tNC44LXRlc3RpbmcgeGVuLTQu
OS10ZXN0aW5nIHhlbi00LjEwLXRlc3RpbmcgeGVuLTQuMTEtdGVzdGluZyB4ZW4tNC4xMi10ZXN0
aW5nIAo+IHhlbi11bnN0YWJsZSBxZW11LW1haW5saW5lIHFlbXUtdXBzdHJlYW0tdW5zdGFibGUg
cWVtdS11cHN0cmVhbS00LjItdGVzdGluZyAKPiBxZW11LXVwc3RyZWFtLTQuMy10ZXN0aW5nIHFl
bXUtdXBzdHJlYW0tNC40LXRlc3RpbmcgcWVtdS11cHN0cmVhbS00LjUtdGVzdGluZyAKPiBxZW11
LXVwc3RyZWFtLTQuNi10ZXN0aW5nIHFlbXUtdXBzdHJlYW0tNC43LXRlc3RpbmcgcWVtdS11cHN0
cmVhbS00LjgtdGVzdGluZyAKPiBxZW11LXVwc3RyZWFtLTQuOS10ZXN0aW5nIHFlbXUtdXBzdHJl
YW0tNC4xMC10ZXN0aW5nIHFlbXUtdXBzdHJlYW0tNC4xMS10ZXN0aW5nIAo+IHFlbXUtdXBzdHJl
YW0tNC4xMi10ZXN0aW5nIGxpbnV4LWxpbnVzIGxpbnV4LTQuMTkgbGludXgtNC4xNCBsaW51eC00
LjkgbGludXgtNC40IAo+IGxpbnV4LTQuMSBsaW51eC0zLjE4IGxpbnV4LTMuMTYgbGludXgtMy4x
NCBsaW51eC0zLjEwIGxpbnV4LTMuNCBsaW51eC1hcm0teGVuIHNlYWJpb3MgCj4gb3ZtZiB4dGYg
JHtFWFRSQV9CUkFOQ0hFU319Cj4gKzogJHtCUkFOQ0hFUzo9b3NzdGVzdCB4ZW4tNC42LXRlc3Rp
bmcgeGVuLTQuNy10ZXN0aW5nIHhlbi00LjgtdGVzdGluZyAKPiB4ZW4tNC45LXRlc3RpbmcgeGVu
LTQuMTAtdGVzdGluZyB4ZW4tNC4xMS10ZXN0aW5nIHhlbi00LjEyLXRlc3RpbmcgeGVuLXVuc3Rh
YmxlIAo+IHFlbXUtbWFpbmxpbmUgcWVtdS11cHN0cmVhbS11bnN0YWJsZSBxZW11LXVwc3RyZWFt
LTQuNi10ZXN0aW5nIAo+IHFlbXUtdXBzdHJlYW0tNC43LXRlc3RpbmcgcWVtdS11cHN0cmVhbS00
LjgtdGVzdGluZyBxZW11LXVwc3RyZWFtLTQuOS10ZXN0aW5nIAo+IHFlbXUtdXBzdHJlYW0tNC4x
MC10ZXN0aW5nIHFlbXUtdXBzdHJlYW0tNC4xMS10ZXN0aW5nIHFlbXUtdXBzdHJlYW0tNC4xMi10
ZXN0aW5nIAo+IGxpbnV4LWxpbnVzIGxpbnV4LTQuMTkgbGludXgtNC4xNCBsaW51eC00LjkgbGlu
dXgtNC40IGxpbnV4LTQuMSBsaW51eC0zLjE4IAo+IGxpbnV4LTMuMTYgbGludXgtMy4xNCBsaW51
eC0zLjEwIGxpbnV4LTMuNCBsaW51eC1hcm0teGVuIHNlYWJpb3Mgb3ZtZiB4dGYgCj4gJHtFWFRS
QV9CUkFOQ0hFU319CgouLi4gYXJlbid0IHRoZSBvbGRlciBMaW51eCBicmFuY2hlcyB0aGVuIGlu
IHNpbWlsYXIgbmVlZCBvZiBwcnVuaW5nPwpTZWVpbmcgdGhhdCBmb3IgMzItYml0IEFybSB5b3Ug
Y2FuJ3QgZXZlbiBidWlsZCBtYWlubGluZSBMaW51eCB3aXRoCnRoZSBuZXdlciBjb21waWxlciwg
SSBkb3VidCBhdCBsZWFzdCB0aGUgcHJldHR5IG9sZCBvbmVzIGhlcmUgaGF2ZQphbnkgY2hhbmNl
IG9mIGJ1aWxkaW5nIGNsZWFubHkuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
