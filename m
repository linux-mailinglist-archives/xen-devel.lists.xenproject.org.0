Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C81413ACAB
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 15:54:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irNWt-0002vP-4B; Tue, 14 Jan 2020 14:50:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2XF3=3D=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1irNWs-0002vK-6o
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 14:50:50 +0000
X-Inumbo-ID: 3c10bbde-36dd-11ea-a985-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c10bbde-36dd-11ea-a985-bc764e2007e4;
 Tue, 14 Jan 2020 14:50:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7460DABED;
 Tue, 14 Jan 2020 14:50:40 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200108152328.27194-1-jgross@suse.com>
 <20200108152328.27194-3-jgross@suse.com>
 <2a59a886-81ed-05d8-022c-eadaa5146e47@suse.com>
 <5020a128-e1ac-482f-3456-9895b784882c@suse.com>
 <3be45bda-2547-2fd1-1bf6-2c889fa73d1f@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <1491c929-eb1d-3911-6591-499a6fc9ec36@suse.com>
Date: Tue, 14 Jan 2020 15:50:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <3be45bda-2547-2fd1-1bf6-2c889fa73d1f@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/9] xen/sched: make sched-if.h really
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDEuMjAgMTU6MzksIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDE0LjAxLjIwMjAgMTU6
MzMsIErDvHJnZW4gR3Jvw58gIHdyb3RlOgo+PiBPbiAxNC4wMS4yMCAxNToyNywgSmFuIEJldWxp
Y2ggd3JvdGU6Cj4+PiBPbiAwOC4wMS4yMDIwIDE2OjIzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+
Pj4+ICtjcHVtYXNrX3QgKmNwdXBvb2xfdmFsaWRfY3B1cyhzdHJ1Y3QgY3B1cG9vbCAqcG9vbCkK
Pj4+Cj4+PiBjb25zdCB0d2ljZT8KPj4KPj4gU2VlIHBhdGNoIDkuCj4gCj4gV2VsbCwgaW4gc3Vj
aCBhIGNhc2UgZWl0aGVyIGp1c3RpZnkgdGhlIG9taXNzaW9uIGluIHRoZSBkZXNjcmlwdGlvbiwK
PiBvciBpbnRyb2R1Y2UgdGhlIGZ1bmN0aW9uIHdpdGggY29uc3QgaGVyZSBhbmQgZHJvcCB0aGVt
IHRoZXJlLiBBcwo+IHRoaW5ncyBhcmUsIG5vIHJldmlld2VyIHNob3VsZCByZWFsbHkgbGV0IHRo
aXMgcGFzcyB1bmNvbW1lbnRlZC4KCk9oLCBzb3JyeSwgeW91IGFyZSByaWdodC4gV2hlbiB3cml0
aW5nIG15IHJlcGx5IEkgYmVsaWV2ZWQgSSBqdXN0IG1vdmVkCnRob3NlIGZ1bmN0aW9ucy4gVGhl
IGludHJvZHVjdGlvbiBzaG91bGQgaGF2ZSB0aGUgY29uc3QgcXVhbGlmaWVycwphbHJlYWR5LCBv
ZiBjb3Vyc2UuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
