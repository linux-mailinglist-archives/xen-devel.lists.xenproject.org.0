Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2899312045F
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 12:51:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igosQ-0007ai-Gb; Mon, 16 Dec 2019 11:49:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=L813=2G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1igosP-0007aZ-QX
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 11:49:25 +0000
X-Inumbo-ID: 1b2a3f0c-1ffa-11ea-938c-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1b2a3f0c-1ffa-11ea-938c-12813bfff9fa;
 Mon, 16 Dec 2019 11:49:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 529E2ADF1;
 Mon, 16 Dec 2019 11:49:24 +0000 (UTC)
To: Jin Nan Wang <jnwang@suse.com>
References: <20191216114206.28803-1-jnwang@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <82d1e2e5-13e8-e4b2-563e-868c80ba79f5@suse.com>
Date: Mon, 16 Dec 2019 12:49:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191216114206.28803-1-jnwang@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] Xen missing prompt log when exec-sp=off
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMTIuMjAxOSAxMjo0MiwgSmluIE5hbiBXYW5nIHdyb3RlOgo+IEZpeCBhIGlzc3VlIHdo
ZW4gdXNlciBkaXNhYmxlIEVUUCBleGVjLXNwLCB4ZW4gbWlzc2VkIGEgcHJvbXB0Cj4gbG9nIGlu
IGRtZXNnLgoKVGhhbmtzIGZvciBmaXhpbmcgdGhlIHN0eWxlIGlzc3VlLCBidXQgc3VibWl0dGlu
ZyB2MyB3aXRob3V0CmFkZHJlc3NpbmcgdGhlIHF1ZXN0aW9uIG9uIHRoZSAid2h5IiBldGMgZ2l2
ZW4gb24gdjIgaXNuJ3QKb3Zlcmx5IGhlbHBmdWwuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
