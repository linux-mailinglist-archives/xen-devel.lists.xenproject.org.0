Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 429A761ECE5
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 09:29:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439113.693080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orxVT-0006ty-Uf; Mon, 07 Nov 2022 08:29:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439113.693080; Mon, 07 Nov 2022 08:29:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orxVT-0006s0-RX; Mon, 07 Nov 2022 08:29:23 +0000
Received: by outflank-mailman (input) for mailman id 439113;
 Mon, 07 Nov 2022 08:29:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bDd0=3H=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1orxVS-0006re-0x
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 08:29:22 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46b394fb-5e76-11ed-8fd1-01056ac49cbb;
 Mon, 07 Nov 2022 09:29:20 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 04298223A1;
 Mon,  7 Nov 2022 08:29:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C303313494;
 Mon,  7 Nov 2022 08:29:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VYXcLd/BaGOFKgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 07 Nov 2022 08:29:19 +0000
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
X-Inumbo-ID: 46b394fb-5e76-11ed-8fd1-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667809760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p3Ql0lxrMJTuGFDH/fS7ZqQQpq4iJ92G5JE9oDo+R/E=;
	b=DaexbtDhP/iJGWRWdyvPE79qm7bGzNacphjd4R8QTSAxR142IT50fRozLTp5F0z1aTfQoV
	+wgUht52qbGjip3hPwRXDK97NZXVTx02G84czMc3RvKfASi5g9H/wQ5I5Q3pl41yvvMyVe
	/zUjhYMoSZ3XuWbeMmQ7Y/99AtcqgV0=
Message-ID: <367adc31-98e8-bbd5-5d83-02a410b58876@suse.com>
Date: Mon, 7 Nov 2022 09:29:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-10-jgross@suse.com>
 <4fb428cb-242f-1ee7-2dd7-cf32b190ebd6@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 09/20] tools/xenstore: introduce dummy nodes for special
 watch paths
In-Reply-To: <4fb428cb-242f-1ee7-2dd7-cf32b190ebd6@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------r9XAtbATImkjr0NHJp3RCvRL"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------r9XAtbATImkjr0NHJp3RCvRL
Content-Type: multipart/mixed; boundary="------------8mN1V36v0LvGHqq5o0IHrKV0";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <367adc31-98e8-bbd5-5d83-02a410b58876@suse.com>
Subject: Re: [PATCH 09/20] tools/xenstore: introduce dummy nodes for special
 watch paths
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-10-jgross@suse.com>
 <4fb428cb-242f-1ee7-2dd7-cf32b190ebd6@xen.org>
In-Reply-To: <4fb428cb-242f-1ee7-2dd7-cf32b190ebd6@xen.org>

--------------8mN1V36v0LvGHqq5o0IHrKV0
Content-Type: multipart/mixed; boundary="------------xl3Wy10wlEjI3wys4bB0rErv"

