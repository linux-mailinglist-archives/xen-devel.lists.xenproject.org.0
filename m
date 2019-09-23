Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1388EBB2CF
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 13:31:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCMV3-0006D9-Rz; Mon, 23 Sep 2019 11:27:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iV5N=XS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iCMV1-0006D1-IB
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 11:27:23 +0000
X-Inumbo-ID: 1baf8898-ddf5-11e9-95fc-12813bfff9fa
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1baf8898-ddf5-11e9-95fc-12813bfff9fa;
 Mon, 23 Sep 2019 11:27:21 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 7so9509656wme.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2019 04:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1Yo4G9AqUDHsyCWRJjfwWHe3fEmcb0ZbBk25vWM5AGc=;
 b=aM9odfHY61HlETsl1XgiH3oa1th4+o29wQoQL6i089NSI9O+cKUQXnJMEuKnyNVkZs
 OMxBeR9IBS4D2YPJB+lp48VVHqJ2nD1PCXQocEVORbl9FoAdkMQvzRsYxiu7+uECC2ho
 aXfzcnB+hG7NxQEPoSnI2Jv2//Kvxr9xVHvUPV442jU6gAY46+3wAcLbLAhUa35Rks3r
 QvGQ0ZlqlpYBBmhUgx8dsal6Z0VBoLs4eVkzxGgk7h9cFjr9of5yZE/MMWrQCHOlCgyY
 v97lsRu3DC57SlCHKzNxxA9rAMWeGQuo9b+z2+a/3MIn/9uZ1fMrjLls4L009gjjCCPR
 tGXg==
X-Gm-Message-State: APjAAAXSnLMHi0xI+Gv15tAZJ/2VxNH0x6gL6nA3xL8VIx0q6drHOQcp
 VGfB4SZuXmW1L9YKsLfVdwI=
X-Google-Smtp-Source: APXvYqwnNclv9uT9yx7kz/SLAIVf0YZTbmudzP4yOFunz/9w4TXufQD5jQq7eP5aAJuIYfrLMDk7Vg==
X-Received: by 2002:a1c:27c5:: with SMTP id
 n188mr12874866wmn.118.1569238040977; 
 Mon, 23 Sep 2019 04:27:20 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id r65sm9474699wmr.9.2019.09.23.04.27.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 04:27:20 -0700 (PDT)
