Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BD05A08C6
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 08:21:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393041.631745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR6EI-0000Oi-N4; Thu, 25 Aug 2022 06:20:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393041.631745; Thu, 25 Aug 2022 06:20:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR6EI-0000Mu-Ju; Thu, 25 Aug 2022 06:20:38 +0000
Received: by outflank-mailman (input) for mailman id 393041;
 Thu, 25 Aug 2022 06:20:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K3TS=Y5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oR6EH-0000Mo-K4
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 06:20:37 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0748f170-243e-11ed-bd2e-47488cf2e6aa;
 Thu, 25 Aug 2022 08:20:36 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5B86637A6F;
 Thu, 25 Aug 2022 06:20:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 117C713A89;
 Thu, 25 Aug 2022 06:20:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HPm6ArIUB2M9NQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 25 Aug 2022 06:20:34 +0000
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
X-Inumbo-ID: 0748f170-243e-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1661408434; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=woDWFRzsYASJx1IpLKRaNlUVASWKC/b4WJBz1i1/koM=;
	b=jMeeKOnzyPOI+Y4bhJxH+6gxunNC+JqGhjdWI4FnsI+hFZPTh9r30rdmiMFcKhlvFJmaQk
	BZK1NJikEl6DWQiOLWDb2ImXEh55dulNg5y/ggINOMX7Sw14Hd8PdWBoiSy16U/qN2v9qc
	+PbNsNb+u4GqmgrPLh+EHDLTLqG8jY0=
Message-ID: <70d931c9-2c3c-40f5-4e93-93a1aba1b76c@suse.com>
Date: Thu, 25 Aug 2022 08:20:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: =?UTF-8?Q?Re=3a_=e2=80=9cBackend_has_not_unmapped_grant=e2=80=9d_er?=
 =?UTF-8?Q?rors?=
Content-Language: en-US
To: SeongJae Park <sj@kernel.org>
Cc: roger.pau@citrix.com,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 SeongJae Park <sjpark@amazon.com>, Maximilian Heyne <mheyne@amazon.de>
References: <20220824203823.105991-1-sj@kernel.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220824203823.105991-1-sj@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------J5Bc0c7F02yY9NPxKjJpiScO"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------J5Bc0c7F02yY9NPxKjJpiScO
Content-Type: multipart/mixed; boundary="------------0kbNjlZ0sVh0GS3KzF0mKqNr";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: SeongJae Park <sj@kernel.org>
Cc: roger.pau@citrix.com,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 SeongJae Park <sjpark@amazon.com>, Maximilian Heyne <mheyne@amazon.de>
Message-ID: <70d931c9-2c3c-40f5-4e93-93a1aba1b76c@suse.com>
Subject: =?UTF-8?Q?Re=3a_=e2=80=9cBackend_has_not_unmapped_grant=e2=80=9d_er?=
 =?UTF-8?Q?rors?=
References: <20220824203823.105991-1-sj@kernel.org>
In-Reply-To: <20220824203823.105991-1-sj@kernel.org>

--------------0kbNjlZ0sVh0GS3KzF0mKqNr
Content-Type: multipart/mixed; boundary="------------HRmtDdowqUHadCmtO0MAn1ln"

