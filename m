Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6616B5A50F0
	for <lists+xen-devel@lfdr.de>; Mon, 29 Aug 2022 18:04:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394639.634118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oShEm-0000CD-Bo; Mon, 29 Aug 2022 16:03:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394639.634118; Mon, 29 Aug 2022 16:03:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oShEm-00008i-8o; Mon, 29 Aug 2022 16:03:44 +0000
Received: by outflank-mailman (input) for mailman id 394639;
 Mon, 29 Aug 2022 16:03:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XWGx=ZB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oShEk-00008c-Nl
 for xen-devel@lists.xenproject.org; Mon, 29 Aug 2022 16:03:42 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 262fc917-27b4-11ed-bd2e-47488cf2e6aa;
 Mon, 29 Aug 2022 18:03:41 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 08AEB1F8CC;
 Mon, 29 Aug 2022 16:03:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D4E261352A;
 Mon, 29 Aug 2022 16:03:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VLCVMVvjDGOEFgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 29 Aug 2022 16:03:39 +0000
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
X-Inumbo-ID: 262fc917-27b4-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1661789020; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4pxyYPaIf3VsbPY1/UyAbam5CqWsKKiajwdFLGIAB14=;
	b=rDthxsE3JxOXQuCIaIV47hHswGrEm9OIsx6yYZ3Uvrws6WPUhE+WyFH6KEb/RYdTkJmW4J
	OYXfhqjYX14H+j0DQgeEBJecJOhr+NFp/tk1MzaJDOTQzLFXuuj/4mNqgDN6VO79DOyjXI
	7ZmJUc0QOVmsgz8sYZJbaN4C8waIzBM=
Message-ID: <739d573d-a68f-1aaf-9941-846e6c60930a@suse.com>
Date: Mon, 29 Aug 2022 18:03:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>
References: <YwSEXonOg1CMzeQv@itl-email>
 <fe4aa229-2d3b-2bc7-e906-bb61a5d45f6d@suse.com> <YwVuwXOGoZX3pM7n@mail-itl>
 <ebc89685-a559-5511-5c82-41ae30ddbf6d@suse.com> <Ywr6CfxUZs4zRPYR@itl-email>
 <82458b1a-d6f6-5fa1-8a38-e9869826308f@suse.com> <YwzPotro68PP2u41@mail-itl>
From: Juergen Gross <jgross@suse.com>
Subject: =?UTF-8?Q?Re=3a_=e2=80=9cBackend_has_not_unmapped_grant=e2=80=9d_er?=
 =?UTF-8?Q?rors?=
In-Reply-To: <YwzPotro68PP2u41@mail-itl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------R07pWSMir0pwhn0KnwuZbHB7"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------R07pWSMir0pwhn0KnwuZbHB7
Content-Type: multipart/mixed; boundary="------------RbobgkrMtzQSGIslJdYhbY2O";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>
Message-ID: <739d573d-a68f-1aaf-9941-846e6c60930a@suse.com>
Subject: =?UTF-8?Q?Re=3a_=e2=80=9cBackend_has_not_unmapped_grant=e2=80=9d_er?=
 =?UTF-8?Q?rors?=
References: <YwSEXonOg1CMzeQv@itl-email>
 <fe4aa229-2d3b-2bc7-e906-bb61a5d45f6d@suse.com> <YwVuwXOGoZX3pM7n@mail-itl>
 <ebc89685-a559-5511-5c82-41ae30ddbf6d@suse.com> <Ywr6CfxUZs4zRPYR@itl-email>
 <82458b1a-d6f6-5fa1-8a38-e9869826308f@suse.com> <YwzPotro68PP2u41@mail-itl>
In-Reply-To: <YwzPotro68PP2u41@mail-itl>

--------------RbobgkrMtzQSGIslJdYhbY2O
Content-Type: multipart/mixed; boundary="------------t0pM4hF5ibeA8WqRTK1Zb2br"

