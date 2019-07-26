Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5721D76E59
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 17:57:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr2YV-00047z-DK; Fri, 26 Jul 2019 15:54:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ymAH=VX=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hr2YT-00047u-Ti
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 15:54:49 +0000
X-Inumbo-ID: b1c637be-afbd-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id b1c637be-afbd-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 15:54:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99576337;
 Fri, 26 Jul 2019 08:54:47 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D3C13F71F;
 Fri, 26 Jul 2019 08:54:45 -0700 (PDT)
To: Viktor Mitin <viktor.mitin.19@gmail.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Lars Kurth
 <lars.kurth.xen@gmail.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <CAOcoXZbJHzfde_Os=i58vio7nXU2u=V0Tph3gQ_GYhE_UFtUcQ@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <6b2e18cb-d02a-be2a-74b3-bf9443d9d0eb@arm.com>
Date: Fri, 26 Jul 2019 16:54:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAOcoXZbJHzfde_Os=i58vio7nXU2u=V0Tph3gQ_GYhE_UFtUcQ@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC] xen: Add .astylerc for automated
 style-formatting
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyNi8wNy8yMDE5IDE2OjQ4LCBWaWt0b3IgTWl0aW4gd3JvdGU6Cj4gSGkgQWxsLAo+IAo+
IE9uIFRodSwgSnVsIDE4LCAyMDE5IGF0IDU6NDUgUE0gVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0
a2xlbmd5ZWwuY29tPiB3cm90ZToKPiAKPj4gQ2hlY2tpbmcgdGhlIGNvbW1lbnQgc3R5bGVzIGFy
ZSBub3QgaW5jbHVkZWQgaW4gdGhlIGF1dG9tYXRpb24uCj4gCj4gVGhlIHNhbWUgYWJvdXQgY2xh
bmctZm9ybWF0LiBDaGVja2luZyB0aGUgY29tbWVudCBzdHlsZXMgaXMgbm90IHN1cHBvcnRlZC4K
PiBJdCBzZWVtcyB0aGlzIGlzIG5vdCBjb2RlIGZvcm1hdCBjaGVja2VyIHRhc2sgdG8gcGFyc2Ug
YW5kIG1vZGlmeSB0aGUKPiBjb2RlIGNvbW1lbnRzLi4uCgpBcmUgeW91IHN1cmUgYWJvdXQgeW91
ciBzdGF0ZW1lbnQ/IExvb2tpbmcgYXQgdGhlIGRpZmYgeW91IHByb3ZpZGVkIFsxXSwgCmNsYW5n
LWZvcm1hdCBpcyBjbGVhcmx5IHRyeWluZyB0byBhbHRlciB0aGUgY29tbWVudHMuCgpCdXQgY29t
bWVudHMgZmxvdyBhcmUgZXF1YWxseSBpbXBvcnRhbnQgYXMgdGhlIGNvZGUuIFRoaXMgaXMgcGFy
dCBvZiB0aGUgY29kaW5nIApzdHlsZSBhZnRlcmFsbC4KClsxXSAKaHR0cHM6Ly9yYXcuZ2l0aHVi
dXNlcmNvbnRlbnQuY29tL3Zpa3Rvci1taXRpbi94ZW4tY2xhbmctZm9ybWF0LWV4YW1wbGUvbWFz
dGVyLzAwMDEtY2xhbmctZm9ybWF0LWNoZWNrcGF0Y2gtb3V0cHV0LWV4YW1wbGUucGF0Y2gKCj4g
Cj4gVGhhbmtzCj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
