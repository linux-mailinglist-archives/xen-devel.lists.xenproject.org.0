Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30615B1291
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 18:05:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8RYR-0005MS-RF; Thu, 12 Sep 2019 16:02:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ncEf=XH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8RYQ-0005MN-Tb
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 16:02:42 +0000
X-Inumbo-ID: bfcc78be-d576-11e9-959d-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bfcc78be-d576-11e9-959d-12813bfff9fa;
 Thu, 12 Sep 2019 16:02:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B820BAF25;
 Thu, 12 Sep 2019 16:02:40 +0000 (UTC)
To: Paul Durrant <paul.durrant@citrix.com>
References: <20190912140504.40853-1-paul.durrant@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ebb1e983-aa65-a364-3574-ce092d08e249@suse.com>
Date: Thu, 12 Sep 2019 18:02:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190912140504.40853-1-paul.durrant@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] public/xen.h: update the comment explaining
 'Wallclock time'
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDkuMjAxOSAxNjowNSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IFNpbmNlIGNvbW1pdCAw
NjI5YWRmZDgwZSAiQWN0dWFsbHkgc2V0IGEgSFZNIGRvbWFpbidzIHRpbWUgb2Zmc2V0IHdoZW4g
aXQKPiBzZXRzIHRoZSBSVEMiLCB0aGUgY29tbWVudCBpbiB0aGUgcHVibGljIGhlYWRlciBoYXMg
YmVlbiBtaXNsZWFkaW5nLCBzaW5jZQo+IGl0IGNsYWltcyB0aGF0IHdhbGxjbG9jayB0aW1lIGlz
IG9ubHkgdXBkYXRlZCBieSBjb250cm9sIHNvZnR3YXJlLgo+IE1vcmVvdmVyLCB0aGUgY29tbWVu
dHMgc3RhdGluZyB0aGF0IHdjX3NlYyBhbmQgd2NfbnNlYyBhcmUgc2Vjb25kcyBhbmQKPiBuYW5v
c2Vjb25kcyAocmVzcGVjdGl2ZWx5KSBpbiBVVEMgc2luY2UgdGhlIFVuaXggZXBvY2ggYXJlIGJv
Z3VzLiBUaGVpcgo+IHZhbHVlcyBhcmUgYWRqdXN0ZWQgYnkgdGhlIGRvbWFpbidzIHRpbWVfb2Zm
c2V0X3NlY29uZHMgdmFsdWUsIHdoaWNoIGlzCj4gdXBkYXRlZCBieSBhIGd1ZXN0IHdyaXRlIHRv
IHRoZSBlbXVsYXRlZCBSVEMgYW5kIGhlbmNlIHRoZSB3YWxsY2xvY2sKPiB0aW1lem9uZSBpcyB1
bmRlciBndWVzdCBjb250cm9sLgo+IAo+IFRoaXMgcGF0Y2ggYXR0ZW1wdHMgdG8gYnJpbmcgdGhl
IGNvbW1lbnQgaW4gbGluZSB3aXRoIHJlYWxpdHkgd2hpbHN0Cj4ga2VlcGluZyBpdCByZWFzb25h
Ymx5IHNob3J0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50
QGNpdHJpeC5jb20+CgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoo
cHJlZmVyYWJseSB3aXRoIHRoZSB0eXBvIGZpeGVkIHRoYXQgSsO8cmdlbiBwb2ludGVkIG91dDsg
ZWFzaWx5CmRvbmUgd2hpbGUgY29tbWl0dGluZykKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
