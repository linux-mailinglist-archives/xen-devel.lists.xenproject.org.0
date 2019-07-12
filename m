Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 867DA67228
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2019 17:16:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlxEv-00089g-W7; Fri, 12 Jul 2019 15:13:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=F70t=VJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hlxEu-00089b-Pk
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2019 15:13:36 +0000
X-Inumbo-ID: 9d2c84ba-a4b7-11e9-b17c-e733ac8d1526
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 9d2c84ba-a4b7-11e9-b17c-e733ac8d1526;
 Fri, 12 Jul 2019 15:13:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 510182B;
 Fri, 12 Jul 2019 08:13:33 -0700 (PDT)
Received: from [10.119.48.83] (unknown [10.119.48.83])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 04ED13F59C;
 Fri, 12 Jul 2019 08:13:32 -0700 (PDT)
To: Hunyue Yau <hy-gsoc@hy-research.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <25386cfa-d0b7-83fe-4d87-5af3459d54bd@gmail.com>
 <28955848-fdc0-5311-580b-23fd8ce7bea2@gmail.com>
 <d1d8514d-05e6-66f3-ef8d-95f1b48ccfd4@arm.com> <3431405.GtiBnG5Jy9@acer0>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <b49189f5-34a3-5846-41b3-a32d54868566@arm.com>
