Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E40623BCF
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 07:27:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.441490.695589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ot10l-0000El-Qm; Thu, 10 Nov 2022 06:26:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 441490.695589; Thu, 10 Nov 2022 06:26:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ot10l-0000Cm-Ns; Thu, 10 Nov 2022 06:26:03 +0000
Received: by outflank-mailman (input) for mailman id 441490;
 Thu, 10 Nov 2022 06:26:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4mp0=3K=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ot10k-0000Cg-9W
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 06:26:02 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8aca3482-60c0-11ed-8fd2-01056ac49cbb;
 Thu, 10 Nov 2022 07:26:00 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 50EC01F855;
 Thu, 10 Nov 2022 06:25:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 048641346E;
 Thu, 10 Nov 2022 06:25:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id S6RxOnaZbGP0AQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 10 Nov 2022 06:25:58 +0000
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
X-Inumbo-ID: 8aca3482-60c0-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1668061559; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4Qqm8NV5NfbXssPdd91JJXy1qByRPo1Ka40FbHRtToY=;
	b=YVYsHQPD8l/cEc3CwEX1A7ho1HmplDR+WX8e7vAoTDaTRp6OWz9/xLSuBsV8aihBxyr+wD
	eYgKhrl1IaQtO+ojC5Iqz1ViSOZIgBeoY2ZnA+hyr1gkXPNeIiIxsxprc5+wH++x9HXZhv
	tzYhmMuiIvLpjosIg10fMGGG12iq/KU=
Message-ID: <0cfd23d3-2b3d-5e16-2d2e-a2d345bf3d89@suse.com>
Date: Thu, 10 Nov 2022 07:25:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
To: George Dunlap <George.Dunlap@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Henry Wang <Henry.Wang@arm.com>
References: <20221103163631.13145-1-jgross@suse.com>
 <ca972491-4200-5d3c-18b4-122a9f4e61c7@citrix.com>
 <C8C5E837-5A3B-4E79-A18E-41EE4B6A4086@citrix.com>
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
Subject: Re: Revert of the 4.17 hypercall handler changes Re: [PATCH-for-4.17]
 xen: fix generated code for calling hypercall handlers
In-Reply-To: <C8C5E837-5A3B-4E79-A18E-41EE4B6A4086@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------MXcCJYGGfwCaK04hIJxn1BFQ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------MXcCJYGGfwCaK04hIJxn1BFQ
Content-Type: multipart/mixed; boundary="------------Oe3cela21i1eA2L68jpTQNBA";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: George Dunlap <George.Dunlap@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Henry Wang <Henry.Wang@arm.com>
Message-ID: <0cfd23d3-2b3d-5e16-2d2e-a2d345bf3d89@suse.com>
Subject: Re: Revert of the 4.17 hypercall handler changes Re: [PATCH-for-4.17]
 xen: fix generated code for calling hypercall handlers
References: <20221103163631.13145-1-jgross@suse.com>
 <ca972491-4200-5d3c-18b4-122a9f4e61c7@citrix.com>
 <C8C5E837-5A3B-4E79-A18E-41EE4B6A4086@citrix.com>
In-Reply-To: <C8C5E837-5A3B-4E79-A18E-41EE4B6A4086@citrix.com>

--------------Oe3cela21i1eA2L68jpTQNBA
Content-Type: multipart/mixed; boundary="------------2BOvoAgTSCF077PThRuMthSh"

