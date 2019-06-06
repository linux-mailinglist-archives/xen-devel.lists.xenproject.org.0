Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3246A36D33
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 09:19:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYmca-0002k9-JF; Thu, 06 Jun 2019 07:15:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=p1/W=UF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYmcY-0002k4-7V
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 07:15:34 +0000
X-Inumbo-ID: dd434cc2-882a-11e9-9bca-c34e7197812f
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd434cc2-882a-11e9-9bca-c34e7197812f;
 Thu, 06 Jun 2019 07:15:30 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 06 Jun 2019 01:15:28 -0600
Message-Id: <5CF8BD890200007800235C21@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Thu, 06 Jun 2019 01:15:21 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Ian Jackson" <ian.jackson@citrix.com>
References: <osstest-137065-mainreport@xen.org>
 <23793.2095.866136.936682@mariner.uk.xensource.com>
 <5CF10F1C0200007800233FA8@prv1-mh.provo.novell.com>
 <23800.977.195291.114635@mariner.uk.xensource.com>
In-Reply-To: <23800.977.195291.114635@mariner.uk.xensource.com>
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

Pj4+IE9uIDA1LjA2LjE5IGF0IDIwOjAyLCA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4gd3JvdGU6
Cj4gSmFuIEJldWxpY2ggd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIFt4ZW4tNC43LXRlc3Rpbmcg
dGVzdF0gMTM3MDY1OiByZWdyZXNzaW9ucyAtIAo+IEZBSUwiKToKPj4gVGhlIG9uZSB5b3UndmUg
cGlja2VkIGxvb2tzIHRvIGJlIGEgImZhaWwgbmV2ZXIgcGFzcyIgb25lLCBzbyBpcyBwZXJoYXBz
Cj4+IG5vdCBpZGVhbC4gSSd2ZSBsb29rZWQgYXQgYSBjb3VwbGUgb3RoZXIgb25lcywgYW5kIGlu
IHBhcnRpY3VsYXIgd2hlbiB0aGUKPj4gZ3Vlc3RzIGFyZSBzdXBwb3NlZGx5IDY0LWJpdCBJIG5v
dGljZSB0d28gdGhpbmdzCj4+IC0gdGhleSBsb29rIHRvIGJlIGJ1c3kgbG9vcGluZyBvbiB2Q1BV
IDAsCj4+IC0gdGhlIFZNQ1MvVk1DQiBkdW1wcyBzdWdnZXN0IHRoZXkndmUgbmV2ZXIgbGVmdCBl
YXJseSBib290IChpLmUuCj4+ICAgYXJlIHN0aWxsIGluIDMyLWJpdCBtb2RlIHdpdGggcGFnaW5n
IHN0aWxsIGRpc2FibGVkKSwgYW5kIG1heSB3ZWxsIHN0aWxsCj4+ICAgYmUgc2l0dGluZyBpbnNp
ZGUgdGhlIGJvb3QgbG9hZGVyLgo+PiBJJ20gbm90IGF0IGFsbCBjZXJ0YWluIHRob3VnaCBpZiB0
aGlzIGhlbHBzIGluIGFueSB3YXkuCj4gCj4gSSBoYXZlIG5vdCB5ZXQgbWFuYWdlZCB0byBtYWtl
IG11Y2ggcHJvZ3Jlc3Mgd2l0aCB0aGlzLiAgSW4gbXkgbW9zdAo+IHJlY2VudCBhdHRlbXB0IEkg
YmFja3BvcnRlZCBhbGwgb2YgdGhlIGJ1aWxkIGZpeGVzIG9udG8gdGhlCj4gbGFzdC13b3JraW5n
IFhlbiByZXZpc2lvbi4KPiAKPiBUaGUgYnJhbmNoIEkgYnVpbHQgYW5kIHRlc3RlZCB3YXMgdGhp
czoKPiAgIGl3akBvc3N0ZXN0LnRlc3QtbGFiOnhlbi5naXQvdC40NwoKSSB3b3VsZCBoYXZlIHdh
bnRlZCB0byBsb29rIGF0IHdoYXQgeW91J3ZlIHB1bGxlZCBpbiwgYnV0IEkgY291bGRuJ3QKZmln
dXJlIGhvdyB0byB0cmFuc2Zvcm0gdGhpcyBpbnRvIGEgdXJsIHVzYWJsZSBmcm9tIGhlcmUuCgo+
IEFuZCBpdCBmYWlsZWQ6Cj4gICBmbGlnaHQgMTM3MjU1IHhlbi11bnN0YWJsZSBwbGF5IFtwbGF5
XQo+ICAgaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEz
NzI1NS8gCgpBbmQgaXQncyBhZ2FpbiBpcyB0aGlzIGVhcmx5IGJvb3Qgc3RhdGUsIHdpdGggdkNQ
VSAwIHNwaW5uaW5nIG9uCnNvbWV0aGluZy4gQXMgSSdtIG9ubHkgbm93IG5vdGljaW5nLCB0aGlz
CgooWEVOKSBSU1AgPSAweDAwMDAwMDAwMDA1YzJkNDggKDB4MDAwMDAwMDAwMDVjMmQ0OCkgIFJJ
UCA9IDB4MDAwMDAwMDAwMDEwMTVkYiAoMHgwMDAwMDAwMDAwMTAxNWRiKQoKbWlnaHQgYWN0dWFs
bHkgaGludCBhdCBpdCBiZWluZyBpbiBodm1sb2FkZXIuIFRoZSBndWVzdCBzdGF0ZSBkdW1wCndv
dWxkIG1hdGNoIHVwIHdpdGggdGhpczoKCihYRU4pIFJJUDogICAgMDAxODpbPDAwMDAwMDAwMDAx
MDE1ZTA+XQoKQm90aCB3b3VsZCBwb2ludCBpbnRvIGh2bWxvYWRlcigpJ3MgbWVtc2V0LiBJbiB0
aGlzIGxhdHRlciBjYXNlIHdlCmFsc28gaGF2ZSB0aGUgcmVtYWluaW5nIHJlZ2lzdGVycywgd2hp
Y2ggYXJlIGludGVyZXN0aW5nOgoKKFhFTikgcmF4OiAwMDAwMDAwMDAwNWMyZDUwICAgcmJ4OiAw
MDAwMDAwMDAwMTBkYTljICAgcmN4OiAwMDAwMDAwMDAwMDAwMmZmCihYRU4pIHJkeDogMDAwMDAw
MDAwMDAwMDAwMCAgIHJzaTogMDAwMDAwMDAwMDAwMDAwMCAgIHJkaTogMDAwMDAwMDAwMDAwMDAw
MAooWEVOKSByYnA6IDAwMDAwMDAwMDA1YzJkNTggICByc3A6IDAwMDAwMDAwMDA1YzJkNDggICBy
ODogIDAwMDAwMDAwMDAwMDAwMDAKCnJheCBpcyB0aGUgYWRkcmVzcyB0aGF0IHdhcyBqdXN0IHdy
aXR0ZW4gdG8gKG9yIG9uIHRoZSBmaXJzdCBpdGVyYXRpb24KaXMgdGhlIGFkZHJlc3MgYWJvdXQg
dG8gYmUgd3JpdHRlbiB0bykuIEl0J3MgcHJldHR5IG9kZCB0aGF0IHJheApwb2ludHMgZXhhY3Rs
eSBiZXR3ZWVuIHJzcCBhbmQgcmJwLCBpLmUuIGF0IGxvY2FsIHZhcmlhYmxlIHNwYWNlIG9mCm1l
bXNldCgpIGl0c2VsZi4gTm8gY2FsbGVyIHNob3VsZCBldmVyIGNhbGwgdGhlIGZ1bmN0aW9uIGxp
a2UgdGhpcy4KClNlZWluZyB0aGVzZSBhZGRyZXNzZXMgYW5kIHNlZWluZwoKKGQxKSBUZXN0aW5n
IEhWTSBlbnZpcm9ubWVudDoKCmFzIHRoZSBsYXN0IGxpbmUgb2YgZ3Vlc3Qgb3V0cHV0IEkgd29u
ZGVyIHdoZXRoZXIgeW91IG5lZWQgdG8gcHVsbAppbiAwZDY5Njg2MzVjICgiaHZtbG9hZGVyOiBh
dm9pZCB0ZXN0cyB3aGVuIHRoZXkgd291bGQgY2xvYmJlcgp1c2VkIG1lbW9yeSIpLiBJZiBuZXZl
cnRoZWxlc3MgZXhlY3V0aW5nIHRoZSB0ZXN0cyBpcyBkZXNpcmVkLAplMmZjNWJiNWNiICgiaHZt
bG9hZGVyOiBkeW5hbWljYWxseSBkZXRlcm1pbmUgc2NyYXRjaCBtZW1vcnkKcmFuZ2UgZm9yIHRl
c3RzIikgd291bGQgYWxzbyBiZSBuZWVkZWQgKGJ1dCB0aGVuIGFsc28gb24gNC44IGFuZAo0Ljkp
LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
