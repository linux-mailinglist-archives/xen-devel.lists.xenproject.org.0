Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72961E7553
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 16:37:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP72l-0001qa-9G; Mon, 28 Oct 2019 15:34:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vp8f=YV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iP72j-0001qV-KJ
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 15:34:53 +0000
X-Inumbo-ID: 7c14afc4-f998-11e9-beca-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c14afc4-f998-11e9-beca-bc764e2007e4;
 Mon, 28 Oct 2019 15:34:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D9607ABD0;
 Mon, 28 Oct 2019 15:34:51 +0000 (UTC)
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
References: <20191028152948.11900-1-ian.jackson@eu.citrix.com>
 <20191028152948.11900-2-ian.jackson@eu.citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <68ccafda-dd8c-a70e-4830-1e016e551e0e@suse.com>
Date: Mon, 28 Oct 2019 16:34:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191028152948.11900-2-ian.jackson@eu.citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 1/3] libxl:
 domain_config_setdefault: Document use of domid
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTAuMTkgMTY6MjksIElhbiBKYWNrc29uIHdyb3RlOgo+IFdlIGFyZSBnb2luZyB0byB3
YW50IHRvIGNhbGwgdGhpcyBmcm9tIGEgc2l0ZSB3aGljaCBoYXMgYSBkb21pZCB3aGljaAo+IGlz
IGdvb2QgZm9yIGxvZ2dpbmcgYnV0IG5vdCB0aGUgZG9taWQgb2YgdGhlIGRvbWFpbiB3ZSBhcmUg
Y3JlYXRpbmcKPiAobmFtZWx5LCB0aGUgc3R1YiBkZXZpY2UgZG9tYWluKS4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KPiBDQzogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKRm9yIHRoZSBzZXJpZXM6IFJlbGVhc2UtYWNr
ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
