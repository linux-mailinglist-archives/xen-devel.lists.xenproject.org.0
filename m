Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9C518F0B2
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 09:17:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGIEN-0004ok-0P; Mon, 23 Mar 2020 08:14:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1UMm=5I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jGIEK-0004of-VF
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 08:14:40 +0000
X-Inumbo-ID: 57d428ce-6cde-11ea-8274-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 57d428ce-6cde-11ea-8274-12813bfff9fa;
 Mon, 23 Mar 2020 08:14:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BE080AB7F;
 Mon, 23 Mar 2020 08:14:39 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <20200318141635.GW7869@mail-itl>
 <fa845540-fd8e-bc63-a3af-50673dede579@citrix.com>
 <20200318221006.GS18599@mail-itl>
 <413cac496e18bcb04b0691ef633d206f3a14a8e3.camel@suse.com>
 <20200323000946.GH18599@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <441943b8-48b0-428f-27d0-5bdd699e3801@suse.com>
Date: Mon, 23 Mar 2020 09:14:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200323000946.GH18599@mail-itl>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen crash after S3 suspend - Xen 4.13
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.de>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDMuMjAyMCAwMTowOSwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOgo+
IEJ1dCB0aGVyZSBpcyBtb3JlOiBhZGRpdGlvbmFsbHksIGluIG1vc3QgKGFsbD8pIGNhc2VzIGFm
dGVyIHJlc3VtZSBJJ3ZlIGdvdAo+IHNvZnQgbG9ja3VwIGluIExpbnV4IGRvbTAgaW4gc21wX2Nh
bGxfZnVuY3Rpb25fc2luZ2xlKCkgLSBzZWUgYmVsb3cuIEl0Cj4gZGlkbid0IGhhcHBlbmVkIGJl
Zm9yZSBhbmQgdGhlIG9ubHkgY2hhbmdlIHdhcyBYZW4gNC4xMyAtPiBtYXN0ZXIuCgpVbmxlc3Mg
dGhlIExpbnV4IHNpZGUgbWFuaWZlc3RhdGlvbiByaW5ncyBhIGJlbGwgdG8gc29tZW9uZSwgd291
bGQKdGhlcmUgYmUgYW55IGNoYW5jZSB5b3UgY291bGQgYmlzZWN0IHRoaXMgdG8gdGhlIG9mZmVu
ZGluZyBjb21taXQ/CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