--------------2BOvoAgTSCF077PThRuMthSh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDkuMTEuMjIgMjE6MTYsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+IA0KPj4gT24gNCBO
b3YgMjAyMiwgYXQgMDU6MDEsIEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJp
eC5jb20+IHdyb3RlOg0KPj4NCj4+IE9uIDAzLzExLzIwMjIgMTY6MzYsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4gVGhlIGNvZGUgZ2VuZXJhdGVkIGZvciB0aGUgY2FsbF9oYW5kbGVy
c18qKCkgbWFjcm9zIG5lZWRzIHRvIGF2b2lkDQo+Pj4gdW5kZWZpbmVkIGJlaGF2aW9yIHdo
ZW4gbXVsdGlwbGUgaGFuZGxlcnMgc2hhcmUgdGhlIHNhbWUgcHJpb3JpdHkuDQo+Pj4gVGhl
IGlzc3VlIGlzIHRoZSBoeXBlcmNhbGwgbnVtYmVyIGJlaW5nIHVudmVyaWZpZWQgZmVkIGlu
dG8gdGhlIG1hY3Jvcw0KPj4+IGFuZCB0aGVuIHVzZWQgdG8gc2V0IGEgbWFzayB2aWEgIm1h
c2sgPSAxVUxMIDw8IDxoeXBlcmNhbGwtbnVtYmVyPiIuDQo+Pj4NCj4+PiBBdm9pZCBhIHNo
aWZ0IGFtb3VudCBvZiBtb3JlIHRoYW4gNjMgYnkgc2V0dGluZyBtYXNrIHRvIHplcm8gaW4g
Y2FzZQ0KPj4+IHRoZSBoeXBlcmNhbGwgbnVtYmVyIGlzIHRvbyBsYXJnZS4NCj4+Pg0KPj4+
IEZpeGVzOiBlY2ExZjAwZDAyMjcgKCJ4ZW46IGdlbmVyYXRlIGh5cGVyY2FsbCBpbnRlcmZh
Y2UgcmVsYXRlZCBjb2RlIikNCj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+DQo+Pg0KPj4gVGhpcyBpcyBub3QgYSBzdWl0YWJsZSBmaXguICBU
aGVyZSBiZWluZyBhIHNlY3VyaXR5IGlzc3VlIGlzIGp1c3QgdGhlDQo+PiB0aXAgb2YgdGhl
IGljZWJlcmcuDQo+IA0KPiBBdCB0aGUgeDg2IE1haW50YWluZXLigJlzIG1lZXRpbmcgb24g
TW9uZGF5LCB3ZSAoQW5kcmV3LCBKYW4sIGFuZCBJKSB0YWxrZWQgYWJvdXQgdGhpcyBwYXRj
aC4gIEhlcmUgaXMgbXkgc3VtbWFyeSBvZiB0aGUgY29udmVyc2F0aW9uICh3aXRoIHRoZSBj
YXZlYXQgdGhhdCBJIG1heSBnZXQgc29tZSBvZiB0aGUgZGV0YWlscyB3cm9uZykuDQo+IA0K
PiBUaGUgcHJvcG9zZWQgYmVuZWZpdHMgb2YgdGhlIHNlcmllcyBhcmU6DQo+IA0KPiAxLiBC
eSByZW1vdmluZyBpbmRpcmVjdCBjYWxscywgaXQgcmVtb3ZlcyB0aG9zZSBhcyBhIOKAnHNw
ZWN1bGF0aXZlIGF0dGFjayBzdXJmYWNl4oCdLg0KPiANCj4gMi4gQnkgcmVtb3ZpbmcgaW5k
aXJlY3QgY2FsbHMsIGl0IHByb3ZpZGVzIHNvbWUgcGVyZm9ybWFuY2UgYmVuZWZpdCwgc2lu
Y2UgaW5kaXJlY3QgY2FsbHMgIHJlcXVpcmUgYW4gZXh0cmEgbWVtb3J5IGZldGNoLg0KPiAN
Cj4gMy4gSXQgYXZvaWRzIGNhc3RpbmcgZnVuY3Rpb24gcG9pbnRlcnMgdG8gZnVuY3Rpb24g
cG9pbnRlcnMgb2YgYSBkaWZmZXJlbnQgdHlwZS4gIE91ciBjdXJyZW50IHByYWN0aWNlIGlz
ICp0ZWNobmljYWxseSogVUIsIGFuZCBpcyBpbmNvbXBhdGlibGUgd2l0aCBzb21lIGhhcmR3
YXJlIHNhZmV0eSBtZWNoYW5pc21zIHdoaWNoIHdlIG1heSB3YW50IHRvIHRha2UgYWR2YW50
YWdlIG9mIGF0IHNvbWUgcG9pbnQgaW4gdGhlIGZ1dHVyZTsgdGhlIHNlcmllcyBhZGRyZXNz
ZXMgYm90aC4NCj4gDQo+IFRoZXJlIHdlcmUgdHdvIGluY2lkZW50YWwgdGVjaG5pY2FsIHBy
b2JsZW1zIHBvaW50ZWQgb3V0Og0KPiANCj4gMS4gQSBwb3RlbnRpYWwgc2hpZnQgb2YgbW9y
ZSB0aGFuIDY0IGJ5dGVzLCB3aGljaCBpcyBVQjsgdGhpcyBoYXMgYmVlbiBmaXhlZC4NCj4g
DQo+IDIuIFRoZSBwcm90b3R5cGUgZm9yIHRoZSBrZXhlY19vcCBjYWxsIHdhcyBjaGFuZ2Vk
IGZyb20gdW5zaWduZWQgbG9uZyB0byB1bnNpZ25lZCBpbnQ7IHRoaXMgaXMgYW4gQUJJIGNo
YW5nZSB3aGljaCB3aWxsIGNhdXNlIGRpZmZlcmluZyBiZWhhdmlvci4gIEphbiB3aWxsIGJl
IGxvb2tpbmcgYXQgaG93IGhlIGNhbiBmaXggdGhpcywgbm93IHRoYXQgaXTigJlzIGJlZW4g
bm90ZWQuDQo+IA0KPiBCdXQgdGhlIG1vcmUgZnVuZGFtZW50YWwgY29zdHMgaW5jbHVkZToN
Cj4gDQo+IDEuIFRoZSBjb2RlIGlzIG11Y2ggbW9yZSBkaWZmaWN1bHQgbm93IHRvIHJlYXNv
biBhYm91dA0KPiANCj4gMi4gVGhlIGNvZGUgaXMgbXVjaCBsYXJnZXINCg0KVGhlIHRvIGJl
IG1haW50YWluZWQgY29kZSBpcyBzbWFsbGVyLiBUaGUgb3ZlcmFsbCBkaWZmc3RhdCBvZiB0
aGUgc2VyaWVzIHNob3dzDQp0aGF0IG1vcmUgbGluZXMgd2VyZSBkZWxldGVkIHRoYW4gYWRk
ZWQuDQoNClRoZSBnZW5lcmF0ZWQgY29kZSBpcyBsYXJnZXIsIGJ1dCB0aGlzIGFwcGxpZXMg
dG8gb3RoZXIgY2hhbmdlcyAobmV3IGNvbXBpbGVyLA0KbW9kaWZpZWQgYnVpbGQgc2V0dGlu
Z3MsIC4uLikgb2Z0ZW4gZW5vdWdoLCB0b28uDQoNCj4gMy4gVGhlIGxvbmcgaWYvZWxzZSBj
aGFpbiBjb3VsZCB0aGVvcmV0aWNhbGx5IGhlbHAgaHlwZXJjYWxscyBhdCB0aGUgdG9wIGlm
IHRoZSBjaGFpbiwgYnV0IHdvdWxkIGRlZmluaXRlbHkgYmVnaW4gdG8gaHVydCBoeXBlcmNh
bGxzIGF0IHRoZSBib3R0b20gb2YgdGhlIGNoYWluOyBhbmQgdGhlIG1vcmUgaHlwZXJjYWxs
cyB3ZSBhZGQsIHRoZSBtb3JlIG9mIGEgdGhlb3JldGljYWwgcGVyZm9ybWFuY2UgcGVuYWx0
eSB0aGlzIHdpbGwgaGF2ZQ0KPiANCj4gNC4gQnkgdXNpbmcgNjQtYml0IG1hc2tzLCB0aGUg
aW1wbGVtZW50YXRpb24gbGltaXRzIHRoZSBudW1iZXIgb2YgaHlwZXJjYWxscyB0byA2NDsg
YSBudW1iZXIgd2UgYXJlIGxpa2VseSB0byBleGNlZWQgaWYgd2UgaW1wbGVtZW50IEFCSXYy
IHRvIGJlIGNvbXBhdGlibGUgd2l0aCBBTUQgU0VWLg0KDQpUaGlzIGlzIHNvbHZhYmxlIGF0
IG9uZSBjZW50cmFsIHBsYWNlLg0KDQo+IEFkZGl0aW9uYWxseSwgdGhlcmUgaXMgYSBxdWVz
dGlvbiBhYm91dCB3aGV0aGVyIHNvbWUgb2YgdGhlIGFsbGVnZWQgYmVuZWZpdHMgYWN0dWFs
bHkgaGVscDoNCj4gDQo+IDEuIE9uIEFNRCBwcm9jZXNzb3JzLCB3ZSBlbmFibGUgSUJSUywg
d2hpY2ggY29tcGxldGVseSByZW1vdmVzIGluZGlyZWN0IGNhbGxzIGFzIGEgc3BlY3VsYXRp
dmUgYXR0YWNrIHN1cmZhY2UgYWxyZWFkeS4gIEFuZCBvbiBJbnRlbCBwcm9jZXNzb3JzLCB0
aGlzIGF0dGFjayBzdXJmYWNlIGhhcyBhbHJlYWR5IGJlZW4gc2lnbmlmaWNhbnRseSByZWR1
Y2VkLiAgU28gcmVtb3ZpbmcgaW5kaXJlY3QgY2FsbHMgaXMgbm90IGFzIGltcG9ydGFudCBh
biBpc3N1ZS4NCj4gDQo+IDIuIE5vcm1hbCBicmFuY2hlcyBhcmUgKmFsc28qIGEgc3VyZmFj
ZSBvZiBzcGVjdWxhdGl2ZSBhdHRhY2tzOyBzbyBldmVuIGFwYXJ0IGZyb20gdGhlIGFib3Zl
LCBhbGwgdGhpcyBzZXJpZXMgZG9lcyBpcyBjaGFuZ2Ugb25lIHBvdGVudGlhbCBhdHRhY2sg
c3VyZmFjZSBmb3IgYW5vdGhlciBvbmUuDQoNCkhpc3RvcnkgaGFzIHNob3duIHRoYXQgc3Bl
Y3VsYXRpdmUgYXR0YWNrcyB2aWEgaW5kaXJlY3QgYnJhbmNoZXMgYXJlIG11Y2gNCmhhcmRl
ciB0byBzb2x2ZS4gTmV3IG9uZXMgY29taW5nIHVwIHdpbGwgcHJvYmFibHkgaGF2ZSB0aGUg
c2FtZSBwcm9ibGVtLg0KDQo+IDMuIFdoZW4gd2UgYW5hbHl6ZSB0aGVvcmV0aWNhbCBwZXJm
b3JtYW5jZSB3aXRoIGRlZXAgQ1BVIHBpcGVsaW5lcyBhbmQgc3BlY3VsYXRpb24gaW4gbWlu
ZCwgdGhlIHRoZW9yZXRpY2FsIGRpc2FkdmFudGFnZSBvZiBpbmRpcmVjdCBicmFuY2hlcyBn
b2VzIGF3YXk7IGFuZCBkZXBlbmRpbmcgb24gdGhlIGhhcmR3YXJlLCB0aGVyZSBpcyBhIHRo
ZW9yZXRpY2FsIHBlcmZvcm1hbmNlIGRlZ3JhZGF0aW9uLg0KPiANCj4gNC4gRnJvbSBhIHBy
YWN0aWNhbCBwZXJzcGVjdGl2ZSwgdGhlIHBlcmZvcm1hbmNlIHRlc3RzIGFyZSB2ZXJ5IG11
Y2ggaW5zdWZmaWNpZW50IHRvIHNob3cgZWl0aGVyIHRoYXQgdGhpcyBpcyBhbiBpbXByb3Zl
bWVudCwgb3IgdGhhdCBkb2VzIG5vdCBjYXVzZSBhIHBlcmZvcm1hbmNlIHJlZ3Jlc3Npb24u
ICBUbyBzaG93IHRoYXQgdGhlcmUgaGFzbuKAmXQgYmVlbiBhIHBlcmZvcm1hbmNlIGRlZ3Jh
ZGF0aW9uLCBhIGJhdHRlcnkgb2YgdGVzdHMgbmVlZHMgdG8gYmUgZG9uZSBvbiBoYXJkd2Fy
ZSBmcm9tIGEgdmFyaWV0eSBvZiBkaWZmZXJlbnQgdmVuZG9ycyBhbmQgY3B1IGdlbmVyYXRp
b25zLCBzaW5jZSBlYWNoIG9mIHRoZW0gd2lsbCBoYXZlIGRpZmZlcmVudCBwcm9wZXJ0aWVz
IGFmdGVyIGFsbCBzcGVjdWxhdGl2ZSBtaXRpZ2F0aW9ucyBoYXZlIGJlZW4gYXBwbGllZC4N
Cg0KVGhpcyBhcmd1bWVudCBpcyB0cnVlIGZvciBtYW55IGNoYW5nZXMgd2UgYXJlIGRvaW5n
Lg0KDQpUaGUgcGVyZm9ybWFuY2UgaW1wYWN0IG1pZ2h0IGJlIHBvc2l0aXZlIG9yIG5lZ2F0
aXZlLiBXaXRoIHRoZSBwb3NzaWJpbGl0eQ0Kb2YgcHJpb3JpdGllcyB0aGUgaW1wYWN0IGNh
biBiZSBjb250cm9sbGVkLCB0aG91Z2guDQoNCj4gU28gdGhlIGFyZ3VtZW50IGlzIGFzIGZv
bGxvd3M6DQo+IA0KPiBUaGVyZSBpcyBubyBzcGVjdWxhdGl2ZSBiZW5lZml0IGZvciB0aGUg
c2VyaWVzOyB0aGVyZSBpcyBpbnN1ZmZpY2llbnQgcGVyZm9ybWFuY2UgZXZpZGVuY2UsIGVp
dGhlciB0byBqdXN0aWZ5IGEgcGVyZm9ybWFuY2UgYmVuZWZpdCBvciB0byBhbGxheSBkb3Vi
dHMgYWJvdXQgYSBwZXJmb3JtYW5jZSByZWdyZXNzaW9uOyBhbmQgdGhlIGJlbmVmaXQgdGhh
dCB0aGVyZSBpcyBpbnN1ZmZpY2llbnQgdG8gY291bnRlcmJhbGFuY2UgdGhlIGNvc3RzLCBh
bmQgc28gdGhlIHNlcmllcyBzaG91bGQgYmUgcmV2ZXJ0ZWQuDQo+IA0KPiBBdCB0aGUgZW5k
IG9mIHRoZSBkaXNjdXNzaW9uLCBKYW4gYW5kIEkgYWdyZWVkIHRoYXQgQW5kcmV3IGhhZCBt
YWRlIGEgZ29vZCBjYXNlIGZvciB0aGUgc2VyaWVzIHRvIGJlIHJlbW92ZWQgYXQgc29tZSBw
b2ludC4gIFRoZSBkaXNjdXNzaW9uIG5lZWRzIHRvIGJlIGNvbmNsdWRlZCBvbiB0aGUgbGlz
dCwgbmF0dXJhbGx5OyBhbmQgaWYgdGhlcmUgaXMgYSBjb25zZW5zdXMgdG8gcmVtb3ZlIHRo
ZSBzZXJpZXMsIHRoZSBuZXh0IHF1ZXN0aW9uIHdvdWxkIGJlIHdoZXRoZXIgd2Ugc2hvdWxk
IHJldmVydCBpdCBub3csIGJlZm9yZSA0LjE3LjAsIG9yIHdhaXQgdW50aWwgYWZ0ZXIgdGhl
IHJlbGVhc2UgYW5kIHJldmVydCBpdCB0aGVuIChwZXJoYXBzIHdpdGggYSBiYWNrcG9ydCB0
byA0LjE3LjEpLg0KPiANCj4gKEphbiBhbmQgQW5keSwgcGxlYXNlIGxldCBtZSBrbm93IGlm
IEnigJl2ZSBtaXN1bmRlcnN0b29kIGFueXRoaW5nIGZyb20gdGhhdCBtZWV0aW5nLikNCg0K
SSdtIG5vdCBhZ2FpbnN0IHJldmVydGluZy4NCg0KSSBqdXN0IHdhbnRlZCB0byBzaGFyZSBt
eSB0aG91Z2h0cyBvbiBhYm92ZSByZWFzb25pbmcuDQoNCg0KSnVlcmdlbg0K
--------------2BOvoAgTSCF077PThRuMthSh
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------2BOvoAgTSCF077PThRuMthSh--

--------------Oe3cela21i1eA2L68jpTQNBA--

--------------MXcCJYGGfwCaK04hIJxn1BFQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmNsmXYFAwAAAAAACgkQsN6d1ii/Ey+R
vAgAhWigLXgP1qhAHKlpHiZ+SJmVMOtefy4y2xYle9E6h/p3DNvRaAUk0bebZt7ZXLyQQuF7F8AU
VcUiSZ6xbbnRLwoQs9yu12odEHs2A/5ApM4DN/DgOlOjZmztIp2mctflN9EfuhxM3XZ8fCypyUVW
dRrgxtveA+U2BaQXzV76rlc2Ie301fwd2LUS7QOXjD3yACYsI5i7rMbR2XlBJsEvaJ5Qlnvv80rp
90x1a66BbPeiFF5zab02dwra83x/sgaGIKon9p6ibM9dPgTEpM7vhVVa+21fsxozkAkFlcHQBHJA
wBjxYbphP4C98T/9iqA4q5xNW1sYnQGq6Uyn+4TzLg==
=leTL
-----END PGP SIGNATURE-----

--------------MXcCJYGGfwCaK04hIJxn1BFQ--

