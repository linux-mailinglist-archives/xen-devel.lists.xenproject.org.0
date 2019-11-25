Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86627109164
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 16:56:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZGh4-0002CJ-Dw; Mon, 25 Nov 2019 15:54:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yJnJ=ZR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZGh3-0002CE-Ci
 for xen-devel@lists.xen.org; Mon, 25 Nov 2019 15:54:29 +0000
X-Inumbo-ID: da12a874-0f9b-11ea-b08b-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id da12a874-0f9b-11ea-b08b-bc764e2007e4;
 Mon, 25 Nov 2019 15:54:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 91796BD98;
 Mon, 25 Nov 2019 15:54:23 +0000 (UTC)
To: Rishi <2rushikeshj@gmail.com>
References: <CAO9XypWibNu0iDnJsZXkQ+=Ecd6eThnu+td4O3VVLMe+qJ80eQ@mail.gmail.com>
 <76a91fb3-d2b0-dd23-7e99-0015fbee5990@suse.com>
 <CAO9XypVpBAPk8Hakqt7jJ08pCUhR_GzNxDWh2D-CGfp0+tfaAA@mail.gmail.com>
 <3b8d187e-c4d5-a7a5-76c2-874db47440ee@suse.com>
 <CAO9XypVNhSd8hPu1nA1uP8PVCPVgW-Bs_q6gmPky6Px0-U6G+w@mail.gmail.com>
 <04b95cfb-afa0-b6ba-2e69-74b56edbf4c4@suse.com>
 <CAO9XypVS1vfZu+ZJ_dK9VRTEhMR7y8viceAmOufCpvDLt-sXHw@mail.gmail.com>
 <0276e934-4a59-386f-87ee-2b801fd26dae@suse.com>
 <005596b6-9228-801b-300a-57807a96d051@suse.com>
 <38cd1016-d390-b722-24ce-dbf71ad57635@suse.com>
 <20191123042906.GA79247@mattapan.m5p.com>
 <bd02527e-9a8e-3a66-bdd6-13d200dacb3b@suse.com>
 <CAO9XypXvpA3306ULTNaYG_-VoBnyf_Noackp9bv_PkoRygDYXg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5d6fc4f8-b985-394a-a345-be0f299e2965@suse.com>
Date: Mon, 25 Nov 2019 16:54:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAO9XypXvpA3306ULTNaYG_-VoBnyf_Noackp9bv_PkoRygDYXg@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen hiding thermal capabilities from Dom0
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
Cc: Juergen Gross <jgross@suse.com>, Elliott Mitchell <ehem+xen@m5p.com>,
 xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMTEuMjAxOSAxNjo0MywgUmlzaGkgd3JvdGU6Cj4gTmV4dCBpcyB0aGUgTVNSIHJlYWQg
Zm9yIGFjdHVhbCB0ZW1wZXJhdHVyZSB2YWx1ZXMuIEN1cnJlbnRseQo+IHJkbXNyX3NhZmVfb25f
Y3B1IGlzIGJlaW5nIHVzZWQsIGRvZXMgaXQgYWxyZWFkeSBnZXQgY29udmVydGVkIHRvIGEKPiBI
eXBlcmNhbGwgdG8gYmUgYWJsZSB0byBkZXRlY3QgdmFsdWVzPwo+IFdoaWxlIHRyYWNpbmcgdGhl
IGZ1bmN0aW9uIGNhbGxzIGZyb20gY29kZSwgcmRtc3Jfc2FmZV9vbl9jcHUoKSAtPgo+IHJkbXNy
X3NhZmUoKSAtPiBuYXRpdmVfcmVhZF9tc3Jfc2FmZSgpIC0+IGFzbSB2b2xhdGlsZSgpIGNvbWVz
IHVwLgo+IEkgY2FuIHNlZSB4ZW5fcmVhZF9tc3Jfc2FmZSgpIGJ1dCBub3Qgc3VyZSBpZiB0aGlz
IG9yIGl0cyBhbnkgb3RoZXIKPiB2YXJpYW50IGNhbiBiZSBjYWxsZWQuCgpOb25lIG9mIHRoZXNl
IGFyZSBzdWl0YWJsZSwgYXMgbWVudGlvbmVkIGJlZm9yZSwgYXMgdGhleSdyZSBhbGwKYWN0aW5n
IGluIHRlcm1zIG9mIHZDUFUtcywgd2hpbGUgeW91IHdhbnQgdG8gYWN0IG9uIHBDUFUtcy4KWW91
J3JlIHVubGlrZWx5IHRvIGJlIGFibGUgdG8gbWFrZSB0aGlzIHdvcmsgd2l0aG91dCBmaXJzdApt
YWtpbmcgWGVuIGFsbG93IERvbTAgYWNjZXNzIHRvIHRoZXNlIE1TUnMgdmlhIHRoZSBpbmRpY2F0
ZWQKcGxhdGZvcm0tb3AgKG9yIHlldCBzb21ldGhpbmcgbW9yZSBpbnRydXNpdmUpLgoKSmFuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
