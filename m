Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F63D0D04
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 12:44:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iI9P2-0003T4-J5; Wed, 09 Oct 2019 10:41:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GB/u=YC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iI9P0-0003Sz-Pu
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 10:41:06 +0000
X-Inumbo-ID: 4b978e3c-ea81-11e9-96dc-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b978e3c-ea81-11e9-96dc-bc764e2007e4;
 Wed, 09 Oct 2019 10:41:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B8EF1AE5C;
 Wed,  9 Oct 2019 10:41:04 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <09d5e0bc-074e-90c5-f0a6-60e1be23d92f@citrix.com>
 <67e9bc2c-82dc-5fd7-9b8c-29d564a30ddb@suse.com>
 <20191009101116.GA1389@Air-de-Roger.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dd2b5da6-e1fc-a490-9276-8ad44721fa9e@suse.com>
Date: Wed, 9 Oct 2019 12:41:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191009101116.GA1389@Air-de-Roger.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] HPET interrupt remapping during boot
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTAuMjAxOSAxMjoxMSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gQW5kIGl0IGRv
ZXMgcHJpbnQgdGhlIGZvbGxvd2luZyB3aGVuIHNldHRpbmcgdXAgdGhlIGlvbW11Ogo+IAo+IChY
RU4pIGlvYXBpYyAwIHBpbiAwIG5vdCBtYXNrZWQKPiAoWEVOKSB2ZWM9MDAgZGVsaXZlcnk9RXhJ
TlQgZGVzdD1QIHN0YXR1cz0wIHBvbGFyaXR5PTAgaXJyPTAgdHJpZz1FIG1hc2s9MCBkZXN0X2lk
OjAwMDEwMDAwCj4gCj4gSSB3b25kZXIsIHNob3VsZG4ndCBhbGwgcGlucyBvZiBhbGwgdGhlIGlv
LWFwaWNzIGJlIG1hc2tlZCBhdCBib290PwoKSSB0aGluayB5b3UgbWlnaHQgZ2V0IGRpZmZlcmVu
dCBhbnN3ZXJzIGhlcmUgZGVwZW5kaW5nIG9uIHdoZXRoZXIKeW91IGFzayBmaXJtd2FyZSBvciBP
UyBwZW9wbGUuIEluIGZhY3QgdGhlcmUgYXJlIGNhc2VzIHdoZXJlIHRoZQpJTy1BUElDIG5lZWRz
IHRvIGJlIGxlZnQgaW4gdGhpcyBzdGF0ZSwgSSB0aGluaywgYnV0IHN1Y2ggd291bGQKbGlrZWx5
IG5lZWQgcHJvcGVybHkgcmVmbGVjdGluZyBpbiBBQ1BJIHRhYmxlcyAoYWxiZWl0IEkgZG9uJ3QK
a25vdy9yZWNhbGwgaG93IHRoaXMgd291bGQgYmUgZG9uZTsgbG9va2luZyBhdCB0aGUgY29kZSAp
LiBUaGlzIGdvZXMgYmFjayB0byB0aW1lcwp3aGVuIElPLUFQSUNzIHdlcmUgbmV3IGFuZCBPU2Vz
IHdvdWxkIG5vdCBldmVuIGtub3cgYWJvdXQgdGhlbSwKeWV0IHRoZXkgd291bGRuJ3QgZ2V0IGFu
eSBpbnRlcnJ1cHRzIHRvIHdvcmsgaWYgZmlkZGxpbmcgd2l0aApvbmx5IHRoZSBQSUMgKHNpdHRp
bmcgYmVoaW5kIElPLUFQSUMgcGluIDApLgoKU2VlIGVuYWJsZV9JT19BUElDKCksIHdoZXJlIHdl
IGFjdHVhbGx5IHVzZSB0aGlzIHByb3BlcnR5IHRvCmRldGVybWluZSB0aGUgcGluIGJlaGluZCB3
aGljaCB0aGUgODI1OSBzaXRzLgoKSSd2ZSBzZWVuIHF1aXRlIG1hbnkgc3lzdGVtcyB3aGVyZSBp
biB0aGUgQklPUyBzZXR1cCB5b3UgaGF2ZSBhbgpvcHRpb24gdG8gc2VsZWN0IHdoZXRoZXIgeW91
IGhhdmUgYW4gIkFDUEkgT1MiICh3b3JkaW5nIG9mIGNvdXJzZQp2YXJpZXMpLiBJJ3ZlIG5ldmVy
IGNoZWNrZWQgd2hldGhlciB0aGlzIG1heSBlLmcuIHJlZmxlY3QgaXRzZWxmCmluIHRoZSBoYW5k
b3ZlciBzdGF0ZSBvZiB0aGUgR1NJIDAgUlRFLgoKSW4geW91ciB0ZXN0aW5nIHBhdGNoLCBjb3Vs
ZCB5b3UgYWxzbyBsb2cgdGhlIFBJQyBtYXNrIGJ5dGVzPwpUaGVyZSBvdWdodCB0byBiZSBhdCBs
ZWFzdCBvbmUgdW5tYXNrZWQ7IG9yIHdhaXQgLSB0aGVyZSBhY3R1YWxseQppcyBhIHNwdXJpb3Vz
IGludGVycnVwdCB0aGVyZSAocmlnaHQgYmVmb3JlIElPTU1VIGluaXRpYWxpemF0aW9uKToKCihY
RU4pIHNwdXJpb3VzIDgyNTlBIGludGVycnVwdDogSVJRNy4KCkhlbmNlIEkgd29uZGVyIGlmIHRo
ZXJlJ3Mgbm90IHBvc3NpYmx5IGEgMm5kIG9uZSBvbmNlIHRoZSBJT01NVQpoYXMgYmVlbiBzZXQg
dXAuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
