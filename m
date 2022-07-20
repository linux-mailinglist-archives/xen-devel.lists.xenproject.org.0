Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D7D57B01C
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 06:50:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.371315.603160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE1e6-0006ot-Gc; Wed, 20 Jul 2022 04:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 371315.603160; Wed, 20 Jul 2022 04:49:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oE1e6-0006mz-Dp; Wed, 20 Jul 2022 04:49:14 +0000
Received: by outflank-mailman (input) for mailman id 371315;
 Wed, 20 Jul 2022 04:49:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQs8=XZ=dalessio.org=chris@srs-se1.protection.inumbo.net>)
 id 1oE1e4-0006mt-PE
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 04:49:13 +0000
Received: from mail116c40.carrierzone.com (mail116c40.carrierzone.com
 [209.235.151.136]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48aa646b-07e7-11ed-924f-1f966e50362f;
 Wed, 20 Jul 2022 06:49:09 +0200 (CEST)
Received: from [192.168.1.93] (172-125-173-116.lightspeed.rlghnc.sbcglobal.net
 [172.125.173.116]) (authenticated bits=0)
 by mail116c40.carrierzone.com (8.14.9/8.13.1) with ESMTP id 26K4muXc067471;
 Wed, 20 Jul 2022 04:48:58 +0000
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
X-Inumbo-ID: 48aa646b-07e7-11ed-924f-1f966e50362f
X-Authenticated-User: chris@dalessio.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=carrierzone.com;
	s=mailmia; t=1658292539;
	bh=R8TkUJtj2xWiQgvW+rwYSUNctkxQ3CNxC3ba4GXunDg=;
	h=Date:Subject:In-Reply-To:From:To:Cc:From;
	b=tqVmJc2LEusHeQtkZ27V3A9eC0tZOCUNHrN8SWyEyegA/7MciwVM+nTizvnogihgK
	 T67Nhc0HUloKqYSCVLUkgrI0BRCKxNDN/MN+As91J0MXY56zUn7LaLlAVN9vwhcCEr
	 Rz3LWyPh+ZEj35oxb2klILs3JT5H8j7nOjyzqFtk=
Feedback-ID:chris@dalessio.
Message-Id: <202207200448.26K4muXc067471@mail116c40.carrierzone.com>
SavedFromEmail: chris@dalessio.org
Date: Wed, 20 Jul 2022 00:48:56 -0400
Subject: Re: Panic on CPU 0: FATAL TRAP: vec 7, #NM[0000]
In-Reply-To: <c78ac716-ade3-5f0a-7fdd-27e48285bf1d@citrix.com>
Importance: normal
From: ChrisD <chris@dalessio.org>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Michael Young <m.a.young@durham.ac.uk>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="--_com.samsung.android.email_3406098329667320"
X-CTCH-RefID: str=0001.0A702F28.62D7893B.0087:SCFSTAT96973171,ss=1,re=-4.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
X-CTCH-VOD: Unknown
X-CTCH-Spam: Unknown
X-CTCH-Score: -4.000
X-CTCH-Rules: 
X-CTCH-Flags: 0
X-CTCH-ScoreCust: 0.000
X-Origin-Country: US

----_com.samsung.android.email_3406098329667320
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

U28sIHlvdSB0aGluayBpdCdzIGEgcHJvYmxlbSB3aXRoIGZjMzY/Ci0tLS0tLS0tIE9yaWdpbmFs
IG1lc3NhZ2UgLS0tLS0tLS1Gcm9tOiBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRy
aXguY29tPiBEYXRlOiA3LzE4LzIyICA2OjI1IFBNICAoR01ULTA1OjAwKSBUbzogY2hyaXNAZGFs
ZXNzaW8ub3JnLCB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcgQ2M6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4sIE1pY2hhZWwgWW91bmcgPG0uYS55b3VuZ0BkdXJoYW0uYWMu
dWs+IFN1YmplY3Q6IFJlOiBQYW5pYyBvbiBDUFUgMDogRkFUQUwgVFJBUDogdmVjIDcsICNOTVsw
MDAwXSBPbiAxOC8wNy8yMDIyIDIyOjMxLCBjaHJpc0BkYWxlc3Npby5vcmcgd3JvdGU6PiBJIGFt
IHRyeWluZyB0byBydW4gWGVuLTQuMTYuMS00LmZjMzYgb24gRmVkb3JhIDM2IG9uIGEgYnJhbmQg
bmV3IExlbm92bz4gVGhpbmtTdGF0aW9uIHA2MjAsIGJ1dCBJIGtlZXAgZ2V0dGluZyB0aGUgZm9s
bG93aW5nIGVycm9yIGJvb3RpbmcgdGhlPiBYZW4ga2VybmVsLj4gPiBQYW5pYyBvbiBDUFUgMDo+
IEZBVEFMIFRSQVA6IHZlYyA3LCAjTk1bMDAwMF0+PiBWZXJzaW9uIGluZm86PiBOYW1lIMKgIMKg
IMKgIMKgOiB4ZW4+IFZlcnNpb24gwqAgwqAgOiA0LjE2LjE+IFJlbGVhc2UgwqAgwqAgOiA0LmZj
MzZTbyBodHRwczovL2tvamkuZmVkb3JhcHJvamVjdC5vcmcva29qaS9idWlsZGluZm8/YnVpbGRJ
RD0xOTkxMTgyIHNob3VsZGJlIHRoZSBiaW5hcnkgYnVpbGQgaW4gdXNlLCBhbmQgbG9va2luZyBh
dCB0aGUgZGVidWcgc3ltcywgaXQgcmVhbGx5ZG9lcyBoYXZlOmZmZmY4MmQwNDA0MzljODAgPGFt
ZF9pb21tdV9pbml0PjouLi5mZmZmODJkMDQwNDNhMDBjOsKgwqDCoMKgwqDCoCAwZiA2ZSBjMsKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtb3ZkwqDCoCAlZWR4LCVtbTBmZmZmODJkMDQw
NDNhMDBmOsKgwqDCoMKgwqDCoCAwZiA2MiBjMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBwdW5wY2tsZHEgJW1tMCwlbW0wZmZmZjgyZDA0MDQzYTAxMjrCoMKgwqDCoMKgwqAgNDkgODkg
ODcgYzAgMDAgMDAgMDDCoMKgwqAgbW92wqDCoMKgICVyYXgsMHhjMCglcjE1KWZmZmY4MmQwNDA0
M2EwMTk6wqDCoMKgwqDCoMKgIDQxIDBmIDdmIDg3IGQwIDAwIDAwwqDCoMKgIG1vdnHCoMKgICVt
bTAsMHhkMCglcjE1KWZmZmY4MmQwNDA0M2EwMjA6wqDCoMKgwqDCoMKgIDAwU28gaGFyZHdhcmUg
aXMgY29ycmVjdCAtIHRoaXMgYnVpbGQgb2YgWGVuIGlzIG5vbnNlbnNlLlRoZSBiaW5hcnkgaXMg
YWxzbyBmdWxsIG9mIC5hbm5vYmluXyBzdHVmZiB3aGljaCBhcHBlYXJzIHRvIGJlIHNvbWUga2lu
ZG9mIEdDQyBwbHVnaW4gZm9yIHdhdGVybWFya2luZy5NaWNoYWVsOiBBbnkgaWRlYSB3aGF0J3Mg
Z29pbmcgb24gaGVyZT/CoCBTb21ldGhpbmcgaGFzIGNhdXNlZCBHQ0MgdG9lbWl0IHNvbWUgTU1Y
IGxvZ2ljIHdoaWNoIGlzIHVsdGltYXRlbHkgd2h5IHRoaW5ncyBleHBsb2RlZCwgYnV0IHRoaXNw
cm9iYWJseSBtZWFucyB0aGF0IHNvbWUgb2YgdGhlIGJ1aWxkIENGTEFHUyBnb3QgZHJvcHBlZC5U
aGFua3MsfkFuZHJldw==

----_com.samsung.android.email_3406098329667320
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGh0bWw+PGhlYWQ+PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0
L2h0bWw7IGNoYXJzZXQ9VVRGLTgiPjwvaGVhZD48Ym9keSBkaXI9ImF1dG8iPlNvLCB5b3UgdGhp
bmsgaXQncyBhIHByb2JsZW0gd2l0aCBmYzM2PzxkaXY+PGJyPjwvZGl2PjxkaXYgYWxpZ249Imxl
ZnQiIGRpcj0iYXV0byIgc3R5bGU9ImZvbnQtc2l6ZToxMDAlO2NvbG9yOiMwMDAwMDAiPjxkaXY+
LS0tLS0tLS0gT3JpZ2luYWwgbWVzc2FnZSAtLS0tLS0tLTwvZGl2PjxkaXY+RnJvbTogQW5kcmV3
IENvb3BlciAmbHQ7QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbSZndDsgPC9kaXY+PGRpdj5EYXRl
OiA3LzE4LzIyICA2OjI1IFBNICAoR01ULTA1OjAwKSA8L2Rpdj48ZGl2PlRvOiBjaHJpc0BkYWxl
c3Npby5vcmcsIHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyA8L2Rpdj48ZGl2PkNjOiBK
YW4gQmV1bGljaCAmbHQ7amJldWxpY2hAc3VzZS5jb20mZ3Q7LCBNaWNoYWVsIFlvdW5nICZsdDtt
LmEueW91bmdAZHVyaGFtLmFjLnVrJmd0OyA8L2Rpdj48ZGl2PlN1YmplY3Q6IFJlOiBQYW5pYyBv
biBDUFUgMDogRkFUQUwgVFJBUDogdmVjIDcsICNOTVswMDAwXSA8L2Rpdj48ZGl2Pjxicj48L2Rp
dj48L2Rpdj5PbiAxOC8wNy8yMDIyIDIyOjMxLCBjaHJpc0BkYWxlc3Npby5vcmcgd3JvdGU6PGJy
PiZndDsgSSBhbSB0cnlpbmcgdG8gcnVuIFhlbi00LjE2LjEtNC5mYzM2IG9uIEZlZG9yYSAzNiBv
biBhIGJyYW5kIG5ldyBMZW5vdm88YnI+Jmd0OyBUaGlua1N0YXRpb24gcDYyMCwgYnV0IEkga2Vl
cCBnZXR0aW5nIHRoZSBmb2xsb3dpbmcgZXJyb3IgYm9vdGluZyB0aGU8YnI+Jmd0OyBYZW4ga2Vy
bmVsLjxicj4mZ3Q7IDxicj4mZ3Q7IFBhbmljIG9uIENQVSAwOjxicj4mZ3Q7IEZBVEFMIFRSQVA6
IHZlYyA3LCAjTk1bMDAwMF08YnI+Jmd0Ozxicj4mZ3Q7IFZlcnNpb24gaW5mbzo8YnI+Jmd0OyBO
YW1lICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOzogeGVuPGJyPiZndDsgVmVyc2lvbiAmbmJz
cDsgJm5ic3A7IDogNC4xNi4xPGJyPiZndDsgUmVsZWFzZSAmbmJzcDsgJm5ic3A7IDogNC5mYzM2
PGJyPjxicj5TbyBodHRwczovL2tvamkuZmVkb3JhcHJvamVjdC5vcmcva29qaS9idWlsZGluZm8/
YnVpbGRJRD0xOTkxMTgyIHNob3VsZDxicj5iZSB0aGUgYmluYXJ5IGJ1aWxkIGluIHVzZSwgYW5k
IGxvb2tpbmcgYXQgdGhlIGRlYnVnIHN5bXMsIGl0IHJlYWxseTxicj5kb2VzIGhhdmU6PGJyPjxi
cj5mZmZmODJkMDQwNDM5YzgwICZsdDthbWRfaW9tbXVfaW5pdCZndDs6PGJyPi4uLjxicj5mZmZm
ODJkMDQwNDNhMDBjOiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAwZiA2ZSBj
MiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBtb3ZkJm5ic3A7Jm5ic3A7ICVlZHgs
JW1tMDxicj5mZmZmODJkMDQwNDNhMDBmOiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyAwZiA2MiBjMCZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBwdW5wY2tsZHEg
JW1tMCwlbW0wPGJyPmZmZmY4MmQwNDA0M2EwMTI6Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7IDQ5IDg5IDg3IGMwIDAwIDAwIDAwJm5ic3A7Jm5ic3A7Jm5ic3A7IG1vdiZuYnNw
OyZuYnNwOyZuYnNwOyAlcmF4LDB4YzAoJXIxNSk8YnI+ZmZmZjgyZDA0MDQzYTAxOTombmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgNDEgMGYgN2YgODcgZDAgMDAgMDAmbmJzcDsm
bmJzcDsmbmJzcDsgbW92cSZuYnNwOyZuYnNwOyAlbW0wLDB4ZDAoJXIxNSk8YnI+ZmZmZjgyZDA0
MDQzYTAyMDombmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgMDA8YnI+PGJyPlNv
IGhhcmR3YXJlIGlzIGNvcnJlY3QgLSB0aGlzIGJ1aWxkIG9mIFhlbiBpcyBub25zZW5zZS48YnI+
PGJyPlRoZSBiaW5hcnkgaXMgYWxzbyBmdWxsIG9mIC5hbm5vYmluXyBzdHVmZiB3aGljaCBhcHBl
YXJzIHRvIGJlIHNvbWUga2luZDxicj5vZiBHQ0MgcGx1Z2luIGZvciB3YXRlcm1hcmtpbmcuPGJy
Pjxicj5NaWNoYWVsOiBBbnkgaWRlYSB3aGF0J3MgZ29pbmcgb24gaGVyZT8mbmJzcDsgU29tZXRo
aW5nIGhhcyBjYXVzZWQgR0NDIHRvPGJyPmVtaXQgc29tZSBNTVggbG9naWMgd2hpY2ggaXMgdWx0
aW1hdGVseSB3aHkgdGhpbmdzIGV4cGxvZGVkLCBidXQgdGhpczxicj5wcm9iYWJseSBtZWFucyB0
aGF0IHNvbWUgb2YgdGhlIGJ1aWxkIENGTEFHUyBnb3QgZHJvcHBlZC48YnI+PGJyPlRoYW5rcyw8
YnI+PGJyPn5BbmRyZXc8YnI+PGJyPjwvYm9keT48L2h0bWw+

----_com.samsung.android.email_3406098329667320--


