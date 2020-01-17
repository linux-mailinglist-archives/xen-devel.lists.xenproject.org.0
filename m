Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A3F140828
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 11:43:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isP20-0003Iu-GP; Fri, 17 Jan 2020 10:39:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=n+o/=3G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1isP1z-0003Ip-Ct
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 10:39:11 +0000
X-Inumbo-ID: 93a61cba-3915-11ea-ac27-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93a61cba-3915-11ea-ac27-bc764e2007e4;
 Fri, 17 Jan 2020 10:39:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B6EE8AE7F;
 Fri, 17 Jan 2020 10:39:01 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200117095251.42668-1-roger.pau@citrix.com>
 <20200117095251.42668-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <22438ac4-332c-f080-6fc8-f1f91f253c73@suse.com>
Date: Fri, 17 Jan 2020 11:39:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200117095251.42668-2-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/2] x86/smp: move and clean APIC helpers
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDEuMjAyMCAxMDo1MiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IE1vdmUgX19wcmVw
YXJlX0lDUnsyfSwgYXBpY193YWl0X2ljcl9pZGxlIGFuZAo+IF9fZGVmYXVsdF9zZW5kX0lQSV9z
aG9ydGN1dCB0byB0aGUgdG9wIG9mIHRoZSBmaWxlLCBzaW5jZSB0aGV5IHdpbGwgYmUKPiB1c2Vk
IGJ5IHNlbmRfSVBJX21hc2sgaW4gZnV0dXJlIGNoYW5nZXMuCj4gCj4gV2hpbGUgdGhlcmUsIHRh
a2UgdGhlIG9wcG9ydHVuaXR5IHRvIHJlbW92ZSB0aGUgbGVhZGluZyB1bmRlcnNjb3JlcywKPiBk
cm9wIHRoZSBpbmxpbmUgYXR0cmlidXRlLCBkcm9wIHRoZSBkZWZhdWx0IHByZWZpeCBmcm9tIHRo
ZSBzaG9ydGhhbmQKPiBoZWxwZXIsIGNoYW5nZSB0aGUgcmV0dXJuIHR5cGUgb2YgdGhlIHByZXBh
cmUgaGVscGVycyB0byB1bnNpZ25lZCBhbmQKPiBkbyBzb21lIG1pbm9yIHN0eWxlIGNsZWFudXBz
Lgo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
