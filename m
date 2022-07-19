Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AF057937C
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 08:51:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370381.602116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDh4J-0006u0-OO; Tue, 19 Jul 2022 06:50:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370381.602116; Tue, 19 Jul 2022 06:50:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDh4J-0006qf-KX; Tue, 19 Jul 2022 06:50:55 +0000
Received: by outflank-mailman (input) for mailman id 370381;
 Tue, 19 Jul 2022 06:50:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+lzD=XY=protonmail.com=dylangerdaly@srs-se1.protection.inumbo.net>)
 id 1oDh4I-0006jP-Jq
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 06:50:54 +0000
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22062b02-072f-11ed-924f-1f966e50362f;
 Tue, 19 Jul 2022 08:50:53 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 22062b02-072f-11ed-924f-1f966e50362f
Date: Tue, 19 Jul 2022 06:50:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1658213452; x=1658472652;
	bh=1mYqLP9gcfIBDY/3boXfROv+9pF8JFO0SeAOG3evp5c=;
	h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
	 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
	 Feedback-ID:Message-ID;
	b=JTd4nxKmZ3Qe7WDImDKjMa3NBn9eSAxuDi530YohJNSvyF72cYYYNuzNPrVi3x48/
	 OUfsC0U0sj5NhpCy6aUk3v4v41+amlEo0pJovFkxEzlgOJwOeZZlbFSOWX6U/NrsMn
	 VA9KkfPH7+7KG1QFo1l+hRPgpcI7FVyadS2gxHjixsITMkW+EQw8K1ij4royZsC3Jj
	 6D03gYOxqt8OB0sT+IHccVQStto0SrQkOzMaT+T9HxfYcuHswP4oN6qD/t9JozeYK1
	 36GYhCGhcQiElk1qWAWDrYqifpGe9nzrk0e2rtK0RdapJBKzMZD3jgSKX85wrptK/Q
	 +WUXwQ33RhalA==
To: jbeulich@suse.com
From: Dylanger Daly <dylangerdaly@protonmail.com>
Cc: xen-devel@lists.xenproject.org
Reply-To: Dylanger Daly <dylangerdaly@protonmail.com>
Subject: Re: Ryzen 6000 (Mobile)
Message-ID: <TsSc4zUyKEOr82i1ryy4UtzTDfiSGV3kDdliTsGh1iNH38UoZGXh-TRWKFnMnZJGA27ECv4jhQfGtOaWoau3pj1z3uKCTYKRETtD9tBgZU8=@protonmail.com>
In-Reply-To: <7c369f0f-f602-8699-6ec6-9fb05b603825@suse.com>
References: <wMV4okoInWxTqAaH6sxUug6my9BOlkurOWuCUILGFxoYe96U_-Z-KPjDdacRmuIksOMX-chaAN0lnGj5XevfNJKw6fIVhsSIqBCxGHweK-Q=@protonmail.com> <7c369f0f-f602-8699-6ec6-9fb05b603825@suse.com>
Feedback-ID: 21854323:user:proton
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1_bUDd7NXX4Knct0MgU8RjjeKX8WhXFarvouZOJcFXUQ"

This is a multi-part message in MIME format.

--b1_bUDd7NXX4Knct0MgU8RjjeKX8WhXFarvouZOJcFXUQ
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

