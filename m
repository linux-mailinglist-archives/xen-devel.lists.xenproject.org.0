Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9C511AA1E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 12:44:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if0Ny-0002Vf-CI; Wed, 11 Dec 2019 11:42:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=r5Tp=2B=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1if0Nx-0002VV-6l
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 11:42:29 +0000
X-Inumbo-ID: 4eea743a-1c0b-11ea-88e7-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4eea743a-1c0b-11ea-88e7-bc764e2007e4;
 Wed, 11 Dec 2019 11:42:28 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w15so23763299wru.4
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2019 03:42:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dcbfjGehbJ4r5TdouV46E10hiTZypTkRiyPkz+klCTM=;
 b=Qm3BUoyzCB4z908L0ThWLoBtCxNZgrX5QKj1BusFqSPOyR320BfBa/8COGoQ4rvAMk
 SSJmwHqMlXObE2COqceYedvAxCv7IakOYyzzyxbl/XL675RkwFFkRfaTdswsw6bPbbcc
 s7Ae/1aKQLhDi7eV3zwc0LqVStukjlj4eb6jv2QveFOsaZ9n3tjVStla9/0mwv1FxqJJ
 Xn/4ikKizn1SUxs6XcW/2P3BdH7bCcMPeHmfwcqiRl0cnWZKo7BN60e4oCA7ip5jrC8U
 32Gbrn1XAn1jP9HFjd1O/YC3Z7f4YjPCNMXuuKsSIu3u/uR8Mc8DpbphE8o/rrwZP25B
 SxAw==
X-Gm-Message-State: APjAAAWhXIQ/GJqFeYABQ/yow+G8qDwYMeSWZMw67Dii4zbxmu0Zuy+I
 b7Y/wzBcJWpGu0Me5yY3NFI=
X-Google-Smtp-Source: APXvYqzMwG+UPHfyjWAmEtpqtQyrsnE4kEPt2NWdqwy/bi6vgrQcd9HfcsezYEP2apAJVPP3a8/zLw==
X-Received: by 2002:a5d:49c7:: with SMTP id t7mr3224664wrs.369.1576064547967; 
 Wed, 11 Dec 2019 03:42:27 -0800 (PST)
Received: from debian (122.163.200.146.dyn.plus.net. [146.200.163.122])
 by smtp.gmail.com with ESMTPSA id l3sm1967868wrt.29.2019.12.11.03.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 03:42:27 -0800 (PST)
Date: Wed, 11 Dec 2019 11:42:25 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191211114225.pfhczddmqgjyp6mt@debian>
References: <20191025091618.10153-1-liuwe@microsoft.com>
 <20191025091618.10153-3-liuwe@microsoft.com>
 <e48a7077-170b-375e-4a71-02bf3449ad35@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e48a7077-170b-375e-4a71-02bf3449ad35@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-next 2/7] x86: fix up hyperv-tlfs.h
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMTAsIDIwMTkgYXQgMDQ6MzU6NDFQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjUuMTAuMjAxOSAxMToxNiwgV2VpIExpdSB3cm90ZToKPiA+IERvIHRoZSBmb2xs
b3dpbmc6Cj4gPiAxLiBpbmNsdWRlIHhlbi90eXBlcy5oIGFuZCB4ZW4vYml0b3BzLmgKPiA+IDIu
IGZpeCB1cCBpbnZvY2F0aW9ucyBvZiBCSVQgbWFjcm8KPiAKPiBJcyBpdCB0cnVseSBCSVQoLi4u
LCBVTCkgaW4gX2FsbF8gY2FzZXMsIGFuZCBub3QgQklUKC4uLiwgVSkgaW4gc29tZT8KCkluIExp
bnV4IEJJVCBpcyAKCiAgICNkZWZpbmUgQklUKG5yKSAoVUwoMSkgPDwgbnIpCgpzbyB5ZXMgTGlu
dXggZGV2ZWxvcGVycyBkaWQgbWVhbiBVTCBldmVyeXdoZXJlLgoKSSBoYXZlbid0IGNoZWNrZWQg
dGhlbSBvbmUgYnkgb25lIHBlciBUTEZTJ3MgZGVmaW5pdGlvbnMgdGhvdWdoLgoKV2VpLgoKPiAK
PiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+Cj4gPiAtLS0K
PiA+IFRoaXMgY2FuIGJlIHNxdWFzaGVkIGludG8gcHJldmlvdXMgcGF0Y2ggaWYgcHJlZmVycmVk
Lgo+IAo+IEFmYWljIC0geWVzIHBsZWFzZS4KPiAKPiBKYW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
