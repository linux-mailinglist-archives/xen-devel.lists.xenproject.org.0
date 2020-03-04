Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BCE179442
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 17:02:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9WRk-0007Pf-35; Wed, 04 Mar 2020 16:00:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bsO7=4V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j9WRi-0007PW-F0
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 16:00:30 +0000
X-Inumbo-ID: 453507f8-5e31-11ea-a42e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 453507f8-5e31-11ea-a42e-12813bfff9fa;
 Wed, 04 Mar 2020 16:00:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6D692B19B;
 Wed,  4 Mar 2020 16:00:28 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-18-anthony.perard@citrix.com>
 <20200227130925.GO24458@Air-de-Roger.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <71853852-f44d-268f-e926-5c9f19d666a6@suse.com>
Date: Wed, 4 Mar 2020 17:00:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200227130925.GO24458@Air-de-Roger.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v3 17/23] xen/build: Start using
 if_changed
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
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDIuMjAyMCAxNDowOSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBXZWQsIEZl
YiAyNiwgMjAyMCBhdCAxMTozMzo0OUFNICswMDAwLCBBbnRob255IFBFUkFSRCB3cm90ZToKPj4g
QEAgLTE2MSwyOSArMTczLDQ3IEBAIGVsc2UKPj4gIAkkKENDKSAkKGNfZmxhZ3MpIC1jICQ8IC1v
ICRACj4+ICBlbmRpZgo+PiAgCj4+IC0lLm86ICUuUyBNYWtlZmlsZQo+PiAtCSQoQ0MpICQoYV9m
bGFncykgLWMgJDwgLW8gJEAKPj4gK3F1aWV0X2NtZF9jY19vX1MgPSBDQyAgICAgICRACj4+ICtj
bWRfY2Nfb19TID0gJChDQykgJChhX2ZsYWdzKSAtYyAkPCAtbyAkQAo+PiArCj4+ICslLm86ICUu
UyBGT1JDRQo+PiArCSQoY2FsbCBpZl9jaGFuZ2VkLGNjX29fUykKPj4gKwo+PiArCj4+ICtxdWll
dF9jbWRfb2JqX2luaXRfbyA9IElOSVRfTyAgJEAKPiAKPiBJTklUX08gc2VlbXMga2luZCBvZiB3
ZWlyZCwgbWF5YmUganVzdCB1c2luZyBDSEVDSyB3b3VsZCBiZSBPSz8KCkNIRUNLIGlzIG5vdCBl
eHByZXNzaW5nIHdoYXQncyBnb2luZyBvbiAtIG9uZSBjb3VsZC93b3VsZCBpbXBseQp0aGF0IHRo
ZSBvYmplY3QgZmlsZSBkb2Vzbid0IGdldCBjaGFuZ2VkIGF0IGFsbCwgYnV0IGl0cyBzZWN0aW9u
cwpnZXQgcmVuYW1lZC4gSSB0aGluayBJTklUX08gaXMgc3VmZmljaWVudGx5IGV4cHJlc3NpdmUg
YXQgbGVhc3QKdG8gcGVvcGxlIGtub3dpbmcgdGhlIGJ1aWxkIHN5c3RlbS4KCj4gVGhlIHJlc3Qg
TEdUTToKPiAKPiBSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+CgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
