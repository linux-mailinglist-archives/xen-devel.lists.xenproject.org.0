Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A41B63CBD1
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 14:35:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hafxH-0006Kj-DL; Tue, 11 Jun 2019 12:32:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SowN=UK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hafxF-0006Ka-JY
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 12:32:45 +0000
X-Inumbo-ID: 02b4a1a5-8c45-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 02b4a1a5-8c45-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 12:32:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5EB7344;
 Tue, 11 Jun 2019 05:32:43 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 321733F557;
 Tue, 11 Jun 2019 05:32:42 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, Jan Beulich <JBeulich@suse.com>
References: <1558721577-13958-1-git-send-email-andrii.anisov@gmail.com>
 <1558721577-13958-3-git-send-email-andrii.anisov@gmail.com>
 <5CFA734902000078002364C0@prv1-mh.provo.novell.com>
 <7a225ac4-f1e0-7cf8-b697-ea1f985f2dc8@arm.com>
 <5CFF6FEE0200007800236E11@prv1-mh.provo.novell.com>
 <92d534ef-082e-58d7-a4ff-c74cf7c23195@gmail.com>
 <b07c98a5-00cc-a51f-2eda-ba4038f0f667@arm.com>
 <4d747a77-408b-56b9-9404-60b3754ceccb@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <4af4bd1e-17c1-d128-05af-865c5b79cb88@arm.com>
Date: Tue, 11 Jun 2019 13:32:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <4d747a77-408b-56b9-9404-60b3754ceccb@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] xen: introduce
 VCPUOP_register_runstate_phys_memory_area hypercall
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxMS8wNi8yMDE5IDEzOjI2LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IAo+IAo+IE9uIDEx
LjA2LjE5IDE1OjEyLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBKdWxpZW4sIEknbSBub3Qgc3Vy
ZSBJIHVuZGVyc3RhbmQgaG93IHdvcmsgb24gKHA/KUNQVSBjb3VsZCBiZSBkZWxheWVkLiBXZSAK
Pj4+IGFyZSBoZXJlIHdpdGggaW50ZXJydXB0cyBlbmFibGVkLCBzbyBoZXJlIGd1ZXN0IHdvdWxk
IGp1c3Qgc3BlbmQgaGlzIG93biB2Y3B1IAo+Pj4gdGltZSBidWRnZXQuIAo+Pgo+PiBYZW4gb25s
eSBzdXBwb3J0cyBvbmx5IHZvbHVudGFyeSBwcmVlbXB0aW9uLgo+IAo+IE9oLCByZWFsbHk/IExl
dCBtZSBsb29rIGludG8gaXQgYSBiaXQgY2xvc2VyLgoKRGlkIHlvdSBleHBlY3QgWGVuIHRvIGJl
IGZ1bGx5IHByZWVtcHRpYmxlPwoKVGhlIGZ1bmN0aW9uIHRvIGRvIHRoZSBzY2hlZHVsaW5nIGlz
IHNjaGVkdWxlKCkuIFRoaXMgaXMgZWl0aGVyIGNhbGwgZnJvbSBhIApzb2Z0aXJxIG9yIGRpcmVj
dGx5IGluIGEgZmV3IHBsYWNlcyAoZS5nIHdhaXQoKSkuCgpUaGUgb25seSBwbGFjZSBpbiB0aGlz
IHBhdGggd2hlcmUgZG9fc29mdGlycSgpIHdpbGwgYmUgY2FsbGVkIGlzIG9uIHJldHVybiB0byAK
dGhlIGd1ZXN0IChzZWUgbGVhdmVfaHlwZXJ2aXNvcl90YWlsKS4KCkNoZWVycywKCi0tIApKdWxp
ZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
