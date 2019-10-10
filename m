Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D946CD20AF
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 08:16:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIRi0-0004js-4l; Thu, 10 Oct 2019 06:13:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=E5Al=YD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iIRhy-0004jj-CR
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 06:13:54 +0000
X-Inumbo-ID: 2221d4e6-eb25-11e9-8c93-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2221d4e6-eb25-11e9-8c93-bc764e2007e4;
 Thu, 10 Oct 2019 06:13:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9C717AEF6;
 Thu, 10 Oct 2019 06:13:52 +0000 (UTC)
To: Stefano Stabellini <sstabellini@kernel.org>, julien.grall@arm.com
References: <20191010004211.31017-1-sstabellini@kernel.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <ea854698-e260-778f-a2a6-e8558095f56f@suse.com>
Date: Thu, 10 Oct 2019 08:13:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191010004211.31017-1-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4] xen/arm: domain_build: harden
 make_cpus_node()
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
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMTAuMTkgMDI6NDIsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBtYWtlX2NwdXNf
bm9kZSgpIGlzIHVzaW5nIGEgc3RhdGljIGJ1ZmZlciB0byBnZW5lcmF0ZSB0aGUgRkRUIG5vZGUg
bmFtZS4KPiBXaGlsZSBtcGRpcl9hZmYgaXMgYSA2NC1iaXQgaW50ZWdlciwgd2Ugb25seSBldmVy
IHVzZSB0aGUgYml0cyBbMjM6MF0gYXMKPiBvbmx5IEFGRnswLCAxLCAyfSBhcmUgc3VwcG9ydGVk
IGZvciBub3cuCj4gCj4gVG8gYXZvaWQgYW55IHBvdGVudGlhbCBpc3N1ZXMgaW4gdGhlIGZ1dHVy
ZSwgY2hlY2sgdGhhdCBtcGRpcl9hZmYgaGFzCj4gb25seSBiaXRzIFsyMzowXSBzZXQuCj4gCj4g
VGFrZSB0aGUgb3Bwb3J0dW5pdHkgdG8gcmVkdWNlIHRoZSBzaXplIG9mIHRoZSBidWZmZXIuIElu
ZGVlZCwgb25seSA4Cj4gY2hhcmFjdGVycyBhcmUgbmVlZGVkIHRvIHByaW50IGEgMzItYml0IGhl
eGFkZWNpbWFsIG51bWJlci4gU28KPiBzaXplb2YoImNwdUAiKSArIDggKyAxIChmb3IgJ1wwJykg
PSAxMyBjaGFyYWN0ZXJzIGlzIHN1ZmZpY2llbnQuCj4gCj4gRml4ZXM6IGM4MWE3OTFkMzQgKHhl
bi9hcm06IFNldCAncmVnJyBvZiBjcHUgbm9kZSBmb3IgZG9tMCB0byBtYXRjaCBNUElEUidzIGFm
ZmluaXR5KQo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFuby5zdGFi
ZWxsaW5pQHhpbGlueC5jb20+CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
