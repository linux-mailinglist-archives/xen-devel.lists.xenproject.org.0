Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0DEC8D7F
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 17:59:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFgxa-00080X-HF; Wed, 02 Oct 2019 15:54:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lglc=X3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iFgxZ-00080S-Ex
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 15:54:37 +0000
X-Inumbo-ID: ee82d00c-e52c-11e9-9719-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id ee82d00c-e52c-11e9-9719-12813bfff9fa;
 Wed, 02 Oct 2019 15:54:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C63E0ADB3;
 Wed,  2 Oct 2019 15:54:34 +0000 (UTC)
To: Ian Jackson <ian.jackson@citrix.com>
References: <cover.ab9be47e05c2dc2aa047d0a810c29ecd14bfe463.1569680095.git-series.marmarek@invisiblethingslab.com>
 <9a61b361c46b5b1082ef47ac6aa25f8b5db7646b.1569680095.git-series.marmarek@invisiblethingslab.com>
 <23956.50605.996440.673345@mariner.uk.xensource.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <ad3306d7-6567-a8f1-7cb5-c408fba20934@suse.com>
Date: Wed, 2 Oct 2019 17:54:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <23956.50605.996440.673345@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v8 1/4] libxl: fix cold plugged PCI device
 with stubdomain
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMTAuMTkgMTc6NDMsIElhbiBKYWNrc29uIHdyb3RlOgo+IEhpIEp1ZXJnZW4uICBUaGlz
IHNlcmllcwo+ICAgIGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94
ZW4tZGV2ZWwvMjAxOS0wOS9tc2cwMzA3Mi5odG1sCj4gbmVlZHMgeW91ciByZWxlYXNlIHJldmll
dy4KCkZpciB0aGUgc2VyaWVzOgoKUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPgoKZXZlbiBpZiBJIGRvbid0IHNlZSB3aHkgaXQgaXMgbmVjZXNzYXJ5OiB0
aGUgc2VyaWVzIHdhcyBwb3N0ZWQgZmlyc3Qgd2F5CmJlZm9yZSBsYXN0IHBvc3RpbmcgZGF0ZS4K
CgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
