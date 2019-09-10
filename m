Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB5AAEE66
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 17:20:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7htH-0002Hu-3m; Tue, 10 Sep 2019 15:17:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IMu8=XF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i7htF-0002Hp-DE
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 15:17:09 +0000
X-Inumbo-ID: 0e1f64a8-d3de-11e9-ac1f-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 0e1f64a8-d3de-11e9-ac1f-12813bfff9fa;
 Tue, 10 Sep 2019 15:17:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E3C11000;
 Tue, 10 Sep 2019 08:17:08 -0700 (PDT)
Received: from [10.37.12.155] (unknown [10.37.12.155])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2BC543F71F;
 Tue, 10 Sep 2019 08:17:05 -0700 (PDT)
To: Lars Kurth <lars.kurth@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.8155a0a9d3da9781c83c5eaf5718c901934174f8.1567596460.git-series.lars.kurth@citrix.com>
 <0944333a4a0b503789d10afa63f8229bd0441290.1567596460.git-series.lars.kurth@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <1bf008d5-7623-2edf-c97d-91470910ec2f@arm.com>
Date: Tue, 10 Sep 2019 16:17:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0944333a4a0b503789d10afa63f8229bd0441290.1567596460.git-series.lars.kurth@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 1/3] Remove hardcoding from
 scripts/add_maintainers.pl
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgTGFycywKCk9uIDkvNC8xOSAxMjozMCBQTSwgTGFycyBLdXJ0aCB3cm90ZToKPiBJbnN0ZWFk
IG9mIHVzaW5nIGEgaGFyZGNvZGVkIGxvY2F0aW9uLCBpbmhlcml0IHRoZQo+IGxvY2F0aW9uIGZy
b20gJDAKPiAKPiBTaWduZWQtb2ZmLWJ5OiBMYXJzIEt1cnRoIDxsYXJzLmt1cnRoQGNpdHJpeC5j
b20+CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkNoZWVy
cywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
