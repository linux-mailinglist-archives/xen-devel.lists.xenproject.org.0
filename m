Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BE538760
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2019 11:51:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hZBUb-0005gn-Rg; Fri, 07 Jun 2019 09:49:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8c+z=UG=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hZBUa-0005gh-5Q
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2019 09:49:00 +0000
X-Inumbo-ID: 7795fd4a-8909-11e9-a26c-174b2762ec1b
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 7795fd4a-8909-11e9-a26c-174b2762ec1b;
 Fri, 07 Jun 2019 09:48:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08CFC344;
 Fri,  7 Jun 2019 02:33:22 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3AE943F96A;
 Fri,  7 Jun 2019 02:33:21 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <osstest-136184-mainreport@xen.org>
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
 <fc26793a-9af5-ac4d-6b39-cec4dba34270@arm.com>
 <alpine.DEB.2.21.1906061359010.10214@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <2dcdb5cb-69c5-16df-35db-7d90c74e7f23@arm.com>
Date: Fri, 7 Jun 2019 10:33:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906061359010.10214@sstabellini-ThinkPad-T480s>
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
 Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDA2LzA2LzIwMTkgMjM6MjEsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBUaHUsIDYgSnVuIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gT24gMDYvMDYv
MjAxOSAwOTo0MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAwNS4wNi4xOSBhdCAyMzoz
OCwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+PiBPbiA2LzUvMTkgOToyOSBQTSwg
U3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+Pj4+PiBNeSB2b3RlIGlzIHRvIGJhY2twb3J0IHRv
IGJvdGguIEphbi9vdGhlcnMgcGxlYXNlIGV4cHJlc3MgeW91ciBvcGluaW9uLgo+Pj4+Cj4+Pj4g
VG8gZm9sbG93IHRoZSB2b3RlIGNvbnZlbnRpb246Cj4+Pj4KPj4+PiA0LjExOiAtMQo+Pj4KPj4+
IEhtbSwgSSdtIHN1cnByaXNlZCBieSB0aGlzLiBEaWRuJ3QgSSBzZWUgeW91IG1lbnRpb24gdG8g
SWFuIChvbiBpcmMpCj4+PiB5b3UnZCBwcmVmZXIgYmFja3BvcnRpbmcgb3ZlciB3b3JraW5nIGFy
b3VuZCB0aGlzIGluIG9zc3Rlc3Q/Cj4+Cj4+IE15IG1pc3Rha2UgaGVyZS4gSXQgc2hvdWxkIGJl
ICsxIGhlcmUuCj4+Cj4+Pj4gNC4xMDogLTEgKEkgd2FzIHRlbXB0ZWQgYnkgYSAtMiBidXQgaWYg
dGhlIG90aGVyIGZlZWxzIGl0IHNob3VsZCBiZQo+Pj4+IGJhY2twb3J0ZWQgdGhlbiBJIHdpbGwg
bm90IHB1c2ggYmFjaykuCj4+Pgo+Pj4gQ29uc2lkZXJpbmcgdGhlIHNpdHVhdGlvbiwgSSdtIGxl
YW5pbmcgdG93YXJkcyBKdWxpZW4ncyBvcGluaW9uIGhlcmUuCj4+PiBCdXQgdGFrZSB0aGlzIHdp
dGggY2FyZSAtIEkgaGF2ZSB3YXkgdG9vIGxpdHRsZSBpbnNpZ2h0IHRvIGhhdmUgYQo+Pj4gbWVh
bmluZ2Z1bCBvcGluaW9uLgo+IAo+IEFsbCByaWdodC4gSSBiYWNrcG9ydGVkIHRoZSBwYXRjaCB0
byBzdGFnaW5nLTQuMTEgb25seS4KClRoYW5rIHlvdSEgSSB3aWxsIHdhdGNoIHRoZSBuZXh0IG9z
c3Rlc3QgZmxpZ2h0IGZvciBxZW11LXVwc3RyZWFtLTQuMTEgYW5kIHNlZSAKaWYgaXQgYm9vdHMu
CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
