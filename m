Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2394F673D67
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 16:23:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481201.745966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIWl3-00012U-KC; Thu, 19 Jan 2023 15:23:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481201.745966; Thu, 19 Jan 2023 15:23:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIWl3-000103-Gq; Thu, 19 Jan 2023 15:23:17 +0000
Received: by outflank-mailman (input) for mailman id 481201;
 Thu, 19 Jan 2023 15:23:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RBPQ=5Q=citrix.com=prvs=3763d7854=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pIWl1-0000C1-Ay
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 15:23:15 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ccca58a-980d-11ed-b8d1-410ff93cb8f0;
 Thu, 19 Jan 2023 16:23:08 +0100 (CET)
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
X-Inumbo-ID: 2ccca58a-980d-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674141793;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Y3RL6Avu2AAie8vc75L0y154G/XcplbXjHREi2GuIus=;
  b=LazbwCf5k7+9FVP68DrfAsGVbPUd6GbQO1gw2nKThZy3UJlq+zpE+l99
   XIvRsXJ66EgxBtenFTMZTVPBuiYkVJgHFsBOSHha6vpprAqsK463JH+7l
   3yjHoDNSi5i5V3R2k6SnUb/VdRhPE2NxT9nL/GQ1o7T+rIbVqK6g56EY2
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 92813036
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:V73LRq/3EcU1bpayx9PaDrUDqX6TJUtcMsCJ2f8bNWPcYEJGY0x3y
 WIXXjjVP/vfNmbzed5/bIi+9xsG6p+Dm9ZlTFdr+3g8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIw1BjOkGlA5AdmPKka5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklF7
 thGEyAJViuEuPu9kJ23R8Z0jZwseZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAj3/jczpeuRSNqLA++WT7xw1tyrn9dtHSf7RmQO0ExBbB/
 TqdoQwVBDlDboy6lBag7kmzvenqximjXKEALpCBo6sCbFq7mTVIVUx+uUGAifukjk+zXfpPJ
 kpS/TAhxYAw/kG2Stj2XzWjvWWJ+BUbXrJ4DOkS+AyLjK3O7G6xHXMYRzRMbNgnss4eRjEw0
 FKN2dTzClRHoLCTDH6Q6LqQhTezIjQOa38PYzceSgkI6MWlp5s85i8jVf46TvTz1IesX2itn
 XbT9nNWa6gvYdAj3L6fo2vXhwqXoafQRV4a6gj4Rmn94VYsDGK6XLBE+WQ3/N4ZctnCHwPb5
 CdU8ySNxLtQVM/QzURhVM1IRej0vKjdbVUwlHY1R/EcGyKRF2lPlGy6yBV3Pw9XP8kNYlcFi
 2eD6FoKtPe/0JZHBJKbgr5d6Oxwl8AM7fy/CpjpgiNmO/CdjjOv8iB0flK31GvwikUqmqxXE
 c7FLpr0UyhEUvU2nGreqwIhPVkDnHhWKYT7HMCT8vha+eDGOC79pUktbjNikdzVHIvb+V6Io
 r6zxuOByglFUf2WX8Uk2dd7ELz+FlBiXcqeg5UOJoa+zv9ORDlJ5wn5nelwJOSIXs19yo/1w
 51KchIJlgSh3iWddG1nqBlLMdvSYHq2llpjVQREALpi8yN9CWpzxM/zr6cKQIQ=
IronPort-HdrOrdr: A9a23:BeG4Yq9AXioClUknJ0Ruk+DWI+orL9Y04lQ7vn2ZKCY4TiX8ra
 uTdZsguiMc5Ax+ZJhDo7C90di7IE80nKQdieN9AV7IZniEhILHFvAG0aLShxHmBi3i5qp8+M
 5bAsxD4QTLfDpHsfo=
X-IronPort-AV: E=Sophos;i="5.97,229,1669093200"; 
   d="scan'208";a="92813036"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v4 1/3] build: include/compat, remove typedefs handling
Date: Thu, 19 Jan 2023 15:22:54 +0000
Message-ID: <20230119152256.15832-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230119152256.15832-1-anthony.perard@citrix.com>
References: <20230119152256.15832-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Partial revert of c93bd0e6ea2a ("tmem: fix 32-on-64 support")
Since c492e19fdd05 ("xen: remove tmem from hypervisor"), this code
isn't used anymore.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v4:
    - new patch

 xen/tools/get-fields.sh | 57 +----------------------------------------
 1 file changed, 1 insertion(+), 56 deletions(-)

diff --git a/xen/tools/get-fields.sh b/xen/tools/get-fields.sh
index 002db2093f..ad4a7aacc6 100644
--- a/xen/tools/get-fields.sh
+++ b/xen/tools/get-fields.sh
@@ -41,34 +41,6 @@ get_fields ()
 	done
 }
 
-get_typedefs ()
-{
-	local level=1 state=
-	for token in $1
-	do
-		case "$token" in
-		typedef)
-			test $level != 1 || state=1
-			;;
-		COMPAT_HANDLE\(*\))
-			test $level != 1 -o "$state" != 1 || state=2
-			;;
-		[\{\[])
-			level=$(expr $level + 1)
-			;;
-		[\}\]])
-			level=$(expr $level - 1)
-			;;
-		";")
-			test $level != 1 || state=
-			;;
-		[a-zA-Z_]*)
-			test $level != 1 -o "$state" != 2 || echo "$token"
-			;;
-		esac
-	done
-}
-
 build_enums ()
 {
 	local level=1 kind= fields= members= named= id= token
@@ -201,21 +173,7 @@ for line in sys.stdin.readlines():
 				fi
 				;;
 			[a-zA-Z]*)
-				if [ -z "$id" -a -z "$type" -a -z "$array_type" ]
-				then
-					for id in $typedefs
-					do
-						test $id != "$token" || type=$id
-					done
-					if [ -z "$type" ]
-					then
-						id=$token
-					else
-						id=
-					fi
-				else
-					id=$token
-				fi
+				id=$token
 				;;
 			[\,\;])
 				if [ $level = 2 -a -n "$(echo $id | $SED 's,^_pad[[:digit:]]*,,')" ]
@@ -330,18 +288,6 @@ build_body ()
 			if [ -n "$array" ]
 			then
 				array="$array $token"
-			elif [ -z "$id" -a -z "$type" -a -z "$array_type" ]
-			then
-				for id in $typedefs
-				do
-					test $id != "$token" || type=$id
-				done
-				if [ -z "$type" ]
-				then
-					id=$token
-				else
-					id=
-				fi
 			else
 				id=$token
 			fi
@@ -514,7 +460,6 @@ name=${2#compat_}
 name=${name#xen}
 case "$1" in
 "!")
-	typedefs="$(get_typedefs "$list")"
 	build_enums $name "$fields"
 	build_body $name "$fields"
 	;;
-- 
Anthony PERARD


