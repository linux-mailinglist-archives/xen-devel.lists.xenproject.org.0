Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 317FC1B7D2
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 16:10:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQBbd-00079h-HC; Mon, 13 May 2019 14:07:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cGAx=TN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQBbc-00079a-GE
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 14:07:04 +0000
X-Inumbo-ID: 61623fd2-7588-11e9-9ccd-13fdcfbe60aa
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 61623fd2-7588-11e9-9ccd-13fdcfbe60aa;
 Mon, 13 May 2019 14:07:02 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 13 May 2019 08:07:01 -0600
Message-Id: <5CD97A01020000780022E283@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 13 May 2019 08:06:57 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Razvan Cojocaru" <rcojocaru@bitdefender.com>
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
 <bdd2240b-f1e9-3671-d3a1-996accdbacea@bitdefender.com>
In-Reply-To: <bdd2240b-f1e9-3671-d3a1-996accdbacea@bitdefender.com>
Mime-Version: 1.0
Content-Disposition: inline
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDEzLjA1LjE5IGF0IDE1OjU4LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gT24gMTEvMjcvMTggMTI6NDkgUE0sIFJhenZhbiBDb2pvY2FydSB3cm90ZToKPj4+IFdp
dGggYSBzdWZmaWNpZW50bHkgY29tcGxldGUgaW5zbiBlbXVsYXRvciwgc2luZ2xlLXN0ZXBwaW5n
IHNob3VsZAo+Pj4gbm90IGJlIG5lZWRlZCBhdCBhbGwgaW1vLiBHcmFudGVkIHdlJ3JlIG5vdCBx
dWl0ZSB0aGVyZSB5ZXQgd2l0aAo+Pj4gdGhlIGVtdWxhdG9yLCBidXQgd2UndmUgbWFkZSBxdWl0
ZSBhIGJpdCBvZiBwcm9ncmVzcy4gQXMgYmVmb3JlLAo+Pj4gaWYgdGhlcmUgYXJlIHBhcnRpY3Vs
YXIgaW5zdHJ1Y3Rpb25zIHlvdSBrbm93IG9mIHRoYXQgdGhlIGVtdWxhdG9yCj4+PiBkb2Vzbid0
IGhhbmRsZSB5ZXQsIHBsZWFzZSBrZWVwIHBvaW50aW5nIHRoZXNlIG91dC4gTGFzdCBJIGtub3cK
Pj4+IHdlcmUgc29tZSBBVlggbW92ZSBpbnN0cnVjdGlvbnMsIHdoaWNoIGhhdmUgbG9uZyBiZWVu
Cj4+PiBpbXBsZW1lbnRlZC4KPj4gVHJ1ZSwgSSBoYXZlbid0IHNlZW4gZW11bGF0b3IgaXNzdWVz
IGluIHRoYXQgcmVzcGVjdCB3aXRoIHN0YWdpbmcgLSB0aGUKPj4gZW11bGF0b3IgYXBwZWFycyBs
YXRlbHkgdG8gYmUgc3VmZmljaWVudGx5IGNvbXBsZXRlLiBUaGFuayB5b3UgdmVyeSBtdWNoCj4+
IGZvciB5b3VyIGhlbHAgYW5kIHN1cHBvcnQgLSB3ZSdsbCBkZWZpbml0ZWx5IHBvaW50IG91dCB1
bnN1cHBvcnRlZAo+PiBpbnN0cnVjdGlvbnMgaWYgd2Ugc3BvdCBzb21lIGFnYWluLgo+IAo+IFdl
J3ZlIGNvbWUgYWNjcm9zcyBhIG5ldyBpbnN0cnVjdGlvbiB0aGF0IHRoZSBlbXVsYXRvciBjYW4n
dCBoYW5kbGUgaW4gCj4gWGVuIDQuMTMtdW5zdGFibGUgdG9kYXk6Cj4gCj4gdnBtYWRkd2QgeG1t
NCx4bW00LFhNTVdPUkQgUFRSIGRzOjB4NTEzZmJiMjAKPiAKPiBQZXJoYXBzIHRoZXJlIGFyZSBw
bGFucyBmb3IgdGhpcyB0byBnbyBpbnRvIHRoZSBlbXVsYXRvciBhcyB3ZWxsPwoKWW91J3JlIGtp
ZGRpbmc/IFRoaXMgaXMgYWxyZWFkeSBpbiA0LjEyLjAsIGFuZCBpZiBpdCB3ZXJlbid0IEknbSBz
dXJlCnlvdSdyZSBhd2FyZSB0aGVyZSBhcmUgYWJvdXQgNDAgbW9yZSBBVlg1MTIgcGF0Y2hlcyBw
ZW5kaW5nCnJldmlldy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
