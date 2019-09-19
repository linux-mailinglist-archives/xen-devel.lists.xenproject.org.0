Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA684B762D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 11:24:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAsdj-0008AZ-Tz; Thu, 19 Sep 2019 09:22:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ts4K=XO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iAsdi-0008AO-6k
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 09:22:14 +0000
X-Inumbo-ID: f6b69524-dabe-11e9-9651-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id f6b69524-dabe-11e9-9651-12813bfff9fa;
 Thu, 19 Sep 2019 09:22:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A369B337;
 Thu, 19 Sep 2019 02:22:12 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 233AB3F575;
 Thu, 19 Sep 2019 02:22:11 -0700 (PDT)
To: Lars Kurth <lars.kurth@citrix.com>,
 "Wieczorkiewicz, Pawel" <wipawel@amazon.de>,
 Ian Jackson <Ian.Jackson@citrix.com>
References: <20190918073538.24707-1-wipawel@amazon.de>
 <9c5a2063-35ab-5590-a079-9f361d95f7ee@suse.com>
 <2FFA152B-47AB-4C0E-9747-66B2D9EDFCAA@amazon.com>
 <e14a8a90-0afa-ebdd-ce70-be7896e9b612@arm.com>
 <23938.2492.424579.175738@mariner.uk.xensource.com>
 <4134F5DE-6497-4F32-9A5F-866E4D6C0735@amazon.com>
 <DE970A9E-2639-4903-98C0-D61D1186B584@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <dd7dd06c-0241-991e-7e94-ee465d7134ca@arm.com>
Date: Thu, 19 Sep 2019 10:22:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <DE970A9E-2639-4903-98C0-D61D1186B584@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] create-diff-object: more precisely identify
 .rodata sections
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
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, "Pohlack,
 Martin" <mpohlack@amazon.de>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgTGFycywKCk9uIDE4LzA5LzIwMTkgMTI6NTAsIExhcnMgS3VydGggd3JvdGU6Cj4gCj4gCj4g
