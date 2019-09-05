Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB19AA385
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 14:52:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5rD8-0001mq-EX; Thu, 05 Sep 2019 12:50:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6KTe=XA=kernel.org=mhiramat@srs-us1.protection.inumbo.net>)
 id 1i5rD6-0001gE-G6
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 12:50:00 +0000
X-Inumbo-ID: ab9e231a-cfdb-11e9-b299-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab9e231a-cfdb-11e9-b299-bc764e2007e4;
 Thu, 05 Sep 2019 12:50:00 +0000 (UTC)
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BE61620640;
 Thu,  5 Sep 2019 12:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567687797;
 bh=u5/6CYSwJw54q2AdpCKJ0XMdCuQlD+4IdreRDjcYlFU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=k4CnjkwX+6Si0MYUHHzfDMUELVvp1IkFYzD9ZdviGrsA2kdvXZzSBCuFt/Wo2GhwY
 il7E7xBY6+mHeqgsUJlT/faJnGPZCotfc23DstGh4xAVo/oh5yy9/Eo7xUYiM7GXDP
 Qz25ZpkefgCcyYKHgMwCUqA8y4m30TW7c7lqVkP0=
Date: Thu, 5 Sep 2019 21:49:53 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-Id: <20190905214953.e4ad9af6e83a911a141c8a11@kernel.org>
In-Reply-To: <4de91a14-2051-197e-6ab0-beb2538c40f9@citrix.com>
References: <156759754770.24473.11832897710080799131.stgit@devnote2>
 <ad6431be-c86e-5ed5-518a-d1e9d1959e80@citrix.com>
 <20190905104937.60aa03f699a9c0fbf1b651b9@kernel.org>
 <1372ce73-e2d8-6144-57df-a98429587826@citrix.com>
 <20190905082647.GZ2332@hirez.programming.kicks-ass.net>
 <4de91a14-2051-197e-6ab0-beb2538c40f9@citrix.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Subject: [Xen-devel] [OT] Re: [PATCH -tip 0/2] x86: Prohibit kprobes on
 XEN_EMULATE_PREFIX
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Randy Dunlap <rdunlap@infradead.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Masami Hiramatsu <mhiramat@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCA1IFNlcCAyMDE5IDA5OjUzOjMyICswMTAwCkFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgoKPiBPbiAwNS8wOS8yMDE5IDA5OjI2LCBQZXRlciBa
aWpsc3RyYSB3cm90ZToKPiA+IE9uIFRodSwgU2VwIDA1LCAyMDE5IGF0IDA4OjU0OjE3QU0gKzAx
MDAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gPgo+ID4+IEkgZG9uJ3Qga25vdyBpZiB5b3UndmUg
c3BvdHRlZCwgYnV0IHRoZSBwcmVmaXggaXMgYSB1ZDJhIGluc3RydWN0aW9uCj4gPj4gZm9sbG93
ZWQgYnkgJ3hlbicgaW4gYXNjaWkuCj4gPj4KPiA+PiBUaGUgS1ZNIHZlcnNpb24gd2FzIGFkZGVk
IGluIGMvcyA2Yzg2ZWVkYzIwNmRkMWY5ZDM3YTI3OTZmYWE4ZTZmMjI3ODIxNWQyCj4gPiBXaGls
ZSB0aGUgWGVuIG9uZSBkaXNhc3NlYmxlcyB0byB2YWxpZCBpbnN0cnVjdGlvbnMsIHRoYXQgS1ZN
IG9uZSBkb2VzCj4gPiBub3Q6Cj4gPgo+ID4gCS50ZXh0Cj4gPiB4ZW46Cj4gPiAJdWQyOyAuYXNj
aWkgInhlbiIKPiA+IGt2bToKPiA+IAl1ZDI7IC5hc2NpaSAia3ZtIgo+ID4KPiA+IGRpc2Fzc2Vt
YmxlcyBsaWtlOgo+ID4KPiA+IDAwMDAwMDAwMDAwMDAwMDAgPHhlbj46Cj4gPiAgICAwOiAgIDBm
IDBiICAgICAgICAgICAgICAgICAgIHVkMgo+ID4gICAgMjogICA3OCA2NSAgICAgICAgICAgICAg
ICAgICBqcyAgICAgNjkgPGt2bSsweDY0Pgo+ID4gICAgNDogICA2ZSAgICAgICAgICAgICAgICAg
ICAgICBvdXRzYiAgJWRzOiglcnNpKSwoJWR4KQo+ID4gMDAwMDAwMDAwMDAwMDAwNSA8a3ZtPjoK
PiA+ICAgIDU6ICAgMGYgMGIgICAgICAgICAgICAgICAgICAgdWQyCj4gPiAgICA3OiAgIDZiICAg
ICAgICAgICAgICAgICAgICAgIC5ieXRlIDB4NmIKPiA+ICAgIDg6ICAgNzYgNmQgICAgICAgICAg
ICAgICAgICAgamJlICAgIDc3IDxrdm0rMHg3Mj4KPiA+Cj4gPiBXaGljaCBpcyBhIGJpdCB1bmZv
cnR1bmF0ZSBJIHN1cHBvc2UuIEF0IGxlYXN0IHRoZXkgZG9uJ3QgYXBwZWFyIHRvCj4gPiBjb25z
dW1lIGZ1cnRoZXIgYnl0ZXMuCj4gCj4gSXQgZG9lcyB3aGVuIHlvdSBnaXZlIG9iamR1bXAgb25l
IGV4dHJhIGJ5dGUgdG8gbG9vayBhdC4KPiAKPiAwMDAwMDAwMDAwMDAwMDA1IDxrdm0+Ogo+IMKg
wqAgNTrCoMKgwqAgMGYgMGLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgwqDCoMKgIHVk
MsKgwqDCoAo+IMKgwqAgNzrCoMKgwqAgNmIgNzYgNmQgMDDCoMKgwqDCoMKgwqDCoMKgwqAgwqDC
oMKgIGltdWzCoMKgICQweDAsMHg2ZCglcnNpKSwlZXNpCj4gCgpIbW0sIHRoYXQgY29uc3VtZXMg
dGhlIGZpcnN0IGJ5dGUgb2YgdGhlIG5leHQgaW5zdHJ1Y3Rpb24uCkZvciBleGFtcGxlLCAKCiAg
LnRleHQKeGVuOgogIHVkMjsgLmFzY2lpICJ4ZW4iOyBjcHVpZAprdm06CiAgdWQyOyAuYXNjaWkg
Imt2bSI7IGNwdWlkCgowMDAwMDAwMDAwMDAwMDAwIDx4ZW4+OgogICAwOgkwZiAwYiAgICAgICAg
ICAgICAgICAJdWQyICAgIAogICAyOgk3OCA2NSAgICAgICAgICAgICAgICAJanMgICAgIDY5IDxr
dm0rMHg2Mj4KICAgNDoJNmUgICAgICAgICAgICAgICAgICAgCW91dHNiICAlZHM6KCVyc2kpLCgl
ZHgpCiAgIDU6CTBmIGEyICAgICAgICAgICAgICAgIAljcHVpZCAgCgowMDAwMDAwMDAwMDAwMDA3
IDxrdm0+OgogICA3OgkwZiAwYiAgICAgICAgICAgICAgICAJdWQyICAgIAogICA5Ogk2YiA3NiA2
ZCAwZiAgICAgICAgICAJaW11bCAgICQweGYsMHg2ZCglcnNpKSwlZXNpCiAgIGQ6CWEyICAgICAg
ICAgICAgICAgICAgIAkuYnl0ZSAweGEyCgpUaGlzIHdpbGwgZGlzdHVyYmUgZGVjb2RpbmcgYnl0
ZXN0cmVhbS4gQW55d2F5LCB3aXRoIHRoZSBuZXh0IHZlcnNpb24KaXQgd2lsbCBiZSBmaXhlZCBp
biB4ODYgaW5zbiBkZWNvZGVyLgoKVGhhbmtzLAoKLS0gCk1hc2FtaSBIaXJhbWF0c3UgPG1oaXJh
bWF0QGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
