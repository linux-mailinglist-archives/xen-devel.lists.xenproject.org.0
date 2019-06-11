Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 641923CDB0
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 15:55:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hahCm-0005kv-Nb; Tue, 11 Jun 2019 13:52:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SowN=UK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hahCl-0005ko-5n
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 13:52:51 +0000
X-Inumbo-ID: 33765473-8c50-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 33765473-8c50-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 13:52:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6B9E344;
 Tue, 11 Jun 2019 06:52:49 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 824D13F557;
 Tue, 11 Jun 2019 06:52:48 -0700 (PDT)
To: George Dunlap <george.dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>
References: <20190516133735.18883-1-volodymyr_babchuk@epam.com>
 <20190516133735.18883-2-volodymyr_babchuk@epam.com>
 <5CF7E6930200007800235A1B@prv1-mh.provo.novell.com>
 <675a4182-74c7-24c6-3a5f-c7359eb6899f@arm.com>
 <1b21850b-29a0-37da-2765-54ce51783a7b@arm.com>
 <5CFF4DA60200007800236D45@prv1-mh.provo.novell.com>
 <0fab9902-a644-7aaf-d61c-bad37616b51c@arm.com>
 <5CFF774D0200007800236E83@prv1-mh.provo.novell.com>
 <f87bbb29-fffd-dee0-8b76-857bb52eb1bb@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <c437bb67-cc5a-6ff1-c57e-67a95184dbcf@arm.com>
Date: Tue, 11 Jun 2019 14:52:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <f87bbb29-fffd-dee0-8b76-857bb52eb1bb@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/2] arm: rename tiny64.conf to
 tiny64_defconfig
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgR2VvcmdlLAoKT24gMTEvMDYvMjAxOSAxMToxMiwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBP
biA2LzExLzE5IDEwOjQxIEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24gMTEuMDYuMTkg
YXQgMTE6MjcsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+PiBIaSBKYW4sCj4+Pgo+
Pj4gT24gNi8xMS8xOSA3OjQzIEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+PiBPbiAxMC4w
Ni4xOSBhdCAyMjowMywgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+Pj4gSGksCj4+
Pj4+Cj4+Pj4+IE9uIDYvNS8xOSA1OjAxIFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4+ICAg
ICA+IE9uIDA1LzA2LzIwMTkgMTY6NTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IEp1bGll
biwKPj4+Pj4+Pgo+Pj4+Pj4+Pj4+IE9uIDE2LjA1LjE5IGF0IDE1OjM3LCA8Vm9sb2R5bXlyX0Jh
YmNodWtAZXBhbS5jb20+IHdyb3RlOgo+Pj4+Pj4+PiBBcyBidWlsZCBzeXN0ZW0gbm93IHN1cHBv
cnRzICpfZGVmY29uZmlnIHJ1bGVzIGl0IGlzIGdvb2QgdG8gYmUgYWJsZQo+Pj4+Pj4+PiB0byBj
b25maWd1cmUgbWluaW1hbCBYRU4gaW1hZ2Ugd2l0aAo+Pj4+Pj4+Pgo+Pj4+Pj4+PiAgICAgbWFr
ZSB0aW55NjRfZGVmY29uZmlnCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IGNvbW1hbmQuCj4+Pj4+Pj4+Cj4+
Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1
a0BlcGFtLmNvbT4KPj4+Pj4+Pgo+Pj4+Pj4+IHlvdSBoYWQgb2JqZWN0aW9ucyBoZXJlLCBhbmQg
dGhlIGZpcnN0IHBhdGNoIG1ha2VzIGxpdHRsZSBzZW5zZQo+Pj4+Pj4+IHdpdGhvdXQgdGhlIDJu
ZC4gTWF5IEkgYXNrIHdoYXQgdGhlIHZlcmRpY3QgaXMsIGkuZS4gd2hldGhlciBJIHNob3VsZAo+
Pj4+Pj4+IGRyb3AgdGhlc2UgdHdvIGZyb20gbXkgbGlzdCBvZiBwZW5kaW5nIHBhdGNoZXM/Cj4+
Pj4+Pgo+Pj4+Pj4gVm9sb2R5bXlyIHdhcyBnb2luZyB0byByZXNlbmQgdGhlIHNlcmllcyB3aXRo
IGRvY3VtZW50YXRpb24gKGFzIGEKPj4+Pj4+IHNlcGFyYXRlIHBhdGNoKS4gQnV0IEkgd291bGQg
YmUgaGFwcHkgdG8gdGFrZSAjMSBhbmQgIzIgYXNzdW1pbmcgdGhhdAo+Pj4+Pj4gZG9jdW1lbnRh
dGlvbiBwYXRjaCBpcyBnb2luZyB0byBiZSBzZW50Lgo+Pj4+Pj4KPj4+Pj4+IFlvdSBjYW4gY29u
c2lkZXIgdGhpcyBhcyBhbiBhY2tlZDoKPj4+Pj4+Cj4+Pj4+PiBBY2tlZC1ieTogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gZm9yIHRoZSB0d28gcGF0Y2hlcy4KPj4+Pj4KPj4+
Pj4gSSB3YXMgYWJvdXQgdG8gYXBwbHkgdGhlIHR3byBwYXRjaGVzLCBidXQgSSBkb24ndCBzZWVt
IHRvIGJlIGFibGUgdG8KPj4+Pj4gYXBwbHkgaXQgYmVjYXVzZSBzb21lIGxpbmVzIGNvbnRhaW5z
ID0yMC4gQUZBSUNULCBpdCBpcyBpbiByZXBsYWNlbWVudAo+Pj4+PiBvZiAic3BhY2UiIGluIGNl
cnRhaW4gY2FzZS4KPj4+Pgo+Pj4+IFdlbGwsIGluZGVwZW5kZW50IG9mIGFueSBmb3JtYXR0aW5n
IGlzc3VlcyB5b3Ugb3VnaHQgdG8gaGF2ZSB0cm91YmxlCj4+Pj4gYXBwbHlpbmcgdGhlbSBzaW5j
ZSBJIGRpZCBzbyBhbHJlYWR5Lgo+Pj4KPj4+IEhtbSwgSSBtaXNzZWQgdGhhdC4gU29ycnkgZm9y
IG5vaXNlLgo+Pj4KPj4+IE91dCBvZiBpbnRlcmVzdCwgaG93IGRpZCB5b3UgbWFuYWdlIHRvIGFw
cGx5IGl0IHdpdGggdGhlID0yMCBpbiB0aGUgcGF0Y2g/Cj4+Cj4+IFRoZXJlIGFyZSBubyA9MjAg
aW4gdGhlIG1haWwgdGhhdCBJIGRpZCByZWNlaXZlLgo+IAo+IEkgdGhpbmsgYGdpdCBhbWAga25v
d3MgaG93IHRvIGRlYWwgd2l0aCB0aG9zZSBhY3R1YWxseS4KCkhybS4gWWVzLCBzb3JyeSBmb3Ig
dGhlIG5vaXNlLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
