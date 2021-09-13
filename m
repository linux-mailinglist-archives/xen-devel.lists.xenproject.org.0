Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0B440994C
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 18:32:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185806.334541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPorj-0001QJ-FM; Mon, 13 Sep 2021 16:31:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185806.334541; Mon, 13 Sep 2021 16:31:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPorj-0001OH-BE; Mon, 13 Sep 2021 16:31:31 +0000
Received: by outflank-mailman (input) for mailman id 185806;
 Mon, 13 Sep 2021 16:31:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mPorh-0001Nn-G3
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 16:31:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mPorh-00013O-DU
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 16:31:29 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mPorh-0006tn-CP
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 16:31:29 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1mPorf-00038U-AR; Mon, 13 Sep 2021 17:31:27 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From;
	bh=LGI6qRXBN2wzxnmRjeSiqUX0lkTiIFWU8AV8ecawCvA=; b=xy0ilulaO5pk4T+s6kM8DZ5uw3
	dptotykisPW14ibh2cswk6ieDROFFMRBliIr/ZwCGs7EJuyFnX7c/VEhlPYt0ZXfRmRgWeLmZBGfY
	ClZ+zcMrlK+yLl+D1pcqZ8DX3+LvIVfuwXZhTPDBjIGdJw69Iow+d4LOHuH+vMFNULlk=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 1/5] copyright notices: Add many missing notices
Date: Mon, 13 Sep 2021 17:31:11 +0100
Message-Id: <20210913163115.12749-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 mg-adjust-flight-makexrefs          | 16 ++++++++++++++++
 mg-blockage                         | 16 ++++++++++++++++
 mg-branch-setup                     | 16 ++++++++++++++++
 mg-crontab-install                  | 16 ++++++++++++++++
 mg-debug-fail                       | 16 ++++++++++++++++
 mg-force-push                       | 16 ++++++++++++++++
 mg-hostalloc-starvation-demo        | 16 ++++++++++++++++
 mg-list-all-branches                | 16 ++++++++++++++++
 mg-report-host-usage-tuples         | 16 ++++++++++++++++
 mg-schema-test-database             | 18 +++++++++++++++++-
 ms-flights-summary                  | 16 ++++++++++++++++
 schema/drop-old-resource-log.sql    | 16 ++++++++++++++++
 schema/flights-started-index.sql    | 16 ++++++++++++++++
 schema/host-lifecycle.sql           | 16 ++++++++++++++++
 schema/initial.sql                  | 16 ++++++++++++++++
 schema/runvars-built-index.sql      | 16 ++++++++++++++++
 schema/runvars-host-index.sql       | 16 ++++++++++++++++
 schema/runvars-revision-index.sql   | 16 ++++++++++++++++
 schema/schema-updates.sql           | 16 ++++++++++++++++
 schema/steps-broken-index.sql       | 16 ++++++++++++++++
 schema/steps-job-index.sql          | 16 ++++++++++++++++
 schema/steps-logfile-add.sql        | 16 ++++++++++++++++
 schema/steps-logfile-constraint.sql | 16 ++++++++++++++++
 schema/testid-constraint.sql        | 16 ++++++++++++++++
 standalone                          | 16 ++++++++++++++++
 ts-repeat-test                      | 16 ++++++++++++++++
 ts-xen-build-rump                   | 16 ++++++++++++++++
 27 files changed, 433 insertions(+), 1 deletion(-)

diff --git a/mg-adjust-flight-makexrefs b/mg-adjust-flight-makexrefs
index e3716c4c..73f3ed4e 100755
--- a/mg-adjust-flight-makexrefs
+++ b/mg-adjust-flight-makexrefs
@@ -23,6 +23,22 @@
 #             passing --debug in REF-CONDS too)
 #   -n      Dry run: do not actually run cs-adjust-flight
 
+# This is part of "osstest", an automated testing framework for Xen.
+# Copyright (C) 2009-2020 Citrix Inc.
+# 
+# This program is free software: you can redistribute it and/or modify
+# it under the terms of the GNU Affero General Public License as published by
+# the Free Software Foundation, either version 3 of the License, or
+# (at your option) any later version.
+# 
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU Affero General Public License for more details.
+# 
+# You should have received a copy of the GNU Affero General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+
 set -e -o posix
 
 exec 3>/dev/null
