Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMWiFfMSdGkL2AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jan 2026 01:31:47 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E797BAC1
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jan 2026 01:31:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1212631.1523657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjRYR-0002eX-L4; Sat, 24 Jan 2026 00:31:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1212631.1523657; Sat, 24 Jan 2026 00:31:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjRYR-0002d6-Hy; Sat, 24 Jan 2026 00:31:07 +0000
Received: by outflank-mailman (input) for mailman id 1212631;
 Sat, 24 Jan 2026 00:31:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S/rR=75=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vjRYP-0002cu-Ob
 for xen-devel@lists.xenproject.org; Sat, 24 Jan 2026 00:31:05 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eef91d1e-f8bb-11f0-9ccf-f158ae23cfc8;
 Sat, 24 Jan 2026 01:30:50 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5527160053;
 Sat, 24 Jan 2026 00:30:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0211C4CEF1;
 Sat, 24 Jan 2026 00:30:47 +0000 (UTC)
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
X-Inumbo-ID: eef91d1e-f8bb-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769214649;
	bh=PHBz4o2pH81TiLt975csT9TFLJUN4sr7JtZ4Jwxagzg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Vpesb32EXCuito7D56ZR33K1S7szg7oxr1S0ZcEItY+COE1nOox1zdnMLRFIE/vxz
	 RgcKWDss4Vlk0ovJhdMmMyOos210DZfGFP0AHzuHNSqAS4XVsYOl2sx+TIZMt2mfs3
	 7mFP0klqPL56nBV35C2OKPGjFqOR0lqcNCuy2mLQphRETTFdq+vb2FJJwUSiM5wFrP
	 YbvCsUZmNsKNvvcYOc9pOLj/MD0tq3E00MRTlKs9ph9PQJP/Ro95I18fGGVcSSSFBF
	 QnFujlcIxJarU8ULGg2n4YVzPlwOx/hL8yaWdzi4ZqynS0qb6Cg7IVNzQb7aeV1R36
	 U0LYZIPaS5Tyw==
Date: Fri, 23 Jan 2026 16:30:46 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@xen.org
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v1 1/4] scripts/config: import Kconfig manipulation tool
 from Linux
In-Reply-To: <20260116043458.730728-2-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2601231628350.7192@ubuntu-linux-20-04-desktop>
References: <20260116043458.730728-1-dmukhin@ford.com> <20260116043458.730728-2-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:email,ford.com:email];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@xen.org,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D1E797BAC1
X-Rspamd-Action: no action

