Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDDF79059
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 18:09:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs8BM-0006iz-Dq; Mon, 29 Jul 2019 16:07:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XvZ0=V2=arm.com=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1hs8BL-0006iq-H8
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 16:07:27 +0000
X-Inumbo-ID: f3b03262-b21a-11e9-8763-87a3a37553ea
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id f3b03262-b21a-11e9-8763-87a3a37553ea;
 Mon, 29 Jul 2019 16:07:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93301337;
 Mon, 29 Jul 2019 09:07:23 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C8663F694;
 Mon, 29 Jul 2019 09:07:22 -0700 (PDT)
Date: Mon, 29 Jul 2019 17:06:43 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
Message-ID: <20190729170643.4ac19952@donnerap.cambridge.arm.com>
In-Reply-To: <6f94e7b0f1cfe98a640d7f9ff59f18f299fd0d7d.1564371527.git.stewart.hildebrand@dornerworks.com>
References: <cover.1564371527.git.stewart.hildebrand@dornerworks.com>
 <6f94e7b0f1cfe98a640d7f9ff59f18f299fd0d7d.1564371527.git.stewart.hildebrand@dornerworks.com>
Organization: ARM
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 1/2] ns16550: Add compatible string for
 Raspberry Pi 4
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
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyOSBKdWwgMjAxOSAwOToxOToxOSAtMDQwMApTdGV3YXJ0IEhpbGRlYnJhbmQgPHN0
ZXdhcnQuaGlsZGVicmFuZEBkb3JuZXJ3b3Jrcy5jb20+IHdyb3RlOgoKSGksCgo+IFBlciB0aGUg
QkNNMjgzNSBwZXJpcGhlcmFscyBkYXRhc2hlZXQgWzFdIHBhZ2UgMTA6Cj4gIlRoZSBVQVJUIGNv
cmUgaXMgYnVpbGQgdG8gZW11bGF0ZSAxNjU1MCBiZWhhdmlvdXIgLi4uIFRoZSBpbXBsZW1lbnRl
ZAo+IFVBUlQgaXMgbm90IGEgMTY2NTAgY29tcGF0aWJsZSBVQVJUIEhvd2V2ZXIgYXMgZmFyIGFz
IHBvc3NpYmxlIHRoZQo+IGZpcnN0IDggY29udHJvbCBhbmQgc3RhdHVzIHJlZ2lzdGVycyBhcmUg
bGFpZCBvdXQgbGlrZSBhIDE2NTUwIFVBUlQuIEFsCj4gMTY1NTAgcmVnaXN0ZXIgYml0cyB3aGlj
aCBhcmUgbm90IHN1cHBvcnRlZCBjYW4gYmUgd3JpdHRlbiBidXQgd2lsbCBiZQo+IGlnbm9yZWQg
YW5kIHJlYWQgYmFjayBhcyAwLiBBbGwgY29udHJvbCBiaXRzIGZvciBzaW1wbGUgVUFSVCByZWNl
aXZlLwo+IHRyYW5zbWl0IG9wZXJhdGlvbnMgYXJlIGF2YWlsYWJsZS4iCj4gCj4gQWRkaXRpb25h
bGx5LCBMaW51eCB1c2VzIHRoZSA4MjUwLzE2NTUwIGRyaXZlciBmb3IgdGhlIGF1eCBVQVJUIFsy
XS4KPiAKPiBVbmZvcnR1bmF0ZWx5IHRoZSBicmNtLGJjbTI4MzUtYXV4LXVhcnQgZGV2aWNlIHRy
ZWUgYmluZGluZyBkb2Vzbid0Cj4gaGF2ZSB0aGUgcmVnLXNoaWZ0IGFuZCByZWctaW8td2lkdGgg
cHJvcGVydGllcyBbM10uIFRodXMsIHRoZSByZWctc2hpZnQKPiBhbmQgcmVnLWlvLXdpZHRoIHBy
b3BlcnRpZXMgYXJlIGluaGVyZW50IHByb3BlcnRpZXMgb2YgdGhpcyBVQVJULgo+IAo+IFRoYW5r
cyB0byBBbmRyZSBQcnp5d2FyYSBmb3IgY29udHJpYnV0aW5nIHRoZSByZWctc2hpZnQgYW5kCj4g
cmVnLWlvLXdpZHRoIHNldHRpbmcgc25pcHBldC4KPiAKPiBJbiBteSB0ZXN0aW5nLCBJIGhhdmUg
cmVsaWVkIG9uIGVuYWJsZV91YXJ0PTEgYmVpbmcgc2V0IGluIGNvbmZpZy50eHQsCj4gYSBjb25m
aWd1cmF0aW9uIGZpbGUgcmVhZCBieSB0aGUgUmFzcGJlcnJ5IFBpJ3MgZmlybXdhcmUuIFdpdGgK
PiBlbmFibGVfdWFydD0xLCB0aGUgZmlybXdhcmUgcGVyZm9ybXMgVUFSVCBpbml0aWFsaXphdGlv
bi4KPiAKPiBbMV0gaHR0cHM6Ly93d3cucmFzcGJlcnJ5cGkub3JnL2RvY3VtZW50YXRpb24vaGFy
ZHdhcmUvcmFzcGJlcnJ5cGkvYmNtMjgzNS9CQ00yODM1LUFSTS1QZXJpcGhlcmFscy5wZGYKPiBb
Ml0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxl
L2xpbnV4LmdpdC90cmVlL2RyaXZlcnMvdHR5L3NlcmlhbC84MjUwLzgyNTBfYmNtMjgzNWF1eC5j
Cj4gWzNdIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9zZXJpYWwvYnJjbSxiY20yODM1LWF1eC11YXJ0LnR4dAo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFN0ZXdhcnQgSGlsZGVicmFuZCA8c3Rld2FydC5oaWxkZWJyYW5kQGRvcm5lcndvcmtz
LmNvbT4KClJldmlld2VkLWJ5OiBBbmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFAYXJtLmNv
bT4KVGVzdGVkLWJ5OiBBbmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFAYXJtLmNvbT4KCkNo
ZWVycywKQW5kcmUuCgo+IC0tLQo+ICB4ZW4vZHJpdmVycy9jaGFyL25zMTY1NTAuYyB8IDcgKysr
KysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBh
L3hlbi9kcml2ZXJzL2NoYXIvbnMxNjU1MC5jIGIveGVuL2RyaXZlcnMvY2hhci9uczE2NTUwLmMK
PiBpbmRleCBlNTE4ZjJkNzkwLi44NjY3ZGU2ZDY3IDEwMDY0NAo+IC0tLSBhL3hlbi9kcml2ZXJz
L2NoYXIvbnMxNjU1MC5jCj4gKysrIGIveGVuL2RyaXZlcnMvY2hhci9uczE2NTUwLmMKPiBAQCAt
MTU4NSw2ICsxNTg1LDEyIEBAIHN0YXRpYyBpbnQgX19pbml0IG5zMTY1NTBfdWFydF9kdF9pbml0
KHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqZGV2LAo+ICAgICAgaWYgKCB1YXJ0LT5yZWdfd2lkdGgg
IT0gMSAmJiB1YXJ0LT5yZWdfd2lkdGggIT0gNCApCj4gICAgICAgICAgcmV0dXJuIC1FSU5WQUw7
Cj4gIAo+ICsgICAgaWYgKCBkdF9kZXZpY2VfaXNfY29tcGF0aWJsZShkZXYsICJicmNtLGJjbTI4
MzUtYXV4LXVhcnQiKSApCj4gKyAgICB7Cj4gKyAgICAgICAgdWFydC0+cmVnX3dpZHRoID0gNDsK
PiArICAgICAgICB1YXJ0LT5yZWdfc2hpZnQgPSAyOwo+ICsgICAgfQo+ICsKPiAgICAgIHJlcyA9
IHBsYXRmb3JtX2dldF9pcnEoZGV2LCAwKTsKPiAgICAgIGlmICggISByZXMgKQo+ICAgICAgICAg
IHJldHVybiAtRUlOVkFMOwo+IEBAIC0xNjExLDYgKzE2MTcsNyBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGR0X2RldmljZV9tYXRjaCBuczE2NTUwX2R0X21hdGNoW10gX19pbml0Y29uc3QgPQo+ICAg
ICAgRFRfTUFUQ0hfQ09NUEFUSUJMRSgibnMxNjU1MCIpLAo+ICAgICAgRFRfTUFUQ0hfQ09NUEFU
SUJMRSgibnMxNjU1MGEiKSwKPiAgICAgIERUX01BVENIX0NPTVBBVElCTEUoInNucHMsZHctYXBi
LXVhcnQiKSwKPiArICAgIERUX01BVENIX0NPTVBBVElCTEUoImJyY20sYmNtMjgzNS1hdXgtdWFy
dCIpLAo+ICAgICAgeyAvKiBzZW50aW5lbCAqLyB9LAo+ICB9Owo+ICAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
