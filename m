Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8363159FADB
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 15:07:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392586.631041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQq6V-0003Dl-Rd; Wed, 24 Aug 2022 13:07:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392586.631041; Wed, 24 Aug 2022 13:07:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQq6V-0003Aw-OK; Wed, 24 Aug 2022 13:07:31 +0000
Received: by outflank-mailman (input) for mailman id 392586;
 Wed, 24 Aug 2022 13:07:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jRce=Y4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oQq6U-000365-2U
 for xen-devel@lists.xen.org; Wed, 24 Aug 2022 13:07:30 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4e4d7df-23ad-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 15:07:29 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 029B21FE23;
 Wed, 24 Aug 2022 13:07:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 71E0313780;
 Wed, 24 Aug 2022 13:07:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HKoxGY8iBmOGYgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 24 Aug 2022 13:07:27 +0000
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
X-Inumbo-ID: b4e4d7df-23ad-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1661346448; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TTOuJVSaKOoDF6k/vUv6tDOWmHgpNVF5tDHHDdmp9uo=;
	b=arj6lEz+4pcIiQaBHyPthrbVDU75AI9wOICIvIJcIdZcph6NYOTEhxSQ5gOSAlslnfvTsR
	qQpfzdvigFjbBn6dSaCVOsD9mrAvmT99oMVpR409XpFb/MRiu2E73EdAOcDzdjfSfaUarw
	wmqkGzFOEh7dxGrjWcThhDdQOvT7F1c=
Message-ID: <edc33ca4-135e-111a-e198-38b9bae53005@suse.com>
Date: Wed, 24 Aug 2022 15:07:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 "Stratos-dev@op-lists.linaro.org" <Stratos-dev@op-lists.linaro.org>,
 "mathieu.poirier@linaro.com" <mathieu.poirier@linaro.com>,
 "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
 "olekstysh@gmail.com" <olekstysh@gmail.com>
References: <alpine.DEB.2.22.394.2203231838130.2910984@ubuntu-linux-20-04-desktop>
 <57549560-879d-f705-8693-9bfdc73e3f7f@suse.com>
 <20220824091918.szrd6e6ll6h6u2pw@vireshk-i7>
 <63eecf7a-aa69-28bf-9664-8ee8554a161f@citrix.com> <877d2xj23o.fsf@linaro.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: Understanding osdep_xenforeignmemory_map mmap behaviour
In-Reply-To: <877d2xj23o.fsf@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------MpJZX2ld0j0gIOVsGyyHovhq"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------MpJZX2ld0j0gIOVsGyyHovhq
Content-Type: multipart/mixed; boundary="------------efGMsH72wo5zNuNTvk5XkPzr";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 "Stratos-dev@op-lists.linaro.org" <Stratos-dev@op-lists.linaro.org>,
 "mathieu.poirier@linaro.com" <mathieu.poirier@linaro.com>,
 "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
 "olekstysh@gmail.com" <olekstysh@gmail.com>
Message-ID: <edc33ca4-135e-111a-e198-38b9bae53005@suse.com>
Subject: Re: Understanding osdep_xenforeignmemory_map mmap behaviour
References: <alpine.DEB.2.22.394.2203231838130.2910984@ubuntu-linux-20-04-desktop>
 <57549560-879d-f705-8693-9bfdc73e3f7f@suse.com>
 <20220824091918.szrd6e6ll6h6u2pw@vireshk-i7>
 <63eecf7a-aa69-28bf-9664-8ee8554a161f@citrix.com> <877d2xj23o.fsf@linaro.org>
In-Reply-To: <877d2xj23o.fsf@linaro.org>

--------------efGMsH72wo5zNuNTvk5XkPzr
Content-Type: multipart/mixed; boundary="------------GktwBuYoZ7oHkRXKPGX0zmPh"

