Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B686B35D87
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 15:09:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYVds-0005BS-0z; Wed, 05 Jun 2019 13:07:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=73hT=UE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYVdq-0005BN-MN
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 13:07:46 +0000
X-Inumbo-ID: e8c6025e-8792-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e8c6025e-8792-11e9-8980-bc764e045a96;
 Wed, 05 Jun 2019 13:07:45 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 05 Jun 2019 07:07:44 -0600
Message-Id: <5CF7BE9A0200007800235895@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 05 Jun 2019 07:07:38 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Ian Jackson" <ian.jackson@citrix.com>
References: <E3AA6DAA6DCE974798849C41CE0968F8@citrix.com>
 <20190605111356.10429-2-ian.jackson@eu.citrix.com>
 <5CF7A5A802000078002357E8@prv1-mh.provo.novell.com>
 <aeb9f88b-f260-b125-02a0-5d22c6ff3b1c@arm.com><aeb9f88b-f260-b125-02a0-5d22c6ff3b1c@arm.com>,
 <5CF7A5A802000078002357E8@prv1-mh.provo.novell.com>
 <23799.43045.610265.697616@mariner.uk.xensource.com>
In-Reply-To: <23799.43045.610265.697616@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [OSSTEST PATCH 2/2] RFC: enable CONFIG_LIVEPATCH in
 all relevant arm64 builds [and 1 more messages]
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA1LjA2LjE5IGF0IDEzOjMxLCA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4gd3JvdGU6
Cj4gSSBzdGlsbCB0aGluayBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gZml4IHRoaXMgaW4gdGhlIFhl
biBjb2RlLgoKRnVsbHkgYWdyZWUuIEJ1dCBhcyBKdWxpZW4gc2F5cyAtIGZ1bGx5IGZpeGluZyB0
aGlzIG1heSBiZSB0b28gaW50cnVzaXZlCmZvciBvbGQgYnJhbmNoZXMgKHByb3ZpZGVkIGl0IGdl
dHMgZml4ZWQgb24gbWFzdGVyIGF0IGFsbCkuCgo+IFdvdWxkIGl0IGJlIHBvc3NpYmxlIHRvIG1h
a2Ugd2hldGhlciB0byBkbyAid3JvbmcgdGhpbmcgQSIgKHdoaWNoIGRvZXMKPiBub3QgYm9vdCBv
biByb2Noc3Rlcikgb3IgIndyb25nIHRoaW5nIEIiICh3aGljaCBib290cyBvbiByb2NoZXN0ZXIg
YnV0Cj4gbm90IG9uIHNvbWUgb3RoZXIgdW5rbm93biBtYWNoaW5lKHMpKSBhIGNvbmZpZyBvciBi
b290LXRpbWUgb3B0aW9uID8KClNpbmNlIGl0J3MgYXBwYXJlbnRseSBYZW4gaW1hZ2UgZGVwZW5k
ZW50LCBhIGJvb3QgdGltZSBvcHRpb24gc2VlbXMKdW5saWtlbHkgdG8gYmUgYSBwb3NzaWJpbGl0
eS4gQSBjb25maWcgb3B0aW9uIG1pZ2h0IGJlIHBvc3NpYmxlLCBidXQgdGhhdCwKYXMgeW91IHNh
eSBlbHNld2hlcmUgb24gYW5vdGhlciBhc3BlY3QsIHNlZW1zIHJpZGljdWxvdXMuIEJ1dCBpbiB0
aGUKZW5kIHRoZSBBcm0gbWFpbnRhaW5lcnMgd2lsbCBrbm93IGJlc3QuLi4KCkphbgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
