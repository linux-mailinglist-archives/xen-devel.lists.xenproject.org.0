Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 151B7279EE
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2019 12:00:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTkTp-0001Vc-5p; Thu, 23 May 2019 09:57:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wok1=TX=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hTkTn-0001VX-PO
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 09:57:43 +0000
X-Inumbo-ID: 344f5c6b-7d41-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 344f5c6b-7d41-11e9-8980-bc764e045a96;
 Thu, 23 May 2019 09:57:41 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: WyjKrYgr8ao3YvYNV+CYWc6b77oVrYAs0Oe7kt3RJJIT/ZsVa5LNR+MveF8jkppfISvEDLnJAl
 9Ht4dWIHnCYMtS2bXWMq+kXVGv7m697gVggdGEhMKoZE2RKAhP4gy0AnpSOIyg/ilXvKXBrXzu
 oq16uaa1Z70s2fGdXtPgw5QBCoTNCmyN14iRlFrTk1Xpy7bwACEA6Lj/tLqczdrGNxm9pTS18l
 66+ITrPLImTyivkZ0f/FbR4AdGV6z9awG66yGT9wgT6//2yZYZN4JzytADMuFJ8yPnSJHXW4aY
 4EU=
X-SBRS: 2.7
X-MesageID: 796847
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,502,1549947600"; 
   d="scan'208";a="796847"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23782.28276.943946.821244@mariner.uk.xensource.com>
Date: Thu, 23 May 2019 10:57:08 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
Newsgroups: chiark.mail.xen.devel
In-Reply-To: <20190220170001.32614-3-roger.pau@citrix.com>
References: <20190220170001.32614-1-roger.pau@citrix.com>
 <20190220170001.32614-3-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 2/6] osstest: introduce a helper to create a
 weblink to a directory
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

Um9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIltYZW4tZGV2ZWxdIFtQQVRDSCAyLzZdIG9zc3Rlc3Q6
IGludHJvZHVjZSBhIGhlbHBlciB0byBjcmVhdGUgYSB3ZWJsaW5rIHRvIGEgZGlyZWN0b3J5Iik6
Cj4gK3N1YiBjcmVhdGVfd2VibGluayAoJCQkKSB7Cj4gKyAgICBteSAoJGhvLCAkdGFpbCwgJHRh
cmdldCkgPSBAXzsKPiArICAgIG15ICR3Zl9yaHM9IGhvc3RuYW1lcGF0aCgkaG8pLiJfIi4kdGFp
bDsKPiArICAgIG15ICR3Zl9jb21tb249ICRje1dlYnNwYWNlQ29tbW9ufS4kd2ZfcmhzOwo+ICsg
ICAgbXkgJHdmX3VybD0gJGN7V2Vic3BhY2VVcmx9LiR3Zl9jb21tb247Cj4gKyAgICBteSAkd2Zf
ZmlsZT0gJGN7V2Vic3BhY2VGaWxlfS4kd2ZfY29tbW9uOwo+ICsKPiArICAgIHVubGluayAkd2Zf
ZmlsZTsKPiArICAgIHN5bWxpbmsgJHRhcmdldCwgJHdmX2ZpbGUgb3IgZGllICIkd2ZfZmlsZSAk
ISI7Cj4gKyAgICByZXR1cm4gJHdmX3VybDsKCk1vc3Qgb2YgdGhpcyBpcyB0aGUgc3RhcnQgb2Yg
Y3JlYXRlX3dlYmZpbGUuICBDYW4geW91IGZhY3RvciB0aGF0Cm91dCA/CgpJIGhhdmUgdGhyZWUg
c3VnZ2VzdGlvbnMgZm9yIHRoZSBzaGFwZToKCiAgICAgIG15ICgkd2ZfZmlsZSwgJHdmX3VybCkg
PSBwcmVwYXJlX2NyZWF0ZV93ZWJmaWxlKCRobywgJHRhaWwpOwogICAgICBzeW1saW5rICR0YXJn
ZXQsICR3Zl9maWxlIG9yIGRpZSAiJHdmX2ZpbGUgJCEiOwogICAgICByZXR1cm4gJHdmX3VybDsK
ICB9CiAgICAgIApvciBzcGxpdCBjcmVhdGVfd2ViZmlsZSBpbnRvIGNyZWF0ZV93ZWJfZnNvYmpl
Y3Qgd2hpY2ggdGFrZXMgYQpzdWJyZWYsIGFuZCB0aGUgY2FsbCB0byBmaWxlX2xpbmtfY29udGVu
dHM6CgogICAgICBjcmVhdGVfd2ViX2Zzb2JqZWN0KCRobywgJHRhaWwsIHN1YiB7CiAgICAgICAg
ICBteSAoJHdmX2ZpbGUpID0gQF87CiAgICAgICAgICBzeW1saW5rICR0YXJnZXQsICR3Zl9maWxl
IG9yIGRpZSAiJHdmX2ZpbGUgJCEiOwogICAgICB9KTsKICB9CgpvciB0aGUgc2FtZSBidXQgbWFr
ZSBwYXNzaW5nIGEgc3VicmVmIGFzICRjb250ZW50cyBsZWdhbCBmb3IKY3JlYXRlX3dlYmZpbGUs
Cgogc3ViIGNyZWF0ZV93ZWJmaWxlICgkJCQpIHsKICAgICBteSAuLi4uICRjb250ZW50c19zcGVj
KTsKICAgICAjICRjb250ZW50cyBhcyBmb3IgZmlsZV9saW5rX2NvbnRlbnRzLCBvciBhIHN1YnJl
ZgogICAgICMgd2hpY2ggd2lsbCBiZSBjYWxsZWQgYXMgJGNvbnRlbnRzX3NwZWMoJHdmX2ZpbGUs
JHdmX3VybCk7CiAgICAgLi4uCiAgICAgaWYgKHJlZigkY29udGVudHNfc3BlYykgbmUgJ0NPREUn
KSB7CiAgICAgICAgIG15ICRjb250ZW50cyA9ICAkY29udGVudHNfc3BlYzsKICAgICAgICAgJGNv
bnRlbnRzX3NwZWMgPSBzdWIgewogICAgICAgICAgICAgbXkgKCR3Zl9maWxlKSA9IEBfOwogICAg
ICAgICAgICAgZmlsZV9saW5rX2NvbnRlbnRzKCR3Zl9maWxlLCAkY29udGVudHMsICJ3ZWJzcGFj
ZS0kd2ZfcmhzIik7CiAgICAgICAgIH07CiAgICAgfQoKVGFrZSB5b3VyIHBpY2ssIG9yIGRvIHNv
bWV0aGluZyBzaW1pbGFyID8KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
