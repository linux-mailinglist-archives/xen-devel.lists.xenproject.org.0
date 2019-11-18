Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F30100844
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 16:29:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWiva-00043I-GL; Mon, 18 Nov 2019 15:26:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2ywg=ZK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iWivZ-00043D-4f
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 15:26:57 +0000
X-Inumbo-ID: dac94c02-0a17-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dac94c02-0a17-11ea-9631-bc764e2007e4;
 Mon, 18 Nov 2019 15:26:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1C3F6AE55;
 Mon, 18 Nov 2019 15:26:55 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <0e47b56a-4e5d-e815-2e74-eab5da11f3d0@posteo.de>
 <45f6c5bf-2d24-d3d7-1c61-f8e2da04b5b7@citrix.com>
 <b9bb16ee-88c3-ed78-e338-81dd08020fcf@suse.com>
 <7ed0f334-67ba-7a72-100d-19be46fe50f9@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2ad18c07-435e-6117-11da-dd9ddf021f9e@suse.com>
Date: Mon, 18 Nov 2019 16:26:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <7ed0f334-67ba-7a72-100d-19be46fe50f9@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Ryzen 3xxx works with Windows
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
Cc: AndrewCooper <andrew.cooper3@citrix.com>, Steven Haigh <netwiz@crc.id.au>,
 Andreas Kinzler <hfp@posteo.de>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMTEuMjAxOSAxNjoxNSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAxMS8xOC8xOSAx
Mjo1NCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE4LjExLjIwMTkgMTI6MzksIEdlb3Jn
ZSBEdW5sYXAgd3JvdGU6Cj4+PiBPbiAxMS8xNS8xOSA1OjA2IFBNLCBBbmRyZWFzIEtpbnpsZXIg
d3JvdGU6Cj4+Pj4gSGVsbG8gQWxsLAo+Pj4+Cj4+Pj4gSSBjb21wYXJlZCB0aGUgQ1BVSUQgbGlz
dGluZ3MgZnJvbSBSeXplbiAyNzAwWCAoYXR0YWNoZWQgYXMgdGFyLnh6KSB0bwo+Pj4+IDM3MDBY
IGFuZCBmb3VuZCBvbmx5IHZlcnkgZmV3IGRpZmZlcmVuY2VzLiBJIGFkZGVkCj4+Pj4KPj4+PiBj
cHVpZCA9IFsgIjB4ODAwMDAwMDg6ZWN4PXh4eHh4eHh4eHh4eHh4eHgwMTAweHh4eHh4eHh4eHh4
IiBdCj4+Pj4KPj4+PiB0byB4bC5jZmcgYW5kIHRoZW4gV2luZG93cyBydW5zIGdyZWF0IHdpdGgg
MTYgdkNQVXMuIENpbmViZW5jaCBSMTUgc2NvcmUKPj4+PiBpcyA+MjA1MCB3aGljaCBpcyBtb3Jl
IG9yIGxlc3MgdGhlIGJhcmUgbWV0YWwgdmFsdWUuCj4+Pgo+Pj4gU28gdGhpcyBpcyBzZXR0aW5n
IHRob3NlIGJpdHMgdG8gMDEwMCwgb3IgNC4KPj4KPj4gT25lIG9mIHRoZSBtYW55IHBvc3NpYmxl
IHByb2JsZW1zIHdpdGggb3VyIGluY3JlbWVudGluZyBvZiB0aGlzIGZpZWxkCj4+IGNvdWxkIGJl
IHRoYXQgdGhpcyByZXN1bHRzIGluIGEgdmFsdWUgdGhhdCBpbiAicmVzZXJ2ZWQiIGFzIHBlciBB
TUQncwo+PiBkb2N1bWVudGF0aW9uLiBBdCBsZWFzdCBmb3Igc29tZSBvZiB0aGUgRmFtMTcgbW9k
ZWxzIHRoZXkgZG9jdW1lbnQKPj4gZXhhY3RseSB3aGljaCB2YWx1ZXMgYXJlICJsZWdhbCIuCj4g
Cj4gRG8geW91IGhhdmUgYSByZWZlcmVuY2UgZm9yIHRoaXM/CgpVbmZvcnR1bmF0ZWx5IG5vbmUg
dGhhdCBJIGNhbiBzaGFyZS4gQnV0IHlvdSBjYW4gYmV0IHRoYXQgT1MgdmVuZG9ycyB1c2UKdGhh
dCByYXRoZXIgdGhhbiB0aGUgcHVibGljIHZhcmlhbnQocykgZm9yIHRoZWlyIGRldmVsb3BtZW50
IHdvcmsuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
