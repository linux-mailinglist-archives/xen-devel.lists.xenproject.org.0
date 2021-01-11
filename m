Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA422F1D09
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 18:50:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65214.115581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1KI-0005nb-RF; Mon, 11 Jan 2021 17:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65214.115581; Mon, 11 Jan 2021 17:49:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1KI-0005mb-Np; Mon, 11 Jan 2021 17:49:58 +0000
Received: by outflank-mailman (input) for mailman id 65214;
 Mon, 11 Jan 2021 17:49:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CE/i=GO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kz1G3-0002a6-4r
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:45:35 +0000
Received: from mo4-p04-ob.smtp.rzone.de (unknown [85.215.255.123])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d6ff848c-c88a-4999-ba76-7e94e4cbaf3d;
 Mon, 11 Jan 2021 17:44:41 +0000 (UTC)
Received: from aepfle.de by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0BHieM4G
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate)
 for <xen-devel@lists.xenproject.org>;
 Mon, 11 Jan 2021 18:44:40 +0100 (CET)
Resent-From: Olaf Hering <olaf@aepfle.de>
Resent-Date: Mon, 11 Jan 2021 18:44:35 +0100
Resent-Message-ID: <X/yOg59L7nhXf8Dp@aepfle.de>
Resent-To: xen-devel@lists.xenproject.org
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50])
 by smtpin.rzone.de (RZmta 47.12.1 OK) with ESMTPS id p0905bx0BHgR53V
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client CN "*.smtp.rzone.de",
 Issuer "TeleSec ServerPass Class 2 CA" (verified OK (+EmiG)))
 (Client hostname verified OK) for <olaf@aepfle.de>;
 Mon, 11 Jan 2021 18:42:27 +0100 (CET)
Received: from sender by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0BHgQM3E
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate) for <olaf@aepfle.de>;
 Mon, 11 Jan 2021 18:42:26 +0100 (CET)
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
X-Inumbo-ID: d6ff848c-c88a-4999-ba76-7e94e4cbaf3d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610387080;
	s=strato-dkim-0002; d=aepfle.de;
	h=Message-Id:Date:Subject:Cc:To:From:Resent-To:Resent-Date:
	Resent-From:From:Subject:Sender;
	bh=NEmS1FJ3QQ5M6GbPZXGsC+Wwr7yqBf8nvew/2n7hn90=;
	b=FHVzGLRlSO1uOtemF1V8TsHjDfYP9Xin3c/TXQohdZx9XjMWwgFva7uS/bJdhROi0Z
	GPVbUOYKYChoGDSK3XYViJKemwo0dr19dFQr/7Geq1uy8AC3hcCCPY/33+G0OkpI4ewh
	cjCi5I/KUkU+hV9IexQbg5ZBJuAYwMUiBptaR2EggAt5aunF7Wl7NCRdi9gYmmAc/mVB
	Q4ES+gYoNIkJdjlVywdnKyApXKnmet76hXtTqs5eWVTYGjq2dot+/rU72j5zDYJH+3KU
	idfO1RpWUgtIonMcu8aJPln6umx2UhWMAteKQ5X/aAOJ6blNSy10DykzijHzf1AzO16q
	iMCA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2W0g"
