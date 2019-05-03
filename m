Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CF5129E0
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 10:27:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMTUw-00068V-N1; Fri, 03 May 2019 08:24:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y7fs=TD=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hMTUv-00067y-Bl
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 08:24:49 +0000
X-Inumbo-ID: e965f5e3-6d7c-11e9-843c-bc764e045a96
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e965f5e3-6d7c-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 08:24:48 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 A3B8D301ACC1; Fri,  3 May 2019 11:24:46 +0300 (EEST)
Received: from [10.10.196.90] (unknown [195.210.5.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 7FB34306E4AC;
 Fri,  3 May 2019 11:24:46 +0300 (EEST)
To: Jan Beulich <JBeulich@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>
References: <20190502225430.5565-1-tamas@tklengyel.com>
 <5CCBF720020000780022B848@prv1-mh.provo.novell.com>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <5bbb6bd5-9533-40e1-e3d3-87da9bc557a8@bitdefender.com>
Date: Fri, 3 May 2019 11:24:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CCBF720020000780022B848@prv1-mh.provo.novell.com>
Content-Language: en-US-large
Subject: Re: [Xen-devel] [PATCH v3] x86/vm_event: add gdtr_base to the
 vm_event structure
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNS8zLzE5IDExOjA5IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAwMy4wNS4xOSBh
dCAwMDo1NCwgPHRhbWFzQHRrbGVuZ3llbC5jb20+IHdyb3RlOgo+PiBSZWNlaXZpbmcgdGhpcyBy
ZWdpc3RlciBpcyB1c2VmdWwgZm9yIGludHJvc3BlY3RpbmcgMzItYml0IFdpbmRvd3Mgd2hlbiB0
aGUKPj4gZXZlbnQgYmVpbmcgdHJhcHBlZCBoYXBwZW5lZCB3aGlsZSBpbiByaW5nMy4KPj4KPj4g
U2lnbmVkLW9mZi1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgo+PiBD
YzogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgo+PiBDYzogVGFt
YXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgo+PiBDYzogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgo+PiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4KPj4gQ2M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4+IENjOiBSb2dl
ciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+PiAtLS0KPj4gdjI6IGFkZCBnZHRy
IGxpbWl0Cj4+IHYzOiB1c2UgdWludDMyX3QgdG8gZml0IHRoZSAyMCBiaXRzCj4gCj4gQXMgcGVy
IEFuZHJldydzIHJlc3BvbnNlIEkgdGhpbmsgdjIgaXMgaXQuCgpZZXMsIHBsZWFzZS4gVGhpcyB3
aWxsIGFsc28gYWxsb3cgdXMgdG8gcmV1c2UgdGhlIGV4aXN0aW5nIChyZW1haW5pbmcpIApwYWQg
Yml0cyBpbiB0aGUgZnV0dXJlIGZvciBhbm90aGVyIGxpbWl0IChmb3IgaWR0ciwgcGVyaGFwcyku
CgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
