Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED2983078
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 13:18:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huxRA-00040r-Br; Tue, 06 Aug 2019 11:15:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NkML=WC=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1huxR9-00040m-0G
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 11:15:27 +0000
X-Inumbo-ID: 7ab12d0e-b83b-11e9-b676-5b8d563bf0e2
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ab12d0e-b83b-11e9-b676-5b8d563bf0e2;
 Tue, 06 Aug 2019 11:15:22 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: iT9FtYwPh74SA7TaHBenzK9LyDIhAYa6sRrtFGQArOgKdrX9xBO8fZLi1W7EFCXRQ0Zvltl5V6
 g9QpoFilqstY9tOLBV43JB7TKd5otz3SOo+LrX8JepiVJqMzzuq8MehxfxXKNphRqD9qSr4OOA
 yB01IUbKQ6VBEJAdqhYUfo3Ax95FxQ/mGVUMHhQhgFmCJExgUUeS9T2QgjvgdI6Cg20l7W0iuz
 AcdqoILBqkQZOu/dLohqjRIUqz4xzDrL7SlYPPlHLDxeveYc+bOTIQQ8hNgRLVkg7eiIJCOpHW
 WBk=
X-SBRS: 2.7
X-MesageID: 4063744
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,353,1559534400"; 
   d="scan'208";a="4063744"
Date: Tue, 6 Aug 2019 12:15:18 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190806111518.GM1242@perard.uk.xensource.com>
References: <20190805144910.20223-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190805144910.20223-1-andrew.cooper3@citrix.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH] tools/xl: Make extra= usable in combination
 with cmdline=
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBBdWcgMDUsIDIwMTkgYXQgMDM6NDk6MTBQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBjL3MgOTg2YWVhN2ZiZSAieGwuY2ZnOiBhZGQgJ2NtZGxpbmUnIGluIGNvbmZpZyBm
aWxlIiBpbnRyb2R1Y2VkIGNtZGxpbmU9IGFuZAo+IG1ha2UgZXh0cmE9IGFuZCByb290PSB1bnVz
YWJsZSBpZiBjbWRsaW5lPSB3YXMgcHJlc2VudC4KPiAKPiBGb3IgdGhlIHZtLmNmZyBmaWxlIGl0
c2VsZiwgdGhpcyBtYWtlcyBzZW5zZS4gIEhvd2V2ZXIsIGZvciBkZXZlbG9wbWVudAo+IHB1cnBv
c2VzIGl0IGlzIHZlcnkgY29udmVuaWVudCB0byBoYXZlIGEgY21kbGluZT0gaW4gdGhlIGNmZyBm
aWxlLCBhbmQgc3BlY2lmeQo+IGV4dHJhPSBvbiB0aGUgYHhsIGNyZWF0ZWAgY29tbWFuZCBsaW5l
Lgo+IAo+IFdoaWxlIHVwZGF0aW5nIHRoZSBtYW5wYWdlLCBjb3JyZWN0IHRoZSBlbnRyeSBmb3Ig
Y21kbGluZT0uICBUaGVyZSBpcyBuZXZlcgo+IGFueSBhcHBlbmRpbmcgd2hpY2ggZ29lcyBvbiB3
aXRoIHRoaXMgb3B0aW9uLCBidXQgYWZ0ZXIgdGhpcyBjaGFuZ2UgZXh0cmE9IG1heQo+IGJlIGFw
cGVuZGVkIHRvIGNtZGxpbmU9Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gLS0tCj4gQ0M6IElhbiBKYWNrc29uIDxJYW4uSmFj
a3NvbkBjaXRyaXguY29tPgo+IENDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+IENDOiBBbnRob255
IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiAKPiBJbiBwYXJ0aWN1bGFyLCB0
aGlzIGlzIHVzZWZ1bCBmb3IgdGVzdGluZyBYZW4gYXMgYSBQVkggZ3Vlc3QsIHdoZXJlIHN3aXRj
aGluZwo+IGJldHdlZW4gYSBQViBhbmQgUFZIIGRvbTAgaW52b2x2ZXMgYWRkaW5nICJkb20wPXB2
aCBkb20wLWlvbW11PW5vbmUiIHRvCj4gY29tbWFuZCBsaW5lLiAgTm93LCBnaXZlbiBhIHNpbmds
ZSBidWlsZCBvZiBYZW4gdW5kZXIgdGVzdCwgdHdvIHRlc3RzIGNhbiBiZQo+IHJ1biB3aXRoIGp1
c3QKPiAKPiAgIyB4bCBjcmVhdGUgc2hpbS5jZmcgcmFtZGlzaz1cInRlc3QtcHY2NC1leGFtcGxl
XCIKPiAKPiBhbmQKPiAKPiAgIyB4bCBjcmVhdGUgc2hpbS5jZmcgcmFtZGlzaz1cInRlc3QtaHZt
NjQtZXhhbXBsZVwiIGV4dHJhPVwiZG9tMD1wdmhcIGRvbTAtaW9tbXU9bm9uZVwiCj4gCj4gd2l0
aG91dCBuZWVkaW5nIHRvIGVkaXQgc2hpbS5jZmcgaW5iZXR3ZWVuLgoKOigsIHRoaXMgZmVlbHMg
bGlrZSB0aGUgd3JvbmcgYXBwcm9hY2guIEl0IGlzIHRpbWUgdG8gaW52ZW50ICs9ID8gU28gd2UK
Y2FuIGRvIGNtZGxpbmUrPSJ4IiwgZGlzays9Wyd4dmR6J10sIC4uLiA6LSkuCgpUaGUgYGNtZGxp
bmUnIG9wdGlvbiBoYXZlIGJlZW4gdGhlcmUgZm9yIHNvbWV0aW1lLCBzbyBob3BlZnVsbHkgbm8g
b25lCmhhcyBib3RoIGBjbWRsaW5lJyBhbmQgYGV4dHJhJyBpbiB0aGVyZSBjb25maWcgZmlsZSBh
bmQgY2hhbmdpbmcgdGhlCm1lYW5pbmcgb2YgZXh0cmEgd291bGQgYmUgb2suCgpXaXRoIHRoYXQg
aW4gbWluZCwgdGhlIHBhdGNoIGxvb2tzIGZpbmUsClJldmlld2VkLWJ5OiBBbnRob255IFBFUkFS
RCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KClRoYW5rcywKCi0tIApBbnRob255IFBFUkFS
RAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
