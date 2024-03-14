Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 315F587B941
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 09:28:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692968.1080747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkgRN-0005q6-Q7; Thu, 14 Mar 2024 08:27:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692968.1080747; Thu, 14 Mar 2024 08:27:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkgRN-0005oH-NX; Thu, 14 Mar 2024 08:27:53 +0000
Received: by outflank-mailman (input) for mailman id 692968;
 Thu, 14 Mar 2024 08:13:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NhVs=KU=zamaudio.com=damien@srs-se1.protection.inumbo.net>)
 id 1rkgDK-0002aN-WA
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 08:13:23 +0000
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7044d2d-e1da-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 09:13:19 +0100 (CET)
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
X-Inumbo-ID: b7044d2d-e1da-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zamaudio.com;
	s=protonmail2; t=1710403996; x=1710663196;
	bh=QX53ikl/A6rMwZE/LD2LcGZ0Q9sfRlbAsySKSrfXqK4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=V0Kck0tDfBs4pvj9H1hF6PLb9iAB4i695ciID5PLM1yecDAwThq37UUSgD0dzxDPu
	 GobFkvPpWVTtjze+9jWhoqklXe1M44QBmAkB23RcW3tWd1dDjhXHkxtzWWdGZYhjbo
	 t7l3/R/Tmx9SyXBG/wOz4pXh0EW4cnbIt12f9/qdmqD4G+cxh0ZYHDJOmhGRNvJu24
	 Uc7yL8DsaEYVxUtMgsbcbGGi80/+BiktE+kEaUV+r0Ll9FotioYrH+cuHEnwlKGIbh
	 ONh8nvLBHTXoWYPvbOg0dGDeh50yTmNyaw4htiqi2QwooqRCce5UvgssGKvGuCoPhC
	 WnWGa+h0CoqRA==
Date: Thu, 14 Mar 2024 08:12:55 +0000
To: grub-devel@gnu.org, ross.lagerwall@citrix.com
From: Damien Zammit <damien@zamaudio.com>
Cc: jbeulich@suse.com, xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, daniel.kiper@oracle.com
Subject: Re: [PATCH 1/7] multiboot2: Add load type header and support for the PE binary type
Message-ID: <AF72X2ysQoPQwSN_InXfIHzizVxNQs0hUR86S4yu_BZgD9iYFNosWTrYx9W5LW3MsdasBvKu6rugHbbVFFv18dRjcJBsqTdaYsZdVsEUbF8=@zamaudio.com>
In-Reply-To: <c6e79962-0537-4ed8-b99f-f2614f5a7987@suse.com>
References: <20240313150748.791236-1-ross.lagerwall@citrix.com> <20240313150748.791236-2-ross.lagerwall@citrix.com> <c6e79962-0537-4ed8-b99f-f2614f5a7987@suse.com>
Feedback-ID: 43209410:user:proton
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1_5UKU0ZFo1nzlsuNs6kMAoj1fU1IoP1eCT3hclJ8"

This is a multi-part message in MIME format.

