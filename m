Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B07C565CB
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 11:42:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hg4O5-0002bd-BQ; Wed, 26 Jun 2019 09:38:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3S3C=UZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hg4O3-0002bY-Hw
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 09:38:43 +0000
X-Inumbo-ID: 2e710802-97f6-11e9-a8d0-4378e351ab1c
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e710802-97f6-11e9-a8d0-4378e351ab1c;
 Wed, 26 Jun 2019 09:38:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 55AA1AEFD;
 Wed, 26 Jun 2019 09:38:40 +0000 (UTC)
To: Zhenzhong Duan <zhenzhong.duan@oracle.com>, linux-kernel@vger.kernel.org
References: <1561377779-28036-1-git-send-email-zhenzhong.duan@oracle.com>
 <1561377779-28036-4-git-send-email-zhenzhong.duan@oracle.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <23b5bdee-f6b8-609b-2a52-d0b8c10a8ff8@suse.com>
Date: Wed, 26 Jun 2019 11:38:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1561377779-28036-4-git-send-email-zhenzhong.duan@oracle.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v2 3/7] x86: Add nopv parameter to disable
 PV extensions
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
Cc: sstabellini@kernel.org, peterz@infradead.org,
 Jan Kiszka <jan.kiszka@siemens.com>, mingo@kernel.org,
 Ingo Molnar <mingo@redhat.com>, bp@alien8.de, hpa@zytor.com,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 srinivas.eeda@oracle.com, tglx@linutronix.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDYuMTkgMTQ6MDIsIFpoZW56aG9uZyBEdWFuIHdyb3RlOgo+IEluIHZpcnR1YWxpemF0
aW9uIGVudmlyb25tZW50LCBQViBleHRlbnNpb25zIChkcml2ZXJzLCBpbnRlcnJ1cHRzLAo+IHRp
bWVycywgZXRjKSBhcmUgZW5hYmxlZCBpbiB0aGUgbWFqb3JpdHkgb2YgdXNlIGNhc2VzIHdoaWNo
IGlzIHRoZQo+IGJlc3Qgb3B0aW9uLgo+IAo+IEhvd2V2ZXIsIGluIHNvbWUgY2FzZXMgKGtleGVj
IG5vdCBmdWxseSB3b3JraW5nLCBiZW5jaG1hcmtpbmcpCj4gd2Ugd2FudCB0byBkaXNhYmxlIFBW
IGV4dGVuc2lvbnMuIEFzIHN1Y2ggaW50cm9kdWNlIHRoZQo+ICdub3B2JyBwYXJhbWV0ZXIgdGhh
dCB3aWxsIGRvIGl0Lgo+IAo+IFRoZXJlIGFyZSBndWVzdCB0eXBlcyB3aGljaCBqdXN0IHdvbid0
IHdvcmsgd2l0aG91dCBQViBleHRlbnNpb25zLAo+IGxpa2UgWGVuIFBWLCBYZW4gUFZIIGFuZCBq
YWlsaG91c2UuIGFkZCBhICJpZ25vcmVfbm9wdiIgbWVtYmVyIHRvCj4gc3RydWN0IGh5cGVydmlz
b3JfeDg2IHNldCB0byB0cnVlIGZvciB0aG9zZSBndWVzdCB0eXBlcyBhbmQgY2FsbAo+IHRoZSBk
ZXRlY3QgZnVuY3Rpb25zIG9ubHkgaWYgbm9wdiBpcyBmYWxzZSBvciBpZ25vcmVfbm9wdiBpcyB0
cnVlLgo+IAo+IFRoZXJlIGlzIGFscmVhZHkgJ3hlbl9ub3B2JyBwYXJhbWV0ZXIgZm9yIFhFTiBw
bGF0Zm9ybSBidXQgbm90IGZvcgo+IG90aGVycy4gJ3hlbl9ub3B2JyBjYW4gdGhlbiBiZSByZW1v
dmVkIHdpdGggdGhpcyBjaGFuZ2UuCj4gCj4gU3VnZ2VzdGVkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogWmhlbnpob25nIER1YW4gPHpoZW56aG9u
Zy5kdWFuQG9yYWNsZS5jb20+Cj4gQ2M6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4
LmRlPgo+IENjOiBJbmdvIE1vbG5hciA8bWluZ29AcmVkaGF0LmNvbT4KPiBDYzogQm9yaXNsYXYg
UGV0a292IDxicEBhbGllbjguZGU+Cj4gQ2M6IEphbiBLaXN6a2EgPGphbi5raXN6a2FAc2llbWVu
cy5jb20+Cj4gQ2M6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+
Cj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiBDYzog
eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCgpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
