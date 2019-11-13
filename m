Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F192FB5D8
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 18:01:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUvzR-0006V1-Km; Wed, 13 Nov 2019 16:59:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SDLk=ZF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iUvzQ-0006UH-BA
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 16:59:32 +0000
X-Inumbo-ID: f58f668c-0636-11ea-b678-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f58f668c-0636-11ea-b678-bc764e2007e4;
 Wed, 13 Nov 2019 16:59:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1CFC2AC2C;
 Wed, 13 Nov 2019 16:59:30 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20191113162229.1140-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3e60b6d7-a272-9889-076f-7f3afa72b1a1@suse.com>
Date: Wed, 13 Nov 2019 17:59:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191113162229.1140-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen: make debugger support configurable
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
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTEuMjAxOSAxNzoyMiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBEZWJ1Z2dlciBzdXBw
b3J0IGluIHRoZSBoeXBlcnZpc29yIGlzIHJhcmVseSB1c2VkIGFuZCBpdCBpcyBvcGVuaW5nIGEK
PiB3YXkgZm9yIGRvbTAgdG8gbW9kaWZ5IHRoZSBydW5uaW5nIGh5cGVydmlzb3IgYnkgdmVyeSBl
YXN5IG1lYW5zLgo+IAo+IEFkZCBhIEtjb25maWcgb3B0aW9uIHRvIGNvbnRyb2wgc3VwcG9ydCBv
ZiBnZGJzeC4gRGVmYXVsdCBpcyBvZmYuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
