Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62601145D92
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 22:20:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuNNG-0002hp-E3; Wed, 22 Jan 2020 21:17:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JraP=3L=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iuNNE-0002he-Ul
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 21:17:16 +0000
X-Inumbo-ID: 8481e3d6-3d5c-11ea-9fd7-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8481e3d6-3d5c-11ea-9fd7-bc764e2007e4;
 Wed, 22 Jan 2020 21:16:56 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 275442465B;
 Wed, 22 Jan 2020 21:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579727815;
 bh=moEH/B19r9QVzDEJVUALz8RnnMgq9baqunAIctxpf7A=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=AmaG0FxDKvZEg8Q170AYDGOf17ZWNv1tfS/jtS64sSN+shUZVdn9oZ8TYj2MkH4bt
 2aN/griJTvOQZ5O5Enwca9gHgXgqJar6zU9/Rm9nrpgxYKItRgju4lf8pv6bquz0ZN
 jwwKb4gq3W/x6R3t8JK8sbl29FG6o+qW1BHlcwB4=
Date: Wed, 22 Jan 2020 13:16:54 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Lars Kurth <lars.kurth@citrix.com>
In-Reply-To: <63005C11-CF8C-4794-B9E4-C3856CCF41C1@citrix.com>
Message-ID: <alpine.DEB.2.21.2001221312560.16648@sstabellini-ThinkPad-T480s>
References: <63005C11-CF8C-4794-B9E4-C3856CCF41C1@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [Vote] For Xen Project Code of Conduct (deadline
 March 31st)
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
Cc: "xen-api@lists.xenproject.org" <xen-api@lists.xenproject.org>,
 "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "mirageos-devel@lists.xenproject.org" <mirageos-devel@lists.xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "win-pv-devel@lists.xenproject.org" <win-pv-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAxNyBKYW4gMjAyMCwgTGFycyBLdXJ0aCB3cm90ZToKPiBIaSBhbGwsCj4gCj4gZm9y
