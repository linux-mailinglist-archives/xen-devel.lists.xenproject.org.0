Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB8AB9516
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 18:18:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBLYT-00084m-Ff; Fri, 20 Sep 2019 16:14:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iBLYR-00084h-DR
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 16:14:43 +0000
X-Inumbo-ID: c0600d58-dbc1-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0600d58-dbc1-11e9-b299-bc764e2007e4;
 Fri, 20 Sep 2019 16:14:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DE89BAD12;
 Fri, 20 Sep 2019 16:14:40 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <60d95799-e760-c7ea-0c81-60f350ff32df@suse.com>
Date: Fri, 20 Sep 2019 18:14:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190914085251.18816-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 00/47] xen: add core scheduling support
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDkuMjAxOSAxMDo1MiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBUaGlzIGlzIGFjaGll
dmVkIGJ5IHN3aXRjaGluZyB0aGUgc2NoZWR1bGVyIHRvIG5vIGxvbmdlciBzZWUgdmNwdXMgYXMK
PiB0aGUgcHJpbWFyeSBvYmplY3QgdG8gc2NoZWR1bGUsIGJ1dCAic2NoZWR1bGUgdW5pdHMiLiBF
YWNoIHNjaGVkdWxlCj4gdW5pdCBjb25zaXN0cyBvZiBhcyBtYW55IHZjcHVzIGFzIGVhY2ggY29y
ZSBoYXMgdGhyZWFkcyBvbiB0aGUgY3VycmVudAo+IHN5c3RlbS4gVGhlIHZjcHUtPnVuaXQgcmVs
YXRpb24gaXMgZml4ZWQuCgpUaGVyZSdzIGFub3RoZXIgYXNwZWN0IGhlcmUgdGhhdCwgd2hpbGUg
cGVyaGFwcyBvYnZpb3VzLCBJIGRpZG4ndApyZWFsaXplIHNvIGZhcjogSWlyYyByaWdodCBub3cg
c2NoZWR1bGVycyB0cnkgdG8gcGxhY2UgdkNQVS1zIG9uCmRpZmZlcmVudCBjb3JlcywgYXMgbG9u
ZyBhcyB0aGVyZSBhcmVuJ3QgbW9yZSBydW5uYWJsZSB2Q1BVLXMgdGhhbgp0aGVyZSBhcmUgY29y
ZXMuIFRoaXMgaXMgdG8gaW1wcm92ZSBvdmVyYWxsIHRocm91Z2hwdXQsIHNpbmNlCnZDUFUtcyBv
biBzaWJsaW5nIGh5cGVydGhyZWFkcyB3b3VsZCBjb21wZXRlIGZvciBleGVjdXRpb24KcmVzb3Vy
Y2VzLiBXaXRoIGEgZml4ZWQgcmVsYXRpb24gdGhpcyBpcyBnb2luZyB0byBiZSBpbXBvc3NpYmxl
LgpPdG9oIEkgY2FuIG9mIGNvdXJzZSBzZWUgaG93LCBvbmNlIHdlIGhhdmUgcHJvcGVyIHZpcnR1
YWwKdG9wb2xvZ3ksIHRoaXMgYWxsb3dzIGJldHRlciBzY2hlZHVsaW5nIGRlY2lzaW9ucyBpbnNp
ZGUgdGhlCmd1ZXN0LCBpbiBwYXJ0aWN1bGFyIGlmIC0gdW5kZXIgdGhlIHJpZ2h0IGNpcmN1bXN0
YW5jZXMgLSBpdCBpcwphY3R1YWxseSB3YW50ZWQgdG8gcnVuIHR3byBlbnRpdGllcyBvbiBzaWJs
aW5nIHRocmVhZHMuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
