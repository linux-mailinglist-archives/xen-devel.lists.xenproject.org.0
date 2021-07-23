Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5B73D41A6
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jul 2021 22:38:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.160381.294861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m71vB-00067b-P0; Fri, 23 Jul 2021 20:37:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 160381.294861; Fri, 23 Jul 2021 20:37:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m71vB-000651-Lx; Fri, 23 Jul 2021 20:37:25 +0000
Received: by outflank-mailman (input) for mailman id 160381;
 Fri, 23 Jul 2021 20:37:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aJz+=MP=strugglers.net=andy@srs-us1.protection.inumbo.net>)
 id 1m71v9-00064v-Um
 for xen-devel@lists.xenproject.org; Fri, 23 Jul 2021 20:37:23 +0000
Received: from mail.bitfolk.com (unknown [2001:ba8:1f1:f019::25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c36c7ce6-6504-47fa-afc0-946112d3be47;
 Fri, 23 Jul 2021 20:37:22 +0000 (UTC)
Received: from andy by mail.bitfolk.com with local (Exim 4.89)
 (envelope-from <andy@strugglers.net>) id 1m71v7-0000yW-RM
 for xen-devel@lists.xenproject.org; Fri, 23 Jul 2021 20:37:21 +0000
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
X-Inumbo-ID: c36c7ce6-6504-47fa-afc0-946112d3be47
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitfolk.com
	; s=alpha; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=J0e1eLHL1iIzrWjyNmSHHmF22eMycVd3tBkUU/rCj/4=; b=Cn1PGZtNOcm5Z8JxLl8S65jl2+
	ASBKO5LeJT6GM/oGuDx00S1anI/qu0xi2AnPnEq079W0TbS1t0SbeYYSDKdHGYRXnJXOOGXTCfTpP
	EflIdbbPYsGBo3jxlC31L4oqg2vuivR5tC6yRVh5Zsc9HkNchlkGL1ppmg1PL7o18ZnW2abEXC3kc
	cMnFq27IXqvroWWixtJpatpGHRC5ryxFsj+IAMrwCoQytaTf3+v5rvgoFfXpEPOTvZ58OC36NQKNr
	x//Bb6h5Qpak7QcZVGMMmhdgOJ/7s4X3tiASVgXTYknLiJyWYDjp4GiG0y+dH5FPdNNzA19gsxPG2
	Ub7xDqcg==;
Date: Fri, 23 Jul 2021 20:37:21 +0000
From: Andy Smith <andy@strugglers.net>
To: xen-devel@lists.xenproject.org
Subject: Re: 5.10.40 dom0 kernel - nvme: Invalid SGL for payload:131072
 nents:13
Message-ID: <20210723203721.v63zzsmrcbvlr6wg@bitfolk.com>
References: <20210720223239.fqbwj3escedolaqa@bitfolk.com>
 <c3d7f7c7-0231-dba2-344f-e2e3588e0cab@suse.com>
 <20210721141942.tnxyfpt7qttzjooo@bitfolk.com>
 <acc3c000-3d62-d91d-3ad7-0e0b460f4b0f@suse.com>
 <20210723201028.tzmz65biwelruvqb@bitfolk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210723201028.tzmz65biwelruvqb@bitfolk.com>
OpenPGP: id=BF15490B; url=http://strugglers.net/~andy/pubkey.asc
X-URL: http://strugglers.net/wiki/User:Andy
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: andy@strugglers.net
X-SA-Exim-Scanned: No (on mail.bitfolk.com); SAEximRunCond expanded to false

On Fri, Jul 23, 2021 at 08:10:28PM +0000, Andy Smith wrote:
> Hmm, I have the sector offset in the MD device so maybe I can
> convert that into a logical volume to know if a particular guest is
> provoking it…

So for anyone who ever wants to do that sort of thing:

# Find out offset that LVM puts LVs from start of its physical
# device
$ sudo pvs --noheadings -o pe_start --units s /dev/md4
    2048S
# Find out the sector size of each LVM extent (PE)
$ sudo pvdisplay --units s /dev/md4 | grep 'PE Size'
  PE Size               8192 Se
# Report PE number for each sector
$ for sect in 912000815 916064223 1934755601 914360207 1936852857; do lv_sect=$((sect-2048)); pe=$((sect / 8192)); printf "%s: sector %s PE %s\n" $sect $lv_sect $pe; done
912000815: sector 911998767 PE 111328
916064223: sector 916062175 PE 111824
1934755601: sector 1934753553 PE 236176
914360207: sector 914358159 PE 111616
1936852857: sector 1936850809 PE 236432

Looking the PE numbers up in the output of "pvdisplay --maps --units
s /dev/md4" I can see it's three hits for one guest and two for
another.

I will see if I can move the 3 time affected guest to test hardware.

Cheers,
Andy

