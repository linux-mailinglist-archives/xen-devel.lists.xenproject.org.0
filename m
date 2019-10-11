Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4D1D3B55
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 10:39:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIqLD-0005zc-CV; Fri, 11 Oct 2019 08:32:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=PJhk=YE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iIqLB-0005zX-0W
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 08:32:01 +0000
X-Inumbo-ID: 97944bfa-ec01-11e9-932f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 97944bfa-ec01-11e9-932f-12813bfff9fa;
 Fri, 11 Oct 2019 08:31:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DA27AB1B6;
 Fri, 11 Oct 2019 08:31:58 +0000 (UTC)
To: Lars Kurth <lars.kurth@citrix.com>
References: <F3EDAC03-A573-4E60-8D0C-8D84949E796B@citrix.com>
 <f5e20757-88ba-dabf-b68a-b6edc3ca1619@citrix.com>
 <1B92007E-ACB4-46D6-ADF5-808962A1FCB7@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8d8887c0-4ed0-700b-ea6e-1e5ac58b4f6b@suse.com>
Date: Fri, 11 Oct 2019 10:32:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1B92007E-ACB4-46D6-ADF5-808962A1FCB7@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC] Documentation formats,
 licenses and file system structure
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Committers <committers@xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMTAuMjAxOSAyMDozMCwgTGFycyBLdXJ0aCB3cm90ZToKPiDvu79PbiAxMC8xMC8yMDE5
LCAxODowNSwgIkFuZHJldyBDb29wZXIiIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPiB3cm90
ZToKPiAgICAgT24gMTAvMTAvMjAxOSAxMzozNCwgTGFycyBLdXJ0aCB3cm90ZToKPiAgICAgPiBF
eGlzdGluZyBmb3JtYXRzIGFuZCBsaWNlbnNlcwo+ICAgICA+ICogSHlwZXJjYWxsIEFCSSBEb2N1
bWVudGF0aW9uIGdlbmVyYXRlZCBmcm9tIFhlbiBwdWJsaWMgaGVhZGVycwo+ICAgICA+IEZvcm1h
dDoga2VybmRvYwo+ICAgICA+IExpY2Vuc2U6IHR5cGljYWxseSBCU0QtMy1DbGF1c2UgKGRvY3Vt
ZW50YXRpb24gaXMgZ2VuZXJhdGVkIGZyb20gcHVibGljIGhlYWRlcnMpCj4gICAgIAo+ICAgICBJ
dHMgaG9tZWdyb3duIG1hcmt1cCZwZXJsLCBzdXBlcmltcG9zZWQgb24gd2hhdCB1c2VkIHRvIGJl
IGRveHlnZW4gaW4KPiAgICAgdGhlIHBhc3QuCj4gCj4gT2gsIEkgZm9yZ290Cj4gICAgIAo+ICAg
ICBJIHdhc24ndCBwbGFubmluZyBvbiByZXVzaW5nIGFueSBvZiB0aGUgbWFya3VwLCBhbmQgd2Fz
bid0IGV4cGVjdGluZyB0bwo+ICAgICB1c2UgbXVjaCBvZiB0aGUgdGV4dCBlaXRoZXIuICBJJ20g
c3RpbGwgY29uc2lkZXJpbmcgdGhlIG9wdGlvbiBvZgo+ICAgICBkZWZpbmluZyB0aGF0IHhlbi9w
dWJsaWMvKiBpc24ndCB0aGUgY2Fub25pY2FsIGRlc2NyaXB0aW9uIG9mIHRoZSBBQkksCj4gICAg
IGJlY2F1c2UgQyBpcyB0aGUgd3JvbmcgdG9vbCBmb3IgdGhlIGpvYi4KPiAgICAgCj4gICAgIEl0
cyBmaW5lIHRvIHByb3ZpZGUgYSBDIHNldCBvZiBoZWFkZXJzIGltcGxlbWVudGluZyBhbiBBQkks
IGJ1dCB0aGVyZSBpcwo+ICAgICBhIHZlcnkgZGVsaWJlcmF0ZSByZWFzb24gd2h5IHRoZSBjYW5v
bmljYWwgbWlncmF0aW9uIHYyIHNwZWMgaXMgaW4gYQo+ICAgICB0ZXh0IGRvY3VtZW50Lgo+IAo+
IEBTdGVmYW5vOiBhcyB5b3UgYW5kIEkgYmVsaWV2ZSBCcmlhbiB3aWxsIGJlIHNwZW5kaW5nIHRp
bWUgb24gaW1wcm92aW5nIHRoZQo+IEFCSSBkb2NzLCBJIHRoaW5rIHdlIG5lZWQgdG8gYnVpbGQg
c29tZSBhZ3JlZW1lbnQgaGVyZSBvbiB3aGF0L2hvdwo+IHRvIGRvIGl0LiBJIHdhcyBhc3N1bWlu
ZyB0aGF0IGdlbmVyYWxseSB0aGUgY29uc2Vuc3VzIHdhcyB0byBoYXZlCj4gZG9jcyBjbG9zZSB0
byB0aGUgY29kZSBpbiBzb3VyY2UsIGJ1dCB0aGlzIGRvZXMgbm90IHNlZW0gdG8gYmUgdGhlIGNh
c2UuCgpXZWxsLCBmb3IgbWlncmF0aW9uIHYyIGhhdmluZyB0aGUgc3BlYyBpbiBhIHRleHQgZmls
ZSBzZWVtcyBzZW5zaWJsZQp0byBtZS4gRm9yIHRoZSBwdWJsaWMgQUJJLCBob3dldmVyLCBJIHRo
aW5rIGl0J3MgbW9yZSBoZWxwZnVsIHRvIGhhdmUKdGhlIGRvYyBuZXh0IHRvIHRoZSBhY3R1YWwg
ZGVmaW5pdGlvbnMuIENvbnNpZGVyaW5nIHRoZSBwb3NzaWJsZSB1c2UKb2YgbGFuZ3VhZ2VzIG90
aGVyIHRoYW4gQyBJIGNhbiBjZXJ0YWlubHkgc2VlIHdoeSBzZXBhcmF0aW5nIGJvdGgKd291bGQg
YmUgZXZlbiBtb3JlIGNsZWFuLCBidXQgSSB0aGluayBoZXJlIHdlIHdhbnQgdG8gd2VpZ2ggcHJh
Y3RpY2FsCnB1cnBvc2VzIGFnYWluc3QgY2xlYW5saW5lc3MuCgpKYW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
