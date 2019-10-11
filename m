Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6CFD41FF
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 16:01:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIvOI-0004UN-N8; Fri, 11 Oct 2019 13:55:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qSz8=YE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iIvOG-0004UI-Nr
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 13:55:32 +0000
X-Inumbo-ID: c9835d2c-ec2e-11e9-933b-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c9835d2c-ec2e-11e9-933b-12813bfff9fa;
 Fri, 11 Oct 2019 13:55:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A815BABCF;
 Fri, 11 Oct 2019 13:55:29 +0000 (UTC)
To: Ian Jackson <ian.jackson@citrix.com>, George Dunlap <dunlapg@umich.edu>
References: <20191010151111.22125-1-ian.jackson@eu.citrix.com>
 <20191010151111.22125-10-ian.jackson@eu.citrix.com>
 <CAFLBxZapoPdDx+2rokrq0KPE_-mTgYtyE-rk4hFsvjX8g76iZQ@mail.gmail.com>
 <23968.33869.906302.573866@mariner.uk.xensource.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <33aee478-52b9-df46-67d7-f81702e5e0f9@suse.com>
Date: Fri, 11 Oct 2019 15:55:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <23968.33869.906302.573866@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v2 9/9] libxl/xl: Overhaul
 passthrough setting logic
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Paul Durrant <pdurrant@gmail.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMTAuMTkgMTU6MzEsIElhbiBKYWNrc29uIHdyb3RlOgo+IEdlb3JnZSBEdW5sYXAgd3Jp
dGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtYRU4gUEFUQ0ggZm9yLTQuMTMgdjIgOS85XSBsaWJ4bC94
bDogT3ZlcmhhdWwgcGFzc3Rocm91Z2ggc2V0dGluZyBsb2dpYyIpOgo+PiBPbiBUaHUsIE9jdCAx
MCwgMjAxOSBhdCA0OjEyIFBNIElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29t
PiB3cm90ZToKPj4+IExJQlhMX1BBU1NUSFJPVUdIX1VOS05PV04gKGFrYSAiRU5BQkxFRCIgaW4g
YW4gZWFybGllciB1bmNvbW1pdHRlZAo+Pj4gdmVyc2lvbiBvZiB0aGlzIGNvZGUpIGlzIGRvaW5n
IGRvdWJsZSBkdXR5LiAgV2UgYWN0dWFsbHkgbmVlZCBhbGwgb2YKPj4+IHRoZSBmb2xsb3dpbmcg
dG8gYmUgc3BlY2lmaWNhYmxlOgo+Pj4gICAgKiBkZWZhdWx0ICgidW5rbm93biIpOiBlbmFibGUg
UFQgaWZmIHdlIGhhdmUgZGV2aWNlcyB0bwo+Pj4gICAgICBwYXNzIHRocm91Z2ggc3BlY2lmaWVk
IGluIHRoZSBpbml0aWFsIGNvbmZpZyBmaWxlLgo+Pgo+PiBJIHJlYWxpemUgdGhpcyBtYXkgYmUg
YSBiaXQgbGF0ZSwgYnV0IEkgZmluZCAidW5rbm93biIgdG8gYmUgYSB2ZXJ5Cj4+IHN0cmFuZ2Ug
d29yZCB0byB1c2UgdG8gaW5kaWNhdGUsICJwbGVhc2UgY2hvb3NlIHRoZSBiZXN0IG9wdGlvbiBm
b3IKPj4gbWUiLiAgRm9yIFVTQiBkZXZpY2UgdHlwZSBJIHVzZWQgImF1dG8iLCBtZWFuaW5nLCAi
YXV0b21hdGljYWxseQo+PiBjaG9vc2UgdGhlIGJlc3Qgb3B0aW9uIGZvciBtZSIuICBQYXVsIGRp
ZG4ndCBsaWtlICJhdXRvIiwgd2hpY2ggaXMKPj4gZmFpciBlbm91Z2gsIGJ1dCBJIHJlYWxseSBk
b24ndCBzZWUgaG93ICJ1bmtub3duIiBpcyBiZXR0ZXIuCj4+Cj4+IEFueXdheSwgbm90IG1lYW5p
bmcgdG8gYmxvY2ssIGp1c3QgYSBzdWdnZXN0aW9uLgo+IAo+IEkgZG8gbm90IGhhdmUgYSBzdHJv
bmcgb3BpbmlvbiBhYm91dCB0aGlzLiAgSSB3b3VsZCBiZSBoYXBweSB3aXRoCj4gImF1dG8iIChv
ciAiZGVmYXVsdCIgbWF5YmUpLgoKInVuc3BlY2lmaWVkIj8KCgpKdWVyZ2VuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
