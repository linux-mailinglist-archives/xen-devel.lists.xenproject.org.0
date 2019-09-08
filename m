Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A13F3ACB0E
	for <lists+xen-devel@lfdr.de>; Sun,  8 Sep 2019 07:13:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6pSE-0001wz-MP; Sun, 08 Sep 2019 05:09:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VG4i=XD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i6pSD-0001wu-S0
 for xen-devel@lists.xenproject.org; Sun, 08 Sep 2019 05:09:37 +0000
X-Inumbo-ID: d955b652-d1f6-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d955b652-d1f6-11e9-978d-bc764e2007e4;
 Sun, 08 Sep 2019 05:09:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2F8FBAC64;
 Sun,  8 Sep 2019 05:09:34 +0000 (UTC)
To: Souptick Joarder <jrdr.linux@gmail.com>, richard.weiyang@gmail.com,
 dan.j.williams@intel.com, sashal@kernel.org, sstabellini@kernel.org,
 cai@lca.pw, akpm@linux-foundation.org, haiyangz@microsoft.com,
 kys@microsoft.com, sthemmin@microsoft.com, boris.ostrovsky@oracle.com,
 david@redhat.com, pasha.tatashin@soleen.com, Michal Hocko <mhocko@suse.com>,
 Oscar Salvador <osalvador@suse.com>
References: <cover.1567889743.git.jrdr.linux@gmail.com>
 <cover.1567889743.git.jrdr.linux@gmail.com>
 <854db2cf8145d9635249c95584d9a91fd774a229.1567889743.git.jrdr.linux@gmail.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <6b666a74-da96-878a-9288-e0271428c0ee@suse.com>
Date: Sun, 8 Sep 2019 07:09:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <854db2cf8145d9635249c95584d9a91fd774a229.1567889743.git.jrdr.linux@gmail.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 2/3] xen/ballon: Avoid calling dummy
 function __online_page_set_limits()
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
Cc: linux-mm@kvack.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDkuMTkgMjM6NDcsIFNvdXB0aWNrIEpvYXJkZXIgd3JvdGU6Cj4gX19vbmxpbmVfcGFn
ZV9zZXRfbGltaXRzKCkgaXMgYSBkdW1teSBmdW5jdGlvbiBhbmQgYW4gZXh0cmEgY2FsbAo+IHRv
IHRoaXMgZnVuY3Rpb24gY2FuIGJlIGF2b2lkZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogU291cHRp
Y2sgSm9hcmRlciA8anJkci5saW51eEBnbWFpbC5jb20+CgpSZXZpZXdlZC1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
