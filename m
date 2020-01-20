Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF8214348D
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 00:53:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itgp9-0003Xj-05; Mon, 20 Jan 2020 23:51:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A7zx=3J=amazon.com=prvs=2816e4733=elnikety@srs-us1.protection.inumbo.net>)
 id 1itgp8-0003Xe-6j
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 23:51:14 +0000
X-Inumbo-ID: b81dbffe-3bdf-11ea-9fd7-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b81dbffe-3bdf-11ea-9fd7-bc764e2007e4;
 Mon, 20 Jan 2020 23:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1579564265; x=1611100265;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=wGohlopq0b+XkSL4MQVaRT6mbHqpXTivpxdhj9+/7OU=;
 b=atwZrpZ9lKaj6dAYG4+X79dNNwp2QeyGR6O1YCotHEShRU6x5WrsGas2
 b713xaWVnZ0TIW4ZrBJoxT13c8Ne86I1Lf9huQHWGmT572/Zo7C+d6OFl
 1g6z054DCwYMHHCr7bGle0+QhzTKcS7KbtJJIv5M5TB3uLQEJkRmgxL6C M=;
IronPort-SDR: LM+HNdEvSTskXG+4sm04ozRp7OPCLLW32olI0arYqGnm1G/DUpWqrNDZzQZG//lHNEaLD9UPvP
 M1/xMAtrUbMw==
X-IronPort-AV: E=Sophos;i="5.70,343,1574121600"; d="scan'208";a="12424215"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-8cc5d68b.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 20 Jan 2020 23:51:03 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-8cc5d68b.us-west-2.amazon.com (Postfix) with ESMTPS
 id 9FE62A1E60; Mon, 20 Jan 2020 23:51:01 +0000 (UTC)
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 20 Jan 2020 23:51:01 +0000
Received: from a483e73f63b0.ant.amazon.com (10.43.162.7) by
 EX13D03EUA002.ant.amazon.com (10.43.165.166) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 20 Jan 2020 23:50:56 +0000
To: Jan Beulich <jbeulich@suse.com>
References: <cover.1576630344.git.elnikety@amazon.com>
 <068a32f917937baca179d7ff4c483ec1584defb4.1576630344.git.elnikety@amazon.com>
 <bde6c6be-3d32-fa8b-6ccf-6d48e6104663@suse.com>
 <ed080480-f5ab-59df-2c92-39d9e3b6c5ca@amazon.com>
 <07a1fdbb-22f4-3663-22fc-058558b264eb@suse.com>
 <b3de514c-dc21-7a34-b35f-a520dec843b0@amazon.com>
 <c26e9510-9a32-dfde-e786-f005ef66e019@suse.com>
