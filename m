Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 841648EF5E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 17:33:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyHhN-00021z-0L; Thu, 15 Aug 2019 15:29:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y4W9=WL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hyHhL-00020z-Ko
 for xen-devel@lists.xen.org; Thu, 15 Aug 2019 15:29:55 +0000
X-Inumbo-ID: 87cdafe8-bf71-11e9-b90c-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 87cdafe8-bf71-11e9-b90c-bc764e2007e4;
 Thu, 15 Aug 2019 15:29:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F366228;
 Thu, 15 Aug 2019 08:29:53 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4BF143F706;
 Thu, 15 Aug 2019 08:29:52 -0700 (PDT)
To: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>,
 Lars Kurth <lars.kurth.xen@gmail.com>
References: <20190815112708.11474-1-wipawel@amazon.de>
 <8d5350af-2ca8-a651-c43c-07372779322d@arm.com>
 <3E431F27-7D89-4CE8-8FBA-86A38EBA580F@xenproject.org>
 <A373327B-1B2B-4892-97DB-132D1EA7084E@amazon.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <664a5f94-bf16-42b1-ff99-e3cee5170563@arm.com>
Date: Thu, 15 Aug 2019 16:29:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <A373327B-1B2B-4892-97DB-132D1EA7084E@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH lp-metadata 2/3] livepatch: Handle arbitrary
 size names with the list operation
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
Cc: "Tim \(Xen.org\)" <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xen.org>,
 "Pohlack, Martin" <mpohlack@amazon.de>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxNS8wOC8yMDE5IDE2OjE5LCBXaWVjem9ya2lld2ljeiwgUGF3ZWwgd3JvdGU6Cj4gSGkg