--------------HRmtDdowqUHadCmtO0MAn1ln
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDguMjIgMjI6MzgsIFNlb25nSmFlIFBhcmsgd3JvdGU6DQo+ICsgUm9nZXINCj4g
DQo+IE9uIFdlZCwgMjQgQXVnIDIwMjIgMTc6NDQ6NDIgKzAwMDAgU2VvbmdKYWUgUGFyayA8
c2pAa2VybmVsLm9yZz4gd3JvdGU6DQo+IA0KPj4gSGVsbG8sDQo+Pg0KPj4gT24gV2VkLCAy
NCBBdWcgMjAyMiAwODowMjo0MCArMDIwMCBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+IHdyb3RlOg0KPj4NCj4+Pg0KPj4+IFstLSBBdHRhY2htZW50ICMxLjEuMTogVHlwZTog
dGV4dC9wbGFpbiwgU2l6ZTogNDMxMiBieXRlcyAtLV0NCj4+Pg0KPj4+IE9uIDI0LjA4LjIy
IDAyOjIwLCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgd3JvdGU6DQo+Pj4+IEZXSVcs
IEkgaGl0IHRoaXMgaXNzdWUgdHdpY2UgYWxyZWFkeSBpbiB0aGlzIHdlZWsgQ0kgcnVuLCB3
aGlsZSBpdCBuZXZlcg0KPj4+PiBoYXBwZW5lZCBiZWZvcmUuIFRoZSBkaWZmZXJlbmNlIGNv
bXBhcmVkIHRvIHByZXZpb3VzIHJ1biBpcyBMaW51eA0KPj4+PiA1LjE1LjU3IHZzIDUuMTUu
NjEuIFRoZSBsYXR0ZXIgcmVwb3J0cyBwZXJzaXN0ZW50IGdyYW50cyBkaXNhYmxlZC4gVGhl
DQo+Pj4+IG9ubHkgcmVsYXRlZCBjb21taXRzIEkgc2VlIHRoZXJlIGFyZSB0aHJlZSBjb21t
aXRzIGluZGVlZCByZWxhdGVkIHRvDQo+Pj4+IHBlcnNpc3RlbnQgZ3JhbnRzOg0KPj4+Pg0K
Pj4+PiAgICAgYzk4ZTk1NmVmNDg5IHhlbi1ibGtmcm9udDogQXBwbHkgJ2ZlYXR1cmVfcGVy
c2lzdGVudCcgcGFyYW1ldGVyIHdoZW4gY29ubmVjdA0KPj4+PiAgICAgZWYyNmI1ZDUzMGQ0
IHhlbi1ibGtiYWNrOiBBcHBseSAnZmVhdHVyZV9wZXJzaXN0ZW50JyBwYXJhbWV0ZXIgd2hl
biBjb25uZWN0DQo+Pj4+ICAgICA3MzA0YmU0Yzk4NWQgeGVuLWJsa2JhY2s6IGZpeCBwZXJz
aXN0ZW50IGdyYW50cyBuZWdvdGlhdGlvbg0KPj4+Pg0KPj4+PiBCdXQgbm9uZSBvZiB0aGUg
Y29tbWl0IG1lc3NhZ2VzIHN1Z2dlc3RzIGludGVudGlvbmFsIGRpc2FibGluZyBpdA0KPj4+
PiB3aXRob3V0IGV4cGxpY2l0IHJlcXVlc3QgZm9yIGRvaW5nIHNvLiBJIGRpZCBub3QgcmVx
dWVzdGVkIGRpc2FibGluZyBpdA0KPj4+PiBpbiB0b29sc3RhY2sgKGFsdGhvdWdoIEkgaGF2
ZSBzZXQgYmFja2VuZCBhcyAidHJ1c3RlZCIgLSBYU0EtNDAzKS4NCj4+Pj4gSSBoYXZlIGNv
bmZpcm1lZCBpdCdzIHRoZSBmcm9udGVuZCB2ZXJzaW9uIHRoYXQgbWF0dGVycy4gUnVubmlu
ZyBvbGRlcg0KPj4+PiBmcm9udGVuZCBrZXJuZWwgd2l0aCA1LjE1LjYxIGJhY2tlbmQgcmVz
dWx0cyBpbiBwZXJzaXN0ZW50IGdyYW50cw0KPj4+PiBlbmFibGVkIChhbmQgYm90aCBmcm9u
dGVuZCBhbmQgYmFja2VuZCB4ZW5zdG9yZSAiZmVhdHVyZS1wZXJzaXN0ZW50Ig0KPj4+PiBl
bnRyaWVzIGFyZSAiMSIgaW4gdGhpcyBjYXNlKS4NCj4+Pg0KPj4+IFRoaXMgaXMgYSBtZXNz
Lg0KPj4+DQo+Pj4gSSB0aGluayB0aGUgbWFpbiBwcm9ibGVtIHNlZW1zIHRvIGJlIHRoYXQg
dGhlIGZlYXR1cmUgbmVnb3RpYXRpb24gcHJvY2Vzcw0KPj4+IGlzbid0IHNwZWNpZmllZCBp
biBhIHNhbmUgd2F5Lg0KPj4+DQo+Pj4gICBGcm9tIHRoZSBibGtpZi5oIGhlYWRlcjoNCj4+
Pg0KPj4+IEJhY2tlbmQtc2lkZToNCj4+PiAgICAqIGZlYXR1cmUtcGVyc2lzdGVudA0KPj4+
ICAgICogICAgICBWYWx1ZXM6ICAgICAgICAgMC8xIChib29sZWFuKQ0KPj4+ICAgICogICAg
ICBEZWZhdWx0IFZhbHVlOiAgMA0KPj4+ICAgICogICAgICBOb3RlczogNw0KPj4+ICAgICoN
Cj4+PiAgICAqICAgICAgQSB2YWx1ZSBvZiAiMSIgaW5kaWNhdGVzIHRoYXQgdGhlIGJhY2tl
bmQgY2FuIGtlZXAgdGhlIGdyYW50cyB1c2VkDQo+Pj4gICAgKiAgICAgIGJ5IHRoZSBmcm9u
dGVuZCBkcml2ZXIgbWFwcGVkLCBzbyB0aGUgc2FtZSBzZXQgb2YgZ3JhbnRzIHNob3VsZCBi
ZQ0KPj4+ICAgICogICAgICB1c2VkIGluIGFsbCB0cmFuc2FjdGlvbnMuIFRoZSBtYXhpbXVt
IG51bWJlciBvZiBncmFudHMgdGhlIGJhY2tlbmQNCj4+PiAgICAqICAgICAgY2FuIG1hcCBw
ZXJzaXN0ZW50bHkgZGVwZW5kcyBvbiB0aGUgaW1wbGVtZW50YXRpb24sIGJ1dCBpZGVhbGx5
IGl0DQo+Pj4gICAgKiAgICAgIHNob3VsZCBiZSBSSU5HX1NJWkUgKiBCTEtJRl9NQVhfU0VH
TUVOVFNfUEVSX1JFUVVFU1QuIFVzaW5nIHRoaXMNCj4+PiAgICAqICAgICAgZmVhdHVyZSB0
aGUgYmFja2VuZCBkb2Vzbid0IG5lZWQgdG8gdW5tYXAgZWFjaCBncmFudCwgcHJldmVudGlu
Zw0KPj4+ICAgICogICAgICBjb3N0bHkgVExCIGZsdXNoZXMuIFRoZSBiYWNrZW5kIGRyaXZl
ciBzaG91bGQgb25seSBtYXAgZ3JhbnRzDQo+Pj4gICAgKiAgICAgIHBlcnNpc3RlbnRseSBp
ZiB0aGUgZnJvbnRlbmQgc3VwcG9ydHMgaXQuIElmIGEgYmFja2VuZCBkcml2ZXIgY2hvb3Nl
cw0KPj4+ICAgICogICAgICB0byB1c2UgdGhlIHBlcnNpc3RlbnQgcHJvdG9jb2wgd2hlbiB0
aGUgZnJvbnRlbmQgZG9lc24ndCBzdXBwb3J0IGl0LA0KPj4+ICAgICogICAgICBpdCB3aWxs
IHByb2JhYmx5IGhpdCB0aGUgbWF4aW11bSBudW1iZXIgb2YgcGVyc2lzdGVudGx5IG1hcHBl
ZCBncmFudHMNCj4+PiAgICAqICAgICAgKGR1ZSB0byB0aGUgZmFjdCB0aGF0IHRoZSBmcm9u
dGVuZCB3b24ndCBiZSByZXVzaW5nIHRoZSBzYW1lIGdyYW50cyksDQo+Pj4gICAgKiAgICAg
IGFuZCBmYWxsIGJhY2sgdG8gbm9uLXBlcnNpc3RlbnQgbW9kZS4gQmFja2VuZCBpbXBsZW1l
bnRhdGlvbnMgbWF5DQo+Pj4gICAgKiAgICAgIHNocmluayBvciBleHBhbmQgdGhlIG51bWJl
ciBvZiBwZXJzaXN0ZW50bHkgbWFwcGVkIGdyYW50cyB3aXRob3V0DQo+Pj4gICAgKiAgICAg
IG5vdGlmeWluZyB0aGUgZnJvbnRlbmQgZGVwZW5kaW5nIG9uIG1lbW9yeSBjb25zdHJhaW50
cyAodGhpcyBtaWdodA0KPj4+ICAgICogICAgICBjYXVzZSBhIHBlcmZvcm1hbmNlIGRlZ3Jh
ZGF0aW9uKS4NCj4+Pg0KPj4+IEZyb250ZW5kLXNpZGU6DQo+Pj4gICAgKiBmZWF0dXJlLXBl
cnNpc3RlbnQNCj4+PiAgICAqICAgICAgVmFsdWVzOiAgICAgICAgIDAvMSAoYm9vbGVhbikN
Cj4+PiAgICAqICAgICAgRGVmYXVsdCBWYWx1ZTogIDANCj4+PiAgICAqICAgICAgTm90ZXM6
IDcsIDgsIDkNCj4+PiAgICAqDQo+Pj4gICAgKiAgICAgIEEgdmFsdWUgb2YgIjEiIGluZGlj
YXRlcyB0aGF0IHRoZSBmcm9udGVuZCB3aWxsIHJldXNlIHRoZSBzYW1lIGdyYW50cw0KPj4+
ICAgICogICAgICBmb3IgYWxsIHRyYW5zYWN0aW9ucywgYWxsb3dpbmcgdGhlIGJhY2tlbmQg
dG8gbWFwIHRoZW0gd2l0aCB3cml0ZQ0KPj4+ICAgICogICAgICBhY2Nlc3MgKGV2ZW4gd2hl
biBpdCBzaG91bGQgYmUgcmVhZC1vbmx5KS4gSWYgdGhlIGZyb250ZW5kIGhpdHMgdGhlDQo+
Pj4gICAgKiAgICAgIG1heGltdW0gbnVtYmVyIG9mIGFsbG93ZWQgcGVyc2lzdGVudGx5IG1h
cHBlZCBncmFudHMsIGl0IGNhbiBmYWxsYmFjaw0KPj4+ICAgICogICAgICB0byBub24gcGVy
c2lzdGVudCBtb2RlLiBUaGlzIHdpbGwgY2F1c2UgYSBwZXJmb3JtYW5jZSBkZWdyYWRhdGlv
biwNCj4+PiAgICAqICAgICAgc2luY2UgdGhlIHRoZSBiYWNrZW5kIGRyaXZlciB3aWxsIHN0
aWxsIHRyeSB0byBtYXAgdGhvc2UgZ3JhbnRzDQo+Pj4gICAgKiAgICAgIHBlcnNpc3RlbnRs
eS4gU2luY2UgdGhlIHBlcnNpc3RlbnQgZ3JhbnRzIHByb3RvY29sIGlzIGNvbXBhdGlibGUg
d2l0aA0KPj4+ICAgICogICAgICB0aGUgcHJldmlvdXMgcHJvdG9jb2wsIGEgZnJvbnRlbmQg
ZHJpdmVyIGNhbiBjaG9vc2UgdG8gd29yayBpbg0KPj4+ICAgICogICAgICBwZXJzaXN0ZW50
IG1vZGUgZXZlbiB3aGVuIHRoZSBiYWNrZW5kIGRvZXNuJ3Qgc3VwcG9ydCBpdC4NCj4+Pg0K
Pj4+IFRob3NlIGRlZmluaXRpb25zIGRvbid0IG1ha2UgY2xlYXIsIHdoaWNoIHNpZGUgaXMg
dGhlIG9uZSB0byBkZWNpZGUgd2hldGhlcg0KPj4+IHRoZSBmZWF0dXJlIHNob3VsZCBiZSB1
c2VkIG9yIG5vdC4gSW4gbXkgdW5kZXJzdGFuZGluZyB0aGUgcmVsYXRlZCBkcml2ZXJzDQo+
Pj4gc2hvdWxkIGp1c3QgYWR2ZXJ0aXNlIHRoZWlyIHNldHRpbmcgKHRoZSBfYWJpbGl0eV8g
dG8gdXNlIHRoZSBmZWF0dXJlKSwgYW5kDQo+Pj4gaXQgc2hvdWxkIGJlIHVzZWQgb25seSBp
ZiBib3RoIHNpZGVzIGhhdmUgd3JpdHRlbiBhICIxIi4NCj4+Pg0KPj4+IFdpdGggYWJvdmUg
cGF0Y2hlcyBhcHBsaWVkLCB0aGUgZnJvbnRlbmQgd2lsbCBzZXQgJ2ZlYXR1cmUtcGVyc2lz
dGVudCcgaW4NCj4+PiBYZW5zdG9yZSBvbmx5LCBpZiB0aGUgYmFja2VuZCBoYXMgZG9uZSBz
bywgYnV0IHRoZSBiYWNrZW5kIHdpbGwgc2V0IGl0DQo+Pj4gb25seSwgaWYgdGhlIGZyb250
ZW5kIGhhcyBkb25lIGl0LiBUaGlzIHJlc3VsdHMgaW4gcGVyc2lzdGVudCBncmFudHMNCj4+
PiBhbHdheXMgYmVpbmcgZGlzYWJsZWQuDQo+Pg0KPj4gU29ycnkgZm9yIG1ha2luZyB0aGUg
bWVzcywgYW5kIHRoYW5rIHlvdSBmb3IgdGhlIGtpbmQgcmVwb3J0IGFuZCBkZXRhaWxlZA0K
Pj4gZXhwbGFuYXRpb24gb2YgdGhlIHByb2JsZW0uDQo+Pg0KPj4+DQo+Pj4gVGhpcyBpcyB3
cm9uZywgYXMgdGhlIHZhbHVlIHdyaXR0ZW4gc2hvdWxkIG5vdCByZWZsZWN0IHRoZSBjdXJy
ZW50IHN0YXRlDQo+Pj4gb2YgdGhlIGludGVyZmFjZS4gVGhhdCBzdGF0ZSBzaG91bGQgYmUg
c2V0IGFjY29yZGluZyB0byBib3RoIHNpZGVzJyB2YWx1ZSwNCj4+PiBwcm9iYWJseSBhIGNh
Y2hlZCBvbmUgb24gdGhlIGJsa2JhY2sgc2lkZSAodXNpbmcgYSBuZXcgZmxhZyBmb3IgY2Fj
aGluZyBpdCwNCj4+PiBub3QgdGhlIGN1cnJlbnQgc3RhdGUpLg0KPj4NCj4+IEFncmVlZC4g
IFNvLCBJIHRoaW5rIHRoZSBpc3N1ZSBjb21lcyBmcm9tIHRoZSBmYWN0IHRoYXQgd2UgYXJl
IHVzaW5nIG9uZSBmaWVsZCwNCj4+IHdoaWNoIHdhcyBhIHBsYWNlIGZvciBzYXZpbmcgb25s
eSB0aGUgbmVnb3RpYXRpb24gcmVzdWx0LCBmb3IgeWV0IGFub3RoZXINCj4+IHB1cnBvc2U6
IGNhY2hpbmcgb2YgdGhlIHBhcmFtZXRlciB2YWx1ZS4gIEFzIGEgcmVzdWx0LCB0aGUgYWR2
ZXJ0aXNlbWVudCwgd2hpY2gNCj4+IHNob3VsZCBmb2xsb3cgb25seSB0aGUgcGFyYW1ldGVy
IHZhbHVlLCBiZWNvbWVzIGluY29uc2lzdGVudC4NCj4+DQo+PiBIb3cgYWJvdXQgc2ltcGx5
IGFkZGluZyBhbm90aGVyIGZpZWxkIGZvciB0aGUgY2FjaGluZyBwdXJwb3NlLCBzbyB0aGF0
IHRoZQ0KPj4gYWR2ZXJ0aXNhdGlvbiBjb3VsZCBiZSBkb25lIHJlZ2FyZGxlc3Mgb2YgdGhl
IG5lZ290aWF0aW9uPyAgRm9yIGV4YW1wbGU6DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvYmxvY2sveGVuLWJsa2JhY2svY29tbW9uLmggYi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGti
YWNrL2NvbW1vbi5oDQo+PiBpbmRleCBiZGE1YzgxNWU0NDEuLmEyODQ3MzQ3MGU2NiAxMDA2
NDQNCj4+IC0tLSBhL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2svY29tbW9uLmgNCj4+ICsr
KyBiL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2svY29tbW9uLmgNCj4+IEBAIC0yMjYsNiAr
MjI2LDkgQEAgc3RydWN0IHhlbl92YmQgew0KPj4gICAJc2VjdG9yX3QJCXNpemU7DQo+PiAg
IAl1bnNpZ25lZCBpbnQJCWZsdXNoX3N1cHBvcnQ6MTsNCj4+ICAgCXVuc2lnbmVkIGludAkJ
ZGlzY2FyZF9zZWN1cmU6MTsNCj4+ICsJLyogQ29ubmVjdC10aW1lIGNhY2hlZCBmZWF0dXJl
X3BlcnNpc3RlbnQgcGFyYW1ldGVyIHZhbHVlICovDQo+PiArCXVuc2lnbmVkIGludAkJZmVh
dHVyZV9nbnRfcGVyc2lzdGVudF9wYXJtOjE7DQo+PiArCS8qIFBlcnNpc3RlbnQgZ3JhbnRz
IGZlYXR1cmUgbmVnb3RpYXRpb24gcmVzdWx0ICovDQo+PiAgIAl1bnNpZ25lZCBpbnQJCWZl
YXR1cmVfZ250X3BlcnNpc3RlbnQ6MTsNCj4+ICAgCXVuc2lnbmVkIGludAkJb3ZlcmZsb3df
bWF4X2dyYW50czoxOw0KPj4gICB9Ow0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2sv
eGVuLWJsa2JhY2sveGVuYnVzLmMgYi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hlbmJ1
cy5jDQo+PiBpbmRleCBlZTdhZDJmYjQzMmQuLmMwMjI3ZGZhNDY4OCAxMDA2NDQNCj4+IC0t
LSBhL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sveGVuYnVzLmMNCj4+ICsrKyBiL2RyaXZl
cnMvYmxvY2sveGVuLWJsa2JhY2sveGVuYnVzLmMNCj4+IEBAIC05MDcsNyArOTA3LDcgQEAg
c3RhdGljIHZvaWQgY29ubmVjdChzdHJ1Y3QgYmFja2VuZF9pbmZvICpiZSkNCj4+ICAgCXhl
bl9ibGtia19iYXJyaWVyKHhidCwgYmUsIGJlLT5ibGtpZi0+dmJkLmZsdXNoX3N1cHBvcnQp
Ow0KPj4gICANCj4+ICAgCWVyciA9IHhlbmJ1c19wcmludGYoeGJ0LCBkZXYtPm5vZGVuYW1l
LCAiZmVhdHVyZS1wZXJzaXN0ZW50IiwgIiV1IiwNCj4+IC0JCQliZS0+YmxraWYtPnZiZC5m
ZWF0dXJlX2dudF9wZXJzaXN0ZW50KTsNCj4+ICsJCQliZS0+YmxraWYtPnZiZC5mZWF0dXJl
X2dudF9wZXJzaXN0ZW50X3Bhcm0pOw0KPj4gICAJaWYgKGVycikgew0KPj4gICAJCXhlbmJ1
c19kZXZfZmF0YWwoZGV2LCBlcnIsICJ3cml0aW5nICVzL2ZlYXR1cmUtcGVyc2lzdGVudCIs
DQo+PiAgIAkJCQkgZGV2LT5ub2RlbmFtZSk7DQo+PiBAQCAtMTA4NSw3ICsxMDg1LDkgQEAg
c3RhdGljIGludCBjb25uZWN0X3Jpbmcoc3RydWN0IGJhY2tlbmRfaW5mbyAqYmUpDQo+PiAg
IAkJcmV0dXJuIC1FTk9TWVM7DQo+PiAgIAl9DQo+PiAgIA0KPj4gLQlibGtpZi0+dmJkLmZl
YXR1cmVfZ250X3BlcnNpc3RlbnQgPSBmZWF0dXJlX3BlcnNpc3RlbnQgJiYNCj4+ICsJYmxr
aWYtPnZiZC5mZWF0dXJlX2dudF9wZXJzaXN0ZW50X3Bhcm0gPSBmZWF0dXJlX3BlcnNpc3Rl
bnQ7DQo+PiArCWJsa2lmLT52YmQuZmVhdHVyZV9nbnRfcGVyc2lzdGVudCA9DQo+PiArCQli
bGtpZi0+dmJkLmZlYXR1cmVfZ250X3BlcnNpc3RlbnRfcGFybSAmJg0KPj4gICAJCXhlbmJ1
c19yZWFkX3Vuc2lnbmVkKGRldi0+b3RoZXJlbmQsICJmZWF0dXJlLXBlcnNpc3RlbnQiLCAw
KTsNCj4+ICAgDQo+PiAgIAlibGtpZi0+dmJkLm92ZXJmbG93X21heF9ncmFudHMgPSAwOw0K
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2sveGVuLWJsa2Zyb250LmMgYi9kcml2ZXJz
L2Jsb2NrL3hlbi1ibGtmcm9udC5jDQo+PiBpbmRleCA4ZTU2ZTY5ZmI0YzQuLmRmYWUwODEx
NTQ1MCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvYmxvY2sveGVuLWJsa2Zyb250LmMNCj4+
ICsrKyBiL2RyaXZlcnMvYmxvY2sveGVuLWJsa2Zyb250LmMNCj4+IEBAIC0yMTMsNiArMjEz
LDkgQEAgc3RydWN0IGJsa2Zyb250X2luZm8NCj4+ICAgCXVuc2lnbmVkIGludCBmZWF0dXJl
X2Z1YToxOw0KPj4gICAJdW5zaWduZWQgaW50IGZlYXR1cmVfZGlzY2FyZDoxOw0KPj4gICAJ
dW5zaWduZWQgaW50IGZlYXR1cmVfc2VjZGlzY2FyZDoxOw0KPj4gKwkvKiBDb25uZWN0LXRp
bWUgY2FjaGVkIGZlYXR1cmVfcGVyc2lzdGVudCBwYXJhbWV0ZXIgKi8NCj4+ICsJdW5zaWdu
ZWQgaW50IGZlYXR1cmVfcGVyc2lzdGVudF9wYXJtOjE7DQo+PiArCS8qIFBlcnNpc3RlbnQg
Z3JhbnRzIGZlYXR1cmUgbmVnb3RpYXRpb24gcmVzdWx0ICovDQo+PiAgIAl1bnNpZ25lZCBp
bnQgZmVhdHVyZV9wZXJzaXN0ZW50OjE7DQo+PiAgIAl1bnNpZ25lZCBpbnQgYm91bmNlOjE7
DQo+PiAgIAl1bnNpZ25lZCBpbnQgZGlzY2FyZF9ncmFudWxhcml0eTsNCj4+IEBAIC0xODQ4
LDcgKzE4NTEsNyBAQCBzdGF0aWMgaW50IHRhbGtfdG9fYmxrYmFjayhzdHJ1Y3QgeGVuYnVz
X2RldmljZSAqZGV2LA0KPj4gICAJCWdvdG8gYWJvcnRfdHJhbnNhY3Rpb247DQo+PiAgIAl9
DQo+PiAgIAllcnIgPSB4ZW5idXNfcHJpbnRmKHhidCwgZGV2LT5ub2RlbmFtZSwgImZlYXR1
cmUtcGVyc2lzdGVudCIsICIldSIsDQo+PiAtCQkJaW5mby0+ZmVhdHVyZV9wZXJzaXN0ZW50
KTsNCj4+ICsJCQlpbmZvLT5mZWF0dXJlX3BlcnNpc3RlbnRfcGFybSk7DQo+PiAgIAlpZiAo
ZXJyKQ0KPj4gICAJCWRldl93YXJuKCZkZXYtPmRldiwNCj4+ICAgCQkJICJ3cml0aW5nIHBl
cnNpc3RlbnQgZ3JhbnRzIGZlYXR1cmUgdG8geGVuYnVzIik7DQo+PiBAQCAtMjI4MSw3ICsy
Mjg0LDggQEAgc3RhdGljIHZvaWQgYmxrZnJvbnRfZ2F0aGVyX2JhY2tlbmRfZmVhdHVyZXMo
c3RydWN0IGJsa2Zyb250X2luZm8gKmluZm8pDQo+PiAgIAlpZiAoeGVuYnVzX3JlYWRfdW5z
aWduZWQoaW5mby0+eGJkZXYtPm90aGVyZW5kLCAiZmVhdHVyZS1kaXNjYXJkIiwgMCkpDQo+
PiAgIAkJYmxrZnJvbnRfc2V0dXBfZGlzY2FyZChpbmZvKTsNCj4+ICAgDQo+PiAtCWlmIChm
ZWF0dXJlX3BlcnNpc3RlbnQpDQo+PiArCWluZm8tPmZlYXR1cmVfcGVyc2lzdGVudF9wYXJt
ID0gZmVhdHVyZV9wZXJzaXN0ZW50Ow0KPj4gKwlpZiAoaW5mby0+ZmVhdHVyZV9wZXJzaXN0
ZW50X3Bhcm0pDQo+PiAgIAkJaW5mby0+ZmVhdHVyZV9wZXJzaXN0ZW50ID0NCj4+ICAgCQkJ
ISF4ZW5idXNfcmVhZF91bnNpZ25lZChpbmZvLT54YmRldi0+b3RoZXJlbmQsDQo+PiAgIAkJ
CQkJICAgICAgICJmZWF0dXJlLXBlcnNpc3RlbnQiLCAwKTsNCj4+DQoNClllcywgdGhpcyBp
cyBtdWNoIGJldHRlciBJTU8uDQoNCkNvdWxkIHlvdSBwbGVhc2Ugc2VuZCBpdCBhcyB0d28g
cHJvcGVyIHBhdGNoZXMgKG9uZSBmb3IgZWFjaCBkcml2ZXIpIHdpdGgNCnRoZSBjb3JyZWN0
ICJGaXhlczoiIHRhZ3M/DQoNCg0KSnVlcmdlbg0K
--------------HRmtDdowqUHadCmtO0MAn1ln
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------HRmtDdowqUHadCmtO0MAn1ln--

--------------0kbNjlZ0sVh0GS3KzF0mKqNr--

--------------J5Bc0c7F02yY9NPxKjJpiScO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMHFLEFAwAAAAAACgkQsN6d1ii/Ey9i
BQf/Wxo6/Z18Vx3vtzev8H2mRo3ylDvTZmVeWOqrnd7MlPd7TsNEefa+9b05JWs3u+HEWbvBWPG8
WKaH8NbZjwxuhGk/0wBXsygVKZadsZvfthn4jV33eMLml8XQJjIFYU0VJMpHNGIAio7AnUpcwCBg
3JmoBgN7rRj5854KoZXYXPorFvYD7FKWk90vx1b7WDfu12kiDkDQu19+tnxF1x+9xQGU0UUonXrk
7ydyGo7QySSl+5phUoGF7QEmmMh9C/ilWYw44HqFBO3G0YSglzffmMRmVFe3rtuJHaGOn6FXEg6b
uGatJomICe7q6dkTv+nrbAKO0BglKEk7W2j+pWX+3w==
=DxaA
-----END PGP SIGNATURE-----

--------------J5Bc0c7F02yY9NPxKjJpiScO--

