Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1F7AD47A
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 10:14:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7EmM-0001cj-Ib; Mon, 09 Sep 2019 08:12:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hpQm=XE=kernel.org=mhocko@srs-us1.protection.inumbo.net>)
 id 1i7EmK-0001cW-Op
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 08:12:04 +0000
X-Inumbo-ID: 81787fb2-d2d9-11e9-ac09-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81787fb2-d2d9-11e9-ac09-12813bfff9fa;
 Mon, 09 Sep 2019 08:12:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 310F0B6A0;
 Mon,  9 Sep 2019 08:12:02 +0000 (UTC)
Date: Mon, 9 Sep 2019 10:12:00 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Souptick Joarder <jrdr.linux@gmail.com>
Message-ID: <20190909081200.GB27159@dhcp22.suse.cz>
References: <cover.1567889743.git.jrdr.linux@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1567889743.git.jrdr.linux@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH 0/3] Remove __online_page_set_limits()
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
Cc: sashal@kernel.org, jgross@suse.com, linux-hyperv@vger.kernel.org,
 sstabellini@kernel.org, sthemmin@microsoft.com, pasha.tatashin@soleen.com,
 david@redhat.com, haiyangz@microsoft.com, dan.j.williams@intel.com,
 linux-kernel@vger.kernel.org, richard.weiyang@gmail.com, linux-mm@kvack.org,
 cai@lca.pw, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 kys@microsoft.com, akpm@linux-foundation.org, osalvador@suse.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU3VuIDA4LTA5LTE5IDAzOjE3OjAxLCBTb3VwdGljayBKb2FyZGVyIHdyb3RlOgo+IF9fb25s
aW5lX3BhZ2Vfc2V0X2xpbWl0cygpIGlzIGEgZHVtbXkgZnVuY3Rpb24gYW5kIGFuIGV4dHJhIGNh
bGwKPiB0byB0aGlzIGNhbiBiZSBhdm9pZGVkLgo+IAo+IEFzIGJvdGggb2YgdGhlIGNhbGxlcnMg
YXJlIG5vdyByZW1vdmVkLCBfX29ubGluZV9wYWdlX3NldF9saW1pdHMoKQo+IGNhbiBiZSByZW1v
dmVkIHBlcm1hbmVudGx5Lgo+IAo+IFNvdXB0aWNrIEpvYXJkZXIgKDMpOgo+ICAgaHZfYmFsbG9u
OiBBdm9pZCBjYWxsaW5nIGR1bW15IGZ1bmN0aW9uIF9fb25saW5lX3BhZ2Vfc2V0X2xpbWl0cygp
Cj4gICB4ZW4vYmFsbG9uOiBBdm9pZCBjYWxsaW5nIGR1bW15IGZ1bmN0aW9uIF9fb25saW5lX3Bh
Z2Vfc2V0X2xpbWl0cygpCj4gICBtbS9tZW1vcnlfaG90cGx1Zy5jOiBSZW1vdmUgX19vbmxpbmVf
cGFnZV9zZXRfbGltaXRzKCkKPiAKPiAgZHJpdmVycy9odi9odl9iYWxsb29uLmMgICAgICAgIHwg
MSAtCj4gIGRyaXZlcnMveGVuL2JhbGxvb24uYyAgICAgICAgICB8IDEgLQo+ICBpbmNsdWRlL2xp
bnV4L21lbW9yeV9ob3RwbHVnLmggfCAxIC0KPiAgbW0vbWVtb3J5X2hvdHBsdWcuYyAgICAgICAg
ICAgIHwgNSAtLS0tLQo+ICA0IGZpbGVzIGNoYW5nZWQsIDggZGVsZXRpb25zKC0pCgpUbyB0aGUg
d2hvbGUgc2VyaWVzCkFja2VkLWJ5OiBNaWNoYWwgSG9ja28gPG1ob2Nrb0BzdXNlLmNvbT4KClRo
YW5rcyEKLS0gCk1pY2hhbCBIb2NrbwpTVVNFIExhYnMKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
