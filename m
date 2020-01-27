Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEBD149ED5
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 06:43:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ivx5y-00051L-9K; Mon, 27 Jan 2020 05:37:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QvhJ=3Q=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ivx5w-00051G-KB
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 05:37:56 +0000
X-Inumbo-ID: 29aeefe5-40c7-11ea-84ce-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29aeefe5-40c7-11ea-84ce-12813bfff9fa;
 Mon, 27 Jan 2020 05:37:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 92D16AE12;
 Mon, 27 Jan 2020 05:37:51 +0000 (UTC)
To: Rich Persaud <persaur@gmail.com>
References: <20200121084330.18309-1-jgross@suse.com>
 <66250848-8C98-4A7E-BA33-986A892BFD31@gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <0403a954-0eb8-177d-45ae-1d303afeaaa0@suse.com>
Date: Mon, 27 Jan 2020 06:37:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <66250848-8C98-4A7E-BA33-986A892BFD31@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 0/9] Add hypervisor sysfs-like support
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
Cc: Jason Andryuk <jandryuk@gmail.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 xen-devel@lists.xenproject.org, Lars Kurth <lars.kurth@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Julien Grall <julien@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDEuMjAgMjM6MDUsIFJpY2ggUGVyc2F1ZCB3cm90ZToKPiBPbiBKYW4gMjEsIDIwMjAs
IGF0IDAzOjQ1LCBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+Pgo+PiDv
u79PbiB0aGUgMjAxOSBYZW4gZGV2ZWxvcGVyIHN1bW1pdCB0aGVyZSB3YXMgYWdyZWVtZW50IHRo
YXQgdGhlIFhlbgo+PiBoeXBlcnZpc29yIHNob3VsZCBnYWluIHN1cHBvcnQgZm9yIGEgaGllcmFy
Y2hpY2FsIG5hbWUtdmFsdWUgc3RvcmUKPj4gc2ltaWxhciB0byB0aGUgTGludXgga2VybmVsJ3Mg
c3lzZnMuCj4gCj4gSXMgdGhlcmUgYSBzaG9ydCBzdW1tYXJ5IG9mIHRoZSBtb3N0IHJlY2VudCB1
c2UgY2FzZXMgZm9yIHRoaXMgZmVhdHVyZSBhbmQgZXhwZWN0ZWQgaW50ZXJhY3Rpb25zIHdpdGgg
b3RoZXIgWGVuIGZlYXR1cmVzIChlLmcuIFBhbm9wdGljb24gWGVuLCBzZWN1cml0eSBjb250cm9s
cyBvbiBpbmZvcm1hdGlvbiB0aGF0IGlzIHZpc2libGUgdG8gZ3Vlc3RzLCBlLmcuIHJlY2VudCBk
aXNjdXNzaW9uIG9uIHZlcnNpb24gbnVtYmVyIGhpZGluZykuIFRoaXMgd291bGQgaW1wYWN0IG1h
bnkgc3Vic3lzdGVtcy4KCkluIHRoZSBmaXJzdCBydW4gYWNjZXNzIGlzIHBlcm1pdHRlZCB0byBk
b20wIG9ubHkuIEFjY2VzcyB0byBvdGhlcgpndWVzdHMgbmVlZHMgdG8gYmUgZGlzY3Vzc2VkLgoK
Q3VycmVudCB1c2UgY2FzZXMgYXJlIGp1c3QgdGhlIGJ1aWxkaW5mbyBsZWFmcyBpbmNsdWRpbmcg
dGhlIC5jb25maWcKb2YgdGhlIGh5cGVydmlzb3IsIHBsdXMgcmVhZGluZyBhbmQgd3JpdGluZyBy
dW50aW1lIHBhcmFtZXRlcnMuCgpJJ2QgbGlrZSB0byBhZGQgcGVyLWNwdXBvb2wgcGFyYW1ldGVy
cyAobGlrZSBTTVQgcGVyIGNwdXBvb2wsCnNjaGVkdWxpbmcgZ3JhbnVsYXJpdHkpIGFuZCBtYXli
ZSBwZXItZG9tYWluIG9uZXMgKGUuZy4gbWl0aWdhdGlvbgpzZXR0aW5ncykuIEFub3RoZXIgYXJl
YSB0byBjb3ZlciB3b3VsZCBiZSBkZWJ1Z2dpbmcgaW50ZXJmYWNlcyBsaWtlCmxvY2sgcHJvZmls
aW5nLCBwZXJmb3JtYW5jZSBjb3VudGVycywgLi4uCgo+IFByZXN1bWFibHkgS2NvbmZpZyBjb3Vs
ZCBlbmFibGUvZGlzYWJsZSB0aGlzIG9wdGlvbmFsIGZlYXR1cmUgYW5kIGFsbCBkZXBlbmRlbmNp
ZXMsIGFuZCB0aGUgWGVuIHRvb2xzdGFjayB3b3VsZCBjb250aW51ZSB0byBmdW5jdGlvbiBub3Jt
YWxseSBpbiBpdHMgYWJzZW5jZS4KCkknZCByYXRoZXIgZ28gdGhlIG90aGVyIHdheSByb3VuZDog
aGF2ZSBhIGRldGFpbGVkIGxvb2sgd2hpY2ggY3VycmVudApwcml2aWxlZ2VkIGludGVyZmFjZXMg
KGRvbWN0bCwgc3lzY3RsKSBjYW4gYmUgcmVwbGFjZWQgYnkgdGhlIGZpbGUKc3lzdGVtIGFuZCBz
d2l0Y2ggb3ZlciB0byBpdCB3aXRoICh3aGVyZSBuZWNlc3NhcnkpIGZpbmUgZ3JhaW5lZAphY2Nl
c3MgY29udHJvbC4gSSB0aGluayB0aGlzIGlzIHNvbWV0aGluZyB0byBkaXNjdXNzIGF0IHRoZSBu
ZXh0IFhlbgpzdW1taXQgaW4gc3VtbWVyIChJIGhhdmUgYWxyZWFkeSByZWdpc3RlcmVkIGEgc2Vz
c2lvbiBmb3IgdGhhdApwdXJwb3NlKS4KCgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
