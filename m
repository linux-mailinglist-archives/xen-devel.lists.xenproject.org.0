Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFEB21DF3
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 21:03:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRi5b-0000Bq-9Y; Fri, 17 May 2019 19:00:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=i9tk=TR=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hRi5Z-0000Bf-HG
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 19:00:17 +0000
X-Inumbo-ID: 01941ffa-78d6-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 01941ffa-78d6-11e9-8980-bc764e045a96;
 Fri, 17 May 2019 19:00:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D3C51993;
 Fri, 17 May 2019 12:00:15 -0700 (PDT)
Received: from [10.37.9.164] (unknown [10.37.9.164])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC8EA3F575;
 Fri, 17 May 2019 12:00:13 -0700 (PDT)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <osstest-136184-mainreport@xen.org>
 <20190516103727.GB5438@perard.uk.xensource.com>
 <c576ae9d-4a6e-1602-7f05-6fc2c7b26314@arm.com>
 <20190517172344.GE1245@perard.uk.xensource.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <d2ac0071-149e-0c03-016c-d9ad2a423f5e@arm.com>
Date: Fri, 17 May 2019 20:00:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190517172344.GE1245@perard.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [qemu-upstream-4.11-testing test] 136184:
 regressions - FAIL
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
Cc: Ian Jackson <ian.jackson@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA1LzE3LzE5IDY6MjMgUE0sIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IE9uIFRodSwg
TWF5IDE2LCAyMDE5IGF0IDEwOjM4OjU0UE0gKzAxMDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4g
SGkgQW50aG9ueSwKPj4KPj4gVGhhbmsgeW91IGZvciBDQ2luZyBtZS4KPj4KPj4gT24gNS8xNi8x
OSAxMTozNyBBTSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4+PiBPbiBXZWQsIE1heSAxNSwgMjAx
OSBhdCAwNzo0ODoxN1BNICswMDAwLCBvc3N0ZXN0IHNlcnZpY2Ugb3duZXIgd3JvdGU6Cj4+Pj4g
ZmxpZ2h0IDEzNjE4NCBxZW11LXVwc3RyZWFtLTQuMTEtdGVzdGluZyByZWFsIFtyZWFsXQo+Pj4+
IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xMzYxODQv
Cj4+Pj4KPj4+PiBSZWdyZXNzaW9ucyA6LSgKPj4+Pgo+Pj4+IFRlc3RzIHdoaWNoIGRpZCBub3Qg
c3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAo+Pj4+IGluY2x1ZGluZyB0ZXN0cyB3aGljaCBjb3Vs
ZCBub3QgYmUgcnVuOgo+Pj4+ICAgIGJ1aWxkLWFybTY0LXB2b3BzICAgICAgICAgICAgICAgPGpv
YiBzdGF0dXM+ICAgICAgICAgICAgICAgICBicm9rZW4gIGluIDEzNDU5NAo+Pj4+ICAgIGJ1aWxk
LWFybTY0ICAgICAgICAgICAgICAgICAgICAgPGpvYiBzdGF0dXM+ICAgICAgICAgICAgICAgICBi
cm9rZW4gIGluIDEzNDU5NAo+Pj4+ICAgIGJ1aWxkLWFybTY0LXhzbSAgICAgICAgICAgICAgICAg
PGpvYiBzdGF0dXM+ICAgICAgICAgICAgICAgICBicm9rZW4gIGluIDEzNDU5NAo+Pj4+ICAgIGJ1
aWxkLWFybTY0LXhzbSAgICAgICAgICAgIDQgaG9zdC1pbnN0YWxsKDQpIGJyb2tlbiBpbiAxMzQ1
OTQgUkVHUi4gdnMuIDEyNTU3NQo+Pj4+ICAgIGJ1aWxkLWFybTY0LXB2b3BzICAgICAgICAgIDQg
aG9zdC1pbnN0YWxsKDQpIGJyb2tlbiBpbiAxMzQ1OTQgUkVHUi4gdnMuIDEyNTU3NQo+Pj4+ICAg
IGJ1aWxkLWFybTY0ICAgICAgICAgICAgICAgIDQgaG9zdC1pbnN0YWxsKDQpIGJyb2tlbiBpbiAx
MzQ1OTQgUkVHUi4gdnMuIDEyNTU3NQo+Pj4+ICAgIHRlc3QtYXJtNjQtYXJtNjQtbGlidmlydC14
c20gIDcgeGVuLWJvb3QgICAgICAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDEyNTU3NQo+Pj4+
ICAgIHRlc3QtYXJtNjQtYXJtNjQteGwgICAgICAgICAgIDcgeGVuLWJvb3QgICAgICAgICAgICAg
ICAgIGZhaWwgUkVHUi4gdnMuIDEyNTU3NQo+Pj4+ICAgIHRlc3QtYXJtNjQtYXJtNjQteGwteHNt
ICAgICAgIDcgeGVuLWJvb3QgICAgICAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDEyNTU3NQo+
Pj4+ICAgIHRlc3QtYXJtNjQtYXJtNjQteGwtY3JlZGl0MiAgIDcgeGVuLWJvb3QgICAgICAgICAg
ICAgICAgIGZhaWwgUkVHUi4gdnMuIDEyNTU3NQo+Pj4+Cj4+Pgo+Pj4gSWFuLCBKdWxpZW4sCj4+
Pgo+Pj4gSSBjYW4ndCBmaWd1cmUgb3V0IHdoeSBYZW4gY29uc2lzdGVudGx5IGZhaWxzIHRvIGJv
b3Qgb24gcm9jaGVzdGVyKiBpbgo+Pj4gdGhlIHFlbXUtdXBzdHJlYW0tNC4xMS10ZXN0aW5nIGZs
aWdodHMuIFRoZSB4ZW4tNC4xMS10ZXN0aW5nIHNlZW1zIHRvCj4+PiBwYXNzLgo+Pj4KPj4+IEF0
IGJvb3QsIHRoZSBib290IGxvYWRlciBzZWVtcyB0byBsb2FkIGJsb2JzLCBidXQgd2hlbiBpdCdz
IHRpbWUgdG8gWGVuCj4+PiB0byBzaGluZSwgdGhlcmUgYXJlIG5vIG91dHB1dCBmcm9tIFhlbiBv
biB0aGUgc2VyaWFsLgo+Pgo+PiBUaGUgc2VyaWFsIGNvbnNvbGUgaXMgaW5pdGlhbGl6aW5nIGZh
aXJseSBsYXRlIGluIHRoZSBwcm9jZXNzLiBBbnkgdXNlZnVsCj4+IG1lc3NhZ2UgKHN1Y2ggYXMg
bWVtb3J5IHNldHVwIG9yIGV2ZW4gcGFydCBvZiB0aGUgaW50ZXJydXB0cykgd2lsbCBiZSBoaWRl
Cj4+IG91dC4gRm9yIGdldHRpbmcgdGhlbSwgeW91IG5lZWQgZWFybHlwcmludGsuIFVuZm9ydHVu
YXRlbHkgdGhleSBjYW4ndCBiZQo+PiBjb25maWd1cmVkIGF0IHJ1bnRpbWUgdG9kYXkgOiguCj4g
Cj4gSSB0aGluayBJIG1hbmFnZWQgdG8gcnVuIHRoZSBqb2Igd2l0aCBlYXJseXByaW50ayBvbiBy
b2NoZXN0ZXIsIGJ1dAo+IFhlbiBoYXZlIGJvb3RlZDoKPiBodHRwOi8vbG9ncy50ZXN0LWxhYi54
ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM2NDUxLwoKWWVzIHRoaXMgaXMgd2l0aCBlYXJs
eXByaW50ay4gVGhhdCdzIGdvaW5nIHRvIGJlIGZ1biB0byByZXByb2R1Y2UgaWYgCmVhcmx5cHJp
bnRrIG1vZGlmaWVzIHRoZSBiZWhhdmlvci4KCkkgdGhpbmsgd2UgY2FuIGludGVycHJldCBhcyBl
YXJseXByaW50ayBhZGQgZW5vdWdoIGxhdGVuY3kgdG8gbWFrZSAKZXZlcnl0aGluZyB3b3JraW5n
LgoKVGhlcmUgYXJlIHR3byBwb3NzaWJsZSBpc3N1ZXMgSSBjYW4gdGhpbmsgb2Y6CiAgICAgMSkg
VGhlIGJvb3QgY29kZSBkb2VzIG5vdCBmb2xsb3cgdGhlIEFybSBBcm0sIHNvIGl0IG1heSBiZSBw
b3NzaWJsZSAKdGhlIGJvYXJkIGlzIGRvaW5nIHNvbWV0aGluZyBkaWZmZXJlbnQgY29tcGFyZSB0
byB0aGUgb3RoZXIgcmVnYXJkaW5nIAp0aGUgbWVtb3J5LiBJSVJDLCB0aGlzIGlzIHRoZSBmaXJz
dCBoYXJkd2FyZSB3ZSBoYXZlIHdpdGggY29yZSBub3QgCmRpcmVjdGx5IGRlc2lnbmVkIGJ5IEFy
bS4KICAgICAyKSBXZSBhcmUgbWlzc2luZyBzb21lIGVycmF0YSBpbiBYZW4uIExpbnV4IGNvbnRh
aW5zIDYgZXJyYXRhIGZvciAKdGhhdCBwbGF0Zm9ybS4gTG9va2luZyBhdCB0aGVtLCBJIGRvbid0
IHRoaW5rIHRoZXkgbWF0dGVyIGZvciBib290IHRpbWUuCgoxKSBpcyBjdXJyZW50bHkgYmVlbiBs
b29rZWQgYXQgKHNlZSBNTS1QQVJUKiBwYXRjaGVzIG9uIHRoZSBNTCkuIDIpIApzaG91bGQgcHJv
YmFibHkgYmUgYWRkcmVzc2VkIGF0IHNvbWUgcG9pbnQsIGJ1dCBJIG1heSBub3QgYmUgYWJsZSB0
byAKc2VuZCB0aGVtIGFzIEFybSBlbXBsb3llZSAod2UgdGVuZCB0byBhdm9pZCBzZW5kaW5nIHBh
dGNoIHNob3dpbmcgCmJyb2tlbm5lc3MgaW4gcGFydG5lciBzaWxpY29uKS4KCkNoZWVycywKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
