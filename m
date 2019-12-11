Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2F111A9F3
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 12:30:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if0Ay-0000es-8J; Wed, 11 Dec 2019 11:29:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=r5Tp=2B=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1if0Aw-0000eS-I2
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 11:29:02 +0000
X-Inumbo-ID: 6e00b124-1c09-11ea-88e7-bc764e2007e4
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e00b124-1c09-11ea-88e7-bc764e2007e4;
 Wed, 11 Dec 2019 11:29:01 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z7so23524587wrl.13
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2019 03:29:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Bs2FE/xMG8Ev9ib9UqSgiRMFx6VJSTJ7hxBSsJC6gQ4=;
 b=mTulUEhfoL63LBKTZQdKxPQ9c+J6UgvorE0nQmqPGkKD0vZZyUEMtbBeIAlqK7ddvW
 I3hUjDKjcJj9rgzOozTsb2+p7u4z1t5VAwAAL21l2IIQ7slwWVdNqfC5+pLVFcloTnRV
 R/0uixP/RJC7RQQeiJvJwX9IEUJM33L27BM0FnJAW1QAOYRIM13dLWZeKBChrAVOVOdN
 VCb5WumKcg5i+51MoeEWV/JxT9wOWXLSn5d6Q5vXfzrBHCrBaLFGPaO9DcZ8TScmYFEM
 GlNsBmsKoOpF1XEfaptB9kIHlCGnY3aj3bxNgSF1SnyALcvcNqYCEpMZyz6hZmJBgqbR
 TnTA==
X-Gm-Message-State: APjAAAV2b4FiT2IRyWbNQ9QKlKklXO6FIXALiw4UoKB3HzvlUC3vDn9n
 ihv8KRxecE/9qtCn3NIEIaM=
X-Google-Smtp-Source: APXvYqzk5SLeIatWrwAdK1ASfAzBAsZQXSVWNX4l3gZ1eH2jnQIrPA3MYnjVxWBD3Xj/oJV16PDJLw==
X-Received: by 2002:a5d:4c85:: with SMTP id z5mr3190858wrs.42.1576063741092;
 Wed, 11 Dec 2019 03:29:01 -0800 (PST)
Received: from debian (122.163.200.146.dyn.plus.net. [146.200.163.122])
 by smtp.gmail.com with ESMTPSA id g21sm2270446wmh.17.2019.12.11.03.29.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 03:29:00 -0800 (PST)
