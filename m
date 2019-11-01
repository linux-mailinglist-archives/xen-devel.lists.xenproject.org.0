Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B279EC14B
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2019 11:35:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQUEm-00019C-0q; Fri, 01 Nov 2019 10:33:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ES3X=YZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iQUEk-000197-N4
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2019 10:32:58 +0000
X-Inumbo-ID: f7f90980-fc92-11e9-955d-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f7f90980-fc92-11e9-955d-12813bfff9fa;
 Fri, 01 Nov 2019 10:32:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 26DAAB673;
 Fri,  1 Nov 2019 10:32:56 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20191030130143.30964-1-aisaila@bitdefender.com>
 <50a1845a-b909-6cd0-1c9e-a2cb33fb41db@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <98c1c4bb-07c5-a13d-0783-5a9fd23d480f@suse.com>
Date: Fri, 1 Nov 2019 11:32:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <50a1845a-b909-6cd0-1c9e-a2cb33fb41db@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v1] x86/hvm: Update code in
 HVMOP_altp2m_set_suppress_ve
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
Cc: "jbeulich@suse.com" <jbeulich@suse.com>, "wl@xen.org" <wl@xen.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMTAuMTkgMTU6MTQsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMzAvMTAvMjAxOSAx
MzowMiwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4+IE9yaWdpbmFsbHkgdGhlIGdm
biBhbmQgYWx0cDJtX2lkeCBhcmUgYXNzaWduZWQgZnJvbSB0aGUgYS51Lm1lbV9hY2Nlc3MgdW5p
b24uCj4+IFRoaXMgd29ya3MgYmVjYXVzZSBpdCdzIHRoZSBzYW1lIG1lbW9yeSB1c2VkLiBUaGlz
IHBhdGNoIGFkZHJlc3NlcyB0aGlzCj4+IGlzc3VlIGJ5IGNoYW5naW5nIHRoZSBtZW1fYWNjZXNz
IHVuaW9uIHdpdGggdGhlIHN1cHByZXNzX3ZlIHVuaW9uIGZvcgo+PiBjb25zaXN0ZW5jeS4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5j
b20+Cj4gCj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+Cj4gCj4gQ0MgSnVlcmdlbi4gVGhpcyB3YW50cyBiYWNrcG9ydGluZywgc28gc2hvdWxk
IGJlIGluY2x1ZGVkIGluIDQuMTMKClJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
