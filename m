Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 633135EF5B4
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 14:49:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413738.657580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odsy2-0004f8-0C; Thu, 29 Sep 2022 12:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413738.657580; Thu, 29 Sep 2022 12:48:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odsy1-0004bt-Ru; Thu, 29 Sep 2022 12:48:41 +0000
Received: by outflank-mailman (input) for mailman id 413738;
 Thu, 29 Sep 2022 12:48:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VH9u=2A=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1odsy0-0004bn-2r
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 12:48:40 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 096c0ca3-3ff5-11ed-964a-05401a9f4f97;
 Thu, 29 Sep 2022 14:48:38 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 661871F8AC;
 Thu, 29 Sep 2022 12:48:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2F05813A71;
 Thu, 29 Sep 2022 12:48:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id TsohCiWUNWM3FAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 29 Sep 2022 12:48:37 +0000
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
X-Inumbo-ID: 096c0ca3-3ff5-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1664455717; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uLsehPzgf1NzdIM2zihWeDPeH/qncTm8rTQfUdL7g/c=;
	b=QDm+BY05RwpDHLrxSfCX+Ks9KJsvmqYEa3yTzftovNHaUs12L1KKvwL4HUVwiZiJcHxzap
	hlG8jis6LBBOz1BcztvXMADZ21Zs9dx2DKU3dsxl5c+HaGKsEbp7Z2YudjXmZioi8aH6Yk
	d/71e/5k7hx7TafktwZgoFBrirYeS/s=
Message-ID: <f26d344a-31a5-4231-e006-595dca006d02@suse.com>
Date: Thu, 29 Sep 2022 14:48:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Design session "MSI-X support with Linux stubdomain" notes
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 George Dunlap <george.dunlap@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <YyyHvp34Wg1kSqFu@perard.uk.xensource.com>
 <f24b9e06-f9ed-aa0f-0d69-abb8f0d7560f@suse.com> <YzGeY8L6Op7n8pip@mail-itl>
 <ca19380a-6ccd-453d-4693-ea666152f45f@suse.com> <YzV5/0SYbJVQ91YV@mail-itl>
 <e329a56e-0a54-dffa-8e55-0cdf030dbce5@suse.com>
 <YzWG7pfXOt5O6AJS@MacBook-Air-de-Roger.local>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <YzWG7pfXOt5O6AJS@MacBook-Air-de-Roger.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------J4iYMt0drmJiDu0OWpGbxuLc"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------J4iYMt0drmJiDu0OWpGbxuLc
Content-Type: multipart/mixed; boundary="------------HGqH6ml0z1AtNDwQzi3t07wY";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 George Dunlap <george.dunlap@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <f26d344a-31a5-4231-e006-595dca006d02@suse.com>
Subject: Re: Design session "MSI-X support with Linux stubdomain" notes
References: <YyyHvp34Wg1kSqFu@perard.uk.xensource.com>
 <f24b9e06-f9ed-aa0f-0d69-abb8f0d7560f@suse.com> <YzGeY8L6Op7n8pip@mail-itl>
 <ca19380a-6ccd-453d-4693-ea666152f45f@suse.com> <YzV5/0SYbJVQ91YV@mail-itl>
 <e329a56e-0a54-dffa-8e55-0cdf030dbce5@suse.com>
 <YzWG7pfXOt5O6AJS@MacBook-Air-de-Roger.local>
In-Reply-To: <YzWG7pfXOt5O6AJS@MacBook-Air-de-Roger.local>

--------------HGqH6ml0z1AtNDwQzi3t07wY
Content-Type: multipart/mixed; boundary="------------ccSbqRsr12ee6YczIQzsk0Dd"

