Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E04E75696BE
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jul 2022 02:09:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362666.592809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9F4s-0007hQ-Ke; Thu, 07 Jul 2022 00:09:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362666.592809; Thu, 07 Jul 2022 00:09:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9F4s-0007fc-Hl; Thu, 07 Jul 2022 00:09:06 +0000
Received: by outflank-mailman (input) for mailman id 362666;
 Thu, 07 Jul 2022 00:09:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tNfF=XM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o9F4q-0007fW-66
 for xen-devel@lists.xenproject.org; Thu, 07 Jul 2022 00:09:04 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 017314b9-fd89-11ec-bd2d-47488cf2e6aa;
 Thu, 07 Jul 2022 02:09:02 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4C5CBB81F5A;
 Thu,  7 Jul 2022 00:09:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4A99C3411C;
 Thu,  7 Jul 2022 00:08:59 +0000 (UTC)
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
X-Inumbo-ID: 017314b9-fd89-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657152540;
	bh=hq32ZyKR/RWmwDjvNRS77lPyXTPv2bBPC3EmC0mfXbE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KZGs541EG8FMENDvcYuNauFHA/929QJpg0kVdoXHpN7IMmH0nxGcgZKi+3yPJXJge
	 P/jIxbKL4Xm25b5zzI9Z64NEwrMnf1M23A/f1RjUBMzCR+sJRWDpc4o7yamU9n6dxz
	 xG006U/pg2i7TgDIoznht6++9r/MC7GmVAXhoZdvgslcPcC7dzMsUBjoqr6Ycl3dBM
	 3SNwv+NSfs1z3SO3ivLAjDgdaILsZbqhUjjgdEySwehuevl7yrpWeKxkH8/lfJXAy+
	 z15LFF2BD+I7Zzm8HkH3s5+PKEs/AvcwHee6nIQ7YKH1ppeZIAqlnmhJQIYg6IondA
	 bJ5ekeALq013w==
Date: Wed, 6 Jul 2022 17:08:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
cc: xen-devel@lists.xenproject.org, viryaos-discuss@lists.sourceforge.net, 
    sstabellini@kernel.org, Andrei Cherechesu <andrei.cherechesu@nxp.com>
Subject: Re: [ImageBuilder][PATCH v2 1/4] scripts: Add support for prepending
 path to file names