IHNvbWUgdGltZSBub3cgd2UgaGF2ZSBiZWVuIGRpc2N1c3NpbmcgdGhlIFhlbiBQcm9qZWN0IENv
ZGUgb2YKPiBDb25kdWN0LiBUaGUgbW9zdCByZWNlbnQgc2V0IG9mIGZlZWRiYWNrIGhhcyBiZWVu
IHByaW1hcmlseSBhcm91bmQKPiBtaW5vciBsYW5ndWFnZSBpc3N1ZXMgKFVTIHZzIFVMIEVuZ2xp
c2gsIGV0Yy4pLCB3aGljaCBpbmRpY2F0ZXMgdG8gbWUgCj4gdGhhdCB0aGUgcHJvcG9zYWwgaXMg
cmVhZHkgdG8gYmUgdm90ZWQgb24KPiAKPiBUaGUgZmluYWwgdmVyc2lvbiB3aGljaCBhZGRyZXNz
ZXMgYWxsIHRoZSBsYXRlc3QgbWlub3IgZmVlZGJhY2sgY2FuIGJlCj4gZm91bmQgYXQgaHR0cDov
L3hlbmJpdHMueGVucHJvamVjdC5vcmcvZ2l0d2ViLz9wPXBlb3BsZS9sYXJzay9jb2RlLW9mLWNv
bmR1Y3QuZ2l0O2E9dHJlZTtoPXJlZnMvaGVhZHMvQ29DLXY1IAo+IAo+IEl0IHNob3VsZCBiZSBy
ZWFkIGluIHRoZSBmb2xsb3dpbmcgb3JkZXIKPiAqIGh0dHA6Ly94ZW5iaXRzLnhlbnByb2plY3Qu
b3JnL2dpdHdlYi8/cD1wZW9wbGUvbGFyc2svY29kZS1vZi1jb25kdWN0LmdpdDthPWJsb2I7Zj1j
b2RlLW9mLWNvbmR1Y3QubWQgCj4gKiBodHRwOi8veGVuYml0cy54ZW5wcm9qZWN0Lm9yZy9naXR3
ZWIvP3A9cGVvcGxlL2xhcnNrL2NvZGUtb2YtY29uZHVjdC5naXQ7YT1ibG9iO2Y9Y29tbXVuaWNh
dGlvbi1ndWlkZS5tZAo+ICogaHR0cDovL3hlbmJpdHMueGVucHJvamVjdC5vcmcvZ2l0d2ViLz9w
PXBlb3BsZS9sYXJzay9jb2RlLW9mLWNvbmR1Y3QuZ2l0O2E9YmxvYjtmPWNvZGUtcmV2aWV3LWd1
aWRlLm1kCj4gKiBodHRwOi8veGVuYml0cy54ZW5wcm9qZWN0Lm9yZy9naXR3ZWIvP3A9cGVvcGxl
L2xhcnNrL2NvZGUtb2YtY29uZHVjdC5naXQ7YT1ibG9iO2Y9Y29tbXVuaWNhdGlvbi1wcmFjdGlj
ZS5tZCAKPiAqIGh0dHA6Ly94ZW5iaXRzLnhlbnByb2plY3Qub3JnL2dpdHdlYi8/cD1wZW9wbGUv
bGFyc2svY29kZS1vZi1jb25kdWN0LmdpdDthPWJsb2I7Zj1yZXNvbHZpbmctZGlzYWdyZWVtZW50
Lm1kIAo+IAo+IEluIGFjY29yZGFuY2Ugd2l0aCBodHRwczovL3hlbnByb2plY3Qub3JnL2RldmVs
b3BlcnMvZ292ZXJuYW5jZS8sIEkgbmVlZCB0aGUKPiBsZWFkZXJzaGlwIHRlYW1zIG9mIHRoZSB0
aHJlZSBtYXR1cmUgcHJvamVjdHM6IHRoZSBIeXBlcnZpc29yLCB0aGUgWEFQSQo+IHByb2plY3Qg
YW5kIHRoZSBXaW5kb3dzIFBWIERyaXZlciBwcm9qZWN0IHRvIHZvdGUgb24gdGhpcyBwcm9wb3Nh
bC4KPiAKPiBUaGUgc3BlY2lmaWMgdm90aW5nIHJ1bGVzIGluIHRoaXMgY2FzZSBhcmUgb3V0bGlu
ZWQgaW4gc2VjdGlvbgo+IGh0dHBzOi8vd3d3LnhlbnByb2plY3Qub3JnL2dvdmVybmFuY2UuaHRt
bCNwcm9qZWN0LWRlY2lzaW9ucyAKPiAKPiBQZW9wbGUgYWxsb3dlZCB0byB2b3RlIG9uIGJlaGFs
ZiBvZiB0aGUgSHlwZXJ2aXNvciBwcm9qZWN0IGFyZToKPiBKdWxpZW4gR3JhbGwsIEFuZHkgQ29v
cGVyLCBHZW9yZ2UgRHVubGFwLCBJYW4gSmFja3NvbiwgSmFuIEJldWxpY2gsIEtvbnJhZCBSCj4g
V2lsaywgU3RlZmFubyBTdGFiZWxsaW5pLCBXZWkgTGl1IGFuZCBQYXVsIER1cnJhbnQgKGFzIFJl
bGVhc2UgTWFuYWdlcikuCj4gCj4gUGVvcGxlIGFsbG93ZWQgdG8gdm90ZSBvbiBiZWhhbGYgb2Yg
dGhlIFhBUEkgcHJvamVjdCBhcmU6Cj4gQ2hhbmRyaWthIFNyaW5pdmFzYW4sIENocmlzdGlhbiBM
aW5kaWcsIEtvbnN0YW50aW5hIENocmVtbW91LAo+IFJvYiBIb2VzLCBaaGFuZyBMaQo+IAo+IFBl
b3BsZSBhbGxvd2VkIHRvIHZvdGUgb24gYmVoYWxmIG9mIHRoZSBXaW5kb3dzIFBWIERyaXZlciBQ
cm9qZWN0IGFyZToKPiBQYXVsIER1cnJhbnQsIEJlbiBDaGFsbWVycywgT3dlbiBTbWl0aAo+IAo+
IEkgcHJvcG9zZSB0byB0YWxseSB0aGUgdm90ZXMgYWZ0ZXIgTWFyY2ggMzFzdC4gWW91IGNhbiBy
ZXBseSB2aWEKPiArMTogZm9yIHByb3Bvc2FsCj4gLTE6IGFnYWluc3QgcHJvcG9zYWwKPiBpbiBw
dWJsaWMgb3IgcHJpdmF0ZS4KCisxCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
