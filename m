Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B01D65EF56C
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 14:26:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413732.657568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odscC-00025Y-4O; Thu, 29 Sep 2022 12:26:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413732.657568; Thu, 29 Sep 2022 12:26:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odscC-00022M-1U; Thu, 29 Sep 2022 12:26:08 +0000
Received: by outflank-mailman (input) for mailman id 413732;
 Thu, 29 Sep 2022 12:26:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VH9u=2A=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1odscA-00022G-7x
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 12:26:06 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2f71841-3ff1-11ed-9374-c1cf23e5d27e;
 Thu, 29 Sep 2022 14:26:04 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6731B21ACA;
 Thu, 29 Sep 2022 12:26:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 46A3813A71;
 Thu, 29 Sep 2022 12:26:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +2PAD9yONWPwCQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 29 Sep 2022 12:26:04 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: e2f71841-3ff1-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1664454364; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vzhHfRpxXyEv6WWqeSCNWRHN3DX48/STB8aa8BgBzKk=;
	b=kbARSbJSd4pO/MEeEYk8ON3TYk4kAhPCHYTdRISZSGPHTF5/D6M8csLcTn+Ew8Y+dSn2Dy
	1WfySbJZF3in7PeqKqKgg5SlzgxxfdORoAeCPyaq03ePQiZ4NmIhKLLT3vhzMua7JVyb60
	2DzpfVST41vW43t1adNDJ15Ni9Y3vIY=
Message-ID: <ba0eeb4f-3465-e6c9-5782-8c6d6a59ca38@suse.com>
Date: Thu, 29 Sep 2022 14:26:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <98b857b8-f36a-e935-8318-f17dfc3457ab@suse.com>
 <850214fa-7e26-8a19-c318-9ded849fffda@citrix.com>
 <6d2e1b23-2299-01fd-0e79-1c9ab1b5bace@suse.com>
 <94aab958-c141-4c43-a249-a55d8e5be735@suse.com>
 <6a3d38a8-bac3-fa59-e882-0d95a8d3e5d0@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: Proposal for physical address based hypercalls
In-Reply-To: <6a3d38a8-bac3-fa59-e882-0d95a8d3e5d0@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OsMdKIpIa0zwkKoQTlwnp6Cu"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------OsMdKIpIa0zwkKoQTlwnp6Cu
Content-Type: multipart/mixed; boundary="------------pKU3qZcOplYvdAfbRELrqIH3";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
Message-ID: <ba0eeb4f-3465-e6c9-5782-8c6d6a59ca38@suse.com>
Subject: Re: Proposal for physical address based hypercalls
References: <98b857b8-f36a-e935-8318-f17dfc3457ab@suse.com>
 <850214fa-7e26-8a19-c318-9ded849fffda@citrix.com>
 <6d2e1b23-2299-01fd-0e79-1c9ab1b5bace@suse.com>
 <94aab958-c141-4c43-a249-a55d8e5be735@suse.com>
 <6a3d38a8-bac3-fa59-e882-0d95a8d3e5d0@suse.com>
In-Reply-To: <6a3d38a8-bac3-fa59-e882-0d95a8d3e5d0@suse.com>

--------------pKU3qZcOplYvdAfbRELrqIH3
Content-Type: multipart/mixed; boundary="------------r18k0fRizENOOn2wOjCHJ1mU"

