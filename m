Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E35BA7E49F
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 23:10:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htIHB-0000d2-D1; Thu, 01 Aug 2019 21:06:17 +0000
Received: from mail6.bemta25.messagelabs.com ([195.245.230.106])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <prvs=1092e60ca=elnikety@amazon.com>)
 id 1htIH9-0000cx-LU
 for xen-devel@lists.xensource.com; Thu, 01 Aug 2019 21:06:15 +0000
Received: from [46.226.52.196] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-b.eu-west-1.aws.symcld.net id 67/F7-12406-644534D5;
 Thu, 01 Aug 2019 21:06:14 +0000
Authentication-Results: mx.messagelabs.com; spf=pass 
 (server-9.tower-284.messagelabs.com: domain of amazon.com designates 
 72.21.196.25 as permitted sender) smtp.mailfrom=amazon.com; dkim=pass 
 (good signature) header.i=@amazon.com header.s=amazon201209; dmarc=pass 
 (p=quarantine adkim=r aspf=r) header.from=amazon.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLKsWRWlGSWpSXmKPExsXiIXpEUtc1xDn
 WYNctfYt7U96zOzB6bO/bxR7AGMWamZeUX5HAmtG3cAFTwXb2isd3HrM2MDaydTFycbAIfGeW
 eHHvJ5DDwSEh4C/Rd4ATJC4kcJlRYtPCsywQzhtGifN35jBDOLsZJWaveMoI4exllFgy6y87h
 LOWUWLqnuNAPZwcbAK6EquWL2UBmSsioCzR9yEKJMws8JhF4vxNsBJhAUeJG9s/MkKUOEls7U
 qAMLMkNp6OB6lgEVCRuP5vKROIzStgK3Ft2wGog+awSZzquAo2hlMgUOL/jVNsIDajgJjE91N
 rmCBWiUvcejIfzJYQEJBYsuc8M4QtKvHy8T9WCFtH4uz1J4wQtoHE1qX7WCBsBYmdF6ewQczR
 kViw+xOUbSnx6kg/I4StLbFs4WtmiOMEJU7OfALWKwC0a8OrB+wTGGVnITljFpJRs5CMmoVk1
 CwkoxYwsq5itEgqykzPKMlNzMzRNTQw0DU0NNI1tLTQNbQw0kus0k3SSy3VLU8tLtE11EssL9
 YrrsxNzknRy0st2cQITBUpBce27WBcMOuN3iFGSQ4mJVHek3LOsUJ8SfkplRmJxRnxRaU5qcW
 HGGU4OJQkeEWDgXKCRanpqRVpmTnAtAWTluDgURLhtQVJ8xYXJOYWZ6ZDpE4xKkqJ8172AEoI
 gCQySvPg2mCp8hKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd4pQUBTeDLzSuCmvwJazAS0W
 JjVCWRxSSJCSqqBSW1mXWjkmjMavQ/lLVPdOR99rakIig1v0ttn5/bErKr/5Hq+xOS583VLJe
 NsTV+vl/BwO87GzLTyvxI314b1jtuU3gvYpEtobFGQCIhWlZZSEF1+83ldt97yp/cDl32In34
 1Wbq+9em+H0J2EcUyU/60/Slx+WWgwH1RO13/3x3+Cw8aAied8SqK/Vu9ZGldZ5LBnc4j+1Yk
 uEVZJr46PuHOzsmF3MKn/C4f+LR28raQbZc+T/FWyT7JWhkREJT87aMZk6KIafu7B5zWWk/UY
 0/cnMM9w+eTVbpR/hIl7kfKgveupMQneO06fttQqMYzZzVb+R6Z60ZX7h6Q/X1T5tP8Po73Vj
 pzJ6Z+UhNXYinOSDTUYi4qTgQAewB0gBAEAAA=
