Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A78817A3AB
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 12:07:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9oIl-0007CO-NL; Thu, 05 Mar 2020 11:04:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YWue=4W=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1j9oIj-0007CI-KA
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 11:04:25 +0000
X-Inumbo-ID: 11f5efec-5ed1-11ea-b74d-bc764e2007e4
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11f5efec-5ed1-11ea-b74d-bc764e2007e4;
 Thu, 05 Mar 2020 11:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pVjl1NOLpJ3wJ4dQWujRAc9JRPOr8i9fJLkLGO+nhfY=; b=bs4rXdk5MljqYwi0gRo5hy3vi/
 ZiNkPrfI9s0XknTJOrTeVyWDdKrNSsIKfioMDU3DzcL2/0J4xYIKFfwmLOiQndMoyxs4yrMeW3a8g
 tyxbfRRoSwN2Y0NR6tD91qom4e/cexmeamcMN0/3ubhRor5jIL0637nVxgyPMZ1xvfRc=;
Received: from [77.168.80.73] (port=6736 helo=[10.97.34.6])
 by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1j9oKd-000492-R8; Thu, 05 Mar 2020 12:06:23 +0100
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <d323139d-97ef-0c76-8ec6-a669f5b0ba2d@eikelenboom.it>
 <bb3965c5-6724-b261-260b-d07e40176802@suse.com>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <1bd973f7-f863-7401-870a-2569905e19a0@eikelenboom.it>
Date: Thu, 5 Mar 2020 12:04:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <bb3965c5-6724-b261-260b-d07e40176802@suse.com>
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

T24gMDUvMDMvMjAyMCAxMToxOCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAwNC4wMy4yMCAx
ODo1MiwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+PiBIaSBKdWVyZ2VuLAo+Pgo+PiBKdXN0
IHRlc3RlZCBhIDUuNi4wLXJjNCdpc2gga2VybmVsICg4YjYxNGNiOGYxZGNhYzhjYTc3Y2Y0ZGQ4
NWY0NmVmMzA1NWY4MjM4LCBzbyBpdCBpbmNsdWRlcyB0aGUgeGVuIGZpeGVzIGZyb20geDg2IHRy
ZWVzKS4KPj4gWGVuIGlzIHRoZSBsYXRlc3QgeGVuLXVuc3RhYmxlLCBkb20wIGtlcm5lbCBpcyA1
LjUuNy4KPj4KPj4gRHVyaW5nIGJvb3Qgb2YgdGhlIFBWSCBndWVzdCBJIGdvdCB0aGUgc3BsYXQg
YmVsb3cuCj4+IFdpdGggYSA1LjUuNyBrZXJuZWwgdGhlIGd1ZXN0IGJvb3RzIGZpbmUuCj4gCj4g
VGhlcmUgd2VyZSAyIGJ1Z3MuIEkgaGF2ZSBzZW50IHRoZSBwYXRjaGVzLgoKU3VyZSA/CkhhdmVu
J3Qgc2VlbiB0aGVtIGNvbWluZyBpbiAuLi4KCi0tClNhbmRlcgoKCj4gSW50ZXJlc3RpbmcsIHRo
b3VnaCwgdGhhdCB5b3UgZGlkIHNlZSBvbmx5IG9uZSBvZiB0aGVtIChJIGhpdCB0aGUKPiBzYW1l
IGJ1ZyBhcyB5b3UgZGlkIG9ubHkgYWZ0ZXIgZml4aW5nIHRoZSB4ZW5idXMgcHJvYmxlbSkuCj4g
Cj4gCj4gSnVlcmdlbgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
