Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 213BCE667
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 17:29:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL8B2-0006nl-7x; Mon, 29 Apr 2019 15:26:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MPM5=S7=citrix.com=prvs=015b46b47=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hL8B0-0006nd-QW
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 15:26:42 +0000
X-Inumbo-ID: 3051fcff-6a93-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3051fcff-6a93-11e9-843c-bc764e045a96;
 Mon, 29 Apr 2019 15:26:41 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,409,1549929600"; d="scan'208";a="84662000"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23751.6062.590245.436664@mariner.uk.xensource.com>
Date: Mon, 29 Apr 2019 16:26:38 +0100
To: Wei Liu <wei.liu2@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, 
 Olaf Hering <olaf@aepfle.de>, Juergen Gross <jgross@suse.com>, Jan Beulich
 <JBeulich@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: [Xen-devel] [PATCH STABLE] tools/firmware: update OVMF Makefile,
 when necessary
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gYWR2aWNlIGZyb20gV2VpLCBJIGFtIGFib3V0IHRvIHB1c2ggdGhpcyBzcXVhc2hlZCBiYWNr
cG9ydCB0byB0aGUKc3RhYmxlIHRyZWVzLiAgV2UgdGhpbmsgdGhpcyB3aWxsIGhlbHAgZml4IG9z
c3Rlc3Qgb24gdGhvc2UgYnJhbmNoZXMKZm9sbG93aW5nIHRoZSB1cGdyYWRlIHRvIERlYmlhbiBz
dHJldGNoLgoKSWFuLgoKRnJvbSBlOTgzZThhZTg0ZWZkNWU0MzA0NWEzZDIwYTgyMGYxM2NiNGE3
NWJmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRy
aXguY29tPgpEYXRlOiBXZWQsIDI4IE5vdiAyMDE4IDE3OjQzOjMzICswMDAwClN1YmplY3Q6IFtQ
QVRDSF0gdG9vbHMvZmlybXdhcmU6IHVwZGF0ZSBPVk1GIE1ha2VmaWxlLCB3aGVuIG5lY2Vzc2Fy
eQoKWyBUaGlzIGlzIHR3byBjb21taXRzIGZyb20gbWFzdGVyIGFrYSBzdGFnaW5nLTQuMTI6IF0K
Ck9WTUYgaGFzIGJlY29tZSBkZXBlbmRlbnQgb24gT3BlblNTTCwgd2hpY2ggaXMgaW5jbHVkZWQg
YXMgYQpzdWJtb2R1bGUuICBJbml0aWFsaXNlIHN1Ym1vZHVsZXMgYmVmb3JlIGJ1aWxkaW5nLgoK
U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6
IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgooY2hlcnJ5IHBpY2tl
ZCBmcm9tIGNvbW1pdCBiMTYyODE4NzBlMDZmNWY1MjYwMjlhNGU2OTYzNGExNmRjMzhlOGU0KQoK
dG9vbHM6IG9ubHkgY2FsbCBnaXQgd2hlbiBuZWNlc3NhcnkgaW4gT1ZNRiBNYWtlZmlsZQoKVXNl
cnMgbWF5IGNob29zZSB0byBleHBvcnQgYSBzbmFwc2hvdCBvZiBPVk1GIGFuZCBidWlsZCBpdAp3
aXRoIHhlbi5naXQgc3VwcGxpZWQgb3ZtZi1tYWtlZmlsZS4gSW4gdGhhdCBjYXNlIHdlIGRvbid0
Cm5lZWQgdG8gY2FsbCBgZ2l0IHN1Ym1vZHVsZWAuCgpGaXhlcyBiMTYyODE4NzBlLgoKUmVwb3J0
ZWQtYnk6IE9sYWYgSGVyaW5nIDxvbGFmQGFlcGZsZS5kZT4KU2lnbmVkLW9mZi1ieTogV2VpIExp
dSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRo
b255LnBlcmFyZEBjaXRyaXguY29tPgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+CihjaGVycnkgcGlja2VkIGZyb20gY29tbWl0IDY4MjkyYzk0YTYwZWFi
MjQ1MTRhYjRhOGU0NzcyYWYyNGRlYWQ4MDcpCi0tLQogdG9vbHMvZmlybXdhcmUvb3ZtZi1tYWtl
ZmlsZSB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEv
dG9vbHMvZmlybXdhcmUvb3ZtZi1tYWtlZmlsZSBiL3Rvb2xzL2Zpcm13YXJlL292bWYtbWFrZWZp
bGUKaW5kZXggMjgzODc0NDQ2MS4uNTVmOTk5MjE0NSAxMDA2NDQKLS0tIGEvdG9vbHMvZmlybXdh
cmUvb3ZtZi1tYWtlZmlsZQorKysgYi90b29scy9maXJtd2FyZS9vdm1mLW1ha2VmaWxlCkBAIC0x
Niw2ICsxNiw3IEBAIGFsbDogYnVpbGQKIAogLlBIT05ZOiBidWlsZAogYnVpbGQ6CisJaWYgdGVz
dCAtZSAuZ2l0IDsgdGhlbiAkKEdJVCkgc3VibW9kdWxlIHVwZGF0ZSAtLWluaXQgLS1yZWN1cnNp
dmUgOyBmaQogCU92bWZQa2cvYnVpbGQuc2ggLWEgWDY0IC1iICQoVEFSR0VUKSAtbiA0CiAJY3Ag
QnVpbGQvT3ZtZlg2NC8kKFRBUkdFVClfR0NDKi9GVi9PVk1GLmZkIG92bWYuYmluCiAKLS0gCjIu
MTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