diff --git a/mg-blockage b/mg-blockage
index dbec6df5..a61cba38 100755
--- a/mg-blockage
+++ b/mg-blockage
@@ -2,6 +2,22 @@
 #
 # usage: ./mg-blockage <date-from> <date-to> <hostflag> [<extra-xinfo>]
 
+# This is part of "osstest", an automated testing framework for Xen.
+# Copyright (C) 2009-2020 Citrix Inc.
+# 
+# This program is free software: you can redistribute it and/or modify
+# it under the terms of the GNU Affero General Public License as published by
+# the Free Software Foundation, either version 3 of the License, or
+# (at your option) any later version.
+# 
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU Affero General Public License for more details.
+# 
+# You should have received a copy of the GNU Affero General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+
 use strict qw(vars refs);
 use DBI;
 use Data::Dumper;
diff --git a/mg-branch-setup b/mg-branch-setup
index de61cc5d..ec48aee1 100755
--- a/mg-branch-setup
+++ b/mg-branch-setup
@@ -15,6 +15,22 @@
 #  - create any input/output tree on xenbits
 #  - run any test flights (obviously)
 
+# This is part of "osstest", an automated testing framework for Xen.
+# Copyright (C) 2009-2020 Citrix Inc.
+# 
+# This program is free software: you can redistribute it and/or modify
+# it under the terms of the GNU Affero General Public License as published by
+# the Free Software Foundation, either version 3 of the License, or
+# (at your option) any later version.
+# 
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU Affero General Public License for more details.
+# 
+# You should have received a copy of the GNU Affero General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+
 set -e -o posix
 
 fail () { echo >&2 "$*"; exit 1; }
diff --git a/mg-crontab-install b/mg-crontab-install
index 4df8e6e8..49184dfb 100755
--- a/mg-crontab-install
+++ b/mg-crontab-install
@@ -4,6 +4,22 @@
 # where CRONTAB is a file containing a line
 #  #@@ USER@HOSTFQDN
 
+# This is part of "osstest", an automated testing framework for Xen.
+# Copyright (C) 2009-2020 Citrix Inc.
+# 
+# This program is free software: you can redistribute it and/or modify
+# it under the terms of the GNU Affero General Public License as published by
+# the Free Software Foundation, either version 3 of the License, or
+# (at your option) any later version.
+# 
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU Affero General Public License for more details.
+# 
+# You should have received a copy of the GNU Affero General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+
 set -e -o posix
 
 case "$#.$1" in
diff --git a/mg-debug-fail b/mg-debug-fail
index 47ad68ab..89e98b30 100755
--- a/mg-debug-fail
+++ b/mg-debug-fail
@@ -4,6 +4,22 @@
 # wanted.  It prints its arguments, and its stdin, to its stderr, and
 # then exits nonzero.
 
+# This is part of "osstest", an automated testing framework for Xen.
+# Copyright (C) 2009-2020 Citrix Inc.
+# 
+# This program is free software: you can redistribute it and/or modify
+# it under the terms of the GNU Affero General Public License as published by
+# the Free Software Foundation, either version 3 of the License, or
+# (at your option) any later version.
+# 
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU Affero General Public License for more details.
+# 
+# You should have received a copy of the GNU Affero General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+
 if tty >/dev/null 2>&1; then
 	exec </dev/null
 fi
diff --git a/mg-force-push b/mg-force-push
index 9c3cc786..286c1442 100755
--- a/mg-force-push
+++ b/mg-force-push
@@ -7,6 +7,22 @@
 #  valid for ap-fetch and ap-print-url
 #  the branch of flight FLIGHT
 
+# This is part of "osstest", an automated testing framework for Xen.
+# Copyright (C) 2009-2020 Citrix Inc.
+# 
+# This program is free software: you can redistribute it and/or modify
+# it under the terms of the GNU Affero General Public License as published by
+# the Free Software Foundation, either version 3 of the License, or
+# (at your option) any later version.
+# 
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU Affero General Public License for more details.
+# 
+# You should have received a copy of the GNU Affero General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+
 use strict;
 use warnings;
 
