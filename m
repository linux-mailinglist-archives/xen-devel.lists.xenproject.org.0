Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E76E6132B4
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 19:02:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMbXk-00086f-6J; Fri, 03 May 2019 17:00:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lZ0l=TD=citrix.com=prvs=019b86d19=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hMbXi-00085G-NS
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 17:00:14 +0000
X-Inumbo-ID: ea6974d6-6dc4-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ea6974d6-6dc4-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 17:00:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,426,1549929600"; d="scan'208";a="85085358"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 3 May 2019 17:59:46 +0100
Message-ID: <20190503165957.5960-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 00/11] mg-repro-flight: Provide
 --rebuild to make variant build jobs too
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXQgaXMgYW5ub3lpbmcgdGhhdCBtZy1yZXByby1mbGlnaHQgY2Fubm90IHJ1biBhIGJ1aWxkIGZv
ciB5b3UgdG9vLgpGaXggdGhpcy4KClRoaXMgaXMgb24geGVuYml0cyBpbgogIGh0dHBzOi8veGVu
Yml0cy54ZW4ub3JnL2dpdC1odHRwL3Blb3BsZS9pd2ovb3NzdGVzdC5naXQKICB4ZW5iaXRzLnhl
bi5vcmc6L2hvbWUvaXdqL2V4dC9vc3N0ZXN0LmdpdApldGMuIGFzIHRoZSBicmFuY2gKICB3aXAu
cmVwcm8tZmxpZ2h0LWJ1aWxkcy52MgoKVGhpcyB2ZXJzaW9uIHNlZW1zIHRvIGFjdHVhbGx5IHdv
cmsuCgpJYW4gSmFja3NvbiAoMTEpOgogIG1nLWV4ZWN1dGUtZmxpZ2h0OiBTYXZlIGFuIG1ybyBp
biB0bXAvCiAgY3MtYWRqdXN0LWZsaWdodDogQnJlYWsgb3V0IGNvcHlfam9ic18qCiAgY3MtYWRq
dXN0LWZsaWdodDogVXNlIGRiX3ByZXBhcmUgYW5kIGhvbm91ciAtRCAtRCBmb3Igc3FsIGR1bXBz
CiAgbWctcmVwcm8tc2V0dXA6IEltcHJvdmUgYSBkb2MgbWVzc2FnZSBzbGlnaHRseQogIG1nLXJl
cHJvLXNldHVwOiBCcmVhayBvdXQgY29tcHV0ZV9hZGp1c3RzCiAgbWctcmVwcm8tc2V0dXA6IE1v
dmUgbG9nZ2luZyBzZXR1cCB0byBsYXRlcgogIG1nLXJlcHJvLXNldHVwOiBBbGxvdyBhcmd1bWVu
dHMgdG8gYmFkdXNhZ2UKICBtZy1yZXByby1zZXR1cDogTW92ZSBmbGlnaHQgY3JlYXRpb24gdXAg
YmVmb3JlIHRhc2sgY3JlYXRpb24KICBtZy1yZXByby1mbGlnaHQ6IFByb3ZpZGUgLS1yZWJ1aWxk
IHRvIG1ha2UgdmFyaWFudCBidWlsZCBqb2JzIHRvbwogIG1nLXJlcHJvLXNldHVwOiBEZXRlY3Qg
b3B0aW9ucyAoLS4uLikgaW4gd3JvbmcgcGxhY2UKICBtZy1hbGxvY2F0ZTogRG9uJ3QgdHJ5IGFs
bG9jYXRpbmcgdGhlIHNhbWUgcmVzb3VyY2UgZm9yIHR3byBzcGVjcwoKIGNzLWFkanVzdC1mbGln
aHQgIHwgMTQ5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tLQogbWctYWxsb2NhdGUgICAgICAgfCAgMTAgKysrKwogbWctZXhlY3V0ZS1mbGlnaHQg
fCAgIDEgKwogbWctcmVwcm8tc2V0dXAgICAgfCAxMjcgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLQogNCBmaWxlcyBjaGFuZ2VkLCAyNTMgaW5zZXJ0aW9ucygr
KSwgMzQgZGVsZXRpb25zKC0pCgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
