Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F61F15A018
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 05:23:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1jVt-0001C6-PP; Wed, 12 Feb 2020 04:20:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rauM=4A=disroot.org=claudia1@srs-us1.protection.inumbo.net>)
 id 1j1jVq-0001C1-VC
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2020 04:20:35 +0000
X-Inumbo-ID: 017f2572-4d4f-11ea-bc8e-bc764e2007e4
Received: from knopi.disroot.org (unknown [178.21.23.139])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 017f2572-4d4f-11ea-bc8e-bc764e2007e4;
 Wed, 12 Feb 2020 04:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id B54EE3BA3B;
 Wed, 12 Feb 2020 05:20:30 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5eKGa4iI9-DG; Wed, 12 Feb 2020 05:20:29 +0100 (CET)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1581481229; bh=J3BLXmMGLiTPXm2vQjkJe7cOz+MH7xZcYdKBa0anKcU=;
 h=Date:From:Subject:To:Cc:In-Reply-To:References;
 b=cNOfRQrJsZ8AYB7LlI1aipHE7V23DapH2rCKzPtoSJ9tfVj7AjbwvndGG2MLXGG85
 UyfiPQ8FyccxyrDf3jMfX6MlBEgfg3V33HLg8NPfHScFV3w9hmDu3lK+dzrSK5ch/P
 V/5rsvpMlEflQTMRDkHzzn0Al2B2aQ1/vCvWEYYxRUp5Qp2IrznQud66SYupPsRCV/
 f6RBuErJBOljgYyRCpqFvaHaz+4vmEscIjocLEDCEYxWgG4ikh6fZ7duxleLprvCUm
 XqAaIQWJ0PRRDb66I9iNizYZeByueT7uRRrnV8id/wglPobjyWjK1Kd5SV+jpyV7na
 f1wwpVY7a2Z9w==
Date: Wed, 12 Feb 2020 04:20:28 +0000
From: "Claudia" <claudia1@disroot.org>
Message-ID: <088eac9d953d043e337ce100928c2e58@disroot.org>
To: "=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?="
 <marmarek@invisiblethingslab.com>
In-Reply-To: <20200211210852.GF2995@mail-itl>
References: <20200211210852.GF2995@mail-itl>
 <20200210121443.GQ7869@mail-itl> <20200209230655.GA32524@mail-itl>
 <a6b9455d-dea1-6c61-ff7f-4fbaaba9a953@suse.com>
 <41b3896b-5414-bfdf-a515-bf2f06ab6463@citrix.com>
 <b1dfd8e66ff2cfdd1a5d77d46238b637@disroot.org>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, zachm1996@gmail.com,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RmVicnVhcnkgMTEsIDIwMjAgOTowOSBQTSwgIk1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSIg
