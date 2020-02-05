Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E27152733
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 08:49:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izFLr-0006Cq-DL; Wed, 05 Feb 2020 07:43:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AtEH=3Z=ts.fujitsu.com=dietmar.hahn@srs-us1.protection.inumbo.net>)
 id 1izFLp-0006Cl-4m
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 07:43:57 +0000
X-Inumbo-ID: 411c5434-47eb-11ea-a933-bc764e2007e4
Received: from mail1.bemta25.messagelabs.com (unknown [195.245.230.2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 411c5434-47eb-11ea-a933-bc764e2007e4;
 Wed, 05 Feb 2020 07:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ts.fujitsu.com;
 s=200619tsfj; t=1580888632; i=@ts.fujitsu.com;
 bh=RAqcCOLsbPun2ahZbDY7n2gzEQddhMH/FTED8HPw/n4=;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding:Content-Type;
 b=f1L4gfcOlX5hNI7E6/SkoADDfRmGVjajSPl/lIf+z2ZPMBmdgy0OnXbvtnUl6QpVu
 HMs+40XjVHNnn04BpgMYKDmsb6bbwMW9rs2gmopF/2eTK10Xc67pYYwhag4e+FkcVo
 e+IOA0O4W1tjIunHUtYRRysHb9CNT757Gh1x4D2i4bvzQ8OuF+VTi5ssj+Tee0YFIj
 /cyHKsDcAYjYUqho05cCvpAlSkREeos0v90GH15NrOHIC9zReltqeBjpRAZoTdd1Pb
 sl2FFa6mFwKkpDr7hptqX9jLjI1I37RnRFUPZ3ElRH6yxfa82EBWassSvnAvl/9ylY
 OxpAIuyg4Lnbg==
Received: from [100.112.195.156] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-a.eu-west-1.aws.symcld.net id A2/4D-11859-7327A3E5;
 Wed, 05 Feb 2020 07:43:51 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRWlGSWpSXmKPExsViZ8MRqmteZBV
 nMGmXqsXqTdPZLL5vmczkwOTxevIERo/DH66wBDBFsWbmJeVXJLBmfP0TXTBJsOLv1MdsDYyN
 fF2MXBxCArMZJRZduMEE4axglHj6ZRd7FyMnB5uAgcSuV4eYuxg5OEQE9CRajuiBhJkFXCVWP
 nzKAmILCwRLbGoCKefgYBFQlXizKQEkzCtgKPGj4T1YCaeAnUTbof/MEOM7GSX2vJzNAlEkKH
 Fy5hMWiJnyEh2XG1khbB2JBbs/sU1g5J2FpGwWkrJZSMoWMDKvYrRIKspMzyjJTczM0TU0MNA
 1NDTSNbQ00jUyNtFLrNJN1Est1S1PLS7RNdRLLC/WK67MTc5J0ctLLdnECAzElIIDr3Ywnlz7
 Xu8QoyQHk5Io76UCqzghvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErxueUA5waLU9NSKtMwcYFTAp
 CU4eJREeJeDtPIWFyTmFmemQ6ROMSpKifMKFQIlBEASGaV5cG2wSLzEKCslzMvIwMAgxFOQWp
 SbWYIq/4pRnINRSZj3Och4nsy8Erjpr4AWMwEtlva2AFlckoiQkmpgEne4eMT7MO+n+uTSDI9
 fX43Mk3Q3pp7aLW3urVj0bcf9bnF/razwWcWpk//yzeJawChacHxK36QaJUMLrQfOmQ65x5TP
 Bzt1sp32lHTOO7x4p9PNux9ZJq7aY7Q3XiP348+k3dNaeta0Kz2xXb7y8Wvxwkcf9uRl+XTeP
 2U+qYnX6VNwKjv3BesNJTWZdddvch9NWmrdk/Lqes39qOfP022Fbwom2Zn0LlojsuusY0bALT
 6Dp7ePGZecca92+aS3Puhv1hLJ0LXqQdtaZVbHn3adPuN72oS9S5c/evjl5lId+X53pvS0Jf7
 u8j9faCxImDvhmLF+c9bko9s3vo1p959w6ZzA38tWORkf3N48U2Ipzkg01GIuKk4EAFO4cQY/
 AwAA
X-Env-Sender: dietmar.hahn@ts.fujitsu.com
X-Msg-Ref: server-16.tower-265.messagelabs.com!1580888631!48961!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.25; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2155 invoked from network); 5 Feb 2020 07:43:51 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
 by server-16.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Feb 2020 07:43:51 -0000
Received: from sanpedro.mch.fsc.net ([172.17.20.6])
 by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with SMTP id 0157hjCp017424;
 Wed, 5 Feb 2020 07:43:45 GMT
Received: from amur.mch.fsc.net (amur.mch.fsc.net [10.172.102.28])
 by sanpedro.mch.fsc.net (Postfix) with ESMTP id 5C5139D008B7;
 Wed,  5 Feb 2020 08:43:37 +0100 (CET)
From: Dietmar Hahn <dietmar.hahn@ts.fujitsu.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Date: Wed, 05 Feb 2020 08:43:37 +0100
Message-ID: <4298129.ob0f4fAMBq@amur.mch.fsc.net>
In-Reply-To: <4c655f6c-3ffd-db48-0d7f-e5e44765a259@citrix.com>
References: <2704996.bt05f1kDAn@amur.mch.fsc.net>
 <3076850.sjLd3Rl8CD@amur.mch.fsc.net>
 <4c655f6c-3ffd-db48-0d7f-e5e44765a259@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] Kdump doesn't work when running with xen on newer
 hardware
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW0gRGllbnN0YWcsIDQuIEZlYnJ1YXIgMjAyMCwgMTU6MTI6MjggQ0VUIHNjaHJpZWIgSWdvciBE
cnV6aGluaW46Cj4gT24gMDQvMDIvMjAyMCAxNDowNywgRGlldG1hciBIYWhuIHdyb3RlOgo+ID4g
QW0gRnJlaXRhZywgMzEuIEphbnVhciAyMDIwLCAyMjo1OToxOSBDRVQgc2NocmllYiBJZ29yIERy
dXpoaW5pbjoKPiA+PiBPbiAzMC8wMS8yMDIwIDEzOjAzLCBEaWV0bWFyIEhhaG4gd3JvdGU6Cj4g
Pj4+IEhpLAo+ID4+Pgo+ID4+PiB3ZSB1c2UgU0xFUzEyIHdpdGgga2VybmVsLWRlZmF1bHQtNC4x
Mi4xNC05NS40NS4xLng4Nl82NCBhbmQgCj4gPj4+IHhlbi00LjExLjNfMDItMi4yMC4xLng4Nl82
NAo+ID4+Pgo+ID4+PiBUaGUgZHVtcCBrZXJuZWwgZG9lc24ndCBzdGFydCBhZnRlciAiZWNobyBj
ID4gL3Byb2Mvc3lzcnFfdHJpZ2dlciIuCj4gPj4+IExhc3QgbWVzc2FnZXMgb24gY29uc29sZSBh
cmU6Cj4gPj4+IFsgIDM4NS43MTc1MzJdIEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBGYXRh
bCBleGNlcHRpb24KPiA+Pj4gWyAgMzg1LjczNDU2NV0gS2VybmVsIE9mZnNldDogZGlzYWJsZWQK
PiA+Pj4gKFhFTikgSGFyZHdhcmUgRG9tMCBjcmFzaGVkOiBFeGVjdXRpbmcga2V4ZWMgaW1hZ2Ug
b24gY3B1NTgKPiA+Pj4gKFhFTikgU2hvdCBkb3duIGFsbCBDUFVzCj4gPj4+Cj4gPj4+IEFmdGVy
IGEgc2hvcnQgdGltZSBhIHJlYm9vdCBpcyBpbml0aWF0ZWQuCj4gPj4+IFdpdGhvdXQgeGVuIHRo
ZSBrZHVtcCB3b3Jrcy4KPiA+Pj4KPiA+Pj4gV2Ugc2VlIHRoaXMgYmVoYXZpb3VyIG9ubHkgb24g
bmV3ZXIgaGFyZHdhcmUsIGZvciBleGFtcGxlIGEgc2VydmVyIHdpdGgKPiA+Pj4gSW50ZWwoUikg
WGVvbihSKSBHb2xkIDYyNDIgQ1BVIEAgMi44MEdIego+ID4+Pgo+ID4+PiBJIGJ1aWx0IHRoZSBm
cmVzaCByZWxlYXNlZCB4ZW4tNC4xMyBteXNlbGYgYW5kIHRyaWVkIGl0IGJ1dCB0aGlzIGRvZXNu
J3QgaGVscC4KPiA+Pj4KPiA+Pj4gSSB0cmllZCB4MmFwaWM9b2ZmIG9uIHRoZSB4ZW4gc2lkZSBh
bmQgbm94MmFwaWMgb24gdGhlIGxpbnV4IHNpZGUgYnV0IG5vIHN1Y2Nlc3MuCj4gPj4KPiA+PiBT
dGFydGluZyBmcm9tIFhlbiA0LjEyIHdlIGtlZXAgSU9NTVUgZW5hYmxlZCBkdXJpbmcga2V4ZWMg
dHJhbnNpdGlvbgo+ID4+IHdoaWNoIHJlc29sdmVkIHRoZSBwcm9ibGVtIHlvdSdyZSBkZXNjcmli
aW5nLiBCdXQgeW91IGFsc28gbmVlZCB0byBtYWtlCj4gPj4gc3VyZSBJT01NVSBpcyBlbmFibGVk
IGluIHlvdXIga2V4ZWMga2VybmVsICh3aGljaCBJIHRoaW5rIGlzIG5vdyB0aGUKPiA+PiBkZWZh
dWx0IGZvciBtb3N0IGRpc3Ryb3MpLiBZb3UgY2FuIHN0aWxsIHRyeSB0byB3b3JrYXJvdW5kIHRo
ZSBpc3N1ZQo+ID4+IHlvdSdyZSBzZWVpbmcgb24gNC4xMSBieSB1c2luZyAiaW9tbXU9ZG9tMC1w
YXNzdGhvdWdoIiBYZW4gb3B0aW9uLgo+ID4gCj4gPiBJIGFkZGVkICJpb21tdT1kb20wLXBhc3N0
aHJvdWdoIiB0byB0aGUgeGVuLTQuMTEgY29tbWFuZCBsaW5lIGJ1dCBubyBzdWNjZXNzLgo+ID4g
RnVydGhlciBJIGFkZGVkIGVhcmx5cHJpbnRrPS4uLiB0byB0aGUgdGhlIGtkdW1wIGtlcm5lbCBh
bmQgSSBjb3VsZCBzZWUgdGhlCj4gPiBkdW1wIGtlcm5lbCBzdGFydGVkIGFuZCBvbmx5IG9uZSBt
ZXNzYWdlIGZyb20gZXh0cmFjdF9rZXJuZWwoKQo+ID4gd2FzIHByaW50ZWQuIFRoZW4gdGhlIHJl
Ym9vdCBmb2xsb3dlZC4KPiA+IAo+ID4gQmVjYXVzZSBJJ20gbm90IHRoYXQgZmFtaWxpYXIgd2l0
aCB0aGlzIHBhcnQgb2YgSSB3b3VsZCBhcHByZWNpYXRlIGhpbnRzIHdoZXJlCj4gPiB0byBkaWcg
ZGVlcGVyLgo+IAo+IENvdWxkIHlvdSB0cnkgdG8gZGlzYWJsZSBJT01NVSBjb21wbGV0ZWx5IGlu
IGRpYWdub3N0aWMgcHVycG9zZXM6Cj4gImlvbW11PW9mZiB4MmFwaWM9b2ZmIj8gSWYgdGhhdCBo
ZWxwcyAtIGl0J3Mgc3RpbGwgdGhlIHNhbWUgaXNzdWUgSSdtCj4gcmVmZXJyaW5nIHRvLiBDb3Vs
ZCB5b3UgcG9zdCB5b3VyIGN1cnJlbnQgWGVuIGNtZGxpbmU/CgpJIHRyaWVkIHlvdXIgYWR2aWNl
LCBidXQgaXQgZG9lc24ndCBoZWxwOgppb21tdT1vZmYgeDJhcGljPW9mZiB2Z2E9Z2Z4LTEwMjR4
NzY4eDE2IGNyYXNoa2VybmVsPTI1Mk08NEcgY29uc29sZT1jb20xIGNvbTE9Mzg0MDAgc3luY19j
b25zb2xlCgpEaWV0bWFyLgoKPiBJZ29yCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
