Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 191713095E
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 09:33:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWc0N-0000me-CE; Fri, 31 May 2019 07:31:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J+xl=T7=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hWc0L-0000mZ-MK
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 07:31:09 +0000
X-Inumbo-ID: 0cbc0700-8376-11e9-a9dc-4f082cc1e245
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0cbc0700-8376-11e9-a9dc-4f082cc1e245;
 Fri, 31 May 2019 07:31:06 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=Pass smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: lnooVlL8SkMYL7aPjFH0jxwqMqTKLbSrblMa8zyQNljsCXqWr5WsLeRsStI1tiqYlKtZhVPsuN
 KUsYKtAhuC/Y8nB4rO7QrMNvbOHFRVGMDXlSI4ieqHGoWUrwEJq4B1hkIB+Nib73CorDkLXehy
 96W2DXAMm55/Mn7jGRa6JwxE1cWUVwdDp+ymOOYogGbNWCwvgElbIekg8pBjovVyrGhv2JLXga
 nzf8zrqCokKxRQSD+kWFPjP5GU0BEsPoOjPmNjxyvMN1CjGgNy6agoTuO8utgOoEG9XnF+i+DD
 xH0=
X-SBRS: 2.7
X-MesageID: 1145273
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,534,1549947600"; 
   d="scan'208";a="1145273"
From: Wei Liu <wei.liu2@citrix.com>
To: <netdev@vger.kernel.org>
Date: Fri, 31 May 2019 08:31:02 +0100
Message-ID: <20190531073102.5334-1-wei.liu2@citrix.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH net-next] Update my email address
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiBNQUlOVEFJ
TkVSUyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggMGM1NWIwZmVk
YmUyLi5lMjEyYzZhNDJkZGYgMTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlO
RVJTCkBAIC0xNzI5NSw3ICsxNzI5NSw3IEBAIEY6CURvY3VtZW50YXRpb24vQUJJL3N0YWJsZS9z
eXNmcy1oeXBlcnZpc29yLXhlbgogRjoJRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1o
eXBlcnZpc29yLXhlbgogCiBYRU4gTkVUV09SSyBCQUNLRU5EIERSSVZFUgotTToJV2VpIExpdSA8
d2VpLmxpdTJAY2l0cml4LmNvbT4KK006CVdlaSBMaXUgPHdlaS5saXVAa2VybmVsLm9yZz4KIE06
CVBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+CiBMOgl4ZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcgKG1vZGVyYXRlZCBmb3Igbm9uLXN1YnNjcmliZXJzKQogTDoJbmV0
ZGV2QHZnZXIua2VybmVsLm9yZwotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
