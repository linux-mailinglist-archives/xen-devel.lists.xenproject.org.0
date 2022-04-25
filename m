Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A443150E6CE
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 19:19:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313180.530654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nj2Mi-0000DL-UP; Mon, 25 Apr 2022 17:19:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313180.530654; Mon, 25 Apr 2022 17:19:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nj2Mi-00009b-RC; Mon, 25 Apr 2022 17:19:12 +0000
Received: by outflank-mailman (input) for mailman id 313180;
 Mon, 25 Apr 2022 17:19:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t3J5=VD=phptrix.de=einsle@srs-se1.protection.inumbo.net>)
 id 1nj2Mh-00009Q-Of
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 17:19:11 +0000
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1c97b61-c4bb-11ec-a405-831a346695d4;
 Mon, 25 Apr 2022 19:19:10 +0200 (CEST)
Received: from mail.phptrix.de ([93.233.17.36]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MBltK-1nbMrh1wx2-00C8jO for <xen-devel@lists.xenproject.org>; Mon, 25 Apr
 2022 19:19:09 +0200
Received: (qmail 15505 invoked by uid 210); 25 Apr 2022 19:19:08 +0200
Received: from rhombus.phptrix.de (HELO ?192.168.139.169?)
 (einsle@192.168.139.169)
 by portfish.phptrix.de with ESMTPA; 25 Apr 2022 19:19:08 +0200
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
X-Inumbo-ID: d1c97b61-c4bb-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=phptrix.de;
	s=default; h=Message-ID:Date:MIME-Version:User-Agent:To:
	Content-Language:From:Subject:Content-Type:
	Content-Transfer-Encoding; bh=4UfAQPyV98urAiFS1w8+89YVdLw=; b=IY
	wRLAUKn/mBEHWMbayerC6COgY3Br8WcaqLWHSbREFLKwvwXClw9tdfPX9XyxstDj
	C2cme8c5Ky33mn63dMCyLHI5CWz/4RQ94LPp8rwQvqQj0KrZlKCZlgaaDkWViLwH
	NnkkUyHG2915YnT2wjrQyHG5tFft2pMCuEIweVseA=
DomainKey-Signature: a=rsa-sha1; q=dns; c=simple;
  s=default; d=phptrix.de;
  b=Zln6VEjByRAM4gG7yMHcBy/2est7Q2jfwBFgu6xMGOBxJrjkr3SDSSPgKpKhdmtWGPRogV55Y/hoBhvXrX3X9ODzs1p9NXDdClYES2H0V+OSQRneZpF8xbqtD0tLolK6CrOt2iYE6oHUx682EJ4o2WuwObykc0TE/u8xAERpLcA=;
X-Qmail-Scanner-Diagnostics: from rhombus.phptrix.de (einsle@rhombus.phptrix.de) by portfish (envelope-from <einsle@phptrix.de>, uid 201) with qmail-scanner-2.11st 
 (clamdscan: 0.100.1/26337. spamassassin: 3.4.1. perlscan: 2.11st.  
 Clear:RC:1(192.168.139.169):. 
 Processed in 0.021636 secs); 25 Apr 2022 17:19:08 -0000
Message-ID: <18bd542a-a649-c78b-b575-c62b4d533e44@phptrix.de>
Date: Mon, 25 Apr 2022 19:19:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:100.0) Gecko/20100101
 Thunderbird/100.0
