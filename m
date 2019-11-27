Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3543A10AC60
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 10:03:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZtC9-0005Z4-GF; Wed, 27 Nov 2019 09:01:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zCzl=ZT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZtC8-0005Yz-5b
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 09:01:08 +0000
X-Inumbo-ID: 7211bd49-10f4-11ea-a3ae-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7211bd49-10f4-11ea-a3ae-12813bfff9fa;
 Wed, 27 Nov 2019 09:01:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 596F6B4A7;
 Wed, 27 Nov 2019 09:01:06 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Roman Shaposhnik <roman@zededa.com>
References: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
 <CAMmSBy9Ti3nCt2EhT6XOcrBLWabpPqQFHA1G-Fc4N3gRg1qPUg@mail.gmail.com>
 <91d6b37f-6f83-183d-6b1e-297c0381af75@citrix.com>
 <CAMmSBy-Pr23H1U00S5rJWP205FSkx4HX-GiSkKygyopwf3FD9w@mail.gmail.com>
 <20191125004706.GB2012@mail-itl>
 <CAMmSBy9gkVR-ua9=kVn9rNSb2VnvvtzaLL=ZM-GXxCdtRGRtvA@mail.gmail.com>
 <20191126035517.GT5763@mail-itl>
 <CAMmSBy8yawo0Oc0Ba90Cox7jb+vNoQfMqA1Uqap2XGsL-x8ONw@mail.gmail.com>
 <CAMmSBy_2gQCPOJjo-VWZ3gmbER+5QPNJyQJN3u_SgKDGZQadGg@mail.gmail.com>
 <20191126183202.GV5763@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3d0a25d4-2df8-e98e-9fdc-26c830de49a7@suse.com>
Date: Wed, 27 Nov 2019 10:01:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191126183202.GV5763@mail-itl>
Content-Language: en-US
Subject: Re: [Xen-devel] UEFI support on Dell boxes
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMTEuMjAxOSAxOTozMiwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICB3cm90ZToK
PiBBbnl3YXksIGlmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHksIE1NSU8gcmVnaW9uIHNob3VsZCBi
ZSBtYXBwZWQgYXMgVUMsCj4gcmlnaHQ/CgpXaGlsZSBNTUlPIHR5cGljYWxseSB3b3VsZCB3YW50
IHRvIGJlIFVDLCB0aGVyZSBhcmUgY2xlYXJseSBjYXNlcwp3aGVyZSB0aGV5J2QgYmV0dGVyIGJl
IFdDLCBhbmQgdGhlcmUgbWF5IGV2ZW4gYmUgY2FzZXMgd2hlcmUgdGhleQp3YW50IHRvIGJlIFdU
LCBXUCwgb3IgV0IuIEhlbmNlIHRoZSBsYWNrIG9mIGZpcm13YXJlIGluZGljYXRpb24gaXMKYSBw
cm9ibGVtIGV2ZW4gZm9yIHRoaXMgc3BlY2lmaWMgbWVtb3J5IHR5cGUuCgpKYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
