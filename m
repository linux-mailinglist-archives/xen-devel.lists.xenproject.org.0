Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE7EBB6AC
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 16:27:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCPGl-0006UE-UE; Mon, 23 Sep 2019 14:24:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iV5N=XS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iCPGk-0006U5-Uv
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 14:24:50 +0000
X-Inumbo-ID: 6d0a5890-de0d-11e9-95fe-12813bfff9fa
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by localhost (Halon) with ESMTPS
 id 6d0a5890-de0d-11e9-95fe-12813bfff9fa;
 Mon, 23 Sep 2019 14:21:26 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id l11so14171757wrx.5
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2019 07:21:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YevhP1YdPalk0/Rsvh3ZUdTFSUY1DubFYF3EG3DSeyA=;
 b=GZE/EnH6xuCi1LhawVnKcYP8MAvHu2iYb4VxIFbgdUk8XTTOirLyfuvOv6gu+ikQQc
 Sn63a++5jfrTS2QPDTmA23ZTSRVTERO+zsZAyYvCgtXUBv6BjXczPokPeldeuZNyGWl+
 2gWledTiur67OmgfuQmHMUh/DpOwUCJ35UHItxAkesPt5hDJUbDW6Mgzf1A7KV4xPhpp
 F+ytztEb2fZaIWmrRxLbzn3/a6AQ63yADrwS5qFSNYi9VYXhp3yMgcCbMCoA+2DVrqfq
 M+8+SU9Q36SQcHJdWwLfx9ARykfakX8oxRqvog3liRAebLvoZz/wkscWBVz2fHFcbyLg
 0hoQ==
X-Gm-Message-State: APjAAAUyBBaBAGSW2Gu6oGCQpmk3JQNjCLABZZTVXbrQQRDNU5ufheuw
 PmPkc2WCxUs+gdjYWWBu+7U=
X-Google-Smtp-Source: APXvYqxqNezZbOvOmyP16pJarscqSvK98XCW3T53s5ONFxKpwXAVx1lAUHlYp2EVPzia0PxKqfvBiQ==
X-Received: by 2002:adf:e50e:: with SMTP id j14mr11630091wrm.178.1569248485387; 
 Mon, 23 Sep 2019 07:21:25 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id x2sm15905718wrn.81.2019.09.23.07.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 07:21:24 -0700 (PDT)
