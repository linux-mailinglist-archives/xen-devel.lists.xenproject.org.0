Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA821CA30
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 16:24:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQYKL-0008Ef-5w; Tue, 14 May 2019 14:22:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pH1X=TO=citrix.com=prvs=030624cdf=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQYKJ-0008EB-Rx
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 14:22:43 +0000
X-Inumbo-ID: bba7347c-7653-11e9-b40d-4bf533273b7d
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bba7347c-7653-11e9-b40d-4bf533273b7d;
 Tue, 14 May 2019 14:22:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,469,1549929600"; d="scan'208";a="85442579"
From: Wei Liu <wei.liu2@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 14 May 2019 15:22:32 +0100
Message-ID: <20190514142233.23165-3-wei.liu2@citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190514142233.23165-1-wei.liu2@citrix.com>
References: <20190514142233.23165-1-wei.liu2@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 2/3] README: document requirement about python
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UHJvdmlkZSBpbmZvcm1hdGlvbiBvbiB3aGF0IGlzIGV4cGVjdGVkIGZyb20gdGhlIGJ1aWxkIHN5
c3RlbQpyZWdhcmRpbmcgcHl0aG9uLgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJA
Y2l0cml4LmNvbT4KLS0tCiBSRUFETUUgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9SRUFETUUgYi9SRUFETUUKaW5kZXggMjNlNGY3YzNk
Yy4uMjZkNDRjZjdjMSAxMDA2NDQKLS0tIGEvUkVBRE1FCisrKyBiL1JFQURNRQpAQCAtMTgxLDYg
KzE4MSwxMyBAQCBWYXJpb3VzIHRvb2xzLCBzdWNoIGFzIHB5Z3J1YiwgaGF2ZSB0aGUgZm9sbG93
aW5nIHJ1bnRpbWUgZGVwZW5kZW5jaWVzOgogICAgICAgICAgIFVSTDogICAgaHR0cDovL3d3dy5w
eXRob24ub3JnLwogICAgICAgICAgIERlYmlhbjogcHl0aG9uCiAKK05vdGUgdGhhdCB0aGUgYnVp
bGQgc3lzdGVtIGV4cGVjdHMgYHB5dGhvbmAgdG8gYmUgYXZhaWxhYmxlLiBJZiB5b3VyIHN5c3Rl
bQorb25seSBoYXMgYHB5dGhvbjJgIG9yIGBweXRob24zYCBidXQgbm90IGBweXRob25gIChhcyBp
biBMaW51eCBGcm9tIFNjcmF0Y2gpLAoreW91IHdpbGwgbmVlZCB0byBjcmVhdGUgYSBzeW1saW5r
IGZvciBpdCwgb3Igc3BlY2lmeSBQWVRIT049IHdoZW4gaW52b2tpbmcKK21ha2UsIGxpa2UgKG5v
dGUgdGhlIHBvc2l0aW9uIG9mIFBZVEhPTj0gbWF0dGVycyk6CisKKyAgICAjIG1ha2UgUFlUSE9O
PS91c3IvYmluL3B5dGhvbjMKKwogSW50ZWwoUikgVHJ1c3RlZCBFeGVjdXRpb24gVGVjaG5vbG9n
eSBTdXBwb3J0CiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0K
IAotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
