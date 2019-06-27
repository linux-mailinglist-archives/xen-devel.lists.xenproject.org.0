Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC89158176
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2019 13:26:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgSVG-0001E0-IF; Thu, 27 Jun 2019 11:23:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LRcK=U2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hgSVE-0001Dv-W0
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2019 11:23:45 +0000
X-Inumbo-ID: 0456a238-98ce-11e9-badd-6b6ae51955d0
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0456a238-98ce-11e9-badd-6b6ae51955d0;
 Thu, 27 Jun 2019 11:23:42 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 27 Jun 2019 05:23:41 -0600
Message-Id: <5D14A738020000780023B848@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Thu, 27 Jun 2019 05:23:36 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "Roger Pau Monne" <roger.pau@citrix.com>
References: <20190627093335.56355-1-roger.pau@citrix.com>
In-Reply-To: <20190627093335.56355-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3 1/3] x86/linker: add a reloc section to
 ELF linker script
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, WeiLiu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI3LjA2LjE5IGF0IDExOjMzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IGlmIHRoZSBoeXBlcnZpc29yIGhhcyBiZWVuIGJ1aWx0IHdpdGggRUZJIHN1cHBvcnQgKGllOiBt
dWx0aWJvb3QyKS4KPiBUaGlzIGFsbG93cyB0byBwb3NpdGlvbiB0aGUgLnJlbG9jIHNlY3Rpb24g
Y29ycmVjdGx5IGluIHRoZSBvdXRwdXQKPiBiaW5hcnkuCj4gCj4gTm90ZSB0aGF0IGZvciB0aGUg
RUxGIG91dHB1dCBmb3JtYXQgdGhlIC5yZWxvYyBzZWN0aW9uIGlzIG1vdmVkIGJlZm9yZQo+IC5i
c3MgYmVjYXVzZSB0aGUgZGF0YSBpdCBjb250YWlucyBpcyByZWFkLW9ubHksIHNvIGl0IGJlbG9u
Z3Mgd2l0aCB0aGUKPiBvdGhlciBzZWN0aW9ucyBjb250YWluaW5nIHJlYWQtb25seSBkYXRhLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
PgoKQXNzdW1pbmcgeW91J3ZlIGFkZHJlc3NlZCBBbmRyZXcncyBjb25jZXJucyBpbiB5b3VyIHJl
cGx5LApBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgooQnV0IEFuZHJl
dywgcGxlYXNlIGNvbmZpcm0uKQoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
