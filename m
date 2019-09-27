Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C54C0487
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 13:44:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDods-0000Pm-1b; Fri, 27 Sep 2019 11:42:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Rbpq=XW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iDodq-0000PS-3C
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 11:42:30 +0000
X-Inumbo-ID: e250731c-e11b-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id e250731c-e11b-11e9-bf31-bc764e2007e4;
 Fri, 27 Sep 2019 11:42:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9CF89B156;
 Fri, 27 Sep 2019 11:42:28 +0000 (UTC)
To: Ian Jackson <ian.jackson@citrix.com>
References: <20190927090048.28872-1-jgross@suse.com>
 <20190927090048.28872-4-jgross@suse.com>
 <23949.59145.294340.493306@mariner.uk.xensource.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <38a45f2e-03e6-bc2f-bd45-8a25c4ea8c45@suse.com>
Date: Fri, 27 Sep 2019 13:42:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <23949.59145.294340.493306@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v1 3/6] libs: add libxenhypfs
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDkuMTkgMTI6NDAsIElhbiBKYWNrc29uIHdyb3RlOgo+IEp1ZXJnZW4gR3Jvc3Mgd3Jp
dGVzICgiW1BBVENIIHYxIDMvNl0gbGliczogYWRkIGxpYnhlbmh5cGZzIik6Cj4+IEFkZCB0aGUg
bmV3IGxpYnJhcnkgbGlieGVuaHlwZnMgZm9yIGFjY2VzcyB0byB0aGUgaHlwZXJ2aXNvciBmaWxl
c3lzdGVtLgo+IAo+IFRoaXMgY29kZSBsb29rcyBhcyBleHBlY3RlZCB0byBtZS4KPiAKPiBBY2tl
ZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gCj4gSXQgZG9l
cyBtYWtlIG1lIHRoaW5nIHlvdSBoYXZlIGhhZCB0byB3cml0ZSByYXRoZXIgYSBsb3Qgb2YgcmF0
aGVyCj4gYm9yaW5nIChhbmQgaW4gc29tZSBjYXNlcywgZmlkZGx5KSBjb2RlLiAgSSdtIG5vdCBz
dXJlIHRoYXQgSSBoYXZlIGEKPiBnb29kIGFuc3dlciB0byB0aGlzLiAgSW4gYW55IGNhc2UgaXQn
cyBub3QgeW91ciBmYXVsdCA6LSkuCgpDb3B5LWFuZC1wYXN0ZSBhcmUgdGhlIGRldmVsb3Blcidz
IGJlc3QgZnJpZW5kcy4gOy0pCgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
