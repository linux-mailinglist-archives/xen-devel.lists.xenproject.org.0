Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CD04B63E
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 12:34:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdXrO-0008Dl-55; Wed, 19 Jun 2019 10:30:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hb7b=US=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hdXrM-0008Dg-4T
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 10:30:32 +0000
X-Inumbo-ID: 429b1fda-927d-11e9-b974-37c41a1c8468
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 429b1fda-927d-11e9-b974-37c41a1c8468;
 Wed, 19 Jun 2019 10:30:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C143360;
 Wed, 19 Jun 2019 03:30:29 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1DEB63F738;
 Wed, 19 Jun 2019 03:32:15 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20190611184541.7281-1-volodymyr_babchuk@epam.com>
 <20190611184541.7281-10-volodymyr_babchuk@epam.com>
 <23dc2135-d9a2-2da1-f302-f53f84fd9cdb@arm.com> <87v9x36sz1.fsf@epam.com>
 <ead7d399-92a2-9d7f-91e4-2d6cf4c9961b@arm.com> <87tvcn6k4r.fsf@epam.com>
 <341c19fc-76fc-0890-b808-8b157872b6cf@arm.com> <87sgs67w94.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e9b05f95-b6a1-a4f6-87cb-147b235f30e8@arm.com>
Date: Wed, 19 Jun 2019 11:30:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87sgs67w94.fsf@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 09/10] tools/arm: tee: add "tee" option
 for xl.cfg
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
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxOC8wNi8yMDE5IDE2OjIzLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPiAKPiBK
dWxpZW4gR3JhbGwgd3JpdGVzOgo+IAo+PiBPbiA2LzE4LzE5IDM6MzAgUE0sIFZvbG9keW15ciBC
YWJjaHVrIHdyb3RlOgo+Pj4KPj4+Cj4+PiBKdWxpZW4gR3JhbGwgd3JpdGVzOgo+Pj4KPj4+PiBP
biAxOC8wNi8yMDE5IDEyOjE5LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPj4+Pj4KPj4+Pj4g
SGkgSnVsaWVuLAo+Pj4+Cj4+Pj4gSGksCj4+Pj4KPj4+Pj4KPj4+Pj4gSnVsaWVuIEdyYWxsIHdy
aXRlczoKPj4+Pj4+PiArCj4+Pj4+Pj4gKz1pdGVtIEI8b3B0ZWU+Cj4+Pj4+Pj4gKwo+Pj4+Pj4+
ICtBbGxvdyBhIGd1ZXN0IHRvIHVzZSBPUC1URUUuIE5vdGUgdGhhdCBhIHZpcnR1YWxpemF0aW9u
LWF3YXJlIE9QLVRFRQo+Pj4+Pj4+ICtpcyByZXF1aXJlZCBmb3IgdGhpcy4gSWYgdGhpcyBvcHRp
b24gaXMgc2VsZWN0ZWQsIGd1ZXN0IHdpbGwgYmUgYWJsZQo+Pj4+Pj4KPj4+Pj4+IE9PSSwgd2hh
dCBoYXBwZW4gaWYgT1AtVEVFIGRvZXMgbm90IHN1cHBvcnQgdmlydHVhbGl6YXRpb24uIFdpbGwg
WGVuCj4+Pj4+PiBmb3JiaWQgdG8gdXNlIGl0Pwo+Pj4+PiBZZXMsIFhlbiB3aWxsIGdldCBhbiBl
cnJvciBmcm9tIE9QLVRFRSBkdXJpbmcgZG9tYWluIGNvbnN0cnVjdGlvbi4gVGhpcwo+Pj4+PiB3
aWxsIGxlYWQgdG8gZG9tYWluIGNyZWF0aW9uIGZhaWx1cmUuCj4+Pj4KPj4+PiBUaGlzIGlzIGEg
Yml0IG9kZC4gSXQgbWVhbnMgd2UgaGF2ZSBubyB3YXkgdG8ga25vdyBpbiBhZHZhbmNlIHdoZXRo
ZXIKPj4+PiBPUC1URUUgd2lsbCBiZSBhYmxlIHRvIGNyZWF0ZSBhIGNsaWVudC4KPj4+IFllcy4g
VGhlcmUgY2FuIGJlIGF0IGxlYXN0IHR3byByZWFzb25zIGZvciB0aGlzOgo+Pj4gMS4gT1AtVEVF
IGlzIGJ1aWx0IHdpdGhvdXQgdmlydHVhbGl6YXRpb24gc3VwcG9ydCBhdCBhbGwKPj4+IDIuIE9Q
LVRFRSBoYXZlIG5vIHJlc291cmNlcyBmb3IgYSBuZXcgZ3Vlc3QKPj4+Cj4+Pj4gSW4gb3RoZXIg
d29yZCwgd2hlbiB0aGUKPj4+PiBtZWRpYXRvciBpcyBidWlsdCBpbiBYZW4sIGFsbCBleGlzdGlu
ZyBzZXR1cCB3aXRoIE9QLVRFRSAoYW5kCj4+Pj4gbm8tdmlydHVhbGl6YXRpb24pIHdpbGwgZmFp
bC4KPj4+IFJpZ2h0LiBJZiB1c2VyIHByb3ZpZGVzIERUQiB3aXRoICdvcHRlZScgbm9kZSwgYnV0
IE9QLVRFRSBpcyBidWlsZCB3aXRob3V0Cj4+PiB2aXJ0dWFsaXphdGlvbiBzdXBwb3J0LCBEb20w
IHdpbGwgbm90IGJlIGNyZWF0ZWQuIFRoaXMgY2FuIGJlIGZpeGVkIGJ5Cj4+PiBhZGRpbmcgbmV3
IGNhcGFiaWxpdHkgZmxhZyBpbnRvIE9QLVRFRSwgdGhhdCB0ZWxscyBYZW4gYWJvdXQKPj4+IHZp
cnR1YWxpemF0aW9uIHN1cHBvcnQuIEZvciBzb21lIHJlYXNvbiBJIG1pc3NlZCB0aGlzIHdoZW4g
SSBpbXBsZW1lbnRlZAo+Pj4gVk0gc3VwcG9ydCBpbiBPUC1URUUgOigKPj4+Cj4+Pj4gTXkgZXhw
ZWN0YXRpb24gaXMgWGVuIHNob3VsZCBiZSBhYmxlIHRvIGtub3cgd2hldGhlciB0aGUgbWVkaWF0
b3IgY2FuIGJlIHVzZWQuCj4+PiBJIG5lZWQgdG8gaW1wbGVtZW50IGFkZGl0aW9uYWwgY2FwYWJp
bGl0eSBmbGFnIGluIHRoZSBPUC1URUUuIFRoaXMgaXMKPj4+IG5vdCBzbyBoYXJkLCBidXQgaXQg
d2lsbCBiZSBhdmFpbGFibGUgb25seSBpbiB0aGUgbmV4dCByZWxlYXNlLiBGb3Igbm93LAo+Pj4g
d2UgY2FuIGRvY3VtZW50IHRoaXMgbGltaXRhdGlvbiBzb21ld2hlcmUuCj4+Cj4+IElzIE9QLVRF
RSBhbHJlYWR5IHJlbGVhc2VkIHdpdGggdmlydHVhbGl6YXRpb24/IElmIG5vdCwgd2hlbiB3aWxs
IGl0IGJlPwo+IFllcywgT1AtVEVFIDMuNS4wIHdhcyByZWxlYXNlZCBvbiAyNiBBcHJpbCAyMDE5
IGFuZCBpdCBpbmNsdWRlcwo+IHZpcnR1YWxpemF0aW9uIHN1cHBvcnQuCgpPay4gUGxlYXNlIHRy
eSB0byBzb2x2ZSB0aGlzIHByb2JsZW0gZm9yIHRoZSBuZXh0IHJlbGVhc2UuCgpGb3Igbm93LCBJ
IHRoaW5rIHRoZXJlIGFyZSBhIHdheSB0byB3b3JrYXJvdW5kIHRoZSBsYWNrIG9mIGEgZmVhdHVy
ZSBmbGFnLiBJbiAKdGhlIGRldGVjdGlvbiBvZiBPUC1URUUsIHlvdSBjYW4gdHJ5IHRvIGNyZWF0
ZSBhIGNsaWVudC4gSWYgaXQgZmFpbHMsIHRoZW4gaXQgCm1lYW5zIE9QLVRFRSBkb2VzIG5vdCBz
dXBwb3J0IHZpcnR1YWxpemF0aW9uLgoKVGhpcyBpcyBhc3N1bWluZyB0aGF0IE9QLVRFRSB3aWxs
IGZhaWwgZ3JhY2VmdWxseS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
