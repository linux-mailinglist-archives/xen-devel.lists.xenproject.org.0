Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED55E4C7024
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 15:55:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280629.478637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOhQz-0003kR-OD; Mon, 28 Feb 2022 14:55:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280629.478637; Mon, 28 Feb 2022 14:55:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOhQz-0003hF-K6; Mon, 28 Feb 2022 14:55:33 +0000
Received: by outflank-mailman (input) for mailman id 280629;
 Mon, 28 Feb 2022 14:55:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=39Co=TL=citrix.com=prvs=0517876bc=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nOhQy-0003h4-9I
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 14:55:32 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7831c168-98a6-11ec-8539-5f4723681683;
 Mon, 28 Feb 2022 15:55:30 +0100 (CET)
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
X-Inumbo-ID: 7831c168-98a6-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646060130;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5kZofwA3P8U6tWAC3tKzOr++gyzoNwV7ywxU6kD847M=;
  b=dUzbcINd1Pnjd9jRNdouvYN9qUSGbMUC8m837JKNo3MjUgLih92iJPAw
   XOuLP/hYYRQnVXqUYeOz4DIk0AenDA+XIWaXg5AScVqHM4tqMoOiKr7CU
   khvSMJSOlvjvru70AeT0/u4z6WzUppAFSmcE1v3hMRx64LfUDUNEHNHKQ
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65542972
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:0yaJK6n+AATqUsIGiDvivR/o5gydJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJJX23VMv7fM2v1fdh/OtzgpxxSsZOBn4JjGwBlrSg2FiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DjWVPV4
 LsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYUiI0OarupOAhbxBeLBAlDPNG5eboPi3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3s3d8zTbfHLA+TIrKWani7t5ExjYgwMtJGJ4yY
 uJHNGczNkWfOXWjPH8zUap9ofz4l0DxMCFYilOxo5U13TbcmVkZPL/Fb4OOJ43iqd9utl2Du
 mvM8mD9AxcbHN+S0zyI9jSrnOCntSjyQo4VGZWz/+Rmh1DVzWsWYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiGGAlg4RXZxXCeJS1e2W4vOKuUDDXDFCF2MfLox93CMredA0/
 kSsgtTuJwBrjIGcT02srYbKrS7rFjdAeAfuehQ4ZQcC5tDipqQ6gRTOUstvHcaJszHlJd3j6
 2vU9XZj3t3/meZOjvzmpg6f31pAs7CUFlZd2+nBYo6yAuqVjqaBbpfg11XU5O0owG2xHgjY5
 yhsdyRzAYkz4XCxeM6lHb9l8FKBva/t3NjgbbhHRcRJG9OFoSPLQGyoyGsiTHqFy+5dEdMTX
 GfduBlK+LhYN2awYKl8buqZUpp2kPmwSo28Cq6MPrKih6SdkifdoUmCgmbKggjQfLUEy/lja
 f93j+72ZZrlNUiX5GXvHLpMuVPa7is/2XnSVfjGI+ePitKjiIquYe5dajOmN7lhhIvd+Vm92
 4sPZqOilkQEOMWjM3a/zGLmBQ1TRZTNLcut8JI/my/qClcOJVzN/NeKmeJxI9E+xv8N/goKl
 1nkMnJlJJPErSWvAW23hrpLMtsDgb4XQaoHABER
IronPort-HdrOrdr: A9a23:02BI9KFhZfL0U1IzpLqFrZLXdLJyesId70hD6qkvc3Jom52j+P
 xGws526fatskdtZJkh8erwXZVoMkmsiaKdgLNhcItKOTONhILGFvAa0WKP+UyCJ8S6zJ8m6U
 4CSdkzNDSTNykDsS+S2mDReLtAoOVvsprY/ts2pE0dKT2CHpsQiTuRfTzrdXGeKjM2Z6YRJd
 653I5qtjCgcXMYYoCQHX8eRdXOoNXNidbPfQMGLwRP0njBsRqYrJrBVzSI1BYXVD1ChZ0493
 LergD/7qK/99mm1x7n0XPJ5Zg+oqqh9jIDPr3NtiEmEESvtu+aXvUlZ1REhkFwnAib0idorD
 ALmWZmAy080QKWQoj/m2qT5+Cp6kdR15al8y7WvVLT5fXjQjQ0EsxAgp8cXCf4xiMbzYhB+Z
 MO5nmesZVPCxPGgWDa3PjnEz9Xtmfcmwt7rQY050YvC7f2rIUh9rA37QdbFowNEzn9751iGO
 5yDNvE7PITal+CaWvF11MfiOBEc05DaCtueHJy8/B9EgIm6UxR3g8d3ogSj30A/JUyR91N4P
 nFKL1hkPVLQtUNZaxwCe8dSY/vY1a9Cy7kISaXOxDqBasHM3XCp9r+56g0/vijfNgNwIEpkJ
 rMXVtEvSo5el7oC8eJwJpXmyq9C1mVTHDo0IVT9pJ5srrzSP7iNjCCUkknl4+6r/AWEqTgKo
 GO0VJtcovexEfVaPV0NlfFKulvwFElIb8oUmFQYSP+nv72
X-IronPort-AV: E=Sophos;i="5.90,142,1643691600"; 
   d="scan'208";a="65542972"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <wl@xen.org>, <sstabellini@kernel.org>, <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>
Subject: [XEN PATCH 0/4] Some improvement for gitlab CI jobs
Date: Mon, 28 Feb 2022 14:55:19 +0000
Message-ID: <20220228145523.8954-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.gitlab-ci-improvement-v1

Allow build and test jobs to run concurently.

Avoid running "test artifact" jobs on branch "master" and other, when test jobs
aren't runned.

Anthony PERARD (4):
  automation: fix typo in .gcc-tmpl
  automation: add a templates for test jobs
  automation: only run test artifact jobs when needed
  automation: use "needs" instead of "dependencies" for test jobs

 automation/gitlab-ci/build.yaml | 18 ++++---
 automation/gitlab-ci/test.yaml  | 89 +++++++++------------------------
 2 files changed, 37 insertions(+), 70 deletions(-)

-- 
Anthony PERARD


