Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCB34C8D1
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2019 10:01:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdryJ-0001lH-2V; Thu, 20 Jun 2019 07:59:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YCDK=UT=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hdryH-0001lC-RZ
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2019 07:59:01 +0000
X-Inumbo-ID: 430f5874-9331-11e9-8980-bc764e045a96
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 430f5874-9331-11e9-8980-bc764e045a96;
 Thu, 20 Jun 2019 07:59:00 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 7FA4830747C9; Thu, 20 Jun 2019 10:58:59 +0300 (EEST)
Received: from [10.10.196.90] (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 69E7F306E477;
 Thu, 20 Jun 2019 10:58:59 +0300 (EEST)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
References: <1caa159ffc8abebbc92c56a41db631706212d409.1561014865.git.ppircalabu@bitdefender.com>
 <20190620075600.a7bxoumkgcsu2foo@MacBook-Air-de-Roger.local>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <0b4bc7e5-1e96-88ff-11f3-e60e4001cc34@bitdefender.com>
Date: Thu, 20 Jun 2019 10:58:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190620075600.a7bxoumkgcsu2foo@MacBook-Air-de-Roger.local>
Content-Language: en-US-large
Subject: Re: [Xen-devel] [PATCH] MAINTAINERS: Add myself as reviewer for
 vm_event
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
Cc: tamas@tklengyel.com, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNi8yMC8xOSAxMDo1NiBBTSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUaHUsIEp1
biAyMCwgMjAxOSBhdCAxMDoxNzo0NkFNICswMzAwLCBQZXRyZSBQaXJjYWxhYnUgd3JvdGU6Cj4+
IFNpZ25lZC1vZmYtYnk6IFBldHJlIFBpcmNhbGFidSA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5j
b20+Cj4+IC0tLQo+PiAgIE1BSU5UQUlORVJTIHwgMSArCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJT
Cj4+IGluZGV4IGFiMzJlN2YuLjAxNTE2MjUgMTAwNjQ0Cj4+IC0tLSBhL01BSU5UQUlORVJTCj4+
ICsrKyBiL01BSU5UQUlORVJTCj4+IEBAIC00MTIsNiArNDEyLDcgQEAgRjoJdW5tb2RpZmllZF9k
cml2ZXJzL2xpbnV4LTIuNi8KPj4gICAKPj4gICBWTSBFVkVOVCwgTUVNIEFDQ0VTUyBhbmQgTU9O
SVRPUgo+PiAgIE06CVJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4K
Pj4gK1I6CVBldHJlIFBpcmNhbGFidSA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+Cj4+ICAg
TToJVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgo+IAo+IEkgd291bGQgcGxh
Y2UgdGhlIGFkZGl0aW9uIGFmdGVyIHRoZSBsaXN0IG9mIE0oYWludGFpbmVycykuCgpTaW5jZSB0
aGlzIGFuZCBBbGV4YW5kcnUncyBhcmUgdHJpdmlhbCBwYXRjaGVzIGFuZCB3aGF0ZXZlciBwYXRj
aCBlbmRzIAp1cCB1cHN0cmVhbSBmaXJzdCB3aWxsIHBvc3NpYmx5IHJlcXVpcmUgYSBtb2RpZmlj
YXRpb24gb2YgdGhlIG90aGVyICsgCnJlc2VuZCwgY291bGQgdGhpcyBiZSBwb3NzaWJseSBmaXhl
ZCBvbiBjb21taXQgKGkuZS4gbW92ZSBib3RoIHJldmlld2VycyAKYWZ0ZXIgdGhlIG1haW50YWlu
ZXJzIGxpbmVzKT8KCgpUaGFua3MsClJhenZhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
