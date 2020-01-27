Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF0814A60F
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 15:29:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw5MV-0000Oo-DS; Mon, 27 Jan 2020 14:27:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1l6N=3Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iw5MU-0000Oj-8H
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 14:27:34 +0000
X-Inumbo-ID: 27ab7754-4111-11ea-aecd-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27ab7754-4111-11ea-aecd-bc764e2007e4;
 Mon, 27 Jan 2020 14:27:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CC083AC69;
 Mon, 27 Jan 2020 14:27:31 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <4cb6e142-5fec-7608-0c9c-d8c7c75e47d3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <07c64009-35cd-39ff-2e02-baf12584e661@suse.com>
Date: Mon, 27 Jan 2020 15:27:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <4cb6e142-5fec-7608-0c9c-d8c7c75e47d3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [Vote] Approve hypervisor project check-in policy
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDEuMjAyMCAxNToxMiwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBJIGhhdmUgZHJhZnRl
ZCBhbiBleHBsaWNpdCBwb2xpY3kgb24gd2hhdCBpcyAoZ2VuZXJhbGx5KSByZXF1aXJlZCB0bwo+
IGNoZWNrIGEgcGF0Y2ggaW4uICBJdCdzIGJlZW4gdGhyb3VnaCBzZXZlcmFsIHJvdW5kcywgYW5k
IHY0IGhhcyBiZWVuCj4gYWNrZWQgWzFdLgo+IAo+IEkndmUgaGFkIGluZm9ybWFsIGFzc2VudCBm
cm9tIGFsbCBjb21taXR0ZXJzLCBidXQganVzdCB0byBkb3QgYWxsIG91cgo+IGkncyBhbmQgY3Jv
c3MgYWxsIG91ciB0J3MsIGl0J3MgcHJvYmFibHkgd29ydGggaGF2aW5nIGEgdm90ZSBvZiB0aGUK
PiBjb21taXR0ZXJzLCBpbiBsaW5lIHdpdGggdGhlIFhlblByb2plY3QgZ292ZXJuYW5jZSBwb2xp
Y3kgWzFdLgo+IAo+IFBsZWFzZSByZXNwb25kIGJ5IDEwIEZlYnJ1YXJ5IHdpdGggeW91ciB2b3Rl
Ogo+ICsxOiBmb3IgcHJvcG9zYWwKPiAtMTogYWdhaW5zdCBwcm9wb3NhbAo+IGluIHB1YmxpYyBv
ciBwcml2YXRlLgoKKzEKCkFzIGFuIGFzaWRlLCBJIG5vdGljZSB5b3UgbWF5IHdhbnQgdG8gdXBk
YXRlIHlvdXIgYWRkcmVzcyBib29rLiBJJ3ZlCmNvcnJlY3RlZCBXZWkncyBhbmQgSnVsaWVuJ3Mg
ZW1haWwgYWRkcmVzc2VzLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
