Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8027E7C9AF
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 19:01:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsrw5-0004Bc-9g; Wed, 31 Jul 2019 16:58:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=onjf=V4=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hsrw3-0004BS-K8
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 16:58:43 +0000
X-Inumbo-ID: 72eff19f-b3b4-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 72eff19f-b3b4-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 16:58:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 41381AE12;
 Wed, 31 Jul 2019 16:58:41 +0000 (UTC)
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 31 Jul 2019 18:58:40 +0200
Message-ID: <156459232072.7075.5517516860417287661.stgit@Palanthas>
In-Reply-To: <156458463216.7075.10552410480716651842.stgit@Palanthas>
References: <156458463216.7075.10552410480716651842.stgit@Palanthas>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/3] automation: try to keep openSUSE Leap image
 a little smaller
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
Cc: Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VXNpbmcgYC0tbm8tcmVjb21tZW5kc2Agd2hlbiB1cGRhdGluZyBvciBpbnN0YWxsaW5nIGNvbW1h
bmRzIHNob3VsZApwcmV2ZW50IG5vbiBzdHJpY3RseSBuZWNlc3NhcnkgcGFja2FnZXMgdG8gYmUg
aW5zdGFsbGVkLgoKZG9pbmcgYSBgY2xlYW4gLWFgIGFmdGVyIGluc3RhbGxpbmcgYWxsIHRoZSBw
YWNrYWdlcywgc2hvdWxkLCBpbgp0aGVvcnksIGZyZWUgbW9yZSBzcGFjZSAoYXMgb3Bwb3NlZCB0
byB1c2luZyBqdXN0IGBjbGVhbmApLgoKU2lnbmVkLW9mZi1ieTogRGFyaW8gRmFnZ2lvbGkgPGRm
YWdnaW9saUBzdXNlLmNvbT4KLS0tCkNjOiBEb3VnIEdvbGRzdGVpbiA8Y2FyZG9lQGNhcmRvZS5j
b20+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgotLS0KIGF1dG9tYXRpb24vYnVpbGQvc3VzZS9v
cGVuc3VzZS1sZWFwLmRvY2tlcmZpbGUgfCAgICA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hdXRvbWF0aW9uL2J1
aWxkL3N1c2Uvb3BlbnN1c2UtbGVhcC5kb2NrZXJmaWxlIGIvYXV0b21hdGlvbi9idWlsZC9zdXNl
L29wZW5zdXNlLWxlYXAuZG9ja2VyZmlsZQppbmRleCA2MTRhNWM4NDA1Li5lYjcwNDE5MDAyIDEw
MDY0NAotLS0gYS9hdXRvbWF0aW9uL2J1aWxkL3N1c2Uvb3BlbnN1c2UtbGVhcC5kb2NrZXJmaWxl
CisrKyBiL2F1dG9tYXRpb24vYnVpbGQvc3VzZS9vcGVuc3VzZS1sZWFwLmRvY2tlcmZpbGUKQEAg
LTcsOCArNyw4IEBAIEVOViBVU0VSIHJvb3QKIFJVTiBta2RpciAvYnVpbGQKIFdPUktESVIgL2J1
aWxkCiAKLVJVTiB6eXBwZXIgcmVmICYmIHp5cHBlciB1cCAteQotUlVOIHp5cHBlciBpbnN0YWxs
IC15IFwKK1JVTiB6eXBwZXIgcmVmICYmIHp5cHBlciB1cCAteSAtLW5vLXJlY29tbWVuZHMKK1JV
TiB6eXBwZXIgaW5zdGFsbCAteSAtLW5vLXJlY29tbWVuZHMgXAogICAgICAgICBhY3BpY2EgXAog
ICAgICAgICBiYyBcCiAgICAgICAgIGJpbjg2IFwKQEAgLTY0LDQgKzY0LDQgQEAgUlVOIHp5cHBl
ciBpbnN0YWxsIC15IFwKICAgICAgICAgeHotZGV2ZWwgXAogICAgICAgICB6bGliLWRldmVsIFwK
ICAgICAgICAgJiYgXAotICAgICAgICB6eXBwZXIgY2xlYW4KKyAgICAgICAgenlwcGVyIGNsZWFu
IC1hCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