--------------r18k0fRizENOOn2wOjCHJ1mU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjkuMDkuMjIgMTM6MzIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyOC4wOS4yMDIy
IDE1OjAzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMjguMDkuMjIgMTQ6MDYsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDI4LjA5LjIwMjIgMTI6NTgsIEFuZHJldyBDb29w
ZXIgd3JvdGU6DQo+Pj4+IE9uIDI4LzA5LzIwMjIgMTE6MzgsIEphbiBCZXVsaWNoIHdyb3Rl
Og0KPj4+Pj4gQXMgYW4gYWx0ZXJuYXRpdmUgSSdkIGxpa2UgdG8gcHJvcG9zZSB0aGUgaW50
cm9kdWN0aW9uIG9mIGEgYml0IChvciBtdWx0aXBsZQ0KPj4+Pj4gb25lcywgc2VlIGJlbG93
KSBhdWdtZW50aW5nIHRoZSBoeXBlcmNhbGwgbnVtYmVyLCB0byBjb250cm9sIHRoZSBmbGF2
b3Igb2YgdGhlDQo+Pj4+PiBidWZmZXJzIHVzZWQgZm9yIGV2ZXJ5IGluZGl2aWR1YWwgaHlw
ZXJjYWxsLiAgVGhpcyB3b3VsZCBsaWtlbHkgaW52b2x2ZSB0aGUNCj4+Pj4+IGludHJvZHVj
dGlvbiBvZiBhIG5ldyBoeXBlcmNhbGwgcGFnZSAob3IgbXVsdGlwbGUgb25lcyBpZiBtb3Jl
IHRoYW4gb25lIGJpdCBpcw0KPj4+Pj4gdG8gYmUgdXNlZCksIHRvIHJldGFpbiB0aGUgcHJl
c2VudCBhYnN0cmFjdGlvbiB3aGVyZSBpdCBpcyB0aGUgaHlwZXJ2aXNvciB3aGljaA0KPj4+
Pj4gYWN0dWFsbHkgZmlsbHMgdGhlc2UgcGFnZXMuDQo+Pj4+DQo+Pj4+IFRoZXJlIGFyZSBv
dGhlciBjb25jZXJucyB3aGljaCBuZWVkIHRvIGJlIGFjY291bnRlZCBmb3IuDQo+Pj4+DQo+
Pj4+IEVuY3J5cHRlZCBWTXMgY2Fubm90IHVzZSBhIGh5cGVyY2FsbCBwYWdlOyB0aGV5IGRv
bid0IHRydXN0IHRoZQ0KPj4+PiBoeXBlcnZpc29yIGluIHRoZSBmaXJzdCBwbGFjZSwgYW5k
IHRoZSBoeXBlcmNhbGwgcGFnZSBpcyAoc3BlY2lmaWNhbGx5KQ0KPj4+PiBjb2RlIGluamVj
dGlvbi7CoCBTbyB0aGUgc2Vuc2libGUgbmV3IEFCSSBjYW5ub3QgZGVwZW5kIG9uIGEgaHlw
ZXJjYWxsIHRhYmxlLg0KPj4+DQo+Pj4gSSBkb24ndCB0aGluayB0aGVyZSdzIGEgZGVwZW5k
ZW5jeSwgYW5kIEkgdGhpbmsgdGhlcmUgbmV2ZXIgcmVhbGx5IGhhcyBiZWVuLg0KPj4+IFdl
J3ZlIGJlZW4gYWR2b2NhdGluZyBmb3IgaXRzIHVzZSwgYnV0IHdlJ3ZlIG5vdCBlbmZvcmNl
ZCB0aGF0IGFueXdoZXJlLCBJDQo+Pj4gZG9uJ3QgdGhpbmsuDQo+Pj4NCj4+Pj4gQWxzbywg
cmV3cml0aW5nIHRoZSBoeXBlcmNhbGwgcGFnZSBvbiBtaWdyYXRlIHR1cm5zIG91dCBub3Qg
dG8gaGF2ZSBiZWVuDQo+Pj4+IHRoZSBtb3N0IGNsZXZlciBpZGVhLCBhbmQgb25seSB3b3Jr
cyByaWdodCBub3cgYmVjYXVzZSB0aGUgaW5zdHJ1Y3Rpb25zDQo+Pj4+IGFyZSB0aGUgc2Ft
ZSBsZW5ndGggaW4gdGhlIHZhcmlhdGlvbnMgZm9yIGVhY2ggbW9kZS4NCj4+Pj4NCj4+Pj4g
QWxzbyBjb250aW51YXRpb25zIG5lZWQgdG8gY2hhbmdlIHRvIGF2b2lkIHVzZXJzcGFjZSBs
aXZlbmVzcyBwcm9ibGVtcywNCj4+Pj4gYW5kIGV4aXN0aW5nIGh5cGVyY2FsbHMgdGhhdCB3
ZSBkbyBoYXZlIG5lZWQgc3BsaXR0aW5nIGJldHdlZW4gdGhpbmdzDQo+Pj4+IHdoaWNoIGFy
ZSBhY3R1YWxseSBwcml2aWxlZ2VkIG9wZXJhdGlvbnMgKHdpdGhpbiB0aGUgZ3Vlc3QgY29u
dGV4dCkgYW5kDQo+Pj4+IHRoaW5ncyB3aGljaCBhcmUgbG9naWNhbCBjb250cm9sIG9wZXJh
dGlvbnMsIHNvIHRoZSBrZXJuZWwgY2FuIGV4cG9zZQ0KPj4+PiB0aGUgbGF0dGVyIHRvIHVz
ZXJzcGFjZSB3aXRob3V0IHJldGFpbmluZyB0aGUgZ2FwaW5nIHJvb3QgaG9sZSB3aGljaCBp
cw0KPj4+PiAvZGV2L3hlbi9wcml2Y21kLCBhbmQgYSBibG9ja2VyIHRvIGRvaW5nIFVFRkkg
U2VjdXJlYm9vdC4NCj4+Pj4NCj4+Pj4gU28geWVzLCBzdGFydGluZyBzb21lIG5ldyBjbGVh
bihlcikgaW50ZXJmYWNlIGZyb20gaHlwZXJjYWxsIDY0IGlzIHRoZQ0KPj4+PiBwbGFuLCBi
dXQgaXQgdmVyeSBtdWNoIGRvZXMgbm90IHdhbnQgdG8gYmUgYSBzaW1wbGUgbWlycm9yIG9m
IHRoZQ0KPj4+PiBleGlzdGluZyAwLTYzIHdpdGggYSBkaWZmZXJpbmcgY2FsbGluZyBjb252
ZW50aW9uLg0KPj4+DQo+Pj4gQWxsIG9mIHRoZXNlIGxvb2sgbGlrZSBvcnRob2dvbmFsIHBy
b2JsZW1zIHRvIG1lLiBUaGF0J3MgbGlrZWx5IGFsbA0KPj4+IHJlbGV2YW50IGZvciwgYXMg
SSB0aGluayB5b3UndmUgYmVlbiBjYWxsaW5nIGl0LCBBQkkgdjIsIGJ1dCBzaG91bGRuJ3QN
Cj4+PiBoaW5kZXIgb3VyIHN3aXRjaGluZyB0byBhIHBoeXNpY2FsIGFkZHJlc3MgYmFzZWQg
aHlwZXJjYWxsIG1vZGVsLg0KPj4+IE90aGVyd2lzZSBJJ20gYWZyYWlkIHdlJ2xsIG5ldmVy
IG1ha2UgYW55IHByb2dyZXNzIGluIHRoYXQgZGlyZWN0aW9uLg0KPj4NCj4+IFdoYXQgYWJv
dXQgYW4gYWx0ZXJuYXRpdmUgbW9kZWwgYWxsb3dpbmcgdG8gdXNlIG1vc3Qgb2YgdGhlIGN1
cnJlbnQNCj4+IGh5cGVyY2FsbHMgdW5tb2RpZmllZD8NCj4+DQo+PiBXZSBjb3VsZCBhZGQg
YSBuZXcgaHlwZXJjYWxsIGZvciByZWdpc3RlcmluZyBoeXBlcmNhbGwgYnVmZmVycyB2aWEN
Cj4+IHZpcnR1YWwgYWRkcmVzcywgcGh5c2ljYWwgYWRkcmVzcywgYW5kIHNpemUgb2YgdGhl
IGJ1ZmZlcnMgKGtpbmQgb2YgYQ0KPj4gc29mdHdhcmUgVExCKS4NCj4gDQo+IFdoeSBub3Q/
DQo+IA0KPj4gVGhlIGJ1ZmZlciB0YWJsZSB3b3VsZCB3YW50IHRvIGJlIHBoeXNpY2FsbHkg
YWRkcmVzc2VkDQo+PiBieSB0aGUgaHlwZXJjYWxsLCBvZiBjb3Vyc2UuDQo+IA0KPiBJJ20g
bm90IGNvbnZpbmNlZCBvZiB0aGlzLCBhcyBpdCB3b3VsZCBicmVhayB1bmlmb3JtaXR5IG9m
IHRoZSBoeXBlcmNhbGwNCj4gaW50ZXJmYWNlcy4gSU9XIGluIHRoZSBoeXBlcnZpc29yIHdl
IHRoZW4gd291bGRuJ3QgYmUgYWJsZSB0byB1c2UNCj4gY29weV9mcm9tX2d1ZXN0KCkgdG8g
cmV0cmlldmUgdGhlIGNvbnRlbnRzLiBQZXJoYXBzIHRoaXMgc2ltcGx5IHNob3VsZG4ndA0K
PiBiZSBhIHRhYmxlLCBidXQgYSBoeXBlcmNhbGwgbm90IGludm9sdmluZyBhbnkgYnVmZmVy
cyAoaS5lLiBldmVyeQ0KPiBkaXNjb250aWd1b3VzIHBpZWNlIHdvdWxkIG5lZWQgcmVnaXN0
ZXJpbmcgc2VwYXJhdGVseSkuIEkgZXhwZWN0IHN1Y2ggYQ0KPiBzb2Z0d2FyZSBUTEIgd291
bGRuJ3QgaGF2ZSBtYW55IGVudHJpZXMsIHNvIG5lZWRpbmcgdG8gdXNlIGEgY291cGxlIG9m
DQo+IGh5cGVyY2FsbHMgc2hvdWxkbid0IGJlIGEgbWFqb3IgaXNzdWUuDQoNCkZpbmUgd2l0
aCBtZS4NCg0KPiANCj4+IEl0IG1pZ2h0IGJlIGludGVyZXN0aW5nIHRvIGhhdmUgdGhpcyB0
YWJsZSBwZXIgdmNwdSAoaXQgc2hvdWxkIGJlDQo+PiBhbGxvd2VkIHRvIHVzZSB0aGUgc2Ft
ZSB0YWJsZSBmb3IgbXVsdGlwbGUgdmNwdXMpIGluIG9yZGVyIHRvIHNwZWVkDQo+PiB1cCBm
aW5kaW5nIHRyYW5zbGF0aW9uIGVudHJpZXMgb2YgcGVyY3B1IGJ1ZmZlcnMuDQo+IA0KPiBZ
ZXMuIFBlcmhhcHMgaW5zZXJ0aW9uIGFuZCBwdXJnaW5nIGNvdWxkIHNpbXBseSBiZSB0d28g
bmV3IFZDUFVPUF8qLg0KDQpBZ2FpbiBmaW5lIHdpdGggbWUuDQoNCj4gQXMgYSBwcmVyZXEg
SSB0aGluayB3ZSdkIG5lZWQgdG8gc29ydCB0aGUgY3Jvc3MtdkNQVSBhY2Nlc3Npbmcgb2Yg
Z3Vlc3QNCj4gZGF0YSwgY29pbmNpZGVudGFsbHkgcG9pbnRlZCBvdXQgaW4gYSBwb3N0LWNv
bW1pdC1tZXNzYWdlIHJlbWFyayBpbg0KPiBodHRwczovL2xpc3RzLnhlbi5vcmcvYXJjaGl2
ZXMvaHRtbC94ZW4tZGV2ZWwvMjAyMi0wOS9tc2cwMTc2MS5odG1sLiBUaGUNCj4gc3ViamVj
dCB2Q1BVIGlzbid0IGF2YWlsYWJsZSBpbiBjb3B5X3RvX3VzZXJfaHZtKCksIHdoaWNoIGlz
IHdoZXJlIEknZA0KPiBleHBlY3QgdGhlIFRMQiBsb29rdXAgdG8gb2NjdXIgKHdoaWxlIGFz
c3VtaW5nIGhhbmRsZXMgcG9pbnQgYXQgZ2xvYmFsbHkNCj4gbWFwcGVkIHNwYWNlIF9taWdo
dF8gYmUgb2theSwgdXNpbmcgdGhlIHdyb25nIHZDUFUncyBUTEIgc3VyZWx5IGlzbid0KS4N
Cg0KQW55IHBlci12Y3B1IGJ1ZmZlciBzaG91bGQgb25seSBiZSB1c2VkIGJ5IHRoZSByZXNw
ZWN0aXZlIHZjcHUuDQoNCj4+IEFueSBoeXBlcmNhbGwgYnVmZmVyIGJlaW5nIGFkZHJlc3Nl
ZCB2aXJ0dWFsbHkgY291bGQgZmlyc3QgdHJpZWQgdG8NCj4+IGJlIGZvdW5kIHZpYSB0aGUg
U1ctVExCLiBUaGlzIHdvdWxkbid0IHJlcXVpcmUgYW55IGNoYW5nZXMgZm9yIG1vc3QNCj4+
IG9mIHRoZSBoeXBlcmNhbGwgaW50ZXJmYWNlcy4gT25seSBzcGVjaWFsIGNhc2VzIHdpdGgg
dmVyeSBsYXJnZSBidWZmZXJzDQo+PiBtaWdodCBuZWVkIGluZGlyZWN0IHZhcmlhbnRzIChs
aWtlIEphbiBzYWlkOiB2aWEgR0ZOIGxpc3RzLCB3aGljaCBjb3VsZA0KPj4gYmUgcGFzc2Vk
IGluIHJlZ2lzdGVyZWQgYnVmZmVycykuDQo+Pg0KPj4gRW5jcnlwdGVkIGd1ZXN0cyB3b3Vs
ZCBwcm9iYWJseSB3YW50IHRvIHVzZSBzdGF0aWMgcGVyY3B1IGJ1ZmZlcnMgaW4NCj4+IG9y
ZGVyIHRvIGF2b2lkIHN3aXRjaGluZyB0aGUgZW5jcnlwdGlvbiBzdGF0ZSBvZiB0aGUgYnVm
ZmVycyBhbGwgdGhlDQo+PiB0aW1lLg0KPj4NCj4+IEFuIHVuZW5jcnlwdGVkIFBWSC9IVk0g
ZG9tYWluIChlLmcuIFBWSCBkb20wKSBjb3VsZCBqdXN0IGRlZmluZSBvbmUNCj4+IGdpYW50
IGJ1ZmZlciB3aXRoIHRoZSBkb21haW4ncyBtZW1vcnkgc2l6ZSB2aWEgdGhlIHBoeXNpY2Fs
IG1lbW9yeQ0KPj4gbWFwcGluZyBvZiB0aGUga2VybmVsLiBBbGwga21hbGxvYygpIGFkZHJl
c3NlcyB3b3VsZCBiZSBpbiB0aGF0IHJlZ2lvbi4NCj4gDQo+IFRoYXQncyBMaW51eC1jZW50
cmljLiBJJ20gbm90IGNvbnZpbmNlZCBhbGwgT1NlcyBtYWludGFpbiBhIGRpcmVjdG1hcC4N
Cj4gV2l0aG91dCBzdWNoLCBzd2l0Y2hpbmcgdG8gdGhpcyBtb2RlbCBtaWdodCBlbmQgdXAg
cXVpdGUgaW50cnVzaXZlIG9uDQo+IHRoZSBPUyBzaWRlLg0KDQpUaGlzIG1vZGVsIGlzIGVz
cGVjaWFsbHkgaW50ZXJlc3RpbmcgZm9yIGRvbTAuIFRoZSBtYWpvcml0eSBvZiBpbnN0YWxs
YXRpb25zDQppcyBydW5uaW5nIGEgTGludXggZG9tMCBBRkFJSywgc28gaGF2aW5nIGFuIGVh
c3kgd2F5IHRvIHNwZWVkIHRoaXMgY2FzZSB1cA0KaXMgYSBiaWcgcGx1cy4NCg0KPiBUaGlu
a2luZyBvZiBMaW51eCwgd2UnZCBuZWVkIGEgMm5kIHJhbmdlIGNvdmVyaW5nIHRoZSBkYXRh
IHBhcnQgb2YgdGhlDQo+IGtlcm5lbCBpbWFnZS4NCg0KUHJvYmFibHksIHllcy4NCg0KPiBG
dXJ0aGVyIHRoaXMgc3RpbGwgd291bGRuJ3QgKGFmYWljcykgcGF2ZSBhIHJlYXNvbmFibGUg
cm91dGUgdG93YXJkcw0KPiBkZWFsaW5nIHdpdGggcHJpdmNtZC1pbnZva2VkIGh5cGVyY2Fs
bHMuDQoNClRvZGF5IHRoZSBoeXBlcmNhbGwgYnVmZmVycyBhcmUgYWxsIGFsbG9jYXRlZCB2
aWEgdGhlIHByaXZjbWQgZHJpdmVyLiBJdA0Kc2hvdWxkIGJlIGZhaXJseSBlYXN5IHRvIGFk
ZCBhbiBpb2N0bCB0byBnZXQgdGhlIGJ1ZmZlcidzIGtlcm5lbCBhZGRyZXNzDQppbnN0ZWFk
IG9mIHVzaW5nIHRoZSB1c2VyIGFkZHJlc3MuDQoNCk11bHRpLXBhZ2UgYnVmZmVycyBtaWdo
dCBiZSBwcm9ibGVtYXRpYywgdGhvdWdoLCBzbyBlaXRoZXIgd2UgbmVlZCB0bw0KaGF2ZSBz
cGVjaWFsIHZhcmlhbnRzIGZvciBoeXBlcmNhbGxzIHdpdGggc3VjaCBidWZmZXJzLCBvciB3
ZSBhcmUganVzdA0KZmFsbGluZyBiYWNrIHRvIHVzZSB2aXJ0dWFsIGFkZHJlc3NlcyBmb3Ig
dGhlIGNhc2VzIHdoZXJlIG5vIGd1ZXN0DQpwaHlzaWNhbGx5IGNvbnRpZ3VvdXMgYnVmZmVy
IGNvdWxkIGJlIGFsbG9jYXRlZCAoZG9lc24ndCBhcHBseSB0bw0KZW5jcnlwdGVkIGd1ZXN0
cywgb2YgY291cnNlLCBhcyB0aG9zZSBuZWVkIHRvIGhhdmUgbGFyZ2UgZW5vdWdoIGJ1ZmZl
cnMNCmFueXdheSkuDQoNCj4gRmluYWxseSAtIGluIGhvdyBmYXIgYXJlIHdlIGNvbmNlcm5l
ZCBvZiBQViBndWVzdHMgdXNpbmcgbGluZWFyDQo+IGFkZHJlc3NlcyBmb3IgaHlwZXJjYWxs
IGJ1ZmZlcnM/IEkgYXNrIGJlY2F1c2UgSSBkb24ndCB0aGluayB0aGUgbW9kZWwNCj4gbGVu
ZHMgaXRzZWxmIHRvIHVzZSBhbHNvIGZvciB0aGUgUFYgZ3Vlc3QgaW50ZXJmYWNlcy4NCg0K
R29vZCBxdWVzdGlvbi4NCg0KQXMgbG9uZyBhcyB3ZSBzdXBwb3J0IFBWIGd1ZXN0cyB3ZSBj
YW4ndCBkcm9wIHN1cHBvcnQgZm9yIGxpbmVhciBhZGRyZXNzZXMNCklNTy4gU28gdGhlIHF1
ZXN0aW9uIGlzIHdoZXRoZXIgd2UgYXJlIGZpbmUgd2l0aCBQViBndWVzdHMgbm90IHVzaW5n
IHRoZQ0KcHJlLXJlZ2lzdGVyZWQgYnVmZmVycywgb3IgaWYgd2Ugd2FudCB0byBpbnRyb2R1
Y2UgYW4gaW50ZXJmYWNlIGZvciBQVg0KZ3Vlc3RzIHVzaW5nIEdGTnMgaW5zdGVhZCBvZiBN
Rk5zLg0KDQpKdWVyZ2VuDQoNCj4+IEEgYnVmZmVyIGFkZHJlc3Mgbm90IGZvdW5kIHdvdWxk
IG5lZWQgdG8gYmUgdHJhbnNsYXRlZCBsaWtlIHRvZGF5IChhbmQNCj4+IGZhaWwgZm9yIGFu
IGVuY3J5cHRlZCBndWVzdCkuDQo+Pg0KPj4gVGhvdWdodHM/DQo+Pg0KPj4NCj4+IEp1ZXJn
ZW4NCj4gDQoNCg==
--------------r18k0fRizENOOn2wOjCHJ1mU
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------r18k0fRizENOOn2wOjCHJ1mU--

--------------pKU3qZcOplYvdAfbRELrqIH3--

--------------OsMdKIpIa0zwkKoQTlwnp6Cu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmM1jtsFAwAAAAAACgkQsN6d1ii/Ey/q
0Af9EUBYGZC3o41QIMlsXEiOKcm9teR3KpH/7ThI6QkE9al7gM/O2sN8BKg4sosFs4wrRDegnDgX
IwGAlOfzj04m3CRDs6wFZh6u8gpZpStKLkRHSATQ4UH26GP3iLqPPZbHq9nUx8LMujv+Wvo0DG9m
R5Z4kHfMOchgIru5iwwbwomuPGYBhpPqVXu1vuGEv0LzUm1W83TgzQKx4j4pEv95j7hlsPiyuT04
5HgzADT+7ORMnSnjnNPvYSQNUQZp7iubAVXc4rZ+53Iav8Vbiuo1WfSUIBuXwY5fs5Uw9TEFNb53
QMYtedou5WxKMoworI+aFvDyntX2/qRil0rdFiI8ZQ==
=7nPV
-----END PGP SIGNATURE-----

--------------OsMdKIpIa0zwkKoQTlwnp6Cu--