Date: Fri, 12 Jul 2019 16:13:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <3431405.GtiBnG5Jy9@acer0>
Content-Language: en-US
Subject: Re: [Xen-devel] [GSoC-2019] About the crossbar and xen
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Denis Obrezkov <denisobrezkov@gmail.com>, Iain Hunter <drhunter95@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA3LzExLzE5IDc6MjkgUE0sIEh1bnl1ZSBZYXUgd3JvdGU6Cj4gW1RoaXMgbWFpbCBp
bmNvcnBvcmF0ZXMgY29tbWVudHMgcmFpc2VkIG9uIElSQy4gSSBoYXZlIG1hZGUgc29tZSBvZiB0
aGlzIG1IaSxvcmUKPiB2ZXJib3NlIHRvIHByb3ZpZGUgY29udGV4dCB0byBwZW9wbGUgdGhhdCBo
YXZlbid0IHNlZW4gdGhlIElSQyBjb21tZW50cy5dCgpUaGFuayB5b3UgZm9yIHRoZSBzdW1tYXJ5
IQoKPiAKPiBUaGlzIHdpbGwgYmUgYSBidW5jaCBvZiBmYWN0cyBvbiB0aGUgYW01LiBTb21lb25l
IGVsc2Ugd2lsbCBoYXZlIHJlbGF0ZSBpdAo+IGJhY2sgdG8gWGVuLgo+IAo+IDEgLSBUaGUgV1VH
ZW4gaXMgYSBoYXJkd2FyZSBibG9jayBvbiB0aGUgTVBVIGJsb2NrIHRoYXQgY2FuIHR1cm4gaW50
ZXJydXB0cwo+IGludG8gd2FrZSB1cCBldmVudHMgaWYgdGhlIE1QVSBpcyBpbiBjZXJ0YWluIGRl
ZXBlciBzbGVlcCBzdGF0ZXMuIFRoaXMgYXBwbGllcwo+IG9ubHkgdG8gY2VydGFpbiBpbnRlcnJ1
cHRzLiBXZSBjYW4gY29uZmlybSB0aGlzIGJ5IGxvb2tpbmcgYXQgdGhlIERUJ3MgcmVnaXN0ZXIK
PiBhZGRyZXNzLiBQZXIgdGhlIFRSTSwgdGhleSBhcmUgcmVnaXN0ZXJzIGZvciB0aGUgTVBVJ3Mg
UFJDTSAoUG93ZXIvUmVzZXQvQ2xvY2sKPiBNYW5hZ2VtZW50KS4gSW4gc2hvcnQsIHRoaXMgYmxv
Y2sgbWFrZXMgaW50ZXJydXB0cyBhIHBvc3NpYmxlIHdha2UgdXAgc291cmNlLgo+IAo+IDIgLSBF
YXJsaWVyIGtlcm5lbHMgZGlkIG5vdCBleHBvc2UgdGhhdCBIVyBibG9jay4gU2VlIHRoaXMgcGF0
Y2ggdGhhdAo+IGludHJvZHVjZWQgdGhlIFdVR2VuIC0KPiBodHRwczovL2dpdGh1Yi5jb20vdG9y
dmFsZHMvbGludXgvY29tbWl0LzcxMzZkNDU3ZjM2NWVjYzkzZGRmZmNkZDQyYWI0OWE4NDczZjI2
MGIKPiBJIHN1c3BlY3QgbG9va2luZyBhdCB0aGUgYmVmb3JlIHBhcnQgb2YgdGhlIHBhdGNoIHNo
b3VsZCBwcm92aWRlIGNsdWVzIG9uIGhvdwo+IHRvIGhhbmRsZSB0aGUgV1VHZW4uCj4gCj4gCj4g
MyAtIFRoaXMgbWF5IGJlIHJlZHVuZGFudCBidXQgbW9yZSBkZWZpbml0aW9ucyAoaW4gdGhlIGh1
bWFuIHNlbnNlKSBoZXJlOgo+IGh0dHBzOi8vd3d3Lm1qbXdpcmVkLm5ldC9rZXJuZWwvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3RpLG9tYXA0
LXd1Z2VuLW1wdQo+IAo+IDQgLSBGb3IgdGhlIFVBUlQgY2FzZSwgSSBzdXNwZWN0IHRoZSBmbG93
IERlbm5pcyBwb2ludGVkIG91dCBpcyBhYm91dCByaWdodC4KPiBIb3dldmVyLCB0aGF0IG1heSBi
ZSBkaWZmZXJlbnQgZGVwZW5kaW5nIG9uIHRoZSBpbnRlcnJ1cHQgc291cmNlLgo+IAo+IFVua25v
d25zIGZyb20gbXkgcG9pbnQgb2YgdmlldyAtCj4gCj4gYSAtIERvZXMgWGVuIHZpcnR1YWxpemUg
cG93ZXIgbWFuYWdlbWVudD8gSWYgc28sIHRoaXMgbWF5IGhhdmUgaGF2ZSBhbiBpbXBhY3QuCj4g
SSB3b3VsZCBub3QgcmVjb21tZW5kIGFkZGluZyBQTSB2aXJ0dWFsaXphdGlvbiBpbiBHU29DLiBJ
dCBpcyB0dWdnaW5nIG9uIGEKPiB2ZXJ5IGxvbmcgc3RyaW5nLgoKWGVuIGRvZXMgbm90IHZpcnR1
YWxpemUgcG93ZXIgbWFuYWdlbWVudCBhdCB0aGUgbW9tZW50LiBJIGFncmVlIHRoYXQgCnRoaXMg
aXMgdG9vIGJpZyBmb3IgdGhlIHNjb3BlIG9mIHRoZSBHU29DLgoKPiAKPiBiIC0gSWYgWGVuIGRv
ZXMgbm90IHZpcnR1YWxpemUgdGhhdCwgc29tZW9uZSBuZWVkcyB0byBkZWNpZGUgaG93IG11Y2gg
dG8gbGVhdmUKPiB0byB0aGUgZ3Vlc3MuCj4gCj4gYyAtIEkgd29uZGVyIGlmIHdlIGNhbiBkbyBh
IGhhbGYgd2F5IGhhY2sgd2hlcmUgdGhlIGtlcm5lbCBzZXRzIHVwIHRoZSBQTSBidXQKPiBYZW4g
aG9va3MgdG8gZ2V0IHRoZSBpbnRlcnJ1cHQuIFRoZSBIVyB3aWxsIGRvIGl0cyBQTSB0aGluZyBh
bmQgWGVuIGNhbgo+IHByb2Nlc3MgdGhlIGludGVycnVwdC4KCkhtbW0sIHRoZSBxdWVzdGlvbiBo
ZXJlIGlzIHdoZXRoZXIgdGhlIFVBUlQgd291bGQgYmUgdXN1YWJsZSBiZWZvcmUgRG9tMCAKaXMg
c2V0dGluZyB1cCB0aGUgUE0/IElmIG5vdCwgdGhlbiwgd2Ugd291bGQgbmVlZCB0byBkZWFsIHdp
dGggaXQgaW4gWGVuLgoKPiAKPiBHdWVzc2VzL3Bvc3NpYmxlIGhhY2tzIC0KPiAtIEZvciB0aGUg
aW50ZXJydXB0cyB3ZSBjYXJlIGFib3V0LCB0aGUgY3Jvc3MgYmFyIGNhbiByb3V0ZSB0aGluZ3Mg
dG8gdGhlIE1QVQo+IHVuY29uZGl0aW9uYWxseS4gVGhpcyB3b3VsZCBicmVhayB0aGUgb3RoZXIg
SFcgYmxvY2tzIGJ1dCBtb3N0IG9mIHRoZW0gYXJlbid0Cj4gbmVlZGVkIGZvciBib290LgoKU29y
cnkgZm9yIG15IGlnbm9yYW5jZSwgd2hpY2ggSFcgYmxvY2tzIGFyZSB5b3UgdGFsa2luZyBhYm91
dD8KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
