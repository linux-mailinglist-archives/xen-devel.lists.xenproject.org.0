Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDD4419BD
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 02:55:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1harUL-0004J9-Ml; Wed, 12 Jun 2019 00:51:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=v58P=UL=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1harUK-0004J4-3e
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 00:51:40 +0000
X-Inumbo-ID: 398a81be-8cac-11e9-9a39-5bc528250577
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 398a81be-8cac-11e9-9a39-5bc528250577;
 Wed, 12 Jun 2019 00:51:35 +0000 (UTC)
Received: from [192.168.51.47] (61.161.186.150) by mxnavi-mail.mxnavi.com
 (116.90.87.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 12 Jun
 2019 08:48:24 +0800
To: Andrew Cooper <andrew.cooper3@citrix.com>, <xen-devel@lists.xenproject.org>
References: <dd5d7568496c0621a9794d280f62e7d3@sslemail.net>
 <8bd5cf31-d9c4-bae7-e18d-1ec01ce22046@citrix.com>
 <ae4e0c1e-a6b2-43fd-9a1a-bbb7417cd2d7@mxnavi.com>
 <cb732731-c271-ca2b-885a-85023c2e5922@citrix.com>
From: chenbaodong <chenbaodong@mxnavi.com>
Message-ID: <521e851c-8029-ee79-9127-b01551158bc9@mxnavi.com>
Date: Wed, 12 Jun 2019 08:51:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <cb732731-c271-ca2b-885a-85023c2e5922@citrix.com>
Content-Language: en-US
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
Subject: Re: [Xen-devel] [PATCH] xen: superficial clean-ups
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
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDYvMTEvMTkgMTg6NTMsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMTEvMDYvMjAxOSAx
MTozMywgY2hlbmJhb2Rvbmcgd3JvdGU6Cj4+IE9uIDYvMTEvMTkgMTc6NDUsIEFuZHJldyBDb29w
ZXIgd3JvdGU6Cj4+PiBPbiAxMS8wNi8yMDE5IDEwOjIwLCBCYW9kb25nIENoZW4gd3JvdGU6Cj4+
Pj4gKiBSZW1vdmUgcmVkdW5kYW50IHNldCAnRE9NRFlJTkdfZGVhZCcKPj4+PiBkb21haW5fY3Jl
YXRlKCkgd2lsbCBzZXQgdGhpcyB3aGVuIGZhaWwsIHRodXMgbm8gbmVlZAo+Pj4+IHNldCBpbiBh
cmNoX2RvbWFpbl9jcmVhdGUoKS4KPj4+IEl0cyBub3QgcmVkdW5kYW50LsKgIEl0IGlzIG5lY2Vz
c2FyeSBmb3IgY29ycmVjdCBjbGVhbnVwLgo+PiBIZWxsbyBBbmRyZXcsCj4+Cj4+IFRoYW5rcyBm
b3IgeW91ciBjb21tZW50cy4KPj4KPj4gWW91ciBjb25jZXJuIGlzOiB3aGVuIHRoZSBhcmNoX2Rv
bWFpbl9jcmVhdGUoKSBmYWlscywKPj4KPj4gc29tZSBjbGVhbnVwIHdvcmsgbmVlZCB0byBkb25l
IGluIHRoaXMgZnVuY3Rpb24uCj4+Cj4+IGFuZCAnRE9NRFlJTkdfZGVhZCcgZmxhZ3MgbWF5YmUg
bmVlZGVkIHRvIGp1ZGdlIGZvciBjb3JyZWN0IGNsZWFudXA/Cj4+Cj4+IElmIHNvLCBpdCdzIG5v
dCByZWR1bmRhbnQuCj4+Cj4+IEknbSBjdXJpb3VzwqAgd2h5ICdET01EWUlOR19kZWFkJyBiZWVu
IHNldCBieSBmYWlsIHBhdGggYm90aCBpbgo+PiBhcmNoX2RvbWFpbl9jcmVhdGUoKQo+Pgo+PiBh
bmQgZG9tYWluX2NyZWF0ZSgpLgo+IEJlY2F1c2UgdmFyaW91cyBjbGVhbnVwIHBhdGhzIEJVR19P
TighZC0+aXNfZHlpbmcpLCBpbmNsdWRpbmcgb25lcwo+IGJlZm9yZSBoaXR0aW5nIHRoZSBtYWlu
IGVycm9yIHBhdGggaW4gZG9tYWluX2NyZWF0ZSgpLgoKVGhhbmtzIGZvciBjbGFyaWZ5LCBteSBm
YXVsdCwgaSBtaXNzZWQgKCFkLT5pc19keWluZykgcmVsYXRlZCBjaGVjay4KCkFuZCB0ZXN0ZWQg
YnkgZm9yY2UgdG8gcnVuIGZhaWwgcGF0aCBpbiBhcmNoX2RvbWFpbl9jcmVhdGUoKSwKCmJ1dCBu
b3RoaW5nIGhhcHBlZCBpbiBhcmNoX2RvbWFpbl9kZXN0b3J5KCkuIHJlc3VsdCBpczoKClBhbmlj
IG9uIENQVSAwOgoKRXJyb3IgY3JlYXRpbmcgZG9tYWluIDAKClNlZW1zIHRoZSBjbGVhbnVwIHBh
dGggcnVuIHdpdGggc3VjY2Vzcy4KCgpBbnl3YXksIGNhbiBsZWF2ZSBpdCBhcyB3aGF0IGl0IHdh
cy4KCj4gfkFuZHJldwo+IC4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