In-Reply-To: <20220630140028.3227385-2-andrei.cherechesu@oss.nxp.com>
Message-ID: <alpine.DEB.2.22.394.2207061708320.2354836@ubuntu-linux-20-04-desktop>
References: <20220630140028.3227385-1-andrei.cherechesu@oss.nxp.com> <20220630140028.3227385-2-andrei.cherechesu@oss.nxp.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 30 Jun 2022, Andrei Cherechesu (OSS) wrote:
> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> 
> Added support for prepending path to file names in the final generated
> u-boot script, for the use-case where we have the files in a separate
> folder that can be accessed with a given $LOAD_CMD.
> 
> For example, we can have "fatload mmc 0:2" as LOAD_CMD but the
> files would need to be loaded from the /boot folder within the 2nd
> partition, not from the root ("/"). By specifying the "-p <path>"
> parameter when running the script, paths like "/boot" can be
> automatically prepended to the generated u-boot commands used
> to load the files in board's memory.
> 
> Also added the support to disk_image script, to enable generating
> a FAT partition with the binaries deployed in a custom folder
> within it, if the "-p" parameter is specified.
> 
> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  scripts/disk_image       | 37 +++++++++++++++++++++++--------------
>  scripts/uboot-script-gen | 12 ++++++++----
>  2 files changed, 31 insertions(+), 18 deletions(-)
> 
> diff --git a/scripts/disk_image b/scripts/disk_image
> index 12fb06b..97e798f 100755
> --- a/scripts/disk_image
> +++ b/scripts/disk_image
> @@ -539,7 +539,7 @@ function write_rootfs()
>  function print_help
>  {
>      echo "usage:"
> -    echo "	$0 -c CONFIG_FILE -d UBOOT_DIRECTORY -t UBOOT_TYPE <-w WORK_DIRECTORY> <-s SLACK> <-a> -o IMG_FILE"
> +    echo "	$0 -c CONFIG_FILE -d UBOOT_DIRECTORY -t UBOOT_TYPE <-w WORK_DIRECTORY> <-s SLACK> <-a> -o IMG_FILE <-p PREPEND_PATH>"
>      echo "	$0 -h"
>      echo "where:"
>      echo "	-c CONFIG_FILE - configuration file"
> @@ -553,6 +553,7 @@ function print_help
>      echo "	-s SLACK - free MB to add to each partition, default 128"
>      echo "	-a specifies that the size of IMG_FILE has to be aligned to the nearest power of two"
>      echo "	-o IMG_FILE - the output img file "
> +    echo "	-p PREPEND_PATH - path to be appended before file names to customize deploy location within rootfs"
>      echo "Example:"
>      echo "	$0 -c ../config -d ./build42 -w tmp -o disk.img"
>  }
> @@ -564,7 +565,7 @@ then
>      exit 1
>  fi
>  
> -while getopts ":w:d:c:t:s:o:ah" opt
> +while getopts ":w:d:c:t:s:o:ahp:" opt
>  do
>      case ${opt} in
>      t )
> @@ -606,6 +607,9 @@ do
>      a )
>          ALIGN=1
>          ;;
> +    p )
> +        PREPEND_PATH="$OPTARG"
> +        ;;
>      h )
>          print_help
>          exit 0
> @@ -828,56 +832,61 @@ mount /dev/mapper/diskimage1 $DESTDIR/part/disk1
>  
>  # only copy over files that were counted for the partition size
>  cd "$UBOOT_OUT"
> -cp --parents "$DOM0_KERNEL" "${DESTDIR_ABS}/part/disk1/"
> -cp --parents "$DEVICE_TREE" "${DESTDIR_ABS}/part/disk1/"
> -cp --parents "$UBOOT_SCRIPT" "${DESTDIR_ABS}/part/disk1/"
> +if [ -n "$PREPEND_PATH" ]
> +then
> +    mkdir -p "${DESTDIR_ABS}/part/disk1/${PREPEND_PATH}"
> +fi
> +
> +cp --parents "$DOM0_KERNEL" "${DESTDIR_ABS}/part/disk1/${PREPEND_PATH}"
> +cp --parents "$DEVICE_TREE" "${DESTDIR_ABS}/part/disk1/${PREPEND_PATH}"
> +cp --parents "$UBOOT_SCRIPT" "${DESTDIR_ABS}/part/disk1/${PREPEND_PATH}"
>  
>  if test "${DOM0_RAMDISK}"
>  then
> -    cp --parents "$DOM0_RAMDISK" "${DESTDIR_ABS}/part/disk1/"
> +    cp --parents "$DOM0_RAMDISK" "${DESTDIR_ABS}/part/disk1/${PREPEND_PATH}"
>  fi
>  if test "$NUM_DT_OVERLAY" && test "$NUM_DT_OVERLAY" -gt 0
>  then
>      i=0
>      while test $i -lt "$NUM_DT_OVERLAY"
>      do
> -        cp --parents "${DT_OVERLAY[$i]}" "${DESTDIR_ABS}/part/disk1/"
> +        cp --parents "${DT_OVERLAY[$i]}" "${DESTDIR_ABS}/part/disk1/${PREPEND_PATH}"
>          i=$(( $i + 1 ))
>      done
>  fi
>  if test "${UBOOT_SOURCE}"
>  then
> -    cp --parents "$UBOOT_SOURCE" "${DESTDIR_ABS}/part/disk1/"
> +    cp --parents "$UBOOT_SOURCE" "${DESTDIR_ABS}/part/disk1/${PREPEND_PATH}"
>  fi
>  if test "${XEN}"
>  then
> -    cp --parents "$XEN" "${DESTDIR_ABS}/part/disk1/"
> +    cp --parents "$XEN" "${DESTDIR_ABS}/part/disk1/${PREPEND_PATH}"
>  fi
>  if test "$NUM_BOOT_AUX_FILE" && test "$NUM_BOOT_AUX_FILE" -gt 0
>  then
>      i=0
>      while test $i -lt "$NUM_BOOT_AUX_FILE"
>      do
> -        cp --parents "${BOOT_AUX_FILE[$i]}" "${DESTDIR_ABS}/part/disk1/"
> +        cp --parents "${BOOT_AUX_FILE[$i]}" "${DESTDIR_ABS}/part/disk1/${PREPEND_PATH}"
>          i=$(( $i + 1 ))
>      done
>  fi
>  if test "${BITSTREAM}"
>  then
> -    cp --parents "$BITSTREAM" "${DESTDIR_ABS}/part/disk1/"
> +    cp --parents "$BITSTREAM" "${DESTDIR_ABS}/part/disk1/${PREPEND_PATH}"
>  fi
>  
>  i=0
>  while test $i -lt $NUM_DOMUS
>  do
> -    cp --parents "${DOMU_KERNEL[$i]}" "${DESTDIR_ABS}/part/disk1/"
> +    cp --parents "${DOMU_KERNEL[$i]}" "${DESTDIR_ABS}/part/disk1/${PREPEND_PATH}"
>      if test "${DOMU_RAMDISK[$i]}"
>      then
> -        cp --parents "${DOMU_RAMDISK[$i]}" "${DESTDIR_ABS}/part/disk1/"
> +        cp --parents "${DOMU_RAMDISK[$i]}" "${DESTDIR_ABS}/part/disk1/${PREPEND_PATH}"
>      fi
>      if test "${DOMU_PASSTHROUGH_DTB[$i]}"
>      then
> -        cp --parents "${DOMU_PASSTHROUGH_DTB[$i]}" "${DESTDIR_ABS}/part/disk1/"
> +        cp --parents "${DOMU_PASSTHROUGH_DTB[$i]}" "${DESTDIR_ABS}/part/disk1/${PREPEND_PATH}"
>      fi
>      i=$(( $i + 1 ))
>  done
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index 085e29f..8f08cd6 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -316,7 +316,7 @@ function load_file()
>      then
>          echo "imxtract \$fit_addr $fit_scr_name $memaddr" >> $UBOOT_SOURCE
>      else
> -        echo "$LOAD_CMD $memaddr $relative_path" >> $UBOOT_SOURCE
> +        echo "$LOAD_CMD $memaddr ${prepend_path:+$prepend_path/}$relative_path" >> $UBOOT_SOURCE
>      fi
>      add_size $filename
>  }
> @@ -891,7 +891,7 @@ function print_help
>  {
>      script=`basename "$0"`
>      echo "usage:"
> -    echo "	$script -c CONFIG_FILE -d DIRECTORY [-t LOAD_CMD] [-o FILE] [-k KEY_DIR/HINT [-u U-BOOT_DTB]] [-e] [-f]"
> +    echo "	$script -c CONFIG_FILE -d DIRECTORY [-t LOAD_CMD] [-o FILE] [-k KEY_DIR/HINT [-u U-BOOT_DTB]] [-e] [-f] [-p PREPEND_PATH]"
>      echo "	$script -h"
>      echo "where:"
>      echo "	CONFIG_FILE - configuration file"
> @@ -907,6 +907,7 @@ function print_help
>      echo "	HINT - the file name of the crt and key file minus the suffix (ex, hint.crt and hint.key)"
>      echo "	U-BOOT_DTB - u-boot control dtb so that the public key gets added to it"
>      echo "	-f - enable generating a FIT image"
> +    echo "	PREPEND_PATH - path to be appended before file names to match deploy location within rootfs"
>      echo "	-h - prints out the help message and exits "
>      echo "Defaults:"
>      echo "	CONFIG_FILE=$cfg_file, UBOOT_TYPE=\"LOAD_CMD\" env var, DIRECTORY=$uboot_dir"
> @@ -914,7 +915,7 @@ function print_help
>      echo "	$script -c ../config -d ./build42 -t \"scsi load 1:1\""
>  }
>  
> -while getopts ":c:t:d:ho:k:u:f" opt; do
> +while getopts ":c:t:d:ho:k:u:fp:" opt; do
>      case ${opt} in
>      t )
>          case $OPTARG in
> @@ -953,6 +954,9 @@ while getopts ":c:t:d:ho:k:u:f" opt; do
>      f )
>          fit_opt=y
>          ;;
> +    p )
> +        prepend_path="$OPTARG"
> +        ;;
>      h )
>          print_help
>          exit 0
> @@ -1179,5 +1183,5 @@ then
>      echo "$LOAD_CMD $fit_addr $FIT; source $fit_addr:boot_scr"
>  else
>      echo "Generated uboot script $UBOOT_SCRIPT, to be loaded at address $uboot_addr:"
> -    echo "$LOAD_CMD $uboot_addr $UBOOT_SCRIPT; source $uboot_addr"
> +    echo "$LOAD_CMD $uboot_addr ${prepend_path:+$prepend_path/}$UBOOT_SCRIPT; source $uboot_addr"
>  fi
> -- 
> 2.35.1
> 

