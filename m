Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55246B907D
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 15:17:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBIjR-0002Z1-AA; Fri, 20 Sep 2019 13:13:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iBIjP-0002Yw-Vq
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 13:13:52 +0000
X-Inumbo-ID: 7c53071e-dba8-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c53071e-dba8-11e9-b299-bc764e2007e4;
 Fri, 20 Sep 2019 13:13:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3E35CAF57;
 Fri, 20 Sep 2019 13:13:49 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <b080fa0f-08d2-34d0-3f54-549e1303eeb4@suse.com>
 <77f8b74c-c9a9-efc4-07b1-d20dbd5545c5@citrix.com>
 <89ed0fa4-b126-1939-d728-5ff2d477465a@suse.com>
 <5723389e-5cad-56e9-044e-2888eeeecea6@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7ee8ead5-7cbd-fbb3-d0ee-f9046401b07f@suse.com>
Date: Fri, 20 Sep 2019 15:13:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5723389e-5cad-56e9-044e-2888eeeecea6@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] libxc/x86: avoid overflow in CPUID APIC ID
 adjustments
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDkuMjAxOSAxNDo0MCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPdmVyYWxsLCBJIHdv
dWxkIHN1Z2dlc3QgZG9pbmcgdGhlIGFic29sdXRlIG1pbmltdW0gY2hhbmdlIHJlcXVpcmVkIHRv
Cj4gdW5icmVhayBSb21lIENQVXMuCgpXZWxsLCBva2F5LCBJJ20gemFwcGluZyBldmVyeXRoaW5n
IGVsc2UsIGJ1dCBpdCBmZWVscyB3cm9uZyB0bwpsZWF2ZSBpbiBwbGFjZSB0aGUgc2ltaWxhciBv
dmVyZmxvdyBpbiBpbnRlbF94Y19jcHVpZF9wb2xpY3koKS4KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
