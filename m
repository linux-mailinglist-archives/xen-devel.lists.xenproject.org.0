Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F8E1055F3
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 16:46:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXods-00063l-F0; Thu, 21 Nov 2019 15:45:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=erj2=ZN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iXodr-00063Z-Od
 for xen-devel@lists.xen.org; Thu, 21 Nov 2019 15:45:11 +0000
X-Inumbo-ID: e665f19a-0c75-11ea-a33b-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e665f19a-0c75-11ea-a33b-12813bfff9fa;
 Thu, 21 Nov 2019 15:45:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E9AFAB262;
 Thu, 21 Nov 2019 15:45:09 +0000 (UTC)
To: Rishi <2rushikeshj@gmail.com>
References: <CAO9XypWibNu0iDnJsZXkQ+=Ecd6eThnu+td4O3VVLMe+qJ80eQ@mail.gmail.com>
 <76a91fb3-d2b0-dd23-7e99-0015fbee5990@suse.com>
 <CAO9XypVpBAPk8Hakqt7jJ08pCUhR_GzNxDWh2D-CGfp0+tfaAA@mail.gmail.com>
 <3b8d187e-c4d5-a7a5-76c2-874db47440ee@suse.com>
 <CAO9XypVNhSd8hPu1nA1uP8PVCPVgW-Bs_q6gmPky6Px0-U6G+w@mail.gmail.com>
 <04b95cfb-afa0-b6ba-2e69-74b56edbf4c4@suse.com>
 <CAO9XypVS1vfZu+ZJ_dK9VRTEhMR7y8viceAmOufCpvDLt-sXHw@mail.gmail.com>
 <20191121135635.GU72134@Air-de-Roger>
 <CAO9XypU3JM685vnCsbrfweunnMr+eMCDECwYh_WhVFUUZc4XeA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d9de90aa-68d5-4352-d3cb-8113ca25a527@suse.com>
Date: Thu, 21 Nov 2019 16:45:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAO9XypU3JM685vnCsbrfweunnMr+eMCDECwYh_WhVFUUZc4XeA@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen hiding thermal capabilities from Dom0
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
Cc: xen-devel@lists.xen.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMTEuMjAxOSAxNjoyNiwgUmlzaGkgd3JvdGU6Cj4gVGhlIGFmZmVjdGVkIExpbnV4IGRy
aXZlciBpbiBteSBjYXNlIGlzIGNvcmV0ZW1wLmtvIChkcml2ZXJzL2h3bW9uL2NvcmV0ZW1wLmMp
Cj4gCj4gSXQncyBpbml0IGRlcGVuZHMgb24gY2hlY2tpbmcgcHJlc2VuY2Ugb2YgWDg2X0ZFQVRV
UkVfRFRIRVJNCj4gCj4gICAgICAgICAvKgo+ICAgICAgICAgICogQ1BVSUQuMDZILkVBWFswXSBp
bmRpY2F0ZXMgd2hldGhlciB0aGUgQ1BVIGhhcyB0aGVybWFsCj4gICAgICAgICAgKiBzZW5zb3Jz
LiBXZSBjaGVjayB0aGlzIGJpdCBvbmx5LCBhbGwgdGhlIGVhcmx5IENQVXMKPiAgICAgICAgICAq
IHdpdGhvdXQgdGhlcm1hbCBzZW5zb3JzIHdpbGwgYmUgZmlsdGVyZWQgb3V0Lgo+ICAgICAgICAg
ICovCj4gCj4gSXQgc2VlbXMgdG8gdXNlIGJlbG93IE1TUgo+IE1TUl9JQTMyX1BBQ0tBR0VfVEhF
Uk1fU1RBVFVTCj4gTVNSX0lBMzJfVEhFUk1fU1RBVFVTCj4gTVNSX0lBMzJfVEVNUEVSQVRVUkVf
VEFSR0VUCj4gCj4gSSdtIG5vdCBzdXJlIGhvdyBjYW4gQ1BVSUQuMDZILkVBWFswXSBiZSByZWFk
LCBzaG91bGQgWGVuIHByb3ZpZGUgYQo+IGh5cGVyY2FsbCBpbnRlcmZhY2UgdG8gcmVhZCB0aGlz
Pwo+IEV2ZW4gaWYgYSBoeXBlcmNhbGwgaXMgZ2l2ZW4sIGNvcmV0ZW1wIHdpbGwgaGF2ZSB0byBi
ZSBtb2RpZmllZCB0bwo+IHNlcGFyYXRlIE1TUiBjYWxscy4KCkEgaHlwZXJjYWxsIGV4aXN0cyAo
WEVOUEZfcmVzb3VyY2Vfb3ApLCBhbmQgd291bGQganVzdCBuZWVkCmV4dGVuc2lvbi4gSXQgY291
bGQgZS5nLiBwZXJtaXQgYWNjZXNzIHRvIHNhaWQgTVNScyB3aGVuCkNQVUlELjA2SC5FQVhbMF0g
aXMgMS4gVGhlIGNvcmV0ZW1wIGRyaXZlciB3b3VsZCBvZiBjb3Vyc2UKbmVlZCBtb2RpZmljYXRp
b24gKG9yIGNsb25pbmcpLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
