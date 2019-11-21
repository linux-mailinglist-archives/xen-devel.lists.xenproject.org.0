Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4760105461
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 15:28:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXnOE-0007Dp-92; Thu, 21 Nov 2019 14:24:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=N53E=ZN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iXnOD-0007Dk-9i
 for xen-devel@lists.xen.org; Thu, 21 Nov 2019 14:24:57 +0000
X-Inumbo-ID: b036ae62-0c6a-11ea-a334-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b036ae62-0c6a-11ea-a334-12813bfff9fa;
 Thu, 21 Nov 2019 14:24:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 78CAEAD5D;
 Thu, 21 Nov 2019 14:24:54 +0000 (UTC)
To: Rishi <2rushikeshj@gmail.com>, Jan Beulich <jbeulich@suse.com>
References: <CAO9XypWibNu0iDnJsZXkQ+=Ecd6eThnu+td4O3VVLMe+qJ80eQ@mail.gmail.com>
 <76a91fb3-d2b0-dd23-7e99-0015fbee5990@suse.com>
 <CAO9XypVpBAPk8Hakqt7jJ08pCUhR_GzNxDWh2D-CGfp0+tfaAA@mail.gmail.com>
 <3b8d187e-c4d5-a7a5-76c2-874db47440ee@suse.com>
 <CAO9XypVNhSd8hPu1nA1uP8PVCPVgW-Bs_q6gmPky6Px0-U6G+w@mail.gmail.com>
 <04b95cfb-afa0-b6ba-2e69-74b56edbf4c4@suse.com>
 <CAO9XypVS1vfZu+ZJ_dK9VRTEhMR7y8viceAmOufCpvDLt-sXHw@mail.gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <0276e934-4a59-386f-87ee-2b801fd26dae@suse.com>
