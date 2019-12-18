Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9376124295
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 10:17:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihVQM-0004gM-RE; Wed, 18 Dec 2019 09:15:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NgR6=2I=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ihVQL-0004gD-PQ
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 09:15:17 +0000
X-Inumbo-ID: e7a77ec8-2176-11ea-904a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e7a77ec8-2176-11ea-904a-12813bfff9fa;
 Wed, 18 Dec 2019 09:15:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2B1B9AB71;
 Wed, 18 Dec 2019 09:15:16 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20191218074859.21665-1-jgross@suse.com>
 <20191218074859.21665-3-jgross@suse.com>
 <242410d6fa204129b0d99cdfda05badf276f24ed.camel@suse.com>
 <bbe9f829-0b79-9d1c-4f08-8bd936a8e0a7@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <ace0f426-61ee-a2a6-ff89-3974706c9ddf@suse.com>
Date: Wed, 18 Dec 2019 10:15:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <bbe9f829-0b79-9d1c-4f08-8bd936a8e0a7@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/9] xen/sched: make sched-if.h really
 scheduler private
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMTIuMTkgMTA6MTAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMTgvMTIvMjAxOSAw
OTowOCwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4+IE9uIFdlZCwgMjAxOS0xMi0xOCBhdCAwODo0
OCArMDEwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+IGluY2x1ZGUveGVuL3NjaGVkLWlmLmgg
c2hvdWxkIGJlIHByaXZhdGUgdG8gc2NoZWR1bGVyIGNvZGUsIHNvIG1vdmUKPj4+IGl0Cj4+PiB0
byBjb21tb24vc2NoZWQvc2NoZWQtaWYuaCBhbmQgbW92ZSB0aGUgcmVtYWluaW5nIHVzZSBjYXNl
cyB0bwo+Pj4gY3B1cG9vbC5jIGFuZCBzY2hlZHVsZS5jLgo+Pj4KPj4gVmVyeSwgdmVyeSBuaWNl
IGNsZWFudXAuCj4gCj4gWXVwIC0gdmVyeSBuaWNlIHRvIHNlZS4KPiAKPj4KPj4+IFNpZ25lZC1v
ZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPj4+Cj4+IFJldmlld2VkLWJ5
OiBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29tPgo+IAo+IFRob3VnaHRzIG9uIHNp
bXBseSBuYW1pbmcgaXQgcHJpdmF0ZS5oPwoKRmluZSB3aXRoIG1lLiBEYXJpbz8KCgpKdWVyZ2Vu
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
