Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39730BEEE6
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:51:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQPX-0007bp-E2; Thu, 26 Sep 2019 09:50:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOM6=XV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDQPU-0007Xh-OP
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:50:04 +0000
X-Inumbo-ID: 037b7c6e-e043-11e9-b588-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 037b7c6e-e043-11e9-b588-bc764e2007e4;
 Thu, 26 Sep 2019 09:50:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9467A1000;
 Thu, 26 Sep 2019 02:50:03 -0700 (PDT)
Received: from [10.37.8.90] (unknown [10.37.8.90])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8207A3F67D;
 Thu, 26 Sep 2019 02:50:01 -0700 (PDT)
To: Rob Herring <robh@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <20190925215006.12056-1-robh@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e898c025-32a7-1d2c-3501-c99556f7cdd4@arm.com>
Date: Thu, 26 Sep 2019 10:49:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190925215006.12056-1-robh@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH] xen/gntdev: Stop abusing DT
 of_dma_configure API
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org, Robin Murphy <robin.murphy@arm.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUm9iLAoKCk9uIDkvMjUvMTkgMTA6NTAgUE0sIFJvYiBIZXJyaW5nIHdyb3RlOgo+IEFzIHRo
ZSBjb21tZW50IHNheXMsIHRoaXMgaXNuJ3QgYSBEVCBiYXNlZCBkZXZpY2UuIG9mX2RtYV9jb25m
aWd1cmUoKQo+IGlzIGdvaW5nIHRvIHN0b3AgYWxsb3dpbmcgYSBOVUxMIERUIG5vZGUsIHNvIHRo
aXMgbmVlZHMgdG8gYmUgZml4ZWQuCgpBbmQgdGhpcyBjYW4ndCB3b3JrIG9uIGFyY2ggbm90IHNl
bGVjdGluZyBDT05GSUdfT0YgYW5kIGNhbiBzZWxlY3QgCkNPTkZJR19YRU5fR1JBTlRfRE1BX0FM
TE9DLgoKV2UgYXJlIGx1Y2t5IGVub3VnaCBvbiB4ODYgYmVjYXVzZSwgQUZBSUNULCBhcmNoX3Nl
dHVwX2RtYV9vcHMgaXMganVzdCBhIApub3AuCgo+IAo+IE5vdCBzdXJlIGV4YWN0bHkgd2hhdCBz
ZXR1cCBiZXNpZGVzIGFyY2hfc2V0dXBfZG1hX29wcyBpcyBuZWVkZWQuLi4KCldlIHByb2JhYmx5
IHdhbnQgdG8gdXBkYXRlIGRtYV9tYXNrLCBjb2hlcmVudF9kbWFfbWFzayBhbmQgZG1hX3Bmbl9v
ZmZzZXQuCgpBbHNvLCB3aGlsZSBsb29rIGF0IG9mX2NvbmZpZ3VyZV9kbWEsIEkgbm90aWNlZCB0
aGF0IHdlIGNvbnNpZGVyIHRoZSBETUEgCndpbGwgbm90IGJlIGNvaGVyZW50IGZvciB0aGUgZ3Jh
bnQtdGFibGUuIE9sZWtzYW5kciwgZG8geW91IGtub3cgd2h5IAp0aGV5IGNhbid0IGJlIGNvaGVy
ZW50PwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
