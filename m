Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B9A486F3
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 17:25:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hctTK-0006Wp-EY; Mon, 17 Jun 2019 15:23:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wVRv=UQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hctTI-0006Wi-Fm
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 15:23:00 +0000
X-Inumbo-ID: c8c54196-9113-11e9-9d93-b326afb81cb2
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c8c54196-9113-11e9-9d93-b326afb81cb2;
 Mon, 17 Jun 2019 15:22:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6DF53ADEC;
 Mon, 17 Jun 2019 15:22:56 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Baodong Chen <chenbaodong@mxnavi.com>, Dario Faggioli <dfaggioli@suse.com>
References: <1559272702-13459-1-git-send-email-chenbaodong@mxnavi.com>
 <5D07AF680200007800238DC3@prv1-mh.provo.novell.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <63993cc0-d4b8-b1a2-9fa2-39b93aa7f335@suse.com>
Date: Mon, 17 Jun 2019 17:22:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5D07AF680200007800238DC3@prv1-mh.provo.novell.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH] xen: put cpupool's member 'n_dom' after
 'cpupool_id'
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDYuMTkgMTc6MTksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDMxLjA1LjE5IGF0
IDA1OjE4LCA8Y2hlbmJhb2RvbmdAbXhuYXZpLmNvbT4gd3JvdGU6Cj4+IFRodXMsIHNpemVvZihz
dHJ1Y3QgY3B1cG9vbCkgd2lsbCBzYXZlIDggYnl0ZXMgZm9yIDY0LWJpdCBzeXN0ZW0uCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IEJhb2RvbmcgQ2hlbiA8Y2hlbmJhb2RvbmdAbXhuYXZpLmNvbT4KPj4g
LS0tCj4+ICAgeGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmggfCAyICstCj4+ICAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gSSd2ZSBqdXN0IG5vdGlj
ZWQgdGhhdCB0aGlzIGZpbGUgaXNuJ3QgcGFydCBvZiB0aGUgU0NIRURVTElORwo+IG1haW50YWlu
ZXIgZ3JvdXAuIFRoZXJlZm9yZQo+IAo+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+Cj4gCj4gSSdtIHdvbmRlcmluZyB0aG91Z2ggd2hldGhlciBtYWludGFpbmVyc2hp
cCBvZiB0aGUgZmlsZSBzaG91bGRuJ3QgYmUKPiBhZGp1c3RlZCwgcHJlZmVyYWJseSBieSBtb3Zp
bmcgdGhpcyAoc3VwcG9zZWRseSBwcml2YXRlKSBoZWFkZXIgaW50bwo+IHhlbi9jb21tb24vLiBJ
IHJlYWxpemUgdGhlcmUgbWF5IGJlIHNvbWUgZnVydGhlciBjbGVhbnVwIG5lZWRlZAo+IGZvciB0
aGlzIHRvIGFjdHVhbGx5IGJlIHBvc3NpYmxlLiBJZiB0aGVyZSB3YXMgZ2VuZXJhbCBjb25zZW5z
dXMgYWJvdXQKPiBzdWNoIGEgc3RlcCwgSSBjb3VsZCBzZWUgYWJvdXQgYWN0dWFsbHkgY2Fycnlp
bmcgaXQgb3V0LgoKSSBhbSBwbGFubmluZyBhIGJpZyBzY2hlZHVsaW5nIGNsZWFudXAgc2VyaWVz
IGFmdGVyIG15IGNvcmUgc2NoZWR1bGluZwpzZXJpZXMgaGFzIGJlZW4gcHJvY2Vzc2VkLiBzY2hl
ZC1pZi5oIGlzIHBhcnQgb2YgdGhhdCB3b3JrLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
