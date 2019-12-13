Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 020FD11E2F7
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 12:45:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifjMR-0004QI-TE; Fri, 13 Dec 2019 11:43:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ifjMQ-0004Q9-4B
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 11:43:54 +0000
X-Inumbo-ID: d6479c80-1d9d-11ea-8ee7-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d6479c80-1d9d-11ea-8ee7-12813bfff9fa;
 Fri, 13 Dec 2019 11:43:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id ACD04AE84;
 Fri, 13 Dec 2019 11:43:52 +0000 (UTC)
To: Ian Jackson <ian.jackson@citrix.com>
References: <osstest-144723-mainreport@xen.org>
 <24050.30284.331109.130374@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <80d621c6-5a32-3b49-2dee-b8e39151c391@suse.com>
Date: Fri, 13 Dec 2019 12:44:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <24050.30284.331109.130374@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [xen-4.9-testing test] 144723: regressions -
 trouble: fail/pass/starved
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMTIuMjAxOSAxODoxOCwgSWFuIEphY2tzb24gd3JvdGU6Cj4gb3NzdGVzdCBzZXJ2aWNl
IG93bmVyIHdyaXRlcyAoIlt4ZW4tNC45LXRlc3RpbmcgdGVzdF0gMTQ0NzIzOiByZWdyZXNzaW9u
cyAtIHRyb3VibGU6IGZhaWwvcGFzcy9zdGFydmVkIik6Cj4+IGZsaWdodCAxNDQ3MjMgeGVuLTQu
OS10ZXN0aW5nIHJlYWwgW3JlYWxdCj4+IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qu
b3JnL29zc3Rlc3QvbG9ncy8xNDQ3MjMvCj4+Cj4+IFJlZ3Jlc3Npb25zIDotKAo+Pgo+PiBUZXN0
cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKPj4gaW5jbHVkaW5nIHRl
c3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46Cj4+ICB0ZXN0LWFtZDY0LWkzODYteGwtcWVtdXQt
d2luNy1hbWQ2NCAxNSBndWVzdC1zYXZlcmVzdG9yZS4yIGZhaWwgUkVHUi4gdnMuIDE0NDU0NQo+
PiAgdGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11dC13czE2LWFtZDY0IDE2IGd1ZXN0LWxvY2FsbWln
cmF0ZS94MTAgZmFpbCBSRUdSLiB2cy4gMTQ0NTQ1Cj4gCj4gVGhlc2UgdGVzdHMgaGF2ZSBiZWVu
IGZsYWt5IGZvciBhIGxvbmcgdGltZS4gIEdpdmVuIHRoZSA0LjEzIHJlbGVhc2UKPiBzaG91bGQg
Z2V0IHByaW9yaXR5IEkgcHJvcG9zZSB0byBmb3JjZSBwdXNoIHRoaXMgcmF0aGVyIHRoYW4gd2Fp
dGluZwo+IGZvciB0aGUgcmV0ZXN0IHRvIGNvbXBsZXRlLiAgSSB3aWxsIHRoZW4ga2lsbCB0aGUg
cmV0ZXN0IGZsaWdodCwgc2luY2UKPiBzdGFibGUtNC45IHdpbGwgdGhlbiBiZSA9PSBzdGFnaW5n
LTQuOS4KCldlbGwsIG9uZSBvZiB0aGUgdHdvIGhhcyBzdWNjZWVkZWQgaW4gdGhlIG5leHQgZmxp
Z2h0ICh0byBiYWxhbmNlCnRoaW5ncywgdHdvIG90aGVycyBoYXZlIGZhaWxlZCB0aGVyZSkuIElm
IHlvdSdyZSBjb252aW5jZWQgdGhlc2UKaGF2ZSBiZWVuIHJhbmRvbWx5IGZhaWxpbmcgYW55d2F5
IGluIHRoZSBwYXN0LCBJJ20gZmluZSB3aXRoIHlvdQpkb2luZyBhIGZvcmNlIHB1c2gsIGZ3aXcu
CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
