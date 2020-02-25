Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0C616C325
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 15:00:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6aiK-00030H-DO; Tue, 25 Feb 2020 13:57:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=g8Eh=4N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j6aiJ-00030C-S5
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 13:57:31 +0000
X-Inumbo-ID: c33380b4-57d6-11ea-930e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c33380b4-57d6-11ea-930e-12813bfff9fa;
 Tue, 25 Feb 2020 13:57:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 103C6ADAB;
 Tue, 25 Feb 2020 13:57:29 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <20200225132558.26152-1-julien@xen.org>
 <109eaf78-6c13-665d-ef71-d8131d15ade1@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fb429b4a-0166-f389-94f4-aab4300435b1@suse.com>
Date: Tue, 25 Feb 2020 14:57:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <109eaf78-6c13-665d-ef71-d8131d15ade1@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/grant-table: Remove outdated warning in
 gnttab_grow_table()
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDIuMjAyMCAxNDoyOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyNS8wMi8yMDIw
IDEzOjI1LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IE9uZSBvZiB0aGUgd2FybmluZyBtZXNzYWdl
IGluIGdudHRhYl9ncm93X3RhYmxlKCkgcmVmZXJzIHRvIGEgZnVuY3Rpb24KPj4gd2FzIHJlbW92
ZWQgaW4gY29tbWl0IDY0MjVmOTFjNzIgInhlbi9nbnR0YWI6IEZvbGQgZ3JhbnRfdGFibGVfe2Ny
ZWF0ZSwKPj4gc2V0X2xpbWl0c30oKSBpbnRvIGdyYW50X3RhYmxlX2luaXQoKSIuCj4+Cj4+IFNp
bmNlIHRoZSBjb21taXQsIGd0LT5hY3RpdmUgd2lsbCBiZSBhbGxvY2F0ZWQgd2hpbGUgaW5pdGlh
bGl6aW5nIHRoZQo+PiBncmFudCB0YWJsZSBhdCBkb21haW4gY3JlYXRpb24uIFRoZXJlZm9yZSBn
dC1hY3RpdmUgd2lsbCBhbHdheXMgYmUKPj4gdmFsaWQuCj4+Cj4+IFJhdGhlciB0aGFuIHJlcGxh
Y2luZyB0aGUgd2FybmluZyBieSBhbm90aGVyIG9uZSwgd2UgY2FuIG5vdyBkb3duZ3JhZGUKPj4g
dGhlIGNoZWNrIHRvIGFuIEFTU0VSVCgpLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3Jh
bGwgPGpncmFsbEBhbWF6b24uY29tPgo+IAo+IFRCSCwgSSdkIGRyb3AgdGhlIGFzc2VydC4KCisx
IGZ3aXcKCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
