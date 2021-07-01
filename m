Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB883B9015
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 11:56:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148337.274147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytR6-0004Iw-BX; Thu, 01 Jul 2021 09:56:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148337.274147; Thu, 01 Jul 2021 09:56:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytR6-0004GU-7e; Thu, 01 Jul 2021 09:56:44 +0000
Received: by outflank-mailman (input) for mailman id 148337;
 Thu, 01 Jul 2021 09:56:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lytR4-0004GK-GV
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 09:56:42 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.216])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cda51e26-ea01-4063-ae86-dd01630ea630;
 Thu, 01 Jul 2021 09:56:40 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx619ud5Mb
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jul 2021 11:56:39 +0200 (CEST)
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
X-Inumbo-ID: cda51e26-ea01-4063-ae86-dd01630ea630
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625133399;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=mmOmmVOJVCc+eRhOPZx2VydYF30S3wGYCPZsoZJsYV4=;
    b=dE6LowpAE0s4/lMlnv5dd2IMkbK1L0V6kqIfDmXjAORSb5CrEGED/BmO+Vq1kSFPtz
    bsvJiQnPRysqb7szkH5DzQO4aCZjc93Hqi3ck4pwD/cF1MaZTh5BAm20WC7x3nBW4r5c
    Ybh1hHcRLbBpdwUHg5ZuwY5ba/5irsTf45ygIhtyhk3xwzu3RMdcjEhxbJS1+l2D/tOB
    rwZTd5Xeh6qj2GAnEv+2z/m0M59U/fVfYUW5FN8kpaCccRhZ4tr1vEQ1ZBMSwJzvdG1a
    akAvKwpQLWkmo/hg1KKR+FED3ui9hvYLZ7QHO84pTKSkG95W/ipARKJsSbC6C+1Z94i7
    bVHg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5lqlz7EsstGyDcxK3Mbajr+SQKopp1Cb0CyyaZQQ=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>
Subject: [PATCH v20210701 00/40] leftover from 2020
Date: Thu,  1 Jul 2021 11:55:55 +0200
Message-Id: <20210701095635.15648-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Various unreviewed changes, rebase to f95b7b37cf.

