Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2C52C4F2
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 12:57:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVZl4-0004B7-Bs; Tue, 28 May 2019 10:55:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=31/0=T4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hVZl2-0004B2-N6
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 10:55:04 +0000
X-Inumbo-ID: 09a07f4c-8137-11e9-9331-43a69be1d422
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 09a07f4c-8137-11e9-9331-43a69be1d422;
 Tue, 28 May 2019 10:55:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 15030ADD5;
 Tue, 28 May 2019 10:54:59 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 28 May 2019 12:54:57 +0200
Message-Id: <20190528105457.2305-1-jgross@suse.com>
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
ZSBsb2FkaW5nICh2NykKICAtICBDaGFvIEdhbwoKKiAgRml4ZXMgdG8gI0RCIGluamVjdGlvbgog
IC0gIEFuZHJldyBDb29wZXIKCiogIENQVUlEL01TUiBYZW4vdG9vbHN0YWNrIGltcHJvdmVtZW50
cwogIC0gIEFuZHJldyBDb29wZXIKCiogIEltcHJvdmVtZW50cyB0byBkb21haW5fY3Jhc2goKQog
IC0gIEFuZHJldyBDb29wZXIKCiogIEFkZCBzdXBwb3J0IGZvciBIeWdvbiBEaHlhbmEgRmFtaWx5
IDE4aCBwcm9jZXNzb3IgKHY0KQogIC0gIFB1IFdlbgoKKiAgeDJBUElDIHN1cHBvcnQgZm9yIEFN
RAogIC0gIEphbiBCZXVsaWNoCgoqICBFSUJSUwogIC0gIEFuZHJldyBDb29wZXIKCj09PSBBUk0g
PT09IAoKKiAgVEVFIG1lZGlhdG9yIChhbmQgT1AtVEVFKSBzdXBwb3J0IGluIFhFTiAodjIpCiAg
LSAgVm9sb2R5bXlyIEJhYmNodWsKCj09IENvbXBsZXRlZCA9PSAKCiogIERyb3AgdG1lbQogIC0g
IFdlaSBMaXUKCgpKdWVyZ2VuIEdyb3NzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
