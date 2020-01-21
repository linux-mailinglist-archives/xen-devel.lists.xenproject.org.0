Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C15143B72
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 11:54:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itr8E-00005q-Ua; Tue, 21 Jan 2020 10:51:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=PT5E=3K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1itr8D-00005l-Qn
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 10:51:37 +0000
X-Inumbo-ID: fa259f8c-3c3b-11ea-9fd7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa259f8c-3c3b-11ea-9fd7-bc764e2007e4;
 Tue, 21 Jan 2020 10:51:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B7788AD73;
 Tue, 21 Jan 2020 10:51:27 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20200121101301.421-1-jgross@suse.com>
 <20200121101301.421-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <aafb4ea7-59ec-227a-9507-b6836342f4b4@suse.com>
Date: Tue, 21 Jan 2020 11:51:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200121101301.421-2-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/2] xen: add config option to include
 failing condition in BUG_ON() message
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDEuMjAyMCAxMToxMywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBUb2RheSBhIHRyaWdn
ZXJpbmcgQlVHX09OKCkgd2lsbCBvbmx5IHByaW50IHNvdXJjZSBmaWxlIGFuZCBsaW5lCj4gaW5m
b3JtYXRpb24uIEFkZCB0aGUgcG9zc2liaWxpdHkgdG8gcHJpbnQgdGhlIHRyaWdnZXJpbmcgY29u
ZGl0aW9uIGxpa2UKPiBBU1NFUlQoKS4KPiAKPiBEbyB0aGF0IGJ5IGludHJvZHVjaW5nIEJVR19W
RVJCT1NFKCkgYW5kIGFkZCBhIEtjb25maWcgb3B0aW9uIHRvIG1ha2UKPiBCVUdfT04gdXNlIEJV
R19WRVJCT1NFKCkuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
