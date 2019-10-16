Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BF5D87D0
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2019 07:13:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKbZg-0000Lh-Vb; Wed, 16 Oct 2019 05:10:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QYkk=YJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iKbZf-0000Lc-3m
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2019 05:10:15 +0000
X-Inumbo-ID: 3bbbe678-efd3-11e9-beca-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3bbbe678-efd3-11e9-beca-bc764e2007e4;
 Wed, 16 Oct 2019 05:10:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AB92DB360;
 Wed, 16 Oct 2019 05:10:12 +0000 (UTC)
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org
References: <20191015191821.11479-1-bigeasy@linutronix.de>
 <20191015191821.11479-23-bigeasy@linutronix.de>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <ad633573-7aac-c0e1-b6f5-ecc1ae0f55b4@suse.com>
Date: Wed, 16 Oct 2019 07:10:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191015191821.11479-23-bigeasy@linutronix.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 22/34] xen: Use CONFIG_PREEMPTION
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
Cc: xen-devel@lists.xenproject.org, tglx@linutronix.de,
 Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMTAuMTkgMjE6MTgsIFNlYmFzdGlhbiBBbmRyemVqIFNpZXdpb3Igd3JvdGU6Cj4gRnJv
bTogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+Cj4gCj4gQ09ORklHX1BSRUVN
UFRJT04gaXMgc2VsZWN0ZWQgYnkgQ09ORklHX1BSRUVNUFQgYW5kIGJ5IENPTkZJR19QUkVFTVBU
X1JULgo+IEJvdGggUFJFRU1QVCBhbmQgUFJFRU1QVF9SVCByZXF1aXJlIHRoZSBzYW1lIGZ1bmN0
aW9uYWxpdHkgd2hpY2ggdG9kYXkKPiBkZXBlbmRzIG9uIENPTkZJR19QUkVFTVBULgo+IAo+IFN3
aXRjaCB0aGUgcHJlZW1wdCBhbmFuZCB4ZW4tb3BzIGNvZGUgb3ZlciB0byB1c2UgQ09ORklHX1BS
RUVNUFRJT04uCj4gCj4gQ2M6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNs
ZS5jb20+Cj4gQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiBDYzogU3RlZmFu
byBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IENjOiB4ZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhA
bGludXRyb25peC5kZT4KPiBTaWduZWQtb2ZmLWJ5OiBTZWJhc3RpYW4gQW5kcnplaiBTaWV3aW9y
IDxiaWdlYXN5QGxpbnV0cm9uaXguZGU+CgpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
