Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 850FE78CAA
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 15:21:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs5Yq-0004WA-4M; Mon, 29 Jul 2019 13:19:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZKY6=V2=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1hs5Yo-0004Vy-Ua
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 13:19:30 +0000
X-Inumbo-ID: 7e3b0d5c-b203-11e9-8980-bc764e045a96
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 7e3b0d5c-b203-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 13:19:30 +0000 (UTC)
From: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 29 Jul 2019 09:19:19 -0400
Message-ID: <6f94e7b0f1cfe98a640d7f9ff59f18f299fd0d7d.1564371527.git.stewart.hildebrand@dornerworks.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1564371527.git.stewart.hildebrand@dornerworks.com>
References: <cover.1564371527.git.stewart.hildebrand@dornerworks.com>
MIME-Version: 1.0
X-Originating-IP: [172.27.12.5]
X-ClientProxiedBy: Mcbain.dw.local (172.27.1.45) To Mcbain.dw.local
 (172.27.1.45)
X-spam-status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED, BAYES_00,
 MAILSHELL_SCORE_0_4
X-Spam-Flag: NO
Subject: [Xen-devel] [PATCH v2 1/2] ns16550: Add compatible string for
 Raspberry Pi 4
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGVyIHRoZSBCQ00yODM1IHBlcmlwaGVyYWxzIGRhdGFzaGVldCBbMV0gcGFnZSAxMDoKIlRoZSBV
QVJUIGNvcmUgaXMgYnVpbGQgdG8gZW11bGF0ZSAxNjU1MCBiZWhhdmlvdXIgLi4uIFRoZSBpbXBs
ZW1lbnRlZApVQVJUIGlzIG5vdCBhIDE2NjUwIGNvbXBhdGlibGUgVUFSVCBIb3dldmVyIGFzIGZh
ciBhcyBwb3NzaWJsZSB0aGUKZmlyc3QgOCBjb250cm9sIGFuZCBzdGF0dXMgcmVnaXN0ZXJzIGFy
ZSBsYWlkIG91dCBsaWtlIGEgMTY1NTAgVUFSVC4gQWwKMTY1NTAgcmVnaXN0ZXIgYml0cyB3aGlj
aCBhcmUgbm90IHN1cHBvcnRlZCBjYW4gYmUgd3JpdHRlbiBidXQgd2lsbCBiZQppZ25vcmVkIGFu
ZCByZWFkIGJhY2sgYXMgMC4gQWxsIGNvbnRyb2wgYml0cyBmb3Igc2ltcGxlIFVBUlQgcmVjZWl2
ZS8KdHJhbnNtaXQgb3BlcmF0aW9ucyBhcmUgYXZhaWxhYmxlLiIKCkFkZGl0aW9uYWxseSwgTGlu
dXggdXNlcyB0aGUgODI1MC8xNjU1MCBkcml2ZXIgZm9yIHRoZSBhdXggVUFSVCBbMl0uCgpVbmZv
cnR1bmF0ZWx5IHRoZSBicmNtLGJjbTI4MzUtYXV4LXVhcnQgZGV2aWNlIHRyZWUgYmluZGluZyBk
b2Vzbid0CmhhdmUgdGhlIHJlZy1zaGlmdCBhbmQgcmVnLWlvLXdpZHRoIHByb3BlcnRpZXMgWzNd
LiBUaHVzLCB0aGUgcmVnLXNoaWZ0CmFuZCByZWctaW8td2lkdGggcHJvcGVydGllcyBhcmUgaW5o
ZXJlbnQgcHJvcGVydGllcyBvZiB0aGlzIFVBUlQuCgpUaGFua3MgdG8gQW5kcmUgUHJ6eXdhcmEg
Zm9yIGNvbnRyaWJ1dGluZyB0aGUgcmVnLXNoaWZ0IGFuZApyZWctaW8td2lkdGggc2V0dGluZyBz
bmlwcGV0LgoKSW4gbXkgdGVzdGluZywgSSBoYXZlIHJlbGllZCBvbiBlbmFibGVfdWFydD0xIGJl
aW5nIHNldCBpbiBjb25maWcudHh0LAphIGNvbmZpZ3VyYXRpb24gZmlsZSByZWFkIGJ5IHRoZSBS
YXNwYmVycnkgUGkncyBmaXJtd2FyZS4gV2l0aAplbmFibGVfdWFydD0xLCB0aGUgZmlybXdhcmUg
cGVyZm9ybXMgVUFSVCBpbml0aWFsaXphdGlvbi4KClsxXSBodHRwczovL3d3dy5yYXNwYmVycnlw
aS5vcmcvZG9jdW1lbnRhdGlvbi9oYXJkd2FyZS9yYXNwYmVycnlwaS9iY20yODM1L0JDTTI4MzUt
QVJNLVBlcmlwaGVyYWxzLnBkZgpbMl0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LmdpdC90cmVlL2RyaXZlcnMvdHR5L3NlcmlhbC84
MjUwLzgyNTBfYmNtMjgzNWF1eC5jClszXSBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL2JyY20sYmNtMjgzNS1hdXgtdWFy
dC50eHQKClNpZ25lZC1vZmYtYnk6IFN0ZXdhcnQgSGlsZGVicmFuZCA8c3Rld2FydC5oaWxkZWJy
YW5kQGRvcm5lcndvcmtzLmNvbT4KLS0tCiB4ZW4vZHJpdmVycy9jaGFyL25zMTY1NTAuYyB8IDcg
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hl
bi9kcml2ZXJzL2NoYXIvbnMxNjU1MC5jIGIveGVuL2RyaXZlcnMvY2hhci9uczE2NTUwLmMKaW5k
ZXggZTUxOGYyZDc5MC4uODY2N2RlNmQ2NyAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvY2hhci9u
czE2NTUwLmMKKysrIGIveGVuL2RyaXZlcnMvY2hhci9uczE2NTUwLmMKQEAgLTE1ODUsNiArMTU4
NSwxMiBAQCBzdGF0aWMgaW50IF9faW5pdCBuczE2NTUwX3VhcnRfZHRfaW5pdChzdHJ1Y3QgZHRf
ZGV2aWNlX25vZGUgKmRldiwKICAgICBpZiAoIHVhcnQtPnJlZ193aWR0aCAhPSAxICYmIHVhcnQt
PnJlZ193aWR0aCAhPSA0ICkKICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CiAKKyAgICBpZiAoIGR0
X2RldmljZV9pc19jb21wYXRpYmxlKGRldiwgImJyY20sYmNtMjgzNS1hdXgtdWFydCIpICkKKyAg
ICB7CisgICAgICAgIHVhcnQtPnJlZ193aWR0aCA9IDQ7CisgICAgICAgIHVhcnQtPnJlZ19zaGlm
dCA9IDI7CisgICAgfQorCiAgICAgcmVzID0gcGxhdGZvcm1fZ2V0X2lycShkZXYsIDApOwogICAg
IGlmICggISByZXMgKQogICAgICAgICByZXR1cm4gLUVJTlZBTDsKQEAgLTE2MTEsNiArMTYxNyw3
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHRfZGV2aWNlX21hdGNoIG5zMTY1NTBfZHRfbWF0Y2hb
XSBfX2luaXRjb25zdCA9CiAgICAgRFRfTUFUQ0hfQ09NUEFUSUJMRSgibnMxNjU1MCIpLAogICAg
IERUX01BVENIX0NPTVBBVElCTEUoIm5zMTY1NTBhIiksCiAgICAgRFRfTUFUQ0hfQ09NUEFUSUJM
RSgic25wcyxkdy1hcGItdWFydCIpLAorICAgIERUX01BVENIX0NPTVBBVElCTEUoImJyY20sYmNt
MjgzNS1hdXgtdWFydCIpLAogICAgIHsgLyogc2VudGluZWwgKi8gfSwKIH07CiAKLS0gCjIuMjIu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
