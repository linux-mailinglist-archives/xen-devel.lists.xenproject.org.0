Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0954440F45E
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 10:47:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189092.338590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR9Vd-0003Hu-MF; Fri, 17 Sep 2021 08:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189092.338590; Fri, 17 Sep 2021 08:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR9Vd-0003CG-Hs; Fri, 17 Sep 2021 08:46:13 +0000
Received: by outflank-mailman (input) for mailman id 189092;
 Fri, 17 Sep 2021 08:46:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2OQJ=OH=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mR9Vb-0003AK-LB
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 08:46:11 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b3d53b2b-1793-11ec-b674-12813bfff9fa;
 Fri, 17 Sep 2021 08:46:09 +0000 (UTC)
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
X-Inumbo-ID: b3d53b2b-1793-11ec-b674-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631868369;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=VrbXBQo8s3hHOV5Jry2hT2yLKMoeTSgjl76QM+cDmXQ=;
  b=bPdHE0RjGqBewxIa+Pf8G8g1g847MYsApHca9R468l+Bpu+r72zUoq1f
   o1Qm7yHRVMyD2THH3S7v4YuDxKMeOrqnhN+3wyNTCkMtp6l+YKS34BDmf
   2VjyqiD/jOFK61g1rqCQ07sRQbPcbPCZZfvYCir3Ze9zmPewb93QVC4Q0
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: QUyhN+jlEdxEXNrvPpd1KLdwoLYz96c6X3mIsq8p/QyRPzrbUWk1j3asbC7SgUZJz2p1umetlx
 Mnn5DWcpmKyiEl2p2XS/yzwkFbQqyu8HwaqcwdvuRNvT4i9Z4qYQ4x/yBm1FZLOxuHAAhw5xtV
 XCTZzw+5QT/ysqv57cx5Rf27ZRFA1wvk2w/G78z6Wcup0/uy6+l1yHudsy1Joo8/022+G3YTF3
 rde0ys0UAMoa+h0bB1O2WyqachXn4WcqBocU2+zna1NATqweWyuKBrhXZUXsY90FYK46O4zAlm
 qGBWvu+bhlaYuK0wLnP2LtUm
X-SBRS: 5.1
X-MesageID: 53378055
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:V1A1zK0Mu9L6p2VqufbD5S92kn2cJEfYwER7XKvMYLTBsI5bpz0Bn
 WUZWmHQbPeDYWekLdx0OYy0pktS68DWnYUyHVM5pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan0ZqTNMEn970EoywrFh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhzvJXk
 oxLn66JbzwgOoztiOQaYRN2OnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Er8IvNsT0eqgYvWlt12rxBvc6W5HTBa7N4Le02R9t3ZsRTa6DO
 qL1bxI3NBWdWw8IG2wLCas8m8X2nSbmMAJh/Qf9Sa0fvDGIkV0ZPKLWGNjIft2HQ+1Fk0Deo
 XjJl0zbKBwHMN2UyRKe72mhwOTImEvTVIwbG7K58fprqEaO3WFVAxoTPXOkpdGph0j4XMhQQ
 2QE9yxroaUs+UiDStjmQwb+sHOCpgQbWddbD6s98g7l4qvL4S6JC24cVDlDZdc68sgsSlQCz
 USVltnkAThutry9Sn+H8LqQ6zSoNkAowXQqPHFeC1Ffup+6/d913kmnostf/LCd3//TQ2j26
 QKzihM3g5Qync4M5a+V1AWS696znaQlXjLZ9y2OADn8s1ImO9D8D2C7wQOEtqcbde51WnHE5
 SJdypbEtIjiGLnQzHTlfQkbIF2+Cx9p2hXniFhzFtEK8z238hZPlqgBvWkjeC+F3isCEAIFg
 XM/WysKv/e/31PwNMebhr5d7exxlcAM8vy/DZjpgiJmOMQZSeN+1HgGibSsM4XRfK4EyvlX1
 XCzKp3EMJrnIf4/kGreqxk1iOd2rszB+Y8jbc+ilEn2uVZvTFWUVa0EIDOzghMRtfjfyDg5B
 +13bpPQoz0GCbWWSnCOreY7cABbRVBmVMueg5EGKYa+zv9ORThJ5wn5muh6JeSIXs19y4/1w
 51KchQEkQGu2SKeclzih7IKQOqHYKuTZEkTZUQEVWtEEVB6CWp2xKtAJZYxY5c98+lvkax9Q
 /UfIp3SCfVTUDXXvT8aaMCl/oBlcR2qgyOIPjakP2djL8IxGVSR94+2ZBbr+QkPEjGz6Zk0r
 Yq/216JWpEEXQljUprbMar901OrsHEBs+tuRE+UcMJLcUDh/dEyeSz8h/M6Oe8WLhDHymfI3
 gqaG05A9+LMv5U04J/CgqXd99WlFO53H0x7GWjH7OnpaXmGrzT7mYIZCbSGZzHQUm/w6Z6OX
 +QNwqGuKuADkXZLr5F4T+Rhw5Uh6oa9vLRd1AllQinGNgz5FrN6L3Ca9sBTrakRlKRBsA67V
 0/TqNlXPbKFZJHsHFILfVd3a+2C0bcfmyXI7ORzK0L/vXcl8L2CWERUHh+NlC0Cc+clbNJ7m
 b8s6JwM9giyqhs2KdLX3Clb+lOFImEET6h65IoRB5Xmi1Zzx1xPCXAG5vQaPH1bhw1wD3QX
IronPort-HdrOrdr: A9a23:PL0HYqArr5CIKgDlHem655DYdb4zR+YMi2TC1yhKJyC9E/bo8P
 xG88566faZslossRIb6LS90cu7MBDhHPdOiOF7V9qftWHdyQ6VxepZjLcKrQeOJ8SHzJ8+6Z
 td
X-IronPort-AV: E=Sophos;i="5.85,300,1624334400"; 
   d="scan'208";a="53378055"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>, Dario Faggioli
	<dfaggioli@suse.com>
Subject: [PATCH 0/6] xen/trace: Fix leakage of uninitialised stack into the tracebuffer
Date: Fri, 17 Sep 2021 09:45:53 +0100
Message-ID: <20210917084559.22673-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

Patches 1-3 fix actual or latent bugs causing uninitialised stack to leak into
the trace buffers.  Xentrace is a developer/debugging activity restricted to
fully privileged entities, so the leaking of uninitialised stack contents is
not a security concern here.

Patches 4-6 are various pieces of cleanup.  This entire subsystem is a mess,
but the practical gains in patch 4 speak for themselves.

Andrew Cooper (6):
  xen/trace: Don't over-read trace objects
  xen/memory: Remove tail padding from TRC_MEM_* records
  xen/credit2: Remove tail padding from TRC_CSCHED2_* records
  x86/trace: Reduce stack usage from HVMTRACE_ND()
  xen/credit2: Clean up trace handling
  xen/trace: Minor code cleanup

 tools/xentrace/formats          |   4 +
 tools/xentrace/xenalyze.c       |  12 +-
 xen/arch/x86/hvm/svm/svm.c      |   8 +-
 xen/arch/x86/hvm/vmx/vmx.c      |   9 +-
 xen/arch/x86/mm/p2m-pod.c       |  17 +-
 xen/common/memory.c             |   4 +-
 xen/common/sched/credit2.c      | 343 ++++++++++++++++++++--------------------
 xen/common/trace.c              |  58 +++----
 xen/include/asm-x86/hvm/trace.h |  30 ++--
 9 files changed, 235 insertions(+), 250 deletions(-)

-- 
2.11.0


