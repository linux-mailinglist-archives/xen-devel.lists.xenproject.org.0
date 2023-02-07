Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A5968DD2C
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 16:37:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491316.760389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPQ2G-0003Qw-GN; Tue, 07 Feb 2023 15:37:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491316.760389; Tue, 07 Feb 2023 15:37:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPQ2G-0003Ot-Dj; Tue, 07 Feb 2023 15:37:32 +0000
Received: by outflank-mailman (input) for mailman id 491316;
 Tue, 07 Feb 2023 15:37:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=if6N=6D=citrix.com=prvs=3954b4a48=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pPQ2F-0003On-P2
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 15:37:31 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5369dfb1-a6fd-11ed-933c-83870f6b2ba8;
 Tue, 07 Feb 2023 16:37:29 +0100 (CET)
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
X-Inumbo-ID: 5369dfb1-a6fd-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675784249;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MzFiCAJWokp+6zcRaC5Zzpqym3xpJR7o9NQ472GezWo=;
  b=MdQ/+wa/Xuyh4FUYC/RYAPPp4VKh3xRnjMY2F+d7ArwJInbLjwK5hQz8
   QL6IlSdOWqfqPwNwZgVgnl3eSr9XkCzXLX8ixxvzvGf4bIU8PbhJ6EdB0
   /EeBtXoLPTpa10CsDCQa+MBbV9QPx2W6K4jbBrSgbOyCs6K7t5qIDPbe6
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 95443851
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:R5baOaigqg+IGDdT/Qdn4katX1612RAKZh0ujC45NGQN5FlHY01je
 htvXG7Sb/iJa2D3KdwjboS3p0wAucLTzodhQAZqpC9mQn8b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWt0N8klgZmP6sT5geBzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ8dW4rQyuGtd6H4+KSE/JRi8k6EMDCadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XejtEqFWTtOwv7nLa1gBZ27nxKtvFPNeNQK25m27J+
 z6apDSkW3n2MvSjxx6F0yypg9bIxzzlecUYE7KR0/R11Qj7Kms7V0RNCArTTeOCokKzXtN3K
 koK+zEvp6w/6EyqSNbmWxSy5nWDu3Y0S9dWVuE39gyJ4q7V+BqCQHgJSCZbb94rv9NwQiYlv
 neLld70AT1ksJWOVGmQsLyTqFuaOzURLGIETT8JS00C+daLiJookhvFQ9JnEai0pt74Azf9x
 3aNtidWr6oXpd4G0eO851+vqzmlvJTOQyY+7x/bWW/j5QR8DKa+bom15Fyd8fZBJo+ESkWps
 X4f3syP6+ZICouC/ASISf8IFauk5N6ENiPdml9lG5Q99zWr9GWndIoW6zZ7TG9gKssecCXlS
 FPSswhWopRUOROXgbRfOtzrTZ5wlO65SIqjD6qPBjZTXnRvXCvaogdDXkui41HOwGF1ipwyN
 I6neO/5WB72Fp9b5DaxQu4c15oiySY/2X7fSPjH8vi37VaNTCXLEOlYaTNiesh8tfrZ+1uNr
 76zIuPQk31ivPvCjj47GGL5BXQDNjAFCJ//sKS7ncbTc1M9SAnN5xI8qI7NmrCJfYwPzo8kH
 VnnACe0LWYTYlWZQThmklg5NNvSsW9X9BrXxxAEM1eywGQEao2y9qoZfJZfVeB5q7E8la4oF
 6ZZIZ/o7hFzptPvomV1UHUAhNY6KETDafymb0JJnwTTj7Y/HleUq7cIjyPk9TUUDzrfiCfNi
 +TI6+8verJaH14KJJ+POJqSI6aZ4SB1dBRaAxGZfbG+uSzErOBXFsAGpqVofpxSd06enGvyO
 sT/KU5wmNQharQdqLHh7Z1oZa/weweiNiK2x1Xm0Is=
