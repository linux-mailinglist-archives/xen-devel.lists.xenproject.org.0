Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6AB1509B9
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 16:22:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iydUg-0001Nk-PW; Mon, 03 Feb 2020 15:18:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BfOp=3X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iydUf-0001Mc-JJ
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 15:18:33 +0000
X-Inumbo-ID: 707beab8-4698-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 707beab8-4698-11ea-b211-bc764e2007e4;
 Mon, 03 Feb 2020 15:18:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C69DFACB1;
 Mon,  3 Feb 2020 15:18:31 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200121084330.18309-1-jgross@suse.com>
 <20200121084330.18309-2-jgross@suse.com>
 <58b1a2e5-d63f-ba87-9f20-24b8c0e1097f@suse.com>
 <aece6da6-8e95-ce11-5d61-8934044f8a5f@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <56a48ab1-3313-7684-6ec7-ed89d524c038@suse.com>
Date: Mon, 3 Feb 2020 16:18:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <aece6da6-8e95-ce11-5d61-8934044f8a5f@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/9] xen: add a generic way to include
 binary files as variables
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDIuMjAyMCAxNTowMiwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAwMy4wMi4yMCAx
NDozOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDIxLjAxLjIwMjAgMDk6NDMsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiAtLS0gL2Rldi9udWxsCj4+PiArKysgYi94ZW4vdG9vbHMvYmluZmls
ZQo+Pj4gQEAgLTAsMCArMSwyOSBAQAo+Pj4gKyMhL2Jpbi9zaAo+Pj4gKyMgdXNhZ2U6IGJpbmZp
bGUgWy1pXSA8dGFyZ2V0LXNyYy5TPiA8YmluYXJ5LWZpbGU+IDx2YXJuYW1lPgo+Pj4gKyMgLWkg
ICAgIGFkZCB0byAuaW5pdC5yb2RhdGEgKGRlZmF1bHQ6IC5yb2RhdGEpIHNlY3Rpb24KPj4+ICsK
Pj4+ICtbICIkMSIgPSAiLWkiIF0gJiYgewo+Pj4gKyAgICBzaGlmdAo+Pj4gKyAgICBzZWN0aW9u
PSIuaW5pdCIKPj4+ICt9Cj4+PiArCj4+PiArdGFyZ2V0PSQxCj4+PiArYmluc291cmNlPSQyCj4+
PiArdmFybmFtZT0kMwo+Pj4gKwo+Pj4gK2NhdCA8PEVPRiA+JHRhcmdldAo+Pj4gKyNpbmNsdWRl
IDxhc20vYXNtX2RlZm5zLmg+Cj4+PiArCj4+PiArICAgICAgICAuc2VjdGlvbiAkc2VjdGlvbi5y
b2RhdGEsICJhIiwgJXByb2diaXRzCj4+PiArCj4+PiArICAgICAgICAuZ2xvYmFsICR2YXJuYW1l
Cj4+PiArJHZhcm5hbWU6Cj4+PiArICAgICAgICAuaW5jYmluICIkYmluc291cmNlIgo+Pj4gKy5M
ZW5kOgo+Pj4gKwo+Pj4gKyAgICAgICAgLnR5cGUgJHZhcm5hbWUsICVvYmplY3QKPj4+ICsgICAg
ICAgIC5zaXplICR2YXJuYW1lLCAuIC0gJHZhcm5hbWUKPj4KPj4gSSdkIHByZWZlciBpZiB5b3Ug
dXNlZCAuTGVuZCBoZXJlIGFzIHdlbGwuCj4gCj4gT2theS4KPiAKPj4gSSB3b25kZXIgd2hldGhl
ciwgcmlnaHQgZnJvbSB0aGUgYmVnaW5uaW5nLCB0aGVyZSB3b3VsZG4ndCBiZXR0ZXIKPj4gYmUg
YSB3YXkgdG8gYWxzbyByZXF1ZXN0IGJldHRlciB0aGFuIGJ5dGUgYWxpZ25tZW50IGZvciBzdWNo
IGEKPj4gYmxvYi4KPiAKPiBJIGNhbiBhZGQgdGhhdC4gV2hhdCBhYm91dCAiLWEgPG4+IiBmb3Ig
Ml5uIGFsaWdubWVudD8KClNHVE0uCgo+Pj4gLS0tIGEveGVuL3hzbS9mbGFzay9NYWtlZmlsZQo+
Pj4gKysrIGIveGVuL3hzbS9mbGFzay9NYWtlZmlsZQo+Pj4gQEAgLTMwLDYgKzMwLDkgQEAgJChB
Vl9IX0ZJTEVTKTogJChBVl9IX0RFUEVORCkKPj4+ICAgb2JqLWJpbi0kKENPTkZJR19YU01fRkxB
U0tfUE9MSUNZKSArPSBmbGFzay1wb2xpY3kubwo+Pj4gICBmbGFzay1wb2xpY3kubzogcG9saWN5
LmJpbgo+Pj4gICAKPj4+ICtmbGFzay1wb2xpY3kuUzogJChYRU5fUk9PVCkveGVuL3Rvb2xzL2Jp
bmZpbGUKPj4+ICsJJChYRU5fUk9PVCkveGVuL3Rvb2xzL2JpbmZpbGUgLWkgJEAgcG9saWN5LmJp
biB4c21fZmxhc2tfaW5pdF9wb2xpY3kKPj4KPj4gRG9lc24ndCBvYmpjb3B5IHByb3ZpZGUgYSBt
ZWFucyB0byBjb252ZXJ0IGEgYmluYXJ5IGJsb2IgaW50bwo+PiBhbiBFTEYgb2JqZWN0IGNvbnRh
aW5pbmcgdGhlIGJpbmFyeSBkYXRhIGZyb20gdGhlIGlucHV0IGZpbGU/Cj4+IElmIHNvLCB3aHkg
aW52b2x2ZSB0aGUgYXNzZW1ibGVyIGFuZCBhbiBpbnRlcm1lZGlhdGUgZmlsZSBoZXJlPwo+IAo+
IEkgY2FuIHNlZSBob3cgdG8gYWRkIGEgc3ltYm9sIGZvciB0aGF0IHB1cnBvc2UgdXNpbmcgYSBk
ZWRpY2F0ZWQgc2VjdGlvbgo+IGZvciBlYWNoIGJsb2IsIGJ1dCBob3cgdG8gYWRkIHRoZSBzaXpl
IGluZm9ybWF0aW9uIG9mIHRoZSBibG9iPwoKSG1tLCByaWdodC4gSXQgd291bGQgYmUgZG9hYmxl
LCBidXQgcGVyaGFwcyBpbmRlZWQgbm90IHZlcnkgbmljZS4KRmFpciBlbm91Z2ggdGhlbi4KCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
