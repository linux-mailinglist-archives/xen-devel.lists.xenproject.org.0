Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AC781F2C
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 16:34:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hue0d-0001bB-6T; Mon, 05 Aug 2019 14:30:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dpjS=WB=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hue0c-0001b6-D2
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 14:30:46 +0000
X-Inumbo-ID: 9ab1f114-b78d-11e9-83bf-43a863b6dd13
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ab1f114-b78d-11e9-83bf-43a863b6dd13;
 Mon, 05 Aug 2019 14:30:43 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: I7PrfdxZutIYErbprfsMm0uIz+rGLe8Af3yXgS/aul2DIaHs/XcCr0PCdgE0/C7bUJvCA35WWY
 61tMlDKMPBt/oTSrACj0DOmkkEMlIfupACUs9gvoK6hFZ+FebJpWdQT29RtFgWQefNeMBmT5LM
 UoC99EM6lFtf3yq+l+lsdGDLAKS/y5El87EBS6BJr9YiFMuQ6o8Ov31sfv4SKoNpLW1dkZZ67i
 yHXY+BaxBhWUMn+kc4gaNNE8I9Ize1Nsrv9r6QsjMGhZG/oTrBtOJrUaxGMKndZ29JPptQh8ac
 Y6A=
X-SBRS: 2.7
X-MesageID: 3909676
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,350,1559534400"; 
   d="scan'208";a="3909676"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23880.15729.688038.327874@mariner.uk.xensource.com>
Date: Mon, 5 Aug 2019 15:30:09 +0100
To: Wei Liu <wl@xen.org>
Newsgroups: chiark.mail.xen.devel
In-Reply-To: <20190728105536.fezkzvqmie7zgdml@debian>
References: <156417922934.29470.16776755402986910394.stgit@Palanthas>
 <20190728105536.fezkzvqmie7zgdml@debian>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] tools: ipxe: update for fixing build with
 GCC9
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
Cc: xen-devel@lists.xenproject.org, Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2VpIExpdSB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW1BBVENIXSB0b29sczogaXB4ZTogdXBk
YXRlIGZvciBmaXhpbmcgYnVpbGQgd2l0aCBHQ0M5Iik6Cj4gT24gU2F0LCBKdWwgMjcsIDIwMTkg
YXQgMTI6MTM6NDlBTSArMDIwMCwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gPiBCdWlsZGluZyB3
aXRoIEdDQzkgKG9uIG9wZW5TVVNFIFR1Ym1sZXdlZWQpIGdlbmVyYXRlcyBhIGxvdCBvZiBlcnJv
cnMgb2YKPiA+IHRoZSAidGFraW5nIGFkZHJlc3Mgb2YgcGFja2VkIG1lbWJlciBvZiAuLi4gbWF5
IHJlc3VsdCBpbiBhbiB1bmFsaWduZWQKPiA+IHBvaW50ZXIgdmFsdWUiIGtpbmQuCj4gPiAKPiA+
IFVwZGF0aW5nIHRvIHVwc3RyZWFtIGNvbW1pdCAxZGQ1NmRiZDExMDgyICgiW2J1aWxkXSBXb3Jr
YXJvdW5kIGNvbXBpbGF0aW9uCj4gPiBlcnJvciB3aXRoIGdjYyA5LjEiKSBzZWVtcyB0byBmaXgg
dGhlIHByb2JsZW0uCj4gPiAKPiA+IEZvciBtb3JlIGluZm8sIHNlZToKLi4uCj4gWWVzIHRoaXMg
aXMgd2hhdCB3ZSBub3JtYWxseSBkby4KPiAKPiBBY2tlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9y
Zz4KClRoYW5rcyBhbGwuICBTaG91bGQgdGhpcyBiZSBiYWNrcG9ydGVkIGFueXdoZXJlID8gIEkn
bSBpbmNsaW5lZCB0byBzYXkKIm5vIiBiZWNhdXNlIHNvbWVvbmUgd2hvIHdhbnRzIHRoaXMgY2Fu
IGVhc2lseSBjaGFuZ2UgaXQgdGhlbXNlbHZlcywKYW5kIHdlIGRvbid0IHdhbnQgdG8gZGlzdHVy
YiBzdGFibGUgdXNlcnMgd2l0aCBhbiBpcHhlIHZlcnNpb24gdXBkYXRlLgoKQnV0IEknbSBvcGVu
IHRvIG9waW5pb25zLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