X-Env-Sender: prvs=1092e60ca=elnikety@amazon.com
X-Msg-Ref: server-9.tower-284.messagelabs.com!1564693572!732815!1
X-Originating-IP: [72.21.196.25]
X-SpamReason: No, hits=0.0 required=7.0 tests=newsletters: ,
 sa_preprocessor: VHJ1c3RlZCBJUDogNzIuMjEuMTk2LjI1ID0+IDE4NjQwNA==\n
X-StarScan-Received: 
X-StarScan-Version: 9.43.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6903 invoked from network); 1 Aug 2019 21:06:13 -0000
Received: from smtp-fw-2101.amazon.com (HELO smtp-fw-2101.amazon.com)
 (72.21.196.25)
 by server-9.tower-284.messagelabs.com with RC4-SHA encrypted SMTP;
 1 Aug 2019 21:06:13 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1564693573; x=1596229573;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=S366UfcGsaQH/KsJU3EO+GPd6wmOLiYt06tfbe8yowQ=;
 b=PFi2PIijtog0lRu8Fo9R/SMiEPw/C9Gi0Nkre671GSYVs/HppNmeLjgC
 kOIQbrfpnYUhHMY8MeStAx2G7vha04b1aWqAD7QLgHfV193dxV2ilEWtF
 FnchoMhXIWaBGCl2AerVHF9PDAUv9tKDCebxAOX/3JWESBOrKKYyXBSQ9 s=;
X-IronPort-AV: E=Sophos;i="5.64,335,1559520000"; d="scan'208";a="744771343"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1e-a70de69e.us-east-1.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 01 Aug 2019 21:06:10 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-a70de69e.us-east-1.amazon.com (Postfix) with ESMTPS
 id B121DA2413; Thu,  1 Aug 2019 21:06:06 +0000 (UTC)
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 1 Aug 2019 21:06:05 +0000
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13D03EUA002.ant.amazon.com (10.43.165.166) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 1 Aug 2019 21:06:05 +0000
Received: from EX13D03EUA002.ant.amazon.com ([10.43.165.166]) by
 EX13D03EUA002.ant.amazon.com ([10.43.165.166]) with mapi id 15.00.1367.000;
 Thu, 1 Aug 2019 21:06:05 +0000
From: "Elnikety, Eslam" <elnikety@amazon.com>
To: Ben Cotton <bcotton@redhat.com>
Thread-Topic: [Xen-devel] Criteria / validation proposal: drop Xen
Thread-Index: AQHVCdu6x2IGKoB7BEKKilfR7xIklqZ17lIAgEtNlYCABPRpAIAAGYNHgBL7kACACSYXAIAD9dsAgACXEYCAAE2PgA==
Date: Thu, 1 Aug 2019 21:06:04 +0000
Message-ID: <E2053A93-0EA4-4234-8D57-2FB63421FBEC@amazon.com>
References: <1499367541.22465.102.camel@fedoraproject.org>
 <20170706191317.GE21146@char.us.oracle.com>
 <1499370325.22465.107.camel@fedoraproject.org>
 <06A5F10A-88B7-440F-AADB-56A2F1704A86@xenproject.org>
 <c3fb1646ea39459200c925964fb46ec8a5c04470.camel@redhat.com>
 <081a209f86a08562e9f7a087ba434ad8b1b04309.camel@fedoraproject.org>
 <c230c496979d149d2663528defd7a15d52f7ce6a.camel@infradead.org>
 <CALeDE9Mn_Zd+gCrGHSCkQ8utJ4Hv0G=T=120++yZpRQF5F1sKA@mail.gmail.com>
 <87b8a119fbbd27dd706362e4e57e810cd88d0351.camel@fedoraproject.org>
 <64ed536563d83cdf164e87c044fecdbb75ba73f3.camel@fedoraproject.org>
 <CA+voJeUC1x53nDh8AMG=tW9AThD7Y-fiBMetTH_0+BTT0O=SHg@mail.gmail.com>
 <B807FFB7-A9B7-4858-B6DF-E07FF29C8E69@amazon.com>
 <CA+voJeWV00Dod-WsV3HRfrK-ZDDmqSPrhTYY5WzHjGDcLOyGjw@mail.gmail.com>