To: xen-devel@lists.xenproject.org
Content-Language: de-DE
From: Steffen Einsle <einsle@phptrix.de>
Subject: DomU Windows Server Essentials crashes with xen 4.16 but works with
 xen 4.14
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:EPwCpCi73g/zq/68nNA0dEnyalW0bj1HKsh9WuwGSXtq6pbrGus
 UCJNtV2pulSvtUwekM+i1hhHToT5hFQCPlrWnK+8s9LxhV3u5jSYrOhwUm+sPgVT7ozriLn
 Pl11MRXeUmDcqIPPpdZwH2IbRgLbbmuCEGGhH0vPd5tXQV65kAAckj2let5HCdQ6BiBZww9
 v4tzEDn0LgGmp9mFVdLAA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:GpPV7pM/Vzk=:/bSCkh3z/Wk/2FcNorMQXr
 jdaVEcpuPm6G/MWPLPimhKzYn7kJcy6fUKfM/aJWIiuX2dgeibDsvmRqQytBVDPiTA7RuXUc+
 VKx5rb5vFe/skhFJgAGelaVa0kvhM4EFZBPYq+auIWmegNVup0K3frnYp6nxYHkhXF6r6/u4n
 9kQYM2lD7V+CF6C2Ms3aPny0pAEpFCOX8BpnTQJr5JxIPMxknv0k6KRxqj61vrI2yoBIoX4dF
 TprEjZ5NziH/Sia38SOBWYdDMjdCv015VkoMh+i68/qs7oQjUvwTgd5DIuiqJXnLbSzgkDppE
 84HLzO4GlWtKhfqjqtmZ4yg0skM81lXa8WhR3vrmxF9yuw1gK5VvXqtFp/QKuqvruhhdjvq7T
 KI7YfsHW1PCrFeTIIIf94qfHrpdPimSXFbrlhGzzf8ze+OSLc1iWi9RdhLMWB4iBPcf1XOh9y
 G7/MAKiacSpKF+HeB+Is8Sa+g6oVaMPKQDTDil3YGxUSJ6bMUj/4NjrsS7uwjFf+8rYIhp7YJ
 FnFw6dqBQszvu4gxVj/oGLA8w1SQyJ7ly1zKjueTlhh5E1azNEJJTFovc2U6mNprM9xJIdMlJ
 zEQaEo/uZUbsHDlyZWvXvNkH6HdkVvWZySHshUiMvoK+GeDQvPskqxE5KxklauseUfRUKPL/j
 MaOsl6SqL3BQ4+HGnXHVtlSgK1bRIcikI3w7I25LTvvp637IX2NH8K7oN3HR3/s3IFBw=

Hello Everyone,

I have some xen servers I recently tried to update from xen 4.14 to xen 4.16

Everything worked without problem, except for the Windows Server 
Essentials DomUs.

With xen 4.16 those domains crashed (reproducable) during boot - 
KMODE_EXCEPTION_NOT_HANDLED.

I tried to install a new DomU Windows Server 2019 Essentials - this VM 
crashed at the first reboot
(still in the installation routine) with the same error. No PV-drivers 
installed yet.

I switched back to xen 4.14 and all VMs booted ok without problem.

All other VMs (Linux-PV, Windows-HVM (2008r2, 2012r2, 2016, 2019, 2022)  
show no problems, only
the Windows Server Essentials crashes with xen 4.16.

The system is a gentoo kernel 5.17.3, qemu-6.2.0-r4, xen-4.16.0-r5, 
xen-tools-4.16.0-r1

My working configuration is gentoo kernel 5.17.3, qemu-5.2.0-r2, 
xen-4.14.3-r2, xen-tools-4.14.3

My DomU config file looks like this

name = 'DC-Server'
type = 'hvm'
memory = '8192'
vcpus = '6'
vif = [ 'mac=00:16:3E:ab:cd:50,bridge=br0' ]
disk = [ '/dev/vg1/ServerSys,raw,hda,rw',
               '/dev/vg1/ServerData,raw,hdb,rw' ]
viridian = 'all'
localtime = '1'
vnc = '1'
keymap = 'de'
vnclisten = '0.0.0.0:10,websocket'
usb = '1'
usbdevice = 'tablet'
on_crash  = 'restart'
boot = 'c'
xen_platform_pci = '1'
max_grant_frames = 128

I tried disabling viridian but this made no change.

Is this a known problem?


-- 

Steffen



