Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 650BC18F3EA
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 12:50:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGLZe-0007y0-6c; Mon, 23 Mar 2020 11:48:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zrun=5I=mail.xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1jGLZc-0007xb-ME
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 11:48:52 +0000
X-Inumbo-ID: 44501a24-6cfc-11ea-a6c1-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 44501a24-6cfc-11ea-a6c1-bc764e2007e4;
 Mon, 23 Mar 2020 11:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=g0dzJ+F4SGY7pLOPc3GunO6aGMkjHv3VDvuuVboB2rE=; b=xk8xXA2HA6CjehhCyll7WyNzj6
 Zs3khgccHKtY58BSU0J74D35NMGWZKeKlpJ0Ng2Z5SdFAVE4rJhC6NrjfftG83ZeIUBCa/PWAPNzd
 lha3CPPksFkZtMACmiUp3FWnO+n5N5lCK38+Jf/dRRTVmM7bSR0AdvXFC6+TcVjGSruw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@mail.xenproject.org>)
 id 1jGLZb-0002iJ-BC; Mon, 23 Mar 2020 11:48:51 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jGLZb-0002iL-0E; Mon, 23 Mar 2020 11:48:51 +0000
Date: Mon, 23 Mar 2020 11:48:48 +0000
From: Wei Liu <wl@xen.org>
To: "YOUNG, MICHAEL A." <m.a.young@durham.ac.uk>
Message-ID: <20200323114848.pegjk2lsmkqtegcf@debian>
References: <27a883ea723d5d123cb3a10d2a6092ad54a6171e.1584485918.git.m.a.young@durham.ac.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <27a883ea723d5d123cb3a10d2a6092ad54a6171e.1584485918.git.m.a.young@durham.ac.uk>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [XEN PATCH] mismatch between pyxc_methods flags and
 PyObject definitions
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXIgMTcsIDIwMjAgYXQgMTE6MDE6NDNQTSArMDAwMCwgWU9VTkcsIE1JQ0hBRUwg
QS4gd3JvdGU6Cj4gcHlncnViIGluIHhlbi00LjEzLjAgd2l0aCBweXRob24gMy44LjIgZmFpbHMg
d2l0aCB0aGUgZXJyb3IKPiAKPiBUcmFjZWJhY2sgKG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6Cj4g
ICBGaWxlICIvdXNyL2xpYmV4ZWMveGVuL2Jpbi9weWdydWIiLCBsaW5lIDIxLCBpbiA8bW9kdWxl
Pgo+ICAgICBpbXBvcnQgeGVuLmxvd2xldmVsLnhjCj4gU3lzdGVtRXJyb3I6IGJhZCBjYWxsIGZs
YWdzCj4gCj4gVGhpcyBwYXRjaCBmaXhlcyBtaXNtYXRjaGVzIGluIHRvb2xzL3B5dGhvbi94ZW4v
bG93bGV2ZWwveGMveGMuYwo+IGJldHdlZW4gdGhlIGZsYWcgYml0cyBkZWZpbmVkIGluIHB5eGNf
bWV0aG9kcyBhbmQgdGhlIHBhcmFtZXRlcnMgcGFzc2VkCj4gdG8gdGhlIGNvcnJlc3BvbmRpbmcg
UHlPYmplY3QgZGVmaW5pdGlvbnMuCj4gCj4gV2l0aCB0aGlzIHBhdGNoIGFwcGxpZWQgcHlncnVi
IHdvcmtzIGFzIGV4cGVjdGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgWW91bmcgPG0u
YS55b3VuZ0BkdXJoYW0uYWMudWs+CgpJIGJyaWVmbHkgY2hlY2tlZCBQeXRob24ncyBkb2N1bWVu
dGF0aW9uLiBUaGlzIHBhdGNoIGxvb2tzIGNvcnJlY3RseSB0bwptZS4gRldJVzoKClJldmlld2Vk
LWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKSSB3aWxsIHdhaXQgZm9yIE1hcmVrJ3Mgb3Bpbmlv
bi4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
