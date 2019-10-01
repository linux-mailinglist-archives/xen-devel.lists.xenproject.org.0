Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54591C301C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 11:24:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFEMo-0005On-6s; Tue, 01 Oct 2019 09:22:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=itvi=X2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iFEMn-0005Oi-9k
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 09:22:45 +0000
X-Inumbo-ID: 0657b1bc-e42d-11e9-8628-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 0657b1bc-e42d-11e9-8628-bc764e2007e4;
 Tue, 01 Oct 2019 09:22:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EA813B642;
 Tue,  1 Oct 2019 09:22:43 +0000 (UTC)
To: Julien Grall <julien.grall@arm.com>
References: <20190930182437.25478-1-andrew.cooper3@citrix.com>
 <20190930182437.25478-3-andrew.cooper3@citrix.com>
 <6121ff6c-f7fb-f766-ffb0-7a5f52ddf997@arm.com>
 <9211e84c-fbf8-5a35-e898-23a58e3bd4cb@citrix.com>
 <2ce8fb9f-d365-cabf-6a98-e61ac525d4e5@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3c901636-732f-446e-8a64-94149939d175@suse.com>
Date: Tue, 1 Oct 2019 11:22:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2ce8fb9f-d365-cabf-6a98-e61ac525d4e5@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 2/2] xen/nospec: Introduce
 CONFIG_SPECULATIVE_BRANCH_HARDEN and disable it
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Norbert Manthey <nmanthey@amazon.de>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMTAuMjAxOSAxMToxNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDAxLzEwLzIwMTkg
MDA6MjEsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IE9uIDMwLzA5LzIwMTkgMjE6MTcsIEp1bGll
biBHcmFsbCB3cm90ZToKPj4+IE15IHdvcnJ5IGlzIHRoaXMgZ2F0ZSBjb25maWcgZ2F0ZSBub3Ro
aW5nIG9uIEFybSBzbyB0aGUgdXNlciBtYXkgaGF2ZQo+Pj4gYSBmYWxzZSBzZW5zZSB0aGF0IGl0
IGNhbiBiZSB1c2VkIChldmVuIHRob3VnaCBpdCBpcyBjbGVhcmx5IEJST0tFTikuCj4+Pgo+Pj4g
QWxzbyB0aGUgbmFtZSBpcyBxdWl0ZSBjbG9zZSB0byB0aGUgQ09ORklHX0hBUkRFTl9QUkVESUNU
T1Igb24gQXJtIGFuZAo+Pj4gbWF5IGNvbmZ1c2UgdXNlci4gQWx0aG91Z2gsIEkgZG9uJ3QgaGF2
ZSBhIGJldHRlciBuYW1lIHNvIGZhciA6Lwo+Pgo+PiBUaGUgImRlcGVuZHMgb24gQlJPS0VOIiBt
ZWFucyBpdCB3aWxsIG5ldmVyIHNob3cgdXAgdG8gYSB1c2VyIGluCj4+IG1lbnVjb25maWcsIHdo
aWNoIGlzIHdoeSBpdCB3YXMgb25seSBDQyB0byB4ODYsIGFuZCBub3QgdG8gcmVzdC4KPiAKPiBX
aGF0J3MgdGhlIGxvbmcgdGVybSBwbGFuIGZvciB0aGlzIG9wdGlvbj8gQXJlIHlvdSBwbGFubmlu
ZyB0byByZW1vdmUgaXQgCj4gY29tcGxldGVseSBvciBqdXN0IHRoZSBkZXBlbmRlbmNpZXMgb24g
QlJPS0VOPwo+IAo+IE15IGNvbmNlcm4gaXMgaWYgdGhpcyBvcHRpb24gd2lsbCBldmVyIGJlY29t
ZSBzZWxlY3RhYmxlIHRoZW4gaXQgd2lsbCBub3QgZG9pbmcgCj4gd2hhdCdzIGV4cGVjdGVkIG9u
IEFybS4KPiAKPiBTbywgZXZlbiBpZiBpbiBwcmluY2lwbGUgaXQgaXMgYXJjaCBhZ25vc3RpYywg
aXQgZmVlbHMgdG8gbWUgdGhpcyBvcHRpb24gc2hvdWxkIAo+IGJldHRlciBiZSBpbXBsZW1lbnRl
ZCBpbiB4ODYvS2NvbmZpZy4KCkkgZG9uJ3QgdGhpbmsgc28sIG5vLiBXaGVuIEJST0tFTiBpcyB0
byBiZSByZW1vdmVkLCBpdCBvdWdodCB0byBiZQpyZXBsYWNlZCBieSBhIHN1aXRhYmxlICJkZXBl
bmRzIG9uIEhBVkVfKiIsIHdoaWNoIEFybSBjb3VsZCBjaG9vc2UKdG8gbm90IHNlbGVjdC4KCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
