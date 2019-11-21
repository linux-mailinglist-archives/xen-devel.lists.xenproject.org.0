Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C13105604
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 16:50:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXogH-0006Ny-JJ; Thu, 21 Nov 2019 15:47:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=erj2=ZN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iXogG-0006No-FX
 for xen-devel@lists.xen.org; Thu, 21 Nov 2019 15:47:40 +0000
X-Inumbo-ID: 3f27f972-0c76-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f27f972-0c76-11ea-9631-bc764e2007e4;
 Thu, 21 Nov 2019 15:47:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 20BD4AF79;
 Thu, 21 Nov 2019 15:47:39 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <CAO9XypWibNu0iDnJsZXkQ+=Ecd6eThnu+td4O3VVLMe+qJ80eQ@mail.gmail.com>
 <76a91fb3-d2b0-dd23-7e99-0015fbee5990@suse.com>
 <CAO9XypVpBAPk8Hakqt7jJ08pCUhR_GzNxDWh2D-CGfp0+tfaAA@mail.gmail.com>
 <3b8d187e-c4d5-a7a5-76c2-874db47440ee@suse.com>
 <CAO9XypVNhSd8hPu1nA1uP8PVCPVgW-Bs_q6gmPky6Px0-U6G+w@mail.gmail.com>
 <04b95cfb-afa0-b6ba-2e69-74b56edbf4c4@suse.com>
 <CAO9XypVS1vfZu+ZJ_dK9VRTEhMR7y8viceAmOufCpvDLt-sXHw@mail.gmail.com>
 <0276e934-4a59-386f-87ee-2b801fd26dae@suse.com>
 <005596b6-9228-801b-300a-57807a96d051@suse.com>
 <38cd1016-d390-b722-24ce-dbf71ad57635@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c323ab14-e15d-8384-dbc6-a8c8540ea86d@suse.com>
Date: Thu, 21 Nov 2019 16:47:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <38cd1016-d390-b722-24ce-dbf71ad57635@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen hiding thermal capabilities from Dom0
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
Cc: Rishi <2rushikeshj@gmail.com>, xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMTEuMjAxOSAxNjo0NiwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAyMS4xMS4xOSAx
NjozNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDIxLjExLjIwMTkgMTU6MjQsIErDvHJnZW4g
R3Jvw58gd3JvdGU6Cj4+PiBTbzogbm8sIGp1c3QgZ2l2aW5nIGRvbTAgYWNjZXNzIHRvIHRoZSBt
YW5hZ2VtZW50IGhhcmR3YXJlIGlzbid0IGdvaW5nCj4+PiB0byBmbHkuIFlvdSBuZWVkIHRvIGhh
dmUgYSBwcm9wZXIgdmlydHVhbGl6YXRpb24gbGF5ZXIgZm9yIHRoYXQgcHVycG9zZS4KPj4KPj4g
T3IsIGxpa2UgSSBoYWQgZG9uZSBpbiBvdXIgWGVub0xpbnV4IGZvcndhcmQgcG9ydCwgeW91IG5l
ZWQgdG8KPj4gZ28gdGhyb3VnaCBob29wcyB0byBtYWtlIHRoZSBjb3JldGVtcCBkcml2ZXIgYWN0
dWFsbHkgdW5kZXJzdGFuZAo+PiB0aGUgZW52aXJvbm1lbnQgaXQncyBydW5uaW5nIGluLgo+IAo+
IFRoaXMgd2lsbCBzdGlsbCBub3QgZ3VhcmFudGVlIHlvdSdsbCBiZSBhYmxlIHRvIHJlYWNoIGFs
bCBwaHlzaWNhbAo+IGNwdXMuIElJUkMgeW91IHBpbm5lZCB0aGUgdmNwdSB0byB0aGUgcmVzcGVj
dGl2ZSBwaHlzaWNhbCBjcHUgZm9yCj4gcGVyZm9ybWluZyBpdHMgZHV0eSwgYnV0IHdpdGggY3B1
cG9vbHMgdGhpcyBtaWdodCBub3QgYmUgcG9zc2libGUgZm9yCj4gYWxsIHBoeXNpY2FsIGNwdXMg
aW4gdGhlIHN5c3RlbS4KCkNvcnJlY3QgLSB0aGF0IHdvcmsgcHJlZGF0ZWQgQ1BVIHBvb2xzIGJ5
IHF1aXRlIGEgYml0LCBJIHRoaW5rLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
