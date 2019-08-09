Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF8587406
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 10:29:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw0Ee-0000NV-Nh; Fri, 09 Aug 2019 08:26:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hw0Ed-0000NQ-HA
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 08:26:51 +0000
X-Inumbo-ID: 6e5f8427-ba7f-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6e5f8427-ba7f-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 08:26:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0FC07AECD;
 Fri,  9 Aug 2019 08:26:48 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <20190809020137.27334-1-marmarek@invisiblethingslab.com>
 <20190809020137.27334-2-marmarek@invisiblethingslab.com>
 <20190809075131.ht7wvbv3yqeho76k@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8d22ad95-7f9a-6ac3-0f3a-d2e615d1d235@suse.com>
Date: Fri, 9 Aug 2019 10:26:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809075131.ht7wvbv3yqeho76k@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] tools/tests/cpu-policy: disable
 -Wformat-overflow
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
Cc: AndrewCooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDguMjAxOSAwOTo1MSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gRnJpLCBB
dWcgMDksIDIwMTkgYXQgMDQ6MDE6MzdBTSArMDIwMCwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3Jl
Y2tpIHdyb3RlOgo+PiBHQ0M5IGNvbXBsYWlucyBhYm91dCAiJS4xMnMiIGZvcm1hdCB3aXRoIGFu
IGFyZ3VtZW50IGhhdmluZyBleGFjdGx5IDEyCj4+IGJ5dGVzIGFuZCBubyB0ZXJtaW5hdGluZyBu
dWxsIGNoYXJhY3Rlci4gVGhpcyBpcyBpbnRlbnRpb25hbAo+PiBjb25zdHJ1Y3QsIHNvIGRpc2Fi
bGUgdGhlIHdhcm5pbmcuCj4gCj4gSUlSQyB0aGlzIGlzIGRlZW1lZCBhcyBhIGdjYyBidWcsIGFs
YmVpdCBJJ20gbm90IHN1cmUgaG93IHdlIGFyZQo+IHN1cHBvc2VkIHRvIHdvcmthcm91bmQgaXQ6
Cj4gCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZl
bC8yMDE5LTA3L21zZzAxNzEyLmh0bWwKPiAKPiBEaXNhYmxpbmcgdGhlIGNoZWNrIHdob2xlc2Fs
ZSBzZWVtcyBsaWtlIGEgYmlnIGhhbW1lci4KCkluZGVlZC4KCkkgaGFkIHRyaWVkIHRvIG9ic2Vy
dmUgdGhpcyB3aXRoIGEgc2ltcGxlIHNtYWxsIGV4YW1wbGUgc291cmNlCmFscmVhZHksIGFuZCBm
YWlsZWQuIEkgY2FuJ3QgdGVsbCB3aGV0aGVyIHRoYXQncyBiZWNhdXNlIEkndmUKdHJpZWQgd2l0
aCBhbiBhbG1vc3QgcGxhaW4gdXBzdHJlYW0gOS4xLjAgKGFuZCBvdGhlcnMgaGF2ZSBzb21lCmV4
dHJhIHBhdGNoZXMgaW4gaXQpLCBvciB3aGV0aGVyIHRoYXQncyBiZWNhdXNlIHRoZXJlJ3MgbW9y
ZSB0bwppdCB0aGFuIGp1c3QgdGhlIGFycmF5IHNpemUgYW5kIGZvcm1hdCBzcGVjaWZpZXIgaW50
ZXJhY3Rpb24uClRoZXJlZm9yZSBpdCB3b3VsZCBoZWxwIGlmIHNvbWVvbmUgd2hvIGNhbiBhY3R1
YWxseSBzZWUgdGhlCmlzc3VlIHdvdWxkIGJlIGFibGUgdG8gc3RyaXAgZG93biB0aGUgZnVsbCB0
ZXN0IHNvdXJjZSBoZXJlIHRvCmEgc2ltcGxlIHJlcHJvZHVjZXIuIERlcGVuZGluZyBvbiB3aGV0
aGVyIF90aGF0XyB0aGVuIGFsc28KZmFpbHMgd2l0aCBwbGFpbiB1cHN0cmVhbSA5LjEuMCB0aGUg
YnVnIHdvdWxkIHdhbnQgdG8gYmUKcmVwb3J0ZWQgdGhlcmUgb3IgdG8gdGhlIHJlc3BlY3RpdmUg
ZGlzdHJvKHMpLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
