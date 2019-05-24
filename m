Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EB329AFF
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 17:27:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hUC3G-0000nQ-SB; Fri, 24 May 2019 15:24:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0saV=TY=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hUC3G-0000nJ-7y
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 15:24:10 +0000
X-Inumbo-ID: f7afb66a-7e37-11e9-b402-a724c253c7e6
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f7afb66a-7e37-11e9-b402-a724c253c7e6;
 Fri, 24 May 2019 15:24:06 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=Pass smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: POVKKsDtLB/VKYSHn5JAIwX4nxw6ol3x9u14o/TmOXB0vZoYwk0jbH2cEZizMwJfuyjKL8xf4l
 U8li2XOW0DVKoS3w/YZGtLQeonggUS//LhMdVglWmvKlypR3xDQv8GWC86H0eY9KlUnCLTqUHX
 G0ThhPWjUKwi4r2pChKQrPID4ZT16mKn+FRha4Cr2u4GJ7y5k/kyCzr0dXCJ7dberakJllTZLO
 t8eLacyBa2NbHj1iKDQ+HMNVV6Yr1ro0WBEyNGpaKkJw2pI0fmmt9DOaRofrhCbaUvOLXbE5sK
 yjI=
X-SBRS: 2.7
X-MesageID: 866198
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,507,1549947600"; 
   d="scan'208";a="866198"
From: Wei Liu <wei.liu2@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 24 May 2019 16:24:02 +0100
Message-ID: <20190524152402.5042-1-wei.liu2@citrix.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] MAINTAINERS: update my email address
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiBNQUlOVEFJ
TkVSUyB8IDEwICsrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRl
eCA4YTFlMDQwMjU4Li4zYzQzMjZkZTQ4IDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9N
QUlOVEFJTkVSUwpAQCAtMzExLDcgKzMxMSw3IEBAIEY6CXRvb2xzL29jYW1sLwogCiBPVk1GIFVQ
U1RSRUFNCiBNOglBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KLU06
CVdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CitNOglXZWkgTGl1IDx3bEB4ZW4ub3JnPgog
UzoJU3VwcG9ydGVkCiBUOglnaXQgaHR0cHM6Ly94ZW5iaXRzLnhlbnByb2plY3Qub3JnL2dpdC1o
dHRwL292bWYuZ2l0CiAKQEAgLTM3MCw3ICszNzAsNyBAQCBTOglTdXBwb3J0ZWQKIEY6CXhlbi9j
b21tb24vc2NoZWQqCiAKIFNFQUJJT1MgVVBTVFJFQU0KLU06CVdlaSBMaXUgPHdlaS5saXUyQGNp
dHJpeC5jb20+CitNOglXZWkgTGl1IDx3bEB4ZW4ub3JnPgogUzoJU3VwcG9ydGVkCiBUOglnaXQg
aHR0cHM6Ly94ZW5iaXRzLnhlbnByb2plY3Qub3JnL2dpdC1odHRwL3NlYWJpb3MuZ2l0CiAKQEAg
LTM4Myw3ICszODMsNyBAQCBGOglzdHViZG9tLwogCiBUT09MU1RBQ0sKIE06CUlhbiBKYWNrc29u
IDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotTToJV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4
LmNvbT4KK006CVdlaSBMaXUgPHdsQHhlbi5vcmc+CiBTOglTdXBwb3J0ZWQKIEY6CWF1dG9nZW4u
c2gKIEY6CWNvbmZpZy8qLmluCkBAIC00MzcsNyArNDM3LDcgQEAgRjoJZG9jcy9taXNjL3Z0cG0t
cGxhdGZvcm1zLnR4dAogWDg2IEFSQ0hJVEVDVFVSRQogTToJSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgogTToJQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
LVI6CVdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CitSOglXZWkgTGl1IDx3bEB4ZW4ub3Jn
PgogUjoJUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CiBTOglTdXBwb3J0
ZWQKIEw6CXhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpAQCAtNTEzLDcgKzUxMyw3IEBA
IE06CUp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CiBNOglLb25yYWQgUnplc3p1
dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CiBNOglTdGVmYW5vIFN0YWJlbGxpbmkg
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CiBNOglUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KLU06
CVdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CitNOglXZWkgTGl1IDx3bEB4ZW4ub3JnPgog
TDoJeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCiBTOglTdXBwb3J0ZWQKIEY6CSoKLS0g
CjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