Date: Wed, 11 Dec 2019 11:28:59 +0000
From: Wei Liu <wl@xen.org>
To: "Durrant, Paul" <pdurrant@amazon.com>
Message-ID: <20191211112859.ebbca5pgddffs6m4@debian>
References: <20191025091618.10153-1-liuwe@microsoft.com>
 <20191025091618.10153-2-liuwe@microsoft.com>
 <97016273-46d8-423d-8eef-f448f2d04845@suse.com>
 <cbb42ea2e12a4731873ae74ed0668a3c@EX13D32EUC003.ant.amazon.com>
 <66f2460e-8cb5-1866-32f1-6538092cb866@suse.com>
 <20191211111456.6jfbvp3llw6y43dp@debian>
 <7e82b4ce7784450aaa15f615e11bf949@EX13D32EUC003.ant.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7e82b4ce7784450aaa15f615e11bf949@EX13D32EUC003.ant.amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-next 1/7] x86: import hyperv-tlfs.h from
 Linux
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
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBEZWMgMTEsIDIwMTkgYXQgMTE6MjI6NDlBTSArMDAwMCwgRHVycmFudCwgUGF1bCB3
cm90ZToKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBXZWkgTGl1IDx3
bEB4ZW4ub3JnPgo+ID4gU2VudDogMTEgRGVjZW1iZXIgMjAxOSAxMToxNQo+ID4gVG86IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+IENjOiBEdXJyYW50LCBQYXVsIDxwZHVycmFu
dEBhbWF6b24uY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IFdlaSBMaXUKPiA+IDxsaXV3ZUBt
aWNyb3NvZnQuY29tPjsgUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+OyBBbmRyZXcgQ29vcGVy
Cj4gPiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IE1pY2hhZWwgS2VsbGV5IDxtaWtlbGxl
eUBtaWNyb3NvZnQuY29tPjsgWGVuCj4gPiBEZXZlbG9wbWVudCBMaXN0IDx4ZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmc+OyBSb2dlciBQYXUgTW9ubsOpCj4gPiA8cm9nZXIucGF1QGNpdHJp
eC5jb20+Cj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIGZvci1uZXh0IDEvN10geDg2OiBpbXBvcnQg
aHlwZXJ2LXRsZnMuaCBmcm9tIExpbnV4Cj4gPiAKPiA+IE9uIFR1ZSwgRGVjIDEwLCAyMDE5IGF0
IDA0OjQzOjMwUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4gPiBPbiAxMC4xMi4yMDE5
IDE2OjM3LCBEdXJyYW50LCBQYXVsIHdyb3RlOgo+ID4gPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQo+ID4gPiA+PiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3Rz
LnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YKPiA+IEphbgo+ID4gPiA+PiBCZXVsaWNoCj4g
PiA+ID4+IFNlbnQ6IDEwIERlY2VtYmVyIDIwMTkgMTU6MzQKPiA+ID4gPj4gVG86IFdlaSBMaXUg
PHdsQHhlbi5vcmc+Cj4gPiA+ID4+IENjOiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPjsg
UGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+Owo+ID4gQW5kcmV3Cj4gPiA+ID4+IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IE1pY2hhZWwgS2VsbGV5Cj4gPiA+ID4+IDxtaWtl
bGxleUBtaWNyb3NvZnQuY29tPjsgWGVuIERldmVsb3BtZW50IExpc3QgPHhlbi0KPiA+ID4gPj4g
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KPiA+ID4gPj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCBmb3It
bmV4dCAxLzddIHg4NjogaW1wb3J0IGh5cGVydi0KPiA+IHRsZnMuaAo+ID4gPiA+PiBmcm9tIExp
bnV4Cj4gPiA+ID4+Cj4gPiA+ID4+IE9uIDI1LjEwLjIwMTkgMTE6MTYsIFdlaSBMaXUgd3JvdGU6
Cj4gPiA+ID4+PiBUYWtlbiBmcm9tIExpbnV4IGNvbW1pdCBiMmQ4YjE2N2UxNWJiNWVjMjY5MWQx
MTE5YzAyNTYzMGEyNDdmNjQ5Lgo+ID4gPiA+Pj4KPiA+ID4gPj4+IFRoaXMgaXMgYSBwcmlzdGlu
ZSBjb3B5IGZyb20gTGludXguIEl0IGlzIG5vdCB1c2VkIHlldCBhbmQgcHJvYmFibHkKPiA+ID4g
Pj4+IGRvZXNuJ3QgY29tcGlsZS4gQ2hhbmdlcyB0byBtYWtlIGl0IHdvcmsgd2lsbCBjb21lIGxh
dGVyLgo+ID4gPiA+Pj4KPiA+ID4gPj4+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1p
Y3Jvc29mdC5jb20+Cj4gPiA+ID4+Cj4gPiA+ID4+IFRoaXMgY29taW5nIGZyb20gTGludXggYW5k
IGFzc3VtaW5nIGF0IGxlYXN0IGEgZmFpciBwYXJ0IG9mIGl0IGlzCj4gPiA+ID4+IGdvaW5nIHRv
IGJlIHVzZWQsIGluIHByaW5jaXBsZQo+ID4gPiA+PiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgo+ID4gPiA+Pgo+ID4gPiA+PiBIb3dldmVyLCB0aGVyZSBhcmUgbWFu
eSBzZWVtaW5nbHkgdW5uZWNlc3NhcnkgdXNlcyBvZiBfX3BhY2tlZAo+ID4gPiA+PiBoZXJlLCB3
aGljaCBJJ2QgcmF0aGVyIG5vdCBzZWUgZ28gaW4gYXQgYWxsIChpLmUuIG5vdCBiZSBkcm9wcGVk
Cj4gPiA+ID4+IGxhdGVyIG9uLCBhbmQgdGhlbiBwb3RlbnRpYWxseSBtaXNzaW5nIHNvbWUpLiBJ
IGZpbmQgLi4uCj4gPiA+ID4+Cj4gPiA+ID4+PiArdHlwZWRlZiBzdHJ1Y3QgX0hWX1JFRkVSRU5D
RV9UU0NfUEFHRSB7Cj4gPiA+ID4+PiArCV9fdTMyIHRzY19zZXF1ZW5jZTsKPiA+ID4gPj4+ICsJ
X191MzIgcmVzMTsKPiA+ID4gPj4+ICsJX191NjQgdHNjX3NjYWxlOwo+ID4gPiA+Pj4gKwlfX3M2
NCB0c2Nfb2Zmc2V0Owo+ID4gPiA+Pj4gK30gIF9fcGFja2VkIEhWX1JFRkVSRU5DRV9UU0NfUEFH
RSwgKlBIVl9SRUZFUkVOQ0VfVFNDX1BBR0U7Cj4gPiA+ID4+Cj4gPiA+ID4KPiA+ID4gPiBZb3Ug
cmVhbGlzZSB0aGVyZSdzIGEgZGVmaW5pdGlvbiBvZiB0aGlzIGluIHRoZSB2aXJpZGlhbiBjb2Rl
IGFscmVhZHksCj4gPiByaWdodD8KPiA+ID4KPiA+ID4gSXQgbG9va2VkIGZhbWlsaWFyLCBidXQg
aXQgZGlkbid0IG9jY3VyIHRvIG1lIHRvIHBvaW50IHRoaXMgb3V0Lgo+ID4gPiBZZXMsIHRoZXJl
IGxvb2tzIHRvIGJlIHJvb20gZm9yIGRlZHVwbGljYXRpb24uLi4KPiA+ID4KPiA+IAo+ID4gSSBo
YWQgYSBwbGFuIHRvIG1ha2UgdmlyaWRpYW4gY29kZSB1c2UgdGhpcyBjb3B5IGRpcmVjdGx5Lgo+
ID4gCj4gCj4gSSBoYXZlIG5vIG9iamVjdGlvbiB0byB0aGF0LCBidXQgSSB0aGluayBpdCBvdWdo
dCB0byBiZSBkb25lIGFzIHBhcnQgb2YgdGhpcyBzZXJpZXMgc28gdGhhdCB3ZSBkb24ndCBlbmQg
dXAgd2l0aCBsb25nLXRlcm0gZHVwbGljYXRpb24uCgpTdXJlLiBUaGF0IHNob3VsZG4ndCBiZSB0
b28gaGFyZC4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
