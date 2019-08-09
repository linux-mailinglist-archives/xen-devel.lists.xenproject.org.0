Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCD9877E6
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 12:54:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw2Ux-0003fx-0c; Fri, 09 Aug 2019 10:51:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5OiB=WF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hw2Uw-0003fr-6k
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 10:51:50 +0000
X-Inumbo-ID: add6afb0-ba93-11e9-afa7-13a453cb0eb7
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id add6afb0-ba93-11e9-afa7-13a453cb0eb7;
 Fri, 09 Aug 2019 10:51:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E2C981596;
 Fri,  9 Aug 2019 03:51:44 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B5563F575;
 Fri,  9 Aug 2019 03:51:44 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1908061708420.2451@sstabellini-ThinkPad-T480s>
 <20190807002311.9906-2-sstabellini@kernel.org>
 <6f326378-dfdd-8570-fa10-b32c6dc93c3c@arm.com>
 <cdc05fd0-080f-3a1f-e08a-a767f9b54f20@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <dcad508a-f50e-5fdc-7664-4e7fcc20022a@arm.com>
Date: Fri, 9 Aug 2019 11:51:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <cdc05fd0-080f-3a1f-e08a-a767f9b54f20@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 2/6] xen: add a p2mt parameter to
 map_mmio_regions
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <stefanos@xilinx.com>,
 andrew.cooper3@citrix.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwOS8wOC8yMDE5IDExOjM3LCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAwOS4wOC4y
MDE5IDEyOjIzLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IE9uIDA3LzA4LzIwMTkgMDE6MjMsIFN0
ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+IEFkZCBhIHAybXQgcGFyYW1ldGVyIHRvIG1hcF9t
bWlvX3JlZ2lvbnMsIHBhc3MgcDJtX21taW9fZGlyZWN0X2RldiBvbgo+Pj4gQVJNIGFuZCBwMm1f
bW1pb19kaXJlY3Qgb24geDg2IC0tIG5vIGNoYW5nZXMgaW4gYmVoYXZpb3IuCj4+Pgo+Pj4gT24g
eDg2LCBpbnRyb2R1Y2UgYSBtYWNybyB0byBzdHJpcCBhd2F5IHRoZSBsYXN0IHBhcmFtZXRlciBh
bmQgcmVuYW1lCj4+PiB0aGUgZXhpc3RpbmcgaW1wbGVtZW50YXRpb24gb2YgbWFwX21taW9fcmVn
aW9ucyB0byBtYXBfbW1pb19yZWdpb24uCj4+PiBVc2UgbWFwX21taW9fcmVnaW9uIGluIHZwY2kg
YXMgaXQgaXMgeDg2LW9ubHkgdG9kYXkuCj4+Cj4+IFRoaXMgZmVlbHMgcXVpdGUgd3JvbmcuIFlv
dSBoYXZlIGEgInBsdXJhbCIgZnVuY3Rpb24gY2FsbGluZyBhICJzaW5ndWxhciIgCj4+IGZ1bmN0
aW9uLiBUaGlzIGlzIHVzdWFsbHkgdGhlIG90aGVyIHdheSBhcm91bmQuIFRoaXMgaXMgYWxzbyBx
dWl0ZSBkaWZmaWN1bHQgCj4+IGZvciBhIHVzZXIgdG8gdW5kZXJzdGFuZCB3aHkgdGhlICdzJyBp
cyBiZWVuIGRyb3BwZWQvYWRkZWQgKGRlcGVuZGluZyBob3cgeW91IAo+PiB2aWV3IGl0KSBiZWNh
dXNlIGluIGJvdGggY2FzZSB5b3Ugb25seSBkZWFsIHdpdGggYSBzaW5nbGUgcmVnaW9uLgo+IAo+
ICJIYXBweSIgaXMgdGhlIHdyb25nIHRlcm0uIEknZCB3ZWxjb21lIGFueSBiZXR0ZXIgc3VnZ2Vz
dGlvbi4gSQo+IHNpbXBseSBjb3VsZG4ndCB0aGluayBvZiBhIHNlbnNpYmxlIGFsdGVybmF0aXZl
LCBidXQgSSBkbyB3YW50Cj4gdG8gc2VlIHRoZSBsZWFkaW5nIHVuZGVyc2NvcmVzIGdvbmUgdGhh
dCB3ZXJlIHRoZXJlIG9yaWdpbmFsbHkuCgpXZSBhcmUgYWxyZWFkeSBtb2RpZnlpbmcgYWxsIHRo
ZSBjYWxsZXJzIGluIHRoaXMgc2VyaWVzLCBzbyBkb2luZyB0aGUgcmVuYW1pbmcgCnNob3VsZCBu
b3QgbWFrZSB0aGUgZGlmZiB3b3JzdC4KCkEgZmV3IG9mIHN1Z2dlc3Rpb246CiAgICAgMSkgbWFw
X21taW9fcmVnaW9uKCkgY2FsbGluZyBtYXBfbW1pb19yZWdpb25zKCkKICAgICAyKSBhcmNoX21h
cF9tbWlvX3JlZ2lvbigpIGNhbGxpbmcgbWFwX21taW9fcmVnaW9uKCkKICAgICAzKSBtYXBfbW1p
b19yZWdpb24oKSBjYWxsaW5nIGFyY2hfbWFwX21taW9fcmVnaW9uKCkKCkNoZWVycywKCi0tIApK
dWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
