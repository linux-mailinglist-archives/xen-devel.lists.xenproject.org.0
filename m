Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 595A363EE53
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 11:45:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450465.707734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0h3u-0007L6-NK; Thu, 01 Dec 2022 10:45:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450465.707734; Thu, 01 Dec 2022 10:45:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0h3u-0007He-Jn; Thu, 01 Dec 2022 10:45:02 +0000
Received: by outflank-mailman (input) for mailman id 450465;
 Thu, 01 Dec 2022 10:45:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zfJQ=37=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p0h3t-0007HY-Lo
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 10:45:01 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53e0ea10-7164-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 11:38:43 +0100 (CET)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9AF9021B27;
 Thu,  1 Dec 2022 10:44:59 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 471C913503;
 Thu,  1 Dec 2022 10:44:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id oSUDEKuFiGNiNwAAGKfGzw
 (envelope-from <jgross@suse.com>); Thu, 01 Dec 2022 10:44:59 +0000
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
X-Inumbo-ID: 53e0ea10-7164-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1669891499; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qS2iWo3Dm0EH0lW3qnO4e9iCFHISqZEp7xZkXbK4Ifo=;
	b=NxaTt0/uhsTJ+bqe1XRnAvMqc7Sqt9vLAdtz2XVCd/Wsi266oNTs9NXcaUqfNebGvhRnh9
	ddDPaNQ1fiHoH/D/V2A9VF8N7cxzLH3WaM6jbpJlSLi82kKsuVj4DmPFFd7d62/apPfVDx
	DcHINiSGoUthBejRH8Yj4bSwwOHD4XQ=
Message-ID: <82bdfded-6271-d262-136d-57b4b1a92a9b@suse.com>
Date: Thu, 1 Dec 2022 11:44:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1 5/5] CODING_STYLE: add .clang-format
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Edwin Torok <edvin.torok@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <cover.1669829264.git.edvin.torok@citrix.com>
 <bf4013cdb5f3e66693551b5e45b3f975b5a48795.1669829264.git.edvin.torok@citrix.com>
 <7e6b8e69-70d2-8178-205d-8c20b993162d@xen.org>
 <7DF6F06F-A65A-4F1F-8FDA-BF0E8977F99B@citrix.com>
 <c3af2730-d503-e139-644a-480a506c94d1@xen.org>
 <99df302d-8bc5-55a7-a97e-dcc8eee41d2c@suse.com>
 <3e6e6948-7852-751e-a025-9fe36e9cfb82@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <3e6e6948-7852-751e-a025-9fe36e9cfb82@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------A0Spg86BgRfTdvBXfirFGLXA"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------A0Spg86BgRfTdvBXfirFGLXA
Content-Type: multipart/mixed; boundary="------------5yJvw7LrS2Z6Jce1vaaglkJq";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, Edwin Torok <edvin.torok@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich
 <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Message-ID: <82bdfded-6271-d262-136d-57b4b1a92a9b@suse.com>
Subject: Re: [PATCH v1 5/5] CODING_STYLE: add .clang-format
References: <cover.1669829264.git.edvin.torok@citrix.com>
 <bf4013cdb5f3e66693551b5e45b3f975b5a48795.1669829264.git.edvin.torok@citrix.com>
 <7e6b8e69-70d2-8178-205d-8c20b993162d@xen.org>
 <7DF6F06F-A65A-4F1F-8FDA-BF0E8977F99B@citrix.com>
 <c3af2730-d503-e139-644a-480a506c94d1@xen.org>
 <99df302d-8bc5-55a7-a97e-dcc8eee41d2c@suse.com>
 <3e6e6948-7852-751e-a025-9fe36e9cfb82@xen.org>
In-Reply-To: <3e6e6948-7852-751e-a025-9fe36e9cfb82@xen.org>

--------------5yJvw7LrS2Z6Jce1vaaglkJq
Content-Type: multipart/mixed; boundary="------------veVD2lusvReEq73e9YRDdLXn"

