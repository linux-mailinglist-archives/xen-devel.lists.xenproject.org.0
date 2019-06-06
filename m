Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDA536F18
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 10:50:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYo3c-0004Eq-2C; Thu, 06 Jun 2019 08:47:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2G1I=UF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hYo3a-0004El-Vl
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 08:47:35 +0000
X-Inumbo-ID: b9b09773-8837-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id b9b09773-8837-11e9-8980-bc764e045a96;
 Thu, 06 Jun 2019 08:47:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F129B341;
 Thu,  6 Jun 2019 01:47:32 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFB243F690;
 Thu,  6 Jun 2019 01:47:31 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <osstest-136184-mainreport@xen.org>
 <20190516103727.GB5438@perard.uk.xensource.com>
 <c576ae9d-4a6e-1602-7f05-6fc2c7b26314@arm.com>
 <20190517172344.GE1245@perard.uk.xensource.com>
 <d2ac0071-149e-0c03-016c-d9ad2a423f5e@arm.com>
 <9df7707d-8aa4-2abf-d7c3-0fd101ec3e68@arm.com>
 <20190603171558.GF2126@perard.uk.xensource.com>
 <5CF618900200007800234E5F@prv1-mh.provo.novell.com>
 <5d8eac54-2c4d-3003-4017-0672716d0581@arm.com>
 <alpine.DEB.2.21.1906041000590.14041@sstabellini-ThinkPad-T480s>
 <014113e2-1481-ce57-1807-2cfa01a3a177@arm.com>
 <alpine.DEB.2.21.1906041026110.14041@sstabellini-ThinkPad-T480s>
 <7af8e9d1-6f60-f3b4-9201-2b84f1cf6886@arm.com>
 <alpine.DEB.2.21.1906041508520.14041@sstabellini-ThinkPad-T480s>
 <986b7bb5-f223-f91a-ddc5-96dc3ee69b17@arm.com>
 <alpine.DEB.2.21.1906051313570.14041@sstabellini-ThinkPad-T480s>
 <8acdb27d-dd3b-44af-5763-efbad3c1b554@arm.com>
 <5CF8D1EA0200007800235CBF@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <fc26793a-9af5-ac4d-6b39-cec4dba34270@arm.com>
Date: Thu, 6 Jun 2019 09:47:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CF8D1EA0200007800235CBF@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [qemu-upstream-4.11-testing test] 136184:
 regressions - FAIL
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
 Ian Jackson <ian.jackson@citrix.com>,
 osstest service owner <osstest-admin@xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwNi8wNi8yMDE5IDA5OjQyLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAwNS4wNi4x
OSBhdCAyMzozOCwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gT24gNi81LzE5IDk6
MjkgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+IE15IHZvdGUgaXMgdG8gYmFja3Bv
cnQgdG8gYm90aC4gSmFuL290aGVycyBwbGVhc2UgZXhwcmVzcyB5b3VyIG9waW5pb24uCj4+Cj4+
IFRvIGZvbGxvdyB0aGUgdm90ZSBjb252ZW50aW9uOgo+Pgo+PiA0LjExOiAtMQo+IAo+IEhtbSwg
SSdtIHN1cnByaXNlZCBieSB0aGlzLiBEaWRuJ3QgSSBzZWUgeW91IG1lbnRpb24gdG8gSWFuIChv
biBpcmMpCj4geW91J2QgcHJlZmVyIGJhY2twb3J0aW5nIG92ZXIgd29ya2luZyBhcm91bmQgdGhp
cyBpbiBvc3N0ZXN0PwoKTXkgbWlzdGFrZSBoZXJlLiBJdCBzaG91bGQgYmUgKzEgaGVyZS4KCj4g
Cj4+IDQuMTA6IC0xIChJIHdhcyB0ZW1wdGVkIGJ5IGEgLTIgYnV0IGlmIHRoZSBvdGhlciBmZWVs
cyBpdCBzaG91bGQgYmUKPj4gYmFja3BvcnRlZCB0aGVuIEkgd2lsbCBub3QgcHVzaCBiYWNrKS4K
PiAKPiBDb25zaWRlcmluZyB0aGUgc2l0dWF0aW9uLCBJJ20gbGVhbmluZyB0b3dhcmRzIEp1bGll
bidzIG9waW5pb24gaGVyZS4KPiBCdXQgdGFrZSB0aGlzIHdpdGggY2FyZSAtIEkgaGF2ZSB3YXkg
dG9vIGxpdHRsZSBpbnNpZ2h0IHRvIGhhdmUgYQo+IG1lYW5pbmdmdWwgb3Bpbmlvbi4KPiAKPiBK
YW4KPiAKPiAKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
