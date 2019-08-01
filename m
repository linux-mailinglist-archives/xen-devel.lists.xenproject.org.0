Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE697DFB3
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 18:04:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htDVg-0004ov-3y; Thu, 01 Aug 2019 16:00:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6jP+=V5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1htDVe-0004op-Ca
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 16:00:54 +0000
X-Inumbo-ID: 89ab62bb-b475-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 89ab62bb-b475-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 16:00:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AB6A7AC0C;
 Thu,  1 Aug 2019 16:00:51 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  1 Aug 2019 18:00:48 +0200
Message-Id: <20190801160048.11031-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
Subject: [Xen-devel] [ANNOUNCE] Xen 4.13 Development Update
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
Reply-To: xen-devel@lists.xenproject.org, jgross@suse.com
Cc: jgross@suse.com, luwei.kang@intel.com, wl@xen.org, konrad.wilk@oracle.com,
 andrew.cooper3@citrix.com, marmarek@invisiblethingslab.com, dfaggioli@suse.com,
 paul.durrant@citrix.com, JBeulich@suse.com, puwen@hygon.cn,
 Volodymyr_Babchuk@epam.com, chao.gao@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBlbWFpbCBvbmx5IHRyYWNrcyBiaWcgaXRlbXMgZm9yIHhlbi5naXQgdHJlZS4gUGxlYXNl
