Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BF1503B5
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2019 09:38:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfJVs-0006Qd-TI; Mon, 24 Jun 2019 07:35:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aogm=UX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hfJVr-0006QV-5s
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2019 07:35:39 +0000
X-Inumbo-ID: a81c9e28-9652-11e9-9cc9-273fa439cf24
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a81c9e28-9652-11e9-9cc9-273fa439cf24;
 Mon, 24 Jun 2019 07:35:37 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 24 Jun 2019 01:35:35 -0600
Message-Id: <5D107D40020000780023A8DC@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 24 Jun 2019 01:35:28 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <20190621163802.29808-1-roger.pau@citrix.com>
 <20190621163802.29808-4-roger.pau@citrix.com>
In-Reply-To: <20190621163802.29808-4-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2 3/3] x86/linker: add a reloc section to
 ELF binary
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, WeiLiu <wl@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIxLjA2LjE5IGF0IDE4OjM4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IGlmIHRoZSBoeXBlcnZpc29yIGhhcyBiZWVuIGJ1aWx0IHdpdGggRUZJIHN1cHBvcnQgKGllOiBt
dWx0aWJvb3QyKS4KPiBUaGlzIGFsbG93cyB0byBwb3NpdGlvbiB0aGUgLnJlbG9jIHNlY3Rpb24g
Y29ycmVjdGx5IGluIHRoZSBvdXRwdXQKPiBiaW5hcnkuCgpUaGUgdGl0bGUgc3RpbGwgc2F5cyAi
YWRkIC4uLiB0byBFTEYgYmluYXJ5Iiwgd2hlbiByZWFsbHkgc3VjaCBhIHNlY3Rpb24KaXMgYWxy
ZWFkeSB0aGVyZSAoYW5kIGluIGZhY3QgdGhhdCdzIHRoZSBwcm9ibGVtIHlvdSdyZSB0cnlpbmcg
dG8gd29yawphcm91bmQpLiBBcyBtZW50aW9uZWQgYmVmb3JlLCBpZiBhbnl0aGluZyB5b3UgYWRk
IG1lbnRpb24gb2YgdGhlCnNlY3Rpb24gdG8gdGhlIGxpbmtlciBzY3JpcHQsIGJ1dCBub3QgdG8g
dGhlIEVMRiBiaW5hcnkgKGFmYWljdCkuCgo+IE5vdGUgdGhhdCBmb3IgdGhlIEVMRiBvdXRwdXQg
Zm9ybWF0IHRoZSAucmVsb2Mgc2VjdGlvbiBpcyBtb3ZlZCBiZWZvcmUKPiAuYnNzIGZvciB0d28g
cmVhc29uczogaW4gb3JkZXIgZm9yIHRoZSByZXN1bHRpbmcgYmluYXJ5IHRvIG5vdCBjb250YWlu
Cj4gYW55IHNlY3Rpb24gd2l0aCBkYXRhIGFmdGVyIC5ic3MsIHNvIHRoYXQgdGhlIGZpbGUgc2l6
ZSBjYW4gYmUgc21hbGxlcgo+IHRoYW4gdGhlIGxvYWRlZCBtZW1vcnkgc2l6ZSwKClNvdW5kcyBs
aWtlIGFub3RoZXIgbGlua2VyIHF1aXJrIHRoZW4uIEkgZGlkbid0IHRoaW5rIHRoZXJlIHdhcyBh
CnJlcXVpcmVtZW50IGZvciBpbWFnZSBhbmQgZmlsZSBvZmZzZXRzIHRvIGdvIGluIGxvY2sgc3Rl
cC4gVGhlcmUgaXMKc29tZSBjb3JyZWxhdGlvbiBpaXJjLCBidXQgdGhlIHNlbnRlbmNlIG1heSB3
YW50IHdlYWtlbmluZyBhIGxpdHRsZS4KCj4gYW5kIGJlY2F1c2UgdGhlIGRhdGEgaXQgY29udGFp
bnMgaXMKPiByZWFkLW9ubHksIHNvIGl0IGJlbG9uZ3Mgd2l0aCB0aGUgb3RoZXIgc2VjdGlvbnMg
Y29udGFpbmluZyByZWFkLW9ubHkKPiBkYXRhLgoKSSBjYW4gYWNjZXB0IHRoaXMgb25lIChhcyBh
IHNlY29uZGFyeSBhcmd1bWVudCkuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
