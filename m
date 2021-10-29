Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BDD440159
	for <lists+xen-devel@lfdr.de>; Fri, 29 Oct 2021 19:39:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218607.379120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgVpe-0007BB-Uy; Fri, 29 Oct 2021 17:38:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218607.379120; Fri, 29 Oct 2021 17:38:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgVpe-00079G-RY; Fri, 29 Oct 2021 17:38:22 +0000
Received: by outflank-mailman (input) for mailman id 218607;
 Fri, 29 Oct 2021 17:38:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o3mb=PR=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mgVpd-00079A-F6
 for xen-devel@lists.xenproject.org; Fri, 29 Oct 2021 17:38:21 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0165481e-38df-11ec-851a-12813bfff9fa;
 Fri, 29 Oct 2021 17:38:19 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 0165481e-38df-11ec-851a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635529099;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=Va98mAoUX4RdnTjPuz0JsVT0uMCpT203z8ys8F1q6+Y=;
  b=F+nWdpFOHHPBCFCNsI2AMdV+RAD7xovtJG5yp9PxvWMm7ap9t5b6+Gr4
   qA6lgHj/1eF75cCTPQXf3owljTikKZENtmoG34eXUgoOZntw83zUJmsvu
   mbbpoIslJTUZT8H6p/hLysByKaWPNQlN8jeerE+zmW4gXTGIEUd0y/UjX
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Jxj92LCB9X4dt5NWRzmxwOJIJgaYvu57mY33RgUbFi/hrXWfnOgA2Mz6QlFLa1gZIwk0JfkOK3
 9XDXx9viw1tP3ThBNb/h/j8kPIcOO13G6iJrW0ahgQqHyjRbWdGk+OO2QTanljuzLcbl9JZbJ7
 cYGUo1zKFps+FEMFIyHgjb3ytDnebtLAlBYDlfjJeN2YYIR2IJZfEest3enL1JVAOjzrRfVcyf
 xP+M8A8xj/9PmhZj6IbyAlKDnbTAbTFCCxHEnNx9cu8tZID5oBqWcZ6ETpcz7scp+L+cOxKIUE
 Gkwet5QIx5prpsr0wdSbWHJg
X-SBRS: 5.1
X-MesageID: 58604854
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:hM4S1a1jsIJYGfznsvbD5Rt2kn2cJEfYwER7XKvMYLTBsI5bpzMGn
 TFJX2/UbvmLYmSnctAlbNixoU5XsZ/Wn4NgT1M6pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan8ZqTNMEn970Es7wb9h2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhsfNo7
 O5QuJaKaxYHNPLWtMJET0QGDHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Er8IvNsT0eqgYvWlt12rxBvc6W5HTBa7N4Le02R9t1p4WQaaDO
 6L1bxJPQzuQTSMMPm0JVqkZo8X0n1akbxBX/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 mPZ/UzpDxcCLtudxDGZtHW2iYfnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM++zM
 GRNpHBo9/JrshX2EJ+tBHVUvUJooDYyeMN0KPA34juv24TevBy1IDEYE2BePYlOWNANeRQm0
 VqAntXMDDNpsaGIRX/1yop4vQ9eKgBOcjdcPX5soR8tpoC5+tlq302nosNLSfbt1rXI9SfML
 ydmRcTUr44YitIXzO2F9FTDjiPESnPhH1NtuFu/so5I6GpEiG+Zi26AtQezARVodt/xory9U
 J4swZX2AAcmVsjlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRkyb5pYJ2K0M
 BaL42u9AaO/2lPwMMebhKrqUqwXIVXIT4y5Bpg4kPIXOvCdizNrDAkxPBXNjggBYWAnkL0lO
 IfzTCpfJS1yNEiT9xLvH711+eZynkgWnDqPLbimn0XP+efPPxa9FOZaWGZim8hktctoVi2Oq
 I0BXyZLoj0CONDDjt7/qNVOcAtVcSBjbX00wuQOHtO+zsNdMDlJI5fsLXkJIuSJRoxZybXF+
 G+TQEhdxAatjHHLM1zSOHtidKnuTdB0qndiZX4gOlOh2n4CZ4ez7fhAK8trLOd/rOEzn+RpS
 /QletmbBqgdQDrw5DlAP4L2q5ZvdUr3iFvWbTalejU2Y7VpWxfNpo3/ZgLq+SRXVni3uMIyr
 qeOzATeRZZfFQ1uANyPMKCkzk+rvGhbk+V3BhOaLt5WcUTq0Y5rNy2u0aNnf5BScU3On2LI2
 RyXDBEUofj2j7U0qNSZ17qZq4qJEvdlGhYIFWfs8rvrZzLR+XCuwNEcXb/QLyzdTm795I6re
 f5Rk6PnKPQCkVtH79h8HrJswf5s7tfjveYHnAFtHXGNZFW3ELJwZHKB2JAX5KFKw7ZYvyqwW
 16OpYYGaenYZpu9HQ5DPhchY8SCyeoQy2vb4vkCKUnn4DN6oeicWkJIMhjQ0CFQIdOZ6m/+L
 TvNbCLO1zGCtw==
