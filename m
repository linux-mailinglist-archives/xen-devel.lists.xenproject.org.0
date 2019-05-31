Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCBE30CAF
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 12:36:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWerl-0001pS-59; Fri, 31 May 2019 10:34:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BEsa=T7=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hWeri-0001pL-Pu
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 10:34:26 +0000
X-Inumbo-ID: a7734b46-838f-11e9-b76a-b7769910031e
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a7734b46-838f-11e9-b76a-b7769910031e;
 Fri, 31 May 2019 10:34:23 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: mpvF1lLYhdHiWkd6hou/kEeXiSATavCl0k0CpAqU7S9QjWAUAKDXheUF6ggiFRie6xHcMi6syN
 54hAfrYrxtul+nOsgvc/k9iG7N+Rf/QhemhN3YJ0QlTGDUKEOBVz6xpDsdRTWb0olzPO3pbLJ3
 4uFP6F4+ju/QiO7D7EK/aa3CCi5U+ky2mFvAa0aUvCGalI07h+v1snfFKeHj9GZ0sGkw6gFKgl
 q21pia3M0GllGqAUILQcjZIjn/edoC60+fhn4iLV0sQOggrR68m0W3Rkg6AOla3/t/JO8xcrHM
 8gU=
X-SBRS: 2.7
X-MesageID: 1147909
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,534,1549947600"; 
   d="scan'208";a="1147909"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23793.763.56062.488960@mariner.uk.xensource.com>
Date: Fri, 31 May 2019 11:33:31 +0100
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
In-Reply-To: <osstest-137064-mainreport@xen.org>
References: <osstest-137064-mainreport@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [xen-4.6-testing test] 137064: regressions - FAIL
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
Cc: Juergen Gross <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