IHJlcGx5IGZvciBpdGVtcyB5b3UKd291bGQgbGlrZSB0byBzZWUgaW4gNC4xMyBzbyB0aGF0IHBl
b3BsZSBoYXZlIGFuIGlkZWEgd2hhdCBpcyBnb2luZyBvbiBhbmQKcHJpb3JpdGlzZSBhY2NvcmRp
bmdseS4KCllvdSdyZSB3ZWxjb21lIHRvIHByb3ZpZGUgZGVzY3JpcHRpb24gYW5kIHVzZSBjYXNl
cyBvZiB0aGUgZmVhdHVyZSB5b3UncmUKd29ya2luZyBvbi4KCj0gVGltZWxpbmUgPQoKV2Ugbm93
IGFkb3B0IGEgZml4ZWQgY3V0LW9mZiBkYXRlIHNjaGVtZS4gV2Ugd2lsbCByZWxlYXNlIGFib3V0
IGV2ZXJ5IDggbW9udGhzLgpUaGUgdXBjb21pbmcgNC4xMyB0aW1lbGluZSBhcmUgYXMgZm9sbG93
ZWQ6CgoqIExhc3QgcG9zdGluZyBkYXRlOiBTZXB0ZW1iZXIgMTN0aCwgMjAxOQoqIEhhcmQgY29k
ZSBmcmVlemU6IFNlcHRlbWJlciAyN3RoLCAyMDE5CiogUkMxOiBUQkQKKiBSZWxlYXNlOiBOb3Zl
bWJlciA3dGgsIDIwMTkKCk5vdGUgdGhhdCB3ZSBkb24ndCBoYXZlIGZyZWV6ZSBleGNlcHRpb24g
c2NoZW1lIGFueW1vcmUuIEFsbCBwYXRjaGVzCnRoYXQgd2lzaCB0byBnbyBpbnRvIDQuMTMgbXVz
dCBiZSBwb3N0ZWQgaW5pdGlhbGx5IG5vIGxhdGVyIHRoYW4gdGhlCmxhc3QgcG9zdGluZyBkYXRl
IGFuZCBmaW5hbGx5IG5vIGxhdGVyIHRoYW4gdGhlIGhhcmQgY29kZSBmcmVlemUuIEFsbApwYXRj
aGVzIHBvc3RlZCBhZnRlciB0aGF0IGRhdGUgd2lsbCBiZSBhdXRvbWF0aWNhbGx5IHF1ZXVlZCBp
bnRvIG5leHQKcmVsZWFzZS4KClJDcyB3aWxsIGJlIGFycmFuZ2VkIGltbWVkaWF0ZWx5IGFmdGVy
IGZyZWV6ZS4KCldlIHJlY2VudGx5IGludHJvZHVjZWQgYSBqaXJhIGluc3RhbmNlIHRvIHRyYWNr
IGFsbCB0aGUgdGFza3MgKG5vdCBvbmx5IGJpZykKZm9yIHRoZSBwcm9qZWN0LiBTZWU6IGh0dHBz
Oi8veGVucHJvamVjdC5hdGxhc3NpYW4ubmV0L3Byb2plY3RzL1hFTi9pc3N1ZXMuCgpTb21lIG9m
IHRoZSB0YXNrcyB0cmFja2VkIGJ5IHRoaXMgZS1tYWlsIGFsc28gaGF2ZSBhIGNvcnJlc3BvbmRp
bmcgamlyYSB0YXNrCnJlZmVycmVkIGJ5IFhFTi1OLgoKSSBoYXZlIHN0YXJ0ZWQgdG8gaW5jbHVk
ZSB0aGUgdmVyc2lvbiBudW1iZXIgb2Ygc2VyaWVzIGFzc29jaWF0ZWQgdG8gZWFjaApmZWF0dXJl
LiBDYW4gZWFjaCBvd25lciBzZW5kIGFuIHVwZGF0ZSBvbiB0aGUgdmVyc2lvbiBudW1iZXIgaWYg
dGhlIHNlcmllcwp3YXMgcG9zdGVkIHVwc3RyZWFtPwoKPSBQcm9qZWN0cyA9Cgo9PSBIeXBlcnZp
c29yID09IAoKKiAgUGVyLWNwdSB0YXNrbGV0CiAgLSAgWEVOLTI4CiAgLSAgS29ucmFkIFJ6ZXN6
dXRlayBXaWxrCgoqICBJbXByb3ZlbWVudHMgdG8gZG9tYWluIGNyZWF0aW9uICh2MikKICAtICBB
bmRyZXcgQ29vcGVyCgoqICBDb3JlIGF3YXJlIHNjaGVkdWxpbmcgKFJGQyB2MSkKICAtICBEYXJp
byBGYWdnaW9saQoKKiAgQ29yZSBhd2FyZSBzY2hlZHVsaW5nIGZvciBjcmVkaXQyIChSRkMgdjEp
CiAgLSAgRGFyaW8gRmFnZ2lvbGkKCiogIENvcmUgc2NoZWR1bGluZyAodjEpCiAgLSAgSnVlcmdl
biBHcm9zcwoKKiAgU3dpdGNoIHRvIHVzZSBkb21oZWFwIHBhZ2UgZm9yIHBhZ2UgdGFibGUgKFJG
QyB2MSkKICAtICBXZWkgTGl1Cgo9PT0geDg2ID09PSAKCiogIFBWLUlPTU1VICh2NykKICAtICBQ
YXVsIER1cnJhbnQKCiogIEhWTSBndWVzdCBDUFUgdG9wb2xvZ3kgc3VwcG9ydCAoUkZDKQogIC0g
IENoYW8gR2FvCgoqICBJbnRlbCBQcm9jZXNzb3IgVHJhY2UgdmlydHVhbGl6YXRpb24gZW5hYmxp
bmcgKHYxKQogIC0gIEx1d2VpIEthbmcKCiogIExpbnV4IHN0dWIgZG9tYWlucyAoUkZDIHYyKQog
IC0gIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraQoKKiAgSW1wcm92ZSBsYXRlIG1pY3JvY29k
ZSBsb2FkaW5nICh2OCkKICAtICBDaGFvIEdhbwoKKiAgRml4ZXMgdG8gI0RCIGluamVjdGlvbgog
IC0gIEFuZHJldyBDb29wZXIKCiogIENQVUlEL01TUiBYZW4vdG9vbHN0YWNrIGltcHJvdmVtZW50
cwogIC0gIEFuZHJldyBDb29wZXIKCiogIEltcHJvdmVtZW50cyB0byBkb21haW5fY3Jhc2goKQog
IC0gIEFuZHJldyBDb29wZXIKCiogIEVJQlJTCiAgLSAgQW5kcmV3IENvb3BlcgoKPT09IEFSTSA9
PT0gCgoqICBURUUgbWVkaWF0b3IgKGFuZCBPUC1URUUpIHN1cHBvcnQgaW4gWEVOICh2NykKICAt
ICBWb2xvZHlteXIgQmFiY2h1awoKPT0gQ29tcGxldGVkID09IAoKKiAgRHJvcCB0bWVtCiAgLSAg
V2VpIExpdQoKKiAgQWRkIHN1cHBvcnQgZm9yIEh5Z29uIERoeWFuYSBGYW1pbHkgMThoIHByb2Nl
c3NvcgogIC0gIFB1IFdlbgoKKiAgaHlwZXJ2aXNvciB4ODYgaW5zdHJ1Y3Rpb24gZW11bGF0b3Ig
YWRkaXRpb25zIGZvciBBVlg1MTIKICAtICBKYW4gQmV1bGljaAoKKiAgeDJBUElDIHN1cHBvcnQg
Zm9yIEFNRAogIC0gIEphbiBCZXVsaWNoCgoKSnVlcmdlbiBHcm9zcwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
