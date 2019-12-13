Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7217E11E2D2
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 12:31:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifj7a-0002dA-Sv; Fri, 13 Dec 2019 11:28:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HO2F=2D=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ifj7a-0002d5-5K
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 11:28:34 +0000
X-Inumbo-ID: ad382302-1d9b-11ea-88e7-bc764e2007e4
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ad382302-1d9b-11ea-88e7-bc764e2007e4;
 Fri, 13 Dec 2019 11:28:25 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id z3so6280558wru.3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Dec 2019 03:28:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WfAj24bE/UUJYl0jhbkU/+sMav5rEJs26SDhkihtjtE=;
 b=g+VYDO9/YcLMrRib5fa8cZYnSnMOILMZ99Vlw2YqM79shFkDu/aMsCVMv2ey/LPbBo
 DR3asqbbmSXwyLkbkz4GtGhy4uNMFo4aFB4giHmL7K3Fes3+/scxGz97OaaoaWocVjYz
 ZaXTw+Sr1ItyVpyAKTMPu97BIAjkeE/KEb1tWp05gV40u96hZ1g4XUXhTGSgK9a78RyR
 3hGLuUpXrfX3VRF3pLvokEtTk1n7eSjfhqLoP5C+30Wtds0QaiZr0bWVBy85QNE95Cuv
 9EHdmPlJ0HglZe9sOWQl41jx5cck2vfGQdykuqqOsLTvIqHP4iZbX14UysZ5GTIPQPR7
 5f1g==
X-Gm-Message-State: APjAAAVt4ofRN8LhwbbqGHeDPwjOyvWOhUokR0sdsPEUj8x1XWZhpLz+
 7Kwm9OT+ARpkMV3zcVfY3H0=
