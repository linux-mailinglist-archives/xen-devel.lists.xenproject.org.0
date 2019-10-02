Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7758C456F
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 03:21:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFTHk-0005Bk-0Q; Wed, 02 Oct 2019 01:18:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7bij=X3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iFTHi-0005BY-Eg
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 01:18:30 +0000
X-Inumbo-ID: 8aa154a2-e4b2-11e9-970b-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id 8aa154a2-e4b2-11e9-970b-12813bfff9fa;
 Wed, 02 Oct 2019 01:18:29 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D69E820818;
 Wed,  2 Oct 2019 01:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569979109;
 bh=13ItRQqEtrZNpcsvWsCT2MW15HyRD27afWaDNBWCWEQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=orfl3UskiFMeht4xpB92E3YsK/dS/d0sI6KVMAyf3EL4CyjgcQFK8YCs9Lhzay1uE
 /MAeV3DXo6yQpfWLC1lQpbhLc0+qvHtY83zUaea+aHOGXT0P7Dd4m8EbKanwrKHv8c
 F8wcDrVHmKBXVpPntmpvapjeyWnXmiIdHEtKafqc=
Date: Tue, 1 Oct 2019 18:18:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190815173533.26310-1-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1910011818230.26319@sstabellini-ThinkPad-T480s>
References: <20190815173533.26310-1-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/arm: domain_build: Print the correct
 domain in construct_domain()
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAxNSBBdWcgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IGNvbnN0cnVjdF9kb21h
aW4oKSBjYW4gYmUgY2FsbGVkIGJ5IG90aGVyIGRvbWFpbiB0aGFuIGRvbTAuIFRvIGF2b2lkCj4g
Y29uZnVzaW9uIGluIHRoZSBsb2csIHByaW50IHRoZSBjb3JyZWN0IGRvbWFpbi4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKUmV2aWV3ZWQt
Ynk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCj4gLS0tCj4g
IHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS9kb21haW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+IGluZGV4IDMz
MTcxMDgxZWEuLmNmOWZmYmMzNjAgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9i
dWlsZC5jCj4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gQEAgLTE5NzgsNyAr
MTk3OCw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGNvbnN0cnVjdF9kb21haW4oc3RydWN0IGRvbWFp
biAqZCwgc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbykKPiAgICAgICAgICBjcHUgPSBjcHVtYXNr
X2N5Y2xlKGNwdSwgJmNwdV9vbmxpbmVfbWFwKTsKPiAgICAgICAgICBpZiAoIHZjcHVfY3JlYXRl
KGQsIGksIGNwdSkgPT0gTlVMTCApCj4gICAgICAgICAgewo+IC0gICAgICAgICAgICBwcmludGso
IkZhaWxlZCB0byBhbGxvY2F0ZSBkb20wIHZjcHUgJWQgb24gcGNwdSAlZFxuIiwgaSwgY3B1KTsK
PiArICAgICAgICAgICAgcHJpbnRrKCJGYWlsZWQgdG8gYWxsb2NhdGUgJXBkIHZjcHUgJWQgb24g
cGNwdSAlZFxuIiwgZCwgaSwgY3B1KTsKPiAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICAg
fQo+ICAKPiAtLSAKPiAyLjExLjAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
