Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1468948B41
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 20:04:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcvwb-0005ib-CP; Mon, 17 Jun 2019 18:01:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7cdP=UQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hcvwZ-0005iP-4Q
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 18:01:23 +0000
X-Inumbo-ID: e9e78b20-9129-11e9-a8fb-e79a2f8292ae
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e9e78b20-9129-11e9-a8fb-e79a2f8292ae;
 Mon, 17 Jun 2019 18:01:21 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EFDCC20861;
 Mon, 17 Jun 2019 18:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560794481;
 bh=ahzF3Fp7y/FHn+jV+hiia2Ijb0d1yAD0AfZfdURueGQ=;
 h=Date:From:To:cc:Subject:From;
 b=lyScNIj1/1ndYMHOK0i/Fdl+Fyy7+hrHK3eJhg6jsKqHU6JSKA+B249SIFbb1x4Zy
 JEH8YUvSAFFu+cIMfNu5w25Cyo5Vm9IeH5w5W2DXTaAw6ZPaL0v/J8SZNRYM8nUhbF
 3GMoKnvjLKK3Y8SWVl4VHAVleZHx26KSdTgAzh2s=
Date: Mon, 17 Jun 2019 11:01:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: fusa-sig@lists.xenproject.org
Message-ID: <alpine.DEB.2.21.1906171045560.2072@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: [Xen-devel] list of Xen external interfaces for FuSa
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
Cc: lars.kurth@citrix.com, sstabellini@kernel.org, George.Dunlap@eu.citrix.com,
 lars.kurth.xen@gmail.com, julien.grall@arm.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKVGhpcyBpcyB0aGUgbGlzdCBvZiBleHRlcm5hbCBpbnRlcmZhY2VzIHRoYXQgd2Ug
bmVlZCB0byBkb2N1bWVudCBmb3IgdGhlClhlbiBGdVNhIHdvcmsuIEkgZGl2aWRlZCBpdCBpbnRv
IGNhdGVnb3JpZXMgdG8gbWFrZSBpdCBlYXNpZXIgdG8gZGVhbAp3aXRoLiBUaGUgZG9jIGlzIGFs
c28gYXZhaWxhYmxlIGluIG1hcmtkb3duIGZvcm1hdCBvbiBnaXRodWIgWzFdLgoKQ2hlZXJzLAoK
U3RlZmFubwoKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9zc3RhYmVsbGluaS9GdVNhLmdpdAoKLS0t
CgojIEludHJvCgpUaGlzIGRvY3VtZW50IGNvdmVycyB0aGUgZXh0ZXJuYWwgaW50ZXJmYWNlcyBp
biBhIGRvbTBsZXNzIGRlcGxveW1lbnQKdGhhdCB3ZSBuZWVkIHRvIGRvY3VtZW50IGZvciBzYWZl
dHkgY2VydGlmaWNhdGlvbnMuCgpEb20wIGFuZCBYZW4gdXNlcnNwYWNlIHRvb2xzLCBzdWNoIGFz
IHhsIGFuZCBsaWJ4bCwgYXJlIG91dCBvZiBzY29wZSBmb3IKbm93LCB3ZSBhcmUgb25seSBkaXNj
dXNzaW5nIHRoZSBoeXBlcnZpc29yLiB2bV9hc3Npc3QsIHhzbSwgYXJnbyBhcmUKYWxzbyBvdXQg
b2Ygc2NvcGU6IHRoZSBhc3N1bXB0aW9uIGlzIHRoYXQgdGhleSB3aWxsIGRpc2FibGVkIHZpYQpr
Y29uZmlnLgoKCiMgRnJvbSB0aGUgdXNlciBwZXJzcGVjdGl2ZQoKLSBYZW4gaHlwZXJ2aXNvciBj
b21tYW5kIGxpbmUgb3B0aW9ucwotIERvbTBsZXNzIGRldmljZSB0cmVlIGNvbmZpZ3VyYXRpb24K
CgojIFhlbiAtIEJvb3Rsb2FkZXIgaW50ZXJmYWNlcwoKLSBtdWx0aWJvb3QKLSBYZW4gYm9vdCBw
cm90b2NvbAoKCiMgRnJvbSBhIERvbVUgcGVyc3BlY3RpdmUKCi0ga2VybmVsIGltYWdlIGZvcm1h
dAotIGJvb3QgcHJvdG9jb2wKLSBkZXZpY2UgdHJlZQotIG1lbW9yeSBtYXA6IGxvY2F0aW9uIG9m
IG1lbW9yeSBhbmQgb3RoZXIgcmVzb3VyY2VzCi0gZXhwb3NlZCBkZXZpY2VzCiAgLSBHSUMgaW50
ZXJydXB0IGNvbnRyb2xsZXIKICAtIEdlbmVyaWMgVGltZXIKICAtIHZpcnR1YWwgVUFSVCAoUEww
MTEpCi0gUFNDSQotIGh5cGVyY2FsbCBwcm90b2NvbCAoaS5lLiByZWdpc3RlcnMsIGV0Yy4pCi0g
bWVtb3J5IHNoYXJpbmcgKGkuZS4gbWVtb3J5L2NhY2hlIGF0dHJpYnV0ZXMpCgoKIyBIeXBlcmNh
bGxzIGV4cG9zZWQgdG8gYWxsIERvbVVzCgpUaGVzZSBoeXBlcmNhbGxzIGFyZSB1bnVzZWQgYnkg
ZG9tMGxlc3MgZG9tVXMsIGhvd2V2ZXIsIHRoZXkgYXJlCnN0aWxsIGV4cG9zZWQgdG8gYWxsIGRv
bVVzLgoKLSBtZW1vcnlfb3AKLSBzY2hlZF9vcAotIHhlbl92ZXJzaW9uCi0gaHZtX29wCi0gbXVs
dGljYWxsCi0gcGxhdGZvcm1fb3AKLSB2Y3B1X29wCi0gcGh5c2Rldl9vcCAoTk9QIG9uIEFybSkK
CgojIFBWIGRyaXZlcnMgaW50ZXJmYWNlcwoKRG9tMGxlc3MgZG9tVXMgY2Fubm90IHVzZSBQViBk
cml2ZXJzIHRvZGF5LiBIb3dldmVyLCB0aGVzZSBpbnRlcmZhY2VzCmFyZSBzdGlsbCBleHBvc2Vk
IHRvIHRoZW0sIGFuZCBvbmUgZGF5IHRoZXkgbWlnaHQgYmUgYWJsZSB0byB1c2UgdGhlbQpjb3Jy
ZWN0bHk6CgotIGh5cGVyY2FsbHMKICAtIGNvbnNvbGVfaW8KICAtIGdyYW50X3RhYmxlX29wCiAg
LSBldmVudF9jaGFubmVsX29wCi0geGVuc3RvcmUKICAtIHhlbnN0b3JlIGluaXRpYWxpemF0aW9u
CiAgLSB4ZW5zdG9yZSBwcm90b2NvbAogICAgLSBtZXNzYWdlIGZvcm1hdAogICAgLSBub3RpZmlj
YXRpb25zCiAgLSB4ZW5zdG9yZSBhcyBhIGJ1cwotIFBWIHByb3RvY29scwogIC0gUFYgY29uc29s
ZQogIC0gUFYgbmV0d29yawogIC0gUFYgYmxvY2sKICAKCiMgUHJpdmlsZWdlZCBoeXBlcmNhbGxz
IChkb20wIGFuZCB0b29sc3RhY2spCgotIGRvbWN0bAotIHN5c2N0bAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
