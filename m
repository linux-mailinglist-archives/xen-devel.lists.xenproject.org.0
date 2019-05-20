Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8313523CE5
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 18:08:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSkn8-00018u-Ck; Mon, 20 May 2019 16:05:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=26W0=TU=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hSkn6-00018g-LZ
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 16:05:32 +0000
X-Inumbo-ID: 16913616-7b19-11e9-aab1-4b9f73b43ca3
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 16913616-7b19-11e9-aab1-4b9f73b43ca3;
 Mon, 20 May 2019 16:05:29 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
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
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: gifsdPHS77t09/OtK7/ROxf96reFt2rwyVWK/Wh4nMjnXq4k/qX7hSl3DgHkOVHCNGIPfk94Wf
 lBPhWSLoD2b3tqKHtRX7ZfRgawQAF3vbh6AJ7P3LwFNmtLXkvLWQbejsb7hS3BjecS9Th2p/ne
 eUzYQxFCxfJJmWId50y48T6Ae66wwJ+pKg0bp7pHsprZC8NMyaNbEuIGZeUrNjxnnh7DQqEK2R
 4B+6Wz5J/qoux55dx8h6nt2WEknxlUweYdgV3LIGofyJw0EYmi8tZH1jc+mT/yHvHZbzxheKt9
 N+Q=
X-SBRS: 2.7
X-MesageID: 649003
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,491,1549947600"; 
   d="scan'208";a="649003"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23778.53283.804039.753874@mariner.uk.xensource.com>
