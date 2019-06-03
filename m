Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BFE32FC9
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 14:37:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXmAh-0004VG-B9; Mon, 03 Jun 2019 12:34:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fnY6=UC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hXmAg-0004V3-KH
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 12:34:38 +0000
X-Inumbo-ID: f1a08486-85fb-11e9-97fd-67a25ccdb224
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id f1a08486-85fb-11e9-97fd-67a25ccdb224;
 Mon, 03 Jun 2019 12:34:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4BB315A2;
 Mon,  3 Jun 2019 05:34:34 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB0D73F5AF;
 Mon,  3 Jun 2019 05:34:33 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190521212530.12706-1-volodymyr_babchuk@epam.com>
 <20190521212530.12706-5-volodymyr_babchuk@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <50261dec-9f1d-de25-78ba-a5eb6fef54ed@arm.com>
Date: Mon, 3 Jun 2019 13:34:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190521212530.12706-5-volodymyr_babchuk@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 04/10] xen/arm: optee: add fast calls
 handling
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
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVm9sb2R5bXlyLAoKT24gMjEvMDUvMjAxOSAyMjoyNSwgVm9sb2R5bXlyIEJhYmNodWsgd3Jv
dGU6Cj4gVGhpcyBwYXRjaCBhZGRzIGhhbmRsaW5nIGZvciB0aGUgZmFzdCBTTUNzLiBBcyBuYW1l
IHN1Z2dlc3RzLCB0aG9zZQo+IGNhbGxzIGNhbid0IGJlIHByZWVtcHRlZCBhbmQgYXJlIHVzZWQg
Zm9yIGF1eGlsaWFyeSB0YXNrcyBzdWNoIGFzCj4gaW5mb3JtYXRpb24gcmV0cmlldmFsLiBNb3N0
IGhhbmRsZXJzIGFyZSBxdWl0ZSB0cml2aWFsLCB3aXRoIGV4Y2VwdGlvbgo+IGZvciBjYXBhYmls
aXRpZXMgaW5mb3JtYXRpb24uCj4gCj4gQ2FwYWJpbGl0aWVzIGV4Y2hhbmdlIHNob3VsZCBiZSBm
aWx0ZXJlZCBvdXQsIHNvIG9ubHkgY2Fwcwo+IGtub3duIHRvIG1lZGlhdG9yIGFyZSB1c2VkLiBB
bHNvIG1lZGlhdG9yIGRpc2FibGVzIHN0YXRpYyBTSE0KPiBtZW1vcnkgY2FwYWJpbGl0eSwgYmVj
YXVzZSBpdCBjYW4ndCBzaGFyZSBPUC1URUUgbWVtb3J5IHdpdGggYSBkb21haW4uCj4gT25seSBk
b21haW4gY2FuIHNoYXJlIG1lbW9yeSB3aXRoIE9QLVRFRSwgc28gaXQgZW5zdXJlcyB0aGF0IE9Q
LVRFRQo+IHN1cHBvcnRzIGR5bmFtaWMgU0hNLgo+IAo+IEJhc2ljYWxseSwgc3RhdGljIFNITSBp
cyBhIHJlc2VydmVkIG1lbW9yeSByZWdpb24gd2hpY2ggaXMgYWx3YXlzCj4gbWFwcGVkIGludG8g
T1AtVEVFIGFkZHJlc3Mgc3BhY2UuIEl0IGJlbG9uZ3MgdG8gT1AtVEVFLiBOb3JtYWxseSwKPiBO
VyBpcyBhbGxvd2VkIHRvIGFjY2VzcyB0aGVyZSwgc28gaXQgY2FuIGNvbW11bmljYXRlIHdpdGgg
T1AtVEVFLgo+IAo+IE9uIG90aGVyIGhhbmQsIGR5bmFtaWMgU0hNIGlzIE5XJ3Mgb3duIG1lbW9y
eSwgd2hpY2ggaXQgY2FuIHNoYXJlCj4gd2l0aCBPUC1URUUuIE9QLVRFRSBtYXBzIHRoaXMgbWVt
b3J5IGR5bmFtaWNhbGx5LCB3aGVuIGl0IHdhbnRzIHRvCj4gYWNjZXNzIGl0Lgo+IAo+IEJlY2F1
c2UgbWVkaWF0b3IgY2FuJ3Qgc2hhcmUgb25lIHN0YXRpYyBTSE0gcmVnaW9uIHdpdGggYWxsIGd1
ZXN0cywgaXQKPiBqdXN0IGRpc2FibGVzIGl0IGZvciBhbGwgb2YgdGhlbS4gSXQgaXMgcG9zc2li
bGUgdG8gbWFrZSBleGNlcHRpb24gZm9yCj4gRG9tMCwgYnV0IGl0IHJlcXVpcmVzIHNlcGFyYXRl
IGhhbmRsaW5nIGZvciBidWZmZXJzIGFsbG9jYXRlZCBmcm9tCj4gdGhhdCByZWdpb24uIFRodXMs
IGl0IGlzIG5vdCBpbXBsZW1lbnRlZCB5ZXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogVm9sb2R5bXly
IEJhYmNodWsgPHZvbG9keW15cl9iYWJjaHVrQGVwYW0uY29tPgoKQWNrZWQtYnk6IEp1bGllbiBH
cmFsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
