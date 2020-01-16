Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 260E613DF38
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 16:50:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is7N2-0005ms-Bo; Thu, 16 Jan 2020 15:47:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1is7N1-0005mn-Bd
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 15:47:43 +0000
X-Inumbo-ID: 85e664d4-3877-11ea-876a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 85e664d4-3877-11ea-876a-12813bfff9fa;
 Thu, 16 Jan 2020 15:47:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CCA17B20D1;
 Thu, 16 Jan 2020 15:47:37 +0000 (UTC)
To: George Dunlap <george.dunlap@eu.citrix.com>
References: <cover.1578503483.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2284645a-0496-7811-5def-2cb053ffcf51@suse.com>
Date: Thu, 16 Jan 2020 16:47:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <cover.1578503483.git.tamas.lengyel@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 00/18] VM forking
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Julien Grall <julien@xen.org>,
 Alexandru Isaila <aisaila@bitdefender.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDEuMjAyMCAxODoxMywgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IFRhbWFzIEsgTGVu
Z3llbCAoMTgpOgo+ICAgeDg2L2h2bTogaW50cm9kdWNlIGh2bV9jb3B5X2NvbnRleHRfYW5kX3Bh
cmFtcwo+ICAgeGVuL3g4NjogTWFrZSBoYXBfZ2V0X2FsbG9jYXRpb24gYWNjZXNzaWJsZQo+ICAg
eDg2L21lbV9zaGFyaW5nOiBtYWtlIGdldF90d29fZ2ZucyB0YWtlIGxvY2tzIGNvbmRpdGlvbmFs
bHkKPiAgIHg4Ni9tZW1fc2hhcmluZzogZHJvcCBmbGFncyBmcm9tIG1lbV9zaGFyaW5nX3Vuc2hh
cmVfcGFnZQo+ICAgeDg2L21lbV9zaGFyaW5nOiBkb24ndCB0cnkgdG8gdW5zaGFyZSB0d2ljZSBk
dXJpbmcgcGFnZSBmYXVsdAo+ICAgeDg2L21lbV9zaGFyaW5nOiBkZWZpbmUgbWVtX3NoYXJpbmdf
ZG9tYWluIHRvIGhvbGQgc29tZSBzY2F0dGVyZWQKPiAgICAgdmFyaWFibGVzCj4gICB4ODYvbWVt
X3NoYXJpbmc6IFVzZSBJTlZBTElEX01GTiBhbmQgcDJtX2lzX3NoYXJlZCBpbgo+ICAgICByZWxp
bnF1aXNoX3NoYXJlZF9wYWdlcwo+ICAgeDg2L21lbV9zaGFyaW5nOiBNYWtlIGFkZF90b19waHlz
bWFwIHN0YXRpYyBhbmQgc2hvcnRlbiBuYW1lCj4gICB4ODYvbWVtX3NoYXJpbmc6IENvbnZlcnQg
TUVNX1NIQVJJTkdfREVTVFJPWV9HRk4gdG8gYSBib29sCgpJJ3ZlIGxvb2tlZCBhdCB0aGVzZSBw
YXRjaGVzLCBhbmQgSSB0aGluayAyLTQgYW5kIDctOSBjb3VsZCBnbwppbiByaWdodCBhd2F5ICg2
IGhhcyBhIHNtYWxsIHF1ZXN0aW9uIHBlbmRpbmcsIGJ1dCBtYXkgb3RoZXJ3aXNlCmFsc28gYmUg
cmVhZHkpLCBpZiB5b3Ugd2VyZSB0byBnaXZlIChvciBkZWxlZ2F0ZSkgeW91ciBhY2sgdGhhdAp0
aGV5IHdvdWxkIG5lZWQgYWZhaWN0LiBUaG91Z2h0cz8KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
