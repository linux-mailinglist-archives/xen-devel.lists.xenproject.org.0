Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D773D26BE
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 11:53:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIV2K-000819-Mp; Thu, 10 Oct 2019 09:47:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=njQE=YD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iIV2I-000814-Bj
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 09:47:06 +0000
X-Inumbo-ID: e9b42493-eb42-11e9-97ff-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e9b42493-eb42-11e9-97ff-12813bfff9fa;
 Thu, 10 Oct 2019 09:47:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6A7F142F;
 Thu, 10 Oct 2019 02:47:03 -0700 (PDT)
Received: from [10.37.12.65] (unknown [10.37.12.65])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 55B4D3F68E;
 Thu, 10 Oct 2019 02:47:02 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20191010004211.31017-1-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <19ead95b-5b0c-bbfa-17b8-b5a2c2a3addd@arm.com>
Date: Thu, 10 Oct 2019 10:47:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
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
Cc: jgross@suse.com, xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDEwLzEwLzE5IDE6NDIgQU0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBtYWtlX2NwdXNfbm9kZSgpIGlzIHVzaW5nIGEgc3RhdGljIGJ1ZmZlciB0byBnZW5lcmF0
ZSB0aGUgRkRUIG5vZGUgbmFtZS4KPiBXaGlsZSBtcGRpcl9hZmYgaXMgYSA2NC1iaXQgaW50ZWdl
ciwgd2Ugb25seSBldmVyIHVzZSB0aGUgYml0cyBbMjM6MF0gYXMKPiBvbmx5IEFGRnswLCAxLCAy
fSBhcmUgc3VwcG9ydGVkIGZvciBub3cuCj4gCj4gVG8gYXZvaWQgYW55IHBvdGVudGlhbCBpc3N1
ZXMgaW4gdGhlIGZ1dHVyZSwgY2hlY2sgdGhhdCBtcGRpcl9hZmYgaGFzCj4gb25seSBiaXRzIFsy
MzowXSBzZXQuCj4gCj4gVGFrZSB0aGUgb3Bwb3J0dW5pdHkgdG8gcmVkdWNlIHRoZSBzaXplIG9m
IHRoZSBidWZmZXIuIEluZGVlZCwgb25seSA4Cj4gY2hhcmFjdGVycyBhcmUgbmVlZGVkIHRvIHBy
aW50IGEgMzItYml0IGhleGFkZWNpbWFsIG51bWJlci4gU28KPiBzaXplb2YoImNwdUAiKSArIDgg
KyAxIChmb3IgJ1wwJykgPSAxMyBjaGFyYWN0ZXJzIGlzIHN1ZmZpY2llbnQuCj4gCj4gRml4ZXM6
IGM4MWE3OTFkMzQgKHhlbi9hcm06IFNldCAncmVnJyBvZiBjcHUgbm9kZSBmb3IgZG9tMCB0byBt
YXRjaCBNUElEUidzIGFmZmluaXR5KQo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3RlZmFuby5zdGFiZWxsaW5pQHhpbGlueC5jb20+CgpSZXZpZXdlZC1ieTogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
