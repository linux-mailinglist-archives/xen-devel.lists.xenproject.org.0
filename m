Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 955F59B6A6
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 21:09:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i1Esv-0003tM-DC; Fri, 23 Aug 2019 19:06:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RUCl=WT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i1Est-0003tH-NR
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2019 19:06:03 +0000
X-Inumbo-ID: 0af29e02-c5d9-11e9-8980-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 0af29e02-c5d9-11e9-8980-bc764e2007e4;
 Fri, 23 Aug 2019 19:05:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2911A337;
 Fri, 23 Aug 2019 12:05:59 -0700 (PDT)
Received: from [10.37.12.21] (unknown [10.37.12.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3845B3F246;
 Fri, 23 Aug 2019 12:05:58 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190823184826.14525-1-volodymyr_babchuk@epam.com>
 <20190823184826.14525-6-volodymyr_babchuk@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <d54ec451-7aa5-d289-8080-708e91d9e39d@arm.com>
Date: Fri, 23 Aug 2019 20:05:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823184826.14525-6-volodymyr_babchuk@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 5/5] xen/arm: optee: remove experimental
 status
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

SGksCgpPbiA4LzIzLzE5IDc6NDggUE0sIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgo+IEFzIGFs
bCBUT0RPcyBhbmQgcG90ZW50aWFsIHNlY3VyaXR5IGlzc3VlcyBhcmUgcmVzb2x2ZWQgbm93LAo+
IHJlbW92ZSBleHBlcmltZW50YWwgc3RhdHVzIGZyb20gT1AtVEVFIG1lZGlhdG9yLgoKTG9va2lu
ZyBhdCBTVVBQT1JULk1ELCBJIHRoaW5rIE9QLVRFRSB3aXRob3V0IHRoaXMgc2VyaWVzIHdvdWxk
IGJlIApjb25zaWRlcmVkIGFzICJFeHBlcmltZW50YWwiLgoKV2l0aCB0aGlzIHNlcmllcyBhcHBs
aWVkLCBJIHN0aWxsIHRoaW5rIHdlIHNob3VsZCBrZWVwIHRoZSBLY29uZmlnIApiZWhpbmQgRVhQ
RVJUIGJ1dCBtYXJrIGl0IGFzICJUZWNobmljYWwgUHJldmlldyIgZm9yIGF0IGxlYXN0IGEgcmVs
ZWFzZS4gClRoaXMgd291bGQgZW5jb3VyYWdlIHBlb3BsZSB0byB0ZXN0IGFuZCByZXBvcnQgYW55
IHBvdGVudGlhbCBpc3N1ZXMgd2l0aCAKT1AtVEVFLgoKV2UgY2FuIHJlLWRpc2N1c3MgYWJvdXQg
dGhlIHN0YXRlIGluIGEgZmV3IG1vbnRocyBmb3IgZnV0dXJlIHJlbGVhc2UuCgpCVFcsIFNVUFBP
UlQuTUQgc2hvdWxkIGJlIHVwZGF0ZWQgdG8gcmVmbGVjdCB0aGUgc3RhdGUgb2YgT1AtVEVFIGlu
IFhlbi4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
