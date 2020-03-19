Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 479F118ACAD
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 07:17:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEoRT-0005vT-Jh; Thu, 19 Mar 2020 06:14:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dEF6=5E=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jEoRR-0005vO-Rh
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 06:14:05 +0000
X-Inumbo-ID: d3d78e22-69a8-11ea-bbc5-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d3d78e22-69a8-11ea-bbc5-12813bfff9fa;
 Thu, 19 Mar 2020 06:14:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3C480ABAE;
 Thu, 19 Mar 2020 06:14:01 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <20200319022640.GY7869@mail-itl>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <88465b46-df1c-da09-c5ec-b9db63452511@suse.com>
Date: Thu, 19 Mar 2020 07:14:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200319022640.GY7869@mail-itl>
Content-Language: en-US
Subject: Re: [Xen-devel] PV dom0 crash: kernel NULL pointer dereference in
 evtchn_from_irq
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDMuMjAgMDM6MjYsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToKPiBI
aSwKPiAKPiAgRnJvbSB0aW1lIHRvIHRpbWUsIGR1cmluZyBpbnRlbnNpdmUgdGVzdHMgSSBnZXQg
dGhlIGRvbTAgY3Jhc2ggbGlrZQo+IGJlbG93LiBUaGlzIGlzIFBWIGRvbTAsIHJ1bm5pbmcgb24g
WGVuIG5lc3RlZCBpbnNpZGUgS1ZNLgo+IEkgZG9uJ3QgcmVhbGx5IGtub3cgd2hlbiBpdCBzdGFy
dGVkIGhhcHBlbmluZywgSSd2ZSBnb3QgaXQgb24gYXQgbGVhc3QKPiB0aG9zZSB2ZXJzaW9uczoK
PiAgIC0gWGVuIDQuOC41ICsgTGludXggZG9tMCA0LjE5Ljk0Cj4gICAtIFhlbiA0LjEzLjAgKyBM
aW51eCBkb20wIDUuNC4yNQo+ICAgLSBhdCBsZWFzdCBvbmNlIGFsc28gb24gcGh5c2ljYWwgaGFy
ZHdhcmUgKFhlbiA0LjEzLjAgKyBMaW51eCBkb20wCj4gICAgIDUuNC54KQo+IAo+IENvbnRyYXJ5
IHRvIHRoZSBvdGhlciBpc3N1ZSwgaGVyZSBzdXNwZW5kIGlzIG5vdCBpbnZvbHZlZCwgaXQgaXMg
anVzdAo+IGludGVuc2l2ZSBzeXN0ZW0gdXNhZ2UgLSBtdWx0aXBsZSBWTSBzdGFydHVwcywgaW52
b2x2aW5nIHNvbWUgSS9PLAo+IG5ldHdvcmsgdHJhZmZpYyBldGMuIFRoaXMgaGFwcGVucyByYXRo
ZXIgcmFyZWx5IChJJ2Qgc2F5IGFib3V0IDEtMyUgb2YKPiB0ZXN0cykuCj4gVG8gYmUgaG9uZXN0
LCBJJ20gbm90IHJlYWxseSBzdXJlIGlmIHRoZSBidWcgaXMgaW4gWGVuLXJlbGF0ZWQgY29kZSBh
dAo+IGFsbCwgb3IgaWYgWGVuIGZ1bmN0aW9ucyBhcmUgaW4gdGhlIGNhbGwgdHJhY2Ugb25seSBi
ZWNhdXNlIGl0IGlzIFBWCj4gZG9tMC4KPiAKPiBGdWxsIGNyYXNoIG1lc3NhZ2U6Cj4gCj4gWzE0
NDc0LjYxMzcwNl0gQlVHOiBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlLCBhZGRyZXNz
OiAwMDAwMDAwMDAwMDAwMDFjCj4gWzE0NDc0LjYxNTgzMl0gI1BGOiBzdXBlcnZpc29yIHJlYWQg
YWNjZXNzIGluIGtlcm5lbCBtb2RlCj4gWzE0NDc0LjYxNzMyMV0gI1BGOiBlcnJvcl9jb2RlKDB4
MDAwMCkgLSBub3QtcHJlc2VudCBwYWdlCj4gWzE0NDc0LjYxODcwMl0gUEdEIDAgUDREIDAKPiBb
MTQ0NzQuNjE5NDUyXSBPb3BzOiAwMDAwIFsjMV0gU01QIE5PUFRJCj4gWzE0NDc0LjYyMDQ1Ml0g
Q1BVOiAwIFBJRDogNDMxMjU0IENvbW06IHJtIE5vdCB0YWludGVkIDUuNC4yNS0xLnF1YmVzLng4
Nl82NCAjMQo+IFsxNDQ3NC42MjI5MDBdIEhhcmR3YXJlIG5hbWU6IFFFTVUgU3RhbmRhcmQgUEMg
KGk0NDBGWCArIFBJSVgsIDE5OTYpLCBCSU9TIHJlbC0xLjEyLjAtNTktZ2M5YmE1MjctcmVidWls
dC5vcGVuc3VzZS5vcmcgMDQvMDEvMjAxNAo+IFsxNDQ3NC42MjYzMjJdIFJJUDogZTAzMDpldnRj
aG5fZnJvbV9pcnErMHgxZi8weDQwCgpJIGhhdmUgc2VlbiB0aGlzIHdoaWxlIHRlc3Rpbmcgc29t
ZSBldmVudCBjaGFubmVsIHJlbGF0ZWQgcGF0Y2hlcyBhbmQKdGhvdWdodCBJIHdhcyBpbnRyb2R1
Y2luZyB0aGlzIGNhc2UuIFNlZW1zIGFzIGlmIGl0IGNhbiBoYXBwZW4gZXZlbgp3aXRob3V0IG15
IHBhdGNoZXMuCgpJJ2xsIHNlbmQgdGhlIGZpeHVwIEkndmUgYWRkZWQgdG8gbXkgc2VyaWVzIHNv
b24uCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
