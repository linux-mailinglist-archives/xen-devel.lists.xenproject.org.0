Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A6C1B79A
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 16:01:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQBTJ-0005qb-Am; Mon, 13 May 2019 13:58:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZP0k=TN=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hQBTH-0005qS-VN
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 13:58:27 +0000
X-Inumbo-ID: 2de2a936-7587-11e9-91df-4fbab8f2f0fd
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2de2a936-7587-11e9-91df-4fbab8f2f0fd;
 Mon, 13 May 2019 13:58:27 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 C0798301AB4A; Mon, 13 May 2019 16:58:25 +0300 (EEST)
Received: from [10.10.196.90] (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id B5EAA306E479;
 Mon, 13 May 2019 16:58:25 +0300 (EEST)
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
To: Jan Beulich <JBeulich@suse.com>
References: <20181116170412.xrwuun3cqxll22l3@mac>
 <b83547dc-f8bd-d537-0407-fc371fee2ea7@bitdefender.com>
 <20181122100554.pyqqa5iw6g27erkv@mac>
 <7efdfb5e-044b-f2a3-6562-d3468997096a@bitdefender.com>
 <20181122105821.6ihjcq5dy2lqjj6j@mac>
 <98f57a8a-288d-45ec-ef01-889fce63eeff@bitdefender.com>
 <20181122144924.ffy6xxwqugoj24nj@mac>
 <c4eca955-0384-7988-ae6c-6385823523ae@bitdefender.com>
 <20181122153756.au3ntxgfqjjhd6sb@mac>
 <a945d190-c891-6a90-01cd-c0cc723699ae@bitdefender.com>
 <20181122170801.pzdoif2g73aamnmu@mac>
 <f3ec3175-1c2e-e3a2-ed8f-63bf4c235fca@bitdefender.com>
 <838191050200006B34861ACF@prv1-mh.provo.novell.com>
 <5BF7C36F02000078001FF3E1@prv1-mh.provo.novell.com>
 <cb265527-4a69-01d9-9089-60b4b4fab22a@bitdefender.com>
Message-ID: <bdd2240b-f1e9-3671-d3a1-996accdbacea@bitdefender.com>
Date: Mon, 13 May 2019 16:58:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <cb265527-4a69-01d9-9089-60b4b4fab22a@bitdefender.com>
Content-Language: en-US-large
Subject: Re: [Xen-devel] [PATCH v1] x86/hvm: Generic instruction
 re-execution mechanism for execute faults
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
Cc: aisaila@bitdefender.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Andrei LUTAS <vlutas@bitdefender.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMjcvMTggMTI6NDkgUE0sIFJhenZhbiBDb2pvY2FydSB3cm90ZToKPj4gV2l0aCBhIHN1
ZmZpY2llbnRseSBjb21wbGV0ZSBpbnNuIGVtdWxhdG9yLCBzaW5nbGUtc3RlcHBpbmcgc2hvdWxk
Cj4+IG5vdCBiZSBuZWVkZWQgYXQgYWxsIGltby4gR3JhbnRlZCB3ZSdyZSBub3QgcXVpdGUgdGhl
cmUgeWV0IHdpdGgKPj4gdGhlIGVtdWxhdG9yLCBidXQgd2UndmUgbWFkZSBxdWl0ZSBhIGJpdCBv
ZiBwcm9ncmVzcy4gQXMgYmVmb3JlLAo+PiBpZiB0aGVyZSBhcmUgcGFydGljdWxhciBpbnN0cnVj
dGlvbnMgeW91IGtub3cgb2YgdGhhdCB0aGUgZW11bGF0b3IKPj4gZG9lc24ndCBoYW5kbGUgeWV0
LCBwbGVhc2Uga2VlcCBwb2ludGluZyB0aGVzZSBvdXQuIExhc3QgSSBrbm93Cj4+IHdlcmUgc29t
ZSBBVlggbW92ZSBpbnN0cnVjdGlvbnMsIHdoaWNoIGhhdmUgbG9uZyBiZWVuCj4+IGltcGxlbWVu
dGVkLgo+IFRydWUsIEkgaGF2ZW4ndCBzZWVuIGVtdWxhdG9yIGlzc3VlcyBpbiB0aGF0IHJlc3Bl
Y3Qgd2l0aCBzdGFnaW5nIC0gdGhlCj4gZW11bGF0b3IgYXBwZWFycyBsYXRlbHkgdG8gYmUgc3Vm
ZmljaWVudGx5IGNvbXBsZXRlLiBUaGFuayB5b3UgdmVyeSBtdWNoCj4gZm9yIHlvdXIgaGVscCBh
bmQgc3VwcG9ydCAtIHdlJ2xsIGRlZmluaXRlbHkgcG9pbnQgb3V0IHVuc3VwcG9ydGVkCj4gaW5z
dHJ1Y3Rpb25zIGlmIHdlIHNwb3Qgc29tZSBhZ2Fpbi4KCldlJ3ZlIGNvbWUgYWNjcm9zcyBhIG5l
dyBpbnN0cnVjdGlvbiB0aGF0IHRoZSBlbXVsYXRvciBjYW4ndCBoYW5kbGUgaW4gClhlbiA0LjEz
LXVuc3RhYmxlIHRvZGF5OgoKdnBtYWRkd2QgeG1tNCx4bW00LFhNTVdPUkQgUFRSIGRzOjB4NTEz
ZmJiMjAKClBlcmhhcHMgdGhlcmUgYXJlIHBsYW5zIGZvciB0aGlzIHRvIGdvIGludG8gdGhlIGVt
dWxhdG9yIGFzIHdlbGw/CgoKVGhhbmtzLApSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
