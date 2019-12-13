Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAA811DDE7
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 06:45:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifdjJ-0007El-EZ; Fri, 13 Dec 2019 05:43:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nbPo=2D=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ifdjI-0007Eg-Jm
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 05:43:08 +0000
X-Inumbo-ID: 6b0f2cda-1d6b-11ea-88e7-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b0f2cda-1d6b-11ea-88e7-bc764e2007e4;
 Fri, 13 Dec 2019 05:42:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E4477ACAE;
 Fri, 13 Dec 2019 05:42:57 +0000 (UTC)
To: Steven Haigh <netwiz@crc.id.au>, xen-devel@lists.xenproject.org
References: <cover.1576209614.git.netwiz@crc.id.au>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <ace3fff2-41fc-9887-5f7b-e85f9497b3ae@suse.com>
Date: Fri, 13 Dec 2019 06:42:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <cover.1576209614.git.netwiz@crc.id.au>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 0/2] [PATCH-for-4.13] Work towards
 removing brctl
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTIuMTkgMDU6MDgsIFN0ZXZlbiBIYWlnaCB3cm90ZToKPiBTdGFydCB1cGRhdGluZyBz
Y3JpcHRzIGZvciBuZXR3b3JrIGZ1bmN0aW9uYWxpdHkKPiAKPiAoUmVzZW5kaW5nIGFzIHRoZSBw
YXRjaCBlbWFpbHMgc2VlbSB0byBoYXZlIGJlZW4gZWF0ZW4gc29tZXdoZXJlKQo+IAo+IFRoZSBz
Y3JpcHRzIGZvciBuZXR3b3JraW5nIGluIFhlbiBoYXZlIGEgbWl4dHVyZSBvZiBmb3JtYXR0aW5n
LAo+IHRhYiBzcGFjaW5nLCBzcGFjZSBzcGFjaW5nIGluY29uc2lzdGVuY2llcy4KPiAKPiBXZSBh
bHNvIGhhdmUgaXNzdWVzIHdoZXJlIENlbnRPUyA4IGRvZXMgbm90IGhhdmUgYnJjdGwgLSBiZWlu
Zwo+IHJlcGxhY2VkIHdpdGggaXAgLyBicmlkZ2UgY29tbWFuZHMuCj4gCj4gVGhpcyBzZXJpZXMg
c3RhcnRzIGNsZWFuaW5nIHVwIHdoaXRlc3BhY2UgYW5kIGZvcm1hdHRpbmcsIGFzIHdlbGwKPiBh
cyBzdGFydHMgYWRkaW5nIGNvbmRpdGlvbmFscyBmb3IgdXNpbmcgYnJjdGwgKGlmIHByZXNlbnQp
IGJ1dCB1c2luZwo+IGlwIGlmIC91c3Ivc2Jpbi9icmN0bCBpcyBub3QgaW5zdGFsbGVkLgo+IAo+
IENoYW5nZXMgc2luY2UgdjEKPiAgICAqIEZpeGVkIHJlZmVyZW5jZSB0byAvdXNyL2Jpbi9icmN0
bCBpbnN0ZWFkIG9mIC91c3Ivc2Jpbi9icmN0bAo+IAo+IFN0ZXZlbiBIYWlnaCAoMik6Cj4gICAg
VGlkeSB1cCB3aGl0ZXNwYWNlIGFuZCBmb3JtYXR0aW5nIGluIGZpbGUgdG8gYmUgY29uc2lzdGVu
dC4KPiAgICBVc2UgaXAgZm9yIGJyaWRnZSByZWxhdGVkIGZ1bmN0aW9ucyB3aGVyZSBicmN0bCBp
cyBub3QgcHJlc2VudAo+IAo+ICAgdG9vbHMvaG90cGx1Zy9MaW51eC9jb2xvLXByb3h5LXNldHVw
ICAgICAgfCAgMzAgKysrLS0KPiAgIHRvb2xzL2hvdHBsdWcvTGludXgvdmlmLWJyaWRnZSAgICAg
ICAgICAgIHwgIDE5ICsrLQo+ICAgdG9vbHMvaG90cGx1Zy9MaW51eC92aWYyICAgICAgICAgICAg
ICAgICAgfCAgMTIgKy0KPiAgIHRvb2xzL2hvdHBsdWcvTGludXgveGVuLW5ldHdvcmstY29tbW9u
LnNoIHwgMTUxICsrKysrKysrKysrLS0tLS0tLS0tLS0KPiAgIDQgZmlsZXMgY2hhbmdlZCwgMTIx
IGluc2VydGlvbnMoKyksIDkxIGRlbGV0aW9ucygtKQo+IAoKQXMgdGhpcyBpcyBubyA0LjEzIHJl
Z3Jlc3Npb24gaXRzIHRvbyBsYXRlIGZvciB0aGUgcGF0Y2hlcyB0byBtYWtlIGl0CmludG8gNC4x
Mywgc29ycnkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
