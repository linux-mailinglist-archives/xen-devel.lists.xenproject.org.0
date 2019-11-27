Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD6E10A968
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 05:28:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZosh-0007av-9m; Wed, 27 Nov 2019 04:24:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bRVm=ZT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iZosf-0007aB-GP
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 04:24:45 +0000
X-Inumbo-ID: d5e61d8e-10cd-11ea-a55d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5e61d8e-10cd-11ea-a55d-bc764e2007e4;
 Wed, 27 Nov 2019 04:24:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A6AD2B31C;
 Wed, 27 Nov 2019 04:24:42 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel@lists.xenproject.org
References: <1574788099-11821-1-git-send-email-igor.druzhinin@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <0cfd8eb3-84c3-5cd1-462d-91788b3e57ac@suse.com>
Date: Wed, 27 Nov 2019 05:24:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <1574788099-11821-1-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 v2] AMD/IOMMU: honour IR setting
 while pre-filling DTEs
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
Cc: andrew.cooper3@citrix.com, jbeulich@suse.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMTEuMTkgMTg6MDgsIElnb3IgRHJ1emhpbmluIHdyb3RlOgo+IElWIGJpdCBzaG91bGRu
J3QgYmUgc2V0IGluIERURSBpZiBpbnRlcnJ1cHQgcmVtYXBwaW5nIGlzIG5vdAo+IGVuYWJsZWQu
IEl0J3MgYSByZWdyZXNzaW9uIGluIGJlaGF2aW9yIG9mICJpb21tdT1uby1pbnRyZW1hcCIKPiBv
cHRpb24gd2hpY2ggb3RoZXJ3aXNlIHdvdWxkIGtlZXAgaW50ZXJydXB0IHJlcXVlc3RzIHVudHJh
bnNsYXRlZAo+IGZvciBhbGwgb2YgdGhlIGRldmljZXMgaW4gdGhlIHN5c3RlbSByZWdhcmRsZXNz
IG9mIHdldGhlciBpdCdzCj4gZGVzY3JpYmVkIGFzIHZhbGlkIGluIElWUlMgb3Igbm90Lgo+IAo+
IFNpZ25lZC1vZmYtYnk6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29t
PgoKUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1
ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
