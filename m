Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48151B38E7
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 12:56:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9odc-00044V-G6; Mon, 16 Sep 2019 10:53:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i9odb-00044Q-FZ
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 10:53:43 +0000
X-Inumbo-ID: 3f05b22a-d870-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f05b22a-d870-11e9-978d-bc764e2007e4;
 Mon, 16 Sep 2019 10:53:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1B5FEAD87;
 Mon, 16 Sep 2019 10:53:41 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190913192759.10795-1-andrew.cooper3@citrix.com>
 <20190913192759.10795-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9dc48541-d996-6ac0-d5af-67143eb0a3e4@suse.com>
Date: Mon, 16 Sep 2019 12:53:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190913192759.10795-2-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 01/10] x86/msr: Offer CPUID Faulting to
 PVH control domains
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDkuMjAxOSAyMToyNywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGUgY29udHJvbCBk
b21haW4gZXhjbHVzaW9uIGZvciBDUFVJRCBGYXVsdGluZyBwcmVkYXRlcyBkb20wIFBWSCwgYnV0
IHRoZQo+IHJlYXNvbiBmb3IgdGhlIGV4Y2x1c2lvbiAodG8gYWxsb3cgdGhlIGRvbWFpbiBidWls
ZGVyIHRvIHNlZSBob3N0IENQVUlECj4gdmFsdWVzKSBpc24ndCBhcHBsaWNhYmxlLgo+IAo+IFRo
ZSBkb21haW4gYnVpbGRlciAqaXMqIGJyb2tlbiBpbiBQVkggY29udHJvbCBkb21haW5zLCBhbmQg
cmVzdHJpY3RpbmcgdGhlIHVzZQo+IG9mIENQVUlEIEZhdWx0aW5nIGRvZXNuJ3QgbWFrZSBpdCBh
bnkgbGVzcyBicm9rZW4uICBUd2VhayB0aGUgbG9naWMgdG8gb25seQo+IGV4Y2x1ZGUgUFYgY29u
dHJvbCBkb21haW5zLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
