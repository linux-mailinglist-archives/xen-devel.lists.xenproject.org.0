Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 549C9104E42
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 09:44:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXi1r-00048S-Hy; Thu, 21 Nov 2019 08:41:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=erj2=ZN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iXi1p-00048N-Vy
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 08:41:30 +0000
X-Inumbo-ID: b5cc6982-0c3a-11ea-a326-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b5cc6982-0c3a-11ea-a326-12813bfff9fa;
 Thu, 21 Nov 2019 08:41:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DB6ADB240;
 Thu, 21 Nov 2019 08:41:27 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
 <4f0df64e7c21d70d72cee4fff3f3821a@crc.id.au>
 <006fa7b3-ae93-2812-c88a-7bf8e2ac88b0@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5ba3cff4-d898-b994-6b73-262146c0037e@suse.com>
Date: Thu, 21 Nov 2019 09:41:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <006fa7b3-ae93-2812-c88a-7bf8e2ac88b0@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Status of 4.13
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
Cc: Steven Haigh <netwiz@crc.id.au>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMTEuMjAxOSAwODozNiwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAyMS4xMS4xOSAw
ODozMCwgU3RldmVuIEhhaWdoIHdyb3RlOgo+PiBPbiAyMDE5LTExLTIxIDE3OjA1LCBKw7xyZ2Vu
IEdyb8OfIHdyb3RlOgo+Pj4gV2hlcmUgZG8gd2Ugc3RhbmQgd2l0aCBYZW4gNC4xMyByZWdhcmRp
bmcgYmxvY2tlcnMgYW5kIHJlbGF0ZWQgcGF0Y2hlcz8KPj4+Cj4+PiAyLiBSeXplbi9Sb21lIGZh
aWx1cmVzIHdpdGggV2luZG93cyBndWVzdHM6Cj4+PiDCoMKgIFdoYXQgaXMgdGhlIGN1cnJlbnRs
eSBwbGFubmVkIHdheSB0byBhZGRyZXNzIHRoZSBwcm9ibGVtPyBXaG8gaXMKPj4+IMKgwqAgd29y
a2luZyBvbiB0aGF0Pwo+Pgo+PiBBIHdvcmthcm91bmQgd2FzIGZvdW5kIGJ5IHNwZWNpZnlpbmcg
Y3B1aWQgdmFsdWVzIGluIHRoZSBXaW5kb3dzIFZNIAo+PiBjb25maWcgZmlsZS4KPj4KPj4gVGhl
IHdvcmthcm91bmQgbGluZSBpczoKPj4gY3B1aWQgPSBbICIweDgwMDAwMDA4OmVjeD14eHh4eHh4
eHh4eHh4eHh4MDEwMHh4eHh4eHh4eHh4eCIgXQo+Pgo+PiBJdCB3YXMgc3VnZ2VzdGVkIHRoYXQg
dGhpcyBiZSBkb2N1bWVudGVkIC0gYnV0IG5vIGltbWVkaWF0ZSBhY3Rpb24gCj4+IHNob3VsZCBi
ZSB0YWtlbiAtIHdpdGggYSB2aWV3IHRvIGNvcnJlY3QgdGhpcyBwcm9wZXJseSBpbiA0LjE0Lgo+
IAo+IEknbSBhd2FyZSBvZiB0aGUgc3VnZ2VzdGlvbiwgYnV0IG5vdCBvZiBhbnkgZGVjaXNpb24u
IDotKQoKSXQgd2FzIG15IHVuZGVyc3RhbmRpbmcgdGhhdCB3ZSdkIGNhcCB0aGUgNC1iaXQgdmFs
dWUgdG8gNyBmb3IKdGhlIHRpbWUgYmVpbmcuIEkgdGhpbmsgR2VvcmdlIHdhcyBwbGFubmluZyB0
byBzZW5kIGEgcGF0Y2guCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
