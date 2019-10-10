Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D91D2CDA
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 16:51:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIZhF-00037G-0J; Thu, 10 Oct 2019 14:45:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=njQE=YD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iIZhD-00037A-DZ
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 14:45:39 +0000
X-Inumbo-ID: 9d3ee1af-eb6c-11e9-931d-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 9d3ee1af-eb6c-11e9-931d-12813bfff9fa;
 Thu, 10 Oct 2019 14:45:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81341337;
 Thu, 10 Oct 2019 07:45:34 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6EC73F6C4;
 Thu, 10 Oct 2019 07:45:33 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190813213237.4819-1-julien.grall@arm.com>
 <alpine.DEB.2.21.1910021508370.2691@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e746361f-c797-ed59-c6f5-197b0eca95d0@arm.com>
Date: Thu, 10 Oct 2019 15:45:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1910021508370.2691@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/docs: arm: Update dom0less binding and
 example
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, viktor_mitin@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpKdWVyZ2VuLCB3b3VsZCB5b3UgYmUgaGFwcHkgaWYgdGhpcyBwYXRjaCBpcyBjb21taXR0
ZWQgZm9yIFhlbiA0LjEzPwoKQ2hlZXJzLAoKT24gMDIvMTAvMjAxOSAyMzoyNywgU3RlZmFubyBT
dGFiZWxsaW5pIHdyb3RlOgo+IE9uIFR1ZSwgMTMgQXVnIDIwMTksIEp1bGllbiBHcmFsbCB3cm90
ZToKPj4gVGhlIGJpbmRpbmcgZm9yIHRoZSBkb20wbGVzcyBtb2R1bGUgZG9lcyBub3QgbWF0Y2gg
WGVuIGltcGxlbWVudGF0aW9uLgo+PiBBbnkgbW9kdWxlIHNob3VsZCBjb250YWluIHRoZSBjb21w
YXRpYmxlICJtdWx0aWJvb3QsbW9kdWxlIiB0byBiZQo+PiByZWNvZ25pemVkLgo+Pgo+PiBUaGlz
IHdhcyBjbGVhcmx5IGFuIG92ZXJzaWdodCBhcyBvdGhlciBleGFtcGxlcyB3aXRoIFhlbiBjb2Rl
IGJhc2UKPj4gcHJvdmlkZSB0aGUgY29tcGF0aWJsZSAibXVsdGlib290LG1vZHVsZSIuCj4+Cj4+
IFNvIGZpeCB0aGUgYmluZGluZyBhbmQgdGhlIGV4YW1wbGUgYXNzb2NpYXRlZCB0byBpdC4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiAK
PiBZZXMhCj4gCj4gUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz4KPiAKPj4gLS0tCj4+Cj4+IENjOiB2aWt0b3JfbWl0aW5AZXBhbS5jb20KPj4K
Pj4gICAgICBXZSBwcm9iYWJseSB3YW50IHRvIGNvbnNvbGlkYXRlIGFsbCB0aGUgZG9tMGxlc3Mg
ZG9jdW1lbnRhdGlvbiBpbgo+PiAgICAgIG9uZSBwbGFjZSByYXRoZXIgdGhhbiBoYXZpbmcgdG8g
Zml4IGRvY3VtYXRpb24gaXNzdWVzIGluIGEgbXVsdGlwbGUKPj4gICAgICBwbGFjZXMgb25lIGJ5
IG9uZS4KPj4gLS0tCj4+ICAgZG9jcy9taXNjL2FybS9kZXZpY2UtdHJlZS9ib290aW5nLnR4dCB8
IDEyICsrKysrKy0tLS0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYg
ZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kb2NzL21pc2MvYXJtL2RldmljZS10cmVl
L2Jvb3RpbmcudHh0IGIvZG9jcy9taXNjL2FybS9kZXZpY2UtdHJlZS9ib290aW5nLnR4dAo+PiBp
bmRleCAzMTdhOWU5NjJhLi4wZmFmYTAxYjVkIDEwMDY0NAo+PiAtLS0gYS9kb2NzL21pc2MvYXJt
L2RldmljZS10cmVlL2Jvb3RpbmcudHh0Cj4+ICsrKyBiL2RvY3MvbWlzYy9hcm0vZGV2aWNlLXRy
ZWUvYm9vdGluZy50eHQKPj4gQEAgLTE2MCw3ICsxNjAsNyBAQCBUaGUga2VybmVsIHN1Yi1ub2Rl
IGhhcyB0aGUgZm9sbG93aW5nIHByb3BlcnRpZXM6Cj4+ICAgCj4+ICAgLSBjb21wYXRpYmxlCj4+
ICAgCj4+IC0gICAgIm11bHRpYm9vdCxrZXJuZWwiCj4+ICsgICAgIm11bHRpYm9vdCxrZXJuZWwi
LCAibXVsdGlib290LG1vZHVsZSIKPj4gICAKPj4gICAtIHJlZwo+PiAgIAo+PiBAQCAtMTc1LDcg
KzE3NSw3IEBAIFRoZSByYW1kaXNrIHN1Yi1ub2RlIGhhcyB0aGUgZm9sbG93aW5nIHByb3BlcnRp
ZXM6Cj4+ICAgCj4+ICAgLSBjb21wYXRpYmxlCj4+ICAgCj4+IC0gICAgIm11bHRpYm9vdCxyYW1k
aXNrIgo+PiArICAgICJtdWx0aWJvb3QscmFtZGlzayIsICJtdWx0aWJvb3QsbW9kdWxlIgo+PiAg
IAo+PiAgIC0gcmVnCj4+ICAgCj4+IEBAIC0xOTYsMTMgKzE5NiwxMyBAQCBjaG9zZW4gewo+PiAg
ICAgICAgICAgdnBsMDExOwo+PiAgIAo+PiAgICAgICAgICAgbW9kdWxlQDB4NGEwMDAwMDAgewo+
PiAtICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtdWx0aWJvb3Qsa2VybmVsIjsKPj4gKyAgICAg
ICAgICAgIGNvbXBhdGlibGUgPSAibXVsdGlib290LGtlcm5lbCIsICJtdWx0aWJvb3QsbW9kdWxl
IjsKPj4gICAgICAgICAgICAgICByZWcgPSA8MHgwIDB4NGEwMDAwMDAgMHhmZmZmZmY+Owo+PiAg
ICAgICAgICAgICAgIGJvb3RhcmdzID0gImNvbnNvbGU9dHR5QU1BMCBpbml0PS9iaW4vc2giOwo+
PiAgICAgICAgICAgfTsKPj4gICAKPj4gICAgICAgICAgIG1vZHVsZUAweDRiMDAwMDAwIHsKPj4g
LSAgICAgICAgICAgIGNvbXBhdGlibGUgPSAibXVsdGlib290LHJhbWRpc2siOwo+PiArICAgICAg
ICAgICAgY29tcGF0aWJsZSA9ICJtdWx0aWJvb3QscmFtZGlzayIsICJtdWx0aWJvb3QsbW9kdWxl
IjsKPj4gICAgICAgICAgICAgICByZWcgPSA8MHgwIDB4NGIwMDAwMDAgMHhmZmZmZmY+Owo+PiAg
ICAgICAgICAgfTsKPj4gICAgICAgfTsKPj4gQEAgLTIxNSwxMyArMjE1LDEzIEBAIGNob3NlbiB7
Cj4+ICAgICAgICAgICBjcHVzID0gPDE+Owo+PiAgIAo+PiAgICAgICAgICAgbW9kdWxlQDB4NGMw
MDAwMDAgewo+PiAtICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtdWx0aWJvb3Qsa2VybmVsIjsK
Pj4gKyAgICAgICAgICAgIGNvbXBhdGlibGUgPSAibXVsdGlib290LGtlcm5lbCIsICJtdWx0aWJv
b3QsbW9kdWxlIjsKPj4gICAgICAgICAgICAgICByZWcgPSA8MHgwIDB4NGMwMDAwMDAgMHhmZmZm
ZmY+Owo+PiAgICAgICAgICAgICAgIGJvb3RhcmdzID0gImNvbnNvbGU9dHR5QU1BMCBpbml0PS9i
aW4vc2giOwo+PiAgICAgICAgICAgfTsKPj4gICAKPj4gICAgICAgICAgIG1vZHVsZUAweDRkMDAw
MDAwIHsKPj4gLSAgICAgICAgICAgIGNvbXBhdGlibGUgPSAibXVsdGlib290LHJhbWRpc2siOwo+
PiArICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtdWx0aWJvb3QscmFtZGlzayIsICJtdWx0aWJv
b3QsbW9kdWxlIjsKPj4gICAgICAgICAgICAgICByZWcgPSA8MHgwIDB4NGQwMDAwMDAgMHhmZmZm
ZmY+Owo+PiAgICAgICAgICAgfTsKPj4gICAgICAgfTsKPj4gLS0gCj4+IDIuMTEuMAo+PgoKLS0g
Ckp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
