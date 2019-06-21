Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 839E94E5AF
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 12:16:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heGXZ-0002mv-5A; Fri, 21 Jun 2019 10:13:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1heGXX-0002mq-CA
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 10:13:03 +0000
X-Inumbo-ID: 23d590f8-940d-11e9-b37a-932b616fe621
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 23d590f8-940d-11e9-b37a-932b616fe621;
 Fri, 21 Jun 2019 10:12:57 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 21 Jun 2019 04:12:56 -0600
Message-Id: <5D0CADA4020000780023A08C@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 21 Jun 2019 04:12:52 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <1561032381-24385-1-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1561032381-24385-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] x86/svm: Drop svm_vm{load,save}() helpers
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
Cc: WeiLiu <wl@xen.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIwLjA2LjE5IGF0IDE0OjA2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gRm9sbG93aW5nIG9uIGZyb20gYy9zIDdkMTYxZjY1MzcgIng4Ni9zdm06IEZpeCBzdm1f
dm1jYl9kdW1wKCkgd2hlbiB1c2VkIGluCj4gY3VycmVudCBjb250ZXh0IiwgdGhlcmUgaXMgbm93
IG9ubHkgYSBzaW5nbGUgdXNlciBvZiBzdm1fdm1zYXZlKCkgcmVtYWluaW5nIGluCj4gdGhlIHRy
ZWUsIHdpdGggYWxsIHVzZXJzIG1vdmVkIHRvIHN2bV92bXtsb2FkLHNhdmV9X3BhKCkuCj4gCj4g
bnYtPm52X24xdm1jeCBoYXMgYSBtYXRjaGluZyBudi0+bnZfbjF2bWN4X3BhIHdoaWNoIGlzIGFs
d2F5cyBjb3JyZWN0LCBhbmQKPiBhdm9pZHMgYSByZWR1bmRhbnQgX19wYSgpIHRyYW5zbGF0aW9u
IGJlaGluZCB0aGUgc2NlbmVzLgo+IAo+IFdpdGggdGhpcyBnb25lLCBhbGwgVk17TE9BRCxTQVZF
fSBvcGVyYXRpb25zIGFyZSB1c2luZyBwYWRkcl90J3Mgd2hpY2ggaXMgbW9yZQo+IGVmZmljaWVu
dCwgc28gZHJvcCB0aGUgc3ZtX3Zte2xvYWQsc2F2ZX0oKSBoZWxwZXJzIHRvIGF2b2lkIHVzZXMg
b2YgdGhlbQo+IHJlYXBwZWFyaW5nIGluIHRoZSBmdXR1cmUuCj4gCj4gU2lnbmVkLW9mZi1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cgo+IEl0IHR1cm5zIG91dCBJIHdhcyBtaXN0
YWtlbiBhYm91dCBob3cgY29tcGxpY2F0ZWQgdGhpcyB3YXMuCgpUaGF0IHdhcyBteSBob3BlLCBi
dXQgaXQgaGFzIGJlZW4gdG9vIGxvbmcgc2luY2UgSSBoYWQgbGFzdCBsb29rZWQKYXQgdGhlIG5l
c3RpbmcgY29kZSBpbiBhbnkgbGV2ZWwgb2YgZGV0YWlsLgoKPiAtLS0gYS94ZW4vaW5jbHVkZS9h
c20teDg2L2h2bS9zdm0vc3ZtLmgKPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9zdm0v
c3ZtLmgKPiBAQCAtMjIsOSArMjIsNiBAQAo+ICAKPiAgI2luY2x1ZGUgPHhlbi90eXBlcy5oPgo+
ICAKPiAtI2RlZmluZSBzdm1fdm1sb2FkKHgpICAgICBzdm1fdm1sb2FkX3BhKF9fcGEoeCkpCj4g
LSNkZWZpbmUgc3ZtX3Ztc2F2ZSh4KSAgICAgc3ZtX3Ztc2F2ZV9wYShfX3BhKHgpKQo+IC0KPiAg
c3RhdGljIGlubGluZSB2b2lkIHN2bV92bWxvYWRfcGEocGFkZHJfdCB2bWNiKQoKRG93biB0aGUg
cm9hZCB3ZSBtYXkgd2FudCB0byBjb25zaWRlciBkcm9wcGluZyB0aGUgbm93CnBvaW50bGVzcyBf
cGEgc3VmZml4ZXMuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