diff --git a/mg-hostalloc-starvation-demo b/mg-hostalloc-starvation-demo
index 7944cc24..f9441822 100755
--- a/mg-hostalloc-starvation-demo
+++ b/mg-hostalloc-starvation-demo
@@ -1,5 +1,21 @@
 #!/usr/bin/perl -w
 
+# This is part of "osstest", an automated testing framework for Xen.
+# Copyright (C) 2009-2020 Citrix Inc.
+# 
+# This program is free software: you can redistribute it and/or modify
+# it under the terms of the GNU Affero General Public License as published by
+# the Free Software Foundation, either version 3 of the License, or
+# (at your option) any later version.
+# 
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU Affero General Public License for more details.
+# 
+# You should have received a copy of the GNU Affero General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+
 use strict;
 BEGIN { unshift @INC, qw(.); }
 
diff --git a/mg-list-all-branches b/mg-list-all-branches
index 989b5ae7..1a04f617 100755
--- a/mg-list-all-branches
+++ b/mg-list-all-branches
@@ -2,6 +2,22 @@
 # prints on stdout a list of all the "branches"
 # mentioned in cr-daily-branch or crontab
 
+# This is part of "osstest", an automated testing framework for Xen.
+# Copyright (C) 2009-2020 Citrix Inc.
+# 
+# This program is free software: you can redistribute it and/or modify
+# it under the terms of the GNU Affero General Public License as published by
+# the Free Software Foundation, either version 3 of the License, or
+# (at your option) any later version.
+# 
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU Affero General Public License for more details.
+# 
+# You should have received a copy of the GNU Affero General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+
 use strict;
 use Sort::Versions;
 
diff --git a/mg-report-host-usage-tuples b/mg-report-host-usage-tuples
index 375da888..0837cdab 100755
--- a/mg-report-host-usage-tuples
+++ b/mg-report-host-usage-tuples
@@ -1,5 +1,21 @@
 #!/usr/bin/python3
 
+# This is part of "osstest", an automated testing framework for Xen.
+# Copyright (C) 2009-2020 Citrix Inc.
+# 
+# This program is free software: you can redistribute it and/or modify
+# it under the terms of the GNU Affero General Public License as published by
+# the Free Software Foundation, either version 3 of the License, or
+# (at your option) any later version.
+# 
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU Affero General Public License for more details.
+# 
+# You should have received a copy of the GNU Affero General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+
 import re as regexp
 import sys
 import json
diff --git a/mg-schema-test-database b/mg-schema-test-database
index 357646bb..eae5d97e 100755
--- a/mg-schema-test-database
+++ b/mg-schema-test-database
@@ -1,5 +1,21 @@
 #!/bin/bash
-#
+
+# This is part of "osstest", an automated testing framework for Xen.
+# Copyright (C) 2009-2020 Citrix Inc.
+# 
+# This program is free software: you can redistribute it and/or modify
+# it under the terms of the GNU Affero General Public License as published by
+# the Free Software Foundation, either version 3 of the License, or
+# (at your option) any later version.
+# 
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU Affero General Public License for more details.
+# 
+# You should have received a copy of the GNU Affero General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+
 # usages:
 #
 #
diff --git a/ms-flights-summary b/ms-flights-summary
index 8293d4f6..a2507249 100755
--- a/ms-flights-summary
+++ b/ms-flights-summary
@@ -1,5 +1,21 @@
 #!/usr/bin/perl -w
 
+# This is part of "osstest", an automated testing framework for Xen.
+# Copyright (C) 2009-2020 Citrix Inc.
+# 
+# This program is free software: you can redistribute it and/or modify
+# it under the terms of the GNU Affero General Public License as published by
+# the Free Software Foundation, either version 3 of the License, or
+# (at your option) any later version.
+# 
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU Affero General Public License for more details.
+# 
+# You should have received a copy of the GNU Affero General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+
 use strict qw(vars refs);
 
 BEGIN { unshift @INC, qw(.); }
