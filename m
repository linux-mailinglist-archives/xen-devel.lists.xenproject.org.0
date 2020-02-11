Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC07158F78
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 14:05:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1VCM-000269-F5; Tue, 11 Feb 2020 13:03:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Euq9=37=disroot.org=claudia1@srs-us1.protection.inumbo.net>)
 id 1j1V8Q-0001JE-FK
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 12:59:26 +0000
X-Inumbo-ID: 53d62091-4cce-11ea-b593-12813bfff9fa
Received: from knopi.disroot.org (unknown [178.21.23.139])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 53d62091-4cce-11ea-b593-12813bfff9fa;
 Tue, 11 Feb 2020 12:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id CE22C249B5;
 Tue, 11 Feb 2020 13:59:23 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MPlvvZB0qrka; Tue, 11 Feb 2020 13:59:22 +0100 (CET)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1581425962; bh=EBSvISQvLRdqa/SxfWelYjovZJ48IVyBfxEH1j+D0V8=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References;
 b=PdWywHIBx5sT/1vmRukW6zpuMUSzsdVQk3Ltf/Yt6n/tkKoi4Si2j90hFJTEL/Qsj
 I9GKsPqCAaNly9AUo/acsHQz6/q87tNob5MWSGCG1iIXfFddKJkwNAY9DdDv1vwhUE
 FY0JSWoi5zjiQAir5gVVxKlL7G/zIEBlvrNC+y8yoJQxf4qE/kIzv67hd62S7BHI6j
 YJY2uXoZ1FPSei9Kun2w1FgFSGWsUIawPDYPtIClC6QFeHyRA7B3jJai016m/0fD0g
 5nOwPwjiX4ZXp56Bin65APo6zMh/a64Btcb1KlwIDJ8pHuSVUH40O8sHG5c+xg0IGz
 zm5eUAtehw6Xw==
Date: Tue, 11 Feb 2020 12:59:22 +0000
From: "Claudia" <claudia1@disroot.org>
Message-ID: <b1dfd8e66ff2cfdd1a5d77d46238b637@disroot.org>
To: "=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?="
 <marmarek@invisiblethingslab.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>
In-Reply-To: <20200210121443.GQ7869@mail-itl>
References: <20200210121443.GQ7869@mail-itl> <20200209230655.GA32524@mail-itl>
 <a6b9455d-dea1-6c61-ff7f-4fbaaba9a953@suse.com>
 <41b3896b-5414-bfdf-a515-bf2f06ab6463@citrix.com>
