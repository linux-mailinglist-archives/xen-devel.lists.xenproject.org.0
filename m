Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCA37FDFB
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 18:01:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htZwi-00069j-29; Fri, 02 Aug 2019 15:58:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qji5=V6=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1htZwf-00066R-S7
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 15:58:17 +0000
X-Inumbo-ID: 572c8184-b53e-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 572c8184-b53e-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 15:58:16 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KcSqSv4Os+NxNdOYh7DX71CxqjoRi3jm93ESonRPUeV9BX9W3zBOGDytULFHSD+LRt17dwfQST
 ku8IMZi8JCAWmIEzDoJuZJ/qdrZObaGQLNK/MHbHErQflcSwCHigBf5o7Ch2PdKMB9onICTaqk
 /82xZp2ay24N66SRYAiAkz8UltmotoBTJpXNV/ZzBRvdz8O+wgpI6hFS/TzarI0mFlb40gOElK
 DT+8wpzm9hxU0BvNhPlCwktio9YiRHr8VwKz46jTbJfO8riRsi3kM8511n7FYiZcnc8HqnmNPF
 eos=
X-SBRS: 2.7
X-MesageID: 3787818
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,338,1559534400"; 
   d="scan'208";a="3787818"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 2 Aug 2019 16:35:55 +0100
Message-ID: <20190802153606.32061-25-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802153606.32061-1-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 24/35] libxl: Remove
 libxl__qmp_run_command_flexarray
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUgYXJlIG5vIG1vcmUgdXNlcnMuCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8
YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KLS0tCiB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5h
bC5oIHwgIDMgLS0tCiB0b29scy9saWJ4bC9saWJ4bF9xbXAuYyAgICAgIHwgMTYgLS0tLS0tLS0t
LS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAxOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90
b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIGIvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwu
aAppbmRleCA4ZGVhNDRiMjIxLi41YzE1YTczYTA4IDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9s
aWJ4bF9pbnRlcm5hbC5oCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKQEAgLTE5
NzksOSArMTk3OSw2IEBAIHR5cGVkZWYgc3RydWN0IGxpYnhsX19xbXBfaGFuZGxlciBsaWJ4bF9f
cW1wX2hhbmRsZXI7CiAgKi8KIF9oaWRkZW4gbGlieGxfX3FtcF9oYW5kbGVyICpsaWJ4bF9fcW1w
X2luaXRpYWxpemUobGlieGxfX2djICpnYywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgZG9taWQpOwotX2hpZGRlbiBpbnQgbGlieGxf
X3FtcF9ydW5fY29tbWFuZF9mbGV4YXJyYXkobGlieGxfX2djICpnYywgaW50IGRvbWlkLAotICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqY21k
LAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmxleGFycmF5
X3QgKmFycmF5KTsKIF9oaWRkZW4gaW50IGxpYnhsX19xbXBfcGNpX2FkZChsaWJ4bF9fZ2MgKmdj
LCBpbnQgZCwgbGlieGxfZGV2aWNlX3BjaSAqcGNpZGV2KTsKIF9oaWRkZW4gaW50IGxpYnhsX19x
bXBfcGNpX2RlbChsaWJ4bF9fZ2MgKmdjLCBpbnQgZG9taWQsCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgbGlieGxfZGV2aWNlX3BjaSAqcGNpZGV2KTsKZGlmZiAtLWdpdCBhL3Rvb2xz
L2xpYnhsL2xpYnhsX3FtcC5jIGIvdG9vbHMvbGlieGwvbGlieGxfcW1wLmMKaW5kZXggMGQ2YWVk
Y2M3ZC4uYzc4ZWY0NjM3ZCAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfcW1wLmMKKysr
IGIvdG9vbHMvbGlieGwvbGlieGxfcW1wLmMKQEAgLTgzMywyMiArODMzLDYgQEAgc3RhdGljIGlu
dCBxbXBfcnVuX2NvbW1hbmQobGlieGxfX2djICpnYywgaW50IGRvbWlkLAogICAgIHJldHVybiBy
YzsKIH0KIAotaW50IGxpYnhsX19xbXBfcnVuX2NvbW1hbmRfZmxleGFycmF5KGxpYnhsX19nYyAq
Z2MsIGludCBkb21pZCwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25z
dCBjaGFyICpjbWQsIGZsZXhhcnJheV90ICphcnJheSkKLXsKLSAgICBsaWJ4bF9fanNvbl9vYmpl
Y3QgKmFyZ3MgPSBOVUxMOwotICAgIGludCBpOwotICAgIHZvaWQgKm5hbWUsICp2YWx1ZTsKLQot
ICAgIGZvciAoaSA9IDA7IGkgPCBhcnJheS0+Y291bnQ7IGkgKz0gMikgewotICAgICAgICBmbGV4
YXJyYXlfZ2V0KGFycmF5LCBpLCAmbmFtZSk7Ci0gICAgICAgIGZsZXhhcnJheV9nZXQoYXJyYXks
IGkgKyAxLCAmdmFsdWUpOwotICAgICAgICBsaWJ4bF9fcW1wX3BhcmFtX2FkZF9zdHJpbmcoZ2Ms
ICZhcmdzLCAoY2hhciAqKW5hbWUsIChjaGFyICopdmFsdWUpOwotICAgIH0KLQotICAgIHJldHVy
biBxbXBfcnVuX2NvbW1hbmQoZ2MsIGRvbWlkLCBjbWQsIGFyZ3MsIE5VTEwsIE5VTEwpOwotfQot
CiBpbnQgbGlieGxfX3FtcF9wY2lfYWRkKGxpYnhsX19nYyAqZ2MsIGludCBkb21pZCwgbGlieGxf
ZGV2aWNlX3BjaSAqcGNpZGV2KQogewogICAgIGxpYnhsX19xbXBfaGFuZGxlciAqcW1wID0gTlVM
TDsKLS0gCkFudGhvbnkgUEVSQVJECgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
