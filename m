Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC7D4A12B
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 14:53:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdDYZ-0001rI-Us; Tue, 18 Jun 2019 12:49:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NhYq=UR=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hdDYY-0001rD-7y
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 12:49:46 +0000
X-Inumbo-ID: 8bb63a7f-91c7-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 8bb63a7f-91c7-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 12:49:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D00AB2B;
 Tue, 18 Jun 2019 05:49:43 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 291963F246;
 Tue, 18 Jun 2019 05:49:43 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20190611184541.7281-1-volodymyr_babchuk@epam.com>
 <20190611184541.7281-10-volodymyr_babchuk@epam.com>
 <23dc2135-d9a2-2da1-f302-f53f84fd9cdb@arm.com> <87v9x36sz1.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <ead7d399-92a2-9d7f-91e4-2d6cf4c9961b@arm.com>
Date: Tue, 18 Jun 2019 13:49:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87v9x36sz1.fsf@epam.com>
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

CgpPbiAxOC8wNi8yMDE5IDEyOjE5LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPiAKPiBIaSBK
dWxpZW4sCgpIaSwKCj4gCj4gSnVsaWVuIEdyYWxsIHdyaXRlczoKPj4+ICsKPj4+ICs9aXRlbSBC
PG9wdGVlPgo+Pj4gKwo+Pj4gK0FsbG93IGEgZ3Vlc3QgdG8gdXNlIE9QLVRFRS4gTm90ZSB0aGF0
IGEgdmlydHVhbGl6YXRpb24tYXdhcmUgT1AtVEVFCj4+PiAraXMgcmVxdWlyZWQgZm9yIHRoaXMu
IElmIHRoaXMgb3B0aW9uIGlzIHNlbGVjdGVkLCBndWVzdCB3aWxsIGJlIGFibGUKPj4KPj4gT09J
LCB3aGF0IGhhcHBlbiBpZiBPUC1URUUgZG9lcyBub3Qgc3VwcG9ydCB2aXJ0dWFsaXphdGlvbi4g
V2lsbCBYZW4KPj4gZm9yYmlkIHRvIHVzZSBpdD8KPiBZZXMsIFhlbiB3aWxsIGdldCBhbiBlcnJv
ciBmcm9tIE9QLVRFRSBkdXJpbmcgZG9tYWluIGNvbnN0cnVjdGlvbi4gVGhpcwo+IHdpbGwgbGVh
ZCB0byBkb21haW4gY3JlYXRpb24gZmFpbHVyZS4KClRoaXMgaXMgYSBiaXQgb2RkLiBJdCBtZWFu
cyB3ZSBoYXZlIG5vIHdheSB0byBrbm93IGluIGFkdmFuY2Ugd2hldGhlciBPUC1URUUgCndpbGwg
YmUgYWJsZSB0byBjcmVhdGUgYSBjbGllbnQuIEluIG90aGVyIHdvcmQsIHdoZW4gdGhlIG1lZGlh
dG9yIGlzIGJ1aWx0IGluIApYZW4sIGFsbCBleGlzdGluZyBzZXR1cCB3aXRoIE9QLVRFRSAoYW5k
IG5vLXZpcnR1YWxpemF0aW9uKSB3aWxsIGZhaWwuCgpNeSBleHBlY3RhdGlvbiBpcyBYZW4gc2hv
dWxkIGJlIGFibGUgdG8ga25vdyB3aGV0aGVyIHRoZSBtZWRpYXRvciBjYW4gYmUgdXNlZC4KCj4g
Cj4+PiArdG8gYWNjZXNzIHRvIHRoZSByZWFsIE9QLVRFRSBPUyBydW5uaW5nIG9uIHRoZSBob3N0
LiBHdWVzdCBjcmVhdGlvbgo+Pgo+PiBzL3JlYWwvLyBpdCBpcyByZWR1bmRhbnQgd2l0aCB0aGUg
cmVzdCBvZiB0aGUgc2VudGVuY2UuIEhvd2V2ZXIsIGl0Cj4+IGRvZXMgbm90IHJlYWxseSBhbnN3
ZXIgdG8gdGhlIHF1ZXN0aW9uIHJlZ2FyZGluZyBpc29sYXRpb24uCj4gWW91ciBhc3N1bXB0aW9u
IGlzIGNvcnJlY3QgLSBPUC1URUUgcHJvdmlkZXMgaXNvbGF0aW9uIG9uIGl0cyBzaWRlLgo+IAo+
Pgo+Pj4gK3dpbGwgZmFpbCBpZiBPUC1URUUgaGF2ZSBubyByZXNvdXJjZXMgZm9yIGEgbmV3IGd1
ZXN0LiBOdW1iZXIgb2Ygc3VwcG9ydGVkCj4+PiArZ3Vlc3RzIGRlcGVuZHMgb24gT1AtVEVFIGNv
bmZpZ3VyYXRpb24uCj4+Cj4+IEhvdyBhYm91dCB0aGUgZm9sbG93aW5nIGRlc2NyaXB0aW9uIChj
b3JyZWN0IG1lIGlmIG15IHVuZGVyc3RhbmRpbmcgaXMKPj4gd3JvbmcpOgo+Pgo+PiAiQWxsb3cg
YSBndWVzdCB0byBhY2Nlc3MgdGhlIGhvc3QgT1AtVEVFIE9TLiBYZW4gd2lsbCBtZWRpYXRlIHRo
ZQo+PiBhY2Nlc3MgdG8gT1AtVEVFIGFuZCB0aGUgcmVzb3VyY2UgaXNvbGF0aW9uIHdpbGwgYmUg
cHJvdmlkZWQgZGlyZWN0bHkKPj4gYnkgT1AtVEVFLiBPUC1URUUgaXRzZWxmIG1heSBsaW1pdCB0
aGUgbnVtYmVyIG9mIGd1ZXN0cyB0aGF0IGNhbgo+PiBjb25jdXJyZW50bHkgdXNlIGl0LiBUaGlz
IHJlcXVpcmVzIGEgdmlydHVhbGl6YXRpb24tYXdhcmUgT1AtVEVFIGZvcgo+PiB0aGlzIHRvIHdv
cmsuCj4+Cj4+IFRoaXMgZmVhdHVyZSBpcyBhIEI8dGVjaG5vbG9neSBwcmV2aWV3Pi4iCj4gVGhh
dCdzIG11Y2ggYmV0dGVyIHRoYW4gbXkgdmVyc2lvbi4gVGhhbmsgeW91Lgo+IAo+PiBIb3cgY2Fu
IGEgdXNlciBrbm93IHdoZXRoZXIgT1AtVEVFIHN1cHBvcnRzIHZpcnR1YWxpemF0aW9uPyBJcyBp
dAo+PiBjb25maWd1cmFibGUgYXQgYnVpbGQ/Cj4gWWVzLCB0aGVyZSBpcyBhIHNwZWNpYWwgY29u
ZmlndXJhdGlvbiBvcHRpb24gQ0ZHX1ZJUlRVQUxJWkFUSU9OLiBUaGlzIGlzCj4gY292ZXJlZCBp
biBPUC1URUUgZG9jdW1lbnRhdGlvbiBhdCBbMV0KPiAKPiBbMV0gaHR0cHM6Ly9vcHRlZS5yZWFk
dGhlZG9jcy5pby9hcmNoaXRlY3R1cmUvdmlydHVhbGl6YXRpb24uaHRtbAoKRG8gd2UgZXhwZWN0
IHRoZSBsaW5rIHRvIGJlIHN0YWJsZT8gSWYgc28sIHRoZW4gSSB0aGluayBhIGxpbmsgaW4gdGhl
IApkb2N1bWVudGF0aW9uIHdvdWxkIGJlIHVzZWZ1bC4KCkNoZWVycywKCi0tIApKdWxpZW4gR3Jh
bGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
