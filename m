Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE331356F5
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 11:33:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipV4q-0001U7-Ll; Thu, 09 Jan 2020 10:30:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q+DX=26=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ipV4p-0001TV-2f
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 10:30:07 +0000
X-Inumbo-ID: 0081777c-32cb-11ea-b996-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0081777c-32cb-11ea-b996-12813bfff9fa;
 Thu, 09 Jan 2020 10:30:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 79B9E69FE2;
 Thu,  9 Jan 2020 10:30:00 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200109054031.18455-1-jgross@suse.com>
 <791d2e94-3d46-bc8d-b929-280bfe7f2f51@citrix.com>
 <beb1d847-caee-ddc0-1688-34a42072095f@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <41cc4690-8ab7-5580-d1d6-8d7ce5be51e9@suse.com>
Date: Thu, 9 Jan 2020 11:30:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <beb1d847-caee-ddc0-1688-34a42072095f@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen: make CONFIG_DEBUG_LOCKS usable without
 CONFIG_DEBUG
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDEuMjAyMCAxMToxNSwgSsO8cmdlbiBHcm/DnyAgd3JvdGU6Cj4gT24gMDkuMDEuMjAg
MTE6MDcsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+IE9uIDEvOS8yMCA1OjQwIEFNLCBKdWVyZ2Vu
IEdyb3NzIHdyb3RlOgo+Pj4gSW4gZXhwZXJ0IG1vZGUgaXQgaXMgcG9zc2libGUgdG8gZW5hYmxl
IENPTkZJR19ERUJVR19MT0NLUyB3aXRob3V0Cj4+PiBoYXZpbmcgZW5hYmxlZCBDT05GSUdfREVC
VUcuIFRoZSBjb2RpbmcgaXMgZGVwZW5kaW5nIG9uIENPTkZJR19ERUJVRwo+Pj4gYXMgaXQgaXMg
dXNpbmcgQVNTRVJUKCksIGhvd2V2ZXIuCj4+Cj4+IEFueSByZWFzb24gbm90IHRvIHVzZSBCVUdf
T04oKSBpbiB0aGF0IGNhc2U/Cj4gCj4gVGhlIG1haW4gcmVhc29uIGlzIHRoZSBtaXNzaW5nIG1l
c3NhZ2Ugd2hpY2ggY29uZGl0aW9uIGZhaWxlZC4KPiAKPiBBIHJlbmFtZSAoIkJVR19BU1NFUlQi
PykgY291bGQgYmUgYW4gYWx0ZXJuYXRpdmUgdG8ganVzdCBkcm9wcGluZwo+IHRoZSBtZXNzYWdl
LiBCb3RoIHdvdWxkIGJlIGZpbmUgd2l0aCBtZS4KCkhvdyBhYm91dAoKICAgIGlmICggLi4uICkK
ICAgIHsKICAgICAgICBwcmludGsoLi4uKTsKICAgICAgICBCVUcoKTsKICAgIH0KCj8KCkphbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