--b1_5UKU0ZFo1nzlsuNs6kMAoj1fU1IoP1eCT3hclJ8
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SGksIEkgc2F3IHRoaXMgb24gdGhlIGxpc3QgYW5kIGhhdmUgY29uY2VybnM6CgotLS0tLS0tLSBP
cmlnaW5hbCBNZXNzYWdlIC0tLS0tLS0tCk9uIDE0IE1hciAyMDI0LCA2OjI04oCvcG0sIEphbiBC
ZXVsaWNoIHZpYSBHcnViLWRldmVsIDwgZ3J1Yi1kZXZlbEBnbnUub3JnPiB3cm90ZToKT24gMTMu
MDMuMjAyNCAxNjowNywgUm9zcyBMYWdlcndhbGwgd3JvdGU6Cj4+IEluIGFkZGl0aW9uIHRvIHRo
ZSBleGlzdGluZyBhZGRyZXNzIGFuZCBFTEYgbG9hZCB0eXBlcywgc3BlY2lmeSBhIG5ldwo+PiBv
cHRpb25hbCBQRSBiaW5hcnkgbG9hZCB0eXBlLiBUaGlzIG5ldyB0eXBlIGlzIGEgdXNlZnVsIGFk
ZGl0aW9uIHNpbmNlCj4+IFBFIGJpbmFyaWVzIGNhbiBiZSBzaWduZWQgYW5kIHZlcmlmaWVkIChp
LmUuIHVzZWQgd2l0aCBTZWN1cmUgQm9vdCkuCgo+IEFuZCB0aGUgY29uc2lkZXJhdGlvbiB0byBo
YXZlIEVMRiBzaWduYWJsZSAoYnkgd2hhdGV2ZXIgZXh0ZW5zaW9uIHRvIHRoZSBFTEYgc3BlYykg
d2VudCBub3doZXJlPyBKYW4KCklmIHRoZSBwdXJwb3NlIG9mIHNpZ25pbmcgYmluYXJpZXMgaXMg
dG8gcHJldmVudCB0aGVpciBleGVjdXRpb24gdW5sZXNzIHRoZXkgYXJlIHNpZ25lZCBieSB0aGVp
ciBvd25lciwgdGhpcyBpcyBNQUxXQVJFIHVubGVzcyB0aGUgZW5kIHVzZXIgY2FuIHJlcGxhY2Ug
dGhlIGtleXMgd2l0aCBvbmUgb2YgdGhlaXIgY2hvb3NpbmcuCkFkZGluZyBhIGZpZWxkIHRvIGVs
ZiB0byBwcm92aWRlIHRoaXMgZmVhdHVyZSBpcyBJTUhPIGFza2luZyBmb3IgdHJvdWJsZSBiZWNh
dXNlIHRoZSBrZXkgaXMgc3RvcmVkIGVsc2V3aGVyZSBhbmQgdGhlcmUgaXMgbm90aGluZyB0byBw
cmV2ZW50IGFidXNlIG9mIHRoaXMgZmllbGQgdG8gZGVueSB1c2VycyB0aGVpciBmcmVlZG9tIHRv
IHJ1biBjb2RlLCAoaWUgYnkgbm90IHByb3ZpZGluZyB0aGVtIHRoZSBrZXkgb3IgYSBndWFyYW50
ZWVkIG1lY2hhbmlzbSBmb3IgcHJvdmlkaW5nIHRoZWlyIG93bikuCgpPbiB0aGF0IG5vdGUsIHdo
eSBpcyBpdCBzdWNoIGEgdXNlZnVsIGZlYXR1cmUgdG8gcmVzdHJpY3QgdGhlIGZyZWVkb20gdG8g
cnVuIGNvZGUgaW4gZ3J1Yj8gSWYgZ3J1YiBzZWxlY3RzIG1hbHdhcmUgdG8gZXhlY3V0ZSwgdGhl
IHVzZXIgbXVzdCBoYXZlIGNob3NlbiB0byBydW4gaXQgLSBvciBncnViIGl0c2VsZiBpcyBjb21w
cm9taXNlZD8KCkRvIHlvdSB0aGluayB0aGF0IGxvY2tpbmcgYmluYXJpZXMgZG93biBpcyB0aGUg
ZnV0dXJlIGZvciB1c2VycyB0byBlbnN1cmUgdGhlaXIgb3duIHNlY3VyaXR5IG9yIGl0IGlzIGFj
Y2VwdGFibGUgZm9yIDNyZCBwYXJ0aWVzIHRvIGhpZGUgcGxhdGZvcm0ga2V5cyB0byBsb2NrIGFs
bCBzeXN0ZW1zIGRvd24sIGV2ZW4gYnkgYmluYXJ5PwoKSSdtIG5vdCBjb252aW5jZWQuCgpEYW1p
ZW4gWmFtbWl0CkdOVS9IdXJkIGhhY2tlcg==

--b1_5UKU0ZFo1nzlsuNs6kMAoj1fU1IoP1eCT3hclJ8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

