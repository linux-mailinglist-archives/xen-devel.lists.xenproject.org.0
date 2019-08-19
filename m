Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B14894C2F
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 19:58:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzltB-0000rx-Hs; Mon, 19 Aug 2019 17:56:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UkZp=WP=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hzltA-0000rs-7O
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 17:56:16 +0000
X-Inumbo-ID: a14bd2d8-c2aa-11e9-8bf0-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a14bd2d8-c2aa-11e9-8bf0-12813bfff9fa;
 Mon, 19 Aug 2019 17:56:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CE87360;
 Mon, 19 Aug 2019 10:56:11 -0700 (PDT)
Received: from [10.37.12.162] (unknown [10.37.12.162])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 84F7C3F246;
 Mon, 19 Aug 2019 10:56:10 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.1908191011060.20094@sstabellini-ThinkPad-T480s>
 <20190819174338.10466-1-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <03a3fd12-e4d1-8331-04d9-58a15a8c3284@arm.com>
Date: Mon, 19 Aug 2019 18:56:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190819174338.10466-1-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 1/8] xen/arm: pass node to
 device_tree_for_each_node
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiA4LzE5LzE5IDY6NDMgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBAQCAtODUs
MjAgKzg2LDIyIEBAIHN0YXRpYyB1MzIgX19pbml0IGRldmljZV90cmVlX2dldF91MzIoY29uc3Qg
dm9pZCAqZmR0LCBpbnQgbm9kZSwKPiAgICAqIFJldHVybnMgMCBpZiBhbGwgbm9kZXMgd2VyZSBp
dGVyYXRlZCBvdmVyIHN1Y2Nlc3NmdWxseS4gIElmIEBmdW5jCj4gICAgKiByZXR1cm5zIGEgdmFs
dWUgZGlmZmVyZW50IGZyb20gMCwgdGhhdCB2YWx1ZSBpcyByZXR1cm5lZCBpbW1lZGlhdGVseS4K
PiAgICAqLwo+IC1pbnQgX19pbml0IGRldmljZV90cmVlX2Zvcl9lYWNoX25vZGUoY29uc3Qgdm9p
ZCAqZmR0LAo+ICtpbnQgX19pbml0IGRldmljZV90cmVlX2Zvcl9lYWNoX25vZGUoY29uc3Qgdm9p
ZCAqZmR0LCBpbnQgbm9kZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBkZXZpY2VfdHJlZV9ub2RlX2Z1bmMgZnVuYywKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB2b2lkICpkYXRhKQo+ICAgewo+IC0gICAgaW50IG5vZGU7Cj4gLSAgICBp
bnQgZGVwdGg7Cj4gKyAgICAvKgo+ICsgICAgICogV2Ugb25seSBjYXJlIGFib3V0IHJlbGF0aXZl
IGRlcHRoIGluY3JlbWVudHMsIGFzc3VtZSBkZXB0aCBvZgo+ICsgICAgICogbm9kZSBpcyAwIGZv
ciBzaW1wbGljaXR5Lgo+ICsgICAgICovCj4gKyAgICBpbnQgZGVwdGggPSAwOwo+ICsgICAgY29u
c3QgaW50IG1pbl9kZXB0aCA9IGRlcHRoOwoKVGhlcmUgaXMgbm8gbmVlZCB0byBkZWZpbmUgbWlu
X2RlcHRoIGhlcmUuIFdpdGggbWluX2RlcHRoIGRyb3BwZWQ6CgpBY2tlZC1ieTogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