X-Mailman-Approved-At: Tue, 11 Feb 2020 13:03:29 +0000
Subject: Re: [Xen-devel] Xen fails to resume on AMD Fam15h (and Fam17h?)
 because of CPUID mismatch
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, zachm1996@gmail.com,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RmVicnVhcnkgMTAsIDIwMjAgMTI6MTQgUE0sICJNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2ki
IDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPiB3cm90ZToKCj4gT24gTW9uLCBGZWIg
MTAsIDIwMjAgYXQgMTE6MTc6MzRBTSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiAKPj4g
T24gMTAvMDIvMjAyMCAwODo1NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDEwLjAyLjIwMjAg
MDA6MDYsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToKPj4gSGksCj4+IAo+PiBN
dWx0aXBsZSBRdWJlcyB1c2VycyBoYXZlIHJlcG9ydGVkIGlzc3VlcyB3aXRoIHJlc3VtaW5nIGZy
b20gUzMgb24gQU1ECj4+IHN5c3RlbXMgKFJ5emVuIDI1MDBVLCBSeXplbiBQcm8gMzcwMFUsIG1h
eWJlIG1vcmUpLiBUaGUgZXJyb3IgbWVzc2FnZQo+PiBpczoKPj4gCj4+IChYRU4pIENQVTA6IGNh
cFsgMV0gaXMgN2VkODMyMGIgKGV4cGVjdGVkIGY2ZDgzMjBiKQo+PiAKPj4gSWYgSSByZWFkIGl0
IHJpZ2h0LCB0aGlzIGlzOgo+PiAtIE9TWFNBVkU6IDAgLT4gMQo+PiAtIEhZUEVSVklTT1I6IDEg
LT4gMAo+PiAKPj4gQ29tbWVudGluZyBvdXQgdGhlIHBhbmljIG9uIGEgZmFpbGVkIHJlY2hlY2tf
Y3B1X2ZlYXR1cmVzKCkgaW4gcG93ZXIuYwo+PiBtYWtlcyB0aGUgc3lzdGVtIHdvcmsgYWZ0ZXIg
cmVzdW1lLCByZXBvcnRlZGx5IHN0YWJsZS4gQnV0IHRoYXQgZG9lc24ndAo+PiBzb3VuZHMgbGlr
ZSBhIGdvb2QgaWRlYSBnZW5lcmFsbHkuCj4+IAo+PiBJcyB0aGlzIGRpZmZlcmVuY2UgYSBYZW4g
ZmF1bHQgKHNvbWUgbWlzc2luZyBNU1IgLyBvdGhlciByZWdpc3Rlcgo+PiByZXN0b3JlIG9uIHJl
c3VtZSk/IE9yIEJJT1MgdmVuZG9yIC8gQU1ELCB0aGF0IGNvdWxkIGJlIHdvcmtlZCBhcm91bmQg
aW4KPj4gWGVuPwo+PiBUaGUgdHJhbnNpdGlvbiBvZiB0aGUgSFlQRVJWSVNPUiBiaXQgaXMgZGVm
aW5pdGVseSBhIFhlbiBpc3N1ZSwKPj4gd2l0aCBBbmRyZXcgaGF2aW5nIHNlbnQgYSBwYXRjaCBh
bHJlYWR5IChpaXJjKS4KPj4gCj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3hlbi1kZXZlbC8y
MDIwMDEyNzIwMjEyMS4yOTYxLTEtYW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbQo+PiAKPj4gQ29k
ZSBpcyBjb3JyZWN0LiAgQ29tbWl0IG1lc3NhZ2UgbmVlZHMgcmV3b3JrLCBpbmNsdWRpbmcgaW4g
bGlnaHQgb2YKPj4gdGhpcyBkaXNjb3ZlcnkuICAoSSBtYXkgZXZlbnR1YWxseSBzcGxpdCBpdCBp
bnRvIHR3byBwYXRjaGVzLikKPiAKPiBDbGF1ZGlhLCBkbyB5b3Ugd2FudCB0byB0ZXN0IHdpdGgg
dGhpcyBwYXRjaD8KCkknbSBnZXR0aW5nIGh1bmsgZmFpbGVkIGluIGRvbWN0bC5jIGFwcGx5aW5n
IHRvIFI0LjEgZGVmYXVsdCByZXBvIChmYzMxLCBYZW4gNC4xMykuIEknbGwgc2VlIGlmIEkgY2Fu
IGZpeCBpdCBidXQgYmVhciB3aXRoIG1lLCBJJ20gbmV3IGF0IHRoaXMuCgpNYXJlazogV291bGQg
eW91IGJ5IGFueSBjaGFuY2UgYmUgd2lsbGluZyB0byBtZXJnZSB0aGlzIGludG8gYSB0ZXN0IGJy
YW5jaCBvbiB5b3VyIHJlcG8sIHNvIHRoZSByZXN0IG9mIHVzIGNhbiBwdWxsIGl0IGRpcmVjdGx5
IGludG8gcXViZXMtYnVpbGRlcj8gSXQnbGwgdGFrZSB5b3UgYSBmcmFjdGlvbiBvZiB0aGUgdGlt
ZSBpdCdsbCB0YWtlIG1lLCBwbHVzIHRoZW4gemFjaG0gYW5kIGF3b2tkIGFuZCBhbnlvbmUgZWxz
ZSBjYW4gcHVsbCBpdCBhbHNvLgoKSmFuIEJldWxpY2g6IFllcywgYmFzZWQgb24gc3ltcHRvbXMg
dGhpcyBhcHBlYXJzIHRvIG9ubHkgYWZmZWN0IEFNRCBmcm9tIHdoYXQgSSd2ZSBzZWVuIHNvIGZh
ciwgYWx0aG91Z2ggSSdtIG5vdCBzdXJlIGlmIGFueSBJbnRlbCB1c2VycyBoYXZlIHRyaWVkIHRo
ZSB3b3JrYXJvdW5kIHBhdGNoLiBJbiBteSBjYXNlLCBJIGV4cGVyaWVuY2UgdGhlIGV4YWN0IHNh
bWUgc3ltcHRvbXMgb24gNC44LCA0LjEyLCBhbmQgNC4xMywgYW5kIHBhdGNoaW5nIDQuOCByZXN1
bHRlZCBpbiBzdWNjZXNzZnVsIHJlc3VtZSBhbmQgY29uZmlybWVkIHRoZSBjYXVzZSBvZiB0aGUg
aXNzdWUsIGJ1dCBJIGhhdmVuJ3QgdHJpZWQgcGF0Y2hpbmcgYW55IG90aGVyIHZlcnNpb25zLiAK
ClRoYW5rIHlvdSBldmVyeW9uZSBmb3IgeW91ciBhdHRlbnRpb24gdG8gdGhpcyBpc3N1ZSBzbyBm
YXIuIFRoaXMgaXMgYWxsIG92ZXIgbXkgaGVhZCBidXQgSSdtIGhhcHB5IHRvIHByb3ZpZGUgYW55
IGFkZGl0aW9uYWwgaW5mb3JtYXRpb24gSSBjYW4uIEkgaGF2ZSB0aGUgUnl6ZW4gMjUwMFUuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