--------------GktwBuYoZ7oHkRXKPGX0zmPh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDguMjIgMTM6MjIsIEFsZXggQmVubsOpZSB3cm90ZToNCj4gDQo+IEFuZHJldyBD
b29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+IHdyaXRlczoNCj4gDQo+PiBPbiAy
NC8wOC8yMDIyIDEwOjE5LCBWaXJlc2ggS3VtYXIgd3JvdGU6DQo+Pj4gT24gMjQtMDMtMjIs
IDA2OjEyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4+PiBGb3IgYSByYXRoZXIgbG9uZyB0
aW1lIHdlIHdlcmUgdXNpbmcgIm5vcm1hbCIgdXNlciBwYWdlcyBmb3IgdGhpcyBwdXJwb3Nl
LA0KPj4+PiB3aGljaCB3ZXJlIGp1c3QgbG9ja2VkIGludG8gbWVtb3J5IGZvciBkb2luZyB0
aGUgaHlwZXJjYWxsLg0KPj4+Pg0KPj4+PiBVbmZvcnR1bmF0ZWx5IHRoZXJlIGhhdmUgYmVl
biB2ZXJ5IHJhcmUgcHJvYmxlbXMgd2l0aCB0aGF0IGFwcHJvYWNoLCBhcw0KPj4+PiB0aGUg
TGludXgga2VybmVsIGNhbiBzZXQgYSB1c2VyIHBhZ2UgcmVsYXRlZCBQVEUgdG8gaW52YWxp
ZCBmb3Igc2hvcnQNCj4+Pj4gcGVyaW9kcyBvZiB0aW1lLCB3aGljaCBsZWQgdG8gRUZBVUxU
IGluIHRoZSBoeXBlcnZpc29yIHdoZW4gdHJ5aW5nIHRvDQo+Pj4+IGFjY2VzcyB0aGUgaHlw
ZXJjYWxsIGRhdGEuDQo+Pj4+DQo+Pj4+IEluIExpbnV4IHRoaXMgY2FuIGF2b2lkZWQgb25s
eSBieSB1c2luZyBrZXJuZWwgbWVtb3J5LCB3aGljaCBpcyB0aGUNCj4+Pj4gcmVhc29uIHdo
eSB0aGUgaHlwZXJjYWxsIGJ1ZmZlcnMgYXJlIGFsbG9jYXRlZCBhbmQgbW1hcCgpLWVkIHRo
cm91Z2ggdGhlDQo+Pj4+IHByaXZjbWQgZHJpdmVyLg0KPj4+IEhpIEp1ZXJnZW4sDQo+Pj4N
Cj4+PiBJIHVuZGVyc3RhbmQgd2h5IHdlIG1vdmVkIGZyb20gdXNlciBwYWdlcyB0byBrZXJu
ZWwgcGFnZXMsIGJ1dCBJIGRvbid0DQo+Pj4gZnVsbHkgdW5kZXJzdGFuZCB3aHkgd2UgbmVl
ZCB0byBtYWtlIHR3byBzZXBhcmF0ZSBjYWxscyB0byBtYXAgdGhlDQo+Pj4gZ3Vlc3QgbWVt
b3J5LCBpLmUuIG1tYXAoKSBmb2xsb3dlZCBieSBpb2N0bChJT0NUTF9QUklWQ01EX01NQVBC
QVRDSCkuDQo+Pj4NCj4+PiBXaHkgYXJlbid0IHdlIGRvaW5nIGFsbCBvZiBpdCBmcm9tIG1t
YXAoKSBpdHNlbGYgPyBJIGhhY2tlZCBpdCB1cCB0bw0KPj4+IGNoZWNrIG9uIGl0IGFuZCBp
dCB3b3JrcyBmaW5lIGlmIHdlIGRvIGl0IGFsbCBmcm9tIG1tYXAoKSBpdHNlbGYuDQo+IA0K
PiBBcyBJIHVuZGVyc3RhbmQgaXQgdGhlIE1NQVBCQVRDSCBpb2N0bCBpcyBiZWluZyB0cmVh
dGVkIGxpa2UgZXZlcnkgb3RoZXINCj4gaHlwZXJjYWxsIHByb3h5IHRocm91Z2ggdGhlIGlv
Y3RsIGludGVyZmFjZS4gV2hpY2ggbWFrZXMgc2Vuc2UgZnJvbSB0aGUNCj4gcG9pbnQgb2Yg
dmlldyBvZiBoYXZpbmcgYSBjb25zaXN0ZW50IGludGVyZmFjZSB0byB0aGUgaHlwZXJ2aXNv
ciBidXQgbm90DQo+IGZyb20gcG9pbnQgb2YgdmlldyBvZiBwcm92aWRpbmcgYSBjb25zaXN0
ZW50IHVzZXJzcGFjZSBpbnRlcmZhY2UgZm9yDQo+IG1hcHBpbmcgbWVtb3J5IHdoaWNoIGRv
ZXNuJ3QgY2FyZSBhYm91dCB0aGUgaHlwZXJ2aXNvciBkZXRhaWxzLg0KPiANCj4gVGhlIHBy
aXZjbWRfbW1hcGJhdGNoX3YyIGludGVyZmFjZSBpcyBzbGlnaHRseSByaWNoZXIgdGhhbiB3
aGF0IHlvdQ0KPiBjb3VsZCBleHBvc2UgdmlhIG1tYXAoKSBiZWNhdXNlIGl0IGFsbG93cyB0
aGUgaGFuZGxpbmcgb2YgcGFydGlhbA0KPiBtYXBwaW5ncyB3aXRoIHdoYXQgSSBwcmVzdW1l
IGlzIGEgcGVyLXBhZ2UgKmVyciBhcnJheS4gSWYgeW91IGlzc3VlZCB0aGUNCj4gaHlwZXJj
YWxsIGRpcmVjdGx5IGZyb20gdGhlIG1tYXAoKSBhbmQgb25lIG9mIHRoZSBwYWdlcyB3YXNu
J3QgbWFwcGVkIGJ5DQo+IHRoZSBoeXBlcnZpc29yIHlvdSB3b3VsZCBoYXZlIHRvIHVud2lu
ZCBldmVyeXRoaW5nIGJlZm9yZSByZXR1cm5pbmcNCj4gRUZBVUxUIHRvIHRoZSB1c2VyLg0K
PiANCj4+PiBBcmVuJ3Qgd2UgYWJ1c2luZyB0aGUgTGludXggdXNlcnNwYWNlIEFCSSBoZXJl
ID8gQXMgc3RhbmRhcmQgdXNlcnNwYWNlDQo+Pj4gY29kZSB3b3VsZCBleHBlY3QganVzdCBt
bWFwKCkgdG8gYmUgZW5vdWdoIHRvIG1hcCB0aGUgbWVtb3J5LiBZZXMsIHRoZQ0KPj4+IGN1
cnJlbnQgdXNlciwgWGVuIGl0c2VsZiwgaXMgYWRhcHRlZCB0byBtYWtlIHR3byBjYWxscywg
YnV0IGl0IGJyZWFrcw0KPj4+IGFzIHNvb24gYXMgd2Ugd2FudCB0byB1c2Ugc29tZXRoaW5n
IHRoYXQgcmVsaWVzIG9uIExpbnV4IHVzZXJzcGFjZQ0KPj4+IEFCSS4NCj4+Pg0KPj4+IEZv
ciBpbnN0YW5jZSwgaW4gb3VyIGNhc2UsIHdoZXJlIHdlIGFyZSBsb29raW5nIHRvIGNyZWF0
ZQ0KPj4+IGh5cGVydmlzb3ItYWdub3N0aWMgdmlydGlvIGJhY2tlbmRzLCB0aGUgcnVzdC12
bW0gbGlicmFyeSBbMV0gaXNzdWVzDQo+Pj4gbW1hcCgpIG9ubHkgYW5kIGV4cGVjdHMgaXQg
dG8gd29yay4gSXQgZG9lc24ndCBrbm93IGl0IGlzIHJ1bm5pbmcgb24gYQ0KPj4+IFhlbiBz
eXN0ZW0sIGFuZCBpdCBzaG91bGRuJ3Qga25vdyB0aGF0IGFzIHdlbGwuDQo+Pg0KPj4gVXNl
IC9kZXYveGVuL2h5cGVyY2FsbCB3aGljaCBoYXMgYSBzYW5lIEFCSSBmb3IgZ2V0dGluZyAi
c2FmZSIgbWVtb3J5Lg0KPj4gcHJpdmNtZCBpcyB2ZXJ5IG11Y2ggbm90IHNhbmUuDQo+Pg0K
Pj4gSW4gcHJhY3RpY2UgeW91J2xsIG5lZWQgdG8gdXNlIGJvdGguwqAgL2Rldi94ZW4vaHlw
ZXJjYWxsIGZvciBnZXR0aW5nDQo+PiAic2FmZSIgbWVtb3J5LCBhbmQgL2Rldi94ZW4vcHJp
dmNtZCBmb3IgaXNzdWluZyBoeXBlcmNhbGxzIGZvciBub3cuDQo+IA0KPiBJJ20gdW5zdXJl
IHdoYXQgaXMgbWVhbnQgYnkgc2FmZSBtZW1vcnkgaGVyZS4gcHJpdmNtZF9idWZfbW1hcCgp
IGxvb2tzDQo+IGxpa2UgaXQganVzdCBhbGxvY2F0ZXMgYSBidW5jaCBvZiBHRlBfS0VSTkVM
IHBhZ2VzIHJhdGhlciB0aGFuDQo+IGludGVyYWN0aW5nIHdpdGggdGhlIGh5cGVydmlzb3Ig
ZGlyZWN0bHkuIEFyZSB0aGVzZSB0aGUgc2FtZSBwYWdlcyB0aGF0DQo+IGdldCB1c2VkIHdo
ZW4geW91IGV2ZW50dWFsbHkgY2FsbCBwcml2Y21kX2lvY3RsX21tYXBfYmF0Y2goKT8NCg0K
cHJpdmNtZF9idWZfbW1hcCgpIGlzIGFsbG9jYXRpbmcga2VybmVsIHBhZ2VzIHdoaWNoIGFy
ZSB1c2VkIGZvciBkYXRhIGJlaW5nDQphY2Nlc3NlZCBieSB0aGUgaHlwZXJ2aXNvciB3aGVu
IGRvaW5nIHRoZSBoeXBlcmNhbGwgbGF0ZXIuIFRoaXMgaXMgYSBnZW5lcmljDQppbnRlcmZh
Y2UgYmVpbmcgdXNlZCBmb3IgYWxsIGh5cGVyY2FsbHMsIG5vdCBvbmx5IGZvcg0KcHJpdmNt
ZF9pb2N0bF9tbWFwX2JhdGNoKCkuDQoNCj4gVGhlIGZhY3QgdGhhdCAvZGV2L3hlbi9oeXBl
cmNhbGwgaXMgc3BlY2lmaWVkIGJ5IHhlbl9wcml2Y21kYnVmX2RldiBpcyBhDQo+IGxpdHRs
ZSBjb25mdXNpbmcgVEJILg0KPiANCj4gQW55d2F5IHRoZSBnb2FsIGhlcmUgaXMgdG8gcHJv
dmlkZSBhIG5vbi14ZW4gYXdhcmUgdXNlcnNwYWNlIHdpdGgNCj4gc3RhbmRhcmQgdXNlcnNw
YWNlIEFQSSB0byBhY2Nlc3MgdGhlIGd1ZXN0cyBtZW1vcnkuIFBlcmhhcHMgbWVzc2luZw0K
DQpUaGlzIGlzIHdoYXQgdGhlIFhlbiByZWxhdGVkIGxpYnJhcmllcyBhcmUgbWVhbnQgZm9y
LiBZb3VyIGRlY2lzaW9uIHRvDQppZ25vcmUgdGhvc2UgaXMgZmlyaW5nIGJhY2sgbm93Lg0K
DQo+IGFyb3VuZCB3aXRoIHRoZSBzZW1hbnRpY3Mgb2YgdGhlIC9kZXYveGVuL1toeXBlcmNh
bGx8cHJpdmNtZF0gZGV2aWNlcw0KPiBub2RlcyBpcyB0b28gY29uZnVzaW5nLg0KPiANCj4g
TWF5YmUgd2UgY291bGQgaW5zdGVhZDoNCj4gDQo+ICAgMS4gSGF2ZSB0aGUgWGVuIGF3YXJl
IFZNTSBhc2sgdG8gbWFrZSB0aGUgZ3Vlc3RzIG1lbW9yeSB2aXNpYmxlIHRvIHRoZQ0KPiAg
ICAgIGhvc3Qga2VybmVscyBhZGRyZXNzIHNwYWNlLg0KDQpVcmdoLiBUaGlzIHdvdWxkIGJl
IGEgbWFqb3IgYnJlYWNoIG9mIHRoZSBYZW4gc2VjdXJpdHkgY29uY2VwdC4NCg0KPiAgIDIu
IFdoZW4gdGhpcyBpcyBkb25lIGV4cGxpY2l0bHkgY3JlYXRlIGEgZGV2aWNlIG5vZGUgdG8g
cmVwcmVzZW50IGl0ICgvZGV2L3hlbi9kb20tJWQtbWVtPykNCj4gICAzLiBQYXNzIHRoaXMg
bmV3IGRldmljZSB0byB0aGUgbm9uLVhlbiBhd2FyZSB1c2Vyc3BhY2Ugd2hpY2ggdXNlcyB0
aGUNCj4gICAgICBzdGFuZGFyZCBtbWFwKCkgY2FsbCB0byBtYWtlIHRoZSBrZXJuZWwgcGFn
ZXMgdmlzaWJsZSB0byB1c2Vyc3BhY2UNCj4gDQo+IERvZXMgdGhhdCBtYWtlIHNlbnNlPw0K
DQpNYXliZSBmcm9tIHlvdXIgcG9pbnQgb2YgdmlldywgYnV0IG5vdCBmcm9tIHRoZSBYZW4g
YXJjaGl0ZWN0dXJhbCBwb2ludA0Kb2YgdmlldyBJTUhPLiBZb3UgYXJlIHJlbW92aW5nIGJh
c2ljYWxseSB0aGUgbWFpbiBzZWN1cml0eSBhZHZhbnRhZ2VzIG9mDQpYZW4gYnkgZ2VuZXJh
dGluZyBhIGtlcm5lbCBpbnRlcmZhY2UgZm9yIG1hcHBpbmcgYXJiaXRyYXJ5IGd1ZXN0IG1l
bW9yeQ0KZWFzaWx5Lg0KDQoNCkp1ZXJnZW4NCg==
--------------GktwBuYoZ7oHkRXKPGX0zmPh
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------GktwBuYoZ7oHkRXKPGX0zmPh--

--------------efGMsH72wo5zNuNTvk5XkPzr--

--------------MpJZX2ld0j0gIOVsGyyHovhq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMGIo4FAwAAAAAACgkQsN6d1ii/Ey/O
OQf/fDOdg5RkrXQaZUkI3opgwnM54hLT6R566jqb2mA5FoZaoFWkZKER2DIO5PkFJaYgQbvs3kLz
B2Ar1eF4P0x/i5Mr790A66WEarLlQEGdLiSqcmPY4FDkeNrvsyCAngShEjEQ58OYgOJ7hplWmmZx
kg6XKBDqnbptSvM0P/ui+mLV/rLVLf/tdE8Jjb5HQgUYh+IOSe+rmkAO3f34LiVdHdv2MrIIFlz7
EPUdNf4SjGP+zT1s/r0aDr48qPOz0EaTdEzxRm407fXVpd6tOEWptQZdxLP7D7dbv5VCYO3HeDdu
GMCkg85jalClcv7L7GEwFuF61kWZsNspTaqXmA/sVQ==
=wSP1
-----END PGP SIGNATURE-----

--------------MpJZX2ld0j0gIOVsGyyHovhq--

