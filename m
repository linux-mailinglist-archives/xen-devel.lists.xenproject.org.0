Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 440CAC1D9E
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 11:03:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iErXD-0005sC-AO; Mon, 30 Sep 2019 08:59:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H1QO=XZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iErXC-0005s1-5p
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 08:59:58 +0000
X-Inumbo-ID: acf18f98-e360-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id acf18f98-e360-11e9-bf31-bc764e2007e4;
 Mon, 30 Sep 2019 08:59:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A9FF3AF7E;
 Mon, 30 Sep 2019 08:59:56 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20190928082659.45482-1-roger.pau@citrix.com>
 <95aa17310e8b46619a0a701e416d6c47@AMSPEX02CL03.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d54a0367-a9e0-048d-95a7-1e9f89e73077@suse.com>
Date: Mon, 30 Sep 2019 11:00:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <95aa17310e8b46619a0a701e416d6c47@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/iommu: fix hwdom iommu requirements
 check
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <Paul.Durrant@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDkuMjAxOSAwOTo1MiwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPgo+PiBTZW50OiAyOCBTZXB0ZW1iZXIgMjAxOSAwOToyNwo+PiBUbzogeGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCj4+IENjOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPjsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgUGF1bCBEdXJyYW50Cj4+
IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KPj4gU3ViamVjdDogW1BBVENIXSB4ODYvaW9tbXU6IGZpeCBod2RvbSBpb21tdSByZXF1aXJl
bWVudHMgY2hlY2sKPj4KPj4gQm90aCBhIHNoYWRvdyBhbmQgYSBIQVAgaHdkb20gcmVxdWlyZSBh
biBpb21tdSBhbmQgbXVzdCBiZSBydW4gaW4KPj4gc3RyaWN0IG1vZGUuIENoYW5nZSB0aGUgSEFQ
IGNoZWNrIGludG8gYSBodm0gZG9tYWluIGNoZWNrLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiAKPiBZZXMsIEkgY29tcGxldGVs
eSBmb3Jnb3QgdGhhdCBpdCBpcyBsZWdpdGltYXRlIGZvciBhIFBWSCBkb20wIHRvIG9wZXJhdGUg
aW4gc2hhZG93IG1vZGUuCj4gCj4gUmV2aWV3ZWQtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJy
YW50QGNpdHJpeC5jb20+CgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