Date: Mon, 23 Sep 2019 15:21:23 +0100
From: Wei Liu <wl@xen.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Message-ID: <20190923142123.h6c36wvmujghrhtm@debian>
References: <20190923100931.29670-1-liuwe@microsoft.com>
 <40ef09a747534931bf594f945f0048f1@AMSPEX02CL03.citrite.net>
 <20190923112718.qtx6qpme3ghsmf6l@debian>
 <a845cf949f604e848ac704e3406e449e@AMSPEX02CL03.citrite.net>
 <20190923125431.mpoyvjj7dz6ef4df@debian>
 <20190923133335.ktlnpbxqnanraytq@debian>
 <7266c9a91c7c4dcba0aab375fa5aad08@AMSPEX02CL03.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7266c9a91c7c4dcba0aab375fa5aad08@AMSPEX02CL03.citrite.net>
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

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMDE6NDc6MTRQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IFdlaSBMaXUgPHds
QHhlbi5vcmc+Cj4gPiBTZW50OiAyMyBTZXB0ZW1iZXIgMjAxOSAxNDozNAo+ID4gVG86IFBhdWwg
RHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gPiBDYzogJ1dlaSBMaXUnIDx3bEB4
ZW4ub3JnPjsgWGVuIERldmVsb3BtZW50IExpc3QgPHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZz47IFdlaSBMaXUKPiA+IDxsaXV3ZUBtaWNyb3NvZnQuY29tPjsgQW5kcmV3IENvb3BlciA8
QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IE1pY2hhZWwgS2VsbGV5Cj4gPiA8bWlrZWxsZXlA
bWljcm9zb2Z0LmNvbT47IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IFJvZ2VyIFBh
dSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZl
bF0gW1BBVENIIGZvci1uZXh0IFJGQyAwLzhdIFBvcnQgWGVuIHRvIEh5cGVyLVYKPiA+IAo+ID4g
QW5kIGEgYml0IG1vcmUgdGhvdWdodC4KPiA+IAo+ID4gT24gTW9uLCBTZXAgMjMsIDIwMTkgYXQg
MDE6NTQ6MzFQTSArMDEwMCwgV2VpIExpdSB3cm90ZToKPiA+IFsuLi5dCj4gPiA+ID4gPgo+ID4g
PiA+ID4gUGVyIFRMRlMsIGVWTUNTIHNob3VsZCBiZSB1c2VkIGJ5IEwxIFhlbi4KPiA+ID4gPgo+
ID4gPiA+IFllcywgSSBndWVzcyBpdCBvbmx5IG5lZWRzIHRvIGJlIHVzZWQgYnkgTDEsIGJ1dCBX
aW5kb3dzIGlzIHVzaW5nIGFuCj4gPiA+ID4gaW5jcmVhc2luZyBudW1iZXIgb2YgVk1zIGZvciB2
YXJpb3VzIHB1cnBvc2VzIHNvIEkgdGhpbmsgbWFraW5nIGl0Cj4gPiA+ID4gc3RhY2sgd2VsbCB3
b3VsZCBiZSB1c2VmdWwuCj4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBOb3Qgc3VyZSB3aGF0
IHlvdSBtZWFudCBieSBFUFQgZmx1c2guIElmIHlvdSBtZWFuIHRoaW5ncyBsaWtlCj4gPiA+ID4g
PiBIdkZsdXNoR3Vlc3RQaHlzaWNhbEFkZHJlc3NTcGFjZSwgSSB0aGluayB0aGV5IHNob3VsZCBi
ZSB1c2VkIGJ5IFhlbgo+ID4gPiA+ID4gb25seSBhcyB3ZWxsLiBJJ20gbm90IHN1cmUgd2hldGhl
ciB0aGV5IHNob3VsZCBiZSBleHBvc2UgdG8gTDIgZ3Vlc3RzLgo+ID4gPiA+ID4KPiA+ID4gPgo+
ID4gPiA+IFllcywgdGhhdCdzIHdoYXQgSSBtZWFudCBhbmQsIGFnYWluLCBJIHdhcyB0aGlua2lu
ZyBhYm91dCB0aGUgbmVzdGVkCj4gPiA+ID4gV2luZG93cyBndWVzdCB1c2luZyBWTXMgaXRzZWxm
Lgo+ID4gPgo+ID4gPiBTbyB0aGlzIGlzIGJhc2ljYWxseSBuZXN0ZWQgb24gbmVzdGVkLiBJJ20g
bm90IHN1cmUgaG93IHRvIG1ha2UgdGhhdAo+ID4gPiB3b3JrIHlldC4gIEknbSBhbHNvIG5vdCBz
dXJlIGhvdyB3ZWxsIHRoZXNlIGludGVyZmFjZXMgc3RhY2suIFRMRlMgb25seQo+ID4gPiBkZXNj
cmliZXMgb25lIGxldmVsIG9mIG5lc3RpbmcuIEkgd2lsbCBuZWVkIHRvIGFzayBpZiB3ZSBjYW4g
bWFrZSBuZXN0ZWQKPiA+ID4gb24gbmVzdGVkIHdvcmsuCj4gPiA+Cj4gPiAKPiA+IFNpbmNlIEwy
IFJvb3QgaXMgV2luZG93cyBpbiBhIEh5cGVyLVYgc2V0dXAsIGNoYW5jZXMgYXJlIHdoYXQgeW91
IHdhbnQKPiA+IGFscmVhZHkgd29ya3MuIE9mIGNvdXJzZSB0aGlzIGRlcGVuZHMgb24gd2hldGhl
ciBXaW5kb3dzLCB3aGVuIHJ1bm5pbmcKPiA+IGFzIFJvb3Qgb3IgQ2hpbGQsIHVzZXMgVk0gcmVs
YXRlZCBmZWF0dXJlcy4KPiA+IAo+ID4gSSdtIG5vdCB2ZXJzZWQgaW4gV2luZG93cyBmZWF0dXJl
cy4gSWYgeW91IGhhdmUgc3BlY2lmaWMgdGhpbmdzIGluIG1pbmQsCj4gPiBJIGNhbiBhc2sgZm9y
IG1vcmUgZGV0YWlscyBhbmQgdGhpbmsgYWJvdXQgaG93IHRvIGltcGxlbWVudCB0aGVtIGluIFhl
bi4KPiAKPiBXZWxsLCBlVk1DUyB3b3VsZCBiZSBhIG1ham9yIG9uZS4gSWYgdGhlIEwyIFdpbmRv
d3MgY291bGQgYmUgdG9sZCB0bwo+IHVzZSB0aGF0IHJhdGhlciB0aGFuIEwwIGhhdmUgdG8gYm91
bmNlIGluZGl2aWR1YWwgVk1SRUFEL1ZNV1JJVEVzIHVwCj4gdG8gTDEgdGhlbiB0aGF0IHdvdWxk
IGJlIGEgd2luLgoKT2gsIEkgd2FzIHRoaW5raW5nIG1vcmUgYWJvdXQgbmFtZXMgb2YgV2luZG93
cyBzcGVjaWZpYyBoaWdoLWxldmVsCmZlYXR1cmVzLiBZZXMgSSBjYW4gZGVmaW5pdGVseSBhc2sg
d2hldGhlciBlVk1DUyBpcyBleHBvc2VkIHRvIEwyIERvbTAgLwpSb290LgoKV2VpLgoKPiAKPiAg
IFBhdWwKPiAKPiA+IAo+ID4gV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
