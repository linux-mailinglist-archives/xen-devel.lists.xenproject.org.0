Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D973BB706
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 16:44:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCPXB-0008MS-Ez; Mon, 23 Sep 2019 14:41:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iV5N=XS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iCPX9-0008MC-Um
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 14:41:47 +0000
X-Inumbo-ID: 44d86922-de10-11e9-b299-bc764e2007e4
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 44d86922-de10-11e9-b299-bc764e2007e4;
 Mon, 23 Sep 2019 14:41:47 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id x2so10278858wmj.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2019 07:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mCFL3SRECao9wbmpwTL3XmXla2q+rF1Khz4XUG8RiqY=;
 b=IE8dT41ja1D9lvwYX58RGqHwSEsgJyX1qCSycO8o5CI7JTRzZ0o3ZaeUg5lU/b9ggU
 qzOCYzulQ09NnS4hkXUKfqnSXOFsd0d+dBClIpFN+nUkzlkwZkVTHUXirBVKtAciACAO
 oVo7zQqwOGufRp30BHkzCzV1xGt6MjHGjxIXRLk5XcoE08gXbibadl+RXxCbmPxT0rc2
 pqLNTAoJhI/taPGI4LpbET+kWKlHZ27ghpc8GscMoUHk3nF0E03S3VLxatgH7qI1RhYD
 sIzfcc9rPLeGEYt5xsy+0Gq64wf/QoSm0q8IFz8xwuV1uNLbAN9lOG6zSot/yHww9dbd
 9ZlA==
X-Gm-Message-State: APjAAAUlwLf7hpkRJQOC0mJtYYTPB3HAioWIBKNGdlb6EyZbTrssd8Nj
 WmRUIgJ3UGPNebG1HQLsQio=
X-Google-Smtp-Source: APXvYqxlOE0yGH9JPTgpb2CZ9Y591wuzRUhq2w5pJw30UUt/dqoGwtUSLnWK57BUyt2e/ktUzqJd1Q==
X-Received: by 2002:a1c:6508:: with SMTP id z8mr14807251wmb.93.1569249706428; 
 Mon, 23 Sep 2019 07:41:46 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id i14sm13104749wra.78.2019.09.23.07.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 07:41:45 -0700 (PDT)
