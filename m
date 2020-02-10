Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C87B1573CD
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 13:02:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j17iw-00070B-SI; Mon, 10 Feb 2020 11:59:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4wzj=36=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j17iv-000706-AO
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 11:59:33 +0000
X-Inumbo-ID: cc54431d-4bfc-11ea-b4b3-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc54431d-4bfc-11ea-b4b3-12813bfff9fa;
 Mon, 10 Feb 2020 11:59:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5988FAAC2;
 Mon, 10 Feb 2020 11:59:31 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <20200204173455.22020-1-roger.pau@citrix.com>
 <20200204173455.22020-3-roger.pau@citrix.com>
 <3d067f06-a054-bbe1-916e-ef43e2527f45@suse.com>
 <20200205132144.GS4679@Air-de-Roger>
 <775b8691-068d-2af9-1b59-d66233708595@suse.com>
 <69d410bd-2397-537d-6507-4c710d166396@xen.org>
 <1354b838-e30f-10dd-edbe-064fb159ef7e@suse.com>
 <0542d37e-8128-b94c-19ac-8506bf0d1b8a@xen.org>
 <58391072-5196-62e7-a09b-bc45993b50ef@suse.com>
 <4d6e9d92-d0cf-6f4e-0fe1-8cba69c72300@xen.org>
 <17344a8c-b5f5-ee48-a89d-8d5c0070e81f@suse.com>
 <910276d6-a55d-87d2-cb92-055c53b9898c@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <979c25c4-09c2-755e-51f9-ca644358b096@suse.com>
Date: Mon, 10 Feb 2020 12:59:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <910276d6-a55d-87d2-cb92-055c53b9898c@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 2/3] bitmap: import bitmap_{set/clear}
 from Linux 5.5
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDIuMjAyMCAxMjowMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDEwLzAyLzIwMjAg
MTA6MjgsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAxMC4wMi4yMDIwIDEwOjQ1LCBKdWxpZW4g
R3JhbGwgd3JvdGU6Cj4+PiBQbGVhc2Ugc3VnZ2VzdCBhIG5ldyBuYW1lIGZvciBCSVRfV09SRCgp
IGFuZCB3ZSBjYW4gcmVwdXJwb3NlIGl0LiBTbwo+Pj4gZmFyLCBJIGhhdmUgbm8gaWRlYSBob3cg
dG8gcmVuYW1lIGl0Lgo+Pgo+PiBfQklUX1dPUkQoKSBpZiB5b3Uvd2Ugd2VyZSB0byBhY2NlcHQg
dGhlIG5hbWUgc3BhY2UgdmlvbGF0aW9uLCBvcgo+PiBCSVRNQVBfV09SRCgpPwo+IAo+IEJJVE1B
UF9XT1JEKCkgaXMgbWlzbGVhZGluZyBhcyBiaXRtYXAgYXJlIHVzaW5nIHVuc2lnbmVkIGxvbmcu
IFNvIG15IAo+IHByZWZlcmVuY2UgaXMgX0JJVF9XT1JEKCkuCj4gCj4gQW5vdGhlciBhbHRlcm5h
dGl2ZSB3b3VsZCBiZSBBVE9NSUNfV09SRCgpLgoKRXhjZXB0IHRoYXQgdGhlcmUgYXJlIGFsc28g
bm9uLWF0b21pYyBiaXRtYXAgb3BlcmF0aW9ucywgSSBkb24ndCByZWFsbHkKY2FyZSBhYm91dCB0
aGUgbmFtZSBhcyBsb25nIGFzIGl0J3Mgbm90IEJJVF9XT1JEKCkgKG9yIGFueXRoaW5nIGVsc2UK
dGhhdCdzIGxpa2VseSB0byBjb2xsaWRlIHdpdGggb3RoZXIgc3R1ZmYpLgoKSmFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