77u/T24gMTgvMDkvMjAxOSwgMTE6NDQsICJXaWVjem9ya2lld2ljeiwgUGF3ZWwiIDx3aXBhd2Vs
QGFtYXpvbi5kZT4gd3JvdGU6Cj4gCj4gICAgICA+IE9uIDE4LiBTZXAgMjAxOSwgYXQgMTI6NDEs
IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBjaXRyaXguY29tPiB3cm90ZToKPiAgICAgID4KPiAg
ICAgID4gSnVsaWVuIEdyYWxsIHdyaXRlcyAoIlJlOiBbUEFUQ0hdIGNyZWF0ZS1kaWZmLW9iamVj
dDogbW9yZSBwcmVjaXNlbHkgaWRlbnRpZnkgLnJvZGF0YSBzZWN0aW9ucyIpOgo+ICAgICAgPj4g
T24gMTgvMDkvMjAxOSAxMDo1MiwgV2llY3pvcmtpZXdpY3osIFBhd2VsIHdyb3RlOgo+ICAgICAg
Pj4+ICQgc2NyaXB0cy8uL2FkZF9tYWludGFpbmVycy5wbCAtZCB+L2dpdC9saXZlcGF0Y2gtYnVp
bGQtdG9vbHMKPiAgICAgID4+Cj4gICAgICA+PiAnLWQnIG9ubHkgdGVsbHMgeW91IHdoZXJlIHRo
ZSBwYXRjaGVzIGZpbGVzIGFyZS4gVGhlIHNjcmlwdCB3aWxsIGxvb2sgdXAgZm9yIHRoZQo+ICAg
ICAgPj4gTUFJTlRBSU5FUlMgZmlsZSBpbiB0aGUgY3VycmVudCBkaXJlY3RvcnkuCj4gICAgICA+
Cj4gICAgICA+IEhtbW0uICBJIHdvbmRlciBpZiB3ZSBjb3VsZCBkZXRlY3QgdGhpcyBzaXR1YXRp
b24gc29tZWhvdy4gIFRoaXMgd2lsbAo+ICAgICAgPiBiZSBhIGNvbW1vbiB1c2VyIGVycm9yIEkg
dGhpbmsuCj4gCj4gSSBkb24ndCB0aGluayBpdCBpcyBwb3NzaWJsZSB0byBkZXRlY3QgdGhhdCBz
aXR1YXRpb24gYXMgZ2l0IGZvcm1hdC1wYXRjaCBkb2VzIG5vdCB0ZWxsIHlvdSB3aGljaCB0cmVl
IGEgcGF0Y2ggd2FzIGdlbmVyYXRlZCBmcm9tLgo+ICAgICAgCj4gICAgICBJIHNob3VsZCBoYXZl
IGxvb2tlZCB0d2ljZSBiZWZvcmUgc2VuZGluZyB0aGUgcGF0Y2ggb3V0LiBCdXQsIHdoYXQgd291
bGQgYmUgdmVyeSBoZWxwZnVsIGZvciBtZQo+ICAgICAgaXMgYWRkaXRpb25hbCBvcHRpb24gdG8g
dGhlIGFkZF9tYWludGFpbmVycy5wbCBzY3JpcHQgbGlrZTogLW0gLi9NQUlOVEFJTkVSUwo+ICAg
ICAgCj4gSW4gbXkgdmlldyB0aGlzIGlzIG9ubHkgcmVhbGx5IGFuIGlzc3VlIGlmIHlvdSBjcmVh
dGUgYSBwYXRjaCBvciBzZXJpZXMgYW5kIHRoZW4gZG8gc29tZXRoaW5nIGVsc2UgYmVmb3JlIGZp
bmFsaXppbmcgYW5kIHNlbmRpbmcgdGhlIHBhdGNoLCBvdGhlcndpc2UgSSB3b3VsZCBoYXZlIHRy
aXBwZWQgb3ZlciB0aGlzIG15c2VsZi4gQnV0IG9mIGNvdXJzZSwgaWYgeW91IHdvcmsgb24gbXVs
dGlwbGUgc2VyaWVzIGF0IHRoZSBzYW1lIHRpbWUgdGhhdCBpcyBhbiBlYXN5IG1pc3Rha2UgdG8g
bWFrZS4KPiAKPiBJIHdvdWxkIGV4cGVjdCB0aGF0IHRoZSBtb3N0IGNvbW1vbiBkaXJlY3Rvcnkg
c3RydWN0dXJlIGZvciBwZW9wbGUgaXMgdG8gaGF2ZSBhIGRpcmVjdG9yeSBzdHJ1Y3R1cmUgc3Vj
aCBhcwo+IH4vY29kZS94ZW4uZ2l0Cj4gfi9jb2RlL2xpdmVwYXRjaC1idWlsZC10b29scwo+IC4u
Lgo+IH4vY29kZS9wYXRjaGVzCj4gCj4gYW5kIHRoYXQgcGVvcGxlIHN3aXRjaCBiZXR3ZWVuIGdp
dCBkaXJlY3Rvcmllcy4gTG9va2luZyBhdCB0aGUgY29kZSwgSSBzaG91bGQgYmUgYWJsZSB0byBh
ZGQgYSAtbSBvcHRpb24sIHdoaWNoIHdvdWxkIHdvcmsgb3V0IHRoZSBkaXJlY3RvcnkgaW4gd2hp
Y2ggTUFJTlRBSU5FUlMgaXMsIHRoZW4gc3dpdGNoIHRvIGl0LCBkbyB0aGUgcHJvY2Vzc2luZyBh
bmQgc3dpdGNoIGJhY2sgdG8gd2hlcmUgd2Ugc3RhcnRlZCBmcm9tLgo+IAo+IEhvd2V2ZXIsIHRo
aXMgd291bGQgb25seSByZWFsbHkgd29yaywgaWYgdGhlcmUgd2FzIGEgc3Ryb25nIHJlY29tbWVu
ZGF0aW9uIGluIGh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL1N1Ym1pdHRpbmdfWGVu
X1Byb2plY3RfUGF0Y2hlcyNVc2luZ19hZGRfbWFpbnRhaW5lcnMucGxfLjI4b3JfZ2V0X21haW50
YWluZXIucGwuMjlfZnJvbV9vdXRzaWRlX29mX3hlbi5naXQgdGVsbGluZyBwZW9wbGUgdG8gdXNl
IC1tICRwYXRoL01BS0VGSUxFIHdoZW4gd29ya2luZyBvbiBtdWx0aXBsZSBkaXJlY3RvcmllcwoK
SSBkb24ndCByZWFsbHkgc2VlIGFueSBhZHZhbnRhZ2Ugb2YgdGhpcyBvcHRpb24gaWYgeW91IHN0
aWxsIGFsbG93IGFzIGEgZmFsbGJhY2sgCnRvIHJ1biBvbiB0aGUgY3VycmVudCBkaXJlY3Rvcnku
CgpPaywgdGhlIHVzZXIgaXMgc2F2aW5nIDIgaW5zdHJ1Y3Rpb25zLCBidXQgdGhlcmUgYXJlIHN0
aWxsIHdheSBmb3IgdGhhdCB1c2VycyB0byAKbWVzcyBpdCB1cCBzdWNoIGFzIGl0IG1heSBmb3Jn
ZXQgdGhlIC1tIG9wdGlvbiBiZWNhdXNlIGl0IG1pc3JlYWQgdGhlIHdpa2kuCgpTbyBJIHdvdWxk
IHN0cm9uZ2x5IHN1Z2dlc3QgdG8gZWl0aGVyIGRyb3AgdGhlIGZhbGxiYWNrIG9yIG5vdCBhZGRp
bmcgYSBuZXcgb3B0aW9uLgoKRnVydGhlcm1vcmUsIGlmIHlvdSBsZXQgdGhlIHVzZXIgc3BlY2lm
aWMgdGhlIGV4aXN0aW5nIE1BSU5UQUlORVJTIGZpbGUsIHRoZW4gCmhlL3NoZSBtaWdodCBhcyB3
ZWxsIHBhc3Mgc29tZXRoaW5nIGRpZmZlcmVudCAobGlrZSBNQUtFRklMRSBpbiB5b3VyIGV4YW1w
bGUgCjspKS4gSXQgd291bGQgYmUgYmVzdCBpZiB0aGUgdXNlcnMgaXMgbm90IGFsbG93IHRvIGdp
dmUgYW55dGhpbmcgZWxzZSB0aGFuIApNQUlOVEFJTkVSUy4KCkNoZWVycywKCi0tIApKdWxpZW4g
R3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