From: Eslam Elnikety <elnikety@amazon.com>
Message-ID: <d93d5931-6b59-649b-c989-9263c3c9a913@amazon.com>
Date: Tue, 21 Jan 2020 00:50:51 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <c26e9510-9a32-dfde-e786-f005ef66e019@suse.com>
Content-Language: en-US
X-Originating-IP: [10.43.162.7]
X-ClientProxiedBy: EX13P01UWA002.ant.amazon.com (10.43.160.46) To
 EX13D03EUA002.ant.amazon.com (10.43.165.166)
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 1/4] x86/microcode: Improve documentation
 and parsing for ucode=
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <pdurrant@amazon.co.uk>,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDEuMjAgMDk6NDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDE3LjAxLjIwMjAgMjA6
MDYsIEVzbGFtIEVsbmlrZXR5IHdyb3RlOgo+PiBPbiAyMC4xMi4xOSAxMDo1MywgSmFuIEJldWxp
Y2ggd3JvdGU6Cj4+PiBPbiAxOS4xMi4yMDE5IDIyOjA4LCBFc2xhbSBFbG5pa2V0eSB3cm90ZToK
Pj4+PiBPbiAxOC4xMi4xOSAxMjo0OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDE4LjEy
LjIwMTkgMDI6MzIsIEVzbGFtIEVsbmlrZXR5IHdyb3RlOgo+Pj4+Pj4gRGVjb3VwbGUgdGhlIG1p
Y3JvY29kZSByZWZlcmVuY2luZyBtZWNoYW5pc20gd2hlbiB1c2luZyBHUlVCIHRvIHRoYXQKPj4+
Pj4+IHdoZW4gdXNpbmcgRUZJLiBUaGlzIGFsbG93cyB1cyB0byBhdm9pZCB0aGUgInVuc3BlY2lm
aWVkIGVmZmVjdCIgb2YKPj4+Pj4+IHVzaW5nIGA8aW50ZWdlcj4gfCBzY2FuYCBhbG9uZyB4ZW4u
ZWZpLgo+Pj4+Pgo+Pj4+PiBJIGd1ZXNzICJ1bnNwZWNpZmllZCBlZmZlY3QiIGluIHRoZSBkb2Mg
d2FzIHByZXR0eSBwb2ludGxlc3MgLSBzdWNoCj4+Pj4+IG9wdGlvbnMgaGF2ZSBiZWVuIGlnbm9y
ZWQgYmVmb3JlOyBpbiBmYWN0IC4uLgo+Pj4+Pgo+Pj4+Pj4gV2l0aCB0aGF0LCBYZW4gY2FuIGV4
cGxpY2l0bHkKPj4+Pj4+IGlnbm9yZSB0aG9zZSBuYW1lZCBvcHRpb25zIHdoZW4gdXNpbmcgRUZJ
Lgo+Pj4+Pgo+Pj4+PiAuLi4gSSBkb24ndCBzZWUgdGhpbmdzIGJlY29taW5nIGFueSBtb3JlIGV4
cGxpY2l0IChub3QgZXZlbiBwYXJzaW5nCj4+Pj4+IHRoZSBvcHRpb25zIHdhcyBxdWl0ZSBleHBs
aWNpdCB0byBtZSkuCj4+Pj4+Cj4+Pj4KPj4+PiBJIGFncmVlIHRoYXQgdGhvc2Ugb3B0aW9ucyBo
YXZlIGJlZW4gaWdub3JlZCBzbyBmYXIgaW4gdGhlIGNhc2Ugb2YgRUZJLgo+Pj4+IFRoZSBkb2N1
bWVudGF0aW9uIGNvbnRyYWRpY3RzIHRoYXQgaG93ZXZlci4gVGhlIGRvY3VtZW50YXRpb246Cj4+
Pj4gKiBzYXlzIDxpbnRlZ2VyPiBoYXMgdW5zcGVjaWZpZWQgZWZmZWN0Lgo+Pj4+ICogZG9lcyBu
b3QgbWVudGlvbiBhbnl0aGluZyBhYm91dCBzY2FuIGJlaW5nIGlnbm9yZWQuCj4+Pj4KPj4+PiBX
aXRoIHRoaXMgcGF0Y2gsIGl0IGlzIGV4cGxpY2l0IGluIGNvZGUgYW5kIGluIGRvY3VtZW50YXRp
b24gdGhhdCBib3RoCj4+Pj4gb3B0aW9ucyBhcmUgaWdub3JlZCBpbiBjYXNlIG9mIEVGSS4KPj4+
Cj4+PiBCdXQgaXNuJ3QgaXQgcmF0aGVyIHRoYXQgdWNvZGU9c2NhbiBjb3VsZCAoYW5kIGhlbmNl
IHBlcmhhcHMgc2hvdWxkKQo+Pj4gYWxzbyBoYXZlIGl0cyB2YWx1ZSBvbiBFRkk/Cj4+Pgo+Pgo+
PiBJIGRvIG5vdCBzZWUgInVjb2RlPXNjYW4iIGFwcGxpY2FibGUgaW4gYW55d2F5IGluIHRoZSBj
YXNlIG9mIEVGSS4gSW4KPj4gRUZJLCB0aGVyZSBhcmUgbm90ICJtb2R1bGVzIiB0byBzY2FuIHRo
cm91Z2gsIGJ1dCByYXRoZXIgdGhlIGVmaSBjb25maWcKPj4gcG9pbnRzIGV4YWN0bHkgdG8gdGhl
IG1pY3JvY29kZSBibG9iLgo+IAo+IFdoYXQgd291bGQgYmUgd3Jvbmcgd2l0aCB0aGUgRUZJIGNv
ZGUgdG8gYWxzbyBpbnNwZWN0IHdoYXRldmVyIGhhcyBiZWVuCj4gc3BlY2lmaWVkIHdpdGggcmFt
ZGlzaz0gaWYgdGhlcmUgd2FzIG5vIHVjb2RlPSA/Cj4gCj4gSmFuCj4gCgpJIHNlZSwgaW50ZXJl
c3RpbmcuIFRoaXMgc291bmRzIGxpa2UgYSBsZWdpdGltYXRlIHVzZSBjYXNlIGluZGVlZC4gSSAK
d29uZGVyLCB3b3VsZCBJIGJlIGJyZWFraW5nIGFueXRoaW5nIGlmIEkgc2ltcGx5IGFsbG93IHRo
ZSBleGlzdGluZyBjb2RlIAp0aGF0IGl0ZXJhdGVzIG92ZXIgbW9kdWxlcyB0byBraWNrIGluIHdo
ZW4gdWNvZGU9c2NhbiBpcnJlc3BlY3RpdmUgb2YgCkVGSSBvciBsZWdhY3kgYm9vdD8gQWxzbywg
aXQgc2VlbXMgdG8gbWUgdGhhdCB0aGUgdWNvZGU9IHNwZWNpZmllZCBieSAKZWZpLmNmZyB3b3Vs
ZCB0YWtlIHByZWNlZGVuY2Ugb3ZlciB0aGUgdWNvZGU9c2Nhbi4gRG8gbm90IHlvdSB0aGluaz8K
CkVzbGFtCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
