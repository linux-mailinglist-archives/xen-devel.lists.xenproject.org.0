Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C512DD7426
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 13:03:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKKXX-00084m-E3; Tue, 15 Oct 2019 10:58:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dEpp=YI=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iKKXV-00084f-FP
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 10:58:53 +0000
X-Inumbo-ID: c65b9b00-ef3a-11e9-bbab-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id c65b9b00-ef3a-11e9-bbab-bc764e2007e4;
 Tue, 15 Oct 2019 10:58:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7AD1728;
 Tue, 15 Oct 2019 03:58:52 -0700 (PDT)
Received: from [10.37.8.6] (unknown [10.37.8.6])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D41DF3F68E;
 Tue, 15 Oct 2019 03:58:51 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1910142041270.6326@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <db570cdf-10ef-2e1a-b3c3-650f2e729315@arm.com>
Date: Tue, 15 Oct 2019 11:58:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1910142041270.6326@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: remove special dom0 case in
 dump_hyp_walk
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
Cc: jgross@suse.com, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDEwLzE1LzE5IDQ6NDkgQU0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBUaGVyZSBpcyBubyBuZWVkIHRvIGhhdmUgYSBzcGVjaWFsIGRvbTAgY2FzZSB0byBjb252
ZXJ0IHRoZSBwZ3RhYmxlCj4gdmlydHVhbCBhZGRyZXNzIGludG8gYSBwaHlzaWNhbCBhZGRyZXNz
LiBUaGUgdmlydF90b19tYWRkciBmdW5jdGlvbiBjYW4KPiB3b3JrIGJvdGggaW4gdGhlIGRvbTAg
Y2FzZSBhbmQgdGhlIGRvbVUgY2FzZS4KPiAKPiBUaGlzIGlzIG1vcmUgdGhhbiBhIGNsZWFudXA6
IHdoZW4gWGVuIGlzIGxvYWRlZCBhdCBhZGRyZXNzZXMgbG93ZXIgdGhhbgo+IDJNQiBvbiBhcm0z
MiBwaHlzX29mZnNldCBtaWdodCBub3QgaG9sZCB0aGUgcmlnaHQgdmFsdWUgYW5kIGJlIHVuYWJs
ZSB0bwo+IHBlcmZvcm0gYSB2aXJ0IHRvIHBoeXMgY29udmVyc2lvbiBwcm9wZXJseS4gUmVkdWNp
bmcgdGhlIHVubmVjZXNzYXJ5Cj4gdXNhZ2Ugb2YgcGh5c19vZmZzZXQgaXMgYSBnb29kIGlkZWEu
CgpBc2lkZSB3aGF0IEp1ZXJnZW4gc2FpZCwgdGhpcyBwYXJhZ3JhcGggcmFpc2VzIHRoZSBxdWVz
dGlvbiB3aHkgCnBoeXNfb2Zmc2V0IGlzIGFjdHVhbGx5IG5vdCBtb2RpZmllZCAob3IgY29tcGxl
dGVseSBkcm9wcGVkKT8gQWZ0ZXIgYWxsLCAKaWYgdGhlIHZhbHVlIGhvbGRzIGlzIHdyb25nIHRo
ZW4gb3RoZXIgdXNlcnMgbWF5IGdldCB3cm9uZyB2YWx1ZSBhcyB3ZWxsLi4uCgpDaGVlcnMsCgot
LSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
