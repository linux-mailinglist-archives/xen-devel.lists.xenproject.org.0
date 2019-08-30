Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49899A3AD2
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 17:47:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3j5Y-0000Mm-Su; Fri, 30 Aug 2019 15:45:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3j5Y-0000Mf-3K
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 15:45:24 +0000
X-Inumbo-ID: 2d7591e6-cb3d-11e9-ae8b-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d7591e6-cb3d-11e9-ae8b-12813bfff9fa;
 Fri, 30 Aug 2019 15:45:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7247BAF41;
 Fri, 30 Aug 2019 15:45:22 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190830083225.10397-1-jgross@suse.com>
 <43d293e5-40b8-fae9-4d27-0b6bd6afcbda@suse.com>
 <34ab8be2-4698-c592-6448-2ff47513c107@suse.com>
 <a2b60448-9698-2f1f-626f-a87d1e2fe20d@suse.com>
 <0caf8faa-2f7a-0ea6-693d-f505d34d2217@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f437617b-0b56-9e1e-f364-e49c45edf044@suse.com>
Date: Fri, 30 Aug 2019 17:45:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0caf8faa-2f7a-0ea6-693d-f505d34d2217@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen: add macro for defining variable length
 array in public headers
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDguMjAxOSAxNzozMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAzMC4wOC4xOSAx
NzoyMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDMwLjA4LjIwMTkgMTY6MjksIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBPbiAzMC4wOC4xOSAxNjoyMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4gT24gMzAuMDguMjAxOSAxMDozMiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+Pj4gLS0tIGEv
eGVuL2luY2x1ZGUvcHVibGljL3hlbi5oCj4+Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy94
ZW4uaAo+Pj4+PiBAQCAtNTMsNiArNTMsMTUgQEAgREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUodWlu
dDY0X3QpOwo+Pj4+PiAgICBERUZJTkVfWEVOX0dVRVNUX0hBTkRMRSh4ZW5fcGZuX3QpOwo+Pj4+
PiAgICBERUZJTkVfWEVOX0dVRVNUX0hBTkRMRSh4ZW5fdWxvbmdfdCk7Cj4+Pj4+ICAgIAo+Pj4+
PiArLyogRGVmaW5lIGEgdmFyaWFibGUgbGVuZ3RoIGFycmF5IChkZXBlbmRzIG9uIGNvbXBpbGVy
KS4gKi8KPj4+Pj4gKyNpZiBkZWZpbmVkKF9fU1REQ19WRVJTSU9OX18pICYmIF9fU1REQ19WRVJT
SU9OX18gPj0gMTk5OTAxTAo+Pj4+PiArI2RlZmluZSBfX1hFTl9WQVJMRU5fQVJSQVlfU0laRQo+
Pj4+PiArI2VsaWYgZGVmaW5lZChfX0dOVUNfXykKPj4+Pj4gKyNkZWZpbmUgX19YRU5fVkFSTEVO
X0FSUkFZX1NJWkUgIDAKPj4+Pj4gKyNlbHNlCj4+Pj4+ICsjZGVmaW5lIF9fWEVOX1ZBUkxFTl9B
UlJBWV9TSVpFICAxIC8qIHZhcmlhYmxlIHNpemUgKi8KPj4+Pj4gKyNlbmRpZgo+Pj4+Cj4+Pj4g
VG8gYmUgaW4gbGluZSB3aXRoIHRoZSBpbnRlbnRpb25zLCB0aGUgQzkwIHN0YW5kYXJkLCBhbmQg
aW8vcmluZy5oCj4+Pj4gSSdkIHN1Z2dlc3QgdG8gdXNlIEZMRVggaW5zdGVhZCBvZiBWQVJMRU4u
IEZ1cnRoZXJtb3JlLCBlc3BlY2lhbGx5Cj4+Pj4gaW4gYSBwdWJsaWMgaGVhZGVyLCB0d28gZG91
YmxlIGxlYWRpbmcgdW5kZXJzY29yZXMgbmVlZCB0byBnbyBhd2F5Lgo+Pj4+Cj4+Pj4gQW5kIHRo
ZW4sIHdpdGggRkxFWCBpbiB0aGUgbmFtZSwgU0laRSBpc24ndCByZWFsbHkgYXBwcm9wcmlhdGUK
Pj4+PiBhbnltb3JlLiBUaGVyZWZvcmUgSSBzZWUgdGhyZWUgcG9zc2libGUgbmFtZXM6IFhFTl9G
TEVYSUJMRV9BUlJBWSwKPj4+PiBYRU5fRkxFWF9BUlJBWV9ESU1FTlNJT04gKHBvc3NpYmx5IGp1
c3QgX0RJTSBhdCBpdHMgZW5kKSwgb3IKPj4+PiBYRU5fRkxFWF9BUlJBWV9ERVNJR05BVE9SLgo+
Pj4KPj4+IE9rYXkgdG8gdGhlICJGTEVYIiBwYXJ0LCBidXQgdGhlICJYRU5fIiBwcmVmaXggaXMg
bm90IHdvcmtpbmcgZHVlIHRvCj4+PiBjb21wYXQgaGVhZGVyIGdlbmVyYXRpb24gKHRoYXQgd2ls
bCByZXN1bHQgaW4gQ09NUEFUXyBwcmVmaXggaW4gdGhlCj4+PiBjb21wYXQgaGVhZGVycykuCj4+
Pgo+Pj4gU28gYW55IG90aGVyIGlkZWFzIGZvciBhIHNlbnNpYmxlIHByZWZpeD8KPj4KPj4gSG1t
LCB1Z2x5LiBQZXJoYXBzIGFsbCBsb3dlciBjYXNlIHRoZW4/IE9yIGhhdmUKPiAKPiB4ZW5fIGFu
ZCBYZW5fIGFyZSBiZWluZyBjb252ZXJ0ZWQsIHRvby4KCkZvciBYZW5fIEkgYWdyZWUsIGJ1dCBm
b3IgeGVuXyBJIG9ubHkgc2VlCgogWyByIihzdHJ1Y3R8dW5pb258ZW51bSlccysoeGVuXz8pPyhc
dykiLCByIlwxIGNvbXBhdF9cMyIgXSwKCmFuZAoKIFsgciIoXnxbXlx3XSl4ZW5fPyhcdyopX2Nv
bXBhdF90KFteXHddfCQkKSIsIHIiXDFjb21wYXRfXDJfdFwzIiBdLAoKLCBuZWl0aGVyIG9mIHdo
aWNoIHNob3VsZCBtYXRjaCB5b3VyICNkZWZpbmUuIEJ1dCBwZXJoYXBzIEknbQptaXNzaW5nIHNv
bWV0aGluZy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
