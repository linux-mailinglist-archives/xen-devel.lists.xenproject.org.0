Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1208A135775
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 11:55:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipVRD-00049f-GJ; Thu, 09 Jan 2020 10:53:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3305=26=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ipVRB-00049X-8F
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 10:53:13 +0000
X-Inumbo-ID: 364682b4-32ce-11ea-b89f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 364682b4-32ce-11ea-b89f-bc764e2007e4;
 Thu, 09 Jan 2020 10:53:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 13D1A6A268;
 Thu,  9 Jan 2020 10:53:04 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>
References: <20200109054031.18455-1-jgross@suse.com>
 <791d2e94-3d46-bc8d-b929-280bfe7f2f51@citrix.com>
 <beb1d847-caee-ddc0-1688-34a42072095f@suse.com>
 <41cc4690-8ab7-5580-d1d6-8d7ce5be51e9@suse.com>
 <e6518f6c-639a-18bf-5dec-3eddc0d22449@citrix.com>
 <00146925-0548-8ae2-2514-6ae04a8d2930@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <006fde35-d42a-8dd0-abc1-c422c36bb456@suse.com>
Date: Thu, 9 Jan 2020 11:53:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <00146925-0548-8ae2-2514-6ae04a8d2930@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen: make CONFIG_DEBUG_LOCKS usable without
 CONFIG_DEBUG
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDEuMjAgMTE6NDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA5LjAxLjIwMjAgMTE6
MzksIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+IE9uIDEvOS8yMCAxMDozMCBBTSwgSmFuIEJldWxp
Y2ggd3JvdGU6Cj4+PiBPbiAwOS4wMS4yMDIwIDExOjE1LCBKw7xyZ2VuIEdyb8OfICB3cm90ZToK
Pj4+PiBPbiAwOS4wMS4yMCAxMTowNywgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4+Pj4gT24gMS85
LzIwIDU6NDAgQU0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4+PiBJbiBleHBlcnQgbW9kZSBp
dCBpcyBwb3NzaWJsZSB0byBlbmFibGUgQ09ORklHX0RFQlVHX0xPQ0tTIHdpdGhvdXQKPj4+Pj4+
IGhhdmluZyBlbmFibGVkIENPTkZJR19ERUJVRy4gVGhlIGNvZGluZyBpcyBkZXBlbmRpbmcgb24g
Q09ORklHX0RFQlVHCj4+Pj4+PiBhcyBpdCBpcyB1c2luZyBBU1NFUlQoKSwgaG93ZXZlci4KPj4+
Pj4KPj4+Pj4gQW55IHJlYXNvbiBub3QgdG8gdXNlIEJVR19PTigpIGluIHRoYXQgY2FzZT8KPj4+
Pgo+Pj4+IFRoZSBtYWluIHJlYXNvbiBpcyB0aGUgbWlzc2luZyBtZXNzYWdlIHdoaWNoIGNvbmRp
dGlvbiBmYWlsZWQuCj4+Pj4KPj4+PiBBIHJlbmFtZSAoIkJVR19BU1NFUlQiPykgY291bGQgYmUg
YW4gYWx0ZXJuYXRpdmUgdG8ganVzdCBkcm9wcGluZwo+Pj4+IHRoZSBtZXNzYWdlLiBCb3RoIHdv
dWxkIGJlIGZpbmUgd2l0aCBtZS4KPj4+Cj4+PiBIb3cgYWJvdXQKPj4+Cj4+PiAgICAgIGlmICgg
Li4uICkKPj4+ICAgICAgewo+Pj4gICAgICAgICAgcHJpbnRrKC4uLik7Cj4+PiAgICAgICAgICBC
VUcoKTsKPj4+ICAgICAgfQo+Pgo+PiBJcyB0aGVyZSBhIHJlYXNvbiB3ZSBjYW4ndCBtYWtlIEJV
R19PTigpIHByaW50IHRoZSBjb25kaXRpb24/Cj4gCj4gT2YgY291cnNlIHdlIGNvdWxkLCBpbiBw
cmluY2lwbGUsIGF0IHRoZSBwcmljZSBvZiBhIG1lYW5pbmdmdWwKPiBncm93dGggb2YgdGhlIC5y
b2RhdGEgc2VjdGlvbi4gSWYgd2UgZG8gdGhpcywgcGVyaGFwcyB3ZSdkIHdhbnQKPiBzb21ldGhp
bmcgbGlrZSBMaW51eCdlcyBDT05GSUdfREVCVUdfQlVHVkVSQk9TRSB0byBjb250cm9sIHRoaXMu
CgpJbiBjYXNlIG5vYm9keSBvYmplY3RzIEknbGwgbW9kaWZ5IG15IHBhdGNoIHRvIGRvIHRoYXQg
KHdlbGwsIHNwbGl0IGl0CnRvIGludHJvZHVjZSB0aGF0IG9wdGlvbiBhbmQgdGhlbiB1c2UgaXQp
LgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