SGksIEkgc2F3IHRoaXMgb24gdGhlIGxpc3QgYW5kIGhhdmUgY29uY2VybnM6PGJyPjxicj4tLS0t
LS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tLS0tPGJyPk9uIDE0IE1hciAyMDI0LCA2OjI04oCv
cG0sIEphbiBCZXVsaWNoIHZpYSBHcnViLWRldmVsICZsdDsgZ3J1Yi1kZXZlbEBnbnUub3JnJmd0
OyB3cm90ZTo8YnI+T24gMTMuMDMuMjAyNCAxNjowNywgUm9zcyBMYWdlcndhbGwgd3JvdGU6IDxi
cj4mZ3Q7Jmd0OyBJbiBhZGRpdGlvbiB0byB0aGUgZXhpc3RpbmcgYWRkcmVzcyBhbmQgRUxGIGxv
YWQgdHlwZXMsIHNwZWNpZnkgYSBuZXc8YnI+Jmd0OyZndDsgb3B0aW9uYWwgUEUgYmluYXJ5IGxv
YWQgdHlwZS4gVGhpcyBuZXcgdHlwZSBpcyBhIHVzZWZ1bCBhZGRpdGlvbiBzaW5jZSA8YnI+Jmd0
OyZndDsgUEUgYmluYXJpZXMgY2FuIGJlIHNpZ25lZCBhbmQgdmVyaWZpZWQgKGkuZS4gdXNlZCB3
aXRoIFNlY3VyZSBCb290KS48YnI+PGJyPiZndDsgQW5kIHRoZSBjb25zaWRlcmF0aW9uIHRvIGhh
dmUgRUxGIHNpZ25hYmxlIChieSB3aGF0ZXZlciBleHRlbnNpb24gdG8gdGhlIEVMRiBzcGVjKSB3
ZW50IG5vd2hlcmU/IEphbiA8YnI+PGJyPklmIHRoZSBwdXJwb3NlIG9mIHNpZ25pbmcgYmluYXJp
ZXMgaXMgdG8gcHJldmVudCB0aGVpciBleGVjdXRpb24gdW5sZXNzIHRoZXkgYXJlIHNpZ25lZCBi
eSB0aGVpciBvd25lciwgdGhpcyBpcyBNQUxXQVJFIHVubGVzcyB0aGUgZW5kIHVzZXIgY2FuIHJl
cGxhY2UgdGhlIGtleXMgd2l0aCBvbmUgb2YgdGhlaXIgY2hvb3NpbmcuPGJyPkFkZGluZyBhIGZp
ZWxkIHRvIGVsZiB0byBwcm92aWRlIHRoaXMgZmVhdHVyZSBpcyBJTUhPIGFza2luZyBmb3IgdHJv
dWJsZSBiZWNhdXNlIHRoZSBrZXkgaXMgc3RvcmVkIGVsc2V3aGVyZSBhbmQgdGhlcmUgaXMgbm90
aGluZyB0byBwcmV2ZW50IGFidXNlIG9mIHRoaXMgZmllbGQgdG8gZGVueSB1c2VycyB0aGVpciBm
cmVlZG9tIHRvIHJ1biBjb2RlLCAoaWUgYnkgbm90IHByb3ZpZGluZyB0aGVtIHRoZSBrZXkgb3Ig
YSBndWFyYW50ZWVkIG1lY2hhbmlzbSBmb3IgcHJvdmlkaW5nIHRoZWlyIG93bikuPGJyPjxicj5P
biB0aGF0IG5vdGUsIHdoeSBpcyBpdCBzdWNoIGEgdXNlZnVsIGZlYXR1cmUgdG8gcmVzdHJpY3Qg
dGhlIGZyZWVkb20gdG8gcnVuIGNvZGUgaW4gZ3J1Yj8gIElmIGdydWIgc2VsZWN0cyBtYWx3YXJl
IHRvIGV4ZWN1dGUsIHRoZSB1c2VyIG11c3QgaGF2ZSBjaG9zZW4gdG8gcnVuIGl0IC0gb3IgZ3J1
YiBpdHNlbGYgaXMgY29tcHJvbWlzZWQ/PGJyPjxicj5EbyB5b3UgdGhpbmsgdGhhdCBsb2NraW5n
IGJpbmFyaWVzIGRvd24gaXMgdGhlIGZ1dHVyZSBmb3IgdXNlcnMgdG8gZW5zdXJlIHRoZWlyIG93
biBzZWN1cml0eSBvciBpdCBpcyBhY2NlcHRhYmxlIGZvciAzcmQgcGFydGllcyB0byBoaWRlIHBs
YXRmb3JtIGtleXMgdG8gbG9jayBhbGwgc3lzdGVtcyBkb3duLCBldmVuIGJ5IGJpbmFyeT88YnI+
PGJyPkknbSBub3QgY29udmluY2VkLjxicj48YnI+RGFtaWVuIFphbW1pdDxicj5HTlUvSHVyZCBo
YWNrZXI8YnI+PGJyPjxicj4=


--b1_5UKU0ZFo1nzlsuNs6kMAoj1fU1IoP1eCT3hclJ8--


