Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B8F100F42
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 00:07:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWq3z-0004Nz-3v; Mon, 18 Nov 2019 23:04:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aMPH=ZK=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iWq3y-0004Nu-3W
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 23:04:06 +0000
X-Inumbo-ID: b7464812-0a57-11ea-a2e3-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b7464812-0a57-11ea-a2e3-12813bfff9fa;
 Mon, 18 Nov 2019 23:04:04 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id s5so21568717wrw.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Nov 2019 15:04:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qS8Qy1SBArPKPn2yGoOJIC2z/8YK/C6llf/xG8Cirww=;
 b=ueItd8TqU2U+e4q62rKLMmIpvHFQAj0lcuLfT0USyJBSMXbJ+pW0JSie+E362anzKr
 T1Fb9I2l5cXY+t1E/XyzPNjibB/eL1zeMPLoByB7fPuz7hivCnMWNO1jOmCs7qqPi0bH
 OP7ySw+exSKJO3D/nDhcf6LCnesSTBkqe3r/5/Ay7yJiBBJ6QOGTXPXsr5oBdVAlXwC8
 1E9RZWo7AcC1fdMTBOm+JZkANPlh/ZGL4tiHxencBxSPzDQ8EFZBhRj4jqX+jpXOy0gJ
 lqwLioH0XVU5L+LTYlYQbJP0AH4Zwg8PMZ8mmlsAP10l3TQSavqHGnCC62reydhAxhcU
 ojOQ==
X-Gm-Message-State: APjAAAXCLbqCY3JH4y/WIa37wjxzhco7lUtIaocOxWjKHkI4L4HxjvBo
 504bNUjYKoHbHU+KBWsx+10=
X-Google-Smtp-Source: APXvYqwPGLx3h3TDm2ACDkV6Nu5v0brGP6CtU0umA1xjUCFMW5HWt/WgocT540lr6B7nbK3ob7oTuQ==
X-Received: by 2002:adf:fd4a:: with SMTP id h10mr31533413wrs.90.1574118243820; 
 Mon, 18 Nov 2019 15:04:03 -0800 (PST)
Received: from debian (74.162.147.147.dyn.plus.net. [147.147.162.74])
 by smtp.gmail.com with ESMTPSA id k14sm25889651wrw.46.2019.11.18.15.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 15:04:03 -0800 (PST)
Date: Mon, 18 Nov 2019 23:04:01 +0000
From: Wei Liu <wl@xen.org>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20191118230401.5ui4qgdppnqiton3@debian>
References: <20191031121727.287419-1-anthony.perard@citrix.com>
 <24014.57104.551178.557836@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <24014.57104.551178.557836@mariner.uk.xensource.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [XEN PATCH for-4.13] libxl_pci: Don't hold QMP
 connection while waiting
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMTUsIDIwMTkgYXQgMDU6MjM6MjhQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gQW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1hFTiBQQVRDSCBmb3ItNC4xM10gbGlieGxf
cGNpOiBEb24ndCBob2xkIFFNUCBjb25uZWN0aW9uIHdoaWxlIHdhaXRpbmciKToKPiA+IEFmdGVy
IHNlbmRpbmcgdGhlICdkZXZpY2VfZGVsJyBjb21tYW5kIGZvciBhIFBDSSBwYXNzdGhyb3VnaCBk
ZXZpY2UsCj4gPiB3ZSB3YWl0IHVudGlsIFFFTVUgaGFzIGVmZmVjdGl2ZWx5IGRlbGV0ZWQgdGhl
IGRldmljZSwgdGhpcyBpbnZvbHZlcwo+ID4gZXhlY3V0aW5nIG1vcmUgUU1QIGNvbW1hbmRzLiBX
aGlsZSB3YWl0aW5nLCBsaWJ4bCBob2xkIHRoZSBjb25uZWN0aW9uLgo+IAo+IEkganVzdCByZWFk
IHRoZSBjb2RlIGhlcmUuICBJdCBzZWVtcyB0byBwb2xsIG9uIGEgdGltZXIuICBIb3cgdWdseS4K
PiAKPiA+IEl0IGlzbid0IG5lY2Vzc2FyeSB0byBob2xkIHRoZSBjb25uZWN0aW9uIGFuZCBpdCBw
cmV2ZW50cyBvdGhlcnMgZnJvbQo+ID4gbWFraW5nIHByb2dyZXNzLCBzbyB0aGlzIHBhdGNoIHJl
bGVhc2VzIHRoZSBRTVAgY29ubmVjdGlvbi4KPiAKPiBSaWdodC4KPiAKPiA+ICAgICAgaWYgKHJj
KSBnb3RvIG91dDsKPiA+ICAKPiA+ICsgICAgbGlieGxfX2V2X3FtcF9kaXNwb3NlKGdjLCBxbXAp
Owo+ID4gKwo+ID4gICAgICBhc2tlZF9pZCA9IEdDU1BSSU5URihQQ0lfUFRfUURFVl9JRCwKPiAK
PiBJdCdzIG5vdCBpdCBlbnRpcmVseSBjbGVhciB0byBtZSB3aHkgeW91IGRpc3Bvc2UgdGhpcyBi
ZWZvcmUgdGhlIGVycm9yCj4gZXhpdCwgYnV0IEkgdGhpbmsgaXQgZG9lc24ndCBtYXR0ZXIuICBJ
ZiBpdCBkb2VzIG1hdHRlciB0aGVuIHBsZWFzZQo+IGV4cGxhaW4gOi0pLgo+IAo+IEFja2VkLWJ5
OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KClBVc2hlZC4KCldlaS4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