X-RZG-CLASS-ID: mo00
X-Envelope-From: <olaf@aepfle.de>
X-Envelope-To: <olaf@aepfle.de>
X-Delivery-Time: 1610386947
X-UID: 548955
ARC-Seal: i=1; a=rsa-sha256; t=1610386947; cv=none;
	d=strato.com; s=strato-dkim-0002;
	b=ZN6w3DGowDncfW+DX05hm5s4uwWfsGfmBzlZ8Uj3u5si1sIx3h3maM2tEtpg767J3g
	9RLmcO8v7qpqd74fnNjkMyzNs5tPxrxXg8Z5i4EmUSeAFwHv9fyVH780iwpFQcL1xU2L
	jGMrU2oPy5reCyIv47sLLwudXyKMYqJGI9Eh7AsbEziTLqHZ5ruugD36iy9TyncWl5hZ
	iBUYFTO6T1T5+4xgqAZUdm1vcdThxSuzW7CDHLvCxPxU/rEh38R/rI+4C7FVBR4k8gtz
	+k0rUKgHDI0G1egXInTr7afWutM2Yu2yyPw4zWCHBEPHkne4PLzN2XNWRIduRk8y/8WO
	o/sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1610386947;
	s=strato-dkim-0002; d=strato.com;
	h=Message-Id:Date:Subject:Cc:To:From:From:Subject:Sender;
	bh=NEmS1FJ3QQ5M6GbPZXGsC+Wwr7yqBf8nvew/2n7hn90=;
	b=g8y0sdagmzW212O7oKhzuMarccvuJ8lr82xDxdMR1lTyU79dymlFymt1B+0aLiVZhC
	e1zR8g5Odb+X1X1K4Jx9dNdm0TOKoukvQnF5+Fr1bwN5BWt9oZy7yKyLQV2jgaDWZJTY
	WLuqcWQ0F4XwNX6qOKcKHMC6Mqn3rc66LdrFBaCVa/FrEafT9QDKALA6cOSO92R/NL1g
	80pdyyupaQLx1LmaXLUJnJ/je2ukpnfk3zijH5PAMiOdYRdGpjdxU1j7XRFZCpGK/hbN
	EG+PWqfRvnuNhpGle5rMN5zBtmb0blcuhVzKpRN9IHX+oVIu/XakT+QbFE3l+Gua8ruq
	YThQ==
ARC-Authentication-Results: i=1; strato.com;
	dmarc=none header.from="aepfle.de";
	dkim=pass header.d="aepfle.de" header.s="strato-dkim-0002" header.a="rsa-sha256";
	dkim-adsp=pass;
	spf=none smtp.mailfrom="olaf@aepfle.de"
X-RZG-Expurgate: clean/normal
X-RZG-Expurgate-ID: 149500::1610386947-0000A3A5-0DBADE8E/0/0
X-RZG-CLASS-ID: mi00
Received-SPF: none
	client-ip=85.215.255.50;
	helo="mo4-p01-ob.smtp.rzone.de";
	envelope-from="olaf@aepfle.de";
	receiver=smtpin.rzone.de;
	identity=mailfrom;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610386947;
	s=strato-dkim-0002; d=aepfle.de;
	h=Message-Id:Date:Subject:Cc:To:From:From:Subject:Sender;
	bh=NEmS1FJ3QQ5M6GbPZXGsC+Wwr7yqBf8nvew/2n7hn90=;
	b=a5jjSWiSR3A17ueMjsbSid2pOZC+dOz+dLYcmnkqZBJQyeAiRqx6xfG6MxMlpwtJ74
	GXc+PzSW1b36YLrED1SIXVPxrtDbH+Nmx3x6V6M6UftSuG8MjZ7KogZ1qdjGf0/Wp2Q1
	mzR2M9CdDh8XBO/u8tiXprE4PcDOhaAEgGu5YOrHAJGGCp6bRH6yB8zqcy8VDeGhQj1m
	Eh2Zy+XYg+QgLKWXO/k5SvBCLFkyTbsuoEFY2hewwYV1Z1R5yvMpWaUzEL76woNkqjV3
	Wzlg9kKDieDQRL5IBnbD8A4m9bjIE2fhSVSly31uFCQyu4sXSaAdSBXEMqz78aM0J9mY
	14sg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2W0g"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: 
Cc: Olaf Hering <olaf@aepfle.de>
Subject: [PATCH v20210111 00/39] leftover from 2020
Date: Mon, 11 Jan 2021 18:41:45 +0100
Message-Id: <20210111174224.24714-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Various unreviewed changes.

