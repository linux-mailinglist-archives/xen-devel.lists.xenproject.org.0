Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFE069929
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 18:37:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn3vS-0007ZE-0E; Mon, 15 Jul 2019 16:34:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=p+TJ=VM=linux.intel.com=ak@srs-us1.protection.inumbo.net>)
 id 1hn3vQ-0007Z9-4J
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 16:34:04 +0000
X-Inumbo-ID: 5a8f18ca-a71e-11e9-8980-bc764e045a96
Received: from mga02.intel.com (unknown [134.134.136.20])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5a8f18ca-a71e-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 16:34:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jul 2019 09:34:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,493,1557212400"; d="scan'208";a="175145375"
Received: from tassilo.jf.intel.com (HELO tassilo.localdomain) ([10.7.201.137])
 by FMSMGA003.fm.intel.com with ESMTP; 15 Jul 2019 09:34:00 -0700
Received: by tassilo.localdomain (Postfix, from userid 1000)
 id 9AA04301AE9; Mon, 15 Jul 2019 09:34:00 -0700 (PDT)
From: Andi Kleen <ak@linux.intel.com>
To: Juergen Gross <jgross@suse.com>
References: <20190715113739.17694-1-jgross@suse.com>
Date: Mon, 15 Jul 2019 09:34:00 -0700
In-Reply-To: <20190715113739.17694-1-jgross@suse.com> (Juergen Gross's message
 of "Mon, 15 Jul 2019 13:37:37 +0200")
Message-ID: <87y30zfe9z.fsf@linux.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 0/2] Remove 32-bit Xen PV guest support
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, x86@kernel.org,
 Alok Kataria <akataria@vmware.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPiB3cml0ZXM6Cgo+IFRoZSBsb25nIHRlcm0g
cGxhbiBoYXMgYmVlbiB0byByZXBsYWNlIFhlbiBQViBndWVzdHMgYnkgUFZILiBUaGUgZmlyc3QK
PiB2aWN0aW0gb2YgdGhhdCBwbGFuIGFyZSBub3cgMzItYml0IFBWIGd1ZXN0cywgYXMgdGhvc2Ug
YXJlIHVzZWQgb25seQo+IHJhdGhlciBzZWxkb20gdGhlc2UgZGF5cy4gWGVuIG9uIHg4NiByZXF1
aXJlcyA2NC1iaXQgc3VwcG9ydCBhbmQgd2l0aAo+IEdydWIyIG5vdyBzdXBwb3J0aW5nIFBWSCBv
ZmZpY2lhbGx5IHNpbmNlIHZlcnNpb24gMi4wNCB0aGVyZSBpcyBubwo+IG5lZWQgdG8ga2VlcCAz
Mi1iaXQgUFYgZ3Vlc3Qgc3VwcG9ydCBhbGl2ZSBpbiB0aGUgTGludXgga2VybmVsLgo+IEFkZGl0
aW9uYWxseSBNZWx0ZG93biBtaXRpZ2F0aW9uIGlzIG5vdCBhdmFpbGFibGUgaW4gdGhlIGtlcm5l
bCBydW5uaW5nCj4gYXMgMzItYml0IFBWIGd1ZXN0LCBzbyBkcm9wcGluZyB0aGlzIG1vZGUgbWFr
ZXMgc2Vuc2UgZnJvbSBzZWN1cml0eQo+IHBvaW50IG9mIHZpZXcsIHRvby4KCk5vcm1hbGx5IHdl
IGhhdmUgYSBkZXByZWNhdGlvbiBwZXJpb2QgZm9yIGZlYXR1cmUgcmVtb3ZhbHMgbGlrZSB0aGlz
LgpZb3Ugd291bGQgbWFrZSB0aGUga2VybmVsIHByaW50IGEgd2FybmluZyBmb3Igc29tZSByZWxl
YXNlcywgYW5kIHdoZW4Kbm8gdXNlciBjb21wbGFpbnMgeW91IGNhbiB0aGVuIHJlbW92ZS4gSWYg
YSB1c2VyIGNvbXBsYWlucyB5b3UgY2FuJ3QuCgotQW5kaQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
