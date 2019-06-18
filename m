Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC194A539
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 17:22:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdFtE-0007tg-Ex; Tue, 18 Jun 2019 15:19:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NhYq=UR=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hdFtD-0007tb-0D
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 15:19:15 +0000
X-Inumbo-ID: 6b8f12ee-91dc-11e9-9f45-879e938921ea
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 6b8f12ee-91dc-11e9-9f45-879e938921ea;
 Tue, 18 Jun 2019 15:19:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56F242B;
 Tue, 18 Jun 2019 08:19:09 -0700 (PDT)
Received: from [10.1.34.68] (unknown [10.1.34.68])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C2EC3F718;
 Tue, 18 Jun 2019 08:19:08 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20190611184541.7281-1-volodymyr_babchuk@epam.com>
 <20190611184541.7281-10-volodymyr_babchuk@epam.com>
 <23dc2135-d9a2-2da1-f302-f53f84fd9cdb@arm.com> <87v9x36sz1.fsf@epam.com>
 <ead7d399-92a2-9d7f-91e4-2d6cf4c9961b@arm.com> <87tvcn6k4r.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <341c19fc-76fc-0890-b808-8b157872b6cf@arm.com>
Date: Tue, 18 Jun 2019 16:19:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <87tvcn6k4r.fsf@epam.com>
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

