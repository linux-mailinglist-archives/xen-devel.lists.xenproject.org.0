Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CDABD073
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 19:18:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCoPQ-0002QG-DM; Tue, 24 Sep 2019 17:15:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IFsf=XT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iCoPP-0002Q7-GU
 for xen-devel@lists.xen.org; Tue, 24 Sep 2019 17:15:27 +0000
X-Inumbo-ID: e629adfc-deee-11e9-9625-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id e629adfc-deee-11e9-9625-12813bfff9fa;
 Tue, 24 Sep 2019 17:15:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5E30142F;
 Tue, 24 Sep 2019 10:15:24 -0700 (PDT)
Received: from [10.37.10.95] (unknown [10.37.10.95])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B1B403F694;
 Tue, 24 Sep 2019 10:15:23 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1908201838370.20094@sstabellini-ThinkPad-T480s>
 <20190821035315.12812-5-sstabellini@kernel.org>
 <13e675a2-6628-ccab-9122-94ed9ea2a23d@arm.com>
 <alpine.DEB.2.21.1909240941360.24909@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <ecb07901-c374-c3c1-afcd-c19a7d82958c@arm.com>
Date: Tue, 24 Sep 2019 18:15:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1909240941360.24909@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 5/8] xen/arm: assign devices to boot
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

SGkgU3RlZmFubywKCk9uIDkvMjQvMTkgNTo1MiBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+IE9uIFdlZCwgMTEgU2VwIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSXQgYWxzbyBy
YWlzZXMgdGhlIHF1ZXN0aW9uIHdoYXQgc2hvdWxkIHdlIGRvIGlmIHRoZSBzaXplIHBhc3NlZCBp
biBub3QKPj4gcGFnZS1hbGlnbmVkPyBTaGFsbCB3ZSBqdXN0IGJsaW5kbHkgcm91bmQgdXAvZG93
bj8gU2hvdWxkIHdlIHdhcm4/Cj4+Cj4+IFRoaXMgd2FzIG5vdCBpbXBvcnRhbnQgZm9yIGRvbTAs
IGJ1dCBpcyBwb3RlbnRpYWxseSBjcml0aWNhbCBmb3IgZG9tVSBhcyB5b3UKPj4gbWF5IGhhcHBl
biB0byBpbmFkdmVydGVudGx5IHRvIGV4cG9ydCBtb3JlIHRoYW4geW91IGhvcGUgdG8gYSBndWVz
dC4KPiAKPiBBIHdhcm5pbmcgb3IgZXZlbiBhIHBhbmljIHdvdWxkIGJlIE9LIGJlY2F1c2UgaXQg
aXMgYSBzdGF0aWMgbWlzY29uZmlndXJhdGlvbi4KClllcyBhbmQgbm8sIHRoZXJlIGFyZSBwbGF0
Zm9ybXMgd2hlcmUgZGV2aWNlcyBhcmUgc2hhcmluZyB0aGUgc2FtZSBwYWdlcyAKKHNlZSB0aGUg
VUFSVCBvbiBTdW54aSBTb0MgZm9yIGluc3RhbmNlKS4gU28gdGhpcyBpcyBhIHZhbGlkIApjb25m
aWd1cmF0aW9uLCBidXQgd2UgZG9uJ3Qgc3VwcG9ydCBpdC4KClRoZSBwcm9ibGVtIGRvZXMgbm90
IGFyaXNlIGZvciBkb21VIGNyZWF0ZWQgYnkgdGhlIHRvb2xzdGFjayBiZWNhdXNlIHdlIApyZXF1
ZXN0IGEgZnJhbWUuIE5vdGUgdGhhdCBJIHdvdWxkIG5vdCB3YW50IHRvIHVzZSBhIGZyYW1lIGZv
ciBEb20wbGVzcyAKYXNzaWdubWVudCBhcyBJIHRoaW5rIHRoaXMgaXMgYnVnZ3kuCgpBbnl3YXks
IEkgd291bGQgcmF0aGVyIG5vdCBhZGQgYSBwYW5pYyBpbiB0aGlzIGNvZGUgYW5kIGxldCB0aGUg
dXBwZXIgCmxheWVyIGRlY2lkaW5nIHdoYXQgdG8gZG8uCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdy
YWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