TGFycywgSnVsaWVuLAoKSGksCgo+IFRoYW5rcyBmb3IgdGhlIHBvaW50ZXJzLCBJIHdpbGwgcmVh
ZCB0aGVtIHVwIGFuZCBmb2xsb3cgdGhlIHJlY29tbWVuZGF0aW9ucyB3aXRoIAo+IG15IGZ1dHVy
ZSBjb250cmlidXRpb25zLgo+IFNvcnJ5IGZvciB0aGUgbWVzc+KApgo+IAo+IEJ1dCwgbGV0IG1l
IGFzayBmaXJzdCBiZWZvcmUgcmVhZGluZyB0aGUgd2lraXMsIGhvdyBkbyB5b3UgcHJlZmVyIHN1
Ym1pdHRpbmcgCj4gc2VyaWVzIHRoYXQgY29udGFpbiBwYXRjaGVzIGJlbG9uZ2luZyB0byAyIGRp
c3RpbmN0IHJlcG9zIChlLmcuIHhlbiBhbmQgCj4gbGl2ZXBhdGNoLWJ1aWxkLXRvb2xzKT8KCkkg
Y2FuIHNlZSB0d28gd2F5czoKCiAgIDEpIE9uZSBzZXJpZXMgcGVyIHByb2plY3QgYW5kIG1lbnRp
b24gaW4gdGhlIGNvdmVyIGxldHRlciB0aGF0IG1vZGlmaWNhdGlvbnMgCmFyZSByZXF1aXJlZCBp
biBhbm90aGVyIHByb2plY3QgKHdpdGggbGluay90aXRsZSkuCiAgIDIpIENvbWJpbmUgYWxsIHRo
ZSBwYXRjaGVzIGluIG9uZSBzZXJpZXMgYW5kIHRhZyB0aGVtIGRpZmZlcmVudGx5LiBJLmUgW1hF
Tl0gCltMSVZFUEFUQ0hdLgoKMSkgaXMgcHJlZmVyYWJsZSBpZiB5b3UgaGF2ZSBhIGxvdCBvZiBw
YXRjaGVzIGluIGVhY2ggcmVwby4gMikgY2FuIGJlIGhhbmR5IGlmIAp5b3UgaGF2ZSBvbmx5IGEg
Y291cGxlIG9mIHBhdGNoZXMgZm9yIG9uZSByZXBvLgoKQ2hlZXJzLAoKPiAKPiBCZXN0IFJlZ2Fy
ZHMsCj4gUGF3ZWwgV2llY3pvcmtpZXdpY3oKPiAKPiAKPiAKPj4gT24gMTUuIEF1ZyAyMDE5LCBh
dCAxNjo1OCwgTGFycyBLdXJ0aCA8bGFycy5rdXJ0aC54ZW5AZ21haWwuY29tIAo+PiA8bWFpbHRv
OmxhcnMua3VydGgueGVuQGdtYWlsLmNvbT4+IHdyb3RlOgo+Pgo+Pgo+Pgo+Pj4gT24gMTUgQXVn
IDIwMTksIGF0IDEyOjM4LCBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tIAo+Pj4g
PG1haWx0bzpqdWxpZW4uZ3JhbGxAYXJtLmNvbT4+IHdyb3RlOgo+Pj4KPj4+IEhpLAo+Pj4KPj4+
IEkgYW0gbm90IGdvaW5nIHRvIGFuc3dlciBvbiB0aGUgcGF0Y2ggaXRzZWxmIGJ1dCB0aGUgcHJv
Y2Vzcy4KPj4+Cj4+PiBBbnkgc2VyaWVzIChpLmUgbW9yZSB0aGFuIG9uZSBwYXRjaCkgc2hvdWxk
IGNvbnRhaW4gYSBjb3ZlciBsZXR0ZXIgd2l0aCBhIAo+Pj4gcm91Z2ggc3VtbWFyeSBvZiB0aGUg
Z29hbCBvZiB0aGUgc2VyaWVzLgo+Pj4KPj4+IEZ1cnRoZXJtb3JlLCB0aGlzIDMgcGF0Y2hlcyBz
ZXJpZXMgaGFzIGJlZW4gcmVjZWl2ZWQgYXMgMyBzZXBhcmF0ZSB0aHJlYWRzIAo+Pj4gKGkuZSBp
bi1yZXBseS10byBpcyBtaXNzaW5nKS4gVGhpcyBpcyBtYWtpbmcgZGlmZmljdWx0IHRvIGtub3cg
dGhhdCBhbGwgdGhlIAo+Pj4gcGF0Y2hlcyBiZWxvbmdzIHRvIHRoZSBzYW1lIHNlcmllcy4gSW4g
Z2VuZXJhbCwgYWxsIHBhdGNoZXMgYXJlIHNlbmQgYXMgCj4+PiBpbi1yZXBseS10byB0aGUgY292
ZXIgbGV0dGVyLiBTbyBhbGwgdGhlIHBhdGNoZXMgc3RpY2tzIHRvZ2V0aGVyIGluIG9uZSB0aHJl
YWQuCj4+Pgo+Pj4gVGhlIGNvdmVyIGxldHRlciBjYW4gYmUgZ2VuZXJhdGVkIHZpYSBnaXQgZm9y
bWF0LXBhdGNoIC0tY292ZXItbGV0dGVyLiAKPj4+IFRocmVhZGluZyBpcyBkb25lIGF1dG9tYXRp
Y2FsbHkgd2l0aCBnaXQtc2VuZC1lbWFpbCB3aGVuIGFsbCB0aGUgcGF0Y2hlcyBhcyAKPj4+IHBh
c3NlZCBpbiBhcmd1bWVudHMuCj4+Pgo+Pj4gRm9yIG1vcmUgZGV0YWlscyBob3cgdG8gZG8gaXQs
IHlvdSBjYW4gcmVhZDoKPj4+Cj4+PiBodHRwczovL3dpa2kueGVucHJvamVjdC5vcmcvd2lraS9T
dWJtaXR0aW5nX1hlbl9Qcm9qZWN0X1BhdGNoZXMjU2VuZGluZ19hX1BhdGNoX1Nlcmllcwo+Pj4K
Pj4+IENoZWVycywKPj4KPj4gSGkgUGF3ZWwsCj4+Cj4+IHRoYW5rIHlvdSBmb3Igc3VibWl0dGlu
ZyB0aGUgcGF0Y2ggc2VyaWVzLgo+Pgo+PiBXZSBoYWQgYSBjb3VwbGUgb2YgbmV3IHN0YXJ0ZXJz
IHJlY2VudGx5IHdobyBmb2xsb3dlZCBhIHNpbWlsYXIgcGF0dGVybiB0byAKPj4geW91LiBBcyBh
IHJlc3VsdCBvZiB0aGlzLCBJIHJlY2VudGx5IHVwZGF0ZWQgdGhlIGZvbGxvd2luZyBkb2NzCj4+
Cj4+IGh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL1N1Ym1pdHRpbmdfWGVuX1Byb2pl
Y3RfUGF0Y2hlc8KgLSBEZWZpbml0aW9ucyAKPj4gYW5kIGdlbmVyYWwgd29ya2Zsb3cKPj4gVGhl
IGJpdCB3aGljaCBzYXZlcyB0aGUgbW9zdCB3b3JrIGlzIAo+PiBodHRwczovL3dpa2kueGVucHJv
amVjdC5vcmcvd2lraS9TdWJtaXR0aW5nX1hlbl9Qcm9qZWN0X1BhdGNoZXMjU2VuZGluZ19hX1Bh
dGNoX1Nlcmllcwo+PiBBcyBmb3IgSnVsaWVuJ3MgY29tbWVudCBvbiB0aGUgdGhyZWFkaW5nOiBz
ZWUgdGhlwqAtLXRocmVhZCBhbmQgLS1jb3Zlci1sZXR0ZXIgCj4+IG9wdGlvbiBhcyBkZXNjcmli
ZWQgaW4gdGhlIFNlbmRpbmcgYSBQYXRjaCBTZXJpZXMKPj4KPj4gaHR0cHM6Ly93aWtpLnhlbnBy
b2plY3Qub3JnL3dpa2kvTWFuYWdpbmdfWGVuX1BhdGNoZXNfd2l0aF9HaXTCoC0gQmFzaWMgR2l0
IAo+PiBjb21tYW5kcyBmaXR0aW5nIGludG8gdGhlIHdvcmtmbG93LCBpbmNsdWRpbmcgaG93IHRv
IGRlYWwgd2l0aCByZXZpZXdzCj4+IGh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL01h
bmFnaW5nX1hlbl9QYXRjaGVzX3dpdGhfU3RHaXTCoC0gQmFzaWMgU3RHaXQgCj4+IGNvbW1hbmRz
IGZpdHRpbmcgaW50byB0aGUgd29ya2Zsb3csIGluY2x1ZGluZyBob3cgdG8gZGVhbCB3aXRoIHJl
dmlld3MKPj4gSSBoYXZlIG5vdCBoYWQgdGltZSB0byBwbGF5IHdpdGggZ2l0IHNlcmllcyB5ZXQu
IElmIGFueW9uZSBpbiB5b3VyIHRlYW0gdXNlcyAKPj4gaXQgbGV0IG1lIGtub3cKPj4KPj4gSW4g
YW55IGNhc2U6IGlmIHlvdSBmb2xsb3cgdGhlIGluc3RydWN0aW9ucyB0aGUgZW50aXJlIHN1Ym1p
c3Npb24gcHJvY2VzcyBhbmQgCj4+IGRlYWxpbmcgd2l0aCByZXZpZXcgY29tbWVudHMgYmVjb21l
cyBtdWNoIGVhc2llci4KPj4KPj4gQXMgYSBuZXdjb21lciwgdG8gY29udHJpYnV0aW5nIHRvIFhl
biwgSSB3b3VsZCBncmVhdGx5IGFwcHJlY2lhdGUgaWYgeW91IGNvdWxkIAo+PiBsZXQgbWUga25v
dyBvZiBhbnkgaXNzdWVzIHdpdGggdGhlIGRvY3MsIHN1Y2ggdGhhdCB3ZSBjYW4gZml4IHRoZW0K
Pj4KPj4gUmVnYXJkcwo+PiBMYXJzCj4+Cj4+Cj4+Cj4gCj4gCj4gCj4gCj4gQW1hem9uIERldmVs
b3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKPiBLcmF1c2Vuc3RyLiAzOAo+IDEwMTE3IEJlcmxp
bgo+IEdlc2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgUmFsZiBIZXJicmlj
aAo+IEVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAx
NDkxNzMgQgo+IFNpdHo6IEJlcmxpbgo+IFVzdC1JRDogREUgMjg5IDIzNyA4NzkKPiAKPiAKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