CgpPbiA2LzE4LzE5IDM6MzAgUE0sIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgo+IAo+IAo+IEp1
bGllbiBHcmFsbCB3cml0ZXM6Cj4gCj4+IE9uIDE4LzA2LzIwMTkgMTI6MTksIFZvbG9keW15ciBC
YWJjaHVrIHdyb3RlOgo+Pj4KPj4+IEhpIEp1bGllbiwKPj4KPj4gSGksCj4+Cj4+Pgo+Pj4gSnVs
aWVuIEdyYWxsIHdyaXRlczoKPj4+Pj4gKwo+Pj4+PiArPWl0ZW0gQjxvcHRlZT4KPj4+Pj4gKwo+
Pj4+PiArQWxsb3cgYSBndWVzdCB0byB1c2UgT1AtVEVFLiBOb3RlIHRoYXQgYSB2aXJ0dWFsaXph
dGlvbi1hd2FyZSBPUC1URUUKPj4+Pj4gK2lzIHJlcXVpcmVkIGZvciB0aGlzLiBJZiB0aGlzIG9w
dGlvbiBpcyBzZWxlY3RlZCwgZ3Vlc3Qgd2lsbCBiZSBhYmxlCj4+Pj4KPj4+PiBPT0ksIHdoYXQg
aGFwcGVuIGlmIE9QLVRFRSBkb2VzIG5vdCBzdXBwb3J0IHZpcnR1YWxpemF0aW9uLiBXaWxsIFhl
bgo+Pj4+IGZvcmJpZCB0byB1c2UgaXQ/Cj4+PiBZZXMsIFhlbiB3aWxsIGdldCBhbiBlcnJvciBm
cm9tIE9QLVRFRSBkdXJpbmcgZG9tYWluIGNvbnN0cnVjdGlvbi4gVGhpcwo+Pj4gd2lsbCBsZWFk
IHRvIGRvbWFpbiBjcmVhdGlvbiBmYWlsdXJlLgo+Pgo+PiBUaGlzIGlzIGEgYml0IG9kZC4gSXQg
bWVhbnMgd2UgaGF2ZSBubyB3YXkgdG8ga25vdyBpbiBhZHZhbmNlIHdoZXRoZXIKPj4gT1AtVEVF
IHdpbGwgYmUgYWJsZSB0byBjcmVhdGUgYSBjbGllbnQuCj4gWWVzLiBUaGVyZSBjYW4gYmUgYXQg
bGVhc3QgdHdvIHJlYXNvbnMgZm9yIHRoaXM6Cj4gMS4gT1AtVEVFIGlzIGJ1aWx0IHdpdGhvdXQg
dmlydHVhbGl6YXRpb24gc3VwcG9ydCBhdCBhbGwKPiAyLiBPUC1URUUgaGF2ZSBubyByZXNvdXJj
ZXMgZm9yIGEgbmV3IGd1ZXN0Cj4gCj4+IEluIG90aGVyIHdvcmQsIHdoZW4gdGhlCj4+IG1lZGlh
dG9yIGlzIGJ1aWx0IGluIFhlbiwgYWxsIGV4aXN0aW5nIHNldHVwIHdpdGggT1AtVEVFIChhbmQK
Pj4gbm8tdmlydHVhbGl6YXRpb24pIHdpbGwgZmFpbC4KPiBSaWdodC4gSWYgdXNlciBwcm92aWRl
cyBEVEIgd2l0aCAnb3B0ZWUnIG5vZGUsIGJ1dCBPUC1URUUgaXMgYnVpbGQgd2l0aG91dAo+IHZp
cnR1YWxpemF0aW9uIHN1cHBvcnQsIERvbTAgd2lsbCBub3QgYmUgY3JlYXRlZC4gVGhpcyBjYW4g
YmUgZml4ZWQgYnkKPiBhZGRpbmcgbmV3IGNhcGFiaWxpdHkgZmxhZyBpbnRvIE9QLVRFRSwgdGhh
dCB0ZWxscyBYZW4gYWJvdXQKPiB2aXJ0dWFsaXphdGlvbiBzdXBwb3J0LiBGb3Igc29tZSByZWFz
b24gSSBtaXNzZWQgdGhpcyB3aGVuIEkgaW1wbGVtZW50ZWQKPiBWTSBzdXBwb3J0IGluIE9QLVRF
RSA6KAo+IAo+PiBNeSBleHBlY3RhdGlvbiBpcyBYZW4gc2hvdWxkIGJlIGFibGUgdG8ga25vdyB3
aGV0aGVyIHRoZSBtZWRpYXRvciBjYW4gYmUgdXNlZC4KPiBJIG5lZWQgdG8gaW1wbGVtZW50IGFk
ZGl0aW9uYWwgY2FwYWJpbGl0eSBmbGFnIGluIHRoZSBPUC1URUUuIFRoaXMgaXMKPiBub3Qgc28g
aGFyZCwgYnV0IGl0IHdpbGwgYmUgYXZhaWxhYmxlIG9ubHkgaW4gdGhlIG5leHQgcmVsZWFzZS4g
Rm9yIG5vdywKPiB3ZSBjYW4gZG9jdW1lbnQgdGhpcyBsaW1pdGF0aW9uIHNvbWV3aGVyZS4KCklz
IE9QLVRFRSBhbHJlYWR5IHJlbGVhc2VkIHdpdGggdmlydHVhbGl6YXRpb24/IElmIG5vdCwgd2hl
biB3aWxsIGl0IGJlPwoKPiAKPj4+Cj4+Pj4+ICt0byBhY2Nlc3MgdG8gdGhlIHJlYWwgT1AtVEVF
IE9TIHJ1bm5pbmcgb24gdGhlIGhvc3QuIEd1ZXN0IGNyZWF0aW9uCj4+Pj4KPj4+PiBzL3JlYWwv
LyBpdCBpcyByZWR1bmRhbnQgd2l0aCB0aGUgcmVzdCBvZiB0aGUgc2VudGVuY2UuIEhvd2V2ZXIs
IGl0Cj4+Pj4gZG9lcyBub3QgcmVhbGx5IGFuc3dlciB0byB0aGUgcXVlc3Rpb24gcmVnYXJkaW5n
IGlzb2xhdGlvbi4KPj4+IFlvdXIgYXNzdW1wdGlvbiBpcyBjb3JyZWN0IC0gT1AtVEVFIHByb3Zp
ZGVzIGlzb2xhdGlvbiBvbiBpdHMgc2lkZS4KPj4+Cj4+Pj4KPj4+Pj4gK3dpbGwgZmFpbCBpZiBP
UC1URUUgaGF2ZSBubyByZXNvdXJjZXMgZm9yIGEgbmV3IGd1ZXN0LiBOdW1iZXIgb2Ygc3VwcG9y
dGVkCj4+Pj4+ICtndWVzdHMgZGVwZW5kcyBvbiBPUC1URUUgY29uZmlndXJhdGlvbi4KPj4+Pgo+
Pj4+IEhvdyBhYm91dCB0aGUgZm9sbG93aW5nIGRlc2NyaXB0aW9uIChjb3JyZWN0IG1lIGlmIG15
IHVuZGVyc3RhbmRpbmcgaXMKPj4+PiB3cm9uZyk6Cj4+Pj4KPj4+PiAiQWxsb3cgYSBndWVzdCB0
byBhY2Nlc3MgdGhlIGhvc3QgT1AtVEVFIE9TLiBYZW4gd2lsbCBtZWRpYXRlIHRoZQo+Pj4+IGFj
Y2VzcyB0byBPUC1URUUgYW5kIHRoZSByZXNvdXJjZSBpc29sYXRpb24gd2lsbCBiZSBwcm92aWRl
ZCBkaXJlY3RseQo+Pj4+IGJ5IE9QLVRFRS4gT1AtVEVFIGl0c2VsZiBtYXkgbGltaXQgdGhlIG51
bWJlciBvZiBndWVzdHMgdGhhdCBjYW4KPj4+PiBjb25jdXJyZW50bHkgdXNlIGl0LiBUaGlzIHJl
cXVpcmVzIGEgdmlydHVhbGl6YXRpb24tYXdhcmUgT1AtVEVFIGZvcgo+Pj4+IHRoaXMgdG8gd29y
ay4KPj4+Pgo+Pj4+IFRoaXMgZmVhdHVyZSBpcyBhIEI8dGVjaG5vbG9neSBwcmV2aWV3Pi4iCj4+
PiBUaGF0J3MgbXVjaCBiZXR0ZXIgdGhhbiBteSB2ZXJzaW9uLiBUaGFuayB5b3UuCj4+Pgo+Pj4+
IEhvdyBjYW4gYSB1c2VyIGtub3cgd2hldGhlciBPUC1URUUgc3VwcG9ydHMgdmlydHVhbGl6YXRp
b24/IElzIGl0Cj4+Pj4gY29uZmlndXJhYmxlIGF0IGJ1aWxkPwo+Pj4gWWVzLCB0aGVyZSBpcyBh
IHNwZWNpYWwgY29uZmlndXJhdGlvbiBvcHRpb24gQ0ZHX1ZJUlRVQUxJWkFUSU9OLiBUaGlzIGlz
Cj4+PiBjb3ZlcmVkIGluIE9QLVRFRSBkb2N1bWVudGF0aW9uIGF0IFsxXQo+Pj4KPj4+IFsxXSBo
dHRwczovL29wdGVlLnJlYWR0aGVkb2NzLmlvL2FyY2hpdGVjdHVyZS92aXJ0dWFsaXphdGlvbi5o
dG1sCj4+Cj4+IERvIHdlIGV4cGVjdCB0aGUgbGluayB0byBiZSBzdGFibGU/IElmIHNvLCB0aGVu
IEkgdGhpbmsgYSBsaW5rIGluIHRoZQo+PiBkb2N1bWVudGF0aW9uIHdvdWxkIGJlIHVzZWZ1bC4K
PiBUaGlzIGlzIHRoZSBvZmZpY2lhbCBPUC1URUUgZG9jdW1lbnRhdGlvbi4gU28sIHllcywgaXQg
c2hvdWxkIGJlIHN0YWJsZS4KPiBJIGNhbiBwdXQgdGhpcyBsaW5rIGludG8gdGhlIGNvZGUgc29t
ZXdoZXJlLgoKSSB3b3VsZCBhZGQgdGhlIGxpbmsgaW4gdGhlIHhsIGRvY3VtZW50YXRpb24gYW5k
IGFsc28gaW4gdGhlIGNvbW1pdCAKbWVzc2FnZSBvZiBwYXRjaCAjMi4gSSBjYW4gZG8gdGhlIGxh
dGVyIG9uIGNvbW1pdC4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
