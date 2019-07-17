Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 475A36B6F7
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 08:51:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hndkU-0006j3-8B; Wed, 17 Jul 2019 06:49:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zX8a=VO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hndkS-0006iv-99
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 06:49:08 +0000
X-Inumbo-ID: f8c8eeba-a85e-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f8c8eeba-a85e-11e9-8980-bc764e045a96;
 Wed, 17 Jul 2019 06:49:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E867EACAE;
 Wed, 17 Jul 2019 06:49:05 +0000 (UTC)
To: Joe Perches <joe@perches.com>, Zhenzhong Duan
 <zhenzhong.duan@oracle.com>, linux-kernel@vger.kernel.org
References: <1563251169-30740-1-git-send-email-zhenzhong.duan@oracle.com>
 <9791d12717bba784f24f35c29ddfaab9ccb78965.camel@perches.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <d4be507a-aa31-9ba3-9bf0-c8b60ec3f93a@suse.com>
Date: Wed, 17 Jul 2019 08:49:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <9791d12717bba784f24f35c29ddfaab9ccb78965.camel@perches.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v8 4/5] x86/paravirt: Remove const mark from
 x86_hyper_xen_hvm variable
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
Cc: sstabellini@kernel.org, x86@kernel.org, mingo@redhat.com, bp@alien8.de,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, tglx@linutronix.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDcuMTkgMDg6NDYsIEpvZSBQZXJjaGVzIHdyb3RlOgo+IE9uIFR1ZSwgMjAxOS0wNy0x
NiBhdCAxMjoyNiArMDgwMCwgWmhlbnpob25nIER1YW4gd3JvdGU6Cj4+IC4uIGFzICJub3B2IiBz
dXBwb3J0IG5lZWRzIGl0IHRvIGJlIGNoYW5nZWFibGUgYXQgYm9vdCB1cCBzdGFnZS4KPj4KPj4g
Q2hlY2twYXRjaCByZXBvcnRzIHdhcm5pbmcsIHNvIG1vdmUgdmFyaWFibGUgZGVjbGFyYXRpb25z
IGZyb20KPj4gaHlwZXJ2aXNvci5jIHRvIGh5cGVydmlzb3IuaAo+IFtdCj4+IGRpZmYgLS1naXQg
YS9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2bS5jIGIvYXJjaC94ODYveGVuL2VubGlnaHRlbl9o
dm0uYwo+IFtdCj4+IEBAIC0yNTksNyArMjU5LDcgQEAgc3RhdGljIF9faW5pdCB2b2lkIHhlbl9o
dm1fZ3Vlc3RfbGF0ZV9pbml0KHZvaWQpCj4+ICAgI2VuZGlmCj4+ICAgfQo+PiAgIAo+PiAtY29u
c3QgX19pbml0Y29uc3Qgc3RydWN0IGh5cGVydmlzb3JfeDg2IHg4Nl9oeXBlcl94ZW5faHZtID0g
ewo+PiArc3RydWN0IGh5cGVydmlzb3JfeDg2IHg4Nl9oeXBlcl94ZW5faHZtIF9faW5pdGRhdGEg
PSB7Cj4gCj4gc3RhdGljPwoKSXQgaXMgYmVpbmcgcmVmZXJlbmNlZCBmcm9tIGFyY2gveDg2L2tl
cm5lbC9jcHUvaHlwZXJ2aXNvci5jCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