On Thu, 15 Jan 2026, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Manipulating Kconfig settings is often required when preparing a custom
> Xen build using an external build system (e.g., a Yocto-based workflow).
> 
> Import the Kconfig manipulation tool from the Linux kernel
> (commit 0f61b1860cc3, Linux v6.19-rc5) to support this use case.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/scripts/config | 236 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 236 insertions(+)
>  create mode 100755 xen/scripts/config
> 
> diff --git a/xen/scripts/config b/xen/scripts/config
> new file mode 100755
> index 000000000000..ea475c07de28
> --- /dev/null
> +++ b/xen/scripts/config
> @@ -0,0 +1,236 @@
> +#!/usr/bin/env bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Manipulate options in a .config file from the command line
> +
> +myname=${0##*/}
> +
> +# If no prefix forced, use the default CONFIG_
> +CONFIG_="${CONFIG_-CONFIG_}"
> +
> +# We use an uncommon delimiter for sed substitutions
> +SED_DELIM=$(echo -en "\001")
> +
> +usage() {
> +	cat >&2 <<EOL
> +Manipulate options in a .config file from the command line.
> +Usage:
> +$myname options command ...
> +commands:
> +	--enable|-e option   Enable option
> +	--disable|-d option  Disable option
> +	--module|-m option   Turn option into a module
> +	--set-str option string
> +	                     Set option to "string"
> +	--set-val option value
> +	                     Set option to value
> +	--undefine|-u option Undefine option
> +	--state|-s option    Print state of option (n,y,m,undef)
> +
> +	--enable-after|-E beforeopt option
> +                             Enable option directly after other option
> +	--disable-after|-D beforeopt option
> +                             Disable option directly after other option
> +	--module-after|-M beforeopt option
> +                             Turn option into module directly after other option
> +	--refresh            Refresh the config using old settings
> +
> +	commands can be repeated multiple times
> +
> +options:
> +	--file config-file   .config file to change (default .config)
> +	--keep-case|-k       Keep next symbols' case (dont' upper-case it)
> +
> +$myname doesn't check the validity of the .config file. This is done at next
> +make time.
> +
> +By default, $myname will upper-case the given symbol. Use --keep-case to keep
> +the case of all following symbols unchanged.
> +
> +$myname uses 'CONFIG_' as the default symbol prefix. Set the environment
> +variable CONFIG_ to the prefix to use. Eg.: CONFIG_="FOO_" $myname ...
> +EOL
> +	exit 1
> +}
> +
> +checkarg() {
> +	ARG="$1"
> +	if [ "$ARG" = "" ] ; then
> +		usage
> +	fi
> +	case "$ARG" in
> +	${CONFIG_}*)
> +		ARG="${ARG/${CONFIG_}/}"
> +		;;
> +	esac
> +	if [ "$MUNGE_CASE" = "yes" ] ; then
> +		ARG="`echo $ARG | tr a-z A-Z`"
> +	fi
> +}
> +
> +txt_append() {
> +	local anchor="$1"
> +	local insert="$2"
> +	local infile="$3"
> +	local tmpfile="$infile.swp"
> +
> +	# sed append cmd: 'a\' + newline + text + newline
> +	cmd="$(printf "a\\%b$insert" "\n")"
> +
> +	sed -e "/$anchor/$cmd" "$infile" >"$tmpfile"
> +	# replace original file with the edited one
> +	mv "$tmpfile" "$infile"
> +}
> +
> +txt_subst() {
> +	local before="$1"
> +	local after="$2"
> +	local infile="$3"
> +	local tmpfile="$infile.swp"
> +
> +	sed -e "s$SED_DELIM$before$SED_DELIM$after$SED_DELIM" "$infile" >"$tmpfile"
> +	# replace original file with the edited one
> +	mv "$tmpfile" "$infile"
> +}
> +
> +txt_delete() {
> +	local text="$1"
> +	local infile="$2"
> +	local tmpfile="$infile.swp"
> +
> +	sed -e "/$text/d" "$infile" >"$tmpfile"
> +	# replace original file with the edited one
> +	mv "$tmpfile" "$infile"
> +}
> +
> +set_var() {
> +	local name=$1 new=$2 before=$3
> +
> +	name_re="^($name=|# $name is not set)"
> +	before_re="^($before=|# $before is not set)"
> +	if test -n "$before" && grep -Eq "$before_re" "$FN"; then
> +		txt_append "^$before=" "$new" "$FN"
> +		txt_append "^# $before is not set" "$new" "$FN"
> +	elif grep -Eq "$name_re" "$FN"; then
> +		txt_subst "^$name=.*" "$new" "$FN"
> +		txt_subst "^# $name is not set" "$new" "$FN"
> +	else
> +		echo "$new" >>"$FN"
> +	fi
> +}
> +
> +undef_var() {
> +	local name=$1
> +
> +	txt_delete "^$name=" "$FN"
> +	txt_delete "^# $name is not set" "$FN"
> +}
> +
> +FN=.config
> +CMDS=()
> +while [[ $# -gt 0 ]]; do
> +	if [ "$1" = "--file" ]; then
> +		if [ "$2" = "" ]; then
> +			usage
> +		fi
> +		FN="$2"
> +		shift 2
> +	else
> +		CMDS+=("$1")
> +		shift
> +	fi
> +done
> +
> +set -- "${CMDS[@]}"
> +if [ "$1" = "" ] ; then
> +	usage
> +fi
> +
> +MUNGE_CASE=yes
> +while [ "$1" != "" ] ; do
> +	CMD="$1"
> +	shift
> +	case "$CMD" in
> +	--keep-case|-k)
> +		MUNGE_CASE=no
> +		continue
> +		;;
> +	--refresh)
> +		;;
> +	--*-after|-E|-D|-M)
> +		checkarg "$1"
> +		A=$ARG
> +		checkarg "$2"
> +		B=$ARG
> +		shift 2
> +		;;
> +	-*)
> +		checkarg "$1"
> +		shift
> +		;;
> +	esac
> +	case "$CMD" in
> +	--enable|-e)
> +		set_var "${CONFIG_}$ARG" "${CONFIG_}$ARG=y"
> +		;;
> +
> +	--disable|-d)
> +		set_var "${CONFIG_}$ARG" "# ${CONFIG_}$ARG is not set"
> +		;;
> +
> +	--module|-m)
> +		set_var "${CONFIG_}$ARG" "${CONFIG_}$ARG=m"
> +		;;
> +
> +	--set-str)
> +		# sed swallows one level of escaping, so we need double-escaping
> +		set_var "${CONFIG_}$ARG" "${CONFIG_}$ARG=\"${1//\"/\\\\\"}\""
> +		shift
> +		;;
> +
> +	--set-val)
> +		set_var "${CONFIG_}$ARG" "${CONFIG_}$ARG=$1"
> +		shift
> +		;;
> +	--undefine|-u)
> +		undef_var "${CONFIG_}$ARG"
> +		;;
> +
> +	--state|-s)
> +		if grep -q "# ${CONFIG_}$ARG is not set" $FN ; then
> +			echo n
> +		else
> +			V="$(grep "^${CONFIG_}$ARG=" $FN)"
> +			if [ $? != 0 ] ; then
> +				echo undef
> +			else
> +				V="${V/#${CONFIG_}$ARG=/}"
> +				V="${V/#\"/}"
> +				V="${V/%\"/}"
> +				V="${V//\\\"/\"}"
> +				echo "${V}"
> +			fi
> +		fi
> +		;;
> +
> +	--enable-after|-E)
> +		set_var "${CONFIG_}$B" "${CONFIG_}$B=y" "${CONFIG_}$A"
> +		;;
> +
> +	--disable-after|-D)
> +		set_var "${CONFIG_}$B" "# ${CONFIG_}$B is not set" "${CONFIG_}$A"
> +		;;
> +
> +	--module-after|-M)
> +		set_var "${CONFIG_}$B" "${CONFIG_}$B=m" "${CONFIG_}$A"
> +		;;
> +
> +	--refresh)
> +		yes "" | make oldconfig KCONFIG_CONFIG=$FN
> +		;;
> +
> +	*)
> +		echo "bad command: $CMD" >&2
> +		usage
> +		;;
> +	esac
> +done
> -- 
> 2.52.0
> 

