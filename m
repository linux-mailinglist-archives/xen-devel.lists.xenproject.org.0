Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5679109B4B
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 10:34:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZXCZ-00047I-0p; Tue, 26 Nov 2019 09:32:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/0/a=ZS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iZXCX-00047D-9A
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 09:32:05 +0000
X-Inumbo-ID: 9ac5d65c-102f-11ea-a39c-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ac5d65c-102f-11ea-a39c-12813bfff9fa;
 Tue, 26 Nov 2019 09:32:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BD545BBDF;
 Tue, 26 Nov 2019 09:32:02 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
References: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
 <9399a177-91dd-b64a-1b6f-1d29903161fe@cardoe.com>
 <20191125140606.6jmltrc624zugnqv@debian> <20191125155931.GA980@Air-de-Roger>
 <20191125170704.etgloq6y2e7j6ewg@debian> <20191125172704.GB980@Air-de-Roger>
 <0449da3e-2e23-1d2a-1967-5d52a803df65@citrix.com>
 <20191125174956.GC980@Air-de-Roger>
 <33faac3c-ab0f-0f1e-7444-4cd8cc9fb12c@suse.com>
 <20191126090850.GD980@Air-de-Roger>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <8998de5f-159a-e8a0-f547-a15c4553ec39@suse.com>
Date: Tue, 26 Nov 2019 10:32:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191126090850.GD980@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] Status of 4.13
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
Cc: Wei Liu <wl@xen.org>, GeorgeDunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMTEuMTkgMTA6MDgsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gVHVlLCBOb3Yg
MjYsIDIwMTkgYXQgMDk6MzA6NDdBTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI1
LjExLjIwMTkgMTg6NDksIFJvZ2VyIFBhdSBNb25uw6kgIHdyb3RlOgo+Pj4gT24gTW9uLCBOb3Yg
MjUsIDIwMTkgYXQgMDU6MzQ6MTVQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+PiBP
biAyNS8xMS8yMDE5IDE3OjI3LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+Pj4+PiBPbiBNb24s
IE5vdiAyNSwgMjAxOSBhdCAwNTowNzowNFBNICswMDAwLCBXZWkgTGl1IHdyb3RlOgo+Pj4+Pj4g
T24gTW9uLCBOb3YgMjUsIDIwMTkgYXQgMDQ6NTk6MzFQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPj4+Pj4+IFsuLi5dCj4+Pj4+Pj4gV2hpY2ggSSB0aGluayBpdCdzIGV4cGVjdGVk
LCB3ZSBhbHJlYWR5IGtuZXcgY2xhbmcgaGFkIGEgbG90IG9mCj4+Pj4+Pj4gZHVwbGljYXRlIHN5
bWJvbHMuIFRoZSBvbmx5IHdheSBJIGtub3cgdG8gd29ya2Fyb3VuZCB0aGlzIEFUTSBpcyB0bwo+
Pj4+Pj4+IHVzZSBgZ21ha2UgeGVuIGNsYW5nPXkgQ09ORklHX0VORk9SQ0VfVU5JUVVFX1NZTUJP
TFM9bmAuIEl0J3Mgb24gbXkKPj4+Pj4+PiBwaWxlIG9mIHN0dWZmIHRvIGxvb2sgaW50bywgYnV0
IEknbSBub3Qgc3VyZSB3aGVuIEkgd2lsbCBnZXQgdG8gaXQuCj4+Pj4+PiBJbiB0aGF0IGNhc2Ug
d2Ugc2hvdWxkIG1ha2UgR2l0bGFiIENJIHVzZSB0aGUgbmV3IGNvbmZpZ3VyYXRpb24gb3B0aW9u
Lgo+Pj4+PiBJTU8gdGhlIGJ1aWxkIHNob3VsZCB3b3JrIG91dCBvZiB0aGUgYm94LCBzbyB3ZSBz
aG91bGQgZGlzYWJsZQo+Pj4+PiBDT05GSUdfRU5GT1JDRV9VTklRVUVfU1lNQk9MUyBhdXRvbWF0
aWNhbGx5IGlmIGNsYW5nIGlzIGRldGVjdGVkLgo+Pj4+Cj4+Pj4gS2NvbmZpZyBpbiA0LjEzIGlz
bid0IGluIGEgcG9zaXRpb24gdG8ga25vdyB0aGlzLsKgIChJdCB3aWxsIGJlIGluIDQuMTQKPj4+
PiB3aXRoIEFudGhvbnkncyByZWZyZXNoIGNvbW1pdHRlZCkuCj4+Pgo+Pj4gV2UgYWxyZWFkeSBo
YXZlIEtjb25maWcgb3B0aW9ucyB0aGF0IGRlcGVuZCBvbiB0b29sY2hhaW4gZmVhdHVyZXMsCj4+
PiBsaXZlcGF0Y2ggaXRzZWxmIHdpbGwgYmUgZW5hYmxlZCBpZiBidWlsZCBpZCBpcyBzdXBwb3J0
ZWQgYnkgdGhlCj4+PiBsaW5rZXIsIHdoeSBub3QgdXNlIHNvbWV0aGluZyBsaWtlOgo+Pgo+PiBJ
J20gc29ycnkgdG8gc2F5IHRoaXMsIGJ1dCBzdWdnZXN0aW5nIHdvcmthcm91bmRzIGxpa2UgdGhp
cyB3aGVuCj4+IHRoZXJlJ3MgYSBzb2x1dGlvbiB0byB0aGUgcHJvYmxlbSBbMV0gZmVlbHMgYWJz
dXJkLgo+Pgo+PiBKYW4KPj4KPj4gWzFdIGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJj
aGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0xMS9tc2cwMDM1Ny5odG1sCj4gCj4gSUlSQyBKdWVy
Z2VuIGhhZCBjb25jZXJucyBhYm91dCB0YWtpbmcgdGhpcyBhZnRlciByYzMuIEknbSBhbGwgZm9y
Cj4gZ2V0dGluZyB0aGlzIGZpeGVkIGluIDQuMTMsIGJ1dCBpZiB0aGF0J3Mgbm90IHRoZSBjYXNl
IHdlIHNob3VsZCBqdXN0Cj4gZGlzYWJsZSBsaXZlIHBhdGNoaW5nIG9uIGNsYW5nLgoKSSBzYWlk
IEknbGwgdGFrZSBvbmx5IHJlYWwgZml4ZXMgbm93LiBJbiBjYXNlIHRoZSBuZWNlc3NhcnkgQWNr
cyBmb3IKSmFuJ3MgcGF0Y2ggYXJlIGNvbWluZyBzb29uIEknZCBjb25zaWRlciBhbGxvd2luZyB0
aGUgcGF0Y2ggZm9yIDQuMTMuCgo+IAo+IFJlbGVhc2luZyB3aXRob3V0IFhlbiBidWlsZGluZyBv
dXQgb2YgdGhlIGJveCB3aXRoIGNsYW5nIGlzIG5vdCBhbgo+IG9wdGlvbiBJTU8uCgpJIGFncmVl
LgoKU28gaW4gY2FzZSB0aGVyZSBhcmUgcmVzZXJ2YXRpb25zIGFnYWluc3QgSmFuJ3MgcGF0Y2gg
SSdkIHJhdGhlciB0YWtlCnRoaXMgd29ya2Fyb3VuZC4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
