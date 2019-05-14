Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD1F1CA22
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 16:19:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQYEH-0007MA-W3; Tue, 14 May 2019 14:16:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQYEG-0007M5-53
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 14:16:28 +0000
X-Inumbo-ID: dc2f6372-7652-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id dc2f6372-7652-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 14:16:26 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 14 May 2019 08:16:25 -0600
Message-Id: <5CDACDB5020000780022EC35@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 14 May 2019 08:16:21 -0600
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
 <5CD97A01020000780022E283@prv1-mh.provo.novell.com>
 <afef10b4-a7e8-acf3-49f6-363cbaf52047@bitdefender.com>
 <345e5e15-6a0a-c1f7-d22f-fe9eb06ed476@bitdefender.com>
In-Reply-To: <345e5e15-6a0a-c1f7-d22f-fe9eb06ed476@bitdefender.com>
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

Pj4+IE9uIDE0LjA1LjE5IGF0IDE1OjQ3LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gTWVtIGV2ZW50IGVtdWxhdGlvbiBmYWlsZWQgKDUpOiBkNXYwIDMyYml0IEAgMDAxYjo2
ZDk2ZWZmZiAtPiBjNSBmOSBmNSAKPiAwNSBjMCBiZSBhZCA2ZCBjNSBlMSBmZSAxZCBhMCAyMCBh
ZiA2ZAo+IAo+IExvb2tpbmcgYXQgdGhlIHNvdXJjZSBjb2RlLCB0aGUgZW11bGF0b3IgZG9lcyBh
cHBlYXIgdG8gc3VwcG9ydCAKPiB2cG1hZGR3ZCwgaG93ZXZlciBvbmx5IGZvciBFVkVYOgo+IAo+
IGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1ibG9iO2Y9eGVuL2Fy
Y2gveDg2L3g4Nl9lbXVsYXRlL3ggCj4gODZfZW11bGF0ZS5jO2g9MDMyOTk1ZWE1ODZhYTdkZDkw
YTE5NTNiNmRlZDY1NjQzNjY1MjA0OTtoYj1yZWZzL2hlYWRzL3N0YWdpbmcKPiAjbDY2OTYKPiAK
PiB3aGVyZWFzIG91ciBmYWlsIGNhc2UgdXNlcyBWRVguCj4gCj4gVGhpcyBtYXkgYmUgaW4gdGhl
IHdvcmtzIGluIHRoZSBhZm9yZW1lbnRpb25lZCBzZXJpZXMsIGJ1dCBpcyAKPiBsZWdpdGltYXRl
bHkgdW5zdXBwb3J0ZWQgaW4gNC4xMyBzdGFnaW5nLgoKSG1tLCBpbnRlcmVzdGluZy4gVGhlIG9y
aWdpbiBvZiB0aGUgZW5jb2RpbmcgaXMgYXQgTU1YIHRpbWVzLAp3aGljaCBtZWFucyBpdCdzIG1v
cmUgdGhhbiBqdXN0IFZQTUFERFdEIHRoYXQncyBtaXNzaW5nLCBhbmQKaXQncyBiZWVuIGFuIG9t
aXNzaW9uIGJhY2sgaW4gdGhlIE1NWC9TU0UyIHNlcmllcyB0aGVuLiBUaGF0J3MKYSBnZW51aW5l
IG92ZXJzaWdodCwgYW5kIGluIHRoZSBsaWdodCBvZiB0aGlzIEknZCBsaWtlIHRvIGFwb2xvZ2l6
ZQpmb3IgbXkgdW5mcmllbmRseSBpbml0aWFsIHJlYWN0aW9uLiBJJ2xsIHNlZSBhYm91dCBnZXR0
aW5nIHRoaXMgZml4ZWQuCihJdCB3b3VsZCBoYXZlIGhlbHBlZCBpZiB5b3UgaGFkIHNoYXJlZCB0
aGUgZW5jb2RpbmcgcmlnaHQgYXdheSwKc2luY2UgdGhlIG1uZW1vbmljIGFuZCBvcGVyYW5kcyBh
cmUgbm93IG9mdGVuIGluc3VmZmljaWVudC4pCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
