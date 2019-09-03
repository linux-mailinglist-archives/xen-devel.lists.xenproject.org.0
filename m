Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5ADAA6C88
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 17:09:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5AOW-0004B3-SS; Tue, 03 Sep 2019 15:06:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CRa/=W6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5AOV-0004Ay-7R
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 15:06:55 +0000
X-Inumbo-ID: 77298744-ce5c-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77298744-ce5c-11e9-978d-bc764e2007e4;
 Tue, 03 Sep 2019 15:06:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DC107B022;
 Tue,  3 Sep 2019 15:06:53 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190829101846.21369-1-jgross@suse.com>
 <20190829101846.21369-4-jgross@suse.com>
 <d62618fe-176b-740c-bf18-e042dada4ef7@suse.com>
 <7ccbe6f2-fc60-5b23-c60e-aa0a11e3d4e1@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d27a27c9-f7c6-da7c-da1e-cf64bf2a6b0c@suse.com>
Date: Tue, 3 Sep 2019 17:06:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7ccbe6f2-fc60-5b23-c60e-aa0a11e3d4e1@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 3/5] xen: print lock profile info in
 panic()
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDkuMjAxOSAxNjozOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAwMy4wOS4xOSAx
NjoyMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI5LjA4LjIwMTkgMTI6MTgsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBWMjoKPj4+IC0gcmVuYW1lIENPTkZJR19MT0NLX1BST0ZJTEUgdG8g
Q09ORklHX0RFQlVHX0xPQ0tfUFJPRklMRSAoSmFuIEJldWxpY2gpCj4+PiAtIG1vdmUgLmxvY2tw
cm9maWxlLmRhdGEgc2VjdGlvbiB0byBpbml0IGFyZWEgaW4gbGlua2VyIHNjcmlwdHMKPj4KPj4g
SG93IGNhbiB0aGlzIGJlIGNvcnJlY3QsIHdoZW4geW91IGRvbid0IGNoYW5nZSBsb2NrX3Byb2Zf
aW5pdCgpIGF0Cj4+IGFsbD8gVGhlIGZ1bmN0aW9uIGJ1aWxkcyBhIGxpbmtlZCBsaXN0IGZyb20g
dGhlIGVudHJpZXMgaW4gdGhlCj4+IHNlY3Rpb24sIGFuZCB0aGVuIGhhbmRzIHRoZSBoZWFkIG9m
IHRoaXMgbGlzdCB0bwo+PiBfbG9ja19wcm9maWxlX3JlZ2lzdGVyX3N0cnVjdCgpLiBJIGd1ZXNz
IEkgbXVzdCBiZSBtaXNzaW5nCj4+IHNvbWV0aGluZy4gQW55d2F5LCBldmVyeXRoaW5nIGVsc2Ug
aGVyZSBsb29rcyBnb29kIHRvIG1lLgo+IAo+IFRoZSAubG9ja3Byb2ZpbGUuZGF0YSBzZWN0aW9u
IGNvbnRhaW5zIG9ubHkgdGhlIHBvaW50ZXJzIHRvIHRoZQo+IGVsZW1lbnRzIHB1dCBpbnRvIHRo
ZSBsaW5rZWQgbGlzdC4gQW5kIHRob3NlIHBvaW50ZXJzIGFyZSBubyBsb25nZXIKPiBuZWVkZWQg
YWZ0ZXJ3YXJkcy4KCk9oLCB5ZXMsIEkgc2VlIG5vdy4gQXJndWFibHkgd29ydGggbWFraW5nIGEg
c2VwYXJhdGUgY2hhbmdlLApidXQgc2luY2UgaXQncyB0aGlzIHdheSBub3cKQWNrZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkphbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
