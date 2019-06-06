Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 778BB37802
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 17:32:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYuKx-0003XS-Lu; Thu, 06 Jun 2019 15:29:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2G1I=UF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hYuKw-0003XJ-5r
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 15:29:54 +0000
X-Inumbo-ID: edd7af52-886f-11e9-8dcd-b3047d0c7ac8
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id edd7af52-886f-11e9-8dcd-b3047d0c7ac8;
 Thu, 06 Jun 2019 15:29:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30BD1A78;
 Thu,  6 Jun 2019 08:29:52 -0700 (PDT)
Received: from [10.1.38.31] (unknown [10.1.38.31])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 86D663F690;
 Thu,  6 Jun 2019 08:29:51 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.1906031456390.14041@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <74c5df44-2be3-d193-2ede-ca0ef486062b@arm.com>
Date: Thu, 6 Jun 2019 16:29:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906031456390.14041@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 0/3] PDX fixes
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
Cc: JBeulich@suse.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA2LzMvMTkgMTE6MDEgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBUaGlz
IHNlcmllcyBpcyBhIHNtYWxsIGNvbGxlY3Rpb24gb2YgUERYIGZpeGVzLiBUaGV5IGFyZSB0ZWNo
bmljYWxseQo+IGluZGVwZW5kZW50IGJ1dCBkaXNjb3ZlcmVkIHRvZ2V0aGVyIHRyeWluZyB0byB1
bmRlcnN0YW5kIHRoZSBtZW1vcnkKPiB3YXN0ZSBjYXVzZWQgYnkgdGhlIGZyYW1ldGFibGUgYWxs
b2NhdGlvbiBvbiBYaWxpbnggWnlucU1QLgo+IAo+IENoZWVycywKPiAKPiBTdGVmYW5vCj4gCj4g
Cj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA4NDRhYTBhMTNkMzRlOWEzNDFh
ODM3NDExOWQyZWQ2N2Q0ZGNkNmJiOgo+IAo+ICAgIHNjaGVkX251bGw6IHN1cGVyZmljaWFsIGNs
ZWFuLXVwcyAoMjAxOS0wNi0wMyAxNzo1NjoyMCArMDIwMCkKPiAKPiBhcmUgYXZhaWxhYmxlIGlu
IHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPiAKPiAgICBodHRwOi8veGVuYml0cy54ZW5wcm9qZWN0
Lm9yZy9naXQtaHR0cC9wZW9wbGUvc3N0YWJlbGxpbmkveGVuLXVuc3RhYmxlLmdpdAo+IAo+IGZv
ciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBjOTJmNTg5ZTdjZjY2ZmM5YzNhZDhhODEyY2Ri
YzY5MjE0YTgxMmQxOgo+IAo+ICAgIHhlbi9hcm06IGZpeCBtYXNrIGNhbGN1bGF0aW9uIGluIHBk
eF9pbml0X21hc2sgKDIwMTktMDYtMDMgMTQ6NDI6MTAgLTA3MDApCj4gCj4gLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IFN0
ZWZhbm8gU3RhYmVsbGluaSAoMyk6Cj4gICAgICAgIHhlbi9hcm06IGZpeCBucl9wZHhzIGNhbGN1
bGF0aW9uCj4gICAgICAgIHhlbjogYWN0dWFsbHkgc2tpcCB0aGUgZmlyc3QgTUFYX09SREVSIGJp
dHMgaW4gcGZuX3BkeF9ob2xlX3NldHVwCgpJIGhhdmUgcHVzaGVkIHRoZSAyIHBhdGNoZXMuLi4K
Cj4gICAgICAgIHhlbi9hcm06IGZpeCBtYXNrIGNhbGN1bGF0aW9uIGluIHBkeF9pbml0X21hc2sK
Ci4uLiB0aGlzIG9uZSByZXF1aXJlIGlucHV0IGZyb20geW91LgoKQ2hlZXJzLAoKLS0gCkp1bGll
biBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
