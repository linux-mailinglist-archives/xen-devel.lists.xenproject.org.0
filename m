Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEA6471B2
	for <lists+xen-devel@lfdr.de>; Sat, 15 Jun 2019 20:30:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcDOY-0005ma-CL; Sat, 15 Jun 2019 18:27:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZUrs=UO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hcDOW-0005mV-RP
 for xen-devel@lists.xenproject.org; Sat, 15 Jun 2019 18:27:16 +0000
X-Inumbo-ID: 3318f9f2-8f9b-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 3318f9f2-8f9b-11e9-8980-bc764e045a96;
 Sat, 15 Jun 2019 18:27:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 057D328;
 Sat, 15 Jun 2019 11:27:15 -0700 (PDT)
Received: from [10.37.12.2] (unknown [10.37.12.2])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6BCC53F246;
 Sat, 15 Jun 2019 11:27:12 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <20190516133735.18883-1-volodymyr_babchuk@epam.com>
 <20190516133735.18883-2-volodymyr_babchuk@epam.com>
 <5CF7E6930200007800235A1B@prv1-mh.provo.novell.com>
 <675a4182-74c7-24c6-3a5f-c7359eb6899f@arm.com> <87wohs6jkz.fsf@epam.com>
 <5D00AD6F0200007800237538@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <3ab01e7d-4af2-9944-9810-bad12c7f2d38@arm.com>
Date: Sat, 15 Jun 2019 19:27:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5D00AD6F0200007800237538@prv1-mh.provo.novell.com>
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
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA2LzEyLzE5IDg6NDQgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDExLjA2
LjE5IGF0IDIwOjUyLCA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+IHdyb3RlOgo+PiBKdWxp
ZW4gR3JhbGwgd3JpdGVzOgo+Pj4gVm9sb2R5bXlyIHdhcyBnb2luZyB0byByZXNlbmQgdGhlIHNl
cmllcyB3aXRoIGRvY3VtZW50YXRpb24gKGFzIGEKPj4+IHNlcGFyYXRlIHBhdGNoKS4gQnV0IEkg
d291bGQgYmUgaGFwcHkgdG8gdGFrZSAjMSBhbmQgIzIgYXNzdW1pbmcgdGhhdAo+Pj4gZG9jdW1l
bnRhdGlvbiBwYXRjaCBpcyBnb2luZyB0byBiZSBzZW50Lgo+Pgo+PiBZZXMsIHNvcnJ5IGZvciB0
aGUgZGVsYXkuIEknbSBnb2luZyB0byBzZW5kIHJlc2VuZCB0aGUgc2VyaWVzIHNvb24uIEJ1dAo+
PiBJIGNhbiBzZWUsIHRoYXQgZmlyc3QgdHdvIHBhdGNoZXMgYXJlIGFscmVhZHkgaW4gdGhlIHN0
YWdpbmcgYnJhbmNoLgo+PiBTaG91bGQgSSByZXNlbmQgdGhlIHdob2xlIHNlcmllcyBpbiB0aGlz
IGNhc2U/IE9yIHNpbmdsZSBwYXRjaCB3aXRoIHRoZQo+PiBtaXNzaW5nIGRvY3VtZW50YXRpb24g
d2lsbCBiZSBzdWZmaWNpZW50Pwo+IAo+IFlvdSBzaG91bGQgbmV2ZXIgc2VuZCBwYXRjaGVzIHRo
YXQgaGF2ZSBhbHJlYWR5IGJlZW4gYXBwbGllZC4KPiAKPj4gQW5kIGFub3RoZXIsIHNsaWdodGx5
IHJlbGF0ZWQgcXVlc3Rpb246IEknbSBub3Qgc3VyZSB3aGF0IHRvIGRvIHdpdGggbXkKPj4gcGF0
Y2ggdG8gZ2V0X21haW50YWluZXIucGwgc2NyaXB0LiBTaG91bGQgSSByZXNlbmQgdGhlIG5ldyB2
ZXJzaW9uPyBKYW4KPj4gaGFkIGNvbW1lbnRzIG9ubHkgdG8gY29tbWl0IG1lc3NhZ2UuLi4KPiAK
PiBXZWxsLCByZS1zZW5kaW5nIG1heSBtYWtlIGl0IGVhc2llciwgYnV0IGZpcnN0IG9mIGFsbCB5
b3UgbmVlZCB0bwo+IGdldCBhIG1haW50YWluZXIgdG8gYWNrIHRoZSBwYXRjaC4gTXkgUGVybCBp
c24ndCBnb29kIGVub3VnaAo+IHRoYXQgSSB3b3VsZCBmZWVsIHF1YWxpZmllZCB0byBnaXZlIG1p
bmUuCgpWb2xvZHlteXIsIHBsZWFzZSByZXNlbmQgdGhlIHBhdGNoIHdpdGggSmFuJ3MgY29tbWVu
dHMgYWRkcmVzc2VkLiBJIGhhZCAKYSBicmllZiBsb29rZWQgdG9kYXkgYW5kIHRoZSBwYXRjaCBs
b29rcyBjb3JyZWN0LiBJIHdpbGwgaGF2ZSBhbm90aGVyIApsb29rIG9uIHRoZSBuZXh0IHZlcnNp
b24uCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
