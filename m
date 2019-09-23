Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBDCBB495
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 14:58:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCNrR-0005cE-OB; Mon, 23 Sep 2019 12:54:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iV5N=XS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iCNrP-0005c3-OV
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 12:54:35 +0000
X-Inumbo-ID: 4ae27934-de01-11e9-b299-bc764e2007e4
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ae27934-de01-11e9-b299-bc764e2007e4;
 Mon, 23 Sep 2019 12:54:34 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 7so9842972wme.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2019 05:54:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8wXEFY32TPMtH2vtCSgRuD0OVft9Vm1hykMd55gQacE=;
 b=pq4o8gFps2ISVZ3Uz8UnQHT/h8esZsMyWo0pieP3QhIqlJWGL5SChnLi9bsH96qtBp
 S5jS+P1DKIJ98Elej2NJLdm7k+1GUX98e5rQ8HViBBOETl3QV937/kLtlRLPn7m5uDrN
 H1AITC0ttzOfVNe1m7guMjz0lsprme+XU4HAr6GqwZe/MDJjjza5qbYahWnLc4rjxBFg
 c+ZaxSLAM3UPRfcUFh0jJcL4+hdjy4QWMGFBveMWb76Alpg5j+SPTwX6xdMlAPr4TkIw
 uvYBLxuzdoxiBntbhljWr1IiGqdk8+55XYOq60FrHqfJolY2vmvan1eZDQGgy4zcv6TA
 HfVg==
X-Gm-Message-State: APjAAAWVhb3Qig3c2nw8EmiUxlVfrLN0L8wOyK1bEPS4OpqYrf/ADG80
 o7Fp73ohrs8d6+RfZWED//Q=
X-Google-Smtp-Source: APXvYqzexUGmHs7ICkJ+3rbQJN7uUNOXgFY5LTtWs+j4PIWipdZX1tH6e/THSk5UI7I0zL612qpbdQ==
X-Received: by 2002:a7b:c108:: with SMTP id w8mr13910127wmi.8.1569243274060;
 Mon, 23 Sep 2019 05:54:34 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id u68sm18201341wmu.12.2019.09.23.05.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 05:54:33 -0700 (PDT)
