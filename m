Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08080D7AB7
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 18:02:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKPEa-0008K9-PI; Tue, 15 Oct 2019 15:59:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dEpp=YI=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iKPEZ-0008K4-L8
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 15:59:39 +0000
X-Inumbo-ID: c9a96394-ef64-11e9-bbab-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id c9a96394-ef64-11e9-bbab-bc764e2007e4;
 Tue, 15 Oct 2019 15:59:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A67FE28;
 Tue, 15 Oct 2019 08:59:36 -0700 (PDT)
Received: from [10.37.13.17] (unknown [10.37.13.17])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D42ED3F68E;
 Tue, 15 Oct 2019 08:59:35 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1910142041270.6326@sstabellini-ThinkPad-T480s>
 <db570cdf-10ef-2e1a-b3c3-650f2e729315@arm.com>
 <alpine.DEB.2.21.1910150851050.6326@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <69a35487-097b-aa4a-87d2-7bc7b6ca2d80@arm.com>
Date: Tue, 15 Oct 2019 16:59:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1910150851050.6326@sstabellini-ThinkPad-T480s>
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

SGkgU3RlZmFubywKCk9uIDEwLzE1LzE5IDQ6NTEgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBUdWUsIDE1IE9jdCAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpIFN0ZWZh
bm8sCj4+Cj4+IE9uIDEwLzE1LzE5IDQ6NDkgQU0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToK
Pj4+IFRoZXJlIGlzIG5vIG5lZWQgdG8gaGF2ZSBhIHNwZWNpYWwgZG9tMCBjYXNlIHRvIGNvbnZl
cnQgdGhlIHBndGFibGUKPj4+IHZpcnR1YWwgYWRkcmVzcyBpbnRvIGEgcGh5c2ljYWwgYWRkcmVz
cy4gVGhlIHZpcnRfdG9fbWFkZHIgZnVuY3Rpb24gY2FuCj4+PiB3b3JrIGJvdGggaW4gdGhlIGRv
bTAgY2FzZSBhbmQgdGhlIGRvbVUgY2FzZS4KPj4+Cj4+PiBUaGlzIGlzIG1vcmUgdGhhbiBhIGNs
ZWFudXA6IHdoZW4gWGVuIGlzIGxvYWRlZCBhdCBhZGRyZXNzZXMgbG93ZXIgdGhhbgo+Pj4gMk1C
IG9uIGFybTMyIHBoeXNfb2Zmc2V0IG1pZ2h0IG5vdCBob2xkIHRoZSByaWdodCB2YWx1ZSBhbmQg
YmUgdW5hYmxlIHRvCj4+PiBwZXJmb3JtIGEgdmlydCB0byBwaHlzIGNvbnZlcnNpb24gcHJvcGVy
bHkuIFJlZHVjaW5nIHRoZSB1bm5lY2Vzc2FyeQo+Pj4gdXNhZ2Ugb2YgcGh5c19vZmZzZXQgaXMg
YSBnb29kIGlkZWEuCj4+Cj4+IEFzaWRlIHdoYXQgSnVlcmdlbiBzYWlkLCB0aGlzIHBhcmFncmFw
aCByYWlzZXMgdGhlIHF1ZXN0aW9uIHdoeSBwaHlzX29mZnNldCBpcwo+PiBhY3R1YWxseSBub3Qg
bW9kaWZpZWQgKG9yIGNvbXBsZXRlbHkgZHJvcHBlZCk/IEFmdGVyIGFsbCwgaWYgdGhlIHZhbHVl
IGhvbGRzCj4+IGlzIHdyb25nIHRoZW4gb3RoZXIgdXNlcnMgbWF5IGdldCB3cm9uZyB2YWx1ZSBh
cyB3ZWxsLi4uCj4gCj4gU2hvdWxkIEkgYWRkIHNvbWV0aGluZyBsaWtlICJ0aGlzIGlzIG5vdCBh
IGZpeCwgYnV0IHJlZHVjaW5nIHVubmVjZXNzYXJ5Wy4uLl0iID8KCmR1bXBfaHlwX3dhbGsoKSBp
cyBvbmx5IHVzZWQgaW4gdHdvIHBsYWNlczoKICAgICAtIHdoZW4gaGFyZHdhcmUgdHJhbnNsYXRp
b24gZmFpbGVkCiAgICAgLSBIeXBlcnZpc29yIGRhdGEgYWJvcnQKCkluIGJvdGggY2FzZSB3ZSB3
aWxsIHBhbmljIGFmdGVyd2FyZHMuIFNvIGhpdHRpbmcgdGhlIEJVR19PTigpIGlzIGp1c3QgCm9u
bHkgYSBtYXR0ZXIgb2YgbG9zaW5nIHBhZ2UtdGFibGUgaW5mb3JtYXRpb24uCgpTbyBJIHNlZSBs
aW1pdGVkIHJlYXNvbiB0byBzZWUgdGhpcyBwYXRjaCBhbG9uZSBpbiBYZW4gNC4xMy4gV2Ugc2hv
dWxkIAplaXRoZXIgY29tcGxldGVseSBmaXggcGh5c19vZmZzZXQgb3IgZG8gbm90aGluZy4KCkNo
ZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
