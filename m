Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C4711A5C0
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 09:20:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iexBC-00083s-1X; Wed, 11 Dec 2019 08:17:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=K8rm=2B=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iexBA-00083n-EN
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 08:17:04 +0000
X-Inumbo-ID: 9ba5e592-1bee-11ea-88e7-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ba5e592-1bee-11ea-88e7-bc764e2007e4;
 Wed, 11 Dec 2019 08:17:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 072BEAB9D;
 Wed, 11 Dec 2019 08:17:00 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <ec80c318-355b-21cf-2152-f396c41dda16@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <b7ae9bd5-477f-40d7-27f1-68aaf2745b1a@suse.com>
Date: Wed, 11 Dec 2019 09:16:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <ec80c318-355b-21cf-2152-f396c41dda16@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] clock source in PV Linux
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMTIuMTkgMDg6MjgsIEphbiBCZXVsaWNoIHdyb3RlOgo+IErDvHJnZW4sIEJvcmlzLAo+
IAo+IEkndmUgbm90aWNlZAo+IAo+IDw2PmNsb2Nrc291cmNlOiBTd2l0Y2hlZCB0byBjbG9ja3Nv
dXJjZSB0c2MKPiAKPiBhcyB0aGUgZmluYWwgY2xvY2tzb3VyY2UgcmVsYXRlZCBib290IG1lc3Nh
Z2UgaW4gYSBQViBEb20wJ3MKPiBsb2cgd2l0aCA1LjQuMi4gSXMgaXQgaW50ZW50aW9uYWwgdGhh
dCBpdCdzIG5vdCB0aGUgInhlbiIgb25lCj4gdGhhdCBnZXRzIHVzZWQgYnkgZGVmYXVsdD8KCkkg
dGhpbmsgdGhpcyBpcyBmaW5lLiBJIGp1c3QgdGVzdGVkIGl0IGFuZCBJJ20gc2VlaW5nIHRoZSBz
YW1lIGluIGRvbTAsCndoaWxlIGluIGEgUFYgZG9tVSAieGVuIiBpcyB1c2VkIHBlciBkZWZhdWx0
LgoKSW4gZG9tMCAidHNjIiBzaG91bGQgYmUgb2theSBpbiBjYXNlIGl0IGlzIHN0YWJsZS4gT3Ig
YXJlIHlvdSBleHBlY3RpbmcKcHJvYmxlbXMgd2l0aCB0aGF0IHNldHRpbmc/CgoKSnVlcmdlbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