Date: Mon, 23 Sep 2019 13:54:31 +0100
From: Wei Liu <wl@xen.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Message-ID: <20190923125431.mpoyvjj7dz6ef4df@debian>
References: <20190923100931.29670-1-liuwe@microsoft.com>
 <40ef09a747534931bf594f945f0048f1@AMSPEX02CL03.citrite.net>
 <20190923112718.qtx6qpme3ghsmf6l@debian>
 <a845cf949f604e848ac704e3406e449e@AMSPEX02CL03.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a845cf949f604e848ac704e3406e449e@AMSPEX02CL03.citrite.net>
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

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMTI6MTE6MjZQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IFdlaSBMaXUgPHds
QHhlbi5vcmc+Cj4gPiBTZW50OiAyMyBTZXB0ZW1iZXIgMjAxOSAxMjoyNwo+ID4gVG86IFBhdWwg
RHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gPiBDYzogJ1dlaSBMaXUnIDx3bEB4
ZW4ub3JnPjsgWGVuIERldmVsb3BtZW50IExpc3QgPHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZz47IFdlaSBMaXUKPiA+IDxsaXV3ZUBtaWNyb3NvZnQuY29tPjsgQW5kcmV3IENvb3BlciA8
QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IE1pY2hhZWwgS2VsbGV5Cj4gPiA8bWlrZWxsZXlA
bWljcm9zb2Z0LmNvbT47IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IFJvZ2VyIFBh
dSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZl
bF0gW1BBVENIIGZvci1uZXh0IFJGQyAwLzhdIFBvcnQgWGVuIHRvIEh5cGVyLVYKPiA+IAo+ID4g
T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMTA6NDg6NDVBTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiA+ID4gRnJvbTogWGVu
LWRldmVsIDx4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxm
IE9mIFdlaSBMaXUKPiA+ID4gPiBTZW50OiAyMyBTZXB0ZW1iZXIgMjAxOSAxMTowOQo+ID4gPiA+
IFRvOiBYZW4gRGV2ZWxvcG1lbnQgTGlzdCA8eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Pgo+ID4gPiA+IENjOiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPjsgV2VpIExpdSA8d2xA
eGVuLm9yZz47IEFuZHJldyBDb29wZXIKPiA+IDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsK
PiA+ID4gPiBNaWNoYWVsIEtlbGxleSA8bWlrZWxsZXlAbWljcm9zb2Z0LmNvbT47IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IFJvZ2VyIFBhdSBNb25uZQo+ID4gPiA+IDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KPiA+ID4gPiBTdWJqZWN0OiBbWGVuLWRldmVsXSBbUEFUQ0ggZm9yLW5l
eHQgUkZDIDAvOF0gUG9ydCBYZW4gdG8gSHlwZXItVgo+ID4gPiA+Cj4gPiA+ID4gSGkgYWxsCj4g
PiA+ID4KPiA+ID4gPiBJbiBjYXNlIHlvdSdyZSB3b25kZXJpbmcsIEkgY2FuIGFscmVhZHkgcnVu
IGEgZnVsbHkgZmxlZGdlZCBYZW4gc3lzdGVtIG9uCj4gPiA+ID4gSHlwZXItViB3aXRoIGVtdWxh
dGVkIGRpc2sgYW5kIG5ldHdvcmsuCj4gPiA+ID4KPiA+ID4gPiBUaGlzIGlzIHRoZSB2ZXJ5IGZp
cnN0IHN0YWdlIGZvciBwb3J0aW5nIFhlbiB0byBydW4gb24gSHlwZXItViB3aXRoIGFsbCB0aGUK
PiA+ID4gPiBnb29kaWVzIEh5cGVyLVYgaGFzIHRvIG9mZmVyLiAgV2l0aCB0aGlzIHNlcmllcywg
WGVuIGNhbiBzdWNjZXNzZnVsbHkgZGV0ZWN0Cj4gPiA+ID4gSHlwZXItViBhbmQgcHJpbnRzIG91
dCBhIG1lc3NhZ2UuICBJIHdvdWxkIGxpa2UgdG8gZmlyc3QgZ2V0IHRoZSBkaXJlY3RvcnkKPiA+
ID4gPiBzdHJ1Y3R1cmUgYW5kIGtjb25maWcgb3B0aW9ucyBhZ3JlZWQgdXBvbi4KPiA+ID4gPgo+
ID4gPiA+IFRoZXJlIGFyZSB0d28gbWFqb3IgYXJlYXMgdG8gYmUgd29ya2VkIG9uOgo+ID4gPiA+
ICAgKiBNYWtlIERvbTAgYWJsZSB0byB1c2UgSHlwZXItVidzIHN5bnRoZXRpYyBkZXZpY2VzLgo+
ID4gPiA+ICAgKiBNYWtlIFhlbiB1c2Ugb2YgdGhlIHN5bnRoZXRpYyB0aW1lciwgcmVmZXJlbmNl
IFRTQyBhbmQgZW5saWdodGVubWVudCBWTUNTCj4gPiA+ID4gICAgIGFuZCBvdGhlciBpbnRlcmZh
Y2VzLgo+ID4gPiA+Cj4gPiA+ID4gVGhleSBhcmVuJ3QgdHJpdmlhbCwgYW5kIHRpbWUgY2FuIGJl
IHNjYXJjZSBvbiBteSBzaWRlLCBzbyBJIGludGVuZCB0byBwb3N0Cj4gPiA+ID4gcGF0Y2hlcyBw
aWVjZSBtZWFsIHdoZW4gdGhleSBhcmUgcmVhZHkuCj4gPiA+ID4KPiA+ID4gPiBRdWVzdGlvbnMg
YW5kIGNvbW1lbnRzIGFyZSB3ZWxjb21lLgo+ID4gPgo+ID4gPiBZYXkhIEdsYWQgeW91IGZvdW5k
IHRoZSB0aW1lIHRvIGRvIHRoaXMgOi0pIE1ha2luZyB1c2Ugb2YgdGhlIHN5bmljLAo+ID4gPiBz
dGltZXIsIHdpbGwgYmUgdXNlZnVsLiBUbyBnZXQgdGhlIGJlbmVmaXQgZm9yIG5lc3RlZCBndWVz
dHMgdGhvdWdoLCBJCj4gPiA+IGFzc3VtZSB3ZSdsbCBuZWVkIHRvIGV4cG9zZWQgZW5saWdodGVu
ZWQgVk1DUywgRVBUIGZsdXNoLCBldGMuCj4gPiA+IHRocm91Z2g/Cj4gPiAKPiA+IFBlciBUTEZT
LCBlVk1DUyBzaG91bGQgYmUgdXNlZCBieSBMMSBYZW4uCj4gCj4gWWVzLCBJIGd1ZXNzIGl0IG9u
bHkgbmVlZHMgdG8gYmUgdXNlZCBieSBMMSwgYnV0IFdpbmRvd3MgaXMgdXNpbmcgYW4KPiBpbmNy
ZWFzaW5nIG51bWJlciBvZiBWTXMgZm9yIHZhcmlvdXMgcHVycG9zZXMgc28gSSB0aGluayBtYWtp
bmcgaXQKPiBzdGFjayB3ZWxsIHdvdWxkIGJlIHVzZWZ1bC4KPiAKPiA+IAo+ID4gTm90IHN1cmUg
d2hhdCB5b3UgbWVhbnQgYnkgRVBUIGZsdXNoLiBJZiB5b3UgbWVhbiB0aGluZ3MgbGlrZQo+ID4g
SHZGbHVzaEd1ZXN0UGh5c2ljYWxBZGRyZXNzU3BhY2UsIEkgdGhpbmsgdGhleSBzaG91bGQgYmUg
dXNlZCBieSBYZW4KPiA+IG9ubHkgYXMgd2VsbC4gSSdtIG5vdCBzdXJlIHdoZXRoZXIgdGhleSBz
aG91bGQgYmUgZXhwb3NlIHRvIEwyIGd1ZXN0cy4KPiA+IAo+IAo+IFllcywgdGhhdCdzIHdoYXQg
SSBtZWFudCBhbmQsIGFnYWluLCBJIHdhcyB0aGlua2luZyBhYm91dCB0aGUgbmVzdGVkCj4gV2lu
ZG93cyBndWVzdCB1c2luZyBWTXMgaXRzZWxmLgoKU28gdGhpcyBpcyBiYXNpY2FsbHkgbmVzdGVk
IG9uIG5lc3RlZC4gSSdtIG5vdCBzdXJlIGhvdyB0byBtYWtlIHRoYXQKd29yayB5ZXQuICBJJ20g
YWxzbyBub3Qgc3VyZSBob3cgd2VsbCB0aGVzZSBpbnRlcmZhY2VzIHN0YWNrLiBUTEZTIG9ubHkK
ZGVzY3JpYmVzIG9uZSBsZXZlbCBvZiBuZXN0aW5nLiBJIHdpbGwgbmVlZCB0byBhc2sgaWYgd2Ug
Y2FuIG1ha2UgbmVzdGVkCm9uIG5lc3RlZCB3b3JrLgoKPiAKPiA+IFRoZXJlIGFyZSBoeXBlcmNh
bGxzIGZvciB2aXJ0dWFsIFRMQiBtYW5hZ2VtZW50LiBXZSBtYXkgY2hvb3NlIHRvIGV4cG9zZQo+
ID4gdGhlbSB0byBMMiBndWVzdHMgZm9yIGJldHRlciBwZXJmb3JtYW5jZS4KPiA+IAo+IAo+IERv
IHlvdSBtZWFuICdEaXJlY3QgVmlydHVhbCBGbHVzaCc/IFRoZSBoeXBlcmNhbGxzIGluIHF1ZXN0
aW9uIGFyZSBhbHJlYWR5IGhhbmRsZWQgaW4gdmlyaWRpYW4gZm9yIHRoZSBwdXJwb3NlcyBvZiBy
ZW1vdGUgVExCIGZsdXNoLCBzbyBJIGd1ZXNzIGl0IHdvdWxkIGJlIGEgcXVlc3Rpb24gb2Ygd2ly
aW5nIHRoZW0gdGhyb3VnaC4KClllcy4gSSBtZWFudCB0aGF0LgoKV2VpLgoKPiAKPiAgIFBhdWwK
PiAKPiA+IFdlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
