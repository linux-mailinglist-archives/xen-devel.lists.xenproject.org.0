Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 048EF17A403
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 12:16:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9oRY-0008T5-Sb; Thu, 05 Mar 2020 11:13:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YWue=4W=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1j9oRX-0008T0-QE
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 11:13:31 +0000
X-Inumbo-ID: 57aa66e8-5ed2-11ea-a565-12813bfff9fa
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 57aa66e8-5ed2-11ea-a565-12813bfff9fa;
 Thu, 05 Mar 2020 11:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eyfIMXjmL6HGrxriluW6p04Q9Bp2OTgLI/nlQbiw3dI=; b=iD+QA+DBX+U3KoCd0EAFqU7sib
 iTrPrXzKJRs0o7TMqUpb3OwVfUjuLG6df9ld8WLCbBy2JFD3YiE06xWKfP2PVYz6fv2d+XKYX6WfS
 vNAeO/S2hPV0SpaAPzBHALOTOQRHqNI6ubE8zVvwZ8cQ9IWEdrPDmjdSCTFBZxF5swBA=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:34132
 helo=[10.97.34.6]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1j9oTS-0004Av-MW; Thu, 05 Mar 2020 12:15:30 +0100
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <d323139d-97ef-0c76-8ec6-a669f5b0ba2d@eikelenboom.it>
 <bb3965c5-6724-b261-260b-d07e40176802@suse.com>
 <1bd973f7-f863-7401-870a-2569905e19a0@eikelenboom.it>
 <c95163ff-39a5-259a-16b4-23534ce4d2a5@suse.com>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <db0a09d0-55a5-4f49-c9fa-67c4f074935c@eikelenboom.it>
Date: Thu, 5 Mar 2020 12:13:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c95163ff-39a5-259a-16b4-23534ce4d2a5@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] xen boot PVH guest with linux 5.6.0-rc4-ish kernel:
 general protection fault, RIP: 0010:__pv_queued_spin_lock_slowpath
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
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUvMDMvMjAyMCAxMjowNiwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAwNS4wMy4yMCAx
MjowNCwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+PiBPbiAwNS8wMy8yMDIwIDExOjE4LCBK
w7xyZ2VuIEdyb8OfIHdyb3RlOgo+Pj4gT24gMDQuMDMuMjAgMTg6NTIsIFNhbmRlciBFaWtlbGVu
Ym9vbSB3cm90ZToKPj4+PiBIaSBKdWVyZ2VuLAo+Pj4+Cj4+Pj4gSnVzdCB0ZXN0ZWQgYSA1LjYu
MC1yYzQnaXNoIGtlcm5lbCAoOGI2MTRjYjhmMWRjYWM4Y2E3N2NmNGRkODVmNDZlZjMwNTVmODIz
OCwgc28gaXQgaW5jbHVkZXMgdGhlIHhlbiBmaXhlcyBmcm9tIHg4NiB0cmVlcykuCj4+Pj4gWGVu
IGlzIHRoZSBsYXRlc3QgeGVuLXVuc3RhYmxlLCBkb20wIGtlcm5lbCBpcyA1LjUuNy4KPj4+Pgo+
Pj4+IER1cmluZyBib290IG9mIHRoZSBQVkggZ3Vlc3QgSSBnb3QgdGhlIHNwbGF0IGJlbG93Lgo+
Pj4+IFdpdGggYSA1LjUuNyBrZXJuZWwgdGhlIGd1ZXN0IGJvb3RzIGZpbmUuCj4+Pgo+Pj4gVGhl
cmUgd2VyZSAyIGJ1Z3MuIEkgaGF2ZSBzZW50IHRoZSBwYXRjaGVzLgo+Pgo+PiBTdXJlID8KPj4g
SGF2ZW4ndCBzZWVuIHRoZW0gY29taW5nIGluIC4uLgo+IAo+IGh0dHBzOi8vcGF0Y2hldy5vcmcv
WGVuLzIwMjAwMzA1MTAwMzMxLjE2NzkwLTEtamdyb3NzQHN1c2UuY29tLwo+IGh0dHBzOi8vcGF0
Y2hldy5vcmcvWGVuLzIwMjAwMzA1MTAwMzIzLjE2NzM2LTEtamdyb3NzQHN1c2UuY29tLwo+IAo+
IAo+IEp1ZXJnZW4KPiAKQWggSSB3YXMgbm90IENDJ2VkLgoKV2lsbCBnaXZlIHRoZW0gYSB0ZXN0
LCB0aGFua3MuCgotLQpTYW5kZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
