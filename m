Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D65FCE304B
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 13:24:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNbCK-0000GK-2Q; Thu, 24 Oct 2019 11:22:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZeBO=YR=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iNbCH-0000GF-Vq
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 11:22:30 +0000
X-Inumbo-ID: 90251148-f650-11e9-949e-12813bfff9fa
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 90251148-f650-11e9-949e-12813bfff9fa;
 Thu, 24 Oct 2019 11:22:29 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id r141so2195882wme.4
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2019 04:22:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=B5mAnw2Jlxy4oBhHS87QzSntWs1ZqEl8uhD2g0vJZZE=;
 b=NMxl1RjDW+4nk7p6Tn11yz9dQ0M+YNehXafvQzEtDp/ZBK1lb6uKzo4EJBb67t7gTs
 ljZowjkT5iclhBxz5EWVexaDXfg8idtW09H3TlGgoS1FKI6Ys8sr8BC6XMGdXf4WsiXZ
 TGqi/xgfQDBAXZ6+4dP0X6GeKuvGilZAXc6vKj76c46k2Z82DPGe1EGUbmEgr2aJ1wGQ
 bJr1GMcz5Zgjyvx4968qa663n5Ga8hFSI+n1Tg9l2/QoMk2zTDK57J9tKqB/EtvDVaVN
 PVvI5ubdA9iefgv+I1cjlp/oOC9GKABiEef4sn9RD+gIon59AgcizwGRdy53WEEtyFHq
 PWAA==
X-Gm-Message-State: APjAAAXG7RChX0NDwh5DXFyFHkaB2VYxuJTuvGcN2SYM4/YlM9JfRJHH
 kWAvDpGqtu+PAvOQOv50UJg=
X-Google-Smtp-Source: APXvYqwz8DIubK585dxmjFiB0MC7rUTam+uBpeyRnhNKWsmKuIbLU6+xPHKqYT1qXCsbOFFOpGbfpA==
X-Received: by 2002:a1c:720a:: with SMTP id n10mr4360308wmc.20.1571916148433; 
 Thu, 24 Oct 2019 04:22:28 -0700 (PDT)
Received: from debian (54.163.200.146.dyn.plus.net. [146.200.163.54])
 by smtp.gmail.com with ESMTPSA id i18sm22907678wrx.14.2019.10.24.04.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 04:22:27 -0700 (PDT)
Date: Thu, 24 Oct 2019 12:22:26 +0100
From: Wei Liu <wl@xen.org>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <20191024112226.ugcmzmsyndg3sfeb@debian>
References: <20191024110618.6436-1-wl@xen.org>
 <e05ef290-8e71-046f-a687-9d1a8e1ea7fe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e05ef290-8e71-046f-a687-9d1a8e1ea7fe@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-4.13] CONTRIBUTING: drop reference to
 blktap2
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>,
 lars.kurth@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBPY3QgMjQsIDIwMTkgYXQgMDE6MTM6MTNQTSArMDIwMCwgSsO8cmdlbiBHcm/DnyB3
cm90ZToKPiBPbiAyNC4xMC4xOSAxMzowNiwgV2VpIExpdSB3cm90ZToKPiA+IEJsa3RhcDIgaXMg
Z29uZS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KPiA+IC0t
LQo+ID4gICBDT05UUklCVVRJTkcgfCAxIC0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRp
b24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL0NPTlRSSUJVVElORyBiL0NPTlRSSUJVVElORwo+
ID4gaW5kZXggNDdmNTNlOWE0OS4uNGZmZjRmZDlmNiAxMDA2NDQKPiA+IC0tLSBhL0NPTlRSSUJV
VElORwo+ID4gKysrIGIvQ09OVFJJQlVUSU5HCj4gPiBAQCAtMTMsNyArMTMsNiBAQCBNb3N0IG9m
IHRoZSBYZW4gUHJvamVjdCBjb2RlIGlzIGxpY2Vuc2VkIHVuZGVyIEdQTHYyLCBidXQgYSBudW1i
ZXIgb2YKPiA+ICAgZGlyZWN0b3JpZXMgYXJlIHByaW1hcmlseSBsaWNlbnNlZCB1bmRlciBkaWZm
ZXJlbnQgbGljZW5zZXMuCj4gPiAgIE1vc3Qgbm90YWJseToKPiA+IC0gLSB0b29scy9ibGt0YXAy
ICAgICAgOiBCU0QtTW9kaWZpZWQKPiA+ICAgIC0gdG9vbHMvbGlieGMgICAgICAgIDogTEdQTCB2
Mi4xCj4gPiAgICAtIHRvb2xzL2xpYnhsICAgICAgICA6IExHUEwgdjIuMQo+ID4gICAgLSB0b29s
cy94bCAgICAgICAgICAgOiBMR1BMIHYyLjEKPiA+IAo+IAo+IE1pbmQgYWRkaW5nIHRvb2xzL2xp
YnMgaW5zdGVhZD8KClN1cmUuIFRoYXQgY2FuIGJlIGRvbmUuCgpCZWNhdXNlIHRvb2xzL2xpYnMn
IGNvZGUgaXMgbW9zdGx5IHNwbGl0IGZyb20gbGlieGMgYW5kIGZyaWVuZHMsIEkKYXNzdW1lIGl0
IGlzIGdvaW5nIHRvIGJlIExHUEwgdjIuMSBhcyB3ZWxsLgoKTGFycyBhbmQgSWFuLCB5b3VyIG9w
aW5pb24/CgpXZWkuCgo+IAo+IFdpdGggdGhhdDoKPiAKPiBSZXZpZXdlZC1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IFJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4KPiAKPiAKPiBKdWVyZ2VuCj4gCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4g
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
