Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA20A33520
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 03:07:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887082.1296650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiOdk-00041M-Qq; Thu, 13 Feb 2025 02:07:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887082.1296650; Thu, 13 Feb 2025 02:07:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiOdk-0003zT-OL; Thu, 13 Feb 2025 02:07:44 +0000
Received: by outflank-mailman (input) for mailman id 887082;
 Thu, 13 Feb 2025 02:07:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IJm2=VE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tiOdj-0003z3-L9
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 02:07:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4de6bf98-e9af-11ef-b3ef-695165c68f79;
 Thu, 13 Feb 2025 03:07:41 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 76BA65C488F;
 Thu, 13 Feb 2025 02:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 292E9C4CEE2;
 Thu, 13 Feb 2025 02:07:39 +0000 (UTC)
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
X-Inumbo-ID: 4de6bf98-e9af-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739412459;
	bh=s7OJzVFiYldzhEg99TaM0akaHE3EtiJ9UsugA4zjsqc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aM9l+BWEBzMrrDCADFavcN6aXGTgtflZuWL6dF6mG33pHXNh5QCGK+rftHuAMOVTe
	 GEABWmX2456OAnCsuxu035qAeqxUV2kgleuNnpVssNBBWkjWra5GG9uIeg5O/aN30S
	 j4DouXvm1e6K+8iD+xMEvKjaTIZn+++BgpkA4CE3Zn4j9oKB9loPDhSP0BFkKuHstw
	 cOMBTfZvCAbLjJpRABKbGnQ04RfKoAcZ9OlvcdHQGb7Z+vYcdbr0PBgzgjyPiYUjIC
	 CoU/rnMlmtk2eqsK9IhVGvzh5jfkyesbhhWIVYcS5+cQc+Gp1lnDM8l9Lf2roBVn/P
	 Wef9o7R+k7Zlw==
