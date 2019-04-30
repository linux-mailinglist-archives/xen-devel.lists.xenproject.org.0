Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFD4FB75
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 16:28:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLTi6-0007Hz-II; Tue, 30 Apr 2019 14:26:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=s5V/=TA=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hLTi5-0007Hq-1x
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 14:26:17 +0000
X-Inumbo-ID: e9e53218-6b53-11e9-bc11-3318b1410715
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e9e53218-6b53-11e9-bc11-3318b1410715;
 Tue, 30 Apr 2019 14:26:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C730580D;
 Tue, 30 Apr 2019 07:26:15 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D05AC3F719;
 Tue, 30 Apr 2019 07:26:14 -0700 (PDT)
To: Ian Jackson <ian.jackson@citrix.com>
References: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
 <fa02ed11-5bb4-d324-b9a5-a019c2b696d8@arm.com>
 <23751.3672.258243.563470@mariner.uk.xensource.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <d8da89e4-a9b1-9401-b4a3-065a53d7ac52@arm.com>
Date: Tue, 30 Apr 2019 15:26:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <23751.3672.258243.563470@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [OSSTEST PATCH 00/21] Abandon jobs which are
 unreasonably delaying their flight
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
 Stefano Stabellini <sstabellini@kernel.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Lars Kurth <lars.kurth@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSWFuLAoKT24gMjkvMDQvMjAxOSAxNTo0NiwgSWFuIEphY2tzb24gd3JvdGU6Cj4gSnVsaWVu
IEdyYWxsIHdyaXRlcyAoIlJlOiBbT1NTVEVTVCBQQVRDSCAwMC8yMV0gQWJhbmRvbiBqb2JzIHdo
aWNoIGFyZSB1bnJlYXNvbmFibHkgZGVsYXlpbmcgdGhlaXIgZmxpZ2h0Iik6Cj4+IEFzIHdlIGRp
c2N1c3NlZCBvbiBJUkMsIEkgdW5kZXJzdGFuZCB0aGlzIHdpbGwgaGF2ZSBhbiBpbXBhY3Qgb24g
QXJtMzIKPj4gdGVzdGluZy4gRG8geW91IGhhdmUgYW4gZXN0aW1hdGUgaG93IGxpa2VseSB0aGUg
dGVzdHMgd2lsbCBiZSBza2lwcGVkPwo+IAo+IE1hbnksIG1heWJlIG1vc3QuICBWZXJ5IGxpa2Vs
eSB0aGUgc21va2UgdGVzdHMgd2lsbCBjb250aW51ZSB0byBydW4uCj4gCj4+IEkgYW0gd29uZGVy
aW5nIHdoZXRoZXIgd2Ugc2hvdWxkIGRpc2N1c3MgdG8gcmVkdWNlIHRoZSBudW1iZXIgb2YKPj4g
dGVzdGluZ3MgZG9uZSBvbiBBcm0zMi4gV2UgZGlkIHRoYXQgaW4gdGhlIHBhc3Qgb24gQXJtNjQg
d2hlbiB3ZSB3ZXJlCj4+IHN0cnVnZ2xlIHdpdGggYnJva2VuIGxheHRvbjAvbGF4dG9uMS4KPiAK
PiBUaGF0IGlzIGEgc2Vuc2libGUgc3VnZ2VzdGlvbiBidXQgYmVmb3JlIHdlIGRvIHRoYXQga2lu
ZCBvZiBtYW51YWwKPiByZWJhbGFuY2luZyBJIHdvdWxkIGxpa2UgdG8gdHJ5IG1vdmluZyBhdCBs
ZWFzdCB0aGUga2VybmVsIGJ1aWxkcywgc28KPiB0aGV5IHJ1biBhcyBhbWQ2NCBjcm9zcyBidWls
ZHMuICBJIHRoaW5rIHRoYXQgd2lsbCBmcmVlIHVwIGEgbG90IG9mCj4gY2FwYWNpdHkuCj4gCj4g
SW4gdGhlIG1lYW50aW1lLCBhcmUgeW91IGhhcHB5IHdpdGggbWUgcHVzaGluZyB0aGlzIHNlcmll
cyB0byBvc3N0ZXN0ID4gcHJldGVzdCBhdCBzb21lIHBvaW50IHdoZW4gY29udmVuaWVudCA/CgpJ
IGFtIGhhcHB5IHdpdGggdGhhdC4gTGV0J3Mgc2VlIGhvdyBtdWNoIHRlc3RzIHdpbGwgZ2V0IGRy
b3BwZWQgb24gQXJtMzIgOikuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
