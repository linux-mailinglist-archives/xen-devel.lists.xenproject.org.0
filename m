Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A339557E0
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 21:37:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfrDx-0002LI-Pe; Tue, 25 Jun 2019 19:35:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Q93u=UY=gmail.com=pairspace@srs-us1.protection.inumbo.net>)
 id 1hfrDv-0002LD-AW
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 19:35:23 +0000
X-Inumbo-ID: 5f30091e-9780-11e9-8980-bc764e045a96
Received: from mail-io1-xd32.google.com (unknown [2607:f8b0:4864:20::d32])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5f30091e-9780-11e9-8980-bc764e045a96;
 Tue, 25 Jun 2019 19:35:22 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id u13so2449569iop.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2019 12:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=KRYXJ+bBKIAPDf4jIFNXc1wbYrbAA/y8R8dQa4MEmbI=;
 b=WfN4uksa3dnvQo1k8mq8HTysIgyY9JtkxId4+ySg5JIYC1BjXht3yD/Mbxzk4kLTUN
 TQHWdkjv2z5lNmxK9Onex3EC8Py4zmgjDCjcsIhR3wpvj0u6N4jbqBRwc34HIyxBqHhp
 7h1tDskxq2e5ob8864bv3wFB+JkcP4PN0/7hmHW6VPofLydzgfIwrlk606tWUEwSzFGD
 wX18e2HrXVrd8Bjn3oKu/isLQiJGYRcu3VFifMfW0ZAZYe6r+8QLMprrMm6sUpFoZO4E
 C4C+KLLHmckmYX+jZY0f2jT9B8k1k9zji1PRaW3fXx8r0ntsKIFo9xmlwXF/zzqsv6J1
 lklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=KRYXJ+bBKIAPDf4jIFNXc1wbYrbAA/y8R8dQa4MEmbI=;
 b=DlEG/jovK6z0jpxsIDM57affel9zY9ruhhA/d+g/IddrXs4v2v2zxD94wRv+nba+Lv
 315SX/NBsp44lo5KXilKNPZDAHHdAP0JgGqkzNkmOQEOEDL1GbW0uduWV5HI317t4vx6
 uVoNtihmujmpZteFEJ5MbBV3uJudWMf67wqGIa5WoUarzer1p5uNiOOxqt06v3DG/nV5
 QmUYYT3nuwYKC7Ge+SX5GBiwKgQIMy/5+5s4rMmzZnijNY5uzChsGLnRSgFPHr38wltx
 DbjudqGMWsdWDLWXMP3IJYQCX5FpmbDij6o44lVElqfpFjHRHZaYYHQVzitJxfVJt49K
 W5CQ==
X-Gm-Message-State: APjAAAXgt/kPBkLnjWXKmMoGTxePwXqjM/hJmk32Ezdjr7z9o7F+qK2o
 qn6UEQeLSnHhHjquFIuaTmU=
X-Google-Smtp-Source: APXvYqye5upmAI/W9BjmCrOYEcN7mkUs/hQxpkYM0Ew/huIOgyqhSsgXhWdLjJPE+bTzDSpHbNJ4wQ==
X-Received: by 2002:a02:c80d:: with SMTP id p13mr34299498jao.59.1561491321747; 
 Tue, 25 Jun 2019 12:35:21 -0700 (PDT)
Received: from [100.64.73.93] ([205.185.206.113])
 by smtp.gmail.com with ESMTPSA id k5sm15852807ioj.47.2019.06.25.12.35.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Jun 2019 12:35:21 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: P S <pairspace@gmail.com>
X-Mailer: iPad Mail (16F203)
In-Reply-To: <C115C70A-4B61-41FC-BBF4-398C9F1A2CCC@citrix.com>
Date: Tue, 25 Jun 2019 15:35:20 -0400
Message-Id: <695F37D0-ED1A-4D0C-A8D5-5E3689623891@gmail.com>
References: <B591280C-E140-4A3B-AEC0-E86E99525F0C@citrix.com>
 <alpine.DEB.2.21.1906241059191.2468@sstabellini-ThinkPad-T480s>
 <88dee4d2-d7cb-f342-118f-97c37f43f6ff@arm.com>
 <alpine.DEB.2.21.1906241317280.2468@sstabellini-ThinkPad-T480s>
 <20d7c8ce-a149-52c5-ba44-0ff5d8e63419@arm.com>
 <alpine.DEB.2.21.1906241430320.2468@sstabellini-ThinkPad-T480s>
 <90c2cbd6-2b00-03cc-55fd-cbc8ac80cde9@arm.com>
 <BB14443D-9037-4D24-BB69-F94849799AAB@citrix.com>
 <b0d228cd-e01a-4437-7103-2a9f23c9af31@citrix.com>
 <C115C70A-4B61-41FC-BBF4-398C9F1A2CCC@citrix.com>
