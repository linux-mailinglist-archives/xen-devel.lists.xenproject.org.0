Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DFF17F59E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 12:04:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBceG-0006b5-Gf; Tue, 10 Mar 2020 11:02:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EhAh=43=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBceE-0006az-Ey
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 11:02:06 +0000
X-Inumbo-ID: 92d47d0e-62be-11ea-ad65-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 92d47d0e-62be-11ea-ad65-12813bfff9fa;
 Tue, 10 Mar 2020 11:02:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AEC5BAED5;
 Tue, 10 Mar 2020 11:02:02 +0000 (UTC)
To: paul@xen.org
References: <a8fc7299-4632-b32a-939d-b2e8354cf296@suse.com>
 <d1c4f00d-3bcd-b6f1-cd4e-24870ad248cc@suse.com>
 <000b01d5f6ca$49cf80a0$dd6e81e0$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e18a0f06-d954-683b-9ca0-0fb1aed62064@suse.com>
Date: Tue, 10 Mar 2020 12:02:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <000b01d5f6ca$49cf80a0$dd6e81e0$@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/5] IOMMU: iommu_intpost is x86/HVM-only
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
Cc: 'Kevin Tian' <kevin.tian@intel.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Julien Grall' <julien@xen.org>,
 'Wei Liu' <wl@xen.org>, 'Konrad Wilk' <konrad.wilk@oracle.com>,
 'George Dunlap' <George.Dunlap@eu.citrix.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDMuMjAyMCAxMTo1NCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+
IFNlbnQ6IDA5IE1hcmNoIDIwMjAgMTA6NDMKPj4KPj4gQEAgLTQ4Niw4ICs0ODAsMTAgQEAgaW50
IF9faW5pdCBpb21tdV9zZXR1cCh2b2lkKQo+PiAgICAgICAgICBwYW5pYygiQ291bGRuJ3QgZW5h
YmxlICVzIGFuZCBpb21tdT1yZXF1aXJlZC9mb3JjZVxuIiwKPj4gICAgICAgICAgICAgICAgIWlv
bW11X2VuYWJsZWQgPyAiSU9NTVUiIDogIkludGVycnVwdCBSZW1hcHBpbmciKTsKPj4KPj4gKyNp
Zm5kZWYgaW9tbXVfaW50cG9zdAo+PiAgICAgIGlmICggIWlvbW11X2ludHJlbWFwICkKPj4gICAg
ICAgICAgaW9tbXVfaW50cG9zdCA9IDA7Cj4gCj4gTml0OiAwIC0+IGZhbHNlCgpIbW0sIEknbSBu
b3QgdG91Y2hpbmcgdGhpcyBsaW5lLCBhbmQgdGhlIGdvYWwgb2YgdGhlIHBhdGNoIGlzbid0CnRv
IChhbHNvKSBzd2l0Y2ggX2FsbF8gYXNzaWdubWVudHMgdG8gdGhlIHZhcmlhYmxlLiBUaGVyZSBp
cyBhdApsZWFzdCBvbmUgbW9yZSAoaW4gdm1jcy5jKSwgYW5kIGRvaW5nIHRoZSBhZGp1c3RtZW50
IGhlcmUgKGFzCmJlaW5nIG5vdCBvdGhlcndpc2UgbW90aXZhdGVkLCBlLmcuIGJlY2F1c2Ugb2Yg
dG91Y2hpbmcgdGhlIGxpbmUKYW55d2F5KSB3b3VsZCB0aGVuLCBmb3IgY29uc2lzdGVuY3ksIHNl
ZW0gdG8gY2FsbCBmb3IgY29ycmVjdGluZwp0aGF0IG90aGVyIGluc3RhbmNlIHRvby4gVGhpcywg
aG93ZXZlciwgd291bGQgc2VlbSB0b28gdW5yZWxhdGVkCmEgY2hhbmdlIHRvIG1ha2UgaGVyZSBm
b3IgbXkgdGFzdGUuIEhlbmNlIC4uLgoKPiBXaXRoIHRoYXQgZml4ZWQuLi4KPiAKPiBSZXZpZXdl
ZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+CgouLi4gcGxlYXNlIGNsYXJpZnkgd2hl
dGhlciBJIG1heSBsZWF2ZSB0aGUgbGluZSB1bnRvdWNoZWQuCgpKYW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