--------------ccSbqRsr12ee6YczIQzsk0Dd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjkuMDkuMjIgMTM6NTIsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIFRodSwg
U2VwIDI5LCAyMDIyIGF0IDAxOjQ0OjI4UE0gKzAyMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0K
Pj4gT24gMjkuMDkuMjAyMiAxMjo1NywgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdy
b3RlOg0KPj4+IE9uIE1vbiwgU2VwIDI2LCAyMDIyIGF0IDAyOjQ3OjU1UE0gKzAyMDAsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+PiBPbiAyNi4wOS4yMDIyIDE0OjQzLCBNYXJlayBNYXJj
enlrb3dza2ktR8OzcmVja2kgd3JvdGU6DQo+Pj4+PiBPbiBUaHUsIFNlcCAyMiwgMjAyMiBh
dCAwODowMDowMFBNICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+PiBPbiAyMi4w
OS4yMDIyIDE4OjA1LCBBbnRob255IFBFUkFSRCB3cm90ZToNCj4+Pj4+Pj4gV0FSTklORzog
Tm90ZXMgbWlzc2luZyBhdCB0aGUgYmVnaW5uaW5nIG9mIHRoZSBtZWV0aW5nLg0KPj4+Pj4+
Pg0KPj4+Pj4+PiBzZXNzaW9uIGRlc2NyaXB0aW9uOg0KPj4+Pj4+Pj4gQ3VycmVudGx5IGEg
SFZNIHdpdGggUENJIHBhc3N0aHJvdWdoIGFuZCBRZW11IExpbnV4IHN0dWJkb21haW4gZG9l
c27igJl0DQo+Pj4+Pj4+PiBzdXBwb3J0IE1TSS1YLiBGb3IgdGhlIGRldmljZSB0byAocGFy
dGlhbGx5KSB3b3JrLCBRZW11IG5lZWRzIGEgcGF0Y2ggbWFza2luZw0KPj4+Pj4+Pj4gTVNJ
LVggZnJvbSB0aGUgUENJIGNvbmZpZyBzcGFjZS4gU29tZSBkcml2ZXJzIGFyZSBub3QgaGFw
cHkgYWJvdXQgdGhhdCwgd2hpY2gNCj4+Pj4+Pj4+IGlzIHVuZGVyc3RhbmRhYmxlIChkZXZp
Y2UgbmF0aXZlbHkgc3VwcG9ydHMgTVNJLVgsIHNvIGZhbGxiYWNrIHBhdGggYXJlDQo+Pj4+
Pj4+PiByYXJlbHkgdGVzdGVkKS4NCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBUaGlzIGlzIG1vc3Rs
eSAoPykgYWJvdXQgcWVtdSBhY2Nlc3NpbmcgL2Rldi9tZW0gZGlyZWN0bHkgKGhlcmU6DQo+
Pj4+Pj4+PiBodHRwczovL2dpdGh1Yi5jb20vcWVtdS9xZW11L2Jsb2IvbWFzdGVyL2h3L3hl
bi94ZW5fcHRfbXNpLmMjTDU3OSkgLSBsZXRzDQo+Pj4+Pj4+PiBkaXNjdXNzIGFsdGVybmF0
aXZlIGludGVyZmFjZSB0aGF0IHN0dWJkb21haW4gY291bGQgdXNlLg0KPj4+Pj4+Pg0KPj4+
Pj4+Pg0KPj4+Pj4+Pg0KPj4+Pj4+PiB3aGVuIHFlbXUgZm9yd2FyZCBpbnRlcnJ1cHQsDQo+
Pj4+Pj4+ICAgICAgZm9yIGNvcnJlY3QgbWFzayBiaXQsIGl0IHJlYWQgcGh5c2ljYWwgbWFz
ayBiaXQuDQo+Pj4+Pj4+ICAgICAgYW4gaHlwZXJjYWxsIHdvdWxkIG1ha2Ugc2Vuc2UuDQo+
Pj4+Pj4+ICAgICAgLT4gYmVuZWZpdCwgbWFzayBiaXQgaW4gaGFyZHdhcmUgd2lsbCBiZSB3
aGF0IGh5cGVydmlzb3IgZGVzaXJlLCBhbmQgZGV2aWNlIG1vZGVsIGRlc2lyZS4NCj4+Pj4+
Pj4gICAgICBmcm9tIGd1ZXN0IHBvaW50IG9mIHZpZXcsIGludGVycnVwdCBzaG91bGQgYmUg
dW5tYXNrLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBpbnRlcnJ1cHQgcmVxdWVzdCBhcmUgZmlyc3Qg
Zm9yd2FyZGVkIHRvIHFlbXUsIHNvIHhlbiBoYXZlIHRvIGRvIHNvbWUgcG9zdCBwcm9jZXNz
aW5nIG9uY2UgcmVxdWVzdCBjb21lcyBiYWNrIGZyb20gcWVtdS4NCj4+Pj4+Pj4gICAgICBp
dCdzIHdlaXJkLi4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gc29tZW9uZSBzaG91bGQgaGF2ZSBhIGxv
b2ssIGFuZCByYXRpb25hbGl6ZSB0aGlzIHdlaXJkIHBhdGguDQo+Pj4+Pj4+DQo+Pj4+Pj4+
IFhlbiB0cmllcyB0byBub3QgZm9yd2FyZCBldmVyeXRoaW5nIHRvIHFlbXUuDQo+Pj4+Pj4+
DQo+Pj4+Pj4+IHdoeSBkb24ndCB3ZSBkbyB0aGF0IGluIHhlbi4NCj4+Pj4+Pj4gICAgICB0
aGVyZSdzIGFscmVhZHkgY29kZSBpbiB4ZW4gZm9yIHRoYXQuDQo+Pj4+Pj4NCj4+Pj4+PiBT
byB3aGF0IEkgZGlkbid0IHBheSBlbm91Z2ggYXR0ZW50aW9uIHRvIHdoZW4gdGFsa2luZyB3
YXMgdGhhdCB0aGUNCj4+Pj4+PiBjb21wbGV0aW9uIGxvZ2ljIGluIFhlbiBpcyBmb3Igd3Jp
dGVzIG9ubHkuIE1heWJlIHNvbWV0aGluZyBzaW1pbGFyDQo+Pj4+Pj4gY2FuIGJlIGhhZCBm
b3IgcmVhZHMgYXMgd2VsbCwgYnV0IHRoYXQncyB0byBiZSBjaGVja2VkIC4uLg0KPj4+Pj4N
Cj4+Pj4+IEkgc3BlbnQgc29tZSB0aW1lIHRyeWluZyB0byBmb2xsb3cgdGhhdCBwYXJ0IG9m
IHFlbXUsIGFuZCBJIHRoaW5rIGl0DQo+Pj4+PiByZWFkcyB2ZWN0b3IgY29udHJvbCBvbmx5
IG9uIHRoZSB3cml0ZSBwYXRoLCB0byBrZWVwIHNvbWUgYml0cw0KPj4+Pj4gdW5jaGFuZ2Vk
LCBhbmQgYWxzbyBkZXRlY3Qgd2hldGhlciBYZW4gbWFza2VkIGl0IGJlaGluZCBxZW11J3Mg
YmFjay4NCj4+Pj4+IE15IHVuZGVyc3RhbmRpbmcgaXMsIHNpbmNlIDQ4NGQ3Yzg1MmUgIng4
Ni9NU0ktWDogdHJhY2sgaG9zdCBhbmQgZ3Vlc3QNCj4+Pj4+IG1hc2stYWxsIHJlcXVlc3Rz
IHNlcGFyYXRlbHkiIGl0IGlzIHVubmVjZXNzYXJ5LCBiZWNhdXNlIFhlbiB3aWxsDQo+Pj4+
PiByZW1lbWJlciBndWVzdCdzIGludGVudGlvbiwgc28gcWVtdSBjYW4gc2ltcGx5IHVzZSBp
dHMgb3duIGludGVybmFsDQo+Pj4+PiBzdGF0ZSBhbmQgYWN0IG9uIHRoYXQgKGd1ZXN0IHdy
aXRlcyB3aWxsIGdvIHRocm91Z2ggcWVtdSwgc28gaXQgc2hvdWxkDQo+Pj4+PiBoYXZlIHVw
IHRvIGRhdGUgdmlldyBmcm9tIGd1ZXN0J3MgcG9pbnQgb2YgdmlldykuDQo+Pj4+Pg0KPj4+
Pj4gQXMgZm9yIFBCQSBhY2Nlc3MsIGl0IGlzIHJlYWQgYnkgcWVtdSBvbmx5IHRvIHBhc3Mg
aXQgdG8gdGhlIGd1ZXN0LiBJJ20NCj4+Pj4+IG5vdCBzdXJlIHdoZXRoZXIgcWVtdSBzaG91
bGQgdXNlIGh5cGVyY2FsbCB0byByZXRyaWV2ZSBpdCwgb3IgbWF5YmUNCj4+Pj4+IFhlbiBz
aG91bGQgZml4dXAgdmFsdWUgaXRzZWxmIG9uIHRoZSByZWFkIHBhdGguDQo+Pj4+DQo+Pj4+
IEZvcndhcmRpbmcgdGhlIGFjY2VzcyB0byBxZW11IGp1c3QgZm9yIHFlbXUgdG8gdXNlIGEg
aHlwZXJjYWxsIHRvIG9idGFpbg0KPj4+PiB0aGUgdmFsdWUgbmVlZGVkIHNlZW1zIGJhY2t3
YXJkcyB0byBtZS4gSWYgd2UgbmVlZCBuZXcgY29kZSBpbiBYZW4sIHdlDQo+Pj4+IGNhbiBh
cyB3ZWxsIGhhbmRsZSB0aGUgcmVhZCBkaXJlY3RseSBJIHRoaW5rLCB3aXRob3V0IGludm9s
dmluZyBxZW11Lg0KPj4+DQo+Pj4gSSdtIG5vdCBzdXJlIGlmIEkgZnVsbHkgZm9sbG93IHdo
YXQgcWVtdSBkb2VzIGhlcmUsIGJ1dCBJIHRoaW5rIHRoZQ0KPj4+IHJlYXNvbiBmb3Igc3Vj
aCBoYW5kbGluZyBpcyB0aGF0IFBCQSBjYW4gKGFuZCBvZnRlbiBkbykgbGl2ZSBvbiB0aGUg
c2FtZQ0KPj4+IHBhZ2UgYXMgdGhlIGFjdHVhbCBNU0ktWCB0YWJsZS4gSSdtIHRyeWluZyB0
byBhZGp1c3QgcWVtdSB0byBub3QNCj4+PiBpbnRlcmNlcHQgdGhpcyByZWFkLCBidXQgYXQg
dGhpcyBwb2ludCBJJ20gbm90IHlldCBzdXJlIG9mIHRoYXQncyBldmVuDQo+Pj4gcG9zc2li
bGUgb24gc3ViLXBhZ2UgZ3JhbnVsYXJpdHkuDQo+Pj4NCj4+PiBCdXQsIHRvIGdvIGZvcndh
cmQgd2l0aCBQb0MvZGVidWdnaW5nLCBJIGhhcmR3aXJlZCBQQkEgcmVhZCB0bw0KPj4+IDB4
RkZGRkZGRkYsIGFuZCBpdCBzZWVtcyBpdCBkb2Vzbid0IHdvcmsuIE15IG9ic2VydmF0aW9u
IGlzIHRoYXQgdGhlDQo+Pj4gaGFuZGxlciBpbiB0aGUgTGludXggZHJpdmVyIGlzbid0IGNh
bGxlZC4gVGhlcmUgYXJlIHNldmVyYWwgbW92aW5nDQo+Pj4gcGFydCAoaXQgY291bGQgdmVy
eSB3ZWxsIGJlIGJ1ZyBpbiB0aGUgZHJpdmVyLCBvciBzb21lIG90aGVyIHBhcnQgaW4gdGhl
DQo+Pj4gVk0pLiBJcyB0aGVyZSBzb21lIHBsYWNlIGluIFhlbiBJIGNhbiBzZWUgaWYgYW4g
aW50ZXJydXB0IGdldHMgZGVsaXZlcmVkDQo+Pj4gdG8gdGhlIGd1ZXN0IChzb21lIGZ1bmN0
aW9uIEkgY2FuIGFkZCBkZWJ1ZyBwcmludCB0byksIG9yIGlzIGl0DQo+Pj4gZGVsaXZlcmVk
IGRpcmVjdGx5IHRvIHRoZSBndWVzdD8NCj4+DQo+PiBJIGd1ZXNzICJpb21tdT1uby1pbnRw
b3N0IiB3b3VsZCBzdXBwcmVzcyAiZGlyZWN0IiBkZWxpdmVyeSAoaWYgaGFyZHdhcmUNCj4+
IGlzIGNhcGFibGUgb2YgdGhhdCBpbiB0aGUgZmlyc3QgcGxhY2UpLiBBbmQgd2FpdCAtIHRo
aXMgb3B0aW9uIGFjdHVhbGx5DQo+PiBkZWZhdWx0IHRvIG9mZi4NCj4+DQo+PiBBcyB0byBz
b2Z0d2FyZSBkZWxpdmVyeSAtIEkgZ3Vlc3MgeW91IHdvdWxkIHdhbnQgdG8gc3RhcnQgZnJv
bQ0KPj4gZG9fSVJRX2d1ZXN0KCkgYW5kIHRoZW4gc2VlIHdoZXJlIHRoaW5ncyBnZXQgbG9z
dC4gKEFkZGluZyBsb2dnaW5nIHRvDQo+PiBzdWNoIGEgcGF0aCBvZiBjb3Vyc2UgaGFzIGEg
ZmFpciByaXNrIG9mIGVuZGluZyB1cCBvdmVybHkgY2hhdHR5LikNCj4gDQo+IEhhdmluZyBk
ZWFsdCB3aXRoIGludGVycnVwdCBpc3N1ZXMgYmVmb3JlLCB0cnkgdG8gbGltaXQgbG9nZ2lu
ZyB0byB0aGUNCj4gSVJRIHlvdSBhcmUgaW50ZXJlc3RlZCBvbiBvbmx5IC0gdXNpbmcgeGVu
dHJhY2UgbWlnaHQgYmUgYSBiZXR0ZXINCj4gb3B0aW9uIGRlcGVuZGluZyBvbiB3aGF0IHlv
dSBuZWVkIHRvIGRlYnVnLCBhbGJlaXQgaXQncyBraW5kIG9mIGEgcGFpbg0KPiB0byBhZGQg
bmV3IHRyYWNlIHBvaW50cyBhcyB5b3UgYWxzbyBuZWVkIHRvIG1vZGlmeSB4ZW5hbHl6ZSB0
byBwcmludA0KPiB0aGVtLg0KDQpEaWQgeW91IGNvbnNpZGVyIHVzaW5nIGRlYnVndHJhY2Vf
cHJpbnRrKCk/DQoNCg0KSnVlcmdlbg0K
--------------ccSbqRsr12ee6YczIQzsk0Dd
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------ccSbqRsr12ee6YczIQzsk0Dd--

--------------HGqH6ml0z1AtNDwQzi3t07wY--

--------------J4iYMt0drmJiDu0OWpGbxuLc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmM1lCQFAwAAAAAACgkQsN6d1ii/Ey+U
SQgAj/oxIabwSm6gy83Df/opPv/IeoGq/qBIvsU2mog92/6ns840S6nig/2rEYQ1FX0IU0wp+4S6
sS3CPu6RY3aDZGGRd2zMWjyFv8Dpa4duczMOTfegmQ7YRBpC2ewxOSihyVkFfzyQ5twm4ha7zB3e
vt1ppDlBaj8XEZE9mgjadfByaqVTEvMDqgAbmGWmcIpDZaFlMFxU/aBBKdf5SWRMXM4A3B712swm
1Ai1St6tNgk6AxGAI1Fs2KnOnj3ZJifK49qFVI+1354bQ9JJyxNA5xZVl39HH2eyC25Bv31iVsRO
x+pSy6LSHYW7l04dRs0arYUPW4uipEqnrSJ01MpSGA==
=dEpo
-----END PGP SIGNATURE-----

--------------J4iYMt0drmJiDu0OWpGbxuLc--

