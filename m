Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A14D17DF25
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 12:57:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBH06-0001Hv-06; Mon, 09 Mar 2020 11:55:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=k1Ob=42=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBH04-0001Hq-EK
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 11:55:12 +0000
X-Inumbo-ID: d417922b-61fc-11ea-ac13-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d417922b-61fc-11ea-ac13-12813bfff9fa;
 Mon, 09 Mar 2020 11:55:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1DBA8AF4E;
 Mon,  9 Mar 2020 11:55:10 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <20200226124705.29212-1-jgross@suse.com>
 <20200226124705.29212-2-jgross@suse.com>
 <d3b83513-8fc2-634c-fa89-00df84c5c4fb@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <471c2f88-2ac2-823d-546f-6fc817e34ec8@suse.com>
Date: Mon, 9 Mar 2020 12:55:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <d3b83513-8fc2-634c-fa89-00df84c5c4fb@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 01/12] xen: allow only sizeof(bool)
 variables for boolean_param()
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
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDMuMjAyMCAxMjo0MywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDI2LzAyLzIwMjAg
MTI6NDYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IEBAIC00Niw3ICs0OCw4IEBAIGV4dGVybiBj
b25zdCBzdHJ1Y3Qga2VybmVsX3BhcmFtIF9fcGFyYW1fc3RhcnRbXSwgX19wYXJhbV9lbmRbXTsK
Pj4gICAgICAgX19rcGFyYW0gX19zZXR1cF8jI192YXIgPSBcCj4+ICAgICAgICAgICB7IC5uYW1l
ID0gX19zZXR1cF9zdHJfIyNfdmFyLCBcCj4+ICAgICAgICAgICAgIC50eXBlID0gT1BUX0JPT0ws
IFwKPj4gLSAgICAgICAgICAubGVuID0gc2l6ZW9mKF92YXIpLCBcCj4+ICsgICAgICAgICAgLmxl
biA9IHNpemVvZihfdmFyKSArIFwKPj4gKyAgICAgICAgICAgICAgICAgQlVJTERfQlVHX09OX1pF
Uk8oc2l6ZW9mKF92YXIpICE9IHNpemVvZihib29sKSksIFwKPiAKPiAgRnJvbSBteSB1bmRlcnN0
YW5kaW5nLCBzaXplb2YoYm9vbCkgaXMgbm90IG5lY2Vzc2FyaWx5IDEgKGl0IGNhbiBiZSAKPiBn
cmVhdGVyKS4gV2hpbGUgdGhpcyBpcyBmaW5lIHRvIHVzZSBpdCBpbiBYZW4sIEkgdGhpbmsgd2Ug
d2FudCBpdCB0byAKPiBhbHdheXMgYmUgb25lIHdoZW4gZXhwb3NlZCBpbiB0aGUgaHlwZnMuCgpJ
IGRvbid0IHRoaW5rIHNvOiBXZSB3YW50IHZhcmlhYmxlIG9mIHR5cGUgJ2Jvb2wnIHRvIGJlIHVw
ZGF0ZWQKY29uc2lzdGVudGx5IChpLmUuIGJ5IGEgd3JpdGUgdG8gdGhlIGZ1bGwgdmFyaWFibGUp
LiBIZW5jZSBJCnRoaW5rIHNpemVvZihib29sKSBpcyBjb3JyZWN0IGhlcmUuIEkgY2FuIHNlZSB0
aG91Z2ggdGhhdCB0aGUKaHlwZXJjYWxsIGludGVyZmFjZSB0aGVuIGdhaW5zIGEgZGVwZW5kZW5j
eSBvbiB0aGUgaHlwZXJ2aXNvcidzCnJlcHJlc2VudGF0aW9uIG9mICdib29sJywgYnV0IEkgdGhp
bmsgc3VjaCBvdWdodCB0byBiZSB0YWtlbgpjYXJlIG9mIGluIHRoZSBmdW5jdGlvbiBjYXJyeWlu
ZyBvdXQgdGhlIHdyaXRlLCBub3QgaW4gdGhlCm1hY3JvIGhlcmUuCgpKYW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
