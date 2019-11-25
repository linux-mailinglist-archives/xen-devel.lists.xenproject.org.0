Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C0310930E
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 18:45:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZIOq-0004Xj-C5; Mon, 25 Nov 2019 17:43:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RAVF=ZR=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iZIOo-0004Xa-MH
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 17:43:46 +0000
X-Inumbo-ID: 21083726-0fab-11ea-b08b-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 21083726-0fab-11ea-b08b-bc764e2007e4;
 Mon, 25 Nov 2019 17:43:46 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id t2so19224711wrr.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2019 09:43:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=bLzDhImqXEoDQx6qQkIQMwbMCTYj5JySh3csNja87LY=;
 b=kGYY7Dns7WVuDNZ4qwiyz/xKgsMLdoQTvciI4XVzxhBRIHyJngHJwT2t6KmeLZnAxF
 c+Hkn4aDLZvKYuuFzST6DbLl1ZX8lXOuiEektODE31TTBQgeDHra5A146uyHOhJGRwUe
 zeifdse2OLukytKIiEta9bz6nBH/SeBQnnoHv7yPkf30RWy2ADEhcd+ayh8xn7kqOclF
 4ou1/nQ3TWA26+PmMRB3zK2IS8ZTaERsJ5QOnJlTwd94jYPfq8GZ9H9uJ7Kh0nD78zXU
 pSiypomg77/kZUIJZXxuVAZpl6k96yRNGveBgNZcefhXzhuMiOzm02NE6Zbm57EHealg
 3Ikg==
X-Gm-Message-State: APjAAAVeOYhGZayt0srYqcu7hJbM8AIt5hFAJI6QcHYLSgPo79GL7Wfd
 JMjB4TMzUD3HHOsob1Gn/fM=
X-Google-Smtp-Source: APXvYqwfmtz68E3DNSEYnxZTOsGNctji3EuzUQiDFzPHAt4qVK73dR+rzKMmARgVKtGQe+kvYHgK9g==
X-Received: by 2002:a5d:558b:: with SMTP id i11mr30945881wrv.379.1574703825314; 
 Mon, 25 Nov 2019 09:43:45 -0800 (PST)
Received: from debian (122.163.200.146.dyn.plus.net. [146.200.163.122])
 by smtp.gmail.com with ESMTPSA id y15sm10778708wrh.94.2019.11.25.09.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 09:43:44 -0800 (PST)
Date: Mon, 25 Nov 2019 17:43:43 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191125174343.wvhqo7np2janxvgd@debian>
References: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
 <9399a177-91dd-b64a-1b6f-1d29903161fe@cardoe.com>
 <20191125140606.6jmltrc624zugnqv@debian>
 <20191125155931.GA980@Air-de-Roger>
 <20191125170704.etgloq6y2e7j6ewg@debian>
 <20191125172704.GB980@Air-de-Roger>
 <0449da3e-2e23-1d2a-1967-5d52a803df65@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0449da3e-2e23-1d2a-1967-5d52a803df65@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] Status of 4.13
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
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBOb3YgMjUsIDIwMTkgYXQgMDU6MzQ6MTVQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyNS8xMS8yMDE5IDE3OjI3LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4g
T24gTW9uLCBOb3YgMjUsIDIwMTkgYXQgMDU6MDc6MDRQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiA+PiBPbiBNb24sIE5vdiAyNSwgMjAxOSBhdCAwNDo1OTozMVBNICswMTAwLCBSb2dlciBQYXUg
TW9ubsOpIHdyb3RlOgo+ID4+IFsuLi5dCj4gPj4+IFdoaWNoIEkgdGhpbmsgaXQncyBleHBlY3Rl
ZCwgd2UgYWxyZWFkeSBrbmV3IGNsYW5nIGhhZCBhIGxvdCBvZgo+ID4+PiBkdXBsaWNhdGUgc3lt
Ym9scy4gVGhlIG9ubHkgd2F5IEkga25vdyB0byB3b3JrYXJvdW5kIHRoaXMgQVRNIGlzIHRvCj4g
Pj4+IHVzZSBgZ21ha2UgeGVuIGNsYW5nPXkgQ09ORklHX0VORk9SQ0VfVU5JUVVFX1NZTUJPTFM9
bmAuIEl0J3Mgb24gbXkKPiA+Pj4gcGlsZSBvZiBzdHVmZiB0byBsb29rIGludG8sIGJ1dCBJJ20g
bm90IHN1cmUgd2hlbiBJIHdpbGwgZ2V0IHRvIGl0Lgo+ID4+IEluIHRoYXQgY2FzZSB3ZSBzaG91
bGQgbWFrZSBHaXRsYWIgQ0kgdXNlIHRoZSBuZXcgY29uZmlndXJhdGlvbiBvcHRpb24uCj4gPiBJ
TU8gdGhlIGJ1aWxkIHNob3VsZCB3b3JrIG91dCBvZiB0aGUgYm94LCBzbyB3ZSBzaG91bGQgZGlz
YWJsZQo+ID4gQ09ORklHX0VORk9SQ0VfVU5JUVVFX1NZTUJPTFMgYXV0b21hdGljYWxseSBpZiBj
bGFuZyBpcyBkZXRlY3RlZC4KPiAKPiBLY29uZmlnIGluIDQuMTMgaXNuJ3QgaW4gYSBwb3NpdGlv
biB0byBrbm93IHRoaXMuwqAgKEl0IHdpbGwgYmUgaW4gNC4xNAo+IHdpdGggQW50aG9ueSdzIHJl
ZnJlc2ggY29tbWl0dGVkKS4KPiAKPiBGdXJ0aGVybW9yZSwgdGhlIGNhdXNhbCBjaGFpbiBvZiBM
SVZFUEFUQ0ggLT4gRU5GT1JDRV9VTklRVUVfU1lNQk9MUwo+ICppcyogY29ycmVjdCwgYmVjYXVz
ZSBsaXZlcGF0Y2hpbmcgcmVhbGx5IGlzIGJ1c3QgaWYgZHVwbGljYXRlIHN5bWJvbHMKPiBleGlz
dC4KPiAKPiBUaGUgb25seSBvcHRpb24gKHdoaWNoIGlzIGtjb25maWctc3BlY2lmaWMpIGlzIHRv
IGRpc2FibGUgTElWRVBBVENIIGJ5Cj4gZGVmYXVsdC4KCkFyZSB5b3UgZ29pbmcgdG8gc3VibWl0
IGEgcGF0Y2ggZm9yIDQuMTM/CgpXZWkuCgo+IAo+IH5BbmRyZXcKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