Date: Wed, 12 Feb 2025 18:07:37 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 2/3] automation: add jobs running tests from
 tools/tests/*
In-Reply-To: <3fbb4c6be9d9190bb2bd6427ab0f0a933c95dde1.1739409822.git-series.marmarek@invisiblethingslab.com>
Message-ID: <alpine.DEB.2.22.394.2502121802540.619090@ubuntu-linux-20-04-desktop>
References: <cover.068c7421003863de7fca1cbe6aed2af000f061a7.1739409822.git-series.marmarek@invisiblethingslab.com> <3fbb4c6be9d9190bb2bd6427ab0f0a933c95dde1.1739409822.git-series.marmarek@invisiblethingslab.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2005664794-1739412459=:619090"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2005664794-1739412459=:619090
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 13 Feb 2025, Marek Marczykowski-Górecki wrote:
> There are a bunch of tests in tools/tests/, let them run in CI.
> For each subdirectory expect "make run" will run the test, and observe
> its exit code. This way, adding new tests is easy, and they will be
> automatically picked up.
> 
> For better visibility, log test output to junit xml format, and let
> gitlab ingest it. Set SUT_ADDR variable with name/address of the system
> under test, so a network can be used to extract the file. The actual
> address is set using DHCP. And for the test internal network, still add
> the 192.168.0.1 IP (but don't replace the DHCP-provided one).
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Very nice!!

Only one comment below


> ---
>  automation/gitlab-ci/test.yaml     | 23 +++++++++++++++-
>  automation/scripts/build           |  1 +-
>  automation/scripts/qubes-x86-64.sh | 27 +++++++++++++++++-
>  automation/scripts/run-tools-tests | 47 +++++++++++++++++++++++++++++++-
>  4 files changed, 97 insertions(+), 1 deletion(-)
>  create mode 100755 automation/scripts/run-tools-tests
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 1822e3ea5fd7..c21a37933881 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -130,6 +130,7 @@
>      PCIDEV: "03:00.0"
>      PCIDEV_INTR: "MSI-X"
>      CONSOLE_OPTS: "console=com1 com1=115200,8n1"
> +    SUT_ADDR: test-2.testnet
>    artifacts:
>      paths:
>        - smoke.serial
> @@ -263,6 +264,28 @@ adl-pvshim-x86-64-gcc-debug:
>      - *x86-64-test-needs
>      - alpine-3.18-gcc-debug
>  
> +adl-tools-tests-pv-x86-64-gcc-debug:
> +  extends: .adl-x86-64
> +  script:
> +    - ./automation/scripts/qubes-x86-64.sh tools-tests-pv 2>&1 | tee ${LOGFILE}
> +  artifacts:
> +    reports:
> +      junit: tests-junit.xml
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.18-gcc-debug
> +
> +adl-tools-tests-pvh-x86-64-gcc-debug:
> +  extends: .adl-x86-64
> +  script:
> +    - ./automation/scripts/qubes-x86-64.sh tools-tests-pvh 2>&1 | tee ${LOGFILE}
> +  artifacts:
> +    reports:
> +      junit: tests-junit.xml
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.18-gcc-debug
> +
>  zen3p-smoke-x86-64-gcc-debug:
>    extends: .zen3p-x86-64
>    script:
> diff --git a/automation/scripts/build b/automation/scripts/build
> index 952599cc25c2..522efe774ef3 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -109,5 +109,6 @@ else
>      # even though dist/ contains everything, while some containers don't even
>      # build Xen
>      cp -r dist binaries/
> +    cp -r tools/tests binaries/
>      collect_xen_artefacts
>  fi
> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> index 7eb3ce1bf703..81d239cc8b75 100755
> --- a/automation/scripts/qubes-x86-64.sh
> +++ b/automation/scripts/qubes-x86-64.sh
> @@ -10,6 +10,8 @@ set -ex
>  #  - pci-pv         PV dom0,  PV domU + PCI Passthrough
>  #  - pvshim         PV dom0,  PVSHIM domU
>  #  - s3             PV dom0,  S3 suspend/resume
> +#  - tools-tests-pv PV dom0, run tests from tools/tests/*
> +#  - tools-tests-pvh PVH dom0, run tests from tools/tests/*
>  test_variant=$1
>  
>  ### defaults
> @@ -19,6 +21,7 @@ timeout=120
>  domU_type="pvh"
>  domU_vif="'bridge=xenbr0',"
>  domU_extra_config=
> +retrieve_xml=
>  
>  case "${test_variant}" in
>      ### test: smoke test & smoke test PVH & smoke test HVM & smoke test PVSHIM
> @@ -126,6 +129,21 @@ done
>  "
>          ;;
>  
> +    ### tests: tools-tests-pv, tools-tests-pvh
> +    "tools-tests-pv"|"tools-tests-pvh")
> +        retrieve_xml=1
> +        passed="test passed"
> +        domU_check=""
> +        dom0_check="
> +/tests/run-tools-tests /tests /tmp/tests-junit.xml && echo \"${passed}\"
> +nc -l -p 8080 < /tmp/tests-junit.xml >/dev/null &
> +"
> +        if [ "${test_variant}" = "tools-tests-pvh" ]; then
> +            extra_xen_opts="dom0=pvh"
> +        fi
> +
> +        ;;
> +
>      *)
>          echo "Unrecognised test_variant '${test_variant}'" >&2
>          exit 1
> @@ -178,6 +196,8 @@ mkdir srv
>  mkdir sys
>  rm var/run
>  cp -ar ../binaries/dist/install/* .
> +cp -ar ../binaries/tests .
> +cp -a ../automation/scripts/run-tools-tests tests/
>  
>  echo "#!/bin/bash
>  
> @@ -188,7 +208,8 @@ brctl addbr xenbr0
>  brctl addif xenbr0 eth0
>  ifconfig eth0 up
>  ifconfig xenbr0 up
> -ifconfig xenbr0 192.168.0.1
> +timeout 30s udhcpc -i xenbr0
> +ip addr add dev xenbr0 192.168.0.1/24
>  
>  " > etc/local.d/xen.start
>  
> @@ -272,6 +293,10 @@ if [ $timeout -le 0 ]; then
>      exit 1
>  fi
>  
> +if [ -n "$retrieve_xml" ]; then
> +    nc -w 10 "$SUT_ADDR" 8080 > tests-junit.xml </dev/null
> +fi
> +
>  sleep 1
>  
>  (grep -q "^Welcome to Alpine Linux" smoke.serial && grep -q "${passed}" smoke.serial) || exit 1
> diff --git a/automation/scripts/run-tools-tests b/automation/scripts/run-tools-tests
> new file mode 100755
> index 000000000000..242a9edad941
> --- /dev/null
> +++ b/automation/scripts/run-tools-tests
> @@ -0,0 +1,47 @@
> +#!/bin/sh

It should be /bin/bash

You could also consider -e and maybe -x


> +usage() {
> +    echo "Usage: $0 tests-dir xml-out"
> +}
> +
> +xml_out=$2
> +if [ -z "$xml_out" ]; then
> +  xml_out=/dev/null
> +fi
> +printf '<?xml version="1.0" encoding="UTF-8"?>\n' > "$xml_out"
> +printf '<testsuites name="tools.tests">\n' >> "$xml_out"
> +printf ' <testsuite name="tools.tests">\n' >> "$xml_out"
> +failed=
> +for dir in "$1"/*; do
> +    [ -d "$dir" ] || continue
> +    echo "Running test in $dir"
> +    printf '  <testcase name="%s">\n' "$dir" >> "$xml_out"
> +    ret=
> +    for f in "$dir"/*; do
> +        [ -f "$f" ] || continue
> +        [ -x "$f" ] || continue
> +        "$f" 2>&1 | tee /tmp/out
> +        ret=$?
> +        if [ "$ret" -ne 0 ]; then
> +            echo "FAILED"
> +            failed+=" $dir"
> +            printf '   <failure type="failure" message="binary %s exited with code %d">\n' "$f" "$ret" >> "$xml_out"
> +            # TODO: could use xml escaping... but current tests seems to
> +            # produce sane output
> +            cat /tmp/out >> "$xml_out"
> +            printf '   </failure>\n' "$f" "$ret" >> "$xml_out"
> +        else
> +            echo "PASSED"
> +        fi
> +    done
> +    if [ -z "$ret" ]; then
> +        printf '   <skipped type="skipped" message="test not found"/>\n' >> "$xml_out"
> +    fi
> +    printf '  </testcase>\n' "$dir" >> "$xml_out"
> +done
> +printf ' </testsuite>\n' >> "$xml_out"
> +printf '</testsuites>\n' >> "$xml_out"
> +
> +if [ -n "$failed" ]; then
> +    exit 1
> +fi
> -- 
> git-series 0.9.1
> 
--8323329-2005664794-1739412459=:619090--