diff --git a/schema/drop-old-resource-log.sql b/schema/drop-old-resource-log.sql
index 9494e1b9..f3dd9ce6 100644
--- a/schema/drop-old-resource-log.sql
+++ b/schema/drop-old-resource-log.sql
@@ -4,5 +4,21 @@
 -- aborted attempt at resource logging.  Nothing actually reads or
 -- writes it.
 
+-- This is part of "osstest", an automated testing framework for Xen.
+-- Copyright (C) 2009-2020 Citrix Inc.
+-- 
+-- This program is free software: you can redistribute it and/or modify
+-- it under the terms of the GNU Affero General Public License as published by
+-- the Free Software Foundation, either version 3 of the License, or
+-- (at your option) any later version.
+-- 
+-- This program is distributed in the hope that it will be useful,
+-- but WITHOUT ANY WARRANTY; without even the implied warranty of
+-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+-- GNU Affero General Public License for more details.
+-- 
+-- You should have received a copy of the GNU Affero General Public License
+-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
+
 DROP TABLE resource_log;
 DROP SEQUENCE resource_log_evid_seq;
diff --git a/schema/flights-started-index.sql b/schema/flights-started-index.sql
index c230d9d8..b26fc641 100644
--- a/schema/flights-started-index.sql
+++ b/schema/flights-started-index.sql
@@ -3,5 +3,21 @@
 -- This index helps ts-hosts-allocate-Executive find recent instances
 -- of the same job.  It may be useful for other things too.
 
+-- This is part of "osstest", an automated testing framework for Xen.
+-- Copyright (C) 2009-2020 Citrix Inc.
+-- 
+-- This program is free software: you can redistribute it and/or modify
+-- it under the terms of the GNU Affero General Public License as published by
+-- the Free Software Foundation, either version 3 of the License, or
+-- (at your option) any later version.
+-- 
+-- This program is distributed in the hope that it will be useful,
+-- but WITHOUT ANY WARRANTY; without even the implied warranty of
+-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+-- GNU Affero General Public License for more details.
+-- 
+-- You should have received a copy of the GNU Affero General Public License
+-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
+
 CREATE INDEX flights_blessing_started_idx
     ON flights (blessing, started);
diff --git a/schema/host-lifecycle.sql b/schema/host-lifecycle.sql
index 7e4fc2aa..6a7b2546 100644
--- a/schema/host-lifecycle.sql
+++ b/schema/host-lifecycle.sql
@@ -5,6 +5,22 @@
 -- reinitialised.  The information is persisted by being copied
 -- into a runvar for each job.
 
+-- This is part of "osstest", an automated testing framework for Xen.
+-- Copyright (C) 2009-2020 Citrix Inc.
+-- 
+-- This program is free software: you can redistribute it and/or modify
+-- it under the terms of the GNU Affero General Public License as published by
+-- the Free Software Foundation, either version 3 of the License, or
+-- (at your option) any later version.
+-- 
+-- This program is distributed in the hope that it will be useful,
+-- but WITHOUT ANY WARRANTY; without even the implied warranty of
+-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+-- GNU Affero General Public License for more details.
+-- 
+-- You should have received a copy of the GNU Affero General Public License
+-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
+
 CREATE SEQUENCE host_lifecycle_lcseq_seq
     NO CYCLE;
 
diff --git a/schema/initial.sql b/schema/initial.sql
index 4feeeb20..f9d120ae 100644
--- a/schema/initial.sql
+++ b/schema/initial.sql
@@ -2,6 +2,22 @@
 -- PostgreSQL database dump
 --
 
+-- This is part of "osstest", an automated testing framework for Xen.
+-- Copyright (C) 2009-2020 Citrix Inc.
+-- 
+-- This program is free software: you can redistribute it and/or modify
+-- it under the terms of the GNU Affero General Public License as published by
+-- the Free Software Foundation, either version 3 of the License, or
+-- (at your option) any later version.
+-- 
+-- This program is distributed in the hope that it will be useful,
+-- but WITHOUT ANY WARRANTY; without even the implied warranty of
+-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+-- GNU Affero General Public License for more details.
+-- 
+-- You should have received a copy of the GNU Affero General Public License
+-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
+
 SET statement_timeout = 0;
 SET client_encoding = 'UTF8';
 SET standard_conforming_strings = off;
