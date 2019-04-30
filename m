Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A49FB0F
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 16:09:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLTOF-0005J0-Ct; Tue, 30 Apr 2019 14:05:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xzkl=TA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hLTOD-0005It-LV
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 14:05:45 +0000
X-Inumbo-ID: 0b451047-6b51-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0b451047-6b51-11e9-843c-bc764e045a96;
 Tue, 30 Apr 2019 14:05:44 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 30 Apr 2019 08:05:43 -0600
Message-Id: <5CC85633020000780022A804@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 30 Apr 2019 08:05:39 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Ian Jackson" <ian.jackson@citrix.com>
References: <osstest-135420-mainreport@xen.org>
 <23752.17186.527512.614163@mariner.uk.xensource.com>
In-Reply-To: <23752.17186.527512.614163@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] linux 4.19 does not build on armhf Re: [linux-4.19
 test] 135420: regressions - FAIL
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDMwLjA0LjE5IGF0IDE0OjQ0LCA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4gd3JvdGU6
Cj4gb3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyaXRlcyAoIltsaW51eC00LjE5IHRlc3RdIDEzNTQy
MDogcmVncmVzc2lvbnMgLSBGQUlMIik6Cj4+IGZsaWdodCAxMzU0MjAgbGludXgtNC4xOSByZWFs
IFtyZWFsXQo+PiBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xv
Z3MvMTM1NDIwLyAKPj4gCj4+IFJlZ3Jlc3Npb25zIDotKAo+PiAKPj4gVGVzdHMgd2hpY2ggZGlk
IG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCj4+IGluY2x1ZGluZyB0ZXN0cyB3aGljaCBj
b3VsZCBub3QgYmUgcnVuOgo+PiAgYnVpbGQtYXJtaGYtcHZvcHMgICAgICAgICAgICAgNiBrZXJu
ZWwtYnVpbGQgICAgICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTI5MzEzCj4gCj4gaHR0cDovL2xv
Z3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEzNTQyMC9idWlsZC1hcm1o
Zi1wdm9wcy82LnRzLWtlcm5lbC1idWlsZC5sb2cKPiAKPiAgIGRyaXZlcnMvZmlybXdhcmUvcWNv
bV9zY20uYzogSW4gZnVuY3Rpb24gw6LigqzLnHFjb21fc2NtX2Fzc2lnbl9tZW3DouKCrOKEojoK
PiAgIGRyaXZlcnMvZmlybXdhcmUvcWNvbV9zY20uYzo0Njk6NDc6IGVycm9yOiBwYXNzaW5nIGFy
Z3VtZW50IDMgb2YgCj4gw6LigqzLnGRtYV9hbGxvY19jb2hlcmVudMOi4oKs4oSiIGZyb20gaW5j
b21wYXRpYmxlIHBvaW50ZXIgdHlwZSAKPiBbLVdlcnJvcj1pbmNvbXBhdGlibGUtcG9pbnRlci10
eXBlc10KPiAgICAgcHRyID0gZG1hX2FsbG9jX2NvaGVyZW50KF9fc2NtLT5kZXYsIHB0cl9zeiwg
JnB0cl9waHlzLCBHRlBfS0VSTkVMKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXgo+ICAgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGRyaXZlcnMvZmly
bXdhcmUvcWNvbV9zY20uYzoyMTowOgo+ICAgLi9pbmNsdWRlL2xpbnV4L2RtYS1tYXBwaW5nLmg6
NTYwOjIxOiBub3RlOiBleHBlY3RlZCDDouKCrMucZG1hX2FkZHJfdCAqIHtha2EgCj4gbG9uZyBs
b25nIHVuc2lnbmVkIGludCAqfcOi4oKs4oSiIGJ1dCBhcmd1bWVudCBpcyBvZiB0eXBlIMOi4oKs
y5xwaHlzX2FkZHJfdCAqIHtha2EgCj4gdW5zaWduZWQgaW50ICp9w6LigqzihKIKPiAgICBzdGF0
aWMgaW5saW5lIHZvaWQgKmRtYV9hbGxvY19jb2hlcmVudChzdHJ1Y3QgZGV2aWNlICpkZXYsIHNp
emVfdCBzaXplLAo+ICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+Cj4g
ICBjYzE6IHNvbWUgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMKClRoZSBjb2RlIGlz
IHN0aWxsIHRoZSBzYW1lIGluIDUuMS1yYzcsIHNvIHByZXN1bWFibHkgdGhlIHByb2JsZW0gd2Vu
dAp1bm5vdGljZWQgdGlsbCBub3cuIFdoaWxlIGl0IGxvb2tzIGxpa2UgaXQncyBzdHJhaWdodGZv
cndhcmQgdG8gZml4ICh0aGFua3MKdG8gdGhlIDMyLWJpdCB2YXJpYW50IG9mIF9fcWNvbV9zY21f
YXNzaWduX21lbSgpIGRvaW5nIG5vdGhpbmcKd2l0aCB0aGUgcGFzc2VkIGluIHZhbHVlcywgc28g
aXQgYmVpbmcgImZpbmUiIGZvciB0aGVtIHRvIGdldCB0cnVuY2F0ZWQKZHVyaW5nIHRoZSBjYWxs
KSB0aGUgYXNwZWN0IHRoYXQgcHV6emxlcyBtZSBpcyAtIHdoZXJlIGRvZXMgdGhpcwotV2Vycm9y
PWluY29tcGF0aWJsZS1wb2ludGVyLXR5cGVzIGNvbWUgZnJvbT8gV2FzIHRoZSBwcmlvciBnY2MK
dmVyc2lvbiBpbmRlZWQgNC45Lnggb3Igb2xkZXIgKHdoaWNoIHNlZW1zIHByZXR0eSBvbGQgdG8g
bWUpPyBUaGUKc3BlY2lmaWMgd2FybmluZyBjb250cm9sICh3aGljaCBMaW51eCBjb252ZXJ0cyB0
byBhbiBlcnJvcikgd2FzCmludHJvZHVjZWQgZm9yIGdjYyA1LnguCgpKYW4KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