X-Google-Smtp-Source: APXvYqxFwmW4BF4TCUD6HiLI1lyh6z2YAdakHpG1ouqB7sYD6kWNXPdcMRvChaofbIoVemqsgoXFnQ==
X-Received: by 2002:adf:d183:: with SMTP id v3mr12242883wrc.180.1576236504821; 
 Fri, 13 Dec 2019 03:28:24 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-224.amazon.com.
 [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id a133sm821397wme.29.2019.12.13.03.28.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2019 03:28:24 -0800 (PST)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <osstest-144736-mainreport@xen.org>
 <e05a3bc4-2c1d-7e71-af42-d6362c4f6d07@suse.com>
 <6ea2af3c-b277-1118-7c83-ebcb0809d449@xen.org>
 <880fed58-f67c-3f6c-134f-f370bdffef32@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2f0bb705-166e-f453-de51-2a218b3365cf@xen.org>
Date: Fri, 13 Dec 2019 11:28:23 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <880fed58-f67c-3f6c-134f-f370bdffef32@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [xen-4.13-testing test] 144736: regressions - FAIL
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxMy8xMi8yMDE5IDExOjI0LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+IE9uIDEzLjEyLjE5
IDEyOjE0LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpIEp1ZXJnZW4sCj4+Cj4+IE9uIDEzLzEy
LzIwMTkgMDg6MzEsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+PiBPbiAxMi4xMi4xOSAyMzozNSwg
b3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyb3RlOgo+Pj4+IGZsaWdodCAxNDQ3MzYgeGVuLTQuMTMt
dGVzdGluZyByZWFsIFtyZWFsXQo+Pj4+IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qu
b3JnL29zc3Rlc3QvbG9ncy8xNDQ3MzYvCj4+Pj4KPj4+PiBSZWdyZXNzaW9ucyA6LSgKPj4+Pgo+
Pj4+IFRlc3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAo+Pj4+IGlu
Y2x1ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgo+Pj4+IMKgIHRlc3QtYXJtNjQt
YXJtNjQteGwtY3JlZGl0McKgwqAgNyB4ZW4tYm9vdMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGZhaWwgCj4+Pj4gUkVHUi4gdnMuIDE0NDY3Mwo+Pj4KPj4+IExvb2tpbmcgaW50byB0
aGUgc2VyaWFsIGxvZyB0aGlzIGxvb2tzIGxpa2UgYSBoYXJkd2FyZSBwcm9ibGVtIHRvIG1lLgo+
Pgo+PiBMb29raW5nIGF0IFsxXSwgdGhlIGJvYXJkIHdlcmUgYWJsZSB0byBwaWNrIHVwIG5ldyBq
b2IuIFNvIEkgd291bGQgCj4+IGFzc3VtZSB0aGlzIGp1c3QgYSB0ZW1wb3JhcnkgZmFpbHVyZS4K
Pj4KPj4gQU1EIFNlYXR0bGUgYm9hcmRzIChsYXh0b24qKSBhcmUga25vd24gdG8gZmFpbCBib290
aW5nIHRpbWUgdG8gdGltZSAKPj4gYmVjYXVzZSBvZiBQQ0kgdHJhaW5pbmcgaXNzdWUuIFdlIGhh
dmUgd29ya2Fyb3VuZCBmb3IgaXQgKGludm9sdmluZyAKPj4gbG9uZ2VyIHBvd2VyIGN5Y2xlKSBi
dXQgdGhpcyBpcyBub3QgMTAwJSByZWxpYWJsZS4KPiAKPiBJIGd1ZXNzIHJlcGVhdGluZyB0aGUg
cG93ZXIgY3ljbGUgc2hvdWxkIHdvcmssIHRvbyAoZXNwZWNpYWxseSBhcyB0aGUKPiBuZXcgam9i
IGRpZCB3b3JrIGFzIHlvdSBzYWlkKT8KV2VsbCwgaG93IGRvIHlvdSBkZWZpbmUgd2hldGhlciB0
aGlzIGlzIHN0dWNrIGJlY2F1c2Ugb2YgYW4gaGFyZHdhcmUgCmZhaWx1cmUgb3IgYmVjYXVzZSBY
ZW4gY3Jhc2g/CgpCdXQgd2l0aCB0aGUgY3VycmVudCB3b3JrYXJvdW5kLCB3ZSBhbHJlYWR5IGhh
dmUgbGltaXRlZCBmYWlsdXJlLiBTbyBJIApkb24ndCB0aGluayBpdCBpcyB3b3J0aCB0aGUgdHJv
dWJsZSB0byB0cnkgcG93ZXIgY3ljbGluZyBhZ2Fpbi4KCj4gCj4+Cj4+Pgo+Pj4gSWFuLCBkbyB5
b3UgYWdyZWU/Cj4+Pgo+Pj4+IMKgIHRlc3QtYXJtaGYtYXJtaGYteGwtdmhkwqDCoMKgwqDCoCAx
OCBsZWFrLWNoZWNrL2NoZWNrwqDCoMKgwqDCoMKgwqDCoCBmYWlsIAo+Pj4+IFJFR1IuIHZzLiAx
NDQ2NzMKPj4+Cj4+PiBUaGF0IG9uZSBpcyBzdHJhbmdlLiBBIHFlbXUgcHJvY2VzcyBzZWVtcyB0
byBoYXZlIGhhdmUgZGllZCBwcm9kdWNpbmcKPj4+IGEgY29yZSBmaWxlLCBidXQgSSBjb3VsZG4n
dCBmaW5kIGFueSBsb2cgY29udGFpbmluZyBhbnkgb3RoZXIgaW5kaWNhdGlvbgo+Pj4gb2YgYSBj
cmFzaGVkIHByb2dyYW0uCj4+Cj4+IEkgaGF2ZW4ndCBmb3VuZCBhbnl0aGluZyBpbnRlcmVzdGlu
ZyBpbiB0aGUgbG9nLiBASWFuIGNvdWxkIHlvdSBzZXQgdXAgCj4+IGEgcmVwcm8gZm9yIHRoaXM/
Cj4+Cj4+IEZvciB0aGUgZnV0dXJlLCBpdCB3b3VsZCBiZSB3b3J0aCBjb25zaWRlcmluZyB0byBj
b2xsZWN0IGNvcmUgZmlsZXMuCj4gCj4gT1NTdGVzdCBkb2VzOgo+IAo+IGh0dHA6Ly9sb2dzLnRl
c3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDQ3MzYvdGVzdC1hcm1oZi1hcm1o
Zi14bC12aGQvY3ViaWV0cnVjay1tZXR6aW5nZXItLS12YXItY29yZS0xNTc2MTQ3MjgwLjE5Nzku
cWVtdS1zeXN0ZW0taTM4LmNvcmUuZ3ogCgpEYW0sIEkgZGlkbid0IHNwb3QgaXQuIFNvcnJ5IGZv
ciB0aGUgbm9pc2UuCgpJIHdpbGwgaGF2ZSBhIGxvb2suCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdy
YWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