diff --git a/schema/runvars-built-index.sql b/schema/runvars-built-index.sql
index 128e69e9..8d1eadc9 100644
--- a/schema/runvars-built-index.sql
+++ b/schema/runvars-built-index.sql
@@ -2,6 +2,22 @@
 --
 -- This index helps sg-report-flight find relevant flights.
 
+-- This is part of "osstest", an automated testing framework for Xen.
+-- Copyright (C) 2009-2020 Citrix Inc.
+-- 
+-- This program is free software: you can redistribute it and/or modify
+-- it under the terms of the GNU Affero General Public License as published by
+-- the Free Software Foundation, either version 3 of the License, or
+-- (at your option) any later version.
+-- 
+-- This program is distributed in the hope that it will be useful,
+-- but WITHOUT ANY WARRANTY; without even the implied warranty of
+-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+-- GNU Affero General Public License for more details.
+-- 
+-- You should have received a copy of the GNU Affero General Public License
+-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
+
 CREATE INDEX runvars_built_revision_idx
     ON runvars (val)
  WHERE name LIKE 'built\_revision\_%';
diff --git a/schema/runvars-host-index.sql b/schema/runvars-host-index.sql
index 6a3ef377..0760b219 100644
--- a/schema/runvars-host-index.sql
+++ b/schema/runvars-host-index.sql
@@ -2,6 +2,22 @@
 --
 -- This index helps sg-report-host-history find relevant flights.
 
+-- This is part of "osstest", an automated testing framework for Xen.
+-- Copyright (C) 2009-2020 Citrix Inc.
+-- 
+-- This program is free software: you can redistribute it and/or modify
+-- it under the terms of the GNU Affero General Public License as published by
+-- the Free Software Foundation, either version 3 of the License, or
+-- (at your option) any later version.
+-- 
+-- This program is distributed in the hope that it will be useful,
+-- but WITHOUT ANY WARRANTY; without even the implied warranty of
+-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+-- GNU Affero General Public License for more details.
+-- 
+-- You should have received a copy of the GNU Affero General Public License
+-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
+
 CREATE INDEX runvars_host_idx
     ON runvars (val, flight)
  WHERE name ='host'
diff --git a/schema/runvars-revision-index.sql b/schema/runvars-revision-index.sql
index 25306354..4224b644 100644
--- a/schema/runvars-revision-index.sql
+++ b/schema/runvars-revision-index.sql
@@ -2,6 +2,22 @@
 --
 -- This index helps Executive::report__find_test find relevant flights.
 
+-- This is part of "osstest", an automated testing framework for Xen.
+-- Copyright (C) 2009-2020 Citrix Inc.
+-- 
+-- This program is free software: you can redistribute it and/or modify
+-- it under the terms of the GNU Affero General Public License as published by
+-- the Free Software Foundation, either version 3 of the License, or
+-- (at your option) any later version.
+-- 
+-- This program is distributed in the hope that it will be useful,
+-- but WITHOUT ANY WARRANTY; without even the implied warranty of
+-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+-- GNU Affero General Public License for more details.
+-- 
+-- You should have received a copy of the GNU Affero General Public License
+-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
+
 CREATE INDEX runvars_revision_idx
     ON runvars (val)
  WHERE name LIKE 'revision\_%';
diff --git a/schema/schema-updates.sql b/schema/schema-updates.sql
index cd8dc0ca..9b932a81 100644
--- a/schema/schema-updates.sql
+++ b/schema/schema-updates.sql
@@ -1,5 +1,21 @@
 -- ##OSSTEST## 001 Harmless
 
