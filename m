Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2112D27C90
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2019 14:18:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTmce-0005TR-V9; Thu, 23 May 2019 12:15:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oIoO=TX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hTmcd-0005TM-Pv
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 12:14:59 +0000
X-Inumbo-ID: 618a3023-7d54-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 618a3023-7d54-11e9-8980-bc764e045a96;
 Thu, 23 May 2019 12:14:58 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 23 May 2019 06:14:57 -0600
Message-Id: <5CE68EBF0200007800231B22@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 23 May 2019 06:14:55 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <1558606816-17842-1-git-send-email-andrew.cooper3@citrix.com>
 <1558606816-17842-3-git-send-email-andrew.cooper3@citrix.com>
 <5CE67C5B0200007800231A83@prv1-mh.provo.novell.com>
 <701d553c-20a8-7b1a-6023-35ed1008ce65@citrix.com>
 <5CE686ED0200007800231AC4@prv1-mh.provo.novell.com>
 <e6814c96-cf1c-d28e-4a37-4a0072baa7e7@citrix.com>
In-Reply-To: <e6814c96-cf1c-d28e-4a37-4a0072baa7e7@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 2/2] docs: Introduce some hypercall page
 documentation
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIzLjA1LjE5IGF0IDE0OjAyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjMvMDUvMjAxOSAxMjo0MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDIz
LjA1LjE5IGF0IDEzOjAxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBP
biAyMy8wNS8yMDE5IDExOjU2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+PiBPbiAyMy4wNS4x
OSBhdCAxMjoyMCwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4+PiBUaGlz
IGFsc28gaW50cm9kdWNlZCB0aGUgdG9wLWxldmVsIEd1ZXN0IERvY3VtZW50YXRpb24gc2VjdGlv
bi4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4KPj4+PiBMYXJnZSBwYXJ0cyBvZiB0aGlzIGFyZSBlbnRpcmVseSB4ODYt
Y2VudHJpYywgeWV0IGh5cGVyY2FsbHMgZXhpc3QKPj4+PiBmb3IgQXJtIGFzIHdlbGwuIElmIHRo
aXMgaXMgaW50ZW50aW9uYWwsIHRoZW4gSSB0aGluayB5b3Ugc2hvdWxkIHNheQo+Pj4+IHNvIGFi
b3ZlLgo+Pj4gSXQgaXMgYWxsIHg4NiBzcGVjaWZpYywgd2hpY2ggaXMgd2h5IGl0IGlzIGdyb3Vw
ZWQgdW5kZXIgIng4NiBndWVzdAo+Pj4gZG9jdW1lbnRhdGlvbiIuCj4+IE5laXRoZXIgdGhlIHBh
dGggbm9yIGFueXRoaW5nIG5lYXIgdGhlIHRvcCBvZiB0aGUgYWRkZWQgZmlsZSBzdWdnZXN0Cj4+
IHRoaXMgaXMgIng4NiBndWVzdCBkb2N1bWVudGF0aW9uIi4gSG93IGlzIG9uZSB0byBtYWtlIHRo
aXMKPj4gY29ubmVjdGlvbj8gT3IgYXJlIHlvdSByZWZlcnJpbmcgdG8gdGhlIHNvbGUgZW50cnkg
dGhhdCBlbmRzIHVwIGluCj4+IGRvY3MvZ3Vlc3QtZ3VpZGUvaW5kZXgucnN0Pwo+IAo+IFllcywg
YW5kIGJ5IHRoZSB3YXkgeW91IGFzayB0aGlzIHF1ZXN0aW9uLCBJIHByZXN1bWUgeW91IGhhdmVu
J3Qgc2Vlbgo+IGhvdyBzcGhpbnggcmVuZGVycyBpdC4KCk5vciBkbyBJIHRoaW5rIEkgc2hvdWxk
IG5lZWQgdG8sIGZvciB0aGUgcHVycG9zZSBvZiByZXZpZXdpbmcKdGhlIGNoYW5nZS4gSSdtIGlu
IHBhcnRpY3VsYXIgY29uY2VybmVkIGFib3V0IGZ1cnRoZXIgYWRkaXRpb25zCmhlcmUgZG93biB0
aGUgcm9hZCwgd2hlbiBpdCB3b3VsZCB0aGVuIGJlIGV2ZW4gbGVzcyB2aXNpYmxlCnRoYXQgdGhp
cyBpcyB4ODYtc3BlY2lmaWMgZG9jdW1lbnRhdGlvbi4KCj4gTmV2ZXJ0aGVsZXNzLCB0aGUgb2Jz
ZXJ2YXRpb24gYmVsb3cgZG9lcyB3YXJyYW50IHNvbWUgY2hhbmdlcyBoZXJlLgoKUmlnaHQgLSBo
ZW5jZSBtZSBtZW50aW9uaW5nICJwYXRoIiBpbiBteSBvcmlnaW5hbCByZXBseS4KCj4+IFBlb3Bs
ZQo+PiB3cml0aW5nIGNvZGUgdGFyZ2V0aW5nIHRoZSBoeXBlcmNhbGwgaW50ZXJmYWNlLCBJIGFz
c3VtZS4gVGhpcwo+PiBpbmNsdWRlcyBwZW9wbGUgd2hvIG1heSBub3QgYXQgYWxsIGJlIGZhbWls
aWFyIHdpdGggdGhlIEFUJlQKPj4gcGVjdWxpYXJpdGllcyBvZiB0aGUgYXNzZW1ibHkgbGFuZ3Vh
Z2UgdXNlZCAobWFpbmx5IGZvcgo+PiBuYW1pbmcgcmVnaXN0ZXJzKS4gSXQncyBlYXN5IGZvciB0
aGUgdG8gdW5kZXJzdGFuZCB3aGF0IGlzCj4+IG1lYW50IG5ldmVydGhlbGVzcywgYnV0IHRvIGJl
IGhvbmVzdCBJJ2QgcHJlZmVyIGlmIHRoZSBTRE0gLwo+PiBQTSByZWdpc3RlciBuYW1lcyB3ZXJl
IHVzZWQgaW5zdGVhZCwgaS5lLiBpbiBwYXJ0aWN1bGFyCj4+IHdpdGhvdXQgdGhlICUgcHJlZml4
ZXMgKGJ1dCBhbHNvIG9taXR0aW5nIHRoZSAkIG9uIHRoZSBJTlQKPj4gb3BlcmFuZCkuCj4gCj4g
V2hpbGUgdGhpcyBjYXNlIGlzLCBkcm9wcGluZyB0aGUgQVQmVC1pc21zIGlzIGVhc3ksIEknbSBu
b3QgY29udmluY2VkCj4gdGhhdCB3aWxsIGJlIHRoZSBjYXNlIGVsc2V3aGVyZS4KPiAKPiBBbHNv
LCBJIGRvbid0IHdhbnQgdXMgdG8gYmUgaW4gYSBjYXNlIHdoZXJlIHdlIGRldmVsb3AgZXhjbHVz
aXZlbHkgd2l0aAo+IEFUJlQsIGJ1dCBoYXZlIG91ciBkb2N1bWVudGF0aW9uIHdyaXR0ZW4gaW4g
SW50ZWwgc3ludGF4LgoKRm9yIG9uZSBJIGRvbid0IHRoaW5rIGRvY3VtZW50YXRpb24gYW5kIHNv
dXJjZSBuZWVkIHRvIGJlCmFsaWduZWQgaW4gdGhpcyByZWdhcmQuIEFsaWduaW5nIG91ciBkb2N1
bWVudGF0aW9uIHRvIHRoYXQKb2YgdGhlIENQVSB2ZW5kb3JzIHNlZW1zIG1vcmUgaW1wb3J0YW50
IHRvIG1lLiAoVGhhdApzYWlkLCBpbiBleGFtcGxlIGNvZGUgSSB0aGluayBhdCBsZWFzdCBvbmUg
b2YgdGhlIHR3byBoYXZlCnN0YXJ0ZWQgbWl4aW5nIEludGVsIGFuZCBBVCZUIHN5bnRheC4pCgpB
bmQgdGhlbiAtIGNhbid0IHdlIGdldCBhd2F5IHdpdGhvdXQgdXNpbmcgYW55IGFzc2VtYmx5CnN5
bnRheCBhdCBhbGwgaW4gZG9jdW1lbnRhdGlvbj8gU3VyZWx5IHRoaW5ncyBjYW4gYmUgd29yZGVk
CmluIGEgbW9yZSBhYnN0cmFjdCB3YXkgKGxpa2UgIklOVCBpbnN0cnVjdGlvbiB3aXRoIGFuIGlt
bWVkaWF0ZQpvZiAweDgyKS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
