Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0219AAEAFE
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 15:00:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7fj1-0004zt-Pz; Tue, 10 Sep 2019 12:58:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4sB0=XF=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1i7fj0-0004zl-Cj
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 12:58:26 +0000
X-Inumbo-ID: ad037ee2-d3ca-11e9-ac1d-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ad037ee2-d3ca-11e9-ac1d-12813bfff9fa;
 Tue, 10 Sep 2019 12:58:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9BA3930860DE;
 Tue, 10 Sep 2019 12:58:24 +0000 (UTC)
Received: from [10.36.118.100] (unknown [10.36.118.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C328860BFB;
 Tue, 10 Sep 2019 12:58:20 +0000 (UTC)
To: Souptick Joarder <jrdr.linux@gmail.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>
References: <cover.1567889743.git.jrdr.linux@gmail.com>
 <20190909154253.q55olcm4cqwh7izd@box>
 <CAFqt6zZNHGdgaiiRvz-1AFe5g1652oyZpNQidK1V0B6weQHz0w@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <b8ceaa6f-a0b3-515f-4d11-c9a633eb95c4@redhat.com>
Date: Tue, 10 Sep 2019 14:58:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFqt6zZNHGdgaiiRvz-1AFe5g1652oyZpNQidK1V0B6weQHz0w@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Tue, 10 Sep 2019 12:58:24 +0000 (UTC)
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
Cc: sashal@kernel.org, Juergen Gross <jgross@suse.com>,
 linux-hyperv@vger.kernel.org, sstabellini@kernel.org, sthemmin@microsoft.com,
 pasha.tatashin@soleen.com, haiyangz@microsoft.com,
 Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org,
 richard.weiyang@gmail.com, Linux-MM <linux-mm@kvack.org>,
 Michal Hocko <mhocko@suse.com>, Qian Cai <cai@lca.pw>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 kys@microsoft.com, Andrew Morton <akpm@linux-foundation.org>,
 osalvador@suse.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDkuMTkgMTQ6NTYsIFNvdXB0aWNrIEpvYXJkZXIgd3JvdGU6Cj4gT24gTW9uLCBTZXAg
OSwgMjAxOSBhdCA5OjEyIFBNIEtpcmlsbCBBLiBTaHV0ZW1vdiA8a2lyaWxsQHNodXRlbW92Lm5h
bWU+IHdyb3RlOgo+Pgo+PiBPbiBTdW4sIFNlcCAwOCwgMjAxOSBhdCAwMzoxNzowMUFNICswNTMw
LCBTb3VwdGljayBKb2FyZGVyIHdyb3RlOgo+Pj4gX19vbmxpbmVfcGFnZV9zZXRfbGltaXRzKCkg
aXMgYSBkdW1teSBmdW5jdGlvbiBhbmQgYW4gZXh0cmEgY2FsbAo+Pj4gdG8gdGhpcyBjYW4gYmUg
YXZvaWRlZC4KPj4+Cj4+PiBBcyBib3RoIG9mIHRoZSBjYWxsZXJzIGFyZSBub3cgcmVtb3ZlZCwg
X19vbmxpbmVfcGFnZV9zZXRfbGltaXRzKCkKPj4+IGNhbiBiZSByZW1vdmVkIHBlcm1hbmVudGx5
Lgo+Pj4KPj4+IFNvdXB0aWNrIEpvYXJkZXIgKDMpOgo+Pj4gICBodl9iYWxsb246IEF2b2lkIGNh
bGxpbmcgZHVtbXkgZnVuY3Rpb24gX19vbmxpbmVfcGFnZV9zZXRfbGltaXRzKCkKPj4+ICAgeGVu
L2JhbGxvbjogQXZvaWQgY2FsbGluZyBkdW1teSBmdW5jdGlvbiBfX29ubGluZV9wYWdlX3NldF9s
aW1pdHMoKQo+Pj4gICBtbS9tZW1vcnlfaG90cGx1Zy5jOiBSZW1vdmUgX19vbmxpbmVfcGFnZV9z
ZXRfbGltaXRzKCkKPj4+Cj4+PiAgZHJpdmVycy9odi9odl9iYWxsb29uLmMgICAgICAgIHwgMSAt
Cj4+PiAgZHJpdmVycy94ZW4vYmFsbG9vbi5jICAgICAgICAgIHwgMSAtCj4+PiAgaW5jbHVkZS9s
aW51eC9tZW1vcnlfaG90cGx1Zy5oIHwgMSAtCj4+PiAgbW0vbWVtb3J5X2hvdHBsdWcuYyAgICAg
ICAgICAgIHwgNSAtLS0tLQo+Pj4gIDQgZmlsZXMgY2hhbmdlZCwgOCBkZWxldGlvbnMoLSkKPj4K
Pj4gRG8gd2UgcmVhbGx5IG5lZWQgMyBzZXBhcmF0ZSBwYXRjaGVzIHRvIHJlbW92ZSA4IGxpbmVz
IG9mIGNvZGU/Cj4gCj4gSSBwcmVmZXIgdG8gc3BsaXQgaW50byBzZXJpZXMgb2YgMyB3aGljaCBs
b29rcyBtb3JlIGNsZWFuLiBCdXQgSSBhbSBvawo+IHdpdGggb3RoZXIgb3B0aW9uLgo+IFdvdWxk
IHlvdSBsaWtlIHRvIG1lcmdlIGludG8gc2luZ2xlIG9uZSA/Cj4gCgpJZiB5b3UgaGF2ZSB0byBy
ZXNlbmQsIHlvdSBjb3VsZCBzcXVhc2ggdGhlbSBpbnRvIG9uZS4gSWYgbm90LCBJIHRoaW5rCnRo
aXMgaXMgb2theSAuLi4KCi0tIAoKVGhhbmtzLAoKRGF2aWQgLyBkaGlsZGVuYgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
