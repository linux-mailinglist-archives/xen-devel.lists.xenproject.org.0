Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54794DD8D9
	for <lists+xen-devel@lfdr.de>; Sat, 19 Oct 2019 15:51:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLp48-0007Q6-CU; Sat, 19 Oct 2019 13:46:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qbuG=YM=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iLp47-0007Q1-7q
 for xen-devel@lists.xenproject.org; Sat, 19 Oct 2019 13:46:43 +0000
X-Inumbo-ID: df7ff9d5-f276-11e9-9416-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df7ff9d5-f276-11e9-9416-12813bfff9fa;
 Sat, 19 Oct 2019 13:46:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 45A7DB21C;
 Sat, 19 Oct 2019 13:46:39 +0000 (UTC)
To: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
References: <20190928151305.127380-1-wipawel@amazon.de>
 <20191018142518.GA6040@char.us.oracle.com>
 <61ece13d-4808-ff92-45a8-4974f8684e0a@citrix.com>
 <DFEC7C2B-C6F2-42AB-8655-E3801E17D19A@amazon.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <b33a7364-251a-5141-36f8-ac17e05e0c6e@suse.com>
Date: Sat, 19 Oct 2019 15:46:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <DFEC7C2B-C6F2-42AB-8655-E3801E17D19A@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 00/12] livepatch: new features and fixes
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Tim Deegan <tim@xen.org>, "Pohlack, Martin" <mpohlack@amazon.de>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMTAuMTkgMTI6MTgsIFdpZWN6b3JraWV3aWN6LCBQYXdlbCB3cm90ZToKPiAKPiAKPj4g
T24gMTguIE9jdCAyMDE5LCBhdCAxNzozNCwgUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxs
QGNpdHJpeC5jb20+IHdyb3RlOgo+Pgo+PiBPbiAxMC8xOC8xOSAzOjI1IFBNLCBLb25yYWQgUnpl
c3p1dGVrIFdpbGsgd3JvdGU6Cj4+PiBPbiBTYXQsIFNlcCAyOCwgMjAxOSBhdCAwMzoxMjo1M1BN
ICswMDAwLCBQYXdlbCBXaWVjem9ya2lld2ljeiB3cm90ZToKPj4+PiBUaGlzIHNlcmllcyBpbnRy
b2R1Y2VzIG5ldyBmZWF0dXJlcyB0byB0aGUgbGl2ZXBhdGNoIGZ1bmN0aW9uYWxpdHkgYXMKPj4+
PiBicmllZmx5IGRpc2N1c3NlZCBkdXJpbmcgWGVuIERldmVsb3BlciBTdW1taXQgMjAxOTogW2Fd
IGFuZCBbYl0uCj4+Pj4gSXQgYWxzbyBwcm92aWRlcyBhIGZldyBmaXhlcyBhbmQgc29tZSBzbWFs
bCBpbXByb3ZlbWVudHMuCj4+PiBIZXlhLAo+Pj4gSXMgdGhlcmUgYW4gdjUgb2YgdGhlIHBhdGNo
ZXMgc29tZXdoZXJlIGJyZXdpbmcgc28gdGhhdCBJIGNhbiBnaXZlIHRoZW0KPj4+IG9uZSBsYXN0
IHRlc3Q/Cj4gCj4gWWVzLCBpdCBpc+KApiBidXQgSSBhbSB3YWl0aW5nIGZvciBtb3JlIHJldmll
d3MgYmVmb3JlIHB1Ymxpc2hpbmcgYW5vdGhlciByZXZpc2lvbi4KPiAKPj4+IEp1ZXJnZW4sCj4+
PiBBcmUgeW91IE9LIHdpdGggZ2l2aW5nIHRoZW0gYW4gUmVsZWFzZS1BY2s/IEkgdGhpbmsgdGhl
cmUgYXJlIG9ubHkgdHdvIG1pbm9yCj4+PiBjaGFuZ2VzIHRoYXQgSmFuIHJlcXVlc3RlZC4KPj4K
Pj4gSSBoYXZlIG5vdCB5ZXQgaGFkIHRpbWUgdG8gcmV2aWV3IHNvbWUgb2YgdGhlIHBhdGNoZXMg
aW4gdjQuIEkgZXhwZWN0IEkgd2lsbCBoYXZlIHRpbWUgb24gTW9uZGF5IHRvIGxvb2sgYXQgdGhl
IHJlc3QuCj4+Cj4gCj4gRHVlIHRvIG90aGVyIHVyZ2VudCB3b3JrIEkgd29u4oCZdCBiZSBhYmxl
IHRvIGxvb2sgaW50byB0aGlzIGZvciBhIHdlZWsgb3IgdHdvLgoKV2hpY2ggd2lsbCBfcmVhbGx5
XyBtYWtlIGl0IHRvbyBsYXRlIGZvciA0LjEzLCBzb3JyeS4KCgpKdWVyZ2VuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