IronPort-HdrOrdr: A9a23:bEhxSqpZtUOpz4JYFMCpTQoaV5stL9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssScb6KG90dq7MAvhHP9OkO8s1NKZMDUO11HYS72KgbGSpgEIXheOjNK1tp
 0QEZSWaueAdmSS5PySiGbXYrUdLcG8kJxAx92uskuFJTsaG52IhD0JdDpzZ3cGOzWucqBJaK
 Z0iPA3wwZITU5nHfhTS0N1FNTrlpnurtbLcBQGDxko5E2nii6p0qfzF1yi0hIXQ1p0sMEfGT
 yuqW3Ez5Tml8v+5g7X1mfV4ZgTssDm0MF/CMuFjdVQAinwiy6zDb4RG4GqjXQQmqWC+VwqmN
 7Dr1MLJMJo8U7ceWmzvF/ExxTg6jAz8HXvoGXowEcLmfaJBw7SNvAxyr6xMyGpp3bIhesMnZ
 6jCljp+aa+RHn77V3AD9uhbWAcqqP7mwthrQcptQ0qbWIvUs4ikWUhxjIhLH4hJlOy1Gl1Kp
 gnMCib3ocdTW+n
X-IronPort-AV: E=Sophos;i="5.97,278,1669093200"; 
   d="scan'208";a="95443851"
Date: Tue, 7 Feb 2023 15:37:14 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Doug Goldstein
	<cardoe@cardoe.com>, Samuel Thibault <samuel.thibault@ens-lyon.org>, "Roger
 Pau =?iso-8859-1?Q?Monn=E9?=" <roger.pau@citrix.com>, Marek
 =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] Replace git:// and http:// with https://
Message-ID: <Y+JwKkcBC6AEAeqW@perard.uk.xensource.com>
References: <f10112b7fa66d0fda3c5fd523e6240cd72730b90.1675739352.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f10112b7fa66d0fda3c5fd523e6240cd72730b90.1675739352.git.demi@invisiblethingslab.com>

On Mon, Feb 06, 2023 at 10:10:33PM -0500, Demi Marie Obenour wrote:
> Obtaining code over an insecure transport is a terrible idea for
> blatently obvious reasons.  Even for non-executable data, insecure
> transports are considered deprecated.
> 
> This patch was created by doing a tree-wide search and replace with sed,
> then reverting changes that were pointless or wrong.
> 
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>

Hi,

Thanks for the patch.

Could you split this patch into several patches? I think that would make
it easier to review. Not all URL are equal, or have the same purpose.
They need to be check one by one to make sure that the right change to
do.

I propose at least 3 patches:

> ---

"automation / CI" changes:
>  automation/build/centos/CentOS-7.2.repo      |  8 ++++----
>  automation/build/debian/stretch-llvm-8.list  |  4 ++--
>  automation/build/debian/unstable-llvm-8.list |  4 ++--
>  automation/scripts/qemu-smoke-dom0-arm32.sh  |  2 +-

"build system" changes:
>  Config.mk                                    | 20 ++++++--------------
>  stubdom/configure                            | 18 +++++++++---------
>  stubdom/configure.ac                         | 18 +++++++++---------
>  tools/firmware/etherboot/Makefile            |  4 ++--


"miscellaneous and documentation":
>  README                                       |  4 ++--
>  docs/README.remus                            |  2 +-
>  docs/conf.py                                 |  2 +-
>  scripts/get_maintainer.pl                    |  2 +-
>  stubdom/grub.patches/10graphics.diff         |  2 +-
>  tools/examples/xeninfo.pl                    |  2 +-
>  tools/firmware/etherboot/README              |  2 +-
>  tools/firmware/hvmloader/pci_regs.h          |  2 +-
>  tools/firmware/hvmloader/pir.c               |  2 +-
>  tools/firmware/hvmloader/pir_types.h         |  2 +-
>  tools/firmware/hvmloader/smbios_types.h      |  2 +-
>  19 files changed, 47 insertions(+), 55 deletions(-)