IronPort-HdrOrdr: A9a23:Hn5Dt6iLm5wbu35rcS6A6vG5UXBQXtQji2hC6mlwRA09TyX4ra
 yTdZEgviMc5wx/ZJhNo7690cu7IU80hKQV3WB5B97LNmTbUQCTXeJfBOXZsljdMhy72ulB1b
 pxN4hSYeeAaWSSVPyKgjWFLw==
X-IronPort-AV: E=Sophos;i="5.87,193,1631592000"; 
   d="scan'208";a="58604854"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [PATCH for-4.16 1/2] tools/golang: Regenerate bindings
Date: Fri, 29 Oct 2021 18:37:53 +0100
Message-ID: <20211029173753.22892-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <ffd27f87-9e47-12cf-2cfd-1688a19c445f@citrix.com>
References: <ffd27f87-9e47-12cf-2cfd-1688a19c445f@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

This was missed previously.

Fixes: 1e6706b0d123 ("xen/arm: Introduce gpaddr_bits field to struct xen_domctl_getdomaininfo")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>

For 4.16.  Fixing a build-time error in a change already accepted.
---
 tools/golang/xenlight/helpers.gen.go | 2 ++
 tools/golang/xenlight/types.gen.go   | 1 +
 2 files changed, 3 insertions(+)

diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
index 2449580badb6..c010f2d3a47f 100644
--- a/tools/golang/xenlight/helpers.gen.go
+++ b/tools/golang/xenlight/helpers.gen.go
@@ -323,6 +323,7 @@ x.CpuTime = uint64(xc.cpu_time)
 x.VcpuMaxId = uint32(xc.vcpu_max_id)
 x.VcpuOnline = uint32(xc.vcpu_online)
 x.Cpupool = uint32(xc.cpupool)
+x.GpaddrBits = byte(xc.gpaddr_bits)
 x.DomainType = DomainType(xc.domain_type)
 
  return nil}
@@ -355,6 +356,7 @@ xc.cpu_time = C.uint64_t(x.CpuTime)
 xc.vcpu_max_id = C.uint32_t(x.VcpuMaxId)
 xc.vcpu_online = C.uint32_t(x.VcpuOnline)
 xc.cpupool = C.uint32_t(x.Cpupool)
+xc.gpaddr_bits = C.uint8_t(x.GpaddrBits)
 xc.domain_type = C.libxl_domain_type(x.DomainType)
 
  return nil
diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
index b2e8bd1a855e..8c8c481b86f6 100644
--- a/tools/golang/xenlight/types.gen.go
+++ b/tools/golang/xenlight/types.gen.go
@@ -316,6 +316,7 @@ CpuTime uint64
 VcpuMaxId uint32
 VcpuOnline uint32
 Cpupool uint32
+GpaddrBits byte
 DomainType DomainType
 }
 
-- 
2.11.0