PG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+IHdyb3RlOgoKPiBPbiBUdWUsIEZlYiAx
MSwgMjAyMCBhdCAxMjo1OToyMlBNICswMDAwLCBDbGF1ZGlhIHdyb3RlOgo+IAo+PiBGZWJydWFy
eSAxMCwgMjAyMCAxMjoxNCBQTSwgIk1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSIgPG1hcm1h
cmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+IHdyb3RlOgo+PiAKPj4gT24gTW9uLCBGZWIgMTAs
IDIwMjAgYXQgMTE6MTc6MzRBTSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gCj4+IE9u
IDEwLzAyLzIwMjAgMDg6NTUsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAxMC4wMi4yMDIwIDAw
OjA2LCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgd3JvdGU6Cj4+IEhpLAo+PiAKPj4gTXVs
dGlwbGUgUXViZXMgdXNlcnMgaGF2ZSByZXBvcnRlZCBpc3N1ZXMgd2l0aCByZXN1bWluZyBmcm9t
IFMzIG9uIEFNRAo+PiBzeXN0ZW1zIChSeXplbiAyNTAwVSwgUnl6ZW4gUHJvIDM3MDBVLCBtYXli
ZSBtb3JlKS4gVGhlIGVycm9yIG1lc3NhZ2UKPj4gaXM6Cj4+IAo+PiAoWEVOKSBDUFUwOiBjYXBb
IDFdIGlzIDdlZDgzMjBiIChleHBlY3RlZCBmNmQ4MzIwYikKPj4gCj4+IElmIEkgcmVhZCBpdCBy
aWdodCwgdGhpcyBpczoKPj4gLSBPU1hTQVZFOiAwIC0+IDEKPj4gLSBIWVBFUlZJU09SOiAxIC0+
IDAKPj4gCj4+IENvbW1lbnRpbmcgb3V0IHRoZSBwYW5pYyBvbiBhIGZhaWxlZCByZWNoZWNrX2Nw
dV9mZWF0dXJlcygpIGluIHBvd2VyLmMKPj4gbWFrZXMgdGhlIHN5c3RlbSB3b3JrIGFmdGVyIHJl
c3VtZSwgcmVwb3J0ZWRseSBzdGFibGUuIEJ1dCB0aGF0IGRvZXNuJ3QKPj4gc291bmRzIGxpa2Ug
YSBnb29kIGlkZWEgZ2VuZXJhbGx5Lgo+PiAKPj4gSXMgdGhpcyBkaWZmZXJlbmNlIGEgWGVuIGZh
dWx0IChzb21lIG1pc3NpbmcgTVNSIC8gb3RoZXIgcmVnaXN0ZXIKPj4gcmVzdG9yZSBvbiByZXN1
bWUpPyBPciBCSU9TIHZlbmRvciAvIEFNRCwgdGhhdCBjb3VsZCBiZSB3b3JrZWQgYXJvdW5kIGlu
Cj4+IFhlbj8KPj4gVGhlIHRyYW5zaXRpb24gb2YgdGhlIEhZUEVSVklTT1IgYml0IGlzIGRlZmlu
aXRlbHkgYSBYZW4gaXNzdWUsCj4+IHdpdGggQW5kcmV3IGhhdmluZyBzZW50IGEgcGF0Y2ggYWxy
ZWFkeSAoaWlyYykuCj4+IAo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvMjAy
MDAxMjcyMDIxMjEuMjk2MS0xLWFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20KPj4gCj4+IENvZGUg
aXMgY29ycmVjdC4gQ29tbWl0IG1lc3NhZ2UgbmVlZHMgcmV3b3JrLCBpbmNsdWRpbmcgaW4gbGln
aHQgb2YKPj4gdGhpcyBkaXNjb3ZlcnkuIChJIG1heSBldmVudHVhbGx5IHNwbGl0IGl0IGludG8g
dHdvIHBhdGNoZXMuKQo+PiAKPj4gQ2xhdWRpYSwgZG8geW91IHdhbnQgdG8gdGVzdCB3aXRoIHRo
aXMgcGF0Y2g/Cj4+IAo+PiBJJ20gZ2V0dGluZyBodW5rIGZhaWxlZCBpbiBkb21jdGwuYyBhcHBs
eWluZyB0byBSNC4xIGRlZmF1bHQgcmVwbyAoZmMzMSwgWGVuIDQuMTMpLiBJJ2xsIHNlZSBpZiBJ
Cj4+IGNhbiBmaXggaXQgYnV0IGJlYXIgd2l0aCBtZSwgSSdtIG5ldyBhdCB0aGlzLgo+PiAKPj4g
TWFyZWs6IFdvdWxkIHlvdSBieSBhbnkgY2hhbmNlIGJlIHdpbGxpbmcgdG8gbWVyZ2UgdGhpcyBp
bnRvIGEgdGVzdCBicmFuY2ggb24geW91ciByZXBvLCBzbyB0aGUKPj4gcmVzdCBvZiB1cyBjYW4g
cHVsbCBpdCBkaXJlY3RseSBpbnRvIHF1YmVzLWJ1aWxkZXI/IEl0J2xsIHRha2UgeW91IGEgZnJh
Y3Rpb24gb2YgdGhlIHRpbWUgaXQnbGwKPj4gdGFrZSBtZSwgcGx1cyB0aGVuIHphY2htIGFuZCBh
d29rZCBhbmQgYW55b25lIGVsc2UgY2FuIHB1bGwgaXQgYWxzby4KPiAKPiBIZXJlIGlzIG9uZSBm
b3IgWGVuIDQuMTM6Cj4gaHR0cHM6Ly9naXRodWIuY29tL1F1YmVzT1MvcXViZXMtdm1tLXhlbi9w
dWxsLzcxCj4gYnVpbGRlci5jb25mIHNuaXBwZXQgZm9yIHF1YmVzLWJ1aWxkZXI6Cj4gCj4gQlJB
TkNIX3ZtbV94ZW49eGVuLTQuMTMtYW1kLXN1c3BlbmQKPiBHSVRfVVJMX3ZtbV94ZW49aHR0cHM6
Ly9naXRodWIuY29tL21hcm1hcmVrL3F1YmVzLXZtbS14ZW4KPiAKPiBUaGlzIGlzIGFscmVhZHkg
djIgcGF0Y2ggZnJvbSB0aGUgb3RoZXIgdGhyZWFkLgoKVGhhbmtzISBGb3IgYW55b25lIGVsc2Ug
dHJ5aW5nIHRoaXMsIEkgYWxzbyBoYWQgdG8gYWRkIE5PX0NIRUNLPXZtbS14ZW4gdm1tLXhlbi1z
dHViZG9tLWxlZ2FjeSwgSSBndWVzcyBiZWNhdXNlIHRoZXJlIGFyZSBubyB0YWdzIG9uIHRoYXQg
YnJhbmNoLiBUaGUgUlBNcyBidWlsdCBzdWNjZXNzZnVsbHksIGFuZCBJJ2xsIGJlIGFibGUgdG8g
dGVzdCB0aGVtIGFzIHNvb24gYXMgSSBnZXQgdGhlIGxhdGVzdCBSNC4xIGJ1aWxkIGRvd25sb2Fk
ZWQgYW5kIGluc3RhbGxlZCAoSSdtIGN1cnJlbnRseSBydW5uaW5nIDQuMCkuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
