Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6CF43CBC2
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 16:14:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217018.376847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfjgX-00079t-QW; Wed, 27 Oct 2021 14:13:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217018.376847; Wed, 27 Oct 2021 14:13:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfjgX-00077j-N1; Wed, 27 Oct 2021 14:13:45 +0000
Received: by outflank-mailman (input) for mailman id 217018;
 Wed, 27 Oct 2021 14:13:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yfZ=PP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mfjgW-00077a-L0
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 14:13:44 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 171ace6e-3730-11ec-8461-12813bfff9fa;
 Wed, 27 Oct 2021 14:13:43 +0000 (UTC)
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
X-Inumbo-ID: 171ace6e-3730-11ec-8461-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635344023;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9O6EJPV7a2A5/ZVPN2tD/rjdbuiLIuY9TnBRQOAhMjI=;
  b=K+p7mWzzA7NXY5fMy54uuBG7MeKPFYfB4R9UKI+R1JEiXvpLN7aHnZ9p
   0qQC3uZJIST4iHnMNDfJ8l4Zfrp6qEyubzsINZKZ7DTXf24vX+omVkyWr
   iuxvJMq+xyVBT10xMpqxBZHBdXkOALH1cMRoNFXCnboGuMaS9pMD2OP64
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: uLQo/QPh8uHBjN1Zgc4Ue5bRU4fyVX26Eb+H0TUIve9U7uBUObOAWH1coRGRW/vvRpX+RuSaCT
 f8xf2ENsq4bXSsrSJ40v+ieisnTc2zlS0Cm4g+RiYKIGmNacnKsWs3DUayTi6MGM8GEhu+a55i
 N5N4kvaQ0CJ8Qg/DnwOftL5bRtgTweFaGQ7aupxRqjflnm2MJet0AZ61ObEB+T+hIF81MFtRTf
 q+dN1f9uDZAKt5KT6/BYJ0i5hH7QdjVIakes0PMX6joTTB2BT9ULD1sZkD+G1WWcrvLRy8fUs0
 fP+D6QoLeHFuWmeymiKjFhV+
X-SBRS: 5.1
X-MesageID: 56361623
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:C8FtxqlDbcZsUBmz10v4oeno5gwcIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMUTjSM66OMDGmett3bdnkpBgEvMPQnYBiQAVo+yA1EyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg2tQ32YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PRDhJ2ySzgpApPnpbpefThUFDNCGIQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQKiFO
 ZNHM2EHgBLoUQxtHXNGMcMHmOavjTraLTBTunuxnP9ii4TU5FMoi+W8WDbPQfSBTN9ZmUuwr
 Wvc82P0RBodMbS31j6t4n+qwOjVkkvTQ54fGrS+8bhxnFSZy2gXCRsXfUu6pfi/mgi1XNc3A
 1cP5iMkoKw29UqqZtrwRRu1pDiDpBF0c8pdFag25R+AzoLQ4h2FHS4UQzhZctskucQqAzsw2
 TehnszrLSxitqWPTnCQ/avSqim9URX5NkdbO3VCF1FcpYC+/sdj1XojU+qPDoaUgOz0GzPPw
 wy0hxVgxJsygckZ64CSqAWvby2XmrDFSQs85wPyV22j7x9kaIPNW7FE+WQ3/t4bc97HFgjpU
 Gws3pHEtrhXXM7leDmlGb1VRNmUC+C53CowaLKFN6Iq8Cix4DaddIRU7SAWyKxBY5tcJ2GBj
 KM+v2psCH5v0JmCMfAfj2GZUZ1CIU3c+TLNDKi8gj1mOcEZSeN/1HsyDXN8Jki0+KTWrYkxO
 I2AbeGnBmsABKJswVKeHrlGjOV0nXBknTqLGPgXKihLN5LEPBZ5rp9eaTOzgh0RtvvY8G05D
 f4Gb6NmNCmzoMWhO3KKoOb/3HgBLGQhBICeliCkXrXrH+aSI0l4U6W56ep4I+RNxv0J/s+Vr
 iDVchIJkzLX2CyYQThmn1g+MdsDq74k9illVcHtVH71s0UejXGHtvhALstmJ+B+pYSOD5dcF
 pE4RilJOdwXIhyvxtjXRcKVQFVKeEv5iASQETCiZTRjLZdsSxaQoo3vfxf19TlIBS2y7JNsr
 7ql3wLdYJwCWwU9U5qGNKPxlwu87SoHheZ/f0rUOd0PKk/ix5dndn7qhfgtLsBSdRianmmG1
 xybCAszrPXWp9Nn68HAgK2J9t/7E+Z3EkdAMXPc6LK6aXvT8ma5mNcSW+eUZzHNEmjz/fz6N
 +lSyvj9NtwBnUpL7NUgQ+o6k/pm6oK29bFAzwliEHHaVHiRC+ttciucwM1ClqxR3bsF6wG4b
 V2Cp4tBMrKTNcK7TFNIfFg5bv6O3O0/kyXJ6ahnO13z4SJ68ebVUUhWOBXQ2iVRIKEsbdEgy
 OYl/sUX9xa+mlwhNdPf1nJY8GGFL3ohVaQ7t85FXN+321RzklwSM4bBDiLW4Y2Ub4QeO0YnF
 TaYma7eiukO3UHFaXcySSDA0Oc1aU7iY/yWIIvu/2i0p+c=