Date: Mon, 23 Sep 2019 15:41:44 +0100
From: Wei Liu <wl@xen.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Message-ID: <20190923144144.4ax3av4sq574idzu@debian>
References: <20190923100931.29670-1-liuwe@microsoft.com>
 <40ef09a747534931bf594f945f0048f1@AMSPEX02CL03.citrite.net>
 <20190923112718.qtx6qpme3ghsmf6l@debian>
 <a845cf949f604e848ac704e3406e449e@AMSPEX02CL03.citrite.net>
 <20190923125431.mpoyvjj7dz6ef4df@debian>
 <20190923133335.ktlnpbxqnanraytq@debian>
 <7266c9a91c7c4dcba0aab375fa5aad08@AMSPEX02CL03.citrite.net>
 <20190923142123.h6c36wvmujghrhtm@debian>
 <e715a67310164f59bc5a78e633b435af@AMSPEX02CL03.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e715a67310164f59bc5a78e633b435af@AMSPEX02CL03.citrite.net>
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

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMDI6Mzk6MTBQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IFdlaSBMaXUgPHds
QHhlbi5vcmc+Cj4gPiBTZW50OiAyMyBTZXB0ZW1iZXIgMjAxOSAxNToyMQo+ID4gVG86IFBhdWwg
RHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gPiBDYzogJ1dlaSBMaXUnIDx3bEB4
ZW4ub3JnPjsgWGVuIERldmVsb3BtZW50IExpc3QgPHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZz47IFdlaSBMaXUKPiA+IDxsaXV3ZUBtaWNyb3NvZnQuY29tPjsgQW5kcmV3IENvb3BlciA8
QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IE1pY2hhZWwgS2VsbGV5Cj4gPiA8bWlrZWxsZXlA
bWljcm9zb2Z0LmNvbT47IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IFJvZ2VyIFBh
dSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZl
bF0gW1BBVENIIGZvci1uZXh0IFJGQyAwLzhdIFBvcnQgWGVuIHRvIEh5cGVyLVYKPiA+IAo+ID4g
T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMDE6NDc6MTRQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiA+ID4gRnJvbTogV2Vp
IExpdSA8d2xAeGVuLm9yZz4KPiA+ID4gPiBTZW50OiAyMyBTZXB0ZW1iZXIgMjAxOSAxNDozNAo+
ID4gPiA+IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPgo+ID4gPiA+
IENjOiAnV2VpIExpdScgPHdsQHhlbi5vcmc+OyBYZW4gRGV2ZWxvcG1lbnQgTGlzdCA8eGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPjsgV2VpIExpdQo+ID4gPiA+IDxsaXV3ZUBtaWNyb3Nv
ZnQuY29tPjsgQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IE1pY2hh
ZWwgS2VsbGV5Cj4gPiA+ID4gPG1pa2VsbGV5QG1pY3Jvc29mdC5jb20+OyBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+OyBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29t
Pgo+ID4gPiA+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggZm9yLW5leHQgUkZDIDAv
OF0gUG9ydCBYZW4gdG8gSHlwZXItVgo+ID4gPiA+Cj4gPiA+ID4gQW5kIGEgYml0IG1vcmUgdGhv
dWdodC4KPiA+ID4gPgo+ID4gPiA+IE9uIE1vbiwgU2VwIDIzLCAyMDE5IGF0IDAxOjU0OjMxUE0g
KzAxMDAsIFdlaSBMaXUgd3JvdGU6Cj4gPiA+ID4gWy4uLl0KPiA+ID4gPiA+ID4gPgo+ID4gPiA+
ID4gPiA+IFBlciBUTEZTLCBlVk1DUyBzaG91bGQgYmUgdXNlZCBieSBMMSBYZW4uCj4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+IFllcywgSSBndWVzcyBpdCBvbmx5IG5lZWRzIHRvIGJlIHVzZWQgYnkg
TDEsIGJ1dCBXaW5kb3dzIGlzIHVzaW5nIGFuCj4gPiA+ID4gPiA+IGluY3JlYXNpbmcgbnVtYmVy
IG9mIFZNcyBmb3IgdmFyaW91cyBwdXJwb3NlcyBzbyBJIHRoaW5rIG1ha2luZyBpdAo+ID4gPiA+
ID4gPiBzdGFjayB3ZWxsIHdvdWxkIGJlIHVzZWZ1bC4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiA+IE5vdCBzdXJlIHdoYXQgeW91IG1lYW50IGJ5IEVQVCBmbHVzaC4gSWYg
eW91IG1lYW4gdGhpbmdzIGxpa2UKPiA+ID4gPiA+ID4gPiBIdkZsdXNoR3Vlc3RQaHlzaWNhbEFk
ZHJlc3NTcGFjZSwgSSB0aGluayB0aGV5IHNob3VsZCBiZSB1c2VkIGJ5IFhlbgo+ID4gPiA+ID4g
PiA+IG9ubHkgYXMgd2VsbC4gSSdtIG5vdCBzdXJlIHdoZXRoZXIgdGhleSBzaG91bGQgYmUgZXhw
b3NlIHRvIEwyIGd1ZXN0cy4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBZ
ZXMsIHRoYXQncyB3aGF0IEkgbWVhbnQgYW5kLCBhZ2FpbiwgSSB3YXMgdGhpbmtpbmcgYWJvdXQg
dGhlIG5lc3RlZAo+ID4gPiA+ID4gPiBXaW5kb3dzIGd1ZXN0IHVzaW5nIFZNcyBpdHNlbGYuCj4g
PiA+ID4gPgo+ID4gPiA+ID4gU28gdGhpcyBpcyBiYXNpY2FsbHkgbmVzdGVkIG9uIG5lc3RlZC4g
SSdtIG5vdCBzdXJlIGhvdyB0byBtYWtlIHRoYXQKPiA+ID4gPiA+IHdvcmsgeWV0LiAgSSdtIGFs
c28gbm90IHN1cmUgaG93IHdlbGwgdGhlc2UgaW50ZXJmYWNlcyBzdGFjay4gVExGUyBvbmx5Cj4g
PiA+ID4gPiBkZXNjcmliZXMgb25lIGxldmVsIG9mIG5lc3RpbmcuIEkgd2lsbCBuZWVkIHRvIGFz
ayBpZiB3ZSBjYW4gbWFrZSBuZXN0ZWQKPiA+ID4gPiA+IG9uIG5lc3RlZCB3b3JrLgo+ID4gPiA+
ID4KPiA+ID4gPgo+ID4gPiA+IFNpbmNlIEwyIFJvb3QgaXMgV2luZG93cyBpbiBhIEh5cGVyLVYg
c2V0dXAsIGNoYW5jZXMgYXJlIHdoYXQgeW91IHdhbnQKPiA+ID4gPiBhbHJlYWR5IHdvcmtzLiBP
ZiBjb3Vyc2UgdGhpcyBkZXBlbmRzIG9uIHdoZXRoZXIgV2luZG93cywgd2hlbiBydW5uaW5nCj4g
PiA+ID4gYXMgUm9vdCBvciBDaGlsZCwgdXNlcyBWTSByZWxhdGVkIGZlYXR1cmVzLgo+ID4gPiA+
Cj4gPiA+ID4gSSdtIG5vdCB2ZXJzZWQgaW4gV2luZG93cyBmZWF0dXJlcy4gSWYgeW91IGhhdmUg
c3BlY2lmaWMgdGhpbmdzIGluIG1pbmQsCj4gPiA+ID4gSSBjYW4gYXNrIGZvciBtb3JlIGRldGFp
bHMgYW5kIHRoaW5rIGFib3V0IGhvdyB0byBpbXBsZW1lbnQgdGhlbSBpbiBYZW4uCj4gPiA+Cj4g
PiA+IFdlbGwsIGVWTUNTIHdvdWxkIGJlIGEgbWFqb3Igb25lLiBJZiB0aGUgTDIgV2luZG93cyBj
b3VsZCBiZSB0b2xkIHRvCj4gPiA+IHVzZSB0aGF0IHJhdGhlciB0aGFuIEwwIGhhdmUgdG8gYm91
bmNlIGluZGl2aWR1YWwgVk1SRUFEL1ZNV1JJVEVzIHVwCj4gPiA+IHRvIEwxIHRoZW4gdGhhdCB3
b3VsZCBiZSBhIHdpbi4KPiA+IAo+ID4gT2gsIEkgd2FzIHRoaW5raW5nIG1vcmUgYWJvdXQgbmFt
ZXMgb2YgV2luZG93cyBzcGVjaWZpYyBoaWdoLWxldmVsCj4gPiBmZWF0dXJlcy4gWWVzIEkgY2Fu
IGRlZmluaXRlbHkgYXNrIHdoZXRoZXIgZVZNQ1MgaXMgZXhwb3NlZCB0byBMMiBEb20wIC8KPiA+
IFJvb3QuCj4gCj4gT2gsIEkgc2VlLiBUaGUgbWFpbiBvbmVzIGFyZSAnY3JlZGVudGlhbCBndWFy
ZCcgYW5kIHRoZSBtb3JlIHJlY2VudCAnc2FuZGJveCcuCj4gCgpHb3QgaXQuCgpXZWkuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
