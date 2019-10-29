Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F93E8DFF
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2019 18:23:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPVAV-000832-OQ; Tue, 29 Oct 2019 17:20:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Jy4k=YW=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iPVAT-00082p-KZ
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2019 17:20:29 +0000
X-Inumbo-ID: 66d7643e-fa70-11e9-9516-12813bfff9fa
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 66d7643e-fa70-11e9-9516-12813bfff9fa;
 Tue, 29 Oct 2019 17:20:28 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id w18so14575456wrt.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2019 10:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Golf0yA00c4i2S+VM3Dz9JqbXbI9eXClZgaBhO4tODY=;
 b=iTj48lWt0+3GGTSnZGupOKoTlq4U6zXwGJ7h6gO4fvFCeFXnXGa33gcfn8XDfxhX3X
 D+st8KkzMfr5SIKPgwOWg3re5T8scM55RB9jzW0lEm/KB3EyJksGCWN9lcR8b0r4FaQ9
 ukieWYDP+KImpzRakwhSAVc33PLHrnhAQynIwXaoWBT08y5Rw3MSecDv6ZwWCFpPloca
 PhnUqzdkXpe8B6idXJ/moRmsrboQgQLprbVFBZ4U028/EoK5YTQ5i75kfuiTaLsrNa8p
 DkcgfRr3ScsRlRSJOzpZloZxWZ2lEYWJMykXNYjGuARiiBi5eDHNnAE+6CKT7qMmPXez
 spHQ==
X-Gm-Message-State: APjAAAVUsHaOJZQeC2BFXtZ91Et1OCuc/cyTYUb7/oVq9IzGaJfcP8RI
 gr/4lc0Li6XO9OogSvTOy0x4l4Oali01YQ==
X-Google-Smtp-Source: APXvYqyJYDsTBdLeOCm/RrAyHYXQtn/gfggfa6bfh9klvkaG28rh4H7NZd2xAUrW42dsFyNqJJ3hwg==
X-Received: by 2002:a5d:694a:: with SMTP id r10mr20990989wrw.117.1572369627716; 
 Tue, 29 Oct 2019 10:20:27 -0700 (PDT)
Received: from debian ([213.31.248.135])
 by smtp.gmail.com with ESMTPSA id x12sm15842860wru.93.2019.10.29.10.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2019 10:20:27 -0700 (PDT)
Date: Tue, 29 Oct 2019 17:20:25 +0000
From: Wei Liu <wl@xen.org>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20191029172025.cabsrbm5jelc6i53@debian>
References: <20191024130154.19145-1-wl@xen.org>
 <CAK9nU=oQaDdacWgxCBXG=PdJy9F7Vehrn9uGrDgpGyVYHHZJ0w@mail.gmail.com>
 <23992.27752.434203.611483@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23992.27752.434203.611483@mariner.uk.xensource.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v2 for-4.13] CONTRIBUTING: drop blktap2 and
 add tools/libs
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
Cc: Juergen Gross <jgross@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Lars Kurth <lars.kurth@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBPY3QgMjksIDIwMTkgYXQgMDQ6NDQ6MjRQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gV2VpIExpdSB3cml0ZXMgKCJSZTogW1BBVENIIHYyIGZvci00LjEzXSBDT05UUklCVVRJ
Tkc6IGRyb3AgYmxrdGFwMiBhbmQgYWRkIHRvb2xzL2xpYnMiKToKPiA+IE9uIFRodSwgMjQgT2N0
IDIwMTkgYXQgMTQ6MDEsIFdlaSBMaXUgPHdsQHhlbi5vcmc+IHdyb3RlOgo+ID4gPiBCbGt0YXAy
IGlzIGdvbmUgYW5kIHRvb2xzL2xpYnMgaXMgbWlzc2luZyBpbiB0aGUgZG9jdW1lbnQuCj4gPiA+
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gPiA+IFJldmlld2Vk
LWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gPiA+IFJlbGVhc2UtYWNrZWQt
Ynk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbQo+ID4gCj4gPiBBbnkgY29tbWVudCBv
biB0aGlzPyBJZiBub3QgSSB0YWtlIGl0IGFzICJubyBvYmplY3Rpb24iLi4uCj4gCj4gQWNrZWQt
Ynk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKVGhhbmtzLiBQdXNo
ZWQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