Date: Mon, 23 Sep 2019 12:27:18 +0100
From: Wei Liu <wl@xen.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Message-ID: <20190923112718.qtx6qpme3ghsmf6l@debian>
References: <20190923100931.29670-1-liuwe@microsoft.com>
 <40ef09a747534931bf594f945f0048f1@AMSPEX02CL03.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40ef09a747534931bf594f945f0048f1@AMSPEX02CL03.citrite.net>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-next RFC 0/8] Port Xen to Hyper-V
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
Cc: Wei Liu <liuwe@microsoft.com>, 'Wei Liu' <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMTA6NDg6NDVBTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IFhlbi1kZXZlbCA8
eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBXZWkg
TGl1Cj4gPiBTZW50OiAyMyBTZXB0ZW1iZXIgMjAxOSAxMTowOQo+ID4gVG86IFhlbiBEZXZlbG9w
bWVudCBMaXN0IDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+Cj4gPiBDYzogV2VpIExp
dSA8bGl1d2VAbWljcm9zb2Z0LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBBbmRyZXcgQ29v
cGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsKPiA+IE1pY2hhZWwgS2VsbGV5IDxtaWtl
bGxleUBtaWNyb3NvZnQuY29tPjsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgUm9n
ZXIgUGF1IE1vbm5lCj4gPiA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiBTdWJqZWN0OiBbWGVu
LWRldmVsXSBbUEFUQ0ggZm9yLW5leHQgUkZDIDAvOF0gUG9ydCBYZW4gdG8gSHlwZXItVgo+ID4g
Cj4gPiBIaSBhbGwKPiA+IAo+ID4gSW4gY2FzZSB5b3UncmUgd29uZGVyaW5nLCBJIGNhbiBhbHJl
YWR5IHJ1biBhIGZ1bGx5IGZsZWRnZWQgWGVuIHN5c3RlbSBvbgo+ID4gSHlwZXItViB3aXRoIGVt
dWxhdGVkIGRpc2sgYW5kIG5ldHdvcmsuCj4gPiAKPiA+IFRoaXMgaXMgdGhlIHZlcnkgZmlyc3Qg
c3RhZ2UgZm9yIHBvcnRpbmcgWGVuIHRvIHJ1biBvbiBIeXBlci1WIHdpdGggYWxsIHRoZQo+ID4g
Z29vZGllcyBIeXBlci1WIGhhcyB0byBvZmZlci4gIFdpdGggdGhpcyBzZXJpZXMsIFhlbiBjYW4g
c3VjY2Vzc2Z1bGx5IGRldGVjdAo+ID4gSHlwZXItViBhbmQgcHJpbnRzIG91dCBhIG1lc3NhZ2Uu
ICBJIHdvdWxkIGxpa2UgdG8gZmlyc3QgZ2V0IHRoZSBkaXJlY3RvcnkKPiA+IHN0cnVjdHVyZSBh
bmQga2NvbmZpZyBvcHRpb25zIGFncmVlZCB1cG9uLgo+ID4gCj4gPiBUaGVyZSBhcmUgdHdvIG1h
am9yIGFyZWFzIHRvIGJlIHdvcmtlZCBvbjoKPiA+ICAgKiBNYWtlIERvbTAgYWJsZSB0byB1c2Ug
SHlwZXItVidzIHN5bnRoZXRpYyBkZXZpY2VzLgo+ID4gICAqIE1ha2UgWGVuIHVzZSBvZiB0aGUg
c3ludGhldGljIHRpbWVyLCByZWZlcmVuY2UgVFNDIGFuZCBlbmxpZ2h0ZW5tZW50IFZNQ1MKPiA+
ICAgICBhbmQgb3RoZXIgaW50ZXJmYWNlcy4KPiA+IAo+ID4gVGhleSBhcmVuJ3QgdHJpdmlhbCwg
YW5kIHRpbWUgY2FuIGJlIHNjYXJjZSBvbiBteSBzaWRlLCBzbyBJIGludGVuZCB0byBwb3N0Cj4g
PiBwYXRjaGVzIHBpZWNlIG1lYWwgd2hlbiB0aGV5IGFyZSByZWFkeS4KPiA+IAo+ID4gUXVlc3Rp
b25zIGFuZCBjb21tZW50cyBhcmUgd2VsY29tZS4KPiAKPiBZYXkhIEdsYWQgeW91IGZvdW5kIHRo
ZSB0aW1lIHRvIGRvIHRoaXMgOi0pIE1ha2luZyB1c2Ugb2YgdGhlIHN5bmljLAo+IHN0aW1lciwg
d2lsbCBiZSB1c2VmdWwuIFRvIGdldCB0aGUgYmVuZWZpdCBmb3IgbmVzdGVkIGd1ZXN0cyB0aG91
Z2gsIEkKPiBhc3N1bWUgd2UnbGwgbmVlZCB0byBleHBvc2VkIGVubGlnaHRlbmVkIFZNQ1MsIEVQ
VCBmbHVzaCwgZXRjLgo+IHRocm91Z2g/CgpQZXIgVExGUywgZVZNQ1Mgc2hvdWxkIGJlIHVzZWQg
YnkgTDEgWGVuLgoKTm90IHN1cmUgd2hhdCB5b3UgbWVhbnQgYnkgRVBUIGZsdXNoLiBJZiB5b3Ug
bWVhbiB0aGluZ3MgbGlrZQpIdkZsdXNoR3Vlc3RQaHlzaWNhbEFkZHJlc3NTcGFjZSwgSSB0aGlu
ayB0aGV5IHNob3VsZCBiZSB1c2VkIGJ5IFhlbgpvbmx5IGFzIHdlbGwuIEknbSBub3Qgc3VyZSB3
aGV0aGVyIHRoZXkgc2hvdWxkIGJlIGV4cG9zZSB0byBMMiBndWVzdHMuCgpUaGVyZSBhcmUgaHlw
ZXJjYWxscyBmb3IgdmlydHVhbCBUTEIgbWFuYWdlbWVudC4gV2UgbWF5IGNob29zZSB0byBleHBv
c2UKdGhlbSB0byBMMiBndWVzdHMgZm9yIGJldHRlciBwZXJmb3JtYW5jZS4KCldlaS4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
