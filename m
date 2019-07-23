Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCB771A69
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 16:32:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpvnA-0001Iv-Bf; Tue, 23 Jul 2019 14:29:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bPW/=VU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hpvn9-0001Ip-7r
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 14:29:23 +0000
X-Inumbo-ID: 431eba23-ad56-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 431eba23-ad56-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 14:29:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 11C6FAECB;
 Tue, 23 Jul 2019 14:29:21 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>
References: <20190723092056.15045-1-jgross@suse.com>
 <20190723092056.15045-3-jgross@suse.com>
 <eb7d7c8a-9bb1-f264-b72e-7e4c96087568@suse.com>
 <4c6a7888-d697-1b2c-cdbf-7127ae00bc4f@suse.com>
 <779077d6-5f07-9801-49e6-58fcd1fe31b4@suse.com>
 <e28384ea-4c85-e1c2-efce-01ec354d4ab3@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <fd38498a-2918-8cb1-3575-044ecbdd423e@suse.com>
Date: Tue, 23 Jul 2019 16:29:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <e28384ea-4c85-e1c2-efce-01ec354d4ab3@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 2/2] xen: merge temporary vcpu pinning
 scenarios
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 IanJackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDcuMTkgMTY6MTQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDIzLjA3LjIwMTkgMTY6
MDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAyMy4wNy4yMDE5IDE1OjQ0LCBKdWVyZ2VuIEdy
b3NzIHdyb3RlOgo+Pj4gT24gMjMuMDcuMTkgMTQ6NDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+
IHYtPnByb2Nlc3NvciBnZXRzIGxhdGNoZWQgaW50byBzdC0+cHJvY2Vzc29yIGJlZm9yZSByYWlz
aW5nIHRoZSBzb2Z0aXJxLAo+Pj4+IGJ1dCBjYW4ndCB0aGUgdkNQVSBiZSBtb3ZlZCBlbHNld2hl
cmUgYnkgdGhlIHRpbWUgdGhlIHNvZnRpcnEgaGFuZGxlcgo+Pj4+IGFjdHVhbGx5IGdhaW5zIGNv
bnRyb2w/IElmIHRoYXQncyBub3QgcG9zc2libGUgKGFuZCBpZiBpdCdzIG5vdCBvYnZpb3VzCj4+
Pj4gd2h5LCBhbmQgYXMgeW91IGNhbiBzZWUgaXQncyBub3Qgb2J2aW91cyB0byBtZSksIHRoZW4g
SSB0aGluayBhIGNvZGUKPj4+PiBjb21tZW50IHdhbnRzIHRvIGJlIGFkZGVkIHRoZXJlLgo+Pj4K
Pj4+IFlvdSBhcmUgcmlnaHQsIGl0IG1pZ2h0IGJlIHBvc3NpYmxlIGZvciB0aGUgdmNwdSB0byBt
b3ZlIGFyb3VuZC4KPj4+Cj4+PiBPVE9IIGlzIGl0IHJlYWxseSBpbXBvcnRhbnQgdG8gcnVuIHRo
ZSB0YXJnZXQgdmNwdSBleGFjdGx5IG9uIHRoZSBjcHUKPj4+IGl0IGlzIGV4ZWN1dGluZyAob3Ig
aGFzIGxhc3QgZXhlY3V0ZWQpIGF0IHRoZSB0aW1lIHRoZSBOTUkvTUNFIGlzIGJlaW5nCj4+PiBx
dWV1ZWQ/IFRoaXMgaXMgaW4gbm8gd2F5IHJlbGF0ZWQgdG8gdGhlIGNwdSB0aGUgTUNFIG9yIE5N
SSBoYXMgYmVlbgo+Pj4gaGFwcGVuaW5nIG9uLiBJdCBpcyBqdXN0IGEgcmFuZG9tIGNwdSwgYW5k
IHNvIGl0IHdvdWxkIGJlIGlmIHdlJ2QgZG8gdGhlCj4+PiBjcHUgc2VsZWN0aW9uIHdoZW4gdGhl
IHNvZnRpcnEgaGFuZGxlciBpcyBydW5uaW5nLgo+Pj4KPj4+IE9uZSBxdWVzdGlvbiB0byB1bmRl
cnN0YW5kIHRoZSBpZGVhIG5laGluZCBhbGwgdGhhdDogX3doeV8gaXMgdGhlIHZjcHUKPj4+IHBp
bm5lZCB1bnRpbCBpdCBkb2VzIGFuIGlyZXQ/IEkgY291bGQgdW5kZXJzdGFuZCBpZiBpdCB3b3Vs
ZCBiZSBwaW5uZWQKPj4+IHRvIHRoZSBjcHUgd2hlcmUgdGhlIE5NSS9NQ0Ugd2FzIGhhcHBlbmlu
ZywgYnV0IHRoaXMgaXMgbm90IHRoZSBjYXNlLgo+Pgo+PiBUaGVuIGl0IHdhcyBuZXZlciBmaW5p
c2hlZCBvciBnb3QgYnJva2VuLCBJIHdvdWxkIGd1ZXNzLgo+IAo+IE9oLCBuby4gVGhlICNNQyBz
aWRlIHVzZSBoYXMgZ29uZSBhd2F5IGluIDNhOTE3NjlkNmUsIHdpdGhvdXQgY2xlYW5pbmcKPiB1
cCBvdGhlciBjb2RlLiBTbyB0aGVyZSBkb2Vzbid0IHNlZW0gdG8gYmUgYW55IHN1Y2ggcmVxdWly
ZW1lbnQgYW55bW9yZS4KClNvIGp1c3QgdG8gYmUgc3VyZTogeW91IGFyZSBmaW5lIGZvciBtZSBy
ZW1vdmluZyB0aGUgcGlubmluZyBmb3IgTk1Jcz8KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