--------------veVD2lusvReEq73e9YRDdLXn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMTIuMjIgMTE6MTIsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gDQo+IA0KPiBPbiAw
MS8xMi8yMDIyIDEwOjA4LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMDEuMTIuMjIg
MTA6MzEsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+PiAoKyBBIGZldyBwZW9wbGUpDQo+Pj4N
Cj4+PiBPbiAwMS8xMi8yMDIyIDA5OjIxLCBFZHdpbiBUb3JvayB3cm90ZToNCj4+Pj4NCj4+
Pj4NCj4+Pj4+IE9uIDEgRGVjIDIwMjIsIGF0IDA5OjExLCBKdWxpZW4gR3JhbGwgPGp1bGll
bkB4ZW4ub3JnPiB3cm90ZToNCj4+Pj4+DQo+Pj4+PiBIaSBFZHdpbiwNCj4+Pj4+DQo+Pj4+
PiBUaGUgdGl0bGUgc2hvdWxkIGhhdmUgIk9DYW1sIiB0byBjbGFyaWZ5IHRoYXQgLmNsYW5n
LWZvcm1hdCBpcyBub3QgYWRkZWQgYXQgDQo+Pj4+PiB0aGUgcm9vdCBsZXZlbC4NCj4+Pj4+
DQo+Pj4+DQo+Pj4+IFN1cmUsIEknbGwgdXBkYXRlIHRoYXQgd2hlbiBJIHJlc2VuZC4NCj4+
Pj4NCj4+Pj4+IE9uIDMwLzExLzIwMjIgMTc6MzIsIEVkd2luIFTDtnLDtmsgd3JvdGU6DQo+
Pj4+Pj4gQWRkIGEgLmNsYW5nLWZvcm1hdCBjb25maWd1cmF0aW9uIHRoYXQgdHJpZXMgdG8g
bWF0Y2ggQ09ESU5HX1NUWUxFIHdoZXJlDQo+Pj4+Pj4gcG9zc2libGUuDQo+Pj4+Pj4gSSB3
YXMgbm90IGFibGUgdG8gZXhwcmVzcyB0aGUgc3BlY2lhbCBjYXNpbmcgb2YgYnJhY2VzIGFm
dGVyICdkbycNCj4+Pj4+PiB0aG91Z2gsIHRoaXMgY2FuIG9ubHkgYmUgY29udHJvbGxlZCBn
ZW5lcmFsbHkgZm9yIGFsbCBjb250cm9sDQo+Pj4+Pj4gc3RhdGVtZW50cy4NCj4+Pj4+PiBJ
dCBpcyBpbXBlcmZlY3QsIGJ1dCBzaG91bGQgYmUgYmV0dGVyIHRoYW4gdGhlIGV4aXN0aW5n
IGJpbmRpbmdzLCB3aGljaA0KPj4+Pj4+IGRvIG5vdCBmb2xsb3cgWGVuIGNvZGluZyBzdHls
ZS4NCj4+Pj4+DQo+Pj4+PiBSaWdodCwgZnJvbSBwcmV2aW91cyBkaXNjdXNzaW9uLCBJIHdh
cyB1bmRlciB0aGUgaW1wcmVzc2lvbiB0aGF0IGl0IA0KPj4+Pj4gcmVxdWlyZXMgc29tZSB3
b3JrIHRvIHdyaXRlIGEgY2xhbmctZm9ybWF0IGZpbGUgZm9yIFhlbi4NCj4+Pj4+DQo+Pj4+
PiBJIGFtIGhvcGVmdWwgdGhhdCBzb21lIGRheSB3ZSB3aWxsIGhhdmUgYSBwcm9wZXIgb25l
LiBJbiBmYWN0LCB3ZSBoYXZlIGJlZW4gDQo+Pj4+PiBkaXNjdXNzaW5nIGFib3V0IHRoaXMg
YXMgcGFydCBvZiBNSVNSQSAoKyBTdGVmYW5vKS4NCj4+Pj4+DQo+Pj4+Pj4gQWRkIHRoaXMg
dG8gdG9vbHMvb2NhbWwgZmlyc3QgYmVjYXVzZToNCj4+Pj4+PiAqIHRoZXJlIGFyZSByZWxh
dGl2ZWx5IGZldyBDIGZpbGVzIGhlcmUsIGFuZCBpdCBpcyBhIGdvb2QgcGxhY2UgdG8gc3Rh
cnQgd2l0aA0KPj4+Pj4+ICogaXQnZCBiZSB1c2VmdWwgdG8gbWFrZSB0aGVzZSBmb2xsb3cg
WGVuJ3MgQ09ESU5HX1NUWUxFDQo+Pj4+Pj4gKHdoaWNoIHRoZXkgY3VycmVudGx5IGRvIG5v
dCBiZWNhdXNlIHRoZXkgdXNlIHRhYnMgZm9yIGV4YW1wbGUpDQo+Pj4+Pj4gKiB0aGV5IGNo
YW5nZSByZWxhdGl2ZWx5IGluZnJlcXVlbnRseSwgc28gc2hvdWxkbid0IGNhdXNlIGlzc3Vl
cyB3aXRoDQo+Pj4+Pj4gwqDCoCBiYWNrcG9ydGluZyBzZWN1cml0eSBmaXhlcyAoY291bGQg
ZWl0aGVyIGJhY2twb3J0IHRoZSByZWluZGVudGF0aW9uDQo+Pj4+Pj4gwqDCoCBwYXRjaCB0
b28sIG9yIHVzZSBnaXQgY2hlcnJ5LXBpY2sgd2l0aCBgLVhpZ25vcmUtc3BhY2UtY2hhbmdl
YCkNCj4+Pj4+PiBPbmNlIHRoaXMgaXMgdXNlZCBpdCdsbCBuZWVkIGluc2VydGluZyBzb21l
ICcjaW5jbHVkZSA8c3RkaW50Lmg+JywgDQo+Pj4+Pj4gb3RoZXJ3aXNlIHhzX3dpcmUuaA0K
Pj4+Pj4+IGZhaWxzIHRvIGNvbXBpbGUgZHVlIHRvIHRoZSBtaXNzaW5nIHVpbnQzMl90IGRl
ZmluZS4NCj4+Pj4+DQo+Pj4+PiBBdCBmaXJzdCBJIHdhcyBhIGJpdCBjb25jZXJuZWQgd2l0
aCB0aGlzIHBhcmFncmFwaCBiZWNhdXNlIGEgY29kaW5nIHN0eWxlIA0KPj4+Pj4gc2hvdWxk
IG5vdCBpbXBhY3QgY29tcGlsYXRpb24uIEJ1dCBJIGd1ZXNzIHRoYXQncyBiZWNhdXNlIHRo
ZSBmb3JtYXQgd2lsbCANCj4+Pj4+IGNvbnZlcnQgdTMyIHRvIHVpbnQzMl90LiBJcyB0aGF0
IGNvcnJlY3Q/DQo+Pj4+Pg0KPj4+Pj4gSWYgc28sIEkgd291bGQgZXhwYW5kIHRoZSBwYXJh
Z3JhcGggdG8gZXhwbGljaXQgc2F5IHRoYXQsIHBlciB0aGUgY29kaW5nIA0KPj4+Pj4gc3R5
ZWwsIHUzMiB3aWxsIGJlIGNvbnZlcnRlZCB0byB1aW50MzJfdC4NCj4+Pj4NCj4+Pj4NCj4+
Pj4gY2xhbmctZm9ybWF0IHJlYXJyYW5nZXMgdGhlIG9yZGVyIG9mICcjaW5jbHVkZScgaW4g
QyBmaWxlcywgaXQgc2hvdWxkbid0IA0KPj4+PiBjb252ZXJ0IHR5cGVzLg0KPj4+PiBCdXQg
cmVhcnJhbmdpbmcgKHNvcnRpbmcpIGluY2x1ZGVzIGNhbiBzb21ldGltZXMgcmV2ZWFsIGJ1
Z3Mgd2hlcmUgdGhlIGNvZGUgDQo+Pj4+IG9ubHkgaGFwcGVuZWQgdG8gY29tcGlsZSBiZWNh
dXNlIHRoZSBpbmNsdWRlcyB3ZXJlIGRvbmUgaW4gYSBjZXJ0YWluIG9yZGVyDQo+Pj4+IChl
LmcuIHdlIGluY2x1ZGVkIHNvbWV0aGluZyB0aGF0IGluY2x1ZGVkIHN0ZGludC5oLCB0aGVy
ZWZvcmUgdGhlIG5leHQgDQo+Pj4+IGluY2x1ZGUgbGluZSB3b3JrZWQsIGJ1dCBpZiB5b3Ug
c3dhcCB0aGUgaW5jbHVkZSBvcmRlciB0aGF0IG5vIGxvbmdlciANCj4+Pj4gd29ya3MpLCBp
LmUuOg0KPj4+Pg0KPj4+PiAjaW5jbHVkZSAiYy5oIg0KPj4+PiAjaW5jbHVkZSAiYi5oIg0K
Pj4+Pg0KPj4+PiB2cw0KPj4+Pg0KPj4+PiAvKiBwb3N0IGZvcm1hdHRpbmcgKi8NCj4+Pj4g
I2luY2x1ZGUgImIuaCINCj4+Pj4gI2luY2x1ZGUgImMuaCINCj4+Pj4NCj4+Pj4gV2hlcmUg
Yy5oIGluY2x1ZGVzIGEuaCwgYW5kIGIuaCBkZXBlbmRzIG9uIGRlY2xhcmF0aW9ucyBmcm9t
IGEuaCwgdGhlbiBwcmlvciANCj4+Pj4gdG8gcmVmb3JtYXQgdGhlIGNvZGUgY29tcGlsZXMs
IGFuZCBhZnRlcndhcmRzIGl0IGRvZXNuJ3QuDQo+Pj4gVGhhbmtzIGZvciB0aGUgZGV0YWls
ZWQgaW5mb3JtYXRpb24sIEkgdGhpbmsgc29tZSBvZiBpdCBuZWVkcyB0byBiZSANCj4+PiBz
dW1tYXJpemVkIGluIHRoZSBjb21tbWl0IG1lc3NhZ2UuDQo+Pj4NCj4+Pj4NCj4+Pj4gV2hp
Y2ggY2FuIGJlIGZpeGVkIGJ5IGFkZGluZyB0aGlzIHRvIHRoZSBDIGZpbGUgKGFuZCB0aGVu
IHJlZ2FyZGxlc3Mgb2YgDQo+Pj4+IGluY2x1ZGUgb3JkZXIgb2YgdGhlIG90aGVyIDIgaXQg
Y29tcGlsZXMpOg0KPj4+PiAjaW5jbHVkZSA8YS5oPg0KPj4+IFRoaXMgd291bGQgbm90IHdv
cmsgaWYgdGhlIGZpbGUgd2VyZSBjYWxsZWQgImQuaCIgcmF0aGVyIHRoYW4gImEuaCIgYmVj
YXVzZSANCj4+PiB0aGUgY2xhbmcgZm9ybWF0IHdvdWxkIHJlLW9yZGVyIGl0LiBTby4uLg0K
Pj4+DQo+Pj4+DQo+Pj4+IE9yIGJ5IGZpeGluZyBiLmggdG8gaW5jbHVkZSBhLmggaXRzZWxm
IGl0IGl0IGRlcGVuZHMgb24gaXQuDQo+Pj4NCj4+PiAuLi4gdGhpcyBpcyB0aGUgcHJvcGVy
IHdheSB0byBmaXggaXQuDQo+Pj4NCj4+Pj4NCj4+Pj4gUGVyaGFwcyB0aGlzJ2QgYmV0dGVy
IGJlIGZpeGVkIGluIHhzX3dpcmUuaCBpdHNlbGYgdG8gaW5jbHVkZSBhbGwgaXRzIA0KPj4+
PiBkZXBlbmRlbmNpZXMsIGJ1dCB0aGF0IGlzIGEgcHVibGljbHkgaW5zdGFsbGVkIGhlYWRl
ciwgYW5kIHRoZXJlIG1pZ2h0IGJlIGEgDQo+Pj4+IHJlYXNvbiB3aHkgaXQgZG9lc24ndCBp
bmNsdWRlIHN0ZGludC5oLg0KPj4+DQo+Pj4gSSBhbSBub3QgYXdhcmUgb2YgYW55IHJlc3Ry
aWN0aW9ucyBhbmQgYXQgbGVhc3Qgb25lIHB1YmxpYyBoZWFkZXJzIGFscmVhZHkgDQo+Pj4g
aW5jbHVkZSA8c3RkaW50Lmg+LiBJIGFtIENDZWQgYSBmZXcgbW9yZSBwZW9wbGUgdG8gZ2V0
IGFuIG9waW5pb24uDQo+Pg0KPj4gSSBkb24ndCB0aGluayB4c193aXJlLmggc2hvdWxkIGlu
Y2x1ZGUgc3RkaW50LmguIFRoaXMgd2lsbCByZXN1bHQgaW4gYSBjb25mbGljdA0KPj4gZS5n
LiBpbiB0aGUgTGludXgga2VybmVsLg0KPiANCj4gQUZBSVUsIExpbnV4IGhhcyBpdHMgb3du
IGNvcHkgb2YgdGhlIGhlYWRlcnMuIElzIHRoYXQgY29ycmVjdD8NCg0KWWVzLg0KDQo+IA0K
Pj4NCj4+IFdlIG1pZ2h0IHdhbnQgdG8gYWRkIGEgY29tbWVudCB0byB4c193aXJlLmggbGlr
ZSB0aGUgb25lIGluIHJpbmcuaCBpbiBvcmRlciB0bw0KPj4gZG9jdW1lbnQgdGhlIHJlcXVp
cmVtZW50IG9mIHRoZSB0eXBlIGRlZmluaXRpb24gb2YgdWludDMyX3QuDQo+IA0KPiBUaGUg
cHJvYmxlbSB3aXRoIHRoaXMgYXBwcm9hY2ggaXMgeW91IG1hZGUgbW9yZSBkaWZmaWN1bHQg
Zm9yIGFueSB1c2Vyc3BhY2UgDQo+IGFwcGxpY2F0aW9uIHRvIHVzZSB0aGUgaGVhZGVycy4g
U28gSSB3b3VsZCBhcmd1ZSB0aGF0IHRoZSBMaW51eCBjb3B5IGNhbiByZW1vdmUgDQo+ICJz
dGRpbnQuaCIgaWYgbmVlZGVkLg0KDQpUb2RheSB0aGVyZSBpcyBleGFjdGx5IG9uZSBwdWJs
aWMgaGVhZGVyIGluY2x1ZGluZyBzdGRpbnQuaCwgYW5kIEknZCBhcmd1ZQ0KdGhhdCB0aGlz
IHdhcyBhIG1pc3Rha2UuDQoNCnhzX3dpcmUuaCBpcyBlc3BlY2lhbGx5IHJhdGhlciB1bmlu
dGVyZXN0aW5nIGZvciBhbnkgdXNlciBzcGFjZSBhcHBsaWNhdGlvbg0KYnV0IGEgWGVuc3Rv
cmUgaW1wbGVtZW50YXRpb24uIEFsbCBjb25zdW1lcnMgb2YgeHNfd2lyZS5oIGFyZSBwcm9i
YWJseQ0KZWl0aGVyIGluIHRoZSBYZW4gdHJlZSwgb3Igb3BlcmF0aW5nIHN5c3RlbSBrZXJu
ZWxzLiBVc2VyIHNwYWNlIGFwcGxpY2F0aW9ucw0Kc2hvdWxkIHVzZSBsaWJ4ZW5zdG9yZSBm
b3IgYWNjZXNzaW5nIHRoZSBYZW5zdG9yZSwgc28gSSBkb24ndCBzZWUgYW4NCmFkdmFudGFn
ZSBpbiBicmVha2luZyB0aGUgdXN1YWwgcGhpbG9zb3BoeSBvZiB0aGUgWGVuIHB1YmxpYyBo
ZWFkZXJzIE5PVA0KaW5jbHVkaW5nIGV4dGVybmFsIGhlYWRlcnMgbGlrZSBzdGRpbnQuaC4N
Cg0KDQpKdWVyZ2VuDQo=
--------------veVD2lusvReEq73e9YRDdLXn
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------veVD2lusvReEq73e9YRDdLXn--

--------------5yJvw7LrS2Z6Jce1vaaglkJq--

--------------A0Spg86BgRfTdvBXfirFGLXA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmOIhaoFAwAAAAAACgkQsN6d1ii/Ey+1
4gf/VrYVOT8RxDN8WnRqXZBfiwqE+jUc6aTgcK/7BAn11W5kCsXe021aekhF3BquQZzk2NqOkIkk
vV6Ev57li+ypv8xjg1HrFuKMIeW0d0wnu9Kr49fQihHW8kAC0aIgQc8kACm1h3Bry8AE8gsOEbMN
DvuOJgM0oGIbBPZUXvv3uZpTdcV1xlSVc7uwaVEyz+e2dzoltPv+Td3L/sh5NToyg9KwYwp+FGLN
OUkkCZo/T0ooPjyyhIO5T6oaYtRTaSPEDM7T6HkO1dBdxGvQwTcB/GMCmR2KFcrEovRzSRl5Cuev
pPUDjueHXvZ8+NqBTwTTb+U4l8X1Ps1D2j6tpKAiNA==
=SdOG
-----END PGP SIGNATURE-----

--------------A0Spg86BgRfTdvBXfirFGLXA--