Olaf Hering (39):
  stubdom: fix tpm_version
  xl: use proper name for bash_completion file
  docs: remove stale create example from xl.1
  docs: substitute XEN_CONFIG_DIR in xl.conf.5
  tools: add with-xen-scriptdir configure option
  Use XEN_SCRIPT_DIR to refer to /etc/xen/scripts
  xl: optionally print timestamps during xl migrate
  xl: fix description of migrate --debug
  tools: add readv_exact to libxenctrl
  tools: add xc_is_known_page_type to libxenctrl
  tools: use xc_is_known_page_type
  tools: unify type checking for data pfns in migration stream
  tools: show migration transfer rate in send_dirty_pages
  tools/guest: prepare to allocate arrays once
  tools/guest: save: move batch_pfns
  tools/guest: save: move mfns array
  tools/guest: save: move types array
  tools/guest: save: move errors array
  tools/guest: save: move iov array
  tools/guest: save: move rec_pfns array
  tools/guest: save: move guest_data array
  tools/guest: save: move local_pages array
  tools/guest: restore: move pfns array
  tools/guest: restore: move types array
  tools/guest: restore: move mfns array
  tools/guest: restore: move map_errs array
  tools/guest: restore: move mfns array in populate_pfns
  tools/guest: restore: move pfns array in populate_pfns
  tools/guest: restore: split record processing
  tools/guest: restore: split handle_page_data
  tools/guest: restore: write data directly into guest
  tools: remove tabs from code produced by libxl_save_msgs_gen.pl
  tools: recognize LIBXL_API_VERSION for 4.15
  tools: adjust libxl_domain_suspend to receive a struct props
  tools: change struct precopy_stats to precopy_stats_t
  tools: add callback to libxl for precopy_policy and precopy_stats_t
  tools: add --max_iters to libxl_domain_suspend
  tools: add --min_remaining to libxl_domain_suspend
  tools: add --abort_if_busy to libxl_domain_suspend

 .gitignore                                    |   3 +
 docs/configure.ac                             |   3 +
 ...n.5.pod => xl-disk-configuration.5.pod.in} |   2 +-
 ....pod => xl-network-configuration.5.pod.in} |   4 +-
 docs/man/xl.1.pod.in                          |  39 +-
 docs/man/{xl.conf.5.pod => xl.conf.5.pod.in}  |   8 +-
 docs/misc/block-scripts.txt                   |   2 +-
 m4/paths.m4                                   |   8 +-
 stubdom/vtpmmgr/vtpmmgr.h                     |   2 +-
 tools/include/libxl.h                         |  32 +-
 tools/include/xenguest.h                      |   7 +-
 tools/libs/ctrl/xc_private.c                  |  55 +-
 tools/libs/ctrl/xc_private.h                  |  34 ++
 tools/libs/guest/xg_sr_common.c               |  33 +-
 tools/libs/guest/xg_sr_common.h               |  88 ++-
 tools/libs/guest/xg_sr_restore.c              | 562 ++++++++++++------
 tools/libs/guest/xg_sr_save.c                 | 164 ++---
 tools/libs/guest/xg_sr_save_x86_hvm.c         |   5 +-
 tools/libs/guest/xg_sr_save_x86_pv.c          |  31 +-
 tools/libs/light/libxl_dom_save.c             |  24 +
 tools/libs/light/libxl_domain.c               |  10 +-
 tools/libs/light/libxl_internal.h             |   6 +
 tools/libs/light/libxl_save_msgs_gen.pl       |  23 +-
 tools/libs/light/libxl_stream_write.c         |   9 +-
 tools/libs/light/libxl_types.idl              |   1 +
 tools/ocaml/libs/xl/xenlight_stubs.c          |   3 +-
 tools/xl/Makefile                             |   4 +-
 tools/xl/bash-completion                      |   2 +-
 tools/xl/xl_cmdtable.c                        |  29 +-
 tools/xl/xl_migrate.c                         |  79 ++-
 tools/xl/xl_saverestore.c                     |   3 +-
 31 files changed, 901 insertions(+), 374 deletions(-)
 rename docs/man/{xl-disk-configuration.5.pod => xl-disk-configuration.5.pod.in} (99%)
 rename docs/man/{xl-network-configuration.5.pod => xl-network-configuration.5.pod.in} (98%)
 rename docs/man/{xl.conf.5.pod => xl.conf.5.pod.in} (96%)


