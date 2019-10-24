Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DD9E2C73
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 10:48:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNYlW-0003e3-09; Thu, 24 Oct 2019 08:46:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3mlJ=YR=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iNYlU-0003dy-NE
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 08:46:40 +0000
X-Inumbo-ID: c95e8586-f63a-11e9-9498-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c95e8586-f63a-11e9-9498-12813bfff9fa;
 Thu, 24 Oct 2019 08:46:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A03552B;
 Thu, 24 Oct 2019 01:46:35 -0700 (PDT)
Received: from [10.37.8.60] (unknown [10.37.8.60])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8EA563F718;
 Thu, 24 Oct 2019 01:46:34 -0700 (PDT)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <osstest-143061-mainreport@xen.org>
 <45b32f7a-4dcd-c576-4d3f-387cec4d91e2@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e0864a74-876d-73ab-f6f1-de4b41d35bf4@arm.com>
Date: Thu, 24 Oct 2019 09:46:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <45b32f7a-4dcd-c576-4d3f-387cec4d91e2@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [xen-unstable test] 143061: regressions - trouble:
 broken/fail/pass
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KCtJYW4gYW5kIFN0ZWZhbm8pCgpIaSwKCk9uIDEwLzI0LzE5IDg6MTMgQU0sIErDvHJnZW4gR3Jv
w58gd3JvdGU6Cj4gT24gMjQuMTAuMTkgMDg6NDcsIG9zc3Rlc3Qgc2VydmljZSBvd25lciB3cm90
ZToKPj4gZmxpZ2h0IDE0MzA2MSB4ZW4tdW5zdGFibGUgcmVhbCBbcmVhbF0KPj4gaHR0cDovL2xv
Z3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0MzA2MS8KPj4KPj4gUmVn
cmVzc2lvbnMgOi0oCj4+Cj4+IFRlc3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJs
b2NraW5nLAo+PiBpbmNsdWRpbmcgdGVzdHMgd2hpY2ggY291bGQgbm90IGJlIHJ1bjoKPj4gwqAg
dGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11dC1zdHViZG9tLWRlYmlhbmh2bS1hbWQ2NC14c23CoMKg
wqAgPGpvYiAKPj4gc3RhdHVzPsKgwqAgYnJva2VuCj4+IMKgIHRlc3QtYW1kNjQtYW1kNjQteGwt
cWVtdXQtc3R1YmRvbS1kZWJpYW5odm0tYW1kNjQteHNtIDQgCj4+IGhvc3QtaW5zdGFsbCg0KSBi
cm9rZW4gUkVHUi4gdnMuIDE0Mjc1MAo+IAo+IFdoeSBpcyBMaW51eCBrZXJuZWwgNS40LjAtcmM0
IGJlaW5nIHVzZWQgZm9yIHRlc3RpbmcgeGVuLXVuc3RhYmxlIGhlcmU/Cj4gT3IgYW0gSSByZWFk
aW5nIHRoZSBsb2dzIHdyb25nPwo+IAo+PiDCoCB0ZXN0LWFybTY0LWFybTY0LWV4YW1pbmXCoMKg
wqAgMTEgZXhhbWluZS1zZXJpYWwvYm9vdGxvYWRlciBmYWlsIFJFR1IuIAo+PiB2cy4gMTQyNzUw
Cj4gCj4gSSdtIG5vdCBzdXJlIHdoYXQgaGFzIGdvbmUgd3JvbmcgaGVyZT8gVGhlIHNlcmlhbCBs
b2dzIHNlZW0gdG8gYmUgZmluZQo+IGZvciBtZSwgYnV0IG1heWJlIEknbSBtaXNzaW5nIHNvbWV0
aGluZz8KClRoaXMgaXMgYSBrbm93biBpc3N1ZSBvbiByb2NoZXN0ZXJzIGZvciB0aGUgcGFzdCA2
IG1vbnRocyAoc2VlIFsxXSkuIEluIApzaG9ydCwgT3NzdGVzdCBpcyBjaGVja2luZyB0aGUgc2Fu
aXR5IG9mIHRoZSBwbGF0Zm9ybSBieSBhZGRpbmcgY29va2llIAppbiB0aGUgYm9vdGxvYWRlciBv
dXRwdXQuIEhvd2V2ZXIsIHRoaXMgY29va2llIGlzIGxvc3QuCgpTdGVmYW5vIHByb21pc2VkIHRv
IGludmVzdGlnYXRlIGl0IGJhY2sgdGhlbi4gTGFzdCB0aW1lIEkgaGVhcmQsIGhlIGhhZCAKYWNj
ZXNzIHRvIHRoZSBjb2xvLiBTdGVmYW5vIHdoZXJlIGFyZSB3ZSB3aXRoIHRoaXM/CgpDaGVlcnMs
CgpbMV0gaHR0cHM6Ly9saXN0cy54ZW4ub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTkt
MDUvbXNnMDAwMTguaHRtbAoKPiAKPiAKPiBKdWVyZ2VuCj4gCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4g
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
