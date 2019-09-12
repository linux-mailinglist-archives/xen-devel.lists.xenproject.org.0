Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E302B0F9E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 15:10:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8OqF-0003k7-GC; Thu, 12 Sep 2019 13:08:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ncEf=XH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8OqD-0003jz-Rb
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 13:08:53 +0000
X-Inumbo-ID: 77ba016d-d55e-11e9-9598-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 77ba016d-d55e-11e9-9598-12813bfff9fa;
 Thu, 12 Sep 2019 13:08:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1CCBBADCC;
 Thu, 12 Sep 2019 13:08:52 +0000 (UTC)
To: Paul Durrant <paul.durrant@citrix.com>
References: <20190912111744.40410-1-paul.durrant@citrix.com>
 <20190912111744.40410-7-paul.durrant@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9299428c-ce1f-f4d2-369f-02fc9027beb1@suse.com>
Date: Thu, 12 Sep 2019 15:08:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190912111744.40410-7-paul.durrant@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v9 6/6] introduce a 'passthrough'
 configuration option to xl.cfg...
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
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 ChristianLindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDkuMjAxOSAxMzoxNywgUGF1bCBEdXJyYW50IHdyb3RlOgo+IHY5Ogo+ICAtIEFkZGVk
IHRoZSBwYXNzdGhyb3VnaD0nZW5hYmxlZCcgb3B0aW9uIHRvIHhsCj4gIC0gT25lIGNvc21ldGlj
IGNoYW5nZSBpbiB4ZW4KPiAgLSBBc3N1bWUgSmFuJ3MgUi1iIHN0YW5kcyBzaW5jZSBub24tY29z
bWV0aWMgY2hhbmdlcyBhcmUgb25seSBpbiB0aGUKPiAgICB0b29sc3RhY2sKClNhbWUgaGVyZSAo
SSdtIGFmcmFpZCBJIGhhdmVuJ3QgYmVlbiBhYmxlIHRvIHNwb3QgdGhlIGNvc21ldGljCmNoYW5n
ZSkuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
