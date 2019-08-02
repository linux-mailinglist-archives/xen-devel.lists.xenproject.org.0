Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF30B7F5B1
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 13:03:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htVHS-0005cz-3s; Fri, 02 Aug 2019 10:59:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BtSY=V6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1htVHQ-0005cu-QW
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 10:59:24 +0000
X-Inumbo-ID: 959e0f30-b514-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 959e0f30-b514-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 10:59:22 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Bsy/AW4M/7TBu0tuH9R/yN+PLGGHdqjvK2LvemUT1K5Jtsbr61yR9EbbKOQ6sNtwZAkEc4gsgT
 bbDvPWeE9DUePEGHZkDIbAPXvF6nQf8BpXqsUjaUdWsZ5tfwEf7K+N/17V+m8P1dEd8JQ+PwU3
 Y9W27exB/RF9GTesjskNv2Cia0K7gICbbyH5gTmUCmjiqPpsoPzkvcNlu0186TLG9UElOZ0Tv5
 ONsIUWZOnaNUc7t7fIqm0TJAYuV8ES4rtKS2zfQ6+2YVX/dOpt5HYvnJHd4nB6W/j3V4MD/Fzm
 n3k=
X-SBRS: 2.7
X-MesageID: 3810012
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,337,1559534400"; 
   d="scan'208";a="3810012"
Date: Fri, 2 Aug 2019 12:59:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Chao Gao <chao.gao@intel.com>
Message-ID: <20190802105911.psbtwpqclqcergw6@Air-de-Roger>
References: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v8 00/16] improve late microcode loading
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Ashok Raj <ashok.raj@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMDEsIDIwMTkgYXQgMDY6MjI6MzVQTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6
Cj4gQ2hhbmdlcyBpbiB2ZXJzaW9uIDg6Cj4gIC0gYmxvY2sgI05NSSBoYW5kbGluZyBkdXJpbmcg
bWljcm9jb2RlIGxvYWRpbmcgKFBhdGNoIDE2KQo+ICAtIERvbid0IGFzc3VtZSB0aGF0IGFsbCBD
UFVzIGluIHRoZSBzeXN0ZW0gaGF2ZSBsb2FkZWQgYSBzYW1lIHVjb2RlLgo+ICBTbyB3aGVuIHBh
cnNpbmcgYSBibG9iLCB3ZSBhdHRlbXB0IHRvIHNhdmUgYSBwYXRjaCBhcyBsb25nIGFzIGl0IG1h
dGNoZXMKPiAgd2l0aCBjdXJyZW50IGNwdSBzaWduYXR1cmUgcmVnYXJkbGVzcyBvZiB0aGUgcmV2
aXNpb24gb2YgdGhlIHBhdGNoLgo+ICBBbmQgYWxzbyBmb3IgbG9hZGluZywgd2Ugb25seSByZXF1
aXJlIHRoZSBwYXRjaCB0byBiZSBsb2FkZWQgaXNuJ3Qgb2xkCj4gIHRoYW4gdGhlIGNhY2hlZCBv
bmUuCj4gIC0gc3RvcmUgYW4gdXBkYXRlIGFmdGVyIHRoZSBmaXJzdCBzdWNjZXNzZnVsIGxvYWRp
bmcgb24gYSBDUFUKPiAgLSByZW1vdmUgdGhlIHBhdGNoIHRoYXQgY2FsbHMgd2JpbnZkKCkgdW5j
b25kaXRpb25hbGx5IGJlZm9yZSBtaWNyb2NvZGUKPiAgbG9hZGluZy4gSXQgaXMgdW5kZXIgaW50
ZXJuYWwgZGlzY3Vzc2lvbi4KPiAgLSBkaXZpZGUgdHdvIGJpZyBwYXRjaGVzIGludG8gc2V2ZXJh
bCBwYXRjaGVzIHRvIGltcHJvdmUgcmVhZGFiaWxpdHkuCgpUaGFua3MgZm9yIGZvbGxvd2luZyB1
cCBvbiB0aGlzIQoKSSB3aWxsIHRyeSB0byByZXZpZXcgaXQgYmV0d2VlbiBNb25kYXkgYW5kIFR1
ZXNkYXkuCgpSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
