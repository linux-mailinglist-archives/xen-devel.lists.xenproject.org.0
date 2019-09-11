Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AAEAF8DE
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 11:27:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7yrb-0001lM-HL; Wed, 11 Sep 2019 09:24:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/an7=XG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7yrZ-0001lG-GC
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 09:24:33 +0000
X-Inumbo-ID: f679b9aa-d475-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f679b9aa-d475-11e9-b299-bc764e2007e4;
 Wed, 11 Sep 2019 09:24:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 14A44B062;
 Wed, 11 Sep 2019 09:24:31 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190911062001.25931-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c29e4609-5948-760d-2143-75d51e42d36d@suse.com>
Date: Wed, 11 Sep 2019 11:24:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190911062001.25931-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH 0/5] Add hypervisor sysfs-like support
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDkuMjAxOSAwODoxOSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiB0aGUgMjAxOSBY
ZW4gZGV2ZWxvcGVyIHN1bW1pdCB0aGVyZSB3YXMgYWdyZWVtZW50IHRoYXQgdGhlIFhlbgo+IGh5
cGVydmlzb3Igc2hvdWxkIGdhaW4gc3VwcG9ydCBmb3IgYSBoaWVyYXJjaGljYWwgbmFtZS12YWx1
ZSBzdG9yZQo+IHNpbWlsYXIgdG8gdGhlIExpbnV4IGtlcm5lbCdzIHN5c2ZzLgo+IAo+IFRoaXMg
aXMgYSBmaXJzdCBpbXBsZW1lbnRhdGlvbiBvZiB0aGF0IGlkZWEgYWRkaW5nIHRoZSBiYXNpYwo+
IGZ1bmN0aW9uYWxpdHkgdG8gaHlwZXJ2aXNvciBhbmQgdG9vbHMgc2lkZS4gVGhlIGludGVyZmFj
ZSB0byBhbnkKPiB1c2VyIHByb2dyYW0gbWFraW5nIHVzZSBvZiB0aGF0ICJ4ZW4tc3lzZnMiIGlz
IGEgbmV3IGxpYnJhcnkKPiAibGlieGVuZnMiIHdpdGggYSBzdGFibGUgaW50ZXJmYWNlLgo+IAo+
IFRoZXJlIGFyZSBzdGlsbCBzb21lIHBlbmRpbmcgcXVlc3Rpb25zLCB0aG9zZSBhcmU6Cj4gCj4g
LSBhY2Nlc3MgcmlnaHRzOgo+ICAgKyBzaG91bGQgd2UgYWxsb3cgYWNjZXNzIHRvIGRvbTAgb25s
eSwgb3IgdG8gYWxsIGRvbWFpbnMsIG9yIHNob3VsZAo+ICAgICB0aGF0IGJlIHBvc3NpYmxlIHRv
IHNldCBwZXIgZW50cnk/CgpEb20wIG9ubHkgZm9yIG5vdywgSSdkIHNheS4gQnV0IGlmIHBvc3Np
YmxlIGRvbid0IHB1dCBpbiByb2FkIGJsb2NrcwptYWtpbmcgcmVsYXhpbmcgdGhpcyBtb3JlIGRp
ZmZpY3VsdC4KCj4gICArIGhvdyB0byBpbnRlZ3JhdGUgd2l0aCB4c20/CgpXaGVuIERvbTAgb25s
eSwgcGVyaGFwcyBub3QgbmVlZGVkIG1vcmUgdGhhbiB3aXJpbmcgdGhpcyB0aHJvdWdoIHRoZQpz
YW1lIGhvb2sgYXMgZS5nLiB0aGUgc3lzY3RsLXMgdXNlPwoKPiAtIGR5bmFtaWNhbCBlbnRyaWVz
Ogo+ICAgKyBkbyB3ZSB3YW50IHN1cHBvcnQgZm9yIGUuZy4gcGVyLWRvbWFpbiBhbmQvb3IgcGVy
LWNwdXBvb2wgZW50cmllcz8KCkRvd24gdGhlIHJvYWQgLSBwZXJoYXBzLgoKPiAgICsgZG8gd2Ug
d2FudCBzdXBwb3J0IGZvciBkZWJ1ZyBhaWRzIChsb2NrLXByb2ZpbGluZywgZGVidWd0cmFjZSAu
Lik/CgpTZWVpbmcgeW91IGludHJvZHVjZSBhIGZpbGUgc3lzdGVtIGFic3RyYWN0aW9uLCBoYXZl
IHN1Y2ggZ28gdGhyb3VnaAphIGRlYnVnZnMtbGlrZSBvbmU/Cgo+IC0gd3JpdGUgYWNjZXNzOgo+
ICAgKyBydW50aW1lIHBhcmFtZXRlcnM/Cj4gICArIGRlYnVnZ2luZyBhaWRzPwoKRm9yIGJvdGgg
LSBkb3duIHRoZSByb2FkLCBwZXJoYXBzLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
