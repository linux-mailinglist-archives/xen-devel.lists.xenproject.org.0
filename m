Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AD514C988
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 12:24:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwlQh-00022g-7Y; Wed, 29 Jan 2020 11:22:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LL5N=3S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwlQg-00022b-8X
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 11:22:42 +0000
X-Inumbo-ID: a99e54b0-4289-11ea-8396-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a99e54b0-4289-11ea-8396-bc764e2007e4;
 Wed, 29 Jan 2020 11:22:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EC48AABC4;
 Wed, 29 Jan 2020 11:22:40 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
References: <a239c82563154aa7801fc9fa2ec70b1b@EX13D32EUC003.ant.amazon.com>
 <3e143e03-d67e-f626-22ba-792b5e96f70e@suse.com>
 <b87beec316d0451ba831a2814b4bad6f@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <99402f9e-e52a-84fa-dac3-72b78748a022@suse.com>
Date: Wed, 29 Jan 2020 12:22:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <b87beec316d0451ba831a2814b4bad6f@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen 4.14 dates
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDEuMjAyMCAxMjoxMywgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+
PiBTZW50OiAyOSBKYW51YXJ5IDIwMjAgMTE6MDgKPj4gVG86IER1cnJhbnQsIFBhdWwgPHBkdXJy
YW50QGFtYXpvbi5jby51az47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+PiBTdWJq
ZWN0OiBSZTogW1hlbi1kZXZlbF0gWGVuIDQuMTQgZGF0ZXMKPj4KPj4gT24gMjkuMDEuMjAyMCAx
MTo1NSwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4+ICAgSSdtIG5vdCBhd2FyZSBvbiBhbnkgcHJp
b3IgZGlzY3Vzc2lvbiB3LnIudC4gZGF0ZXMgZm9yIFhlbiA0LjE0IHNvIGFzCj4+IFJNIEknZCBs
aWtlIHRvIHByb3Bvc2UgdGhlIGZvbGxvd2luZzoKPj4+Cj4+PiBMYXN0IHBvc3Rpbmc6IE1heSAx
c3QgMjAyMAo+Pj4gSGFyZCBGcmVlemU6IE1heSAyMm5kIDIwMjAKPj4+IFJlbGVhc2U6IEp1bmUg
MjZ0aAo+Pgo+PiBXYXMgNC4xMyByZWFsbHkgbW9yZSB0aGFuIDEuNSBtb250aHMgbGF0ZT8gVGhl
IGFib3ZlIHdvdWxkIG1ha2UKPj4gaXRzIG9yaWdpbmFsbHkgcGxhbm5lZCByZWxlYXNlIGRhdGUg
T2N0IDI2dGggKHRoZSBhY3R1YWwgb25lIHdhcwo+PiBEZWMgMTh0aCkgd2l0aCBvdXIgY3VycmVu
dCA4IG1vbnRoIGNhZGVuY2UuCj4+Cj4+IEp1c3Qgd29uZGVyaW5nLAo+IAo+IEkgZm91bmQgdGhl
IGxhc3QgNC4xMyB1cGRhdGUgZW1haWwgZnJvbSBKdWVyZ2VuIHN0YXRpbmcgcmVsZWFzZSBvbiBO
b3YgN3RoLiA4IG1vbnRocyB3b3VsZCBwdXQgcmVsZWFzZSBvbiBKdWwgN3RoIGJ1dCBJIHJvdW5k
ZWQgZG93biBhcyBJJ20gY29uc2Npb3VzIHRoYXQgYW55IHNsaXAgaXMgZ29pbmcgdG8gbW92ZSB0
aGluZ3MgaW50byBob2xpZGF5IHNlYXNvbi4KCkFoLCBJIHNlZS4gVGhhbmtzIGZvciBjbGFyaWZ5
aW5nLgoKPiBBbm90aGVyIG9wdGlvbiB3b3VsZCBiZSB0byBzbGlwIG91dCB0byB+MSB5ZWFyIGFm
dGVyIHRoZSBwbGFubmVkIDQuMTMgZGF0ZXMuCgpOb3QgYSBnb29kIG9wdGlvbiwgaW1vLgoKSmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
