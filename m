Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AE2BDAC9
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 11:17:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD3NL-0002sl-TA; Wed, 25 Sep 2019 09:14:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KYcU=XU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iD3NJ-0002ry-PL
 for xen-devel@lists.xen.org; Wed, 25 Sep 2019 09:14:17 +0000
X-Inumbo-ID: d947f2b6-df74-11e9-962d-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id d947f2b6-df74-11e9-962d-12813bfff9fa;
 Wed, 25 Sep 2019 09:14:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4345B1570;
 Wed, 25 Sep 2019 02:14:16 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 747603F694;
 Wed, 25 Sep 2019 02:14:15 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1908201838370.20094@sstabellini-ThinkPad-T480s>
 <20190821035315.12812-8-sstabellini@kernel.org>
 <1879bd44-0107-5799-cacc-6cb2ee31b8b9@arm.com>
 <alpine.DEB.2.21.1909241105071.24909@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <42927fa9-81ef-37ba-6de1-175e4414f5e9@arm.com>
Date: Wed, 25 Sep 2019 10:14:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1909241105071.24909@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 8/8] xen/arm: add dom0-less device
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

CgpPbiAyNC8wOS8yMDE5IDE5OjA3LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24gV2Vk
LCAxMSBTZXAgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBPbiA4LzIxLzE5IDQ6NTMgQU0s
IFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBJIGNhbiByZXBsYWNlIDB4WCBieSBYIGZvciAj
YWRkcmVzcy1jZWxscyBhbmQgI3NpemUtY2VsbHMgZXZlcnl3aGVyZSBpbgo+IHRoZSBleGFtcGxl
LiBJIGRvbid0IHRoaW5rIGl0IG1ha2VzIHNlbnNlIHRvIGRvIGl0IGZvciByZWcgYW5kCj4gaW50
ZXJydXB0cyBwcm9wZXJ0aWVzPwoKSSBhZ3JlZSBpdCBkb2VzIG5vdCBtYWtlIHNlbnNlIGZvciB0
aGUgcHJvcGVydHkgcmVnLiBIb3dldmVyLCBmb3IgImludGVycnVwdHMiIApwcm9wZXJ0eSBpdCB3
b3VsZCBhcyBpdCBtYWtlcyBlYXNpZXIgdG8gZmluZCBvdXQgdGhlIGludGVycnVwdCBudW1iZXIu
IExvb2tpbmcgCmF0IGV4YW1wbGUgaW4gdGhlIGJpbmRpbmdzIHRoZXkgYWN0dWFsbHkgdXNlIGRl
Y2ltYWwgbnVtYmVyIGZvciB0aGUgZmlyc3QgdHdvIApjZWxscyBhbmQgdGhlbiBhbiBoZXhhZGVj
aW1hbDoKCiAgICAgICBpbnRlcnJ1cHRzID0gPDEgOCAweGYwND47CgpDaGVlcnMsCgotLSAKSnVs
aWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
