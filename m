Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32729C901A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 19:43:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFibf-00030W-95; Wed, 02 Oct 2019 17:40:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2BXq=X3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFibd-0002sB-FN
 for xen-devel@lists.xen.org; Wed, 02 Oct 2019 17:40:05 +0000
X-Inumbo-ID: ab0016b4-e53b-11e9-971c-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id ab0016b4-e53b-11e9-971c-12813bfff9fa;
 Wed, 02 Oct 2019 17:40:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52D681000;
 Wed,  2 Oct 2019 10:40:04 -0700 (PDT)
Received: from [10.37.10.48] (unknown [10.37.10.48])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2BD6D3F706;
 Wed,  2 Oct 2019 10:40:03 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1909301628540.2594@sstabellini-ThinkPad-T480s>
 <20190930233032.2120-8-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <75c8d8f0-e44b-154f-b3f1-3980313c5ac0@arm.com>
Date: Wed, 2 Oct 2019 18:40:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190930233032.2120-8-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7b 8/8] xen/arm: add dom0-less device
 assignment info to docs
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

SGkgU3RlZmFubywKCk9uIDEwLzEvMTkgMTI6MzAgQU0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiArLSB4ZW4scmVnCj4gKwo+ICsgIFRoZSB4ZW4scmVnIHByb3BlcnR5IGlzIGFuIGFycmF5
IG9mOgo+ICsKPiArICAgIDxwaHlzX2FkZHIgc2l6ZSBndWVzdF9hZGRyPgo+ICsKPiArICBUaGV5
IHNwZWNpZnkgdGhlIHBoeXNpY2FsIGFkZHJlc3MgYW5kIHNpemUgb2YgdGhlIGRldmljZSBtZW1v
cnkKPiArICByYW5nZXMgdG9nZXRoZXIgd2l0aCB0aGUgY29ycmVzcG9uZGluZyBndWVzdCBhZGRy
ZXNzIHRvIG1hcCB0aGVtIHRvLgo+ICsgIFRoZSBzaXplIG9mIGBwaHlzX2FkZHInIGFuZCBgZ3Vl
c3RfYWRkcicgaXMgZGV0ZXJtaW5lZCBieQo+ICsgICNhZGRyZXNzLWNlbGxzLCB0aGUgc2l6ZSBv
ZiBgc2l6ZScgaXMgZGV0ZXJtaW5lZCBieSAjc2l6ZS1jZWxscywgb2YKPiArICB0aGUgcGFydGlh
bCBkZXZpY2UgdHJlZS4KPiArICBUaGUgbWVtb3J5IHdpbGwgYmUgbWFwcGVkIGFzIGRldmljZSBt
ZW1vcnkgaW4gdGhlIGd1ZXN0IChEZXZpY2UtbkduUkUpLgo+ICsKPiArLSB4ZW4scGF0aAo+ICsK
PiArICBBIHN0cmluZyBwcm9wZXJ0eSByZXByZXNlbnRpbmcgdGhlIHBhdGggaW4gdGhlIGhvc3Qg
ZGV2aWNlIHRyZWUgdG8gdGhlCj4gKyAgY29ycmVzcG9uZGluZyBkZXZpY2Ugbm9kZS4KPiArCj4g
Ky0geGVuLGZvcmNlLWFzc2lnbi13aXRob3V0LWlvbW11Cj4gKyAgSWYgcHJlc2VudCwgeGVuLHBh
dGggaXMgb3B0aW9uYWwgKG90aGVyd2lzZSBpdCBpcyBhbHdheXMgcmVxdWlyZWQpLgoKSSBhbSBv
ayB3aXRoIHRoZSBpbXBsZW1lbnRhdGlvbiB0byBhbGxvdyB4ZW4scGF0aCB0byBiZSBvcHRpb25h
bC4gQnV0IEkgCnRoaW5rOgoKICAgMSkgVGhpcyBpcyBhIGdvb2QgaGFiaXQgdG8gaGF2ZSB4ZW4s
cGF0aCBwcmVzZW50IGluIHRoZSBEVCBiZWNhdXNlIGl0IAphY3RzIGFzIGRvY3VtZW50YXRpb24g
KHRoZSB1c2VyIGRpcmVjdGx5IGtub3cgdGhlIGFzc29jaWF0ZWQgbm9kZSBpbiB0aGUgCmhvc3Qg
RFQpLgoKICAgMikgSXQgaXMgZWFzaWVyIHRvIHJlbGF4IGEgYmluZGluZyBpbiB0aGUgZnV0dXJl
IG92ZXIgdGlnaHRlbmluZyBhZ2Fpbi4KCiAgIDMpIFRoaXMgYXZvaWRzIHRoZSBtdWx0aXBsZSBi
ZWhhdmlvciBkZXBlbmRpbmcgb24gdGhlIHByb3BlcnRpZXMgcHJlc2VudC4KClNvIEkgd291bGQg
bXVjaCBwcmVmZXIgaWYgdGhlIGRvY3VtZW50IGlzIG1vcmUgc3RyaWN0IHRoYW4gdGhlIGFjdHVh
bCAKaW1wbGVtZW50YXRpb24uCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
