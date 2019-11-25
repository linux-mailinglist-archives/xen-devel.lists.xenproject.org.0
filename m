Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5F3108A06
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 09:27:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZ9h2-0002aK-BG; Mon, 25 Nov 2019 08:26:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7DUC=ZR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iZ9h1-0002aD-5R
 for xen-devel@lists.xen.org; Mon, 25 Nov 2019 08:25:59 +0000
X-Inumbo-ID: 3463ba96-0f5d-11ea-b08b-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3463ba96-0f5d-11ea-b08b-bc764e2007e4;
 Mon, 25 Nov 2019 08:25:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C8E9BAC9D;
 Mon, 25 Nov 2019 08:25:56 +0000 (UTC)
To: Elliott Mitchell <ehem+xen@m5p.com>
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
 <20191123042906.GA79247@mattapan.m5p.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <bd02527e-9a8e-3a66-bdd6-13d200dacb3b@suse.com>
Date: Mon, 25 Nov 2019 09:25:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191123042906.GA79247@mattapan.m5p.com>
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
Cc: Rishi <2rushikeshj@gmail.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xen.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMTEuMTkgMDU6MjksIEVsbGlvdHQgTWl0Y2hlbGwgd3JvdGU6Cj4gT24gVGh1LCBOb3Yg
MjEsIDIwMTkgYXQgMDQ6NDY6MjFQTSArMDEwMCwgSj8/cmdlbiBHcm8/PyB3cm90ZToKPj4gT24g
MjEuMTEuMTkgMTY6MzYsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gT24gMjEuMTEuMjAxOSAxNToy
NCwgSj8/cmdlbiBHcm8/PyB3cm90ZToKPj4+PiBTbzogbm8sIGp1c3QgZ2l2aW5nIGRvbTAgYWNj
ZXNzIHRvIHRoZSBtYW5hZ2VtZW50IGhhcmR3YXJlIGlzbid0IGdvaW5nCj4+Pj4gdG8gZmx5LiBZ
b3UgbmVlZCB0byBoYXZlIGEgcHJvcGVyIHZpcnR1YWxpemF0aW9uIGxheWVyIGZvciB0aGF0IHB1
cnBvc2UuCj4+Pgo+Pj4gT3IsIGxpa2UgSSBoYWQgZG9uZSBpbiBvdXIgWGVub0xpbnV4IGZvcndh
cmQgcG9ydCwgeW91IG5lZWQgdG8KPj4+IGdvIHRocm91Z2ggaG9vcHMgdG8gbWFrZSB0aGUgY29y
ZXRlbXAgZHJpdmVyIGFjdHVhbGx5IHVuZGVyc3RhbmQKPj4+IHRoZSBlbnZpcm9ubWVudCBpdCdz
IHJ1bm5pbmcgaW4uCj4+Cj4+IFRoaXMgd2lsbCBzdGlsbCBub3QgZ3VhcmFudGVlIHlvdSdsbCBi
ZSBhYmxlIHRvIHJlYWNoIGFsbCBwaHlzaWNhbAo+PiBjcHVzLiBJSVJDIHlvdSBwaW5uZWQgdGhl
IHZjcHUgdG8gdGhlIHJlc3BlY3RpdmUgcGh5c2ljYWwgY3B1IGZvcgo+PiBwZXJmb3JtaW5nIGl0
cyBkdXR5LCBidXQgd2l0aCBjcHVwb29scyB0aGlzIG1pZ2h0IG5vdCBiZSBwb3NzaWJsZSBmb3IK
Pj4gYWxsIHBoeXNpY2FsIGNwdXMgaW4gdGhlIHN5c3RlbS4KPiAKPiBTaW1pbGFyIHRvIHRoZSBp
c3N1ZSBvZiBNQ0Ugc3VwcG9ydCwgbWlnaHQgaXQgaW5zdGVhZCBiZSBiZXR0ZXIgdG8gaGF2ZQo+
ICpsZXNzKiB2aXJ0dWFsaXphdGlvbiBoZXJlIGluc3RlYWQgb2YgbW9yZT8gIFRoZSBvcmlnaW5h
bCBpZGVhIGJlaGluZCBYZW4KPiB3YXMgdG8gbGVhdmUgdGhlIGhhcmQgdG8gdmlydHVhbGl6ZSBi
aXRzIHZpc2libGUgYW5kIHdvcmsgd2l0aCBEb21haW4gMC4KPiAKPiBNaWdodCBpdCBiZSBiZXR0
ZXIgdG8gZXhwb3NlIHRoaXMgZnVuY3Rpb25hbGl0eSB0byBEb21haW4gMCwgdGhlbgo+IGludGVy
Y2VwdCB0aGUga2VybmVsIGNhbGxzPyAgSnVzdCBuZWVkcyAxIHZjcHUgd2hpY2ggY2FuIGJlIHNj
aGVkdWxlZCBvbgo+IGFueSBwcm9jZXNzb3IgYW5kIHRoYXQgY2FuIGJlIG1vdmVkIGFyb3VuZCB0
byByZXRyaWV2ZSB0aGUgZGF0YS4gIFRoaXMKPiB3YXkgWGVuIHdvdWxkbid0IG5lZWQgYSBwcm9w
ZXIgZHJpdmVyIGZvciB0aGUgbWFuYWdlbWVudCBoYXJkd2FyZS4KCkluIGNhc2UgZG9tMCBpcyB0
byBoYW5kbGUgdGhpcyB0aGVuIGl0IHdvdWxkIGJlIG11Y2ggZWFzaWVyIHRvIGhhdmUgYQp3YXkg
Zm9yIGRvbTAgdG8gc3BlY2lmeSB3aGljaCBwaHlzaWNhbCBjcHUgdGhlIGRhdGEgc2hvdWxkIGJl
IHJldHJpZXZlZApmcm9tLiBGb3JjaW5nIGEgZG9tMCB2Y3B1IHRvIHJ1biBvbiBhIHNwZWNpZmlj
IHBoeXNpY2FsIGNwdSB3b3VsZCBuZWVkCmEgbWFqb3IgcmV3b3JrIG9mIHRoZSBYZW4gc2NoZWR1
bGluZyAoZXNwZWNpYWxseSByZWdhcmRpbmcgY3B1cG9vbHMsIGxldAphbG9uZSBjb3JlIHNjaGVk
dWxpbmcpLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
