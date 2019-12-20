Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EFC127B69
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 14:00:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiHr2-0002oA-6E; Fri, 20 Dec 2019 12:58:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TZvG=2K=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iiHr0-0002o5-N0
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 12:58:02 +0000
X-Inumbo-ID: 5ac03a5a-2328-11ea-9353-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ac03a5a-2328-11ea-9353-12813bfff9fa;
 Fri, 20 Dec 2019 12:58:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1F59DACFA;
 Fri, 20 Dec 2019 12:58:01 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20191219074209.17277-1-jgross@suse.com>
 <20191219074209.17277-2-jgross@suse.com>
 <eacd6fcf-fe27-8b5a-ace1-8c03737d5e00@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <6b4da073-665a-7096-22dd-807b2192b1b0@suse.com>
Date: Fri, 20 Dec 2019 13:57:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <eacd6fcf-fe27-8b5a-ace1-8c03737d5e00@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/2] xen: put more code under
 CONFIG_CRASH_DEBUG
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMTIuMTkgMTM6NTIsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMTkvMTIvMjAxOSAw
Nzo0MiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gU29tZSBjb2RlIGlzIG5vdCBuZWVkZWQgd2l0
aCBDT05GSUdfQ1JBU0hfREVCVUcsIHNvIG9ubHkgaW5jbHVkZSBpdCBpZgo+PiBDT05GSUdfQ1JB
U0hfREVCVUcgaXMgZGVmaW5lZC4KPiAKPiBzL3dpdGgvd2l0aG91dC8gPyBhbmQgSSBwcmVzdW1l
IHlvdSBhcmUgcmVmZXJyaW5nIHRvIGRlYnVnZ2VyX3RyYXBfZW50cnkoKSA/CgpZZXMgYW5kIHll
cy4KCgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