To: Lars Kurth <lars.kurth@citrix.com>
Subject: Re: [Xen-devel] Migrating key developer docs to xen.git sphinx docs
 and refreshing them in the process
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 Julien Grall <julien.grall@arm.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIEp1biAyNSwgMjAxOSwgYXQgMTI6MzQsIExhcnMgS3VydGggPGxhcnMua3VydGhAY2l0
cml4LmNvbT4gd3JvdGU6Cj4gCj4gCj4gCj4g77u/T24gMjUvMDYvMjAxOSwgMTQ6NDcsICJBbmRy
ZXcgQ29vcGVyIiA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4gCj4+ICAgIE9u
IDI1LzA2LzIwMTkgMTM6MTUsIExhcnMgS3VydGggd3JvdGU6Cj4+IE9uIDI1LzA2LzIwMTksIDEw
OjAzLCAiSnVsaWVuIEdyYWxsIiA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+PiAKPj4+
Pj4gVGhlIHBvaW50IGhlcmUgaXMgdGhhdCB3ZSBjYW4gYmUgZmxleGlibGUgYW5kIGNyZWF0aXZl
IGFib3V0IHRoZSB3YXkgdG8KPj4+Pj4gbWFpbnRhaW4gdGhlIGRvY3Mgb24geGVuLmdpdC4gQnV0
IGFzIGEgdGVjaG5vbG9neSBpcyBjZXJ0YWlubHkgYmV0dGVyCj4+Pj4+IHRoYW4gdGhlIHdpa2k6
IHdlIGRvbid0IGhhdmUgdG8ga2VlcCB0aGVtIGFsbCB1cC10by1kYXRlIHdpdGggdGhlIGNvZGUs
Cj4+Pj4+IGJ1dCBhdCBsZWFzdCB0aGlzIHdheSB3ZSBoYXZlIGEgY2hhbmNlIChpZiB3ZSB3YW50
IHRvKS4gSWYgd2UgbGVhdmUgdGhlbQo+Pj4+PiBvbiB0aGUgd2lraSwgdGhlcmUgaXMgbm8gY2hh
bmNlLgo+Pj4+IAo+Pj4+IEkgY2FuJ3Qgc2VlIGhvdyB4ZW4uZ2l0IGlzIGdvaW5nIHRvIGJlIGJl
dHRlciBpZiAid2UgZG9uJ3QgaGF2ZSB0byBrZWVwIHRoZW0KPj4+PiBhbGwgdXAtdG8tZGF0ZSIu
Cj4+PiAKPj4+IFRoYXQncyBiZWNhdXNlIGEgY29udHJpYnV0b3IgY291bGQgYWRkIGEgcGF0Y2gg
YXQgdGhlIGVuZCBvZiBhIHNlcmllcyB0bwo+Pj4gdXBkYXRlIG9uZSBvZiB0aGUgZG9jcywgZXZl
biBpZiB0aGUgZG9jIGluIHF1ZXN0aW9uIGNvbWVzIHdpdGggbm8KPj4+IHByb21pc2VzIG9mIGJl
aW5nIHVwLXRvLWRhdGUuCj4+IAo+PiAgICBJIHRoaW5rIHRoaXMgaXMgZ29pbmcgdGhlIHdyb25n
IGRpcmVjdGlvbi4gVGhlIGdvYWwgb2YgdXNpbmcgeGVuLmdpdCBpcyB0byB0cnkgCj4+ICAgIHRv
IGtlZXAgdGhlIGRvY3VtZW50YXRpb24gdXAtdG8tZGF0ZS4KPj4gCj4+IEkgYWdyZWUgd2l0aCBK
dWxpZW4gYW5kIHRoaXMgd2FzIGFsc28gbm90IG15IGludGVudGlvbi4gVGhlIHJlYXNvbiB3aHkg
SSBicm91Z2h0IHRoaXMgdXAgbm93IGlzIHRoYXQgdGhlIGluLXRyZWUgZG9jcyBhcmUgcHJldHR5
IG11Y2ggYSBtZXNzIHRvZGF5IGFuZCBhcmUgc3RhbGUgaW4gbWFueSB3YXlzLiBBbmQgdGhleSBs
b29rIFRFUlJJQkxFIGFuZCBhcmUgbm90IGVhc2lseSBzZWFyY2hhYmxlLiBIb3dldmVyLCBBbmR5
J3MgbGF0ZXN0IHNldCBvZiBwYXRjaGVzIHByb3ZpZGUgYW4gb3Bwb3J0dW5pdHkgdG8gY29uc29s
aWRhdGUgc29tZSBvZiB0aGUgaW4tdHJlZSBkb2NzIGluIGEgbmljZWx5IHJlbmRlcmVkIGFuZCBz
ZWFyY2hhYmxlIGZvcm1hdC4KPiAKPiAgICBTbyB0aGUgcGxhbiBoZXJlIGlzIHRvIGdldCBhIGNv
bnNpc3RlbnQgYW5kIHVuaWZvcm0gc2V0IG9mIGhpZ2ggcXVhbGl0eQo+ICAgIGRvY3MuCj4gCj4g
ICAgQXMgZmFpciB3YXJuaW5nLCBJJ20gaW50ZW5kaW5nIHRvIGJlIGZhaXJseSBzdHJpY3Qgd2l0
aCB3aGF0IGdvZXMgaW4KPiAgICAocXVhbGl0eSB3aXNlKSwgYmVjYXVzZSBJJ20gZ29pbmcgdG8g
ZG8gbXkgYmVzdCB0byBlbnN1cmUgdGhhdCB0aGUKPiAgICBzcGhpbnggZG9jdW1lbnRhdGlvbiBk
b2Vzbid0IGRldm9sdmUgaW50byB0aGUgbWVzcyB0aGF0IHdpa2kgb3IgdGhlCj4gICAgbWFqb3Jp
dHkgb2YgZG9jcy8gY3VycmVudGx5IGlzLgo+IAo+IEkgd2hvbGVoZWFydGVkbHkgYWdyZWUKPiAK
Pj4gSSBoYXZlIGJlZW4gZm9jdXNzaW5nIG9uIHByb2Nlc3MgcmVsYXRlZCBhbmQga2V5IGRldmVs
b3BlciByZWxhdGVkIGRvY3MsIGJlY2F1c2Ugd2hvIG1haW50YWlucyB0aGVtIGlzIG5vdCBhY3R1
YWxseSBhbiBpc3N1ZSBpbiB0aGVvcnkuIEV2ZXJ5b25lIHJlYWxseSBvdWdodCB0byBjYXJlLCBi
ZWNhdXNlIGV2ZXJ5b25lIGlzIGltcGFjdGVkIGJ5IHRoZXNlLgo+IAo+ICAgIFRoZSBrZXkgcG9p
bnQgaXMgZm9yIG1haW50YWluZXJzL3Jldmlld2VycyB0byBiZSBhd2FyZSBvZiB3aGV0aGVyCj4g
ICAgZG9jdW1lbnRhdGlvbiBleGlzdHMgZm9yIHRoZSBhcmVhIG9mIGNvZGUgYmVpbmcgbW9kaWZp
ZWQsIGFuZCBpZiBzbywKPiAgICB3aGV0aGVyIHRoZSBzdWJtaXR0ZWQgcGF0Y2ggc2hvdWxkIGFs
c28gcGF0Y2ggdGhlIGRvY3VtZW50YXRpb24uCj4gCj4gSSBhbSB3b25kZXJpbmcgd2hldGhlciB0
aGlzIGlzIHNvbWV0aGluZyB3aGljaCBjb3VsZCBiZSBhZGRyZXNzZWQuIE9uZSBwb3NzaWJpbGl0
eSBtYXkgYmUgdG8gaGF2ZSBTVVBQT1JULm1kIHBvaW50IHRvIGRvY3VtZW50YXRpb24uIEJ1dCB0
aGF0IGlzIGtpbmQgb2YgYXNzdW1pbmcgdGhhdCBTVVBQT1JULm1kIHdvcmtzIGFuZCBpcyB3aWRl
bHkgdXNlZC4gVGhlcmUgbWF5IGJlIGJldHRlciBvciBvcnRob2dvbmFsIHdheXMgdG8gcG9pbnQg
dG8gcmVsZXZhbnQgZG9jcyAoZS5nLiBieSBwb2ludGluZyB0byBkb2NzIGluIGhlYWRlciBmaWxl
cyBhbmQgb3RoZXIgc291cmNlIGZpbGVzKS4gCj4gCj4gICAgUmV2aWV3ZXJzIHRlbmQgdG8gYmUg
ZmFpcmx5IGdvb2QgYXQgbm90aWNpbmcgcGF0Y2hlcyB3aGljaCBhbHNvIG5lZWQgdG8KPiAgICBw
YXRjaCBkb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MgKHN1Ym1pdHRlcnMsIGxlc3Mg
c28pLCBidXQgdGhpcwo+ICAgIGFwcHJvYWNoIG5lZWRzIGV4dGVuZGluZyB0byB0aGUgd2hvbGUg
b2YgdGhlIHNwaGlueCBkb2NzICh3aGljaCBpbiB0dXJuCj4gICAgcmVxdWlyZXMgdGhlIGRvY3Mg
dG8gc3RheSBoaWdoIHF1YWxpdHkgc28gaXRzIGVhc3kgZm9yIG1haW50YWluZXJzIHRvCj4gICAg
a25vdyB3aGF0IGlzIHdoZXJlKS4KPiAKPiBBbHRob3VnaCB0aGlzIGRvZXMgbm90IGFwcGx5IGlu
IG15IHByb3Bvc2FsLCBJIHRoaW5rIHRoZSBrZXkgaXNzdWUgaGFzIGJlZW4gdGhhdCByZXZpZXdl
cnMgYW5kIHN1Ym1pdHRlcnMgb2YgY29kZSBvZnRlbiBkb24ndCB1c2Ugb3VyIGRvY3VtZW50YXRp
b24uIFRoZSB3aWtpIGlzIHNlZW4gYXMgYSBzZXBhcmF0ZSB0aGluZyBhbmQgYWxzbyBoYXMgdGhl
IGRpc2FkdmFudGFnZSB0aGF0IGl0IGRvZXNuJ3QgbGVuZCBpdHNlbGYgdG8gc3VwcG9ydGluZyBk
aWZmZXJlbnQgdmVyc2lvbnMgb2YgWGVuLiBBbmQgbW9zdCBvZiB0aGUgdGltZSwgZGV2ZWxvcGVy
cyBkbyBub3QgdXNlIGl0IGFuZCBuZWl0aGVyIGNvbnRyaWJ1dGUgdG8gaXQuCj4gCj4gTXkgaG9w
ZSB3YXMgdGhhdCBieSBob3N0aW5nIGRvY3VtZW50YXRpb24gcmVsYXRlZCB0byBjb250cmlidXRp
b24gd29ya2Zsb3cgYW5kIG90aGVyIGVzc2VudGlhbCB0YXNrcyBjbG9zZSB0byBvdGhlciB1c2Vm
dWwgZG9jdW1lbnRhdGlvbiB0aGlzIHdvdWxkIGVuYWJsZSBjaGFuZ2UuCj4gCj4gQEFuZHkgYW5k
IG90aGVyczogSSBuZWVkIHRvIGtub3cgd2hldGhlciB5b3UgYWdyZWUgd2l0aCBteSBwcm9wb3Nh
bCBhbmQgd2hldGhlciBhbnlvbmUgaGFzIG90aGVyIHN1Z2dlc3Rpb25zLgoKSWYgbm90IGFscmVh
ZHkgcHJlc2VudCBpbiB0aGUgcmVsZWFzZSBtYW5hZ2VyIHByb2Nlc3MgY2hlY2tsaXN0LCB3ZSBj
b3VsZCBzcGVjaWZ5IGRvY3VtZW50YXRpb24tcmVsYXRlZCB1cGRhdGVzIGZvciBlYWNoIHJlbGVh
c2UsIGUuZy4gbWluaW11bSB0ZXh0IGZvciBuZXcgZmVhdHVyZXMsIHJldmlzaW9ucyB0byBtb2Rp
ZmllZCBmZWF0dXJlcywgU1VQUE9SVC5tZCB1cGRhdGVzLgoKUmljaApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
