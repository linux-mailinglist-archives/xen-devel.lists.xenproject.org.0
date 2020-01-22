Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5871B144B91
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 07:02:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iu92d-0002AR-QS; Wed, 22 Jan 2020 05:59:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4Syo=3L=huawei.com=xuwei5@srs-us1.protection.inumbo.net>)
 id 1iu92c-0002AM-9y
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 05:59:02 +0000
X-Inumbo-ID: 474d9a4e-3cdc-11ea-bbe1-12813bfff9fa
Received: from huawei.com (unknown [45.249.212.35])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 474d9a4e-3cdc-11ea-bbe1-12813bfff9fa;
 Wed, 22 Jan 2020 05:58:58 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 1A838990C40A8CA4E4B5;
 Wed, 22 Jan 2020 13:58:57 +0800 (CST)
Received: from [127.0.0.1] (10.57.101.250) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Wed, 22 Jan 2020
 13:58:47 +0800
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
References: <5E26C935.9080107@hisilicon.com>
 <c15dab3d-3c25-4d14-506a-a6859a5dd99b@suse.com>
 <6a003f33-f5ff-c027-f09b-85b80c6accdb@xen.org>
From: Wei Xu <xuwei5@hisilicon.com>
Message-ID: <5E27E496.5080102@hisilicon.com>
Date: Wed, 22 Jan 2020 13:58:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <6a003f33-f5ff-c027-f09b-85b80c6accdb@xen.org>
X-Originating-IP: [10.57.101.250]
X-CFilter-Loop: Reflected
Subject: Re: [Xen-devel] [PATCH] arm/acpi: Add __acpi_unmap_table function
 for ARM
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Linuxarm <linuxarm@huawei.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>, xen-devel@lists.xenproject.org,
 Volodymyr_Babchuk@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVsaWVuLAoKT24gMjAyMC8xLzIxIDE5OjI1LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkg
SmFuLAo+IAo+IE9uIDIxLzAxLzIwMjAgMTE6MDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAy
MS4wMS4yMDIwIDEwOjQ5LCBXZWkgWHUgd3JvdGU6Cj4+PiBBZGQgX19hY3BpX3VubWFwX3RhYmxl
IGZ1bmN0aW9uIGZvciBBUk0gYW5kIGludm9rZSBpdCBhdCBhY3BpX29zX3VubWFwX21lbW9yeQo+
Pj4gdG8gbWFrZSBzdXJlIHRoZSByZWxhdGVkIGZpeG1hcCBoYXMgYmVlbiBjbGVhcmVkIGJlZm9y
ZSB1c2luZyBpdCBmb3IgYQo+Pj4gZGlmZmVyZW50IG1hcHBpbmcuCj4+Cj4+IEhvdyBjYW4gaXQg
cG9zc2libHkgYmUgdGhhdCB0aGlzIGlzIG5lZWRlZCBmb3IgQXJtIG9ubHk/Cj4gCj4gTGV0IG1l
IGdpdmUgc29tZSBiYWNrZ3JvdW5kIChJIHdpbGwgbGV0IFdlaSBkZWFsaW5nIHdpdGggdGhlIHJl
c3Qgb2YgdGhlIHBhdGNoZXMpLiBPbiBBcm0sIEkgbWFkZSB0aGUgZGVjaXNpb24gdG8gZm9yYmlk
IGEgbWFwcGluZyByZXBsYWNlbWVudCBpbiB0aGUgcGFnZS10YWJsZXMgY29kZS4gVGhpcyBtZWFu
cyB0aGF0IGlmIHlvdSB3YW50IHRvIHJlLXVzZSB0aGUgc2FtZSBmaXhtYXAsIHRoZW4geW91IG5l
ZWQgdG8gY2xlYXIgaXQgZmlyc3QuCj4gCj4gVGhlIHJlYXNvbiBmb3IgdGhlIHJlcXVpcmVtZW50
IGlzIHF1aXRlIHNpbXBsZS4gT24gQXJtLCB5b3UgbmVlZCB0byB1c2UgYSBicmVhay1iZWZvcmUt
bWFrZSBzZXF1ZW5jZSBhbnkgdGltZSB5b3UgcmVwbGFjZSBhIHZhbGlkIGVudHJ5IGJ5IGFub3Ro
ZXIgdmFsaWQgZW50cnkgKHRoZXJlIGlzIGEgY291cGxlIG9mIGNhc2Ugd2hlcmUgaXQgaXMgbm90
IG5lZWRlZCkuCj4gCj4gQXMgdGhlIHNlcXVlbmNlIG5hbWUgc3VnZ2VzdHMgaXQsIHdlIHdpbGwg
aGF2ZSBhIHNtYWxsIHdpbmRvdyB3aGVyZSB0aGUgdmlydHVhbCBhZGRyZXNzIHdpbGwgcG9pbnQg
dG8gbm90aGluZy4gVGhpcyBtYXkgcmVzdWx0IHRvIGFuIGFib3J0IGlmIGFub3RoZXIgQ1BVIGlz
IGFjY2Vzc2luZyB0aGUgYWRkcmVzcyBhdCB0aGUgc2FtZSB0aW1lLgo+IAo+IEluIHRoZSBmaXht
YXAgY2FzZSBiZWxvdywgdGhpcyBzaG91bGQgbmV2ZXIgaGFwcGVuLiBCdXQgbm93IGltYWdpbmUg
c2hhdHRlcmluZyBhIHN1cGVycGFnZS4uLgo+IAo+IFNvIHJhdGhlciB0aGFuIHRyeWluZyB0byBh
bGxvdyBpbiBzb21lIGNhc2VzIHRoZSBtb2RpZmljYXRpb24gb2YgYSBtYXBwaW5nLCB3ZSBqdXN0
IGZvcmJpZCBmb3IgZXZlcnl0aGluZyBidXQgcGVybWlzc2lvbiBjaGFuZ2VzLiBUaGlzIGlzIG11
Y2ggc2ltcGxlciB0byByZWFzb24gYW5kIGEgbXVjaCBzYW5lciBpbnRlcmZhY2UuCj4gCj4gU2lt
aWxhcmx5LCBJIHRoaW5rIHRoaXMgaXMgbXVjaCBzYW5lciB0byBjYWxsIGhhdmUgYSBjbGVhcl9m
aXhtYXAoKSBmb3IgZWFjaCBzZXRfZml4bWFwKCkuCgpUaGFua3MgdG8gZXhwbGFpbiEKCkJlc3Qg
UmVnYXJkcywKV2VpCgo+IAo+IENoZWVycywKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
