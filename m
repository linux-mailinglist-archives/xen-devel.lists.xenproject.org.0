Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DC2125E66
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 10:59:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihsYB-00059h-0W; Thu, 19 Dec 2019 09:56:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ScRH=2J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ihsY9-00059V-4e
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 09:56:53 +0000
X-Inumbo-ID: c4ef7992-2245-11ea-a1e1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c4ef7992-2245-11ea-a1e1-bc764e2007e4;
 Thu, 19 Dec 2019 09:56:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 405D6AF41;
 Thu, 19 Dec 2019 09:56:03 +0000 (UTC)
To: Lars Kurth <lars.kurth@citrix.com>, Lars Kurth <lars.kurth@xenproject.org>
References: <cover.1576184325.git.lars.kurth@citrix.com>
 <98ab54c95a9541c918dfec529bcfc5867fd3ed33.1576184325.git.lars.kurth@citrix.com>
 <7a043307-f23f-c537-012b-393f59617c1c@xen.org>
 <0DE885E1-C4C3-447A-8408-88D43B9FE355@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1ed2d421-7dfe-1d92-5edc-7f11e8409ff7@suse.com>
Date: Thu, 19 Dec 2019 10:56:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <0DE885E1-C4C3-447A-8408-88D43B9FE355@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 5/7] Add Code Review Guide
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
Cc: Julien Grall <julien@xen.org>,
 "xen-api@lists.xenproject.org" <xen-api@lists.xenproject.org>,
 "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "mirageos-devel@lists.xenproject.org" <mirageos-devel@lists.xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "win-pv-devel@lists.xenproject.org" <win-pv-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMTIuMjAxOSAxODowOSwgTGFycyBLdXJ0aCB3cm90ZToKPiAKPiAKPiDvu79PbiAxOC8x
Mi8yMDE5LCAxNDoyOSwgIkp1bGllbiBHcmFsbCIgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToKPiAK
PiAgICAgSGkgTGFycywKPiAgICAgCj4gICAgIE9uIDEyLzEyLzIwMTkgMjE6MTQsIExhcnMgS3Vy
dGggd3JvdGU6Cj4gICAgID4gKyMjIyBXb3JrZmxvdyBmcm9tIGFuIEF1dGhvcidzIFBlcnNwZWN0
aXZlCj4gICAgID4gKwo+ICAgICA+ICtXaGVuIGNvZGUgYXV0aG9ycyByZWNlaXZlIGZlZWRiYWNr
IG9uIHRoZWlyIHBhdGNoZXMsIHRoZXkgdHlwaWNhbGx5IGZpcnN0IHRyeQo+ICAgICA+ICt0byBj
bGFyaWZ5IGZlZWRiYWNrIHRoZXkgZG8gbm90IHVuZGVyc3RhbmQuIEZvciBzbWFsbGVyIHBhdGNo
ZXMgb3IgcGF0Y2ggc2VyaWVzCj4gICAgID4gK2l0IG1ha2VzIHNlbnNlIHRvIHdhaXQgdW50aWwg
cmVjZWl2aW5nIGZlZWRiYWNrIG9uIHRoZSBlbnRpcmUgc2VyaWVzIGJlZm9yZQo+ICAgICA+ICtz
ZW5kaW5nIG91dCBhIG5ldyB2ZXJzaW9uIGFkZHJlc3NpbmcgdGhlIGNoYW5nZXMuIEZvciBsYXJn
ZXIgc2VyaWVzLCBpdCBtYXkKPiAgICAgPiArbWFrZSBzZW5zZSB0byBzZW5kIG91dCBhIG5ldyBy
ZXZpc2lvbiBlYXJsaWVyLgo+ICAgICA+ICsKPiAgICAgPiArQXMgYSByZXZpZXdlciwgeW91IG5l
ZWQgc29tZSBzeXN0ZW0gdGhhdCBoZTtwcyBlbnN1cmUgdGhhdCB5b3UgYWRkcmVzcyBhbGwKPiAg
ICAgCj4gICAgIEp1c3QgYSBzbWFsbCB0eXBvOiBJIHRoaW5rIHlvdSBtZWFudCAiaGVscHMiIHJh
dGhlciB0aGFuICJoZTtwcyIuCj4gICAgIAo+ICAgICBDaGVlcnMsCj4gICAgIAo+IFRoYW5rIHlv
dTogZml4ZWQgaW4gbXkgd29ya2luZyBjb3B5Lgo+IAo+IE9uZSB0aGluZyB3aGljaCBvY2N1cnJl
ZCB0byBtZSBmb3IgcmV2aWV3cyBsaWtlIHRoZXNlLCB3aGVyZSB0aGVyZSBpcyBubyBBQ0sncyBv
ciBSZXZpZXdlZC1ieSdzIGlzIHRoYXQgSSBkb24ndCBhY3R1YWxseSBrbm93IHdoZXRoZXIgeW91
IGFzIHJldmlld2VyIGlzIG90aGVyd2lzZSBoYXBweSB3aXRoIHRoZSByZW1haW5kZXIgb2YgcGF0
Y2guCj4gTm9ybWFsbHkgdGhlIEFDS2VkLWJ5IG9yIFJldmlld2VkLWJ5IGlzIGEgc2lnbmFsIHRo
YXQgaXQgaXMKPiAKPiBJIGFtIGFzc3VtaW5nIGl0IGlzLCBidXQgSSB0aGluayBpdCBtYXkgYmUg
d29ydGh3aGlsZSBwb2ludGluZyB0aGlzIG91dCBpbiB0aGUgZG9jdW1lbnQsIHRoYXQgdW5sZXNz
IHN0YXRlZCBvdGhlcndpc2UsIHRoZSByZXZpZXdlciBpcyBoYXBweSB3aXRoIHRoZSBwYXRjaAoK
SSBkb24ndCB0aGluayB0aGVyZSBzaG91bGQgZXZlciBiZSBzdWNoIGFuIGltcGxpY2F0aW9uLiBB
ZmFpYyB0aGVyZQphcmUgcGF0Y2hlcyBJIGNvbW1lbnQgdXBvbiwgYnV0IHRoYXQgSSBlaXRoZXIg
ZG9uJ3QgZmVlbCBxdWFsaWZpZWQKdG8gZ2l2ZSBhbiBhY2svUi1iIG9uLCBvciB0aGF0IEkgc2lt
cGx5IGRvbid0IHdhbnQgdG8gZm9yIHdoYXRldmVyCnJlYXNvbi4gQXQgYmVzdCwgbm8gb3RoZXIg
Y29tbWVudCAoYXMgaW4gdGhlIGFib3ZlIGV4YW1wbGUpIG1heSBiZQp0YWtlbiBhcyAiSSBkb24n
dCBvYmplY3QiLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
