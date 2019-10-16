Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A799D937A
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2019 16:16:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKk2D-0002fx-B5; Wed, 16 Oct 2019 14:12:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GHfa=YJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iKk2B-0002fs-Sp
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2019 14:12:15 +0000
X-Inumbo-ID: f3fdcc60-f01e-11e9-beca-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id f3fdcc60-f01e-11e9-beca-bc764e2007e4;
 Wed, 16 Oct 2019 14:12:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B3AA142F;
 Wed, 16 Oct 2019 07:12:14 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F75D3F68E;
 Wed, 16 Oct 2019 07:12:12 -0700 (PDT)
To: Oleksandr Grytsov <al1img@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20191010141231.25363-1-al1img@gmail.com>
 <23968.40555.917945.129929@mariner.uk.xensource.com>
 <8413c89d-3495-6407-f1a9-6eb9aff24e47@arm.com>
 <alpine.DEB.2.21.1910111017050.6326@sstabellini-ThinkPad-T480s>
 <CACvf2oWENPf27aqQdve6StQOBv_TitKF_HSxhqFTcfJtmkL6eg@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <950c69d8-8f0c-b3f7-11da-9accef793c37@arm.com>
Date: Wed, 16 Oct 2019 15:12:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACvf2oWENPf27aqQdve6StQOBv_TitKF_HSxhqFTcfJtmkL6eg@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v1] libxl: Add DTB compatible list to
 config file
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
Cc: Iurii Konovalenko <iurii.konovalenko@globallogic.com>,
 "wl@xen.org" <wl@xen.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Oleksandr Grytsov <oleksandr_grytsov@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgT2xla3NhbmRyLAoKT24gMTYvMTAvMjAxOSAxNTowNCwgT2xla3NhbmRyIEdyeXRzb3Ygd3Jv
