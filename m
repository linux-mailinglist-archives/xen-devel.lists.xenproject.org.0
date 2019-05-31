Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C077030D51
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 13:28:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWff1-0006jp-S2; Fri, 31 May 2019 11:25:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hWff0-0006jk-4U
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 11:25:22 +0000
X-Inumbo-ID: c55ebf1c-8396-11e9-a762-e7b6f2b56c08
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c55ebf1c-8396-11e9-a762-e7b6f2b56c08;
 Fri, 31 May 2019 11:25:19 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 31 May 2019 05:25:18 -0600
Message-Id: <5CF10F1C0200007800233FA8@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 31 May 2019 05:25:16 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Ian Jackson" <ian.jackson@citrix.com>
References: <osstest-137065-mainreport@xen.org>
 <23793.2095.866136.936682@mariner.uk.xensource.com>
In-Reply-To: <23793.2095.866136.936682@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [xen-4.7-testing test] 137065: regressions - FAIL
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDMxLjA1LjE5IGF0IDEyOjU1LCA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4gd3JvdGU6
Cj4gb3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyaXRlcyAoIlt4ZW4tNC43LXRlc3RpbmcgdGVzdF0g
MTM3MDY1OiByZWdyZXNzaW9ucyAtIAo+IEZBSUwiKToKPj4gZmxpZ2h0IDEzNzA2NSB4ZW4tNC43
LXRlc3RpbmcgcmVhbCBbcmVhbF0KPj4gaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5v
cmcvb3NzdGVzdC9sb2dzLzEzNzA2NS8gCj4+IAo+PiBSZWdyZXNzaW9ucyA6LSgKPj4gCj4+IFRl
c3RzIHdoaWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAo+PiBpbmNsdWRpbmcg
dGVzdHMgd2hpY2ggY291bGQgbm90IGJlIHJ1bjoKPiAuLi4KPj4gIHRlc3QtYW1kNjQtaTM4Ni14
bC1xZW11dS1vdm1mLWFtZDY0IDEwIGRlYmlhbi1odm0taW5zdGFsbCBmYWlsIFJFR1IuIHZzLiAx
MzM1OTYKPj4gIHRlc3QtYW1kNjQtaTM4Ni1xZW11dS1yaGVsNmh2bS1pbnRlbCAxMCByZWRoYXQt
aW5zdGFsbCAgIGZhaWwgUkVHUi4gdnMuIDEzMzU5Ngo+PiAgdGVzdC1hbWQ2NC1pMzg2LXhsLXFl
bXV1LXdpbjctYW1kNjQgMTAgd2luZG93cy1pbnN0YWxsICAgZmFpbCBSRUdSLiB2cy4gMTMzNTk2
Cj4gCj4gSSB0aGluayBzb21ldGhpbmcgaXMgYnJva2VuIHdpdGggSFZNIGluIFhlbiA0LjcuCj4g
Cj4gSSBsb29rZWQgYXQgb25lIG9mIHRoZXNlIGZhaWx1cmVzIChyb3VnaGx5IHRha2VuIGF0IHJh
bmRvbSkKPiAgIAo+IGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3Qv
bG9ncy8xMzcwNjUvdGVzdC1hbWQ2NC1hbWQ2NC14bC1xZW11dS1kZWJpYW5odm0taTM4Ni14c20v
aW5mby5odG1sCj4gYW5kIHRoZXJlIGFyZSAqbm8qIGxvZ3MgZnJvbSB0aGUgZ3Vlc3QuICBUaGUg
c2NyZWVuc2hvdCBvZiB0aGUKPiBlbXVsYXRlZCB2Z2Egc3VnZ2VzdHMgbm90aGluZyBpbml0aWFs
aXNlZCB0aGUgdmdhIGNvbnRyb2xsZXIgZWl0aGVyLgo+IFRoZXJlIHNlZW0gdG8gYmUgdmVyeSBm
ZXcgbWVzc2FnZXMgaW4gdGhlIHNlcmlhbCBsb2csIHRvby4KClRoZSBvbmUgeW91J3ZlIHBpY2tl
ZCBsb29rcyB0byBiZSBhICJmYWlsIG5ldmVyIHBhc3MiIG9uZSwgc28gaXMgcGVyaGFwcwpub3Qg
aWRlYWwuIEkndmUgbG9va2VkIGF0IGEgY291cGxlIG90aGVyIG9uZXMsIGFuZCBpbiBwYXJ0aWN1
bGFyIHdoZW4gdGhlCmd1ZXN0cyBhcmUgc3VwcG9zZWRseSA2NC1iaXQgSSBub3RpY2UgdHdvIHRo
aW5ncwotIHRoZXkgbG9vayB0byBiZSBidXN5IGxvb3Bpbmcgb24gdkNQVSAwLAotIHRoZSBWTUNT
L1ZNQ0IgZHVtcHMgc3VnZ2VzdCB0aGV5J3ZlIG5ldmVyIGxlZnQgZWFybHkgYm9vdCAoaS5lLgog
IGFyZSBzdGlsbCBpbiAzMi1iaXQgbW9kZSB3aXRoIHBhZ2luZyBzdGlsbCBkaXNhYmxlZCksIGFu
ZCBtYXkgd2VsbCBzdGlsbAogIGJlIHNpdHRpbmcgaW5zaWRlIHRoZSBib290IGxvYWRlci4KSSdt
IG5vdCBhdCBhbGwgY2VydGFpbiB0aG91Z2ggaWYgdGhpcyBoZWxwcyBpbiBhbnkgd2F5LgoKSmFu
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