RG9tMCAoYmVpbmcgYSBWTSBpdHNlbGYpIGJvb3RzIGp1c3QgcGVyZmVjdGx5LCBpdCdzIGFueSBv
dGhlciBkb21VIHRoYXQgdHJpZ2dlcnMgdGhlIGlzc3VlLCBJJ20gaG9waW5nIEkgY2FuIHNvbWVo
b3cgaG9vayB1cCBnZGIgb3Igc29tZXRoaW5nIHRvIFhlbiBzb21laG93CgotLS0tLS0tLSBPcmln
aW5hbCBNZXNzYWdlIC0tLS0tLS0tCk9uIEp1bCAxOSwgMjAyMiwgNDoyOSBQTSwgSmFuIEJldWxp
Y2ggd3JvdGU6Cgo+IE9uIDE5LjA3LjIwMjIgMDE6MDQsIER5bGFuZ2VyIERhbHkgd3JvdGU6ID4g
SSdtIGhhdmluZyBpc3N1ZXMgZ2V0dGluZyBRdWJlc09TIHJ1bm5pbmcgb24gbXkgTGVub3ZvIFlv
Z2EgU2xpbSA3IFByb1ggKEFNRCBSeXplbiA2ODAwSFMpID4gPiBGaXJzdGx5IGluIG9yZGVyIHRv
IGJvb3QgdGhlIGRldmljZSBhdCBhbGwsIEknbSByZXF1aXJlZCB0byBhZGQgYGRvbTBfbWF4X3Zj
cHVzPTEgZG9tMF92Y3B1c19waW5gIHRvIGRvbTAncyBDTURMSU5FLCB0aGlzIGlzIHNpbWlsYXIg
dG8gd2hhdCBJIGhhZCB0byBkbyBwcmV2aW91c2x5IC0gaHR0cHM6Ly94ZW4ubWFya21haWwub3Jn
L3NlYXJjaC8/cT1SeXplbiNxdWVyeTpSeXplbitwYWdlOjErbWlkOmYzaGVsNHlqMjVxaWxhYnYr
c3RhdGU6cmVzdWx0cyB3aXRoIHRoZSBSeXplbiA0MDAwIHNlcmllcywgaG93ZXZlciB3aXRob3V0
IHRoZXNlIG9wdGlvbnMgYWRkZWQgZG9tMCBuZXZlciBmdWxseSBib290cyBpbnRvIEZlZG9yYS4g
PiA+IFRoZSBvdGhlciBpbnRlcmVzdGluZyBpc3N1ZSBJJ20gaGF2aW5nIGlzIHVwb24gYm9vdGlu
ZyBhbnkgVk0sIGp1c3QgYSBub3JtYWwgc2ltcGxlIFZNIHdpdGhvdXQgYW55IFBDSSBkZXZpY2Vz
IGF0dGFjaGVkLCBpdCdsbCBzdWNjZXNzZnVsbHkgc3RhcnQsIGFib3V0IDEgc2Vjb25kIHdpbGwg
cGFzcyB0aGVuIHRoZSBlbnRpcmUgZGV2aWNlIHdpbGwgaGFuZyBhbmQgcmVzZXQsIGl0J3Mgdmly
dHVhbGx5IGltcG9zc2libGUgdG8gZ2V0IGFueSBsb2dzIGF0IGFsbCBvdXQgb2YgdGhlIGRldmlj
ZSB3aGVuIGl0J3MgaW4gdGhpcyBzdGF0ZS4gPiA+IEZZSTogUXViZXNPUyB1c2VzIFhlbiA0LjE0
IEkgZ3Vlc3MgeW91IHVuZGVyc3RhbmQgdGhhdCB3aXRoIG5vIGxvZ3Mgb3IgYW55dGhpbmcgZWxz
ZSB0ZWNobmljYWwgdGhlcmUncyB2ZXJ5IGxpdHRsZSBjaGFuY2UgYW55b25lIGlzIGdvaW5nIHRv
IGJlIGFibGUgdG8gZG8gYW55dGhpbmcgYWJvdXQgdGhpcywgd2l0aG91dCBoYXZpbmcgYWNjZXNz
IHRvIGFuIGFmZmVjdGVkIHN5c3RlbT8gSmFu

--b1_bUDd7NXX4Knct0MgU8RjjeKX8WhXFarvouZOJcFXUQ
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