IronPort-HdrOrdr: A9a23:FKoADalhg3FFxFLpsp7Wbw7tPyzpDfIs3DAbv31ZSRFFG/Fxl6
 iV8sjz8SWE7Ar5OUtQ/OxoV5PsfZqxz/JICMwqTNCftWrdyQmVxeNZjbcKqgeIc0aVygce79
 YCT0EXMqyXMbEQt6fHCWeDfOod/A==
X-IronPort-AV: E=Sophos;i="5.87,186,1631592000"; 
   d="scan'208";a="56361623"
Date: Wed, 27 Oct 2021 15:13:37 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, <iwj@xenproject.org>,
	<cardoe@cardoe.com>, <wl@xen.org>, <andrew.cooper3@citrix.com>, "Stefano
 Stabellini" <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v2 3/3] automation: add a QEMU based x86_64 Dom0/DomU test
Message-ID: <YXleke8ciibv/1qt@perard>
References: <alpine.DEB.2.21.2110251836020.4586@sstabellini-ThinkPad-T480s>
 <20211026014200.32102-3-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211026014200.32102-3-sstabellini@kernel.org>

On Mon, Oct 25, 2021 at 06:42:00PM -0700, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> Introduce a test based on QEMU to run Xen, Dom0 and start a DomU.
> This is similar to the existing qemu-alpine-arm64.sh script and test.
> The only differences are:
> - use Debian's qemu-system-x86_64 (on ARM we build our own)
> - use ipxe instead of u-boot and ImageBuilder
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
>  automation/gitlab-ci/test.yaml           | 24 ++++++
>  automation/scripts/qemu-alpine-x86_64.sh | 95 ++++++++++++++++++++++++
>  2 files changed, 119 insertions(+)
>  create mode 100755 automation/scripts/qemu-alpine-x86_64.sh
> 
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
> index 91a10febbf..43d248a604 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -47,6 +47,30 @@ qemu-alpine-arm64-gcc:
>      - /^coverity-tested\/.*/
>      - /^stable-.*/
>  
> +qemu-alpine-x86_64-gcc:
> +  stage: test
> +  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
> +  variables:
> +    CONTAINER: debian:stretch
> +  script:
> +    - ./automation/scripts/qemu-alpine-x86_64.sh 2>&1 | tee qemu-smoke-arm64.log

Maybe the log file should be called "qemu-smoke-x86_64.log" ? Or just
"qemu-smoke.log"?


I'm still not happy about the `apt install` in the middle of the test,
but I guess that will do for now:

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