Date: Mon, 20 May 2019 17:04:51 +0100
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <7bea4485-b0da-ed92-336d-b2307c444cb1@arm.com>
References: <osstest-136385-mainreport@xen.org>
 <23778.33200.47146.497482@mariner.uk.xensource.com>
 <7bea4485-b0da-ed92-336d-b2307c444cb1@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [xen-4.11-testing test] 136385: regressions - FAIL
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SnVsaWVuIEdyYWxsIHdyaXRlcyAoIlJlOiBbeGVuLTQuMTEtdGVzdGluZyB0ZXN0XSAxMzYzODU6
IHJlZ3Jlc3Npb25zIC0gRkFJTCIpOgo+IEJlZm9yZSB0aGUgbGFzdCAyIGZsaWdodHMsIHRoZSBr
ZXJuZWwgd2FzIGNvbXBpbGVkIG5hdGl2ZWx5LiBOb3cgaXQgaXMgCj4gY3Jvc3MtY29tcGlsZWQg
b24geDg2IG1hY2hpbmUuIFNvIHRoZXJlIGFyZSBhIGRpZmZlcmVuY2UgaW4gdGhlIHdheSB0aGUg
a2VybmVsIAo+IGlzIGJ1aWx0LgoKVGhhdCBpcyBpbmRlZWQgc3VzcGljaW91cy4KCj4gQ291bGQg
d2UgdHJ5IGEgZmxpZ2h0IHdpdGgga2VybmVsIGJ1aWx0IGZyb20gdGhlIGN1YmlldHJ1Y2s/CgpJ
IGhhZCB0byBkbyBzb21lIHdvcmsgb24gdGhlIHRvb2xpbmcsIGJ1dCBJIHRoaW5rIEkgaGF2ZSB0
aGlzIHJ1bm5pbmcKbm93LiAgMTM2NjI2LzEzNjYyNy4gIEkgbWF5IG5lZWQgdG8gcmVzdGFydCBp
dC4uLgoKPiBPbiBhIHNpZGUgbm90ZSwgSSBub3RpY2VkIHRoYXQgdGhlIG5hbWUgb2YgdGhlIGZp
bGUgWzFdIGxlYWRzIHRvIHRoaW5rIGl0IGlzIGEgCj4gZ3ppcCwgYnV0IGl0IGlzIGFjdHVhbGx5
IGEgcGxhaW4gdGV4dC4KLi4uCj4gWzFdIAo+IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2pl
Y3Qub3JnL29zc3Rlc3QvbG9ncy8xMzYzODUvdGVzdC1hcm1oZi1hcm1oZi14bC1jcmVkaXQyL2N1
YmlldHJ1Y2stZ2xlaXplcy0tLXZhci1sb2cteGVuLWNvbnNvbGUtZ3Vlc3QtZGViaWFuLmd1ZXN0
Lm9zc3Rlc3QubG9nLmd6CgokIEhFQUQgJ2h0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qu
b3JnL29zc3Rlc3QvbG9ncy8xMzYzODUvdGVzdC1hcm1oZi1hcm1oZi14bC1jcmVkaXQyL2N1Ymll
dHJ1Y2stZ2xlaXplcy0tLXZhci1sb2cteGVuLWNvbnNvbGUtZ3Vlc3QtZGViaWFuLmd1ZXN0Lm9z
c3Rlc3QubG9nLmd6JwoyMDAgT0sKQ29ubmVjdGlvbjogY2xvc2UKRGF0ZTogTW9uLCAyMCBNYXkg
MjAxOSAxNjowMDozOCBHTVQKQWNjZXB0LVJhbmdlczogYnl0ZXMKRVRhZzogIjNmYmEtNTg5MmJk
NGE1ZThjNyIKU2VydmVyOiBBcGFjaGUvMi40LjI1IChEZWJpYW4pCkNvbnRlbnQtRW5jb2Rpbmc6
IHgtZ3ppcApDb250ZW50LUxlbmd0aDogMTYzMTQKQ29udGVudC1UeXBlOiBhcHBsaWNhdGlvbi94
LWd6aXAKTGFzdC1Nb2RpZmllZDogU2F0LCAxOCBNYXkgMjAxOSAxNjoxNzowNyBHTVQKQ2xpZW50
LURhdGU6IE1vbiwgMjAgTWF5IDIwMTkgMTY6MDA6MzggR01UCkNsaWVudC1QZWVyOiAyMDUuMjM3
Ljk4LjE0Njo4MApDbGllbnQtUmVzcG9uc2UtTnVtOiAxCgokCgpUaGlzIGlzIHdyb25nLiAgSXQg
aXMgc2F5aW5nIHRoYXQgaXQgaXMgZ29pbmcgdG8gc2VuZCBhIGd6aXBwZWQKZ3ppcGZpbGUuCgpU
aGUgb3NzdGVzdCBWTSBnZXRzIGl0IHJpZ2h0OgoKJCBIRUFEICdodHRwOi8vbG9jYWxob3N0Ojgw
ODIvfm9zc3Rlc3QvcHViL2xvZ3MvMTM2Mzg1L3Rlc3QtYXJtaGYtYXJtaGYteGwtY3JlZGl0Mi9j
dWJpZXRydWNrLWdsZWl6ZXMtLS12YXItbG9nLXhlbi1jb25zb2xlLWd1ZXN0LWRlYmlhbi5ndWVz
dC5vc3N0ZXN0LmxvZy5neicKMjAwIE9LCkNvbm5lY3Rpb246IGNsb3NlCkRhdGU6IE1vbiwgMjAg
TWF5IDIwMTkgMTY6MDI6MTAgR01UCkFjY2VwdC1SYW5nZXM6IGJ5dGVzCkVUYWc6ICIzZmJhLTU4
OTJiZDRhNWU4YzciClNlcnZlcjogQXBhY2hlLzIuNC4yNSAoRGViaWFuKQpDb250ZW50LUxlbmd0
aDogMTYzMTQKQ29udGVudC1UeXBlOiBhcHBsaWNhdGlvbi94LWd6aXAKTGFzdC1Nb2RpZmllZDog
U2F0LCAxOCBNYXkgMjAxOSAxNjoxNzowNyBHTVQKQ2xpZW50LURhdGU6IE1vbiwgMjAgTWF5IDIw
MTkgMTY6MDI6MTAgR01UCkNsaWVudC1QZWVyOiA6OjE6ODA4MgpDbGllbnQtUmVzcG9uc2UtTnVt
OiAxCgokCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