b3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyaXRlcyAoIlt4ZW4tNC42LXRlc3RpbmcgdGVzdF0gMTM3
MDY0OiByZWdyZXNzaW9ucyAtIEZBSUwiKToKPiBmbGlnaHQgMTM3MDY0IHhlbi00LjYtdGVzdGlu
ZyByZWFsIFtyZWFsXQo+IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rl
c3QvbG9ncy8xMzcwNjQvCj4gCj4gUmVncmVzc2lvbnMgOi0oCgpUaGlzIGlzIGFsbCBwcmV0dHkg
YmFkIGJ1dCBJIHRoaW5rIGl0IGlzIG1vc3RseSBuZXcgdGVzdHMgaW4gWFRGLAppbmNvbXBhdGli
aWxpdHkgd2l0aCBzdHJldGNoLCBldGMuCgpUaGUgb25seSByZWFzb24gd2UgYXJlIHJ1bm5pbmcg
dGhpcyB0ZXN0IGF0IGFsbCBpcyB0byBnZXQgdmFyaW91cwpidWlsZCBmaXhlcyBpbmNsdWRlZCBp
biB0aGUgc3RhYmxlLTQuNiBicmFuY2ggc28gdGhhdCB3ZSBjYW4gdGVzdAo0LjYtdG8tNC43IG1p
Z3JhdGlvbi4KCkFjY29yZGluZ2x5LCB1bmxlc3Mgc29tZW9uZSBvYmplY3RzLCBJIHdpbGwgZm9y
Y2UgcHVzaCB0aGlzLgoKPiB2ZXJzaW9uIHRhcmdldGVkIGZvciB0ZXN0aW5nOgo+ICB4ZW4gICAg
ICAgICAgICAgICAgICA3ZjU0MjE5NTcyY2FjZWQ5OGExMzMwNzI1NDZhZDg5MDg5N2I5ODI3Cj4g
YmFzZWxpbmUgdmVyc2lvbjoKPiAgeGVuICAgICAgICAgICAgICAgICAgMzYzNmRlM2YxYTlhNTEz
ZWJkY2Q3NzU1NWRjZTBlNGQ0NTFlMTk4YgoKPiBUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQg
YW5kIGFyZSBibG9ja2luZywKPiBpbmNsdWRpbmcgdGVzdHMgd2hpY2ggY291bGQgbm90IGJlIHJ1
bjoKPiAgdGVzdC1hbWQ2NC1hbWQ2NC1taWdydXBncmFkZSAyMiBndWVzdC1taWdyYXRlL3NyY19o
b3N0L2RzdF9ob3N0IGZhaWwgUkVHUi4gdnMuIDEyNzc5Mgo+ICB0ZXN0LWFtZDY0LWFtZDY0LXhs
LXhzbSAgICAgICA3IHhlbi1ib290ICAgICAgICAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxMjc3
OTIKPiAgdGVzdC1hbWQ2NC1pMzg2LWZyZWVic2QxMC1hbWQ2NCAxMSBndWVzdC1zdGFydCAgICAg
ICAgICAgZmFpbCBSRUdSLiB2cy4gMTI3NzkyCj4gIHRlc3QtYW1kNjQtaTM4Ni1mcmVlYnNkMTAt
aTM4NiAxMSBndWVzdC1zdGFydCAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDEyNzc5Mgo+ICB0
ZXN0LXh0Zi1hbWQ2NC1hbWQ2NC01ICAgICAgIDEwOCBsZWFrLWNoZWNrL2NoZWNrICAgICAgICBm
YWlsIFJFR1IuIHZzLiAxMjc3OTIKPiAgdGVzdC14dGYtYW1kNjQtYW1kNjQtMSAgICAgICAxMDgg
bGVhay1jaGVjay9jaGVjayAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTI3NzkyCj4gIHRlc3QteHRm
LWFtZDY0LWFtZDY0LTQgICAgICAgMTA4IGxlYWstY2hlY2svY2hlY2sgICAgICAgIGZhaWwgUkVH
Ui4gdnMuIDEyNzc5Mgo+ICB0ZXN0LXh0Zi1hbWQ2NC1hbWQ2NC0zICAgICAgIDEwOCBsZWFrLWNo
ZWNrL2NoZWNrICAgICAgICBmYWlsIFJFR1IuIHZzLiAxMjc3OTIKPiAgdGVzdC14dGYtYW1kNjQt
YW1kNjQtMiAgICAgICAxMDggbGVhay1jaGVjay9jaGVjayAgICAgICAgZmFpbCBSRUdSLiB2cy4g
MTI3NzkyCj4gIHRlc3QtYW1kNjQtaTM4Ni1taWdydXBncmFkZSAyMiBndWVzdC1taWdyYXRlL3Ny
Y19ob3N0L2RzdF9ob3N0IGZhaWwgUkVHUi4gdnMuIDEyNzc5Mgo+ICB0ZXN0LWFtZDY0LWFtZDY0
LXhsLXFlbXV1LWRlYmlhbmh2bS1hbWQ2NC1zaGFkb3cgMTAgZGViaWFuLWh2bS1pbnN0YWxsIGZh
aWwgUkVHUi4gdnMuIDEyNzc5Mgo+ICB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV0LWRlYmlhbmh2
bS1hbWQ2NCAxMCBkZWJpYW4taHZtLWluc3RhbGwgZmFpbCBSRUdSLiB2cy4gMTI3NzkyCj4gIHRl
c3QtYW1kNjQtaTM4Ni14bC1xZW11dS1kZWJpYW5odm0tYW1kNjQgMTAgZGViaWFuLWh2bS1pbnN0
YWxsIGZhaWwgUkVHUi4gdnMuIDEyNzc5Mgo+ICB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV0LXN0
dWJkb20tZGViaWFuaHZtLWFtZDY0LXhzbSAxMCBkZWJpYW4taHZtLWluc3RhbGwgZmFpbCBSRUdS
LiB2cy4gMTI3NzkyCj4gIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtZGViaWFuaHZtLWFtZDY0
IDEwIGRlYmlhbi1odm0taW5zdGFsbCBmYWlsIFJFR1IuIHZzLiAxMjc3OTIKPiAgdGVzdC1hbWQ2
NC1pMzg2LXFlbXV1LXJoZWw2aHZtLWludGVsIDEwIHJlZGhhdC1pbnN0YWxsICAgZmFpbCBSRUdS
LiB2cy4gMTI3NzkyCj4gIHRlc3QtYW1kNjQtYW1kNjQtbGlidmlydC1xZW11dS1kZWJpYW5odm0t
YW1kNjQteHNtIDEwIGRlYmlhbi1odm0taW5zdGFsbCBmYWlsIFJFR1IuIHZzLiAxMjc3OTIKPiAg
dGVzdC1hbWQ2NC1pMzg2LXhsLXFlbXV0LXN0dWJkb20tZGViaWFuaHZtLWFtZDY0LXhzbSAxMCBk
ZWJpYW4taHZtLWluc3RhbGwgZmFpbCBSRUdSLiB2cy4gMTI3NzkyCj4gIHRlc3QtYW1kNjQtYW1k
NjQtcWVtdXUtbmVzdGVkLWFtZCAxMCBkZWJpYW4taHZtLWluc3RhbGwgIGZhaWwgUkVHUi4gdnMu
IDEyNzc5Mgo+ICB0ZXN0LWFtZDY0LWkzODYteGwtcWVtdXUtZGViaWFuaHZtLWFtZDY0LXNoYWRv
dyAxMCBkZWJpYW4taHZtLWluc3RhbGwgZmFpbCBSRUdSLiB2cy4gMTI3NzkyCj4gIHRlc3QtYW1k
NjQtaTM4Ni14bC1xZW11dS1vdm1mLWFtZDY0IDEwIGRlYmlhbi1odm0taW5zdGFsbCBmYWlsIFJF
R1IuIHZzLiAxMjc3OTIKPiAgdGVzdC1hbWQ2NC1hbWQ2NC1xZW11dS1uZXN0ZWQtaW50ZWwgMTAg
ZGViaWFuLWh2bS1pbnN0YWxsIGZhaWwgUkVHUi4gdnMuIDEyNzc5Mgo+ICB0ZXN0LWFtZDY0LWFt
ZDY0LXhsLXFlbXV1LW92bWYtYW1kNjQgMTAgZGViaWFuLWh2bS1pbnN0YWxsIGZhaWwgUkVHUi4g
dnMuIDEyNzc5Mgo+ICB0ZXN0LWFtZDY0LWkzODYtbGlidmlydC1xZW11dS1kZWJpYW5odm0tYW1k
NjQteHNtIDEwIGRlYmlhbi1odm0taW5zdGFsbCBmYWlsIFJFR1IuIHZzLiAxMjc3OTIKPiAgdGVz
dC1hbWQ2NC1pMzg2LXFlbXV1LXJoZWw2aHZtLWFtZCAxMCByZWRoYXQtaW5zdGFsbCAgICAgZmFp
bCBSRUdSLiB2cy4gMTI3NzkyCj4gIHRlc3QtYW1kNjQtaTM4Ni14bC1xZW11dC1kZWJpYW5odm0t
YW1kNjQgMTAgZGViaWFuLWh2bS1pbnN0YWxsIGZhaWwgUkVHUi4gdnMuIDEyNzc5Mgo+ICB0ZXN0
LWFtZDY0LWkzODYtcWVtdXQtcmhlbDZodm0taW50ZWwgMTAgcmVkaGF0LWluc3RhbGwgICBmYWls
IFJFR1IuIHZzLiAxMjc3OTIKPiAgdGVzdC1hbWQ2NC1pMzg2LXFlbXV0LXJoZWw2aHZtLWFtZCAx
MCByZWRoYXQtaW5zdGFsbCAgICAgZmFpbCBSRUdSLiB2cy4gMTI3NzkyCj4gIGJ1aWxkLWFybWhm
ICAgICAgICAgICAgICAgICAgIDYgeGVuLWJ1aWxkICAgICAgICAgICAgICAgIGZhaWwgUkVHUi4g
dnMuIDEyNzc5Mgo+ICB0ZXN0LWFtZDY0LWkzODYteGwtcWVtdXUtd2luNy1hbWQ2NCAxMCB3aW5k
b3dzLWluc3RhbGwgICBmYWlsIFJFR1IuIHZzLiAxMjc3OTIKPiAgdGVzdC1hbWQ2NC1hbWQ2NC14
bC1xZW11dC13aW43LWFtZDY0IDEwIHdpbmRvd3MtaW5zdGFsbCAgZmFpbCBSRUdSLiB2cy4gMTI3
NzkyCj4gIHRlc3QtYW1kNjQtaTM4Ni14bC1xZW11dS13czE2LWFtZDY0IDEwIHdpbmRvd3MtaW5z
dGFsbCAgIGZhaWwgUkVHUi4gdnMuIDEyNzc5Mgo+ICB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV1
LXdpbjctYW1kNjQgMTAgd2luZG93cy1pbnN0YWxsICBmYWlsIFJFR1IuIHZzLiAxMjc3OTIKPiAg
dGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11dC13czE2LWFtZDY0IDEwIHdpbmRvd3MtaW5zdGFsbCAg
ZmFpbCBSRUdSLiB2cy4gMTI3NzkyCj4gIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXUtd3MxNi1h
bWQ2NCAxMCB3aW5kb3dzLWluc3RhbGwgIGZhaWwgUkVHUi4gdnMuIDEyNzc5Mgo+ICB0ZXN0LWFt
ZDY0LWkzODYteGwtcWVtdXQtd2luNy1hbWQ2NCAxMCB3aW5kb3dzLWluc3RhbGwgICBmYWlsIFJF
R1IuIHZzLiAxMjc3OTIKPiAgdGVzdC1hbWQ2NC1pMzg2LXhsLXFlbXV0LXdzMTYtYW1kNjQgMTAg
d2luZG93cy1pbnN0YWxsICAgZmFpbCBSRUdSLiB2cy4gMTI3NzkyCgpJYW4uCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
