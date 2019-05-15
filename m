Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 624B71EBDC
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 12:11:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQqqX-00048j-AC; Wed, 15 May 2019 10:09:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0eB+=TP=citrix.com=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQqqV-00048V-Ld
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 10:09:11 +0000
X-Inumbo-ID: 7a1b378c-76f9-11e9-9fcc-1ff7612eea13
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7a1b378c-76f9-11e9-9fcc-1ff7612eea13;
 Wed, 15 May 2019 10:09:08 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=wei.liu2@citrix.com;
 spf=SoftFail smtp.mailfrom=wei.liu2@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 wei.liu2@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa4.hc3370-68.iphmx.com: domain of
 wei.liu2@citrix.com is inclined to not designate 23.29.105.83
 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="wei.liu2@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 mx include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 include:_spf.salesforce.com ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="wei.liu2@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: DS6zvdoHg/I/hpdY8PLznQbWaCZeN4CGLwFuSRS88LHBriUML2vh0t89Crzxqr1NcFV/RJKpOs
 f5Rxw1VyV+btjTGCLhYqWVbdJsZnNFM6ypbaLTqBGtJHYvlH3JxiSnaM9rHjK273GoT1BFRpsf
 +3s3PkurUExHlwsbnV1Jhv4iC1qYKE/k5hgE5jjx4Gu7dRTY4fvGL+1Y9tZgTVuHctkwDEgOsC
 zKBYkOFo7bBJPrvOE/v5jo6M7+yf9Ese/Eb/47fSPMJunEP9OlMUGWCsU6J/2cGzEL674jsuNy
 dOE=
X-SBRS: 2.7
X-MesageID: 456726
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,472,1549947600"; 
   d="scan'208";a="456726"
Date: Wed, 15 May 2019 11:09:05 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <20190515100905.GN2798@zion.uk.xensource.com>
References: <20190515100723.8269-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190515100723.8269-1-ian.jackson@eu.citrix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [OSSTEST PATCH] cr-daily-branch: seabios: "usually"
 use xen-tested-master
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMTE6MDc6MjNBTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gVGhpcyBicmFuY2ggaXMgc3VwcG9zZWQgdG8gYmUgc3VpdGFibGUgZm9yIGFsbCB2ZXJz
aW9ucyBvZiBYZW4uCj4gQ29udmVyc2VseSwgb2xkZXIgdmVyc2lvbnMgb2Ygc2VhYmlvcyBkbyBu
b3QgYnVpbGQgb24gbmV3ZXIKPiBjb21waWxlcnMgKGFzIHByb3ZpZGVkLCBlZywgaW4gc3RyZXRj
aCkuCj4gCj4gU28sIGZvciAiYnJhbmNoZXMiIG90aGVyIHRoYW4geGVuLXVuc3RhYmxlIGFuZCB4
ZW4tdW5zdGFibGUtc21va2UsIHVzZQo+IHRoZSB1c3VhbCAiZGV0ZXJtaW5lX3ZlcnNpb24iIG1h
Y2hpbmVyeSwgd2hpY2ggd2lsbCBzZWxlY3QKPiB4ZW4tdGVzdGVkLW1hc3RlciBmb3IgYnJhbmNo
ZXMgb3RoZXIgdGhhbiB0aGUgb3ZtZiBicmFuY2ggaXRzZWxmLgo+IAo+IE5vIGNoYW5nZSBmb3Ig
dGhlIHNlYWJpb3MgImJyYW5jaCIsIG5vciBmb3IgeGVuLXVuc3RhYmxlKi4gIFRoZSBlZmZlY3QK
PiBpcyB0byBzd2l0Y2ggeGVuLSotdGVzdGluZywgcWVtdS0qLCBsaW51eC0qLCBldGMuLCB0byBh
bGwgdXNlIG92bWYKPiB4ZW4tdGVzdGVkLW1hc3Rlci4KPiAKPiBUaGlzIGNvbW1pdCBpcyBpZGVu
dGljYWwgdG8gdGhlIGNvcnJlc3BvbmRpbmcgb25lIHJlbGF0aW5nIHRvIG92bWYsCj4gICBjOWQx
ZTU4OTZmZTIyNDZkMTdkNDM2ZjA1YTk5NjBhNjZlYTU1NDI2Cj4gICBjci1kYWlseS1icmFuY2g6
IG92bWY6ICJ1c3VhbGx5IiB1c2UgeGVuLXRlc3RlZC1tYXN0ZXIKPiBtdXRhbmRpcyBtdXRhbmRp
LiAgVmVyaWZpZWQgd2l0aAo+ICAgZGlmZiAtdSA8KGdpdC1zaG93IGM5ZDFlNTg5NmZlMjI0NmQx
N2Q0MzZmMDVhOTk2MGE2NmVhNTU0MjYpIDwoZ2l0LWRpZmYgfCBzZWQgJ3MvU0VBQklPUy9PVk1G
L2c7IHMvc2VhYmlvcy9vdm1mL2cnKSB8bGVzcwo+IAo+IEEgY3Vyc29yeSBleGFtaW5hdGlvbiBv
ZiB0aGUgc3RhbmRhbG9uZS1nZW5lcmF0ZS1kdW1wLWZsaWdodC1ydW52YXJzCj4gb3V0cHV0IHJl
dmVhbGVkIHdoYXQgc2VlbWVkIHRvIGJlIHRoZSBleHBlY3RlZCBjaGFuZ2VzIGFuZCBub3RoaW5n
Cj4gdW50b3dhcmQuCj4gCj4gQ0M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gQ0M6
IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoKQWNrZWQtYnk6IFdl
aSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
