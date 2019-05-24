Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4920B29724
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 13:27:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hU8Jd-00061K-QR; Fri, 24 May 2019 11:24:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8EJT=TY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hU8Jc-00061E-CT
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 11:24:48 +0000
X-Inumbo-ID: 87fa48ec-7e16-11e9-9c83-a707258a49b0
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 87fa48ec-7e16-11e9-9c83-a707258a49b0;
 Fri, 24 May 2019 11:24:45 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 24 May 2019 05:24:44 -0600
Message-Id: <5CE7D47B0200007800231FF6@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 24 May 2019 05:24:43 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Lars Kurth" <lars.kurth@citrix.com>
References: <04e56f911ff972acb4a0135da043f65b714a44ee.1558661458.git.lars.kurth@citrix.com>
In-Reply-To: <04e56f911ff972acb4a0135da043f65b714a44ee.1558661458.git.lars.kurth@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2] Add TRACKING.IMPORTS to xen.git to more
 easily manage imported files that need to be kept in sync with an upstream
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, committers@xenproject.org,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI0LjA1LjE5IGF0IDAzOjM2LCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPiB3cm90ZToK
PiAtLS0gL2Rldi9udWxsCj4gKysrIGIvVFJBQ0tJTkcuRklMRVMKPiBAQCAtMCwwICsxLDUwIEBA
Cj4gKyMgVGhpcyBmaWxlIGNvbnRhaW5zIGluZm9ybWF0aW9uIGFib3V0IHNvdXJjZSBmaWxlcyB0
aGF0IGhhdmUgYmVlbgo+ICsjIGNvcGllZCBmcm9tIG90aGVyIHNvdXJjZXMgYW5kIG5lZWQgdG8g
YmUgdHJhY2tlZAo+ICsjCj4gKyMgVGhlIGZpbGUgbWF5IGNvbnRhaW4gbGluZXMgc3RhcnRpbmcg
d2l0aCAuLi4KPiArIyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo+ICsjIHZlcnNpb246IG9mIGZpbGUgZm9ybWF0Cj4gKyMgcmVwbzogcmVwb3NpdG9yeSBkZWZp
bml0aW9uCj4gKyMgZmlsZTogYSBtYXBwaW5nIHRvIHRyYWNrIGZpbGVzCj4gKyMKPiArIyBOb3Rl
IHRoYXQgcmVwbzogZW50cmllcyBtdXN0IGNvbWUgKmJlZm9yZSogZmlsZTogZW50cmllcwo+ICsj
Cj4gKyMgUmVwb3NpdG9yeSBEZWZpbml0aW9ucyBhcmUgb2YgdGhlIGZvbGxvd2luZyBmb3JtYXQK
PiArIyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+
ICsjIHJlcG86IG5hbWUtb2Ytc291cmNlLXJlcG8gZ2l0fHN2biBodHRwcy11cmwtb2Ytc291cmNl
LXJlcG8KPiArIwo+ICsjIG5hbWUtb2Ytc291cmNlLXJlcG86Cj4gKyMgICBOYW1lIG9mIHNvdXJj
ZSByZXBvc2l0b3J5LiBUaGUgbmFtZSB3aWxsIGJlIHVzZWQgYXMgcmVmZXJlbmNlIGluIGZpbGU6
Cj4gKyMgICBzdGF0ZW1lbnRzCgpNYXkgSSBzdWdnZXN0IGFub3RoZXIgZm9ybWF0dGluZyBjaGFu
Z2UsIGFzIHRoZSBjb2xvbiB1c2VzIG5vdwpoYXZlIGRpZmZlcmVudCBtZWFuaW5nOgoKIyByZXBv
OiA8bmFtZS1vZi1zb3VyY2UtcmVwbz4gPHR5cGUtb2Ytc291cmNlLXJlcG8+IDx1cmwtb2Ytc291
cmNlLXJlcG8+CiMKIyA8bmFtZS1vZi1zb3VyY2UtcmVwbz4KIyAgIE5hbWUgb2Ygc291cmNlIHJl
cG9zaXRvcnkuIFRoZSBuYW1lIHdpbGwgYmUgdXNlZCBhcyByZWZlcmVuY2UgaW4gZmlsZToKIyAg
IHN0YXRlbWVudHMKCj4gKyMgZ2l0fHN2bjoKPiArIyAgIFR5cGUgb2Zzb3VyY2UgcmVwb3NpdG9y
eQoKTml0OiBNaXNzaW5nIGJsYW5rLgoKPiArIyBodHRwcy11cmwtb2Ytc291cmNlLXJlcG86Cj4g
KyMgICBVUkwgb2Ygc291cmNlIHJlcG9zaXRvcnkKCldoeSBodHRwcz8gQW55IGZvcm0gb2YgVVJM
IHNob3VsZCBiZSBmaW5lIGhlcmUuCgo+ICsjIEZvciBleGFtcGxlOgo+ICsjICAgcmVwbzogbGlu
dXgtdG9ydmFsZHMgZ2l0IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdCAKCkRpZG4ndCB3ZSBhZ3JlZSBvbiBleGFtcGxlcyBt
b3ZpbmcgaW50byB0aGUgY29tbWl0IG1lc3NhZ2UsCm9yIHRoZSBwb3N0LWNvbW1pdC1tZXNzYWdl
IGFyZWEsIGFzIHRoZXknbGwgYmVjb21lIHJlZHVuZGFudAooYW5kIGV2ZW50dWFsbHkgc3RhbGUp
IG9uY2Ugd2UgZ2FpbiBhY3R1YWwgY29udGVudCBoZXJlPwoKSmFuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