+-- This is part of "osstest", an automated testing framework for Xen.
+-- Copyright (C) 2009-2020 Citrix Inc.
+-- 
+-- This program is free software: you can redistribute it and/or modify
+-- it under the terms of the GNU Affero General Public License as published by
+-- the Free Software Foundation, either version 3 of the License, or
+-- (at your option) any later version.
+-- 
+-- This program is distributed in the hope that it will be useful,
+-- but WITHOUT ANY WARRANTY; without even the implied warranty of
+-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+-- GNU Affero General Public License for more details.
+-- 
+-- You should have received a copy of the GNU Affero General Public License
+-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
+
 CREATE TABLE schema_updates (
     updatename TEXT PRIMARY KEY,
     applytime integer NOT NULL
diff --git a/schema/steps-broken-index.sql b/schema/steps-broken-index.sql
index 770747cc..d2e18d73 100644
--- a/schema/steps-broken-index.sql
+++ b/schema/steps-broken-index.sql
@@ -2,6 +2,22 @@
 --
 -- This index helps cs-bisection-flight check if flighss are broken.
 
+-- This is part of "osstest", an automated testing framework for Xen.
+-- Copyright (C) 2009-2020 Citrix Inc.
+-- 
+-- This program is free software: you can redistribute it and/or modify
+-- it under the terms of the GNU Affero General Public License as published by
+-- the Free Software Foundation, either version 3 of the License, or
+-- (at your option) any later version.
+-- 
+-- This program is distributed in the hope that it will be useful,
+-- but WITHOUT ANY WARRANTY; without even the implied warranty of
+-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+-- GNU Affero General Public License for more details.
+-- 
+-- You should have received a copy of the GNU Affero General Public License
+-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
+
 CREATE INDEX steps_broken_idx
     ON steps (flight)
  WHERE status='broken';
diff --git a/schema/steps-job-index.sql b/schema/steps-job-index.sql
index 2c33af72..21a6cf20 100644
--- a/schema/steps-job-index.sql
+++ b/schema/steps-job-index.sql
@@ -2,6 +2,22 @@
 --
 -- This index helps sg-report-flight find if a test ever passed.
 
+-- This is part of "osstest", an automated testing framework for Xen.
+-- Copyright (C) 2009-2020 Citrix Inc.
+-- 
+-- This program is free software: you can redistribute it and/or modify
+-- it under the terms of the GNU Affero General Public License as published by
+-- the Free Software Foundation, either version 3 of the License, or
+-- (at your option) any later version.
+-- 
+-- This program is distributed in the hope that it will be useful,
+-- but WITHOUT ANY WARRANTY; without even the implied warranty of
+-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+-- GNU Affero General Public License for more details.
+-- 
+-- You should have received a copy of the GNU Affero General Public License
+-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
+
 CREATE INDEX steps_job_testid_status_idx
     ON steps (job, testid, status);
 
diff --git a/schema/steps-logfile-add.sql b/schema/steps-logfile-add.sql
index abc89b9e..8be5469e 100644
--- a/schema/steps-logfile-add.sql
+++ b/schema/steps-logfile-add.sql
@@ -5,4 +5,20 @@
 --
 -- This change is compatible with old code.
 
+-- This is part of "osstest", an automated testing framework for Xen.
+-- Copyright (C) 2009-2020 Citrix Inc.
+-- 
+-- This program is free software: you can redistribute it and/or modify
+-- it under the terms of the GNU Affero General Public License as published by
+-- the Free Software Foundation, either version 3 of the License, or
+-- (at your option) any later version.
+-- 
+-- This program is distributed in the hope that it will be useful,
+-- but WITHOUT ANY WARRANTY; without even the implied warranty of
+-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+-- GNU Affero General Public License for more details.
+-- 
+-- You should have received a copy of the GNU Affero General Public License
+-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
+
 ALTER TABLE steps ADD COLUMN logfile TEXT;
diff --git a/schema/steps-logfile-constraint.sql b/schema/steps-logfile-constraint.sql
index f6f8a744..3d8b556d 100644
--- a/schema/steps-logfile-constraint.sql
+++ b/schema/steps-logfile-constraint.sql
@@ -3,6 +3,22 @@
 -- Previously, the logfile name was inferred from "stepno" and
 -- "testid".  Newer code will need it to be set explicitly.
 
+-- This is part of "osstest", an automated testing framework for Xen.
+-- Copyright (C) 2009-2020 Citrix Inc.
+-- 
+-- This program is free software: you can redistribute it and/or modify
+-- it under the terms of the GNU Affero General Public License as published by
+-- the Free Software Foundation, either version 3 of the License, or
+-- (at your option) any later version.
+-- 
+-- This program is distributed in the hope that it will be useful,
+-- but WITHOUT ANY WARRANTY; without even the implied warranty of
+-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+-- GNU Affero General Public License for more details.
+-- 
+-- You should have received a copy of the GNU Affero General Public License
+-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
+
 UPDATE steps
    SET logfile = stepno || '.' || step || '.log'
  WHERE logfile IS NULL;
diff --git a/schema/testid-constraint.sql b/schema/testid-constraint.sql
index 541f26e6..d1c3421e 100644
--- a/schema/testid-constraint.sql
+++ b/schema/testid-constraint.sql
@@ -5,6 +5,22 @@
 --
 -- The time_t value is Tue Jul  3 17:09:12 BST 2012, 5 years ago.
 
+-- This is part of "osstest", an automated testing framework for Xen.
+-- Copyright (C) 2009-2020 Citrix Inc.
+-- 
+-- This program is free software: you can redistribute it and/or modify
+-- it under the terms of the GNU Affero General Public License as published by
+-- the Free Software Foundation, either version 3 of the License, or
+-- (at your option) any later version.
+-- 
+-- This program is distributed in the hope that it will be useful,
+-- but WITHOUT ANY WARRANTY; without even the implied warranty of
+-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+-- GNU Affero General Public License for more details.
+-- 
+-- You should have received a copy of the GNU Affero General Public License
+-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
+
 WITH cutoff AS
    (SELECT 1341331754)
 UPDATE steps
diff --git a/standalone b/standalone
index 4d1f3513..bc4e8ba8 100755
--- a/standalone
+++ b/standalone
@@ -1,5 +1,21 @@
 #!/bin/bash
 
+# This is part of "osstest", an automated testing framework for Xen.
+# Copyright (C) 2009-2020 Citrix Inc.
+# 
+# This program is free software: you can redistribute it and/or modify
+# it under the terms of the GNU Affero General Public License as published by
+# the Free Software Foundation, either version 3 of the License, or
+# (at your option) any later version.
+# 
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU Affero General Public License for more details.
+# 
+# You should have received a copy of the GNU Affero General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+
 set -e -o posix
 
 usage() {
diff --git a/ts-repeat-test b/ts-repeat-test
index 5e17c335..619c0359 100755
--- a/ts-repeat-test
+++ b/ts-repeat-test
@@ -10,6 +10,22 @@
 # -          before script name means to ignore errors
 # \          at the start of any ARGSPEC is removed (after the checks above)
 
+# This is part of "osstest", an automated testing framework for Xen.
+# Copyright (C) 2009-2020 Citrix Inc.
+# 
+# This program is free software: you can redistribute it and/or modify
+# it under the terms of the GNU Affero General Public License as published by
+# the Free Software Foundation, either version 3 of the License, or
+# (at your option) any later version.
+# 
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU Affero General Public License for more details.
+# 
+# You should have received a copy of the GNU Affero General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+
 use strict;
 BEGIN { unshift @INC, qw(.); }
 use Osstest::TestSupport;
diff --git a/ts-xen-build-rump b/ts-xen-build-rump
index 9ea595b9..8b31a44b 100755
--- a/ts-xen-build-rump
+++ b/ts-xen-build-rump
@@ -1,6 +1,22 @@
 #!/bin/sh
 set -ex
 
+# This is part of "osstest", an automated testing framework for Xen.
+# Copyright (C) 2009-2020 Citrix Inc.
+# 
+# This program is free software: you can redistribute it and/or modify
+# it under the terms of the GNU Affero General Public License as published by
+# the Free Software Foundation, either version 3 of the License, or
+# (at your option) any later version.
+# 
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU Affero General Public License for more details.
+# 
+# You should have received a copy of the GNU Affero General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+
 exec ./ts-xen-build "$@"						\
 	--disable-ovmf --disable-seabios --disable-blktap2		\
 	--disable-rombios --disable-qemu-traditional			\
-- 
2.20.1