RG9tMCAoYmVpbmcgYSBWTSBpdHNlbGYpIGJvb3RzIGp1c3QgcGVyZmVjdGx5LCBpdCYjMzk7cyBh
bnkgb3RoZXIgZG9tVSB0aGF0IHRyaWdnZXJzIHRoZSBpc3N1ZSwgSSYjMzk7bSBob3BpbmcgSSBj
YW4gc29tZWhvdyBob29rIHVwIGdkYiBvciBzb21ldGhpbmcgdG8gWGVuIHNvbWVob3c8YnI+PGJy
Pjxicj48YnI+LS0tLS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLS0tLTxicj5PbiBKdWwgMTks
IDIwMjIsIDQ6MjkgUE0sIEphbiBCZXVsaWNoIDwgamJldWxpY2hAc3VzZS5jb20+IHdyb3RlOjxi
bG9ja3F1b3RlIGNsYXNzPSJwcm90b25tYWlsX3F1b3RlIj48YnI+T24gMTkuMDcuMjAyMiAwMTow
NCwgRHlsYW5nZXIgRGFseSB3cm90ZToNCj4gSSdtIGhhdmluZyBpc3N1ZXMgZ2V0dGluZyBRdWJl
c09TIHJ1bm5pbmcgb24gbXkgTGVub3ZvIFlvZ2EgU2xpbSA3IFByb1ggKEFNRCBSeXplbiA2ODAw
SFMpDQo+DQo+IEZpcnN0bHkgaW4gb3JkZXIgdG8gYm9vdCB0aGUgZGV2aWNlIGF0IGFsbCwgSSdt
IHJlcXVpcmVkIHRvIGFkZCBgZG9tMF9tYXhfdmNwdXM9MSBkb20wX3ZjcHVzX3BpbmAgdG8gZG9t
MCdzIENNRExJTkUsIHRoaXMgaXMgc2ltaWxhciB0byB3aGF0IEkgaGFkIHRvIGRvIHByZXZpb3Vz
bHkgLSBodHRwczovL3hlbi5tYXJrbWFpbC5vcmcvc2VhcmNoLz9xPVJ5emVuI3F1ZXJ5OlJ5emVu
K3BhZ2U6MSttaWQ6ZjNoZWw0eWoyNXFpbGFiditzdGF0ZTpyZXN1bHRzIHdpdGggdGhlIFJ5emVu
IDQwMDAgc2VyaWVzLCBob3dldmVyIHdpdGhvdXQgdGhlc2Ugb3B0aW9ucyBhZGRlZCBkb20wIG5l
dmVyIGZ1bGx5IGJvb3RzIGludG8gRmVkb3JhLg0KPg0KPiBUaGUgb3RoZXIgaW50ZXJlc3Rpbmcg
aXNzdWUgSSdtIGhhdmluZyBpcyB1cG9uIGJvb3RpbmcgYW55IFZNLCBqdXN0IGEgbm9ybWFsIHNp
bXBsZSBWTSB3aXRob3V0IGFueSBQQ0kgZGV2aWNlcyBhdHRhY2hlZCwgaXQnbGwgc3VjY2Vzc2Z1
bGx5IHN0YXJ0LCBhYm91dCAxIHNlY29uZCB3aWxsIHBhc3MgdGhlbiB0aGUgZW50aXJlIGRldmlj
ZSB3aWxsIGhhbmcgYW5kIHJlc2V0LCBpdCdzIHZpcnR1YWxseSBpbXBvc3NpYmxlIHRvIGdldCBh
bnkgbG9ncyBhdCBhbGwgb3V0IG9mIHRoZSBkZXZpY2Ugd2hlbiBpdCdzIGluIHRoaXMgc3RhdGUu
DQo+DQo+IEZZSTogUXViZXNPUyB1c2VzIFhlbiA0LjE0DQoNCkkgZ3Vlc3MgeW91IHVuZGVyc3Rh
bmQgdGhhdCB3aXRoIG5vIGxvZ3Mgb3IgYW55dGhpbmcgZWxzZSB0ZWNobmljYWwNCnRoZXJlJ3Mg
dmVyeSBsaXR0bGUgY2hhbmNlIGFueW9uZSBpcyBnb2luZyB0byBiZSBhYmxlIHRvIGRvIGFueXRo
aW5nDQphYm91dCB0aGlzLCB3aXRob3V0IGhhdmluZyBhY2Nlc3MgdG8gYW4gYWZmZWN0ZWQgc3lz
dGVtPw0KDQpKYW4NCjwvZGl2Pg==


--b1_bUDd7NXX4Knct0MgU8RjjeKX8WhXFarvouZOJcFXUQ--