Olaf Hering (40):
  hotplug/Linux: fix starting of xenstored with restarting systemd
  tools: add API to work with sevaral bits at once
  xl: fix description of migrate --debug
  tools: use integer division in convert-legacy-stream
  tools: handle libxl__physmap_info.name properly in convert-legacy-stream
  tools: fix Python3.4 TypeError in format string
  tools: create libxensaverestore
  MAINTAINERS: add myself as saverestore maintainer
  tools: add readv_exact to libxenctrl
  tools: add xc_is_known_page_type to libxenctrl
  tools: use sr_is_known_page_type
  tools: unify type checking for data pfns in migration stream
  tools: unify type checking for data pfns in migration stream
  tools: show migration transfer rate in send_dirty_pages
  tools: prepare to allocate saverestore arrays once
  tools: save: move mfns array
  tools: save: move types array
  tools: save: move errors array
  tools: save: move iov array
  tools: save: move rec_pfns array
  tools: save: move guest_data array
  tools: save: move local_pages array
  tools: restore: move types array
  tools: restore: move mfns array
  tools: restore: move map_errs array
  tools: restore: move mfns array in populate_pfns
  tools: restore: move pfns array in populate_pfns
  tools: restore: split record processing
  tools: restore: split handle_page_data
  tools: restore: write data directly into guest
  tools: recognize LIBXL_API_VERSION for 4.16
  tools: adjust libxl_domain_suspend to receive a struct props
  tools: change struct precopy_stats to precopy_stats_t
  tools: add callback to libxl for precopy_policy and precopy_stats_t
  tools: add --max_iters to libxl_domain_suspend
  tools: add --min_remaining to libxl_domain_suspend
  tools: add --abort_if_busy to libxl_domain_suspend
  tools: add API for expandable bitmaps
  tools: use xg_sr_bitmap for populated_pfns
  tools/libxc: use superpages during restore of HVM guest

 .gitignore                                    |   2 +
 MAINTAINERS                                   |   6 +
 docs/man/xl.1.pod.in                          |  22 +-
 tools/hotplug/Linux/init.d/xencommons.in      |   2 +-
 tools/hotplug/Linux/launch-xenstore.in        |  40 +-
 .../Linux/systemd/xenstored.service.in        |   2 +-
 tools/include/libxl.h                         |  32 +-
 tools/include/xenguest.h                      | 186 -----
 tools/include/xensaverestore.h                | 207 ++++++
 tools/libs/Makefile                           |   1 +
 tools/libs/ctrl/xc_bitops.h                   |  28 +
 tools/libs/ctrl/xc_private.c                  |  57 +-
 tools/libs/ctrl/xc_private.h                  |   1 +
 tools/libs/guest/Makefile                     |  11 -
 tools/libs/guest/xg_dom_x86.c                 |   5 -
 tools/libs/guest/xg_offline_page.c            |   1 -
 tools/libs/guest/xg_private.h                 |   5 +
 tools/libs/guest/xg_sr_restore_x86_hvm.c      | 274 --------
 tools/libs/light/Makefile                     |   4 +-
 tools/libs/light/libxl_dom_save.c             |  24 +
 tools/libs/light/libxl_domain.c               |  10 +-
 tools/libs/light/libxl_internal.h             |   7 +
 tools/libs/light/libxl_save_helper.c          |   1 +
 tools/libs/light/libxl_save_msgs_gen.pl       |   5 +-
 tools/libs/light/libxl_stream_write.c         |   9 +-
 tools/libs/light/libxl_types.idl              |   1 +
 tools/libs/saverestore/Makefile               |  38 ++
 .../xg_sr_common.c => saverestore/common.c}   |  75 +-
 .../xg_sr_common.h => saverestore/common.h}   | 271 +++++++-
 .../common_x86.c}                             |   2 +-
 .../common_x86.h}                             |   2 +-
 .../common_x86_pv.c}                          |   2 +-
 .../common_x86_pv.h}                          |   2 +-
 .../nomigrate.c}                              |   2 +-
 .../xg_sr_restore.c => saverestore/restore.c} | 617 +++++++++--------
 tools/libs/saverestore/restore_x86_hvm.c      | 645 ++++++++++++++++++
 .../restore_x86_pv.c}                         |  70 +-
 .../xg_sr_save.c => saverestore/save.c}       | 165 ++---
 .../save_restore.h}                           |   2 -
 .../save_x86_hvm.c}                           |   7 +-
 .../save_x86_pv.c}                            |  33 +-
 .../stream_format.h}                          |   0
 tools/libs/uselibs.mk                         |   4 +-
 tools/ocaml/libs/xl/xenlight_stubs.c          |   3 +-
 tools/python/scripts/convert-legacy-stream    |  24 +-
 tools/xl/xl_cmdtable.c                        |  26 +-
 tools/xl/xl_migrate.c                         |  54 +-
 tools/xl/xl_saverestore.c                     |   3 +-
 48 files changed, 2037 insertions(+), 953 deletions(-)
 create mode 100644 tools/include/xensaverestore.h
 delete mode 100644 tools/libs/guest/xg_sr_restore_x86_hvm.c
 create mode 100644 tools/libs/saverestore/Makefile
 rename tools/libs/{guest/xg_sr_common.c => saverestore/common.c} (72%)
 rename tools/libs/{guest/xg_sr_common.h => saverestore/common.h} (67%)
 rename tools/libs/{guest/xg_sr_common_x86.c => saverestore/common_x86.c} (99%)
 rename tools/libs/{guest/xg_sr_common_x86.h => saverestore/common_x86.h} (98%)
 rename tools/libs/{guest/xg_sr_common_x86_pv.c => saverestore/common_x86_pv.c} (99%)
 rename tools/libs/{guest/xg_sr_common_x86_pv.h => saverestore/common_x86_pv.h} (98%)
 rename tools/libs/{guest/xg_nomigrate.c => saverestore/nomigrate.c} (98%)
 rename tools/libs/{guest/xg_sr_restore.c => saverestore/restore.c} (66%)
 create mode 100644 tools/libs/saverestore/restore_x86_hvm.c
 rename tools/libs/{guest/xg_sr_restore_x86_pv.c => saverestore/restore_x86_pv.c} (94%)
 rename tools/libs/{guest/xg_sr_save.c => saverestore/save.c} (88%)
 rename tools/libs/{guest/xg_save_restore.h => saverestore/save_restore.h} (98%)
 rename tools/libs/{guest/xg_sr_save_x86_hvm.c => saverestore/save_x86_hvm.c} (96%)
 rename tools/libs/{guest/xg_sr_save_x86_pv.c => saverestore/save_x86_pv.c} (97%)
 rename tools/libs/{guest/xg_sr_stream_format.h => saverestore/stream_format.h} (100%)


