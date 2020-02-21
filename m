Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E628168020
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 15:24:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j59C1-0000G5-5p; Fri, 21 Feb 2020 14:22:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IZZ7=4J=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1j59C0-0000G0-1w
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 14:22:12 +0000
X-Inumbo-ID: 8c620764-54b5-11ea-ade5-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8c620764-54b5-11ea-ade5-bc764e2007e4;
 Fri, 21 Feb 2020 14:22:11 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id k11so2263326wrd.9
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2020 06:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eoMliUTHwKhLxFcO7eXkkBzoYKrlcDpH8jRof9InDMk=;
 b=WZ46h+1fQV6RP/jdB+YZ3ANYuRItvdHs17UEVTec0i+SL0Liffr3CmW4f07p4MilMo
 hBArb2hOKcN62S/Gyp8rG/uHSRCdHh18KRHYxQU6Dev5GZOjxGcG9BKa5k7WG3pZBpEY
 qb2xGQ8Kr3xV+imu+6eibc5aq9pSPs7kXxXBn+NBQSeunHyJSwlH+QrtoUQsScZHa5e4
 k0yok4hyqEXPdO17fHF61fWlO+RB0ZPcYmmxnZta7g95vnwh6kTjk0Ua1ETKNEumz2Ir
 GzWNCMbrKuHqFZ7RzruzP2sscv2P78F+4eT/HnbgvmlztXZTvT+2634BycwqjobqDhOV
 NcRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eoMliUTHwKhLxFcO7eXkkBzoYKrlcDpH8jRof9InDMk=;
 b=oJKqp7ScpTQjaIF8dVkF9RsCx1gJzzyrK0NmOosNPPpHa5F703635pfQw9BfOfYHeJ
 n7X6HJQb7Od8srRj9RBKGWzHtgvbo9mITiBlUkCBDbbrlR0knQtrsHkOUMgk5ZnivYpC
 lxIsxY+f2YAwwkyXi4q7HcHiNZqv5rjtWhPxmrkl0ou66L/hxunMjPVI1/F71Ibg8OdB
 RqmeVfmCXD1f252yt1mXkTNk1LtWH/gpbjYE/48FOQkfs7VPHbwoW4cqEthyHQZWDyZD
 YaJ6U1tZxh/BbHahU94cNA0P3SWzOCRDJbtItXbxvs08gPi4SQGB995UZv/uZQqSYF5m
 l27w==
X-Gm-Message-State: APjAAAWIZkXnSN1v3d9atkfvlLUmOU8uNnH+ZA/JIzaF85BM0tb0qZd1
 U54R6gSNk8GlFuhwuebMelpeGV3Ez/6HI00ThAY=
X-Google-Smtp-Source: APXvYqzbzjqEvdzxa6eV00sb9JF3FQjaRbrO2AplSb9JK7aC+nPvvnEUK0g9TlTkEuGJBJMrYZpw4dDYCvxZ4qMEVAQ=
X-Received: by 2002:adf:f986:: with SMTP id f6mr50849637wrr.182.1582294930495; 
 Fri, 21 Feb 2020 06:22:10 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581362050.git.tamas.lengyel@intel.com>
 <cf992d6e4dd09acc48afb42d43be4a900baee189.1581362050.git.tamas.lengyel@intel.com>
 <826546f9-3146-cbea-8496-1d6be1ebc23e@citrix.com>
In-Reply-To: <826546f9-3146-cbea-8496-1d6be1ebc23e@citrix.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Fri, 21 Feb 2020 07:21:34 -0700
Message-ID: <CABfawhk6iDvto7y9cEjZAWK2Tk4WJcgR5RLyEEvacC1vEOsUwA@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH v8 1/5] x86/p2m: Allow p2m_get_page_from_gfn
 to return shared entries
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMjEsIDIwMjAgYXQgNjo0OSBBTSBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToKPgo+IE9uIDEwLzAyLzIwMjAgMTk6MjEsIFRhbWFzIEsg
TGVuZ3llbCB3cm90ZToKPiA+IFRoZSBvd25lciBkb21haW4gb2Ygc2hhcmVkIHBhZ2VzIGlzIGRv
bV9jb3csIHVzZSB0aGF0IGZvciBnZXRfcGFnZQo+ID4gb3RoZXJ3aXNlIHRoZSBmdW5jdGlvbiBm
YWlscyB0byByZXR1cm4gdGhlIGNvcnJlY3QgcGFnZSB1bmRlciBzb21lCj4gPiBzaXR1YXRpb25z
LiBUaGUgY2hlY2sgaWYgZG9tX2NvdyBzaG91bGQgYmUgdXNlZCB3YXMgb25seSBwZXJmb3JtZWQg
aW4KPiA+IGEgc3Vic2V0IG9mIHVzZS1jYXNlcy4gRml4aW5nIHRoZSBlcnJvciBhbmQgc2ltcGxp
ZnlpbmcgdGhlIGV4aXN0aW5nIGNoZWNrCj4gPiBzaW5jZSB3ZSBjYW4ndCBoYXZlIGFueSBzaGFy
ZWQgZW50cmllcyB3aXRoIGRvbV9jb3cgYmVpbmcgTlVMTC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzLmxlbmd5ZWxAaW50ZWwuY29tPgo+Cj4gR2l2ZW4gdGhl
IHJlY2VudCBjaGFuZ2UgaW4gcDJtIG1haW50YWluZXJzaGlwLCBJJ3ZlIGNvbW1pdHRlZCB0aGlz
IGFuZAo+IGZpeGVkIHVwIHRoZSBzdHlsZSBpc3N1ZXMuCgpUaGFua3MsIGFwcHJlY2lhdGVkIQoK
VGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