Date: Thu, 21 Nov 2019 15:24:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CAO9XypVS1vfZu+ZJ_dK9VRTEhMR7y8viceAmOufCpvDLt-sXHw@mail.gmail.com>
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
Cc: xen-devel@lists.xen.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMTEuMTkgMTQ6MzksIFJpc2hpIHdyb3RlOgo+IE9uIFR1ZSwgTm92IDE5LCAyMDE5IGF0
IDI6NDcgUE0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPj4KPj4gT24g
MTkuMTEuMjAxOSAwNjoyMywgUmlzaGkgd3JvdGU6Cj4+PiBvaywgdGhhbmtzIGZvciBjbGVhcmlu
ZyBpdCB1cC4gV291bGQgYSBwYXRjaCBiZSBhY2NlcHRlZCBpZiB0aGlzCj4+PiBvcHRpb24gb2Yg
c2hvd2luZyBFQVggbGVhZiBpcyBzZWxlY3RpdmVseSBkb25lIHRocm91Z2ggY29tbWFuZCBsaW5l
Cj4+PiAoZGVmYXVsdCBkaXNhYmxlZCk/Cj4+Cj4+IEluIGdlbmVyYWwgSSdkIGV4cGVjdCB0aGlz
IHRvIGJlIHJhdGhlciB1bmxpa2VseSwgYnV0IEkgZ3Vlc3MgbXVjaAo+PiB3b3VsZCBkZXBlbmQg
b24gdGhlIGFjdHVhbCByZWFzb25pbmcgZG9uZSBpbiB0aGUgZGVzY3JpcHRpb24uCj4+Cj4+PiBP
biBsb25nZXIgcnVuLCB3aGF0IGlzIGFuIGV4cGVjdGVkIHNhbmUgbW9kZWwgb2YgdmlydHVhbGl6
aW5nIHRoaXM/Cj4+PiBXaXRoIHNvbWUgZ3VpZGFuY2UsIG1heSBiZSBJIG9yIHNvbWVvbmUgZWxz
ZSBjYW4gY29kZSB0byBicmluZyB0aGUKPj4+IGZ1bmN0aW9uYWxpdHkgYmFjay4KPj4KPj4gV2hp
Y2ggZnVuY3Rpb25hbGl0eT8gU28gZmFyIHlvdSd2ZSB0YWxrZWQgb2Ygb25seSBDUFVJRCBiaXRz
IEkKPj4gdGhpbmssIHdpdGhvdXQgZXhwbGFpbmluZyBhdCBhbGwgd2hhdCBmdW5jdGlvbmFsaXR5
IHlvdSB3YW50IHRvCj4+IGhhdmUgdGhhdCBkZXBlbmRzIG9uIHRoZXNlLiBJbiBnZW5lcmFsLCBh
cyBzYWlkIGVhcmxpZXIsIENQVQo+PiBtYW5hZ2VtZW50IGlzIHRoZSBoeXBlcnZpc29yJ3MgcmVz
cG9uc2liaWxpdHksIHNvIEknZCByYXRoZXIKPj4gbm90IHNlZSB0aGlzIHZpcnR1YWxpemVkLCBi
dXQgdGhlIGh5cGVydmlzb3IgYmUgcHV0IGludG8gYQo+PiBwb3NpdGlvbiBvZiBkb2luZyB3aGF0
ZXZlciBpcyBuZWVkZWQuCj4+Cj4+IEphbgo+IAo+IFRoZSByZWFzb25pbmcgdG8gaGF2ZSBFQVgo
MHgwNmgpIGV4cG9zZWQgdG8gRG9tMCBpcyBmb3IgVGhlcm1hbCBhbmQKPiBQb3dlciBtYW5hZ2Vt
ZW50Lgo+IFdpdGhvdXQgRUFYKDB4MDZoKSBEb20wIGlzIHVuYWJsZSB0byBzZW5zZSBwcmVzZW5j
ZSBvZiBDUFUgY29yZQo+IHRlbXBlcmF0dXJlIG9yIGRvIFRoZXJtYWwgbWFuYWdlbWVudCAtIGlu
Y2x1ZGluZyBidXQgbm90IGxpbWl0ZWQgdG8KPiBvcGVyYXRpbmcgRmFuIHNwZWVkLgo+IERvbTAg
aGFzIHRvIHJlbHkgb24gb3RoZXIgcG9zc2libGUgd2F5cyBzdWNoIGFzIGlwbWkgb3IgQklPUyB3
aGljaCBhcmUKPiBvcHRpb25hbGx5IGF2YWlsYWJsZS4KCllvdSBhcmUgYXdhcmUgdGhhdCBkb20w
IGNhbid0IGVhc2lseSBjb250cm9sIG9uIHdoaWNoIF9waHlzaWNhbF8gY3B1IGl0CmlzIGp1c3Qg
cnVubmluZz8gU28gaXQgY291bGQgZWFzaWx5IGJlIHRoYXQgeW91IGFyZSBzYW1wbGluZyBsZXRz
IHNheQozIE1TUnMgaW4gYSBmdW5jdGlvbiwgYnV0IHlvdSBhcmUgYWNjZXNzaW5nIGRpZmZlcmVu
dCBjcHVzIGVhY2ggdGltZSBkdWUKdG8gdGhlIGh5cGVydmlzb3IgcmUtc2NoZWR1bGluZyB0aGUg
dmNwdSBpbiBiZXR3ZWVuLgoKQW5kIGluIGNhc2UgeW91IHdhbnQgdG8gYWRqdXN0IHNldHRpbmdz
IHlvdSBjYW4gaGl0IGFub3RoZXIgY3B1IGFnYWluLgoKU286IG5vLCBqdXN0IGdpdmluZyBkb20w
IGFjY2VzcyB0byB0aGUgbWFuYWdlbWVudCBoYXJkd2FyZSBpc24ndCBnb2luZwp0byBmbHkuIFlv
dSBuZWVkIHRvIGhhdmUgYSBwcm9wZXIgdmlydHVhbGl6YXRpb24gbGF5ZXIgZm9yIHRoYXQgcHVy
cG9zZS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
