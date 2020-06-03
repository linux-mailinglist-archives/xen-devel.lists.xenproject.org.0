Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 037CC1ED538
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 19:45:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgXRY-0000Yq-42; Wed, 03 Jun 2020 17:44:48 +0000
Resent-Date: Wed, 03 Jun 2020 17:44:48 +0000
Resent-Message-Id: <E1jgXRY-0000Yq-42@lists.xenproject.org>
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=umOB=7Q=patchew.org=no-reply@srs-us1.protection.inumbo.net>)
 id 1jgXRW-0000Yl-SX
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 17:44:46 +0000
X-Inumbo-ID: e8cb258c-a5c1-11ea-81bc-bc764e2007e4
Received: from sender4-of-o57.zoho.com (unknown [136.143.188.57])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8cb258c-a5c1-11ea-81bc-bc764e2007e4;
 Wed, 03 Jun 2020 17:44:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1591206280; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=mf/5XO/WCJa1vO5yYUsqcbuRELmvxawB3oAlsgo1GFDLn3WYnL0zvpSyIQPCaYppY18vdtgomHWZZZG6qyKqfuIbZorQY24lB4SJjXMTZPSjH5cS6oKmysEXHsfvxGCSiyhiBfp5Y/2CYZERrVrzzGJBb2tovPGUnci4DDhN/Zc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1591206280;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=aDOnCV6IQtXJX8qeg6Ku1tNLl+yTLwktKpyCW/ob1pM=; 
 b=mhR1GP5JJqctNZ2mdMFAeIgbG7IOWyxxVsAHd6Ax8xxJm/Xwy602ySHCplhJ4xCYv2fM3NirSJ4wv/oqoZDaHsbtgpdeNfW1/A6uacjxWN+XtdWQwufjtKCVsqm4z1H8I25LPgS4rvaardjeoHWKMxuSWmiuctnydlA23Xgcg4Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1591206278372849.3348416366575;
 Wed, 3 Jun 2020 10:44:38 -0700 (PDT)
Message-ID: <159120627656.23398.3742621530752770397@45ef0f9c86ae>
In-Reply-To: <20200603160442.3151170-1-anthony.perard@citrix.com>
Subject: Re: [PATCH v3] xen: fix build without pci passthrough
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: anthony.perard@citrix.com
Date: Wed, 3 Jun 2020 10:44:38 -0700 (PDT)
X-ZohoMailClient: External
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org, ehabkost@redhat.com, paul@xen.org, mst@redhat.com,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org, rth@twiddle.net,
 roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDYwMzE2MDQ0Mi4zMTUx