In-Reply-To: <CA+voJeWV00Dod-WsV3HRfrK-ZDDmqSPrhTYY5WzHjGDcLOyGjw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.63]
Content-ID: <58768E7CE9178C46969CE79DE39787FB@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] Criteria / validation proposal: drop Xen
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: For testing and quality
 assurance of Fedora releases <test@lists.fedoraproject.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>, Lars Kurth <lars.kurth.xen@gmail.com>,
 Fedora Cloud SIG <cloud@lists.fedoraproject.org>,
 Daniel Kiper <daniel.kiper@oracle.com>,
 "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>, Dario
 Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xensource.com" <xen-devel@lists.xensource.com>,
 Committers <committers@xenproject.org>, Peter Robinson <pbrobinson@gmail.com>,
 "MICHAEL A. YOUNG" <m.a.young@durham.ac.uk>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDEuIEF1ZyAyMDE5LCBhdCAxODoyNywgQmVuIENvdHRvbiA8YmNvdHRvbkByZWRoYXQu
Y29tPiB3cm90ZToKPiAKPiBPbiBUaHUsIEF1ZyAxLCAyMDE5IGF0IDM6MjcgQU0gRWxuaWtldHks
IEVzbGFtIDxlbG5pa2V0eUBhbWF6b24uY29tPiB3cm90ZToKPj4gCj4+IEJ1dCB0MyBpcyBub3Qg
WGVuLgo+PiAKPiBUaGF0J3MgYSBnb29kIHJlYXNvbiB0byBub3QgdXNlIGl0LiA6LSkgSSBwaWNr
ZWQgaXQgdG8gYmUgYSBzbWFsbCwKPiBjaGVhcCBpbnN0YW5jZSB0aGF0IHdvdWxkIHJlcHJlc2Vu
dCBhIHBvdGVudGlhbCB1c2UgY2FzZS4gSXMgdGhlIHQyCj4gZmFtaWx5IFhlbj8gT3IgdGhlIG01
PyBJIHRoaW5rIGl0IG1ha2VzIHNlbnNlIHRvIHdyaXRlIHRoZSByZXF1aXJlbWVudAo+IGFzICJ0
aGUgbGFzdGVzdCB2ZXJzaW9uIG9mIHRoZSBmb28gZmFtaWx5IiBqdXN0IHNvIHRoYXQgd2UncmUg
bm90Cj4gdXBkYXRpbmcgaXQgZXZlcnkgdGltZSBBV1MgYWRkcyBhIG5ldyB2ZXJzaW9uLiBTbyBJ
J2xsIGRlZmVyIHRvIHlvdSBvbgo+IHdoYXQncyB0aGUgYmVzdCBvcHRpb24gZm9yIHNtYWxsLWFu
ZC1YZW4uCj4gCgpHZW5lcmFsbHksIGRpZmZlcmVudCBmYW1pbGllcyByZXByZXNlbnQgZGlmZmVy
ZW50IHBvdGVudGlhbCB1c2UgY2FzZXMsIGJ1dCBvZiBjb3Vyc2UgSSB1bmRlcnN0YW5kIHRoZSBu
ZWVkIHRvIGlkZW50aWZ5IGEgc21hbGwsIGNoZWFwIHNldC4gQXJlIHdlIGxvb2tpbmcgdG8gY292
ZXIgbmV0L2Jsay1mcm9udCwgRU5BLCBhbmQgTlZNZT8gTWF5YmUgdDIubmFubyBhbmQgYzVkLmxh
cmdlPwoKPiAKPiBUaGFua3MsCj4gQkMKPiAKPiAtLSAKPiBCZW4gQ290dG9uCj4gSGUgLyBIaW0g
LyBIaXMKPiBGZWRvcmEgUHJvZ3JhbSBNYW5hZ2VyCj4gUmVkIEhhdAo+IFRaPUFtZXJpY2EvSW5k
aWFuYS9JbmRpYW5hcG9saXMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
