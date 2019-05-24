Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A788B2961D
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 12:42:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hU7d6-0002AZ-9U; Fri, 24 May 2019 10:40:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hzhY=TY=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hU7d5-0002A2-6B
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 10:40:51 +0000
X-Inumbo-ID: 63bf0d56-7e10-11e9-ac1e-53f3ca0e2ae5
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 63bf0d56-7e10-11e9-ac1e-53f3ca0e2ae5;
 Fri, 24 May 2019 10:40:47 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: +vleqMAz8eaIZln9cHzxZOZczlPwo6L0bqkmjECwhdaMMQmeAWWg72Z//9CzCPXp1MRUOiVrDU
 0e5lSi4uVKKUCI3oqQdB9qruUYr6VzLIU3aBB0JAPNKvLrCTAQALp++4EojCG8LD9jwcYXnEWw
 J+TID/NAorXwCLOuaGPGz7s74qjST2lzP8FwioBlhZBSgH+k/K+deu5HI25O18yvb4chHiQdzm
 U9zGGHLdzC+iB5Knos/ldHEMzUUrXlV/aEhMmQFUqYd4C69IYly2DvVgXR0vR8m2B4vO8oBxgN
 FHo=
X-SBRS: 2.7
X-MesageID: 872531
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,506,1549947600"; 
   d="scan'208";a="872531"
Date: Fri, 24 May 2019 11:40:44 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: "Chen, Farrah" <farrah.chen@intel.com>
Message-ID: <20190524104044.GA11433@perard.uk.xensource.com>
References: <1B925CC0CD9F3341B32D442251E7E1DC3E298BE7@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1B925CC0CD9F3341B32D442251E7E1DC3E298BE7@SHSMSX104.ccr.corp.intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [Xen-devel] Compiling Xen error on RedHat8.0
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Hao,
 Xudong" <xudong.hao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgMDU6Mjg6NTBBTSArMDAwMCwgQ2hlbiwgRmFycmFoIHdy
b3RlOgo+IEhpLAoKSGksCgo+IERvIHlvdSBoYXZlIGFueSBhZHZpY2Ugb24gYnVpbGRpbmcgWGVu
IG9uIFJlZEhhdDg/IFRoYW5rcyBhIGxvdCEKCklmIHlvdSdyZSBidWlsZGluZyBhIHJlbGVhc2Ug
b2YgWGVuLCB0aGVuIHlvdSBjb3VsZCB0cnkgc2V0dGluZwpQWVRIT049L3Vzci9iaW4vcHl0aG9u
MiBldmVyeXdoZXJlLCB0aGF0IGlzIHdoZW4gc3RhcnRpbmcgY29uZmlndXJlIGFuZAptYWtlLCBz
b21ldGhpbmcgbGlrZToKCiQgLi9jb25maWd1cmUgUFlUSE9OPS91c3IvYmluL3B5dGhvbjIgLi4u
CiQgbWFrZSBQWVRIT049L3Vzci9iaW4vcHl0aG9uMiAuLi4KCklmIHlvdSBhcmUgYnVpbGRpbmcg
ZnJvbSB0aGUgdW5zdGFibGUgdHJlZSwgSSB0aGluayB3ZSBmaXhlZCBtb3N0IG9mCnRob3NlIGJ1
Z3MgcmVsYXRpbmcgdG8gcHl0aG9uMi9weXRob24zLgoKSXMgdGhhdCBoZWxwPwoKQWJvdXQgdGhl
IHNvZnQgbGluayAicHl0aG9uIiB0byAicHl0aG9uMiIsIHlvdSB3b3VsZCBuZWVkIGEgc29mdGxp
bmsKInB5dGhvbi1jb25maWciIHRvICJweXRob24yLWNvbmZpZyIgYXMgd2VsbCBhbmQgdGhlICJj
aGVja2luZyBmb3IKUHlBcmdfUGFyc2VUdXBsZSIgaXMgbW9yZSBsaWtlbHkgdG8gc3VjY2VlZC4K
CkNoZWVycywKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