MTcwLTEtYW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbS8KCgoKSGksCgpUaGlzIHNlcmllcyBmYWls
ZWQgdGhlIGRvY2tlci1taW5nd0BmZWRvcmEgYnVpbGQgdGVzdC4gUGxlYXNlIGZpbmQgdGhlIHRl
c3RpbmcgY29tbWFuZHMgYW5kCnRoZWlyIG91dHB1dCBiZWxvdy4gSWYgeW91IGhhdmUgRG9ja2Vy
IGluc3RhbGxlZCwgeW91IGNhbiBwcm9iYWJseSByZXByb2R1Y2UgaXQKbG9jYWxseS4KCj09PSBU
RVNUIFNDUklQVCBCRUdJTiA9PT0KIyEgL2Jpbi9iYXNoCmV4cG9ydCBBUkNIPXg4Nl82NAptYWtl
IGRvY2tlci1pbWFnZS1mZWRvcmEgVj0xIE5FVFdPUks9MQp0aW1lIG1ha2UgZG9ja2VyLXRlc3Qt
bWluZ3dAZmVkb3JhIEo9MTQgTkVUV09SSz0xCj09PSBURVNUIFNDUklQVCBFTkQgPT09CgogIEND
ICAgICAgaW8vY2hhbm5lbC1zb2NrZXQubwpJbiBmaWxlIGluY2x1ZGVkIGZyb20gL3RtcC9xZW11
LXRlc3Qvc3JjL2h3L3hlbi94ZW5fcHQuaDo0LAogICAgICAgICAgICAgICAgIGZyb20gL3RtcC9x
ZW11LXRlc3Qvc3JjL3N0dWJzL3hlbi1wdC5jOjk6Ci90bXAvcWVtdS10ZXN0L3NyYy9pbmNsdWRl
L2h3L3hlbi94ZW5fY29tbW9uLmg6MTM6MTA6IGZhdGFsIGVycm9yOiB4ZW5jdHJsLmg6IE5vIHN1
Y2ggZmlsZSBvciBkaXJlY3RvcnkKICNpbmNsdWRlIDx4ZW5jdHJsLmg+CiAgICAgICAgICBefn5+
fn5+fn5+fgpjb21waWxhdGlvbiB0ZXJtaW5hdGVkLgptYWtlOiAqKiogWy90bXAvcWVtdS10ZXN0
L3NyYy9ydWxlcy5tYWs6Njk6IHN0dWJzL3hlbi1wdC5vXSBFcnJvciAxCm1ha2U6ICoqKiBXYWl0
aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uCiAgQ0MgICAgICBpby9jaGFubmVsLXRscy5vCiAg
Q0MgICAgICBpby9jaGFubmVsLXdhdGNoLm8KLS0tCiAgICByYWlzZSBDYWxsZWRQcm9jZXNzRXJy
b3IocmV0Y29kZSwgY21kKQpzdWJwcm9jZXNzLkNhbGxlZFByb2Nlc3NFcnJvcjogQ29tbWFuZCAn
WydzdWRvJywgJy1uJywgJ2RvY2tlcicsICdydW4nLCAnLS1sYWJlbCcsICdjb20ucWVtdS5pbnN0
YW5jZS51dWlkPWNkMDNlY2VhNGM0MzQ1Mjk4ODY0NTI5YzhiZDU2Y2MyJywgJy11JywgJzEwMDEn
LCAnLS1zZWN1cml0eS1vcHQnLCAnc2VjY29tcD11bmNvbmZpbmVkJywgJy0tcm0nLCAnLWUnLCAn
VEFSR0VUX0xJU1Q9JywgJy1lJywgJ0VYVFJBX0NPTkZJR1VSRV9PUFRTPScsICctZScsICdWPScs
ICctZScsICdKPTE0JywgJy1lJywgJ0RFQlVHPScsICctZScsICdTSE9XX0VOVj0nLCAnLWUnLCAn
Q0NBQ0hFX0RJUj0vdmFyL3RtcC9jY2FjaGUnLCAnLXYnLCAnL2hvbWUvcGF0Y2hldy8uY2FjaGUv
cWVtdS1kb2NrZXItY2NhY2hlOi92YXIvdG1wL2NjYWNoZTp6JywgJy12JywgJy92YXIvdG1wL3Bh
dGNoZXctdGVzdGVyLXRtcC1mbXkzbWYxei9zcmMvZG9ja2VyLXNyYy4yMDIwLTA2LTAzLTEzLjQy
LjE5LjIyMDU5Oi92YXIvdG1wL3FlbXU6eixybycsICdxZW11OmZlZG9yYScsICcvdmFyL3RtcC9x
ZW11L3J1bicsICd0ZXN0LW1pbmd3J10nIHJldHVybmVkIG5vbi16ZXJvIGV4aXQgc3RhdHVzIDIu
CmZpbHRlcj0tLWZpbHRlcj1sYWJlbD1jb20ucWVtdS5pbnN0YW5jZS51dWlkPWNkMDNlY2VhNGM0
MzQ1Mjk4ODY0NTI5YzhiZDU2Y2MyCm1ha2VbMV06ICoqKiBbZG9ja2VyLXJ1bl0gRXJyb3IgMQpt
YWtlWzFdOiBMZWF2aW5nIGRpcmVjdG9yeSBgL3Zhci90bXAvcGF0Y2hldy10ZXN0ZXItdG1wLWZt
eTNtZjF6L3NyYycKbWFrZTogKioqIFtkb2NrZXItcnVuLXRlc3QtbWluZ3dAZmVkb3JhXSBFcnJv
ciAyCgpyZWFsICAgIDJtMTcuODAzcwp1c2VyICAgIDBtOS4xMDRzCgoKVGhlIGZ1bGwgbG9nIGlz
IGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIwMDYwMzE2MDQ0Mi4zMTUx
MTcwLTEtYW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbS90ZXN0aW5nLmRvY2tlci1taW5nd0BmZWRv
cmEvP3R5cGU9bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBh
dGNoZXcgW2h0dHBzOi8vcGF0Y2hldy5vcmcvXS4KUGxlYXNlIHNlbmQgeW91ciBmZWVkYmFjayB0
byBwYXRjaGV3LWRldmVsQHJlZGhhdC5jb20=

