Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4307D11A62A
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 09:44:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iexY7-0001xm-6E; Wed, 11 Dec 2019 08:40:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bHGM=2B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iexY5-0001xc-B5
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 08:40:45 +0000
X-Inumbo-ID: ead886f8-1bf1-11ea-88e7-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ead886f8-1bf1-11ea-88e7-bc764e2007e4;
 Wed, 11 Dec 2019 08:40:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7C342AFA9;
 Wed, 11 Dec 2019 08:40:42 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <ec80c318-355b-21cf-2152-f396c41dda16@suse.com>
 <b7ae9bd5-477f-40d7-27f1-68aaf2745b1a@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7157118a-a40b-e72c-3924-1acefc4b9e35@suse.com>
Date: Wed, 11 Dec 2019 09:41:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <b7ae9bd5-477f-40d7-27f1-68aaf2745b1a@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMTIuMjAxOSAwOToxNiwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAxMS4xMi4xOSAw
ODoyOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IErDvHJnZW4sIEJvcmlzLAo+Pgo+PiBJJ3ZlIG5v
dGljZWQKPj4KPj4gPDY+Y2xvY2tzb3VyY2U6IFN3aXRjaGVkIHRvIGNsb2Nrc291cmNlIHRzYwo+
Pgo+PiBhcyB0aGUgZmluYWwgY2xvY2tzb3VyY2UgcmVsYXRlZCBib290IG1lc3NhZ2UgaW4gYSBQ
ViBEb20wJ3MKPj4gbG9nIHdpdGggNS40LjIuIElzIGl0IGludGVudGlvbmFsIHRoYXQgaXQncyBu
b3QgdGhlICJ4ZW4iIG9uZQo+PiB0aGF0IGdldHMgdXNlZCBieSBkZWZhdWx0Pwo+IAo+IEkgdGhp
bmsgdGhpcyBpcyBmaW5lLiBJIGp1c3QgdGVzdGVkIGl0IGFuZCBJJ20gc2VlaW5nIHRoZSBzYW1l
IGluIGRvbTAsCj4gd2hpbGUgaW4gYSBQViBkb21VICJ4ZW4iIGlzIHVzZWQgcGVyIGRlZmF1bHQu
Cj4gCj4gSW4gZG9tMCAidHNjIiBzaG91bGQgYmUgb2theSBpbiBjYXNlIGl0IGlzIHN0YWJsZS4g
T3IgYXJlIHlvdSBleHBlY3RpbmcKPiBwcm9ibGVtcyB3aXRoIHRoYXQgc2V0dGluZz8KCldlbGws
IGZpcnN0IG9mIGFsbCBJIGZvdW5kIHRoaXMgc3VycHJpc2luZy4gV2hldGhlciB0aGVyZSBhcmUg
cHJvYmxlbXMgdG8KYmUgZXhwZWN0ZWQgbGFyZ2VseSBkZXBlbmRzIG9uIHRoZSByZWxpYWJpbGl0
eSBvZiB0aGUgInN0YWJsZSIgZGV0ZWN0aW9uCmluIFBWIERvbTAuCgpKYW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
