Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7942AEF6CA
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 09:04:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRtmd-00034B-O5; Tue, 05 Nov 2019 08:01:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mVjF=Y5=intel.com=jinwenx.zhang@srs-us1.protection.inumbo.net>)
 id 1iRtmd-000342-1O
 for xen-devel@lists.xen.org; Tue, 05 Nov 2019 08:01:47 +0000
X-Inumbo-ID: 816da865-ffa2-11e9-a192-12813bfff9fa
Received: from mga04.intel.com (unknown [192.55.52.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 816da865-ffa2-11e9-a192-12813bfff9fa;
 Tue, 05 Nov 2019 08:01:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Nov 2019 00:01:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,270,1569308400"; d="scan'208";a="205430683"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga006.jf.intel.com with ESMTP; 05 Nov 2019 00:01:42 -0800
Received: from fmsmsx154.amr.corp.intel.com (10.18.116.70) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 5 Nov 2019 00:01:42 -0800
Received: from shsmsx153.ccr.corp.intel.com (10.239.6.53) by
 FMSMSX154.amr.corp.intel.com (10.18.116.70) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 5 Nov 2019 00:01:42 -0800
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.213]) by
 SHSMSX153.ccr.corp.intel.com ([169.254.12.215]) with mapi id 14.03.0439.000;
 Tue, 5 Nov 2019 16:01:40 +0800
From: "Zhang, JinwenX" <jinwenx.zhang@intel.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [BUG] Xen 4.13 rc1 can not boot up with new
 Domain0 kernel(linux5.4.0-rc3)
Thread-Index: AdWPlSUN+UruDO8oTamJhf4CzsaWBP//0zOA//efarA=
Date: Tue, 5 Nov 2019 08:01:39 +0000
Message-ID: <14DE39AD90EE4549A78D07880F9625AE0B40A79E@SHSMSX101.ccr.corp.intel.com>
References: <14DE39AD90EE4549A78D07880F9625AE0B40724C@SHSMSX101.ccr.corp.intel.com>
 <874e5df1-9f77-58c0-2669-cf468752dd18@suse.com>
In-Reply-To: <874e5df1-9f77-58c0-2669-cf468752dd18@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYTVjNTljODgtYTgyOC00NWMwLWFjYTgtNjIyYWEyMGMzYjYyIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiaDJoNnNyN0VqR0hKdDFOUXp0NWU5b3NYOFFocUJlTzdhZHZmeVBNSHpBdlpxVHFMcTJVbjIzTmdYaFVpZHlIVCJ9
x-ctpclassification: CTP_NT
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [BUG] Xen 4.13 rc1 can not boot up with new Domain0
 kernel(linux5.4.0-rc3)
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
Cc: Juergen Gross <jgross@suse.com>, "Hao, Xudong" <xudong.hao@intel.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiA+IEJ1ZyBkZXRhaWxlZCBkZXNjcmlwdGlvbjoKPiA+IC0tLS0tLS0tLS0tLS0tLS0KPiA+IENh
biBub3QgYm9vdCB1cCB4ZW4gd2l0aCBuZXcgRG9tYWluMCBrZXJuZWwobGludXg1LjQuMC1yYzMp
Cj4gPgo+ID4gRW52aXJvbm1lbnQgOgo+ID4gLS0tLS0tLS0tLS0tLS0tLQo+ID4gSFc6IENhc2Nh
ZGUgTGFrZSBzZXJ2ZXIKPiA+IFhlbjogWEVOIDQuMTMuMHJjMQo+ID4gRG9tMDogTGludXggNS40
LjAtcmMzCj4gPgo+ID4gUmVwcm9kdWNlIHN0ZXBzOgo+ID4gLS0tLS0tLS0tLS0tLS0tLQo+ID4g
MS4gaW5zdGFsbCBYZW4gYW5kIGJ1aWxkIERvbTAga2VybmVsKDUuNC4wLXJjMykgMi4gcmVzdGFy
dCBob3N0Cj4gPiBzZXJ2ZXIoY2FuIG5vdCBib290IHVwKQo+ID4KPiA+IEN1cnJlbnQgcmVzdWx0
Ogo+ID4gLS0tLS0tLS0tLS0tLS0tLQo+ID4gQ2FuIG5vdCBib290IHVwIGhvc3QKPiAKPiBUaGUg
d2F5IHlvdSB3b3JkIHRoaW5ncywgeW91IHNlZW0gdG8gc3VzcGVjdCBhbiBpc3N1ZSBpbiBYZW4u
IFRoZSBsb2cKPiB5b3UndmUgcHJvdmlkZWQgc3VnZ2VzdHMgYSBMaW51eCBrZXJuZWwgc2lkZSBp
c3N1ZSB0aG91Z2guCj4gQ291bGQgeW91IGNsYXJpZnkgdGhhdCBpbmRlZWQgdGhpcyBpcyBhbiBp
c3N1ZSB3aXRoIFhlbiA0LjEzIFJDMSwgaS5lLiB0aGF0IHRoZQo+IHNhbWUgaXNzdWUgZG9lc24n
dCBvY2N1ciB3aXRoIG9sZGVyIFhlbiwgZS5nLgo+IDQuMTIuMT8KClVwZGF0ZS4KV2UgdGVzdCBY
ZW4gNC4xMy4wcmMxIHdpdGggTGludXggNS40LjAtcmM2IERvbTAsIHRoaXMgcHJvYmxlbSBkaXNh
cHBlYXJlZC4KCkJlc3QgUmVnYXJkcywKSmlud2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
