Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 140BA162023
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 06:20:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3vGs-0000cQ-CP; Tue, 18 Feb 2020 05:18:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zbEH=4G=gmail.com=glenbarney@srs-us1.protection.inumbo.net>)
 id 1j3qvE-0007xz-OZ
 for xen-devel@lists.xen.org; Tue, 18 Feb 2020 00:39:32 +0000
X-Inumbo-ID: 20cd76d0-51e7-11ea-b0fd-bc764e2007e4
Received: from mail-qt1-x841.google.com (unknown [2607:f8b0:4864:20::841])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 20cd76d0-51e7-11ea-b0fd-bc764e2007e4;
 Tue, 18 Feb 2020 00:39:31 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id l21so13337844qtr.8
 for <xen-devel@lists.xen.org>; Mon, 17 Feb 2020 16:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kg9aIfJ1CJH/VgXgvXp2OafbaYzvL+A4zuJqV5vIiK0=;
 b=dYRD0M8+tNuGf3HNwlJWMVcPxbI5yuk0Ft4Y7uTVZnqlgVhoAAeYeu+NwhWrZBTzUI
 6Tf6GgZNVZ8RNybgK3fxvVq4t6KRJ7tK65ezG5FewapEmShQLR1jXUn2Pzixcv0ShWOx
 EgfByhGqqMConUREWmMTeMHkA7YbRe8+72nKd0GrH2VgsmBAvGw7UGiAX10iyAk8nKup
 /oK3LGEPAxzB1RRQmdxboIxwrxChO4/eaugcrtubkaapWF612lJpwCrMpBP4PiFd57IZ
 EImDj+EN/EZCDLkGz1+F7Q4VsMB5CnESWR+bzgZTxyIlg64Uch4Ej9maKZsd989lyd5J
 N7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kg9aIfJ1CJH/VgXgvXp2OafbaYzvL+A4zuJqV5vIiK0=;
 b=eSMhrqE7jpZdAKO0FEfP2IZlE1TECISmQlqtI8mhy6z80ZF/ohihIgThJLWSQLwxPk
 02i5b9ADt5B4uQZbVFsKfvs3I7WeUoE9tC0rjTuIq+ySdDLd7Qi3gXv/ruaKAZxkfk8s
 QOofpo4mVxIM1W+NbIHLTLHgJNZaLKB5dCzc0QZzlADOGFXC6lYFHS93r6zSGtFSh76g
 4hMIpBWtfnM8o0a9f5MpSNPaemWDrcs2189qWp9VY1BFSIt5rP4l/ZB4kUVPkh8vDTk1
 K80wkLXHIsIBRXsjtq/k/dSVCv3HYD/OJ8KjLir3ddDj4NzRB1pKQ+WU0Fb8DN6YZm45
 k75Q==
X-Gm-Message-State: APjAAAUYMgx9htD47ZYHU7G8j0+PduhLCCKVTo79fuUh8eHiDIDBKWdF
 RF9gXApghqCZmh2otBNMHYid2HtT/g4nDCRsLYM=
X-Google-Smtp-Source: APXvYqwSLR+QlDI1zh0tWUo+JrDiUGYGuEzyQs8H6F85tsOufAk8pO9s89Q/TzwICcqrqxUui3PpnejdwoHMKRXga2Q=
X-Received: by 2002:ac8:340c:: with SMTP id u12mr15193360qtb.257.1581986371304; 
 Mon, 17 Feb 2020 16:39:31 -0800 (PST)
MIME-Version: 1.0
References: <51dcae60df3a1ce7eaf51cbd5c51184645d51f53.camel@memset.com>
 <4e71d68f-2e64-363d-349b-33571a63eab2@prgmr.com>
 <2ea581e2-adca-8d5d-a54e-dba86d1535fa@eikelenboom.it>
