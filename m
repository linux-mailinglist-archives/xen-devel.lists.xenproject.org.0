Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DFB4B4A9
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 11:08:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdWUi-00019k-1w; Wed, 19 Jun 2019 09:03:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hb7b=US=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hdWUh-00019f-4G
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 09:03:03 +0000
X-Inumbo-ID: 08e9425a-9271-11e9-85f3-334460e820d7
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 08e9425a-9271-11e9-85f3-334460e820d7;
 Wed, 19 Jun 2019 09:02:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CEF11344;
 Wed, 19 Jun 2019 02:02:58 -0700 (PDT)
Received: from [10.37.12.160] (unknown [10.37.12.160])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 14E893F246;
 Wed, 19 Jun 2019 02:02:57 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <2B31D2BD02000066A2327079@prv1-mh.provo.novell.com>
 <5D09E4310200007800239852@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <60ff0360-50be-8545-45d8-799ef9fcb95b@arm.com>
Date: Wed, 19 Jun 2019 10:02:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5D09E4310200007800239852@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Fwd: [xen-4.10-testing bisection] complete
 test-armhf-armhf-xl-arndale
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA2LzE5LzE5IDg6MjggQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE5LjA2
LjE5IGF0IDA5OjA2LCA8b3NzdGVzdC1hZG1pbkB4ZW5wcm9qZWN0Lm9yZz4gd3JvdGU6Cj4+IGJy
YW5jaCB4ZW4tNC4xMC10ZXN0aW5nCj4+IHhlbmJyYW5jaCB4ZW4tNC4xMC10ZXN0aW5nCj4+IGpv
YiB0ZXN0LWFybWhmLWFybWhmLXhsLWFybmRhbGUKPj4gdGVzdGlkIGRlYmlhbi1pbnN0YWxsCj4+
Cj4+IFRyZWU6IGxpbnV4IGdpdDovL3hlbmJpdHMueGVuLm9yZy9saW51eC1wdm9wcy5naXQKPj4g
VHJlZTogbGludXhmaXJtd2FyZSBnaXQ6Ly94ZW5iaXRzLnhlbi5vcmcvb3NzdGVzdC9saW51eC1m
aXJtd2FyZS5naXQKPj4gVHJlZTogb3ZtZiBnaXQ6Ly94ZW5iaXRzLnhlbi5vcmcvb3NzdGVzdC9v
dm1mLmdpdAo+PiBUcmVlOiBxZW11dSBnaXQ6Ly94ZW5iaXRzLnhlbi5vcmcvcWVtdS14ZW4uZ2l0
Cj4+IFRyZWU6IHhlbiBnaXQ6Ly94ZW5iaXRzLnhlbi5vcmcveGVuLmdpdAo+Pgo+PiAqKiogRm91
bmQgYW5kIHJlcHJvZHVjZWQgcHJvYmxlbSBjaGFuZ2VzZXQgKioqCj4+Cj4+ICAgIEJ1ZyBpcyBp
biB0cmVlOiAgeGVuIGdpdDovL3hlbmJpdHMueGVuLm9yZy94ZW4uZ2l0Cj4+ICAgIEJ1ZyBpbnRy
b2R1Y2VkOiAgNzAyYzkxNDZjMDBkNjVkMWU5YzU5NTUzMzViYTAwMjUwNWU5N2UwOQo+PiAgICBC
dWcgbm90IHByZXNlbnQ6IDUyMjIwYjVmNDM3YThkMDNiYTEwOGUxMjdlN2Q3MTc2NTdlZGY5OWMK
Pj4gICAgTGFzdCBmYWlsIHJlcHJvOiBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9y
Zy9vc3N0ZXN0L2xvZ3MvMTM4MDA1Lwo+Pgo+Pgo+PiAgICBjb21taXQgNzAyYzkxNDZjMDBkNjVk
MWU5YzU5NTUzMzViYTAwMjUwNWU5N2UwOQo+PiAgICBBdXRob3I6IEp1bGllbiBHcmFsbCA8anVs
aWVuLmdyYWxsQGFybS5jb20+Cj4+ICAgIERhdGU6ICAgTW9uIEFwciAyOSAxNTowNToxNiAyMDE5
ICswMTAwCj4+ICAgIAo+PiAgICAgICAgeGVuL2FybTogQWRkIGFuIGlzYigpIGJlZm9yZSByZWFk
aW5nIENOVFBDVF9FTDAgdG8gcHJldmVudCByZS1vcmRlcmluZwo+PiAgICAgICAgCj4+ICAgICAg
ICBQZXIgRDguMi4xIGluIEFSTSBEREkgMDQ4N0MuYSwgImEgcmVhZCB0byBDTlRQQ1RfRUwwIGNh
biBvY2N1cgo+PiAgICAgICAgc3BlY3VsYXRpdmVseSBhbmQgb3V0IG9mIG9yZGVyIHJlbGF0aXZl
IHRvIG90aGVyIGluc3RydWN0aW9ucyBleGVjdXRlZAo+PiAgICAgICAgb24gdGhlIHNhbWUgUEUu
Igo+PiAgICAgICAgCj4+ICAgICAgICBBZGQgYW4gaW5zdHJ1Y3Rpb24gYmFycmllciB0byBnZXQg
YWNjdXJhdGUgbnVtYmVyIG9mIGN5Y2xlcyB3aGVuCj4+ICAgICAgICByZXF1ZXN0ZWQgaW4gZ2V0
X2N5Y2xlcygpLiBGb3IgdGhlIG90aGVyIHVzZXJzIG9mIENOUENUX0VMMCwgcmVwbGFjZSBieQo+
PiAgICAgICAgYSBjYWxsIHRvIGdldF9jeWNsZXMoKS4KPj4gICAgICAgIAo+PiAgICAgICAgVGhp
cyBpcyBwYXJ0IG9mIFhTQS0yOTUuCj4+ICAgICAgICAKPj4gICAgICAgIFNpZ25lZC1vZmYtYnk6
IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4+ICAgICAgICBBY2tlZC1ieTog
U3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IAo+IEp1c3QgaW4g
Y2FzZSB5b3UgZGlkbid0IG5vdGljZSB0aGlzIGNvbWluZyBpbi4KCkkgc2F3IGl0IHRoaXMgbW9y
bmluZy4gQnV0IEkgZmFpbCB0byB1bmRlcnN0YW5kIGhvdyB0aGUgaW5zdHJ1Y3Rpb24gCmJhcnJp
ZXIgd2lsbCByZXN1bHQgaW4gYSB0aW1lb3V0IGR1cmluZyB0aGUgZ3Vlc3QgaW5zdGFsbGF0aW9u
Li4uCgpUaGUgbW9yZSB0aGlzIG9ubHkgZG9lc24ndCBzZWVtIHRvIGFwcGVhciBvbiBzdGFnaW5n
LTQuMTIuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
