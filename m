Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4548411E58E
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 15:32:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iflx0-0004H6-Hk; Fri, 13 Dec 2019 14:29:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nbPo=2D=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iflwz-0004H1-5R
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 14:29:49 +0000
X-Inumbo-ID: fecab7d4-1db4-11ea-88e7-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fecab7d4-1db4-11ea-88e7-bc764e2007e4;
 Fri, 13 Dec 2019 14:29:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D38A4AEC6;
 Fri, 13 Dec 2019 14:29:38 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, "Durrant, Paul" <pdurrant@amazon.com>
References: <be16ddaa-ae99-f696-53c0-6a680ffa8504@suse.com>
 <083b525e-c6db-a94b-1c50-604e8798488b@suse.com>
 <7eff12d8-ae10-331e-53b8-7239e8456c3a@suse.com>
 <dd23ae64-24df-e3bb-351f-fe577e61c6df@suse.com>
 <bcacb731-a3cb-3552-a1a0-338c619ee64d@suse.com>
 <f1f63340-d894-30d7-c0d2-caa0f826173b@suse.com>
 <52ba5440212540e691d0e998ff44448c@EX13D32EUC003.ant.amazon.com>
 <d050059e-adc7-7142-e933-b569ea34bac2@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <9d0e481b-b5e9-72a5-829a-847472fff0ec@suse.com>
Date: Fri, 13 Dec 2019 15:29:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <d050059e-adc7-7142-e933-b569ea34bac2@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] IOMMU: make DMA containment of
 quarantined devices optional
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTIuMTkgMTU6MjMsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDEzLjEyLjIwMTkgMTQ6
NTMsIER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4+IFNpbmNlICpub3QqIGhhdmluZyB0aGUgJ3Npbmsn
IHBhZ2UgYWxsb3dzIGEgZ3Vlc3QgcHVsbCBvZmYgYSBob3N0IERvUwo+PiBpbiB0aGUgcHJlc2Vu
Y2Ugb2Ygc3VjaCBoL3csIHNlY3VyaXR5IGlzIHN1cmVseSBpbmNyZWFzZWQgYnkgaGF2aW5nIGl0
Pwo+IAo+IGhvc3QJCWRldmljZQkJcmVzdWx0IHcvbyBzaW5rCQlyZXN1bHQgdy8gc2luawo+IGdv
b2QJCWdvb2QJCWdvb2QJCQlnb29kCj4gZ29vZAkJYmFiYmxpbmcJZ29vZCAJCQlnb29kCj4gd2Vk
Z2Ugb24gZmF1bHQJZ29vZAkJRG9TIChydW50aW1lKQkJRG9TIChydW50aW1lKQoKSSBndWVzcyB0
aGUgRG9TIGNhc2VzIGhlcmUgYXJlIGR1ZSB0byBtYWxpY2lvdXMgZ3Vlc3QgYWN0aW9ucz8KCj4g
d2VkZ2Ugb24gZmF1bHQJYmFiYmxpbmcJRG9TIChydW50aW1lL2xhdGUpCURvUyAocnVudGltZSBv
bmx5LCBzaWxlbnQpCgpBbmQgd2h5IGlzIHRoZSBzaW5rIHBhZ2UgcmVzdWx0aW5nIGluIGEgc2ls
ZW50IERvUyBoZXJlPwoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