In-Reply-To: <2ea581e2-adca-8d5d-a54e-dba86d1535fa@eikelenboom.it>
From: Glen <glenbarney@gmail.com>
Date: Mon, 17 Feb 2020 16:39:18 -0800
Message-ID: <CAAVVsFmS7-vYc0fDqOP_Dn_CfMSgftOJODPP-q-aD2NcWJLcTQ@mail.gmail.com>
To: Sander Eikelenboom <linux@eikelenboom.it>
X-Mailman-Approved-At: Tue, 18 Feb 2020 05:18:08 +0000
Subject: Re: [Xen-devel] CPU Lockup bug with the credit2 scheduler
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
Cc: Alastair Browne <alastair.browne@memset.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 PGNet Dev <pgnet.dev@gmail.com>, Tomas Mozes <hydrapolic@gmail.com>,
 Sarah Newman <srn@prgmr.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gU2FuZGVyIC0KCklmIEkgbWlnaHQgY2hpbWUgaW4sIEknbSBhbHNvIGV4cGVyaWVuY2lu
ZyB3aGF0IHdlIGJlbGlldmUgaXMgdGhlIHNhbWUKcHJvYmxlbSwgYW5kIGhvcGUgSSdtIG5vdCBi
cmVha2luZyBhbnkgcHJvdG9jb2wgYnkgc2hhcmluZyBhIGZldyBxdWljawpkZXRhaWxzLi4uCgpP
biBNb24sIEZlYiAxNywgMjAyMCBhdCAzOjQ2IFBNIFNhbmRlciBFaWtlbGVuYm9vbSA8bGludXhA
ZWlrZWxlbmJvb20uaXQ+IHdyb3RlOgo+IE9uIDE3LzAyLzIwMjAgMjA6NTgsIFNhcmFoIE5ld21h
biB3cm90ZToKPiA+IE9uIDEvNy8yMCA2OjI1IEFNLCBBbGFzdGFpciBCcm93bmUgd3JvdGU6Cj4g
Pj4gU28gaW4gY29uY2x1c2lvbiwgdGhlIHRlc3RzIGluZGljYXRlIHRoYXQgY3JlZGl0MiBtaWdo
dCBiZSB1bnN0YWJsZS4KPiA+PiBGb3IgdGhlIHRpbWUgYmVpbmcsIHdlIGFyZSB1c2luZyBjcmVk
aXQgYXMgdGhlIGNob3NlbiBzY2hlZHVsZXIuIFdlCj4gPiBJIGRvbid0IHRoaW5rIHRoZXJlIGFy
ZSwgYnV0IGhhdmUgdGhlcmUgYmVlbiBhbnkgcGF0Y2hlcyBzaW5jZSB0aGUgNC4xMy4wIHJlbGVh
c2Ugd2hpY2ggbWlnaHQgaGF2ZSBmaXhlZCBwcm9ibGVtcyB3aXRoIGNyZWRpdCAyIHNjaGVkdWxl
cj8gSWYgbm90LAo+ID4gd2hhdCB3b3VsZCB0aGUgbmV4dCBzdGVwIGJlIHRvIGlzb2xhdGluZyB0
aGUgcHJvYmxlbSAtIGEgZGVidWcgYnVpbGQgb2YgWGVuIG9yIHNvbWV0aGluZyBlbHNlPwo+ID4g
SWYgdGhlcmUgYXJlIG5vIG1lcmdlZCBvciBwcm9wb3NlZCBmaXhlcyBzb29uLCBpdCBtYXkgYmUg
d29ydGggY29uc2lkZXJpbmcgbWFraW5nIHRoZSBjcmVkaXQgc2NoZWR1bGVyIHRoZSBkZWZhdWx0
IGFnYWluIHVudGlsIHByb2JsZW1zIHdpdGggdGhlCj4gPiBjcmVkaXQyIHNjaGVkdWxlciBhcmUg
cmVzb2x2ZWQuCj4gSSBkaWQgdGFrZSBhIGxvb2sgYXQgQWxhc3RhaXIgQnJvd25lJ3MgcmVwb3J0
IHlvdXIgcmVwbGllZCB0byAoaHR0cHM6Ly9saXN0cy54ZW4ub3JnL2FyY2hpdmVzL2h0bWwveGVu
LWRldmVsLzIwMjAtMDEvbXNnMDAzNjEuaHRtbCkKPiBhbmQgSSBkbyBzZWUgc29tZSBkaWZmZXJl
bmNlczoKPiAgICAgLSBBbGFzdGFpcidzIG1hY2hpbmUgaGFzIG11bHRpcGxlIHNvY2tldHMsIG15
IG1hY2hpbmVzIGRvbid0Lgo+ICAgICAtIEl0IHNlZW1zIEFsYXN0YWlyJ3MgY29uZmlnIGlzIHVz
aW5nIGJhbGxvb25pbmcgPyAoZG9tMF9tZW09NDA5Nk0sbWF4OjE2Mzg0TSksIGZvciBtZSB0aGF0
IGhhcyBiZWVuIGEgc291cmNlIG9mIHRyb3VibGUgaW4gdGhlIHBhc3QsIHNvIG15IGNvbmZpZ3Mg
ZG9uJ3QuCgpNeSBjb25maWd1cmF0aW9uIGhhcyBiYWxsb29uaW5nIGRpc2FibGVkLCB3ZSBkbyBu
b3QgdXNlIGl0LCBhbmQgd2UKc3RpbGwgaGF2ZSB0aGUgcHJvYmxlbS4KCj4gICAgIC0ga2VybmVs
J3MgdGVzdGVkIGFyZSBxdWl0ZSBvbGQgKDQuMTkuNjcgKGxhdGVzdCB1cHN0cmVhbSBpcyA0LjE5
LjEwNCksIDQuOS4xODkgKGxhdGVzdCB1cHN0cmVhbSBpcyA0LjkuMjE0KSkgYW5kIG5vIHJlYWxs
eSBuZXcga2VybmVsIGlzIHRlc3RlZAo+ICAgICAgICg1LjQgaXMgYXZhaWxhYmxlIGluIERlYmlh
biBiYWNrcG9ydCBmb3IgYnVzdGVyKS4KPiAgICAgLSBBbGFzdGFpciwgYXJlIHlvdSB1c2luZyBw
diwgaHZtIG9yIHB2aCBndWVzdHM/IFRoZSByZXBvcnQgc2VlbXMgdG8gbWlzcyB0aGUgR3Vlc3Qg
Y29uZmlncyAoSSdtIHByaW1hcmlseSB1c2luZyBQVkgsIGFuZCBmZXcgSFZNJ3MsIG5vIFBWIGV4
Y2VwdCBmb3IgZG9tMCkgPwoKVGhlIHByb2JsZW0gYXBwZWFycyB0byBvY2N1ciBmb3IgYm90aCBI
Vk0gYW5kIFBWIGd1ZXN0cy4KCkEgcmVwb3J0IGJ5IFRvbWFzCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tdXNlcnMvMjAyMC0wMi9tc2cwMDAxNS5odG1sCnBy
b3ZpZGVzIGhpcyBjb25maWcgZm9yIGhpcyBIVk0gc2V0dXAuCgpNeSBpbml0aWFsIHJlcG9ydApo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLXVzZXJzLzIwMjAt
MDIvbXNnMDAwMTguaHRtbApjb250YWlucyBteSBQViBndWVzdCBjb25maWcuCgo+IEFueSBob3cs
IGNvdWxkIGJlIHdvcnRod2hpbGUgdG8gdGVzdCB3aXRob3V0IGJhbGxvb25pbmcsIGFuZCB0ZXN0
IGEgcmVjZW50IGtlcm5lbCB0byBydWxlIG91dCBhbiBpc3N1ZSB3aXRoIChtaXNzaW5nKSBrZXJu
ZWwgYmFja3BvcnRzLgoKVGhhbmtzIHRvIGd1aWRhbmNlIGZyb20gU2FyYWgsIHdlJ3ZlIGhhZCBs
b3RzIG9mIGRpc2N1c3Npb24gb24gdGhlCnVzZXJzIGxpc3RzIGFib3V0IHRoaXMsIGVzcGVjaWFs
bHkgdGhpcyBwYXN0IHdlZWsgKHBhc3RpbmcgaW4KaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9hcmNoaXZlcy9odG1sL3hlbi11c2Vycy8yMDIwLTAyLyBqdXN0IGZvcgp5b3VyIGNsaWNraW5n
IGNvbnZlbmllbmNlIHNpbmNlIEknbSB0aGVyZSBhcyBJIHR5cGUgdGhpcykgYW5kIGl0IHNlZW1z
Cmxpa2Ugd2UndmUgYmVlbiBhYmxlIHRvIG5hcnJvdyB0aGluZ3MgZG93biBhIGJpdDoKCiogQWxh
c3RhaXIncyBjb25maWcgaXMgb24gdmVyeSBsYXJnZSBtYWNoaW5lcy4gIFRvbWFzIGNhbiBkdXBs
aWNhdGUKdGhpcyBvbiBhIG11Y2ggc21hbGxlciBzY2FsZSwgYW5kIEkgY2FuIGR1cGxpY2F0ZSBp
dCBvbiBhIHNpbmdsZSBEb21VCnJ1bm5pbmcgYXMgdGhlIG9ubHkgZ3Vlc3Qgb24gYSBEb20wIGhv
c3QuICAgU28gb3ZlcmFsbCBob3N0CnNpemUvY2FwYWNpdHkgZG9lc24ndCBzZWVtIHRvIGJlIHZl
cnkgaW1wb3J0YW50LCBub3IgZG9lcyBudW1iZXIgb2YKZ3Vlc3RzIG9uIHRoZSBob3N0LgoKKiBJ
J20gdXNpbmcgdGhlIExpbnV4IDQuMTIuMTQga2VybmVsIG9uIGJvdGggaG9zdCBhbmQgZ3Vlc3Qg
d2l0aCBYZW4KNC4xMi4xLiAtIGZvciBtZSwgdGhlIGFjdCBvZiBqdXN0IGdvaW5nIHRvIGEgcHJl
dmlvdXMgdmVyc2lvbiBvZiBYZW4KKGluIG15IGNhc2UgdG8gWGVuIDQuMTApIGVsaW1pbmF0ZXMg
dGhlIHByb2JsZW0uICBUb21hcyBpcyBvbgo0LjE0LjE1OSwgYW5kIGhlIHJlcG9ydHMgdGhhdCBl
dmVuIG1vdmluZyBiYWNrIGp1c3QgdG8gWGVuIDQuMTEKcmVzb2x2ZXMgaGlzIGlzc3VlLCB3aGVy
ZWFzIHRoZSBpc3N1ZSBzZWVtcyB0byBzdGlsbCBleGlzdCBpbiBYZW4KNC4xMy4gIFNvIGNoYW5n
aW5nIFhlbiB2ZXJzaW9ucyB3aXRob3V0IGNoYW5naW5nIGtlcm5lbCB2ZXJzaW9ucyBzZWVtcwp0
byByZXNvbHZlIHRoaXMuCgoqIFdlJ3ZlIGhhZCBhbm90aGVyIHVzZXIgbWVudGlvbiB0aGF0ICJX
aGVuIEkgc3dpdGNoZWQgdG8gb3BlblNVU0UgWGVuCjQuMTMuMF8wNCBwYWNrYWdlcyB3aXRoIEtl
cm5lbFN0YWJsZSAoYXRtLCA1LjUuMy0yNS5nZDY1NDY5MCksIEd1ZXN0cwpvZiBhbGwgJ2ZsYXZv
cnMnIGJlY2FtZSAqbXVjaCogYmV0dGVyIGJlaGF2ZWQuIiwgc28gd2UgdGhpbmsgbWF5YmUKc29t
ZXRoaW5nIGluIHZlcnkgcmVjZW50IFhlbiA0LjEzIG1pZ2h0IGhhdmUgaGVscGVkIChvciBwb3Nz
aWJseSB0aGF0CmxhdGVzdCBrZXJuZWwsIGFsdGhvdWdoIGZyb20gb3VyIGxpbWl0ZWQgcG9pbnQg
b2YgdmlldyB0aGUgY2hhbmdpbmcgb2YKWGVuIHZlcnNpb25zIGJhY2sgdG8gcHJlLTQuMTIgc29s
Y2luZyB0aGlzIHdpdGhvdXQgYW55IGtlcm5lbCBjaGFuZ2VzCnNlZW1zIGNvbXBlbGxpbmcuKQoK
KiBUb21hcyBoYXMgYWxyZWFkeSB0ZXN0ZWQsIGFuZCBJIGFtIHN0aWxsIHRlc3RpbmcsIFhlbiA0
LjEyIHdpdGgganVzdAp0aGUgc2NoZWQ9Y3JlZGl0IGNoYW5nZS4gIEZvciBoaW0gdGhhdCBoYXMg
ZWxpbWluYXRlZCB0aGUgcHJvYmxlbSBhcwp3ZWxsLCBJIGFtIHN0aWxsIHN0cmVzcy10ZXN0aW5n
IG15IGd1ZXN0IHVuZGVyIFhlbiA0LjEyIHNjaGVkPWNyZWRpdCwKc28gSSBjYW5ub3QgcmVwb3J0
LCBidXQgSSBhbSBob3BlZnVsLgoKSSBiZWxpZXZlIHRoaXMgaXMgd2h5IFNhcmFoIGFza2VkIGFi
b3V0IHBhdGNoZXMgdG8gNC4xMy4uLiBpdCBpcwpsb29raW5nIHRvIHVzIGp1c3Qgb24gdGhlIHVz
ZXIgbGV2ZWwgbGlrZSB0aGlzIGlzIHBvc3NpYmx5Cmtlcm5lbC1pbmRlcGVuZGVudCwgYnV0IGF0
IGxlYXN0IFhlbi12ZXJzaW9uLWRlcGVuZGVudCwgYW5kIGxpa2VseQpjcmVkaXQtc2NoZWR1bGVy
LWRlcGVuZGVudC4KCkkgYXBvbG9naXplIGlmIEkgc2hvdWxkIGJlIGRvaW5nIHNvbWV0aGluZyBk
aWZmZXJlbnQgaGVyZSwgYnV0IGl0IGlzCmxvb2tpbmcgbGlrZSBhIGZldyBtb3JlIG9mIHVzIGFy
ZSBoYXZpbmcgd2hhdCB3ZSBiZWxpZXZlIHRvIGJlIHRoZQpzYW1lIHByb2JsZW0gYW5kLCBiYXNl
ZCBvbmx5IG9uIHdoYXQgSSd2ZSBzZWVuLCBJJ3ZlIGFscmVhZHkgY2hhbmdlZApvdmVyIGFsbCBv
ZiBteSBwcm9kdWN0aW9uIGhvc3RzIChJIHJ1biBhYm91dCAyMCkgdG8gc2NoZWQ9Y3JlZGl0IGFz
IGEKcHJlY2F1dGlvbmFyeSBtZWFzdXJlLgoKQW55IHRob3VnaHRzLCBpbnNpZ2h0cyBvciBndWlk
YW5jZSB3b3VsZCBiZSBncmVhdGx5IGFwcHJlY2lhdGVkIQoKUmVzcGVjdGZ1bGx5LApHbGVuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