--------------xl3Wy10wlEjI3wys4bB0rErv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMTEuMjIgMjI6MzgsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDAxLzExLzIwMjIgMTU6MjgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBJ
bnN0ZWFkIG9mIHNwZWNpYWwgY2FzaW5nIHRoZSBwZXJtaXNzaW9uIGhhbmRsaW5nIGFuZCB3
YXRjaCBldmVudA0KPj4gZmlyaW5nIGZvciB0aGUgc3BlY2lhbCB3YXRjaCBwYXRocyAiQGlu
dHJvZHVjZURvbWFpbiIgYW5kDQo+PiAiQHJlbGVhc2VEb21haW4iLCB1c2Ugc3RhdGljIGR1
bW15IG5vZGVzIGFkZGVkIHRvIHRoZSBkYXRhIGJhc2Ugd2hlbg0KPj4gc3RhcnRpbmcgWGVu
c3RvcmUuDQo+IA0KPiBBIGZldyBxdWVzdGlvbnMgSSB0aGluayBuZWVkcyB0byBiZSBhbnN3
ZXJlZCBpbiB0aGUgY29tbWl0IG1lc3NhZ2U6DQoNCk9rYXkuIFdpbGwgYWRkLg0KDQo+ICDC
oCAtIERvZXMgdGhpcyBtZWFucyB3ZSBjb3VsZCB3cml0ZSBkYXRhIGluICJALi4uIsKgIG5v
ZGU/DQo+ICDCoCAtIEhvdyBhYm91dCBjcmVhdGluZyBzdWIgbm9kZXM/DQoNCk5vcm1hbCBY
ZW5zdG9yZSBvcGVyYXRpb25zIHdvbid0IHN1Y2NlZWQgZHVlIHRvIHBhdGggbmFtZSBjaGVj
a3MuDQoNCkJ1dCBJIGp1c3QgcmVhbGl6ZWQgdGhhdCBhdCBzb21lIHRpbWUgYSBjaHVuayBv
ZiB0aGUgcGF0Y2ggbXVzdCBoYXZlIGJlZW4NCmxvc3QsIGFzIEkgb3JpZ2luYWxseSBoYWQg
c3BlY2lhbCBjaGVja3MgZm9yIHNldC9nZXQgcGVybWlzc2lvbnMgaW4gcGxhY2UuDQpUaG9z
ZSBhcmUgbm8gbG9uZ2VyIHRoZXJlIGFuZCBuZWVkIHRvIGJlIHJlLWFkZGVkLg0KDQo+ICDC
oCAtIFdoYXQgZG9lcyBpdCBtZWFuIGZvciB0aGUgYWNjb3VudGluZz8gQmVmb3JlLCBpdCB3
YXMgYWNjb3VudGVkIHRvIG5vLW9uZSANCj4gYnV0IG5vdyBpdCBzZWVtcyB0byBiZSBhY2Nv
dW50ZWQgdG8gdGhlIG93bmVyICh3aGljaCBtYXkgbm90IGJlIGRvbTApLg0KDQpZZXMuIEFu
ZCB0aGlzIGlzIGhvdyBpdCBzaG91bGQgYmUuDQoNCj4+IFRoaXMgYWxsb3dzIHRvIHNpbXBs
aWZ5IHF1aXRlIHNvbWUgY29kZS4NCj4gDQo+IFRoZSBkaWZmIGlzIHF1aXRlIG5pY2UgdG8g
aGF2ZSwgYnV0IEkgYW0gbm90IGVudGlyZWx5IGNvbnZpbmNlZCB0aGlzIGlzIG1ha2luZyAN
Cj4gdGhlIGNvZGUgZWFzaWVyIHRvIHVuZGVyc3RhbmQuDQo+IA0KPiBJcyB0aGlzIHBhdGNo
IGhlbHBpbmcgeW91IGZvciBhbm90aGVyIGdvYWw/DQoNCkl0IHdpbGwgYWxsb3cgdG8gYWRk
IG1vcmUgZmluZSBncmFpbmVkIHBlcm1pc3Npb25zIHdoZW4gYWRkaW5nIHRoZSBzdXBwb3J0
DQpmb3IgcmVwb3J0aW5nIHRoZSBkb21pZCBpbiBzcGVjaWFsIGV2ZW50cyAoZS5nLiBhbGxv
d2luZyBhIHN0dWJkb20gdG8gd2F0Y2gNCnRoZSBAcmVsZWFzZSBldmVudCBvZiBpdHMgdGFy
Z2V0IGRvbWFpbikuDQoNCj4gDQo+Pg0KPj4gTm90ZSB0aGF0IHRoaXMgcmVxdWlyZXMgdG8g
cmV3b3JrIHRoZSBjYWxscyBvZiBmaXJlX3dhdGNoZXMoKSBmb3IgdGhlDQo+PiBzcGVjaWFs
IGV2ZW50cyBpbiBvcmRlciB0byBhdm9pZCBsZWFraW5nIG1lbW9yeS4NCj4+DQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+PiAtLS0NCj4+
IMKgIHRvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb250cm9sLmMgfMKgwqAgMyAtDQo+PiDC
oCB0b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5jwqDCoMKgIHzCoCA2NyArKysrKysr
LS0tLS0NCj4+IMKgIHRvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9kb21haW4uY8KgIHwgMTYy
ICsrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+PiDCoCB0b29scy94ZW5zdG9yZS94
ZW5zdG9yZWRfZG9tYWluLmjCoCB8wqDCoCA2IC0tDQo+PiDCoCB0b29scy94ZW5zdG9yZS94
ZW5zdG9yZWRfd2F0Y2guY8KgwqAgfMKgIDE3ICstLQ0KPj4gwqAgNSBmaWxlcyBjaGFuZ2Vk
LCA2MyBpbnNlcnRpb25zKCspLCAxOTIgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdp
dCBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb250cm9sLmMgDQo+PiBiL3Rvb2xzL3hl
bnN0b3JlL3hlbnN0b3JlZF9jb250cm9sLmMNCj4+IGluZGV4IGQxYWFhMDBiZjQuLjQxZTY5
OTI1OTEgMTAwNjQ0DQo+PiAtLS0gYS90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29udHJv
bC5jDQo+PiArKysgYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29udHJvbC5jDQo+PiBA
QCAtNjc2LDkgKzY3Niw2IEBAIHN0YXRpYyBjb25zdCBjaGFyICpsdV9kdW1wX3N0YXRlKGNv
bnN0IHZvaWQgKmN0eCwgc3RydWN0IA0KPj4gY29ubmVjdGlvbiAqY29ubikNCj4+IMKgwqDC
oMKgwqAgaWYgKHJldCkNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIG91dDsNCj4+IMKg
wqDCoMKgwqAgcmV0ID0gZHVtcF9zdGF0ZV9jb25uZWN0aW9ucyhmcCk7DQo+PiAtwqDCoMKg
IGlmIChyZXQpDQo+PiAtwqDCoMKgwqDCoMKgwqAgZ290byBvdXQ7DQo+PiAtwqDCoMKgIHJl
dCA9IGR1bXBfc3RhdGVfc3BlY2lhbF9ub2RlcyhmcCk7DQo+PiDCoMKgwqDCoMKgIGlmIChy
ZXQpDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBvdXQ7DQo+PiDCoMKgwqDCoMKgIHJl
dCA9IGR1bXBfc3RhdGVfbm9kZXMoZnAsIGN0eCk7DQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMv
eGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuYyBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9j
b3JlLmMNCj4+IGluZGV4IDE2NTA4MjE5MjIuLmNhZGIzMzk0ODYgMTAwNjQ0DQo+PiAtLS0g
YS90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5jDQo+PiArKysgYi90b29scy94ZW5z
dG9yZS94ZW5zdG9yZWRfY29yZS5jDQo+PiBAQCAtNjE2LDcgKzYxNiw4IEBAIHN0YXRpYyB2
b2lkIGdldF9hY2NfZGF0YShUREJfREFUQSAqa2V5LCBzdHJ1Y3QgDQo+PiBub2RlX2FjY291
bnRfZGF0YSAqYWNjKQ0KPj4gwqAgc3RhdGljIHVuc2lnbmVkIGludCBnZXRfYWNjX2RvbWlk
KHN0cnVjdCBjb25uZWN0aW9uICpjb25uLCBUREJfREFUQSAqa2V5LA0KPj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IGRvbWlkKQ0KPj4g
wqAgew0KPj4gLcKgwqDCoCByZXR1cm4gKCFjb25uIHx8IGtleS0+ZHB0clswXSA9PSAnLycp
ID8gZG9taWQgOiBjb25uLT5pZDsNCj4+ICvCoMKgwqAgcmV0dXJuICghY29ubiB8fCBrZXkt
PmRwdHJbMF0gPT0gJy8nIHx8IGtleS0+ZHB0clswXSA9PSAnQCcpDQo+IA0KPiBUaGUgY29t
bWVudCBhYm92ZSBzYXlzIGl0IGlzIHN1ZmZpY2llbnQgdG8gY2hlY2sgZm9yICcvJy4gQnV0
IG5vdywgeW91IGFyZSBhbHNvIA0KPiBjaGVja2luZyBmb3IgJ0AnLg0KDQpXaWxsIGZpeCB0
aGUgY29tbWVudC4NCg0KPiANCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCA/IGRvbWlkIDog
Y29ubi0+aWQ7DQo+PiDCoCB9DQo+PiDCoCBpbnQgZG9fdGRiX3dyaXRlKHN0cnVjdCBjb25u
ZWN0aW9uICpjb25uLCBUREJfREFUQSAqa2V5LCBUREJfREFUQSAqZGF0YSwNCj4+IEBAIC0x
NzgwLDE0ICsxNzgxLDYgQEAgc3RhdGljIGludCBkb19zZXRfcGVybXMoY29uc3Qgdm9pZCAq
Y3R4LCBzdHJ1Y3QgDQo+PiBjb25uZWN0aW9uICpjb25uLA0KPj4gwqDCoMKgwqDCoCBpZiAo
cGVybXMucFswXS5wZXJtcyAmIFhTX1BFUk1fSUdOT1JFKQ0KPj4gwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiBFTk9FTlQ7DQo+PiAtwqDCoMKgIC8qIEZpcnN0IGFyZyBpcyBub2RlIG5h
bWUuICovDQo+PiAtwqDCoMKgIGlmIChzdHJzdGFydHMoaW4tPmJ1ZmZlciwgIkAiKSkgew0K
Pj4gLcKgwqDCoMKgwqDCoMKgIGlmIChzZXRfcGVybXNfc3BlY2lhbChjb25uLCBpbi0+YnVm
ZmVyLCAmcGVybXMpKQ0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGVycm5v
Ow0KPj4gLcKgwqDCoMKgwqDCoMKgIHNlbmRfYWNrKGNvbm4sIFhTX1NFVF9QRVJNUyk7DQo+
PiAtwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7DQo+PiAtwqDCoMKgIH0NCj4gDQo+IFNvIHRo
ZXJlIGFyZSBhIHNsaWdodCBjaGFuZ2UgaW4gYmVoYXZpb3IgaGVyZS4gQmVmb3JlLCB0aGUg
cGVybWlzc2lvbiB3b3VsZCBiZSANCj4gZGlyZWN0bHkgc2V0IGV2ZW4gaWYgd2UgYXJlIGlu
IGEgdHJhbnNhY3Rpb24uIE5vdywgdGhpcyB3aWxsIG9ubHkgYmUgc2V0IGlmIHRoZSANCj4g
dHJhbnNhY3Rpb24gaGFzIGJlZW4gY29tbWl0dGVkLg0KPiANCj4gSSBhbSBzcGxpdCBvbiB3
aGV0aGVyIHRoaXMgd291bGQgYmUgY29uc2lkZXJlZCBhcyBhbiBBQkkgYnJlYWthZ2UuIFRo
ZSBuZXcgDQo+IGJlaGF2aW9yIHNlZW1zIGJldHRlciwgYnV0IGFueW9uZSByZWx5IG9uIHRo
ZSAoYm9ndXM/KSBwcmV2aW91cyBiZWhhdmlvciB3b3VsZCANCj4gaGF2ZSBhIHN1cnByaXNl
LiBBdCBtaW5pbXVtLCB0aGUgY2hhbmdlIHNob3VsZCBhdCBsZWFzdCBiZSBwb2ludGVkIG91
dCBpbiB0aGUgDQo+IGNvbW1pdCBtZXNzYWdlLg0KDQpJIGRvbid0IHRoaW5rIHRoaXMgd2ls
bCBiZSBhIHJlYWwgcHJvYmxlbSwgYXMgdGhlIG9sZCBiZWhhdmlvciB3YXMgbW9yZSBsaWtl
DQphIGJ1Zy4gSSdsbCBzcGVsbCBpdCBvdXQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLg0KDQo+
IA0KPiBbLi4uXQ0KPiANCj4+IMKgIHN0YXRpYyBpbnQgZG9tYWluX3RyZWVfcmVtb3ZlX3N1
Yihjb25zdCB2b2lkICpjdHgsIHN0cnVjdCBjb25uZWN0aW9uICpjb25uLA0KPj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IG5vZGUgKm5vZGUsIHZv
aWQgKmFyZykNCj4+IMKgIHsNCj4+IEBAIC0yOTcsOCArMjczLDI0IEBAIHN0YXRpYyB2b2lk
IGRvbWFpbl90cmVlX3JlbW92ZShzdHJ1Y3QgZG9tYWluICpkb21haW4pDQo+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJlcnJvciB3aGVuIGxvb2tpbmcg
Zm9yIG9ycGhhbmVkIG5vZGVzXG4iKTsNCj4+IMKgwqDCoMKgwqAgfQ0KPj4gLcKgwqDCoCBy
ZW1vdmVfZG9taWRfZnJvbV9wZXJtKCZkb21fcmVsZWFzZV9wZXJtcywgZG9tYWluKTsNCj4+
IC3CoMKgwqAgcmVtb3ZlX2RvbWlkX2Zyb21fcGVybSgmZG9tX2ludHJvZHVjZV9wZXJtcywg
ZG9tYWluKTsNCj4+ICvCoMKgwqAgd2Fsa19ub2RlX3RyZWUoZG9tYWluLCBOVUxMLCAiQHJl
bGVhc2VEb21haW4iLCAmd2Fsa2Z1bmNzLCBkb21haW4pOw0KPj4gK8KgwqDCoCB3YWxrX25v
ZGVfdHJlZShkb21haW4sIE5VTEwsICJAaW50cm9kdWNlRG9tYWluIiwgJndhbGtmdW5jcywg
ZG9tYWluKTsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIHZvaWQgZmlyZV9zcGVjaWFsX3dh
dGNoZXMoY29uc3QgY2hhciAqbmFtZSkNCj4+ICt7DQo+PiArwqDCoMKgIHZvaWQgKmN0eCA9
IHRhbGxvY19uZXcoTlVMTCk7DQo+PiArwqDCoMKgIHN0cnVjdCBub2RlICpub2RlOw0KPiAN
Cj4gSSBjYW4gZm9yZXNlZSBob3cgb25lIG1heSB3YW50IHRvIGFidXNlIGZvciB0aGlzIGZ1
bmN0aW9uLiBTbyBJIHdvdWxkIGFkZCBhbiANCj4gYXNzZXJ0KG5hbWVbMF0gPT0gJ0AnKSB0
byBtYXRjaCBjbGVhciB0aGlzIHNob3VsZCBvbmx5IGZvciB3YXRjaGVzIHN0YXJ0aW5nIHdp
dGggDQo+ICdAJy4NCg0KT2theS4NCg0KPiANCj4+ICsNCj4+ICvCoMKgwqAgaWYgKCFjdHgp
DQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuOw0KPj4gKw0KPj4gK8KgwqDCoCBub2RlID0g
cmVhZF9ub2RlKE5VTEwsIGN0eCwgbmFtZSk7DQo+PiArDQo+PiArwqDCoMKgIGlmIChub2Rl
KQ0KPj4gK8KgwqDCoMKgwqDCoMKgIGZpcmVfd2F0Y2hlcyhOVUxMLCBjdHgsIG5hbWUsIG5v
ZGUsIHRydWUsIE5VTEwpOw0KPiANCj4gU2hvdWxkbid0IHdlIHRocm93IGEgbWVzc2FnZSBp
ZiB3ZSBjYW4ndCByZXRyaWV2ZSBALi4uPw0KDQoNClllcywgSSBjYW4gYWRkIHRoYXQuDQoN
Cg0KSnVlcmdlbg0K
--------------xl3Wy10wlEjI3wys4bB0rErv
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

--------------xl3Wy10wlEjI3wys4bB0rErv--

--------------8mN1V36v0LvGHqq5o0IHrKV0--

--------------r9XAtbATImkjr0NHJp3RCvRL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmNowd8FAwAAAAAACgkQsN6d1ii/Ey+w
BQgAlFIvHkDvlWv0+u8G7cZdqgCYPAyroDKUOYbJz2H1kdZBbMFO2f1pwTWeygMAWbkAkxehLhrU
OvbbF0pFYuAlxWqzS2AWXfIEhYpD9IG1lYfCstCauLcR04IfgQ2uSH1OCnMUps6/1L/n3N1i4kxM
AN4+vC0R1pvYox3/wD0kN2Wwh4xxUa01BKUZAA76Z4XxbPmolp5YxYwQ/W4+6h+Nu5XSTua64MPF
vKjFFqHMGL5LyPcJTVF75L+Vu+Dqdjq5MBzJ87+JwVRzQNltBMmLXYONCAs7Lr+uDFPL3QZFkzJv
+Bc0hvANwt4Oj1WG+pt+2tC3sRG0+zI6OBipjXmwEg==
=cag1
-----END PGP SIGNATURE-----

--------------r9XAtbATImkjr0NHJp3RCvRL--

