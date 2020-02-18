Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7031629CB
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 16:48:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j452l-0000MZ-Db; Tue, 18 Feb 2020 15:44:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=u3z7=4G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j452j-0000MP-4L
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 15:44:13 +0000
X-Inumbo-ID: 82748c7e-5265-11ea-ade5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82748c7e-5265-11ea-ade5-bc764e2007e4;
 Tue, 18 Feb 2020 15:44:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BC297AE9A;
 Tue, 18 Feb 2020 15:44:11 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b5d94bd8-9a39-c88b-4c3c-f89e655f3abf@suse.com>
Date: Tue, 18 Feb 2020 16:44:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH 0/5] libxl/PCI: reserved device memory
 adjustments
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hpbGUgcGxheWluZyB3aXRoIHRoaXMsIEkndmUgbm90aWNlZCBhIG51bWJlciBvZiBpc3N1ZXMs
CnNvbWUgYWN0dWFsIGJ1Z3MsIHNvbWUgbWVyZWx5IGNvc21ldGljIChhdCBsZWFzdCBhdCB0aGlz
IHBvaW50CmluIHRpbWUuIFRoaXMgaXMgdGhlIGNvbGxlY3Rpb24gb2YgYWRqdXN0bWVudHMgbWFk
ZSwgd2l0aCBidWcKZml4ZXMgZmlyc3QuCgoxOiBob25vciBtdWx0aXBsZSBwZXItZGV2aWNlIHJl
c2VydmVkIG1lbW9yeSByZWdpb25zCjI6IGVzdGFibGlzaCBwZXItZGV2aWNlIHJlc2VydmVkIG1l
bW9yeSBwb2xpY3kgZWFybGllcgozOiBtYWtlICJyZG09IiBwYXJzaW5nIGNvbXBseSB3aXRoIGRv
Y3VtZW50YXRpb24KNDogcGFzcyBjb3JyZWN0ICJob3RwbHVnIiBhcmd1bWVudCB0byBsaWJ4bF9f
ZGV2aWNlX3BjaV9zZXRkZWZhdWx0KCkKNTogYWxpZ24gcmVzZXJ2ZWQgZGV2aWNlIG1lbW9yeSBi
b3VuZGFyeSBmb3IgSEFQIGd1ZXN0cwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
