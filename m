Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 098D3CB59A
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 10:00:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGISu-0003T3-UX; Fri, 04 Oct 2019 07:57:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IEoo=X5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iGISu-0003Sy-0T
 for xen-devel@lists.xen.org; Fri, 04 Oct 2019 07:57:28 +0000
X-Inumbo-ID: 9a62334b-e67c-11e9-9742-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 9a62334b-e67c-11e9-9742-12813bfff9fa;
 Fri, 04 Oct 2019 07:57:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DA6D1597;
 Fri,  4 Oct 2019 00:57:26 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D61F3F739;
 Fri,  4 Oct 2019 00:57:23 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1910031812380.30844@sstabellini-ThinkPad-T480s>
 <20191004011457.11126-5-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <1370cc59-62c2-bd83-5f3f-83d8cb7d7a4a@arm.com>
Date: Fri, 4 Oct 2019 08:57:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191004011457.11126-5-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v9 5/8] xen/arm: assign devices to boot
 domains
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
Cc: Volodymyr_Babchuk@epam.com, Achin.Gupta@arm.com, andrii_anisov@epam.com,
 Stefano Stabellini <stefanos@xilinx.com>, xen-devel@lists.xen.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDA0LzEwLzIwMTkgMDI6MTQsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBTY2FuIHRoZSB1c2VyIHByb3ZpZGVkIGR0YiBmcmFnbWVudCBhdCBib290LiBGb3IgZWFj
aCBkZXZpY2Ugbm9kZSwgbWFwCj4gbWVtb3J5IHRvIGd1ZXN0cywgYW5kIHJvdXRlIGludGVycnVw
dHMgYW5kIHNldHVwIHRoZSBpb21tdS4KPiAKPiBUaGUgbWVtb3J5IHJlZ2lvbiB0byByZW1hcCBp
cyBzcGVjaWZpZWQgYnkgdGhlICJ4ZW4scmVnIiBwcm9wZXJ0eS4KPiAKPiBUaGUgaW9tbXUgaXMg
c2V0dXAgYnkgcGFzc2luZyB0aGUgbm9kZSBvZiB0aGUgZGV2aWNlIHRvIGFzc2lnbiBvbiB0aGUK
PiBob3N0IGRldmljZSB0cmVlLiBUaGUgcGF0aCBpcyBzcGVjaWZpZWQgaW4gdGhlIGRldmljZSB0
cmVlIGZyYWdtZW50IGFzCj4gdGhlICJ4ZW4scGF0aCIgc3RyaW5nIHByb3BlcnR5Lgo+IAo+IFRo
ZSBpbnRlcnJ1cHRzIGFyZSByZW1hcHBlZCBiYXNlZCBvbiB0aGUgaW5mb3JtYXRpb24gZnJvbSB0
aGUKPiBjb3JyZXNwb25kaW5nIG5vZGUgb24gdGhlIGhvc3QgZGV2aWNlIHRyZWUuIENhbGwKPiBo
YW5kbGVfZGV2aWNlX2ludGVycnVwdHMgdG8gcmVtYXAgaW50ZXJydXB0cy4gSW50ZXJydXB0cyBy
ZWxhdGVkIGRldmljZQo+IHRyZWUgcHJvcGVydGllcyBhcmUgY29waWVkIGZyb20gdGhlIGRldmlj
ZSB0cmVlIGZyYWdtZW50LCBzYW1lIGFzIGFsbAo+IHRoZSBvdGhlciBwcm9wZXJ0aWVzLgo+IAo+
IFJlcXVpcmUgYm90aCB4ZW4scmVnIGFuZCB4ZW4scGF0aCB0byBiZSBwcmVzZW50LCB1bmxlc3MK
PiB4ZW4sZm9yY2UtYXNzaWduLXdpdGhvdXQtaW9tbXUgaXMgYWxzbyBzZXQuIEluIHRoYXQgY2Fz
ZSwgdG9sZXJhdGUgYQo+IG1pc3NpbmcgeGVuLHBhdGgsIGFsc28gdG9sZXJhdGUgaW9tbXUgc2V0
dXAgZmFpbHVyZSBmb3IgdGhlIHBhc3N0aHJvdWdoCj4gZGV2aWNlLgo+IAo+IEFsc28gc2V0IGFk
ZCB0aGUgbmV3IGZsYWcgWEVOX0RPTUNUTF9DREZfaW9tbXUgc28gdGhhdCBkb20wbGVzcyBkb21V
Cj4gY2FuIHVzZSB0aGUgSU9NTVUgaWYgYSBwYXJ0aWFsIGR0YiBpcyBzcGVjaWZpZWQuCj4gCj4g
U2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgoK
UmV2aWV3ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxMQGFybS5jb20+CgpDaGVlcnMs
CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
