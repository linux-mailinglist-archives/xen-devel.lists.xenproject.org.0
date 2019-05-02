Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85016118F8
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 14:27:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMAlA-0005tq-OU; Thu, 02 May 2019 12:24:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yl7K=TC=citrix.com=prvs=018ff06f8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hMAl9-0005te-Kt
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 12:24:19 +0000
X-Inumbo-ID: 34c76bca-6cd5-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 34c76bca-6cd5-11e9-843c-bc764e045a96;
 Thu, 02 May 2019 12:24:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,421,1549929600"; d="scan'208";a="84940143"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23754.57701.186390.647931@mariner.uk.xensource.com>
Date: Thu, 2 May 2019 13:24:05 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
In-Reply-To: <20190502110415.uyrfzby2ql4nkfve@Air-de-Roger>
References: <23752.18285.3998.815201@mariner.uk.xensource.com>
 <5CC85AF9020000780022A839@prv1-mh.provo.novell.com>
 <23752.23708.661076.214573@mariner.uk.xensource.com>
 <20190430155505.gqhdgxzt5ajdt65v@Air-de-Roger>
 <23753.27461.546649.855744@mariner.uk.xensource.com>
 <20190502094528.m7ir4xkabvndppyn@Air-de-Roger>
 <23754.51580.477282.458295@mariner.uk.xensource.com>
 <20190502110415.uyrfzby2ql4nkfve@Air-de-Roger>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] linux 4.19 xenstore memory allocation failure Re:
 [linux-4.19 test] 135420: regressions - FAIL
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Um9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIlJlOiBbWGVuLWRldmVsXSBsaW51eCA0LjE5IHhlbnN0
b3JlIG1lbW9yeSBhbGxvY2F0aW9uIGZhaWx1cmUgUmU6IFtsaW51eC00LjE5IHRlc3RdIDEzNTQy
MDogcmVncmVzc2lvbnMgLSBGQUlMIik6Cj4gT24gVGh1LCBNYXkgMDIsIDIwMTkgYXQgMTE6NDI6
MDRBTSArMDEwMCwgSWFuIEphY2tzb24gd3JvdGU6Cj4gPiBDYW4gd2UgYXNzdW1lIHRoYXQgbWVt
b3J5IGV4aGF1c3Rpb24gd2lsbCBhbHdheXMgcmVzdWx0IGluIHNvbWUKPiA+IG1lc3NhZ2UgZnJv
bSB0aGUgbWVtb3J5IGFsbG9jYXRvciA/ICBJZiBzbyB0aGVuIHRoaXMgbmV3IGxvZyBtZXNzYWdl
Cj4gCj4gSSdtIG5vdCBzdXJlIEkgdW5kZXJzdGFuZCB0byB3aGF0IG5ldyBsb2cgbWVzc2FnZSB5
b3UgYXJlIHJlZmVycmluZwo+IHRvLiBUaGUgZGV2X2VyciBjYWxsIGlzIGFscmVhZHkgcHJlc2Vu
dCBpbiB4ZW5idXNfdmFfZGV2X2Vycm9yLCBzbwo+IGV2ZXJ5dGhpbmcgdGhhdCdzIGF0dGVtcHRl
ZCB0byB3cml0ZSB0byB4ZW5zdG9yZSBzaG91bGQgYWxzbyBiZQo+IHByaW50ZWQgb24gdGhlIGNv
bnNvbGUuCgpPaCwgSSBtaXN1bmRlcnN0b29kLiAgSSB0aG91Z2h0IHlvdSB3ZXJlIHRhbGtpbmcg
YWJvdXQgYSBoeXBvdGhldGljYWwKbmV3IGRldl9lcnIgY2FsbC4KCkRvZXMgdGhhdCBtZWFuIHRo
YXQgeW91IHRoaW5rIGluIHRoaXMgY2FzZSBpdCB0cmllZCB0byB3cml0ZSBhIG1lc3NhZ2UKdG8g
dGhlIGNvbnNvbGUgYW5kIHRoYXQgdG9vIGZhaWxlZCBkdWUgdG8gbGFjayBvZiBtZW1vcnkgPwoK
SW4gd2hpY2ggY2FzZSBpdCBwcm9iYWJseSBkaWQgdGhlIGJlc3QgaXQgY291bGQuCgpUaGFua3Ms
Cklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
