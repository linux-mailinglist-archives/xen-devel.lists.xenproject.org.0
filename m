Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AAD21A4C
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 17:06:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hReOo-0003e8-Gl; Fri, 17 May 2019 15:03:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mYL4=TR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hReOm-0003e3-Sf
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 15:03:52 +0000
X-Inumbo-ID: fa51b2a3-78b4-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fa51b2a3-78b4-11e9-8980-bc764e045a96;
 Fri, 17 May 2019 15:03:50 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 17 May 2019 09:03:49 -0600
Message-Id: <5CDECD540200007800230246@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 17 May 2019 09:03:48 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Viktor Mitin" <viktor.mitin.19@gmail.com>
References: <CAOcoXZZZbKOXkNQNqFgp9BSRUHnovDqZ4TfV_aMh+h9BcC6Qnw@mail.gmail.com>
 <5CDEA9CC020000780023017C@prv1-mh.provo.novell.com>
 <CAOcoXZa=KriCu6KP0Ju-sFdNx8xgz91FgXTbimGGC7tAk=BsXg@mail.gmail.com>
In-Reply-To: <CAOcoXZa=KriCu6KP0Ju-sFdNx8xgz91FgXTbimGGC7tAk=BsXg@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] libxc: Casting of xen virtual address type
 xen_vaddr_t to signed int64 type: (int64_t)vaddr
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE3LjA1LjE5IGF0IDE2OjEwLCA8dmlrdG9yLm1pdGluLjE5QGdtYWlsLmNvbT4gd3Jv
dGU6Cj4gSGkgSmFuIGFuZCBBbmRyZXcsIEFsbAo+IAo+IEZyb20gc3RhbmRhcmQ6Cj4gVGhlIHJl
c3VsdCBvZiBFMSA+PiBFMiBpcyBFMSByaWdodC1zaGlmdGVkIEUyIGJpdCBwb3NpdGlvbnMuCj4g
SWYgRTEgaGFzIGFuIHVuc2lnbmVkIHR5cGUgb3IgaWYgRTEgaGFzIGEgc2lnbmVkIHR5cGUgYW5k
IGEgbm9ubmVnYXRpdmUgCj4gdmFsdWUsCj4gdGhlIHZhbHVlIG9mIHRoZSByZXN1bHQgaXMgdGhl
IGludGVncmFsIHBhcnQgb2YgdGhlIHF1b3RpZW50IG9mIEUxIC8gMkUyLgo+IElmIEUxIGhhcyBh
IHNpZ25lZCB0eXBlIGFuZCBhIG5lZ2F0aXZlIHZhbHVlLAo+IHRoZSByZXN1bHRpbmcgdmFsdWUg
aXMgaW1wbGVtZW50YXRpb24tZGVmaW5lZC4KPiAKPiBUbyByZXBocmFzZTogaW4gY2FzZSBvZiBy
aWdodCBzaGlmdGluZyBhbmQgd2hlbiB0aGUgb3JpZ2luYWwgbnVtYmVyIGlzIAo+IG5lZ2F0aXZl
LAo+IHRoZSBzdGFuZGFyZCBkb2VzIG5vdCBkZWZpbmUgd2hldGhlciB0aGUgc2hpZnQgaXMgYXJp
dGhtZXRpYyBvciBsb2dpY2FsCj4gKGkuZS4gd2lsbCBpdCBwcmVzZXJ2ZSB0aGUgc2lnbiBvciBu
b3QpLgo+IAo+IEluIG91ciBleGFtcGxlLCBpbiB0aGUgY2FzZSB3aGVuCj4gKGludDY0X3QpdmFk
ZHIgPCAwCj4gdGhlIHJlc3VsdCBvZiBuZXh0IHNoaWZ0IGlzICdpbXBsZW1lbnRhdGlvbi1kZWZp
bmVkJyAoYW5kIG5vdAo+ICd1bmRlZmluZWQgYmVoYXZpb3InKToKPiAoaW50NjRfdCl2YWRkciA+
PiA2Mwo+IAo+IE1lYW4gdGhhdCByZXN1bHQgb2YgIihpbnQ2NF90KXZhZGRyID4+IDYzIiBjYW4g
YmUgMCBvciAxLgo+IFNvIHRoZSBuZXh0IGNvZGUgbWF5IG5vdCB3b3JrIHByb3Blcmx5IGluIGNh
c2Ugb2YgYW5vdGhlciAnaW1wbGVtZW50YXRpb25zJy4KPiBXaXRoIGFub3RoZXIgY29tcGlsZXIg
KGkuZS4gY2xhbmcsIGV0YykgdGhpcyBjb2RlIG1heSBpbnRyb2R1Y2UgYnVncwo+IHdoaWNoIGFy
ZSBoYXJkIHRvIGZpbmQuCj4gCj4gKChpbnQ2NF90KXZhZGRyID4+IDQ3KSA9PSAoKGludDY0X3Qp
dmFkZHIgPj4gNjMpCj4gCj4gRm9yIHRoaXMgcmVhc29uIGl0IGlzIGJldHRlciB0byBhdm9pZCBp
bXBsZW1lbnRhdGlvbi1kZWZpbmVkIGNvZGUuCgpXZWxsLCBpZGVhbGx5IHdlJ2QgbGlrZSB0byBn
ZXQgYXdheSB3aXRob3V0IHVzaW5nIGltcGxlbWVudGF0aW9uCmRlZmluZWQgYmVoYXZpb3IuIEJ1
dCBJJ20gYWZyYWlkIHdlJ3JlIHF1aXRlIGZhciBmcm9tIHRoYXQsIGFuZAp3ZSdkIG5vdCBhbHdh
eXMgYmUgd2lsbGluZyB0byBhY2NlcHQgdGhlIHdvcnNlIHNvdXJjZSBhbmQvb3IKYmluYXJ5IGNv
ZGUgdGhhdCB3b3VsZCBiZSBuZWVkZWQgdG8gYXZvaWQgaXQuCgpKYW4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