dGU6Cj4gT24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgODoyMSBQTSBTdGVmYW5vIFN0YWJlbGxpbmkK
PiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4+Cj4+IE9uIEZyaSwgMTEgT2N0IDIw
MTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+IEhpLAo+Pj4KPj4+IE9uIDExLzEwLzIwMTkgMTY6
MjMsIElhbiBKYWNrc29uIHdyb3RlOgo+Pj4+IE9sZWtzYW5kciBHcnl0c292IHdyaXRlcyAoIltQ
QVRDSCB2MV0gbGlieGw6IEFkZCBEVEIgY29tcGF0aWJsZSBsaXN0IHRvCj4+Pj4gY29uZmlnIGZp
bGUiKToKPj4+Pj4gRnJvbTogT2xla3NhbmRyIEdyeXRzb3YgPG9sZWtzYW5kcl9ncnl0c292QGVw
YW0uY29tPgo+Pj4+Pgo+Pj4+PiBTb21lIHBsYXRmb3JtcyBuZWVkIG1vcmUgY29tcGF0aWJsZSBw
cm9wZXJ0eSB2YWx1ZXMgaW4gZGV2aWNlCj4+Pj4+IHRyZWUgcm9vdCBub2RlIGluIGFkZGl0aW9u
IHRvICJ4ZW4seGVudm0tJWQuJWQiIGFuZCAieGVuLHhlbnZtIgo+Pj4+PiB2YWx1ZXMgdGhhdCBh
cmUgZ2l2ZW4gYnkgWGVuIGJ5IGRlZmF1bHQuCj4+Pgo+Pj4gSSBhbSBwcmV0dHkgc3VyZSBJIGhh
dmUgc2VlbiB0aGlzIHBhdGNoIGEgZmV3IHllYXJzIGFnbywgYnV0IEkgY2FuJ3QgZmluZCBpdAo+
Pj4gaW4gbXkgaW5ib3guIFdoYXQgaXMgdGhlIGV4YWN0IHByb2JsZW0gaGVyZT8KPj4+Cj4+Pj4+
IFNwZWNpZnkgaW4gZG9tYWluIGNvbmZpZ3VyYXRpb24gZmlsZSB3aGljaCB2YWx1ZXMgc2hvdWxk
IGJlIGFkZGVkCj4+Pj4+IGJ5IHByb3ZpZGluZyAiZHRiX2NvbXBhdGlibGUiIGxpc3Qgb2Ygc3Ry
aW5ncyBzZXBhcmF0ZWQgYnkgY29tYXMuCj4+Pj4KPj4+PiBIaSwgdGhhbmtzLgo+Pj4+Cj4+Pj4g
SSBkb24ndCBoYXZlIGFuIG9waW5pb24gYWJvdXQgdGhlIHByaW5jaXBsZSBvZiB0aGlzIGFuZCB3
b3VsZCBsaWtlIHRvCj4+Pj4gaGVhciBmcm9tIEFSTSBmb2xrcyBhYm91dCB0aGF0Lgo+Pj4+Cj4+
Pj4gQWxzbywgU3RlZmFubywgSnVsaWVuOiBzaG91bGQgd2UgYmUgYXNraW5nIGZvciBhIGZyZWV6
ZSBleGNlcHRpb24gZm9yCj4+Pj4gdGhpcyBmb3IgNC4xMyA/Cj4+Pgo+Pj4gSSBkb24ndCBoYXZl
IGVub3VnaCBjb250ZXh0IHRvIHVuZGVyc3RhbmQgdGhlIGV4YWN0IGlzc3VlIGhlIGlzIHRyeWlu
ZyB0bwo+Pj4gc29sdmUuCj4+Cj4+IFNhbWUgaGVyZS4gSXMgdGhpcyBwYXRjaCBuZWVkZWQgYmVj
YXVzZSBvbiBzb21lIHBsYXRmb3JtIHRoZSBPUyBjaGVja3MKPj4gZm9yIHRoZSBwbGF0Zm9ybSAi
bW9kZWwiIChhbHNvIGtub3duIGFzICJtYWNoaW5lIG5hbWUiKSBvbiBkZXZpY2UgdHJlZQo+PiBi
ZWZvcmUgY29udGludWluZyBvciB0byB0cmlnZ2VyIGEgZGlmZmVyZW5jZSBiZWhhdmlvcj8KPiAK
PiBZZXMsIGV4YWN0bHkuCj4gCj4gSSB3aWxsIHJlZG8gdGhlIHBhdGNoIHdpdGggSWFuJ3MgY29t
bWVudHMgaWYgaXQgaXMgb2sgaW4gZ2VuZXJhbC4KCkJ5IHNwZWNpZnlpbmcgYSBkaWZmZXJlbnQg
Y29tcGF0aWJsZSAobGV0IHNheSAicmVuZXNhcyxyOGE3NzRhMSIpLCB0aGVuIHlvdSAKY2xhaW0g
dGhhdCB5b3VyIHZpcnR1YWwgbWFjaGluZSBpcyBleGFjdGx5IHRoZSBzYW1lIGFzIHRoYXQgYm9h
cmQuCgpUaGlzIG1lYW5zLCB0aGUgT1MgaXMgZnJlZSB0byBhc3N1bWUgdGhhdCB0aGUgbWVtb3J5
IGxheW91dCBhbmQgYWxsIHRoZSBkZXZpY2VzIAphcmUgZXhhY3RseSB0aGUgc2FtZS4gVGhpcyBp
cyBkZWZpbml0ZWx5IG5vdCB0cnVlIGFzIHRoZSB2aXJ0dWFsIG1hY2hpbmUgd2UgCmV4cG9zZSBp
cyBzcGVjaWZpYyB0byBYZW4uCgpTbyBJIGRvbid0IHRoaW5rIHRoaXMgaXMgdGhlIGNvcnJlY3Qg
YXBwcm9hY2ggaGVyZS4gQ2FuIHlvdSBwcm92aWRlIGEgcmVhbC1saWZlIApleGFtcGxlIG9uIHdo
eSB5b3UgbmVlZCB0aGlzPwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
