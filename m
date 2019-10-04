Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C5ECB311
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 03:35:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGCRl-0005h6-TO; Fri, 04 Oct 2019 01:31:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Z5s=X5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iGCRk-0005h1-0b
 for xen-devel@lists.xen.org; Fri, 04 Oct 2019 01:31:52 +0000
X-Inumbo-ID: bd739cd8-e646-11e9-973b-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bd739cd8-e646-11e9-973b-12813bfff9fa;
 Fri, 04 Oct 2019 01:31:51 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 93A942086A;
 Fri,  4 Oct 2019 01:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570152710;
 bh=7cRVmHgamB61DUE36xp6qNTjNFeZEvpxjZXPdPKPhIk=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=RsO3urTyvCZpFANRAn/HRxp6/75aQwgvVVsIIET2dkbXsKSue1fpcW9ZCJV1Zt2Qi
 7hM+OGTMSGTNT9BbWTJo68QkHRUbOSDYviQdVgCU0AC3vpI6LlaikaTKXGz2e1Q29l
 rxraqpD5IGZMOe7AJFJjQPCh6zrNE4ItlbAKlVx0=
Date: Thu, 3 Oct 2019 18:31:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: jgross@suse.com
In-Reply-To: <alpine.DEB.2.21.1910031812380.30844@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.1910031831040.30844@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1910031812380.30844@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v9 0/8] dom0less device assignment
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
Cc: sstabellini@kernel.org, andrii_anisov@epam.com, Achin.Gupta@arm.com,
 xen-devel@lists.xen.org, julien.grall@arm.com, Volodymyr_Babchuk@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SSBhY3R1YWxseSBhZGRpbmcgSnVlcmdlbi4KCk9uIFRodSwgMyBPY3QgMjAxOSwgU3RlZmFubyBT
dGFiZWxsaW5pIHdyb3RlOgo+IEhpIGFsbCwKPiAKPiBUaGlzIHNtYWxsIHBhdGNoIHNlcmllcyBh
ZGRzIGRldmljZSBhc3NpZ25tZW50IHN1cHBvcnQgdG8gRG9tMGxlc3MuCj4gVGhlIGxhc3QgcGF0
Y2ggaXMgdGhlIGRvY3VtZW50YXRpb24uCj4gCj4gQ2hlZXJzLAo+IAo+IFN0ZWZhbm8KPiAKPiAK
PiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDdhNGU2NzExMTE0OTA1YjNjYmJl
NDhlODFjMzIyMjM2MWE3ZjM1Nzk6Cj4gCj4gICB4ZW4vc2NoZWQ6IG1vdmUgc3RydWN0IHRhc2tf
c2xpY2UgaW50byBzdHJ1Y3Qgc2NoZWRfdW5pdCAoMjAxOS0wOS0yNyAxNjowMzozMSArMDIwMCkK
PiAKPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPiAKPiAgIGh0dHA6
Ly94ZW5iaXRzLnhlbnByb2plY3Qub3JnL2dpdC1odHRwL3Blb3BsZS9zc3RhYmVsbGluaS94ZW4t
dW5zdGFibGUuZ2l0IGRvbTBsZXNzLXB0LXY5Cj4gCj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2Vz
IHVwIHRvIDc2NjBmMDNjYThkZGNmZGUzMjU4NjRlZDBiYmY4MGY4ZTBjMjBlNmM6Cj4gCj4gICB4
ZW4vYXJtOiBhZGQgZG9tMC1sZXNzIGRldmljZSBhc3NpZ25tZW50IGluZm8gdG8gZG9jcyAoMjAx
OS0xMC0wMyAxMDozNTo0MSAtMDcwMCkKPiAKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gU3RlZmFubyBTdGFiZWxsaW5p
ICg4KToKPiAgICAgICB4ZW4vYXJtOiBpbnRyb2R1Y2UgaGFuZGxlX2RldmljZV9pbnRlcnJ1cHRz
Cj4gICAgICAgeGVuL2FybTogZXhwb3J0IGRldmljZV90cmVlX2dldF9yZWcgYW5kIGRldmljZV90
cmVlX2dldF91MzIKPiAgICAgICB4ZW4vYXJtOiBpbnRyb2R1Y2Uga2luZm8tPnBoYW5kbGVfZ2lj
Cj4gICAgICAgeGVuL2FybTogY29weSBkdGIgZnJhZ21lbnQgdG8gZ3Vlc3QgZHRiCj4gICAgICAg
eGVuL2FybTogYXNzaWduIGRldmljZXMgdG8gYm9vdCBkb21haW5zCj4gICAgICAgeGVuL2FybTog
aGFuZGxlICJtdWx0aWJvb3QsZGV2aWNlLXRyZWUiIGNvbXBhdGlibGUgbm9kZXMKPiAgICAgICB4
ZW4vYXJtOiBpbnRyb2R1Y2UgbnJfc3Bpcwo+ICAgICAgIHhlbi9hcm06IGFkZCBkb20wLWxlc3Mg
ZGV2aWNlIGFzc2lnbm1lbnQgaW5mbyB0byBkb2NzCj4gCj4gIGRvY3MvbWlzYy9hcm0vZGV2aWNl
LXRyZWUvYm9vdGluZy50eHQgfCAgNDQgKysrLQo+ICBkb2NzL21pc2MvYXJtL3Bhc3N0aHJvdWdo
LnR4dCAgICAgICAgIHwgMTA2ICsrKysrKysrCj4gIHhlbi9hcmNoL2FybS9ib290ZmR0LmMgICAg
ICAgICAgICAgICAgfCAgMTAgKy0KPiAgeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jICAgICAg
ICAgICB8IDQ1OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tCj4gIHhlbi9hcmNo
L2FybS9rZXJuZWwuYyAgICAgICAgICAgICAgICAgfCAgMTQgKy0KPiAgeGVuL2FyY2gvYXJtL3Nl
dHVwLmMgICAgICAgICAgICAgICAgICB8ICAgMSArCj4gIHhlbi9pbmNsdWRlL2FzbS1hcm0va2Vy
bmVsLmggICAgICAgICAgfCAgIDUgKy0KPiAgeGVuL2luY2x1ZGUvYXNtLWFybS9zZXR1cC5oICAg
ICAgICAgICB8ICAgNyArCj4gIDggZmlsZXMgY2hhbmdlZCwgNTc5IGluc2VydGlvbnMoKyksIDY3
IGRlbGV0aW9ucygtKQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
