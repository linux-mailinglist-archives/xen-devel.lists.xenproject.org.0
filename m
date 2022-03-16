Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9654DAD46
	for <lists+xen-devel@lfdr.de>; Wed, 16 Mar 2022 10:14:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291110.493903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUPj7-0008RU-FX; Wed, 16 Mar 2022 09:13:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291110.493903; Wed, 16 Mar 2022 09:13:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUPj7-0008PS-C3; Wed, 16 Mar 2022 09:13:53 +0000
Received: by outflank-mailman (input) for mailman id 291110;
 Wed, 16 Mar 2022 09:13:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vd9D=T3=citrix.com=prvs=067d42de6=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1nUPj5-0008PI-Mw
 for xen-devel@lists.xenproject.org; Wed, 16 Mar 2022 09:13:51 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6341909f-a509-11ec-8eba-a37418f5ba1a;
 Wed, 16 Mar 2022 10:13:49 +0100 (CET)
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
X-Inumbo-ID: 6341909f-a509-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647422029;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mUWg029r82H/GghoniZcMOpYWm1pwuDOVotMfQ6qkXY=;
  b=hquO9XngWyJPp9AnUCvOt8/urr+wvebfROGUT1F7QmzIL6D84W0b2Rv3
   YaZyqe8Ci4jqSWzL5AGIvcOPi8LIcDXFV1vpyTiDhKxdQyxMFL5JltCps
   pugYRn4Dm08Z6gVQTwDbbmghX2W/lVSz71Jve2tb4UoAsxCYFiXVZkn/d
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 66366073
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:sHZ7JqwkADazyfOHvsF6t+dSxirEfRIJ4+MujC+fZmUNrF6WrkVSx
 jEdWmjXP6yLNGbzKt4jPdmx9R5VvpKHzNBqHVdoqSAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NYz2IbhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl6LaSSSByHbH1h8sfUTBZPjNffvRl9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DHooZtzdFxDXQCf8gTLjIQrnQ5M8e1zA17ixLNaiAP
 JRHMWU0BPjGSy1CGg0wE7Iap72DvSjtch8Fkg+HqaVitgA/yyQuieOwYbI5YOeiVchT20qVu
 G/C12D4GQ0BcsySzyKf9XChjfOJmjn0ML/+D5XhqKQs2gfKgDVOVltGDjNXvMVVlGbjcfBfD
 Bc35hMxgqow3U2GXPi+Bj639SvsUgEnZ/JcFOgz6Qeow6XS4hqECmVscgOteODKp+dtG2V0i
 wbhc8fBQGU27ebLES71GqK892vaBMQDEYMVicbopyMh6sKrnow8hwmnoj1LQP/s1Y2d9d0dL
 lm3QMkCa1c70JZjO0aTpwmvb9eQSn7hFVZdCuL/BD7N0++BTNT5D7FEEHCChRq6EK6XT0Oao
 F8PkNWE4eYFAPmlzXLRH79cRujzt6/falUwZGKD+bF6rlxBHFb5IehtDMxWfh81Yq7ohxe0C
 KMshe+hzMAKZyb7BUOGS4mwF94r3cDd+SfNDZjpgi51SsEpLmevpXg2DWbJhjyFuBV8wMkXZ
 MbAGe7xXClyNEiS5GfvLwvr+eRwnX5WKKK6bc2T8ilLJpLFPS/LE+hZaAXSBg37hYvdyDjoH
 x9kH5Pi431ivCfWO0E7LaZ7wYg2EEUG
IronPort-HdrOrdr: A9a23:7IiSdq5ZmkDielpqUQPXwMbXdLJyesId70hD6qhwISY1TiX+rb
 HJoB17726StN9/YgBCpTntAsa9qBDnhPpICOsqTNWftWDd0QPCRuwP0WKL+UyYJ8SUzI5gPM
 lbHZSWcOeAaGRHsQ==
X-IronPort-AV: E=Sophos;i="5.90,186,1643691600"; 
   d="scan'208";a="66366073"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>
Subject: [PATCH v8 0/2] xen: Report and use hardware APIC virtualization capabilities
Date: Wed, 16 Mar 2022 09:13:13 +0000
Message-ID: <20220316091315.19281-1-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Jane Malalane (2):
  xen+tools: Report Interrupt Controller Virtualization capabilities on
    x86
  x86/xen: Allow per-domain usage of hardware virtualized APIC

 docs/man/xl.cfg.5.pod.in              | 15 ++++++++++++++
 docs/man/xl.conf.5.pod.in             | 12 +++++++++++
 tools/golang/xenlight/helpers.gen.go  | 16 ++++++++++++++
 tools/golang/xenlight/types.gen.go    |  4 ++++
 tools/include/libxl.h                 | 14 +++++++++++++
 tools/libs/light/libxl.c              |  3 +++
 tools/libs/light/libxl_arch.h         |  9 ++++++--
 tools/libs/light/libxl_arm.c          | 14 ++++++++++---
 tools/libs/light/libxl_create.c       | 22 ++++++++++++--------
 tools/libs/light/libxl_types.idl      |  4 ++++
 tools/libs/light/libxl_x86.c          | 39 +++++++++++++++++++++++++++++++++--
 tools/ocaml/libs/xc/xenctrl.ml        |  7 +++++++
 tools/ocaml/libs/xc/xenctrl.mli       |  7 +++++++
 tools/ocaml/libs/xc/xenctrl_stubs.c   | 17 ++++++++++++---
 tools/xl/xl.c                         |  8 +++++++
 tools/xl/xl.h                         |  2 ++
 tools/xl/xl_info.c                    |  6 ++++--
 tools/xl/xl_parse.c                   | 18 ++++++++++++++++
 xen/arch/x86/domain.c                 | 29 +++++++++++++++++++++++++-
 xen/arch/x86/hvm/hvm.c                |  3 +++
 xen/arch/x86/hvm/vmx/vmcs.c           | 13 ++++++++++++
 xen/arch/x86/hvm/vmx/vmx.c            | 13 ++++--------
 xen/arch/x86/include/asm/hvm/domain.h |  6 ++++++
 xen/arch/x86/include/asm/hvm/hvm.h    | 10 +++++++++
 xen/arch/x86/sysctl.c                 |  4 ++++
 xen/arch/x86/traps.c                  |  5 +++--
 xen/include/public/arch-x86/xen.h     |  2 ++
 xen/include/public/sysctl.h           | 11 +++++++++-
 28 files changed, 279 insertions(+), 34 deletions(-)

-- 
2.11.0


