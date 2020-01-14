Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D890213AC8B
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 15:43:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irNM0-0001CY-5w; Tue, 14 Jan 2020 14:39:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XZPm=3D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1irNLy-0001CT-Vm
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 14:39:35 +0000
X-Inumbo-ID: ad56d4ba-36db-11ea-83c4-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ad56d4ba-36db-11ea-83c4-12813bfff9fa;
 Tue, 14 Jan 2020 14:39:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8BDD7BCB2;
 Tue, 14 Jan 2020 14:39:31 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200108152328.27194-1-jgross@suse.com>
 <20200108152328.27194-3-jgross@suse.com>
 <2a59a886-81ed-05d8-022c-eadaa5146e47@suse.com>
 <5020a128-e1ac-482f-3456-9895b784882c@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3be45bda-2547-2fd1-1bf6-2c889fa73d1f@suse.com>
Date: Tue, 14 Jan 2020 15:39:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <5020a128-e1ac-482f-3456-9895b784882c@suse.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDEuMjAyMCAxNTozMywgSsO8cmdlbiBHcm/DnyAgd3JvdGU6Cj4gT24gMTQuMDEuMjAg
MTU6MjcsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAwOC4wMS4yMDIwIDE2OjIzLCBKdWVyZ2Vu
IEdyb3NzIHdyb3RlOgo+Pj4gK2NwdW1hc2tfdCAqY3B1cG9vbF92YWxpZF9jcHVzKHN0cnVjdCBj
cHVwb29sICpwb29sKQo+Pgo+PiBjb25zdCB0d2ljZT8KPiAKPiBTZWUgcGF0Y2ggOS4KCldlbGws
IGluIHN1Y2ggYSBjYXNlIGVpdGhlciBqdXN0aWZ5IHRoZSBvbWlzc2lvbiBpbiB0aGUgZGVzY3Jp
cHRpb24sCm9yIGludHJvZHVjZSB0aGUgZnVuY3Rpb24gd2l0aCBjb25zdCBoZXJlIGFuZCBkcm9w
IHRoZW0gdGhlcmUuIEFzCnRoaW5ncyBhcmUsIG5vIHJldmlld2VyIHNob3VsZCByZWFsbHkgbGV0
IHRoaXMgcGFzcyB1bmNvbW1lbnRlZC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
