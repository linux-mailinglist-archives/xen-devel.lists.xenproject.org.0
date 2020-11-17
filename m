Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5652B6D49
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 19:24:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29204.58464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf5ec-0000K3-Fb; Tue, 17 Nov 2020 18:24:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29204.58464; Tue, 17 Nov 2020 18:24:34 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf5ec-0000Ja-CN; Tue, 17 Nov 2020 18:24:34 +0000
Received: by outflank-mailman (input) for mailman id 29204;
 Tue, 17 Nov 2020 18:24:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dD8=EX=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1kf5ea-0000JQ-9R
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 18:24:32 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1fa9788e-34b1-401f-83d8-b0ee46c4d5b4;
 Tue, 17 Nov 2020 18:24:31 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+dD8=EX=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
	id 1kf5ea-0000JQ-9R
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 18:24:32 +0000
X-Inumbo-ID: 1fa9788e-34b1-401f-83d8-b0ee46c4d5b4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1fa9788e-34b1-401f-83d8-b0ee46c4d5b4;
	Tue, 17 Nov 2020 18:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1605637471;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+xpoQqJ/pbgvLZlCMz1D78iIlwiuXy9MMBl0DGtdCWE=;
  b=CA5HiP0bTqJl34cCj37MKkMHVFDfiG8HgMgKqpkAyJkvXcgiWaOXHLjm
   UW77X5sRFZ70SInqNyhk8po1UXdMBEspaDSerOiG5V0tFFZy3Q47yWPRR
   7FGpmX21ZzFaxg7bFojPhcW5kPVXqTPKutXalRMyNsWVln2WL4oBTOsb7
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: PZ7B6VkG7TYTQ2LzJFIJRinvipug0hywn82BZW1WgXjggOwuGai/BfAMIa5zeFsaSgs3RNVUeP
 aNMbS7ycFA2wEYeeazq0OTL4nM/NVBgaogeFB2rD0j6AVldImmO9vekRPzem3mTAXMWtDHn0s1
 Ub31NwE0KhnTSGXDpNY86dadJgb9iArgWkXeh0ytArYEotGe5Rj7Eu9Ar7OIhH8Yx8xeQb8mAl
 Uk7R+fjlrbDniwA0iPQqPuRuMdvv8j4J6HzD02EloMPWcMz0xmnHpz/ElatiFrUQWc4UYYEHF8
 284=
X-SBRS: None
X-MesageID: 31385518
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,486,1596513600"; 
   d="scan'208";a="31385518"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Doug
 Goldstein" <cardoe@cardoe.com>
Subject: [PATCH v1 1/4] automation/scripts/containerize: fix DOCKER_CMD=podman
Date: Tue, 17 Nov 2020 18:24:09 +0000
Message-ID: <28469d0fea059a51694c6fa3b5bd3971696a4f13.1605636800.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <cover.1605636799.git.edvin.torok@citrix.com>
References: <cover.1605636799.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On CentOS 8 with SELinux containerize doesn't work at all:

Make sure that the source code and SSH agent directories are passed on
with SELinux relabeling enabled.
(`-security-opt label=disabled` would be another option)

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 automation/scripts/containerize | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index a75d54566c..ed991bb79c 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -7,7 +7,7 @@
 # and /etc/subgid.
 #
 docker_cmd=${DOCKER_CMD:-"docker"}
-[ "$DOCKER_CMD" = "podman" ] && userns_podman="--userns=keep-id"
+[ "$DOCKER_CMD" = "podman" ] && userns_podman="--userns=keep-id" selinux=",z"
 
 einfo() {
     echo "$*" >&2
@@ -95,9 +95,9 @@ einfo "*** Launching container ..."
 exec ${docker_cmd} run \
     ${userarg} \
     ${SSH_AUTH_SOCK:+-e SSH_AUTH_SOCK="/tmp/ssh-agent/${SSH_AUTH_NAME}"} \
-    -v "${CONTAINER_PATH}":/build:rw \
+    -v "${CONTAINER_PATH}":/build:rw${selinux} \
     -v "${HOME}/.ssh":/root/.ssh:ro \
-    ${SSH_AUTH_DIR:+-v "${SSH_AUTH_DIR}":/tmp/ssh-agent} \
+    ${SSH_AUTH_DIR:+-v "${SSH_AUTH_DIR}":/tmp/ssh-agent${selinux}} \
     ${XEN_CONFIG_EXPERT:+-e XEN_CONFIG_EXPERT=${XEN_CONFIG_EXPERT}} \
     ${CONTAINER_ARGS} \
     -${termint}i --rm -- \
-- 
2.18.4


