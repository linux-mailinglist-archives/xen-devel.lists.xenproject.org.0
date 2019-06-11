Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1135F3C77E
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 11:44:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hadHm-0008Cr-DR; Tue, 11 Jun 2019 09:41:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TTh1=UK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hadHl-0008Ce-AL
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 09:41:45 +0000
X-Inumbo-ID: 1c5be4cc-8c2d-11e9-af82-07d6b9334659
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1c5be4cc-8c2d-11e9-af82-07d6b9334659;
 Tue, 11 Jun 2019 09:41:39 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 11 Jun 2019 03:41:38 -0600
Message-Id: <5CFF774D0200007800236E83@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 11 Jun 2019 03:41:33 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <20190516133735.18883-1-volodymyr_babchuk@epam.com>
 <20190516133735.18883-2-volodymyr_babchuk@epam.com>
 <5CF7E6930200007800235A1B@prv1-mh.provo.novell.com>
 <675a4182-74c7-24c6-3a5f-c7359eb6899f@arm.com>
 <1b21850b-29a0-37da-2765-54ce51783a7b@arm.com>
 <5CFF4DA60200007800236D45@prv1-mh.provo.novell.com>
 <0fab9902-a644-7aaf-d61c-bad37616b51c@arm.com>
In-Reply-To: <0fab9902-a644-7aaf-d61c-bad37616b51c@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDExLjA2LjE5IGF0IDExOjI3LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IEhpIEphbiwKPiAKPiBPbiA2LzExLzE5IDc6NDMgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+
PiBPbiAxMC4wNi4xOSBhdCAyMjowMywgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+
IEhpLAo+Pj4KPj4+IE9uIDYvNS8xOSA1OjAxIFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiAg
ICA+IE9uIDA1LzA2LzIwMTkgMTY6NTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBKdWxpZW4s
Cj4+Pj4+Cj4+Pj4+Pj4+IE9uIDE2LjA1LjE5IGF0IDE1OjM3LCA8Vm9sb2R5bXlyX0JhYmNodWtA
ZXBhbS5jb20+IHdyb3RlOgo+Pj4+Pj4gQXMgYnVpbGQgc3lzdGVtIG5vdyBzdXBwb3J0cyAqX2Rl
ZmNvbmZpZyBydWxlcyBpdCBpcyBnb29kIHRvIGJlIGFibGUKPj4+Pj4+IHRvIGNvbmZpZ3VyZSBt
aW5pbWFsIFhFTiBpbWFnZSB3aXRoCj4+Pj4+Pgo+Pj4+Pj4gICAgbWFrZSB0aW55NjRfZGVmY29u
ZmlnCj4+Pj4+Pgo+Pj4+Pj4gY29tbWFuZC4KPj4+Pj4+Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBW
b2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+Cj4+Pj4+Cj4+Pj4+
IHlvdSBoYWQgb2JqZWN0aW9ucyBoZXJlLCBhbmQgdGhlIGZpcnN0IHBhdGNoIG1ha2VzIGxpdHRs
ZSBzZW5zZQo+Pj4+PiB3aXRob3V0IHRoZSAybmQuIE1heSBJIGFzayB3aGF0IHRoZSB2ZXJkaWN0
IGlzLCBpLmUuIHdoZXRoZXIgSSBzaG91bGQKPj4+Pj4gZHJvcCB0aGVzZSB0d28gZnJvbSBteSBs
aXN0IG9mIHBlbmRpbmcgcGF0Y2hlcz8KPj4+Pgo+Pj4+IFZvbG9keW15ciB3YXMgZ29pbmcgdG8g
cmVzZW5kIHRoZSBzZXJpZXMgd2l0aCBkb2N1bWVudGF0aW9uIChhcyBhCj4+Pj4gc2VwYXJhdGUg
cGF0Y2gpLiBCdXQgSSB3b3VsZCBiZSBoYXBweSB0byB0YWtlICMxIGFuZCAjMiBhc3N1bWluZyB0
aGF0Cj4+Pj4gZG9jdW1lbnRhdGlvbiBwYXRjaCBpcyBnb2luZyB0byBiZSBzZW50Lgo+Pj4+Cj4+
Pj4gWW91IGNhbiBjb25zaWRlciB0aGlzIGFzIGFuIGFja2VkOgo+Pj4+Cj4+Pj4gQWNrZWQtYnk6
IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+IGZvciB0aGUgdHdvIHBhdGNoZXMu
Cj4+Pgo+Pj4gSSB3YXMgYWJvdXQgdG8gYXBwbHkgdGhlIHR3byBwYXRjaGVzLCBidXQgSSBkb24n
dCBzZWVtIHRvIGJlIGFibGUgdG8KPj4+IGFwcGx5IGl0IGJlY2F1c2Ugc29tZSBsaW5lcyBjb250
YWlucyA9MjAuIEFGQUlDVCwgaXQgaXMgaW4gcmVwbGFjZW1lbnQKPj4+IG9mICJzcGFjZSIgaW4g
Y2VydGFpbiBjYXNlLgo+PiAKPj4gV2VsbCwgaW5kZXBlbmRlbnQgb2YgYW55IGZvcm1hdHRpbmcg
aXNzdWVzIHlvdSBvdWdodCB0byBoYXZlIHRyb3VibGUKPj4gYXBwbHlpbmcgdGhlbSBzaW5jZSBJ
IGRpZCBzbyBhbHJlYWR5Lgo+IAo+IEhtbSwgSSBtaXNzZWQgdGhhdC4gU29ycnkgZm9yIG5vaXNl
Lgo+IAo+IE91dCBvZiBpbnRlcmVzdCwgaG93IGRpZCB5b3UgbWFuYWdlIHRvIGFwcGx5IGl0IHdp
dGggdGhlID0yMCBpbiB0aGUgcGF0Y2g/CgpUaGVyZSBhcmUgbm8gPTIwIGluIHRoZSBtYWlsIHRo
YXQgSSBkaWQgcmVjZWl2ZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
