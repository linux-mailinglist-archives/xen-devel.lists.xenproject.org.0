Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 081D3C3030
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 11:28:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFEPd-0005hm-IP; Tue, 01 Oct 2019 09:25:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T/b7=X2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFEPc-0005hZ-BC
 for xen-devel@lists.xen.org; Tue, 01 Oct 2019 09:25:40 +0000
X-Inumbo-ID: 6ea55bd4-e42d-11e9-96f7-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 6ea55bd4-e42d-11e9-96f7-12813bfff9fa;
 Tue, 01 Oct 2019 09:25:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E11631000;
 Tue,  1 Oct 2019 02:25:38 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1761C3F739;
 Tue,  1 Oct 2019 02:25:37 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1909261608430.2594@sstabellini-ThinkPad-T480s>
 <20190926231144.16297-5-sstabellini@kernel.org>
 <d3ef8cc1-6fe7-bdee-690e-c59b362bbc8f@arm.com>
 <alpine.DEB.2.21.1909301410210.2594@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <8bcae79e-cf37-3d7f-430b-b04ee1466277@arm.com>
Date: Tue, 1 Oct 2019 10:25:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1909301410210.2594@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 5/8] xen/arm: assign devices to boot
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

SGkgU3RlZmFubywKCk9uIDMwLzA5LzIwMTkgMjI6MTIsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBTdW4sIDI5IFNlcCAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IE9uIDkvMjcv
MTkgMTI6MTEgQU0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+ICsgICAgICAgIHJldHVy
biAwOwo+Pj4gKyAgICB9Cj4+PiArICAgIC8qCj4+PiArICAgICAqIHhlbixwYXRoIHNwZWNpZmll
cyB0aGUgY29ycmVzcG9uZGluZyBub2RlIGluIHRoZSBob3N0IERULgo+Pj4gKyAgICAgKiBCb3Ro
IGludGVycnVwdCBtYXBwaW5ncyBhbmQgSU9NTVUgc2V0dGluZ3MgYXJlIGJhc2VkIG9uIGl0LAo+
Pj4gKyAgICAgKiBhcyB0aGV5IGFyZSBkb25lIGJhc2VkIG9uIHRoZSBjb3JyZXNwb25kaW5nIGhv
c3QgRFQgbm9kZS4KPj4+ICsgICAgICovCj4+PiArICAgIGVsc2UgaWYgKCBkdF9wcm9wX2NtcCgi
eGVuLHBhdGgiLCBuYW1lKSA9PSAwICkKPj4+ICsgICAgewo+Pj4gKyAgICAgICAgbm9kZSA9IGR0
X2ZpbmRfbm9kZV9ieV9wYXRoKHByb3AtPmRhdGEpOwo+Pj4gKyAgICAgICAgaWYgKCBub2RlID09
IE5VTEwgKQo+Pj4gKyAgICAgICAgewo+Pj4gKyAgICAgICAgICAgIHByaW50ayhYRU5MT0dfRVJS
ICJDb3VsZG4ndCBmaW5kIG5vZGUgJXMgaW4gaG9zdF9kdCFcbiIsCj4+PiArICAgICAgICAgICAg
ICAgICAgIChjaGFyICopcHJvcC0+ZGF0YSk7Cj4+PiArICAgICAgICAgICAgcmV0dXJuIC1FSU5W
QUw7Cj4+PiArICAgICAgICB9Cj4+PiArCj4+PiArICAgICAgICByZXMgPSBpb21tdV9hc3NpZ25f
ZHRfZGV2aWNlKGtpbmZvLT5kLCBub2RlKTsKPj4+ICsgICAgICAgIGlmICggcmVzIDwgMCApCj4+
PiArICAgICAgICAgICAgcmV0dXJuIHJlczsgPiArCj4+PiArICAgICAgICByZXMgPSBoYW5kbGVf
ZGV2aWNlX2ludGVycnVwdHMoa2luZm8tPmQsIG5vZGUsIHRydWUpOwo+Pj4gKyAgICAgICAgaWYg
KCByZXMgPCAwICkKPj4+ICsgICAgICAgICAgICByZXR1cm4gcmVzOwo+Pgo+PiBTYW1lIGhlcmUu
Cj4gCj4gWW91IGFyZSB0YWxraW5nIGFib3V0IHJldHVybiB2YWx1ZXMsIHJpZ2h0PyBOb3QgY29k
ZSBzdHlsZSB0byBiZSBmaXhlZAo+IC0tIEkgY2Fubm90IHNlZSBhbnl0aGluZyB3cm9uZyB3aXRo
IHRoZSBjb2RlIHN0eWxlLgoKSSBob25lc3RseSBjYW4ndCByZW1lbWJlciB3aHkgSSB3cm90ZSAi
c2FtZSBoZXJlIi4gUGxlYXNlIGlnbm9yZSB0aGlzIG9uZSBhbmQgSSAKd2lsbCBoYXZlIGEgbG9v
ayBhdCB0aGUgbmV4dCB2ZXJzaW9uLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