In or after the "build system" patch, you could propose to remove
GIT_HTTP variable, and only use https:// urls. A separate change could
be better as we could easily revert it if that an issue.
We could start with a patch to default to GIT_HTTP=y, even if all urls
would bu https.


> diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
> index 98e4d481f65c2b29ac935ddf6247132ddf94fa1d..22ec2f2474ed3d1f1f614085f9bd832be4d42496 100755
> --- a/automation/scripts/qemu-smoke-dom0-arm32.sh
> +++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
> @@ -4,7 +4,7 @@ set -ex
>  
>  cd binaries
>  # Use the kernel from Debian
> -curl --fail --silent --show-error --location --output vmlinuz http://http.us.debian.org/debian/dists/bullseye/main/installer-armhf/current/images/netboot/vmlinuz
> +curl --fail --silent --show-error --location --output vmlinuz https://http.us.debian.org/debian/dists/bullseye/main/installer-armhf/current/images/netboot/vmlinuz

This url change is wrong, the certificate provided aren't for debian.org.

>  # Use a tiny initrd based on busybox from Alpine Linux
>  curl --fail --silent --show-error --location --output initrd.tar.gz https://dl-cdn.alpinelinux.org/alpine/v3.15/releases/armhf/alpine-minirootfs-3.15.1-armhf.tar.gz
>  
> diff --git a/docs/README.remus b/docs/README.remus
> index e41e045a109466213b39bf5099ee16652b229ccc..5e411addb1a63f1b2c01ff165fc6f74d6d81c8ea 100644
> --- a/docs/README.remus
> +++ b/docs/README.remus
> @@ -7,7 +7,7 @@ Using Remus with libxl on Xen 4.5 and higher:
>   To enable network buffering, you need libnl 3.2.8
>   or higher along with the development headers and command line utilities.
>   If your distro does not have the appropriate libnl3 version, you can find
> - the latest source tarball of libnl3 at http://www.carisma.slowglass.com/~tgr/libnl/
> + the latest source tarball of libnl3 at https://www.carisma.slowglass.com/~tgr/libnl/

This url doesn't exist anymore, so better not change it, or fix the
comment.

>  
>  Disk replication:
>   VMs protected by Remus need to use DRBD based disk backends. Specifically, you
> diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
> index 48e07370e8d462ced70a1de13ec8134b4eed65ba..9f32e0e0c0ec5c491209d6e73232b5a388b0a588 100755
> --- a/scripts/get_maintainer.pl
> +++ b/scripts/get_maintainer.pl
> @@ -1457,7 +1457,7 @@ sub vcs_exists {
>  	warn("$P: No supported VCS found.  Add --nogit to options?\n");
>  	warn("Using a git repository produces better results.\n");
>  	warn("Try latest git repository using:\n");
> -	warn("git clone git://xenbits.xen.org/xen.git\n");
> +	warn("git clone https://xenbits.xen.org/xen.git\n");

This url is wrong, xenbits provides git trees on http via a different path, see in Config.mk.

>  	$printed_novcs = 1;
>      }
>      return 0;
> diff --git a/tools/examples/xeninfo.pl b/tools/examples/xeninfo.pl
> index 95a15d9595c0f4bf09c9429099bd3b27e98ebf3e..1815d1d9f219799a83fbc0329a4a1a010264893e 100644
> --- a/tools/examples/xeninfo.pl
> +++ b/tools/examples/xeninfo.pl
> @@ -36,7 +36,7 @@ sub apiconnect
>  {
>  	foreach my $xenhost (keys %xenhosts)
>  	{
> -		my $xen = RPC::XML::Client->new("http://$xenhost:$xenhosts{$xenhost}{'port'}");
> +		my $xen = RPC::XML::Client->new("https://$xenhost:$xenhosts{$xenhost}{'port'}");

I'm pretty sure that the wrong change to do here.

>  		my $session = $xen->simple_request("session.login_with_password", "user","");
>  		if (! $session)
>  		{

I haven't check every urls, there's  probably other that want to be
change to something else rather that just s/http/https/.

Cheers,

-- 
Anthony PERARD