--------------t0pM4hF5ibeA8WqRTK1Zb2br
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjkuMDguMjIgMTY6MzksIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToN
Cj4gT24gTW9uLCBBdWcgMjksIDIwMjIgYXQgMDI6NTU6NTVQTSArMDIwMCwgSnVlcmdlbiBH
cm9zcyB3cm90ZToNCj4+IE9uIDI4LjA4LjIyIDA3OjE1LCBEZW1pIE1hcmllIE9iZW5vdXIg
d3JvdGU6DQo+Pj4gT24gV2VkLCBBdWcgMjQsIDIwMjIgYXQgMDg6MTE6NTZBTSArMDIwMCwg
SnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+Pj4gT24gMjQuMDguMjIgMDI6MjAsIE1hcmVrIE1h
cmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToNCj4+Pj4+IE9uIFR1ZSwgQXVnIDIzLCAyMDIy
IGF0IDA5OjQ4OjU3QU0gKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+Pj4gT24g
MjMuMDguMjIgMDk6NDAsIERlbWkgTWFyaWUgT2Jlbm91ciB3cm90ZToNCj4+Pj4+Pj4gSSBy
ZWNlbnRseSBoYWQgYSBWTeKAmXMgL2Rldi94dmRiIHN0b3Agd29ya2luZyB3aXRoIGEg4oCc
YmFja2VuZCBoYXMgbm90DQo+Pj4+Pj4+IHVubWFwcGVkIGdyYW504oCdIGVycm9yLiAgU2lu
Y2UgL2Rldi94dmRiIHdhcyB0aGUgVk3igJlzIHByaXZhdGUgdm9sdW1lLA0KPj4+Pj4+PiB0
aGF0IHJlbmRlcmVkIHRoZSBWTSBlZmZlY3RpdmVseSB1c2VsZXNzLiAgSSBoYWQgdG8ga2ls
bCBpdCB3aXRoDQo+Pj4+Pj4+IHF2bS1raWxsLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBUaGUgYmFj
a2VuZCBvZiAvZGV2L3h2ZGIgaXMgZG9tMCwgc28gYSBtYWxpY2lvdXMgYmFja2VuZCBpcyBj
bGVhcmx5IG5vdA0KPj4+Pj4+PiB0aGUgY2F1c2Ugb2YgdGhpcy4gIEkgYmVsaWV2ZSB0aGUg
YWN0dWFsIGNhdXNlIGlzIGEgcmFjZSBjb25kaXRpb24sIHN1Y2gNCj4+Pj4+Pj4gYXMgdGhl
IGZvbGxvd2luZzoNCj4+Pj4+Pj4NCj4+Pj4+Pj4gMS4gR1VJIGFnZW50IGluIFZNIGFsbG9j
YXRlcyBncmFudCBYLg0KPj4+Pj4+PiAyLiBHVUkgYWdlbnQgdGVsbHMgR1VJIGRhZW1vbiBp
biBkb20wIHRvIG1hcCBYLg0KPj4+Pj4+PiAzLiBHVUkgYWdlbnQgZnJlZXMgZ3JhbnQgWC4N
Cj4+Pj4+Pj4gNC4gYmxrZnJvbnQgYWxsb2NhdGVzIGdyYW50IFggYW5kIHBhc3NlcyBpdCB0
byBkb20wLg0KPj4+Pj4+PiA1LiBkb20w4oCZcyBibGtiYWNrIG1hcHMgZ3JhbnQgWC4NCj4+
Pj4+Pj4gNi4gYmxrYmFjayB1bm1hcHMgZ3JhbnQgWC4NCj4+Pj4+Pj4gNy4gR1VJIGRhZW1v
biBtYXBzIGdyYW50IFguDQo+Pj4+Pj4+IDguIGJsa2Zyb250IHRyaWVzIHRvIHJldm9rZSBh
Y2Nlc3MgdG8gZ3JhbnQgWCBhbmQgZmFpbHMuICBEaXNhc3Rlcg0KPj4+Pj4+PiAgICAgICAg
ZW5zdWVzLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBXaGF0IGNvdWxkIGJlIGRvbmUgdG8gcHJldmVu
dCB0aGlzIHJhY2U/ICBSaWdodCBub3cgYWxsIG9mIHRoZQ0KPj4+Pj4+PiBhcHByb2FjaGVz
IEkgY2FuIHRoaW5rIG9mIGFyZSBob3JyaWJseSBiYWNrd2FyZHMtaW5jb21wYXRpYmxlLiAg
VGhleQ0KPj4+Pj4+PiByZXF1aXJlIHJlcGxhY2luZyBncmFudCBJRHMgd2l0aCBzb21lIHNv
cnQgb2YgaGFuZGxlLCBhbmQgcmVxdWlyaW5nDQo+Pj4+Pj4+IHVzZXJzcGFjZSB0byBwYXNz
IHRoZXNlIGhhbmRsZXMgdG8gaW9jdGxzLiAgSXQgaXMgYWxzbyBwb3NzaWJsZSB0aGF0DQo+
Pj4+Pj4+IG5ldGZyb250IGFuZCBibGtmcm9udCBjb3VsZCByYWNlIGFnYWluc3QgZWFjaCBv
dGhlciBpbiBhIHdheSB0aGF0IGNhdXNlcw0KPj4+Pj4+PiB0aGlzLCB0aG91Z2ggSSBzdXNw
ZWN0IHRoYXQgcmFjZSB3b3VsZCBiZSBtdWNoIGhhcmRlciB0byB0cmlnZ2VyLg0KPj4+Pj4+
Pg0KPj4+Pj4+PiBUaGlzIGhhcyBoYXBwZW5lZCBtb3JlIHRoYW4gb25jZSBzbyBpdCBpcyBu
b3QgYSBmbHVrZSBkdWUgdG8gZS5nLiBjb3NtaWMNCj4+Pj4+Pj4gcmF5cyBvciBvdGhlciBy
YW5kb20gYml0LWZsaXBzLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBNYXJlaywgZG8geW91IGhhdmUg
YW55IHN1Z2dlc3Rpb25zPw0KPj4+Pj4+DQo+Pj4+Pj4gVG8gbWUgdGhhdCBzb3VuZHMgbGlr
ZSB0aGUgaW50ZXJmYWNlIG9mIHRoZSBHVUkgaXMgdGhlIGN1bHByaXQuDQo+Pj4+Pj4NCj4+
Pj4+PiBUaGUgR1VJIGFnZW50IGluIHRoZSBndWVzdCBzaG91bGQgb25seSBmcmVlIGEgZ3Jh
bnQsIGlmIGl0IGdvdCBhIG1lc3NhZ2UNCj4+Pj4+PiBmcm9tIHRoZSBiYWNrZW5kIHRoYXQg
aXQgY2FuIGRvIHNvLiBKdXN0IGFzc3VtaW5nIHRvIGJlIGFibGUgdG8gZnJlZSBpdA0KPj4+
Pj4+IGJlY2F1c2UgaXQgaXNuJ3QgaW4gdXNlIGN1cnJlbnRseSBpcyB0aGUgYnJva2VuIGFz
c3VtcHRpb24gaGVyZS4NCj4+Pj4+DQo+Pj4+PiBGV0lXLCBJIGhpdCB0aGlzIGlzc3VlIHR3
aWNlIGFscmVhZHkgaW4gdGhpcyB3ZWVrIENJIHJ1biwgd2hpbGUgaXQgbmV2ZXINCj4+Pj4+
IGhhcHBlbmVkIGJlZm9yZS4gVGhlIGRpZmZlcmVuY2UgY29tcGFyZWQgdG8gcHJldmlvdXMg
cnVuIGlzIExpbnV4DQo+Pj4+PiA1LjE1LjU3IHZzIDUuMTUuNjEuIFRoZSBsYXR0ZXIgcmVw
b3J0cyBwZXJzaXN0ZW50IGdyYW50cyBkaXNhYmxlZC4NCj4+Pj4NCj4+Pj4gSSB0aGluayB0
aGlzIGFkZGl0aW9uYWwgYnVnIGlzIGp1c3QgdHJpZ2dlcmluZyB0aGUgcmFjZSBpbiB0aGUg
R1VJDQo+Pj4+IGludGVyZmFjZSBtb3JlIGVhc2lseSwgYXMgYmxrZnJvbnQgd2lsbCBhbGxv
Y2F0ZSBuZXcgZ3JhbnRzIHdpdGggYQ0KPj4+DQo+Pj4gMS4gVHJlYXQg4oCcYmFja2VuZCBo
YXMgbm90IHVubWFwcGVkIGdyYW504oCdIGVycm9ycyBhcyBub24tZmF0YWwuICBUaGUgbW9z
dA0KPj4+ICAgICAgbGlrZWx5IGNhdXNlIGlzIGJ1Z2d5IHVzZXJzcGFjZSBzb2Z0d2FyZSwg
bm90IGFuIGF0dGVtcHQgdG8gZXhwbG9pdA0KPj4+ICAgICAgWFNBLTM5Ni4gIEluc3RlYWQg
b2YgZGlzYWJsaW5nIHRoZSBkZXZpY2UsIGp1c3QgbG9nIGEgd2FybmluZyBtZXNzYWdlDQo+
Pj4+IG11Y2ggaGlnaGVyIGZyZXF1ZW5jeS4NCj4+Pj4NCj4+Pj4gU28gZml4aW5nIHRoZSBw
ZXJzaXN0ZW50IGdyYW50IGlzc3VlIHdpbGwganVzdCBwYXBlciBvdmVyIHRoZSByZWFsDQo+
Pj4+IGlzc3VlLg0KPj4+DQo+Pj4gSW5kZWVkIHNvLCBidXQgbWFraW5nIHRoZSBidWcgaGFw
cGVuIG11Y2ggbGVzcyBmcmVxdWVudGx5IGlzIHN0aWxsIGENCj4+PiBzaWduaWZpY2FudCB3
aW4gZm9yIHVzZXJzLg0KPj4NCj4+IFByb2JhYmx5LCB5ZXMuDQo+Pg0KPj4+IEluIHRoZSBs
b25nIHRlcm0sIHRoZXJlIGlzIG9uZSBzaXR1YXRpb24gSSBkbyBub3QgaGF2ZSBhIGdvb2Qg
c29sdXRpb24NCj4+PiBmb3I6IHJlY292ZXJ5IGZyb20gR1VJIGFnZW50IGNyYXNoZXMuICBJ
ZiB0aGUgR1VJIGFnZW50IGNyYXNoZXMsIHRoZQ0KPj4+IGtlcm5lbCBpdCBpcyBydW5uaW5n
IHVuZGVyIGhhcyB0d28gYmFkIGNob2ljZXMuICBFaXRoZXIgdGhlIGtlcm5lbCBjYW4NCj4+
PiByZWNsYWltIHRoZSBncmFudHMsIHJpc2tpbmcgdGhlbSBiZWluZyBtYXBwZWQgYXQgYSBs
YXRlciB0aW1lIGJ5IHRoZSBHVUkNCj4+PiBkYWVtb24sIG9yIGl0IGNhbiBsZWFrIHRoZW0s
IHdoaWNoIGlzIGJhZCBmb3Igb2J2aW91cyByZWFzb25zLiAgSQ0KPj4+IGJlbGlldmUgdGhl
IGN1cnJlbnQgaW1wbGVtZW50YXRpb24gbWFrZXMgdGhlIGZvcm1lciBjaG9pY2UuDQo+Pg0K
Pj4gSXQgZG9lcy4NCj4+DQo+PiBJIGRvbid0IGhhdmUgZW5vdWdoIGluZm9ybWF0aW9uIGFi
b3V0IHRoZSBHVUkgYXJjaGl0ZWN0dXJlIHlvdSBhcmUgdXNpbmcuDQo+PiBXaGljaCBjb21w
b25lbnRzIGFyZSBpbnZvbHZlZCBvbiB0aGUgYmFja2VuZCBzaWRlLCBhbmQgd2hpY2ggb24g
dGhlDQo+PiBmcm9udGVuZCBzaWRlPyBFc3BlY2lhbGx5IHRoZSByZXNwb25zaWJpbGl0aWVz
IGFuZCBjb21tdW5pY2F0aW9uIHJlZ2FyZGluZw0KPj4gZ3JhbnRzIGlzIGltcG9ydGFudCBo
ZXJlLg0KPiANCj4gSSdsbCBsaW1pdCB0aGUgZGVzY3JpcHRpb24gdG8gdGhlIHJlbGV2YW50
IG1pbmltdW0gaGVyZS4NCg0KVGhhbmtzIGZvciB0aGUgaW5mb3JtYXRpb24uIEl0IGhlbHBz
IGEgbG90Lg0KDQo+IFRoZSBndWktYWdlbnQoKikgdXNlcyBnbnRhbGxvYyB0byBzaGFyZSBm
cmFtZWJ1ZmZlcnMgKHRoZXkgYXJlIGFsbG9jYXRlZA0KPiB3aGVuZXZlciBhbiBhcHBsaWNh
dGlvbiB3aXRoaW4gZG9tVSBvcGVucyBhIHdpbmRvdyksIHRoZW4gc2VuZHMgZ3JhbnQNCj4g
cmVmZXJlbmNlIG51bWJlcnMgb3ZlciB2Y2hhbiB0byB0aGUgZ3VpLWRhZW1vbiAocnVubmlu
ZyBpbiBkb20wIGJ5DQo+IGRlZmF1bHQsIGJ1dCBpdCBjYW4gYmUgYWxzbyBhbm90aGVyIGRv
bVUpLg0KPiBUaGVuIHRoZSBndWktZGFlbW9uKCopIG1hcHMgdGhlbS4NCj4gTGF0ZXIsIHdo
ZW4gYW4gYXBwbGljYXRpb24gY2xvc2VzIGEgd2luZG93LCB0aGUgc2hhcmVkIG1lbW9yeSBp
cw0KPiB1bm1hcHBlZCwgYW5kIGd1aS1kYWVtb24gaXMgaW5mb3JtZWQgYWJvdXQgaXQuIFJl
bGVhc2luZyBncmFudCByZWZzIGlzDQo+IGRlZmVycmVkIGJ5IHRoZSBrZXJuZWwgKHVudGls
IGd1aS1kYWVtb24gdW5tYXBzIHRoZW0pLiBJdCBtYXkgaGFwcGVuDQo+IHRoYXQgdW5tYXBw
aW5nIG9uIHRoZSBndWktYWdlbnQgc2lkZSB3aWxsIGhhcHBlbiBiZWZvcmUgZ3VpLWRhZW1v
biBtYXBzDQo+IHRoZW0uIFdlIGFyZSBtb2RpZnlpbmcgb3VyIEdVSSBwcm90b2NvbCB0byBk
ZWxheSByZWxlYXNpbmcgZ3JhbnRzIG9uIHRoZQ0KPiB1c2VyIHNwYWNlIHNpZGUsIHRvIGNv
b3JkaW5hdGUgd2l0aCBndWktZGFlbW9uIChiYXNpY2FsbHkgd2FpdCB1bnRpbA0KPiBndWkt
ZGFlbW9uIGNvbmZpcm1zIGl0IHVubWFwcGVkIHRoZW0pLiBUaGlzIHNob3VsZCBmaXggdGhl
ICJub3JtYWwiDQo+IGNhc2UuDQo+IEJ1dCBpZiB0aGUgZ3VpLWFnZW50IGNyYXNoZXMganVz
dCBhZnRlciBzZW5kaW5nIGdyYW50IHJlZnMsIGJ1dCBiZWZvcmUNCj4gZ3VpLWRhZW1vbiBt
YXBzIHRoZW0sIHRoZW4gdGhlIHByb2JsZW0gaXMgc3RpbGwgdGhlcmUuIElmIHRoZXkgYXJl
DQo+IGltbWVkaWF0ZWx5IHJlbGVhc2VkIGJ5IHRoZSBrZXJuZWwgZm9yIG90aGVycyB0byB1
c2UsIHdlIGNhbiBoaXQgdGhlDQo+IHNhbWUgaXNzdWUgYWdhaW4gKGZvciBleGFtcGxlIGJs
a2Zyb250IHVzaW5nIHRoZW0sIGFuZCB0aGVuIGd1aS1kYWVtb24NCj4gbWFwcGluZyB0aGVt
KS4gSSBkb24ndCBzZWUgcmFjZS1mcmVlIG1ldGhvZCBmb3Igc29sdmluZyB0aGlzIHdpdGgg
dGhlDQo+IGN1cnJlbnQgQVBJLiBHVUkgZGFlbW9uIGNhbiBub3RpY2Ugd2hlbiBzdWNoIHNp
dHVhdGlvbiBoYXBwZW5zIChieQ0KPiBjaGVja2luZyBpZiBndWktYWdlbnQgaXMgc3RpbGwg
YWxpdmUgYWZ0ZXIgbWFwcGluZyBncmFudHMpLCBidXQgdGhhdCBpcw0KPiB0b28gbGF0ZSBh
bHJlYWR5Lg0KPiANCj4gVGhlIG1haW4gZGlmZmVyZW5jZSBjb21wYXJlZCB0byBrZXJuZWwg
ZHJpdmVycyBpcyB0aGUgYXV0b21hdGljIHJlbGVhc2UNCj4gb24gY3Jhc2ggKG9yIG90aGVy
IHVuY2xlYW4gZXhpdCkuIEluIGNhc2Ugb2Yga2VybmVsIGRyaXZlciBjcmFzaCwgZWl0aGVy
DQo+IHRoZSB3aG9sZSBWTSBnb2VzIGRvd24sIG9yIGF0IGxlYXN0IGF1dG9tYXRpYyByZWxl
YXNlIGRvZXNuJ3QgaGFwcGVuLg0KPiBNYXliZSBnbnRhbGxvYyBjb3VsZCBoYXZlIHNvbWUg
ZmxhZyAocGVyIG9wZW4gZmlsZT8gcGVyIGFsbG9jYXRlZA0KPiBncmFudD8pIHRvIF9ub3Rf
IHJlbGVhc2UgZ3JhbnQgcmVmZXJlbmNlIChha2EgbGVhayBpdCkgaW4gY2FzZSBvZg0KPiBp
bXBsaWNpdCB1bm1hcCwgaW5zdGVhZCBvZiBleHBsaWNpdCByZWxlYXNlPyBTdWNoIGV4cGxp
Y2l0IHJlbGVhc2UNCj4gd291bGQgbmVlZCB0byBiZSBhZGRlZCB0byB0aGUgTGludXggZ250
c2hyIEFQSSwgYXMgeGVuZ250c2hyX3Vuc2hhcmUoKQ0KPiBjdXJyZW50bHkgaXMganVzdCBt
dW5tYXAoKSkuIEkgZG9uJ3Qgc2VlIG1hbnkgb3RoZXIgb3B0aW9ucyB0byBhdm9pZA0KPiB1
c2Vyc3BhY2UgY3Jhc2ggKHBvdGVudGlhbGx5KSB0YWtpbmcgZG93biBQViBkZXZpY2Ugd2l0
aCBpdCB0b28uLi4NCg0KTXkgaWRlYSB3b3VsZCBiZSB0byBhZGQgYSBuZXcgaW9jdGwoKSB0
byB0aGUgZ250YWxsb2MgZHJpdmVyIGFsbG93aW5nIHRvDQpzcGVjaWZ5IGEgcGVybWFuZW50
IG5hbWUgZm9yIGEgZmlsZS4gVGhpcyB3b3VsZCBsZWFkIHRvOg0KDQotIHRoZSBncmFudHMg
bm90IHRvIGJlIGRyb3BwZWQgd2hlbiB0aGUgcHJvY2VzcyBpcyBkeWluZw0KLSBpbiBjYXNl
IGdyYW50cyB3aXRoIHRoaXMgbmFtZSBhcmUgZXhpc3RpbmcsIHRoZXkgYXJlIGFkZGVkIHRv
IHRoZSBmaWxlDQogICBkZXNjcmlwdG9yLCByZXN1bHRpbmcgaW4gdGhlbSBiZWluZyB1bmRl
ciBjb250cm9sIG9mIHRoZSBuZXcgcHJvY2Vzcw0KLSB0aGUgcGVybWFuZW50IGdyYW50cyB3
b3VsZCBuZWVkIHRvIGJlIHJlbW92ZSBleHBsaWNpdGx5IGluc3RlYWQgb2YNCiAgIGNsZWFu
ZWQgdXAgZHVlIHRvIGNsb3NlKCkNCg0KDQpKdWVyZ2VuDQo=
--------------t0pM4hF5ibeA8WqRTK1Zb2br
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------t0pM4hF5ibeA8WqRTK1Zb2br--

--------------RbobgkrMtzQSGIslJdYhbY2O--

--------------R07pWSMir0pwhn0KnwuZbHB7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMM41sFAwAAAAAACgkQsN6d1ii/Ey/t
Zgf+OraE3CuzBe+Prj5/BR9rM7IFt/uR/xK/gEE6ASAOq8VGS4KVYlt2WUP5IMIuDQLIKddm8ZW3
kaIT1MdcjeJX6h2FTcDwQnKza4ix5D7kbCpP2hmkGgKlgcRvFOY6OVkMHDzxUHqqTKbmiiUzLpNU
uTxpLDwmWQAJJYThBLBaaDgUKHLXo32I73yBGR9IrtnVDANJnIkz1Eusj9PVXH6FXNaCz3Xbx9TQ
k/Kz6sDqtTU18a4Pe6RlvV7+CpCA4e97PD5RrcDMNDCJM0E0ODTZrCO5UK2pXjyOj2e57Hb9MTh4
Hzt6VX9GIbh6+g4buhx9kAkX/EwUQxKcjuIOleho7g==
=aHfk
-----END PGP SIGNATURE-----

--------------R07pWSMir0pwhn0KnwuZbHB7--

