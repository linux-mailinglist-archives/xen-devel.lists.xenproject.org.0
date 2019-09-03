Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5C1A6C31
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 17:06:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5ALH-000423-Bl; Tue, 03 Sep 2019 15:03:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j28/=W6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i5ALG-00041y-7D
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 15:03:34 +0000
X-Inumbo-ID: fefa701c-ce5b-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fefa701c-ce5b-11e9-b299-bc764e2007e4;
 Tue, 03 Sep 2019 15:03:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EBC7AAD4E;
 Tue,  3 Sep 2019 15:03:31 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190829101846.21369-1-jgross@suse.com>
 <20190829101846.21369-6-jgross@suse.com>
 <87905a2d-acd5-90b7-1c40-bf81f5ac005b@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <75a52d2d-a482-c62d-8d30-b02aba00d349@suse.com>
Date: Tue, 3 Sep 2019 17:03:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87905a2d-acd5-90b7-1c40-bf81f5ac005b@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v3 5/5] xen: modify several static locks to
 unique names
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
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDkuMTkgMTY6NTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI5LjA4LjIwMTkgMTI6
MTgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IEluIG9yZGVyIHRvIGhhdmUgdW5pcXVlIG5hbWVz
IHdoZW4gZG9pbmcgbG9jayBwcm9maWxpbmcgc2V2ZXJhbCBsb2NhbAo+PiBsb2NrcyAibG9jayIg
bmVlZCB0byBiZSByZW5hbWVkLgo+IAo+IEJ1dCB0aGVzZSBhcmUgYWxsIG5hbWVkIHNpbXBseSAi
bG9jayIgZm9yIGEgZ29vZCByZWFzb24sIGluY2x1ZGluZwo+IGJlY2F1c2UgdGhleSdyZSBhbGwg
ZnVuY3Rpb24gc2NvcGUgc3ltYm9scyAoYW5kIHR5cGljYWxseSB0aGUKPiBmdW5jdGlvbnMgYXJl
IGFsbCBzdWZmaWNpZW50bHkgc2hvcnQpLiBUaGUgaXNzdWUgc3RlbXMgZnJvbSB0aGUKPiBkdWFs
IHVzZSBvZiAibmFtZSIgaW4KPiAKPiAjZGVmaW5lIF9MT0NLX1BST0ZJTEUobmFtZSkgeyAwLCAj
bmFtZSwgJm5hbWUsIDAsIDAsIDAsIDAsIDAgfQo+IAo+IHNvIEknZCByYXRoZXIgc3VnZ2VzdCBt
YWtpbmcgdGhpcyBhIGRlcml2YXRpb24gb2YgYSBuZXcKPiAKPiAjZGVmaW5lIF9MT0NLX1BST0ZJ
TEVfTkFNRShsb2NrLCBuYW1lKSB7IDAsICNuYW1lLCAmbG9jaywgMCwgMCwgMCwgMCwgMCB9Cj4g
Cj4gaWYgdGhlcmUncyBubyBvdGhlciAodHJhbnNwYXJlbnQpIHdheSBvZiBkaXNhbWJpZ3VhdGlu
ZyB0aGUgbmFtZXMuCgpUaGlzIHdpbGwgcmVxdWlyZSB0byB1c2UgYSBkaWZmZXJlbnQgREVGSU5F
X1NQSU5MT0NLKCkgdmFyaWFudCwgc28gZS5nLgpERUZJTkVfU1BJTkxPQ0tfTE9DQUwoKSwgd2hp
Y2ggd2lsbCB0aGVuIGluY2x1ZGUgdGhlIG5lZWRlZCAic3RhdGljIiBhbmQKYWRkICJAPGZ1bmM+
IiB0byB0aGUgbG9jayBwcm9maWxpbmcgbmFtZS4gSXMgdGhpcyBva2F5PwoKCkp1ZXJnZW4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
