Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8B8D6448
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 15:43:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iK0a0-0003zO-OD; Mon, 14 Oct 2019 13:40:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XCkI=YH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iK0Zz-0003vz-18
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 13:40:07 +0000
X-Inumbo-ID: 206cd45a-ee88-11e9-937f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 206cd45a-ee88-11e9-937f-12813bfff9fa;
 Mon, 14 Oct 2019 13:40:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 45259BF4E;
 Mon, 14 Oct 2019 13:40:03 +0000 (UTC)
To: Wei Liu <wl@xen.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20191002170543.26571-1-olaf@aepfle.de>
 <20191002170543.26571-2-olaf@aepfle.de>
 <20191013162039.hsylxvashc4rbo67@function>
 <20191013162127.2pdc6ho4oer5pnpr@function>
 <20191013185032.49807077.olaf@aepfle.de>
 <20191013165521.ktfmn3rcipexwaiw@function>
 <CAK9nU=r3kwePih8Ugr4=Tv5=wxNAN6v1DLdE5wz1pBnfVmmZoQ@mail.gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <ced3040c-a7a7-fdcb-4ec1-f1ab89aeeebf@suse.com>
Date: Mon, 14 Oct 2019 15:40:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAK9nU=r3kwePih8Ugr4=Tv5=wxNAN6v1DLdE5wz1pBnfVmmZoQ@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/8] stubdom/vtpm: include stdio.h for
 declaration of printf
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Olaf Hering <olaf@aepfle.de>,
 Quan Xu <quan.xu0@gmail.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMTAuMTkgMTE6MDIsIFdlaSBMaXUgd3JvdGU6Cj4gQ2MgSnVlcmdlbi4KPiAKPiBMb29r
cyBwcmV0dHkgaGFybWxlc3MgZm9yIDQuMTMuCgpZZXMuCgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
