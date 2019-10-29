Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 115A1E8AE7
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 15:37:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPSZv-0000IE-JH; Tue, 29 Oct 2019 14:34:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1x1s=YW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iPSZt-0000I3-Rd
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 14:34:33 +0000
X-Inumbo-ID: 386c99be-fa59-11e9-bbab-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 386c99be-fa59-11e9-bbab-bc764e2007e4;
 Tue, 29 Oct 2019 14:34:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 06FF9B46E;
 Tue, 29 Oct 2019 14:34:30 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191028150152.21179-1-andrew.cooper3@citrix.com>
 <20191028150152.21179-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4b59786b-da3b-c20f-2db4-1f7d49d87ca4@suse.com>
Date: Tue, 29 Oct 2019 15:34:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191028150152.21179-2-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] x86/vtx: Corrections to BFD93 errata
 workaround
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTAuMjAxOSAxNjowMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBBdCB0aGUgdGltZSBv
ZiBmaXhpbmcgYy9zIDIwZjE5NzZiNDQsIG5vIG9idmlvdXMgZXJyYXRhIGhhZCBiZWVuIHB1Ymxp
c2hlZCwKPiBhbmQgQkRGMTQgbG9va2VkIGxpa2UgdGhlIG1vc3Qgb2J2aW91cyBjYW5kaWRhdGUu
ICBTdWJzZXF1ZW50bHksIEJERjkzIGhhcwo+IGJlZW4gcHVibGlzaGVkIGFuZCBpdCBpcyBvYnZp
b3VzbHkgdGhpcy4KPiAKPiBUaGUgZXJyYXR1bSBzdGF0ZXMgdGhhdCBMRVJfVE9fTElQIGlzIHRo
ZSBvbmx5IGFmZmVjdGVkIE1TUi4gIFRoZSBwcm92aXNpb25hbAo+IGZpeCBpbiBYZW4gYWRqdXN0
ZWQgTEVSX0ZST01fTElQLCBidXQgdGhpcyBpcyBub3QgY29ycmVjdC4gIFRoZSBGUk9NIE1TUnMg
YXJlCj4gaW50ZW5kZWQgdG8gaGF2ZSBUU1ggbWV0YWRhdGEsIGFuZCBmb3Igc3RlcHBpbmdzIHdp
dGggVFNYIGVuYWJsZWQsIGl0IHdpbGwKPiBjb3JydXB0IHRoZSB2YWx1ZSB0aGUgZ3Vlc3Qgc2Vl
cywgd2hpbGUgZm9yIHBhcnRzIHdpdGggVFNYIGRpc2FibGVkLCBpdCBpcwo+IHJlZHVuZGFudCB3
aXRoIEZJWFVQX1RTWC4gIERyb3AgdGhlIExFUl9GUk9NX0xJUCBhZGp1c3RtZW50Lgo+IAo+IFJl
cGxhY2UgQkRGMTQgcmVmZXJlbmNlcyB3aXRoIEJERjkzLCBkcm9wIHRoZSByZWR1bmRhbnQgJ2Jk
d19lcnJhdHVtXycgcHJlZml4LAo+IGFuZCB1c2UgYW4gSW50ZWwgdmVuZG9yIGNoZWNrLCBhcyBv
dGhlciB2ZW5kb3JzIGltcGxlbWVudCBWVC14Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgpwcmVmZXJhYmx5IHdpdGggdGhlIGVycmF0dW0gaW5kaWNh
dG9yIGluIHRoZSB0aXRsZSBjb3JyZWN0ZWQgdG8KYWxzbyBzYXkgQkRGOTMuCgpKYW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
