Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5FDAFA646
	for <lists+xen-devel@lfdr.de>; Sun,  6 Jul 2025 17:59:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1034824.1407201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYRm9-0006Vp-AG; Sun, 06 Jul 2025 15:59:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1034824.1407201; Sun, 06 Jul 2025 15:59:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYRm9-0006TM-7G; Sun, 06 Jul 2025 15:59:33 +0000
Received: by outflank-mailman (input) for mailman id 1034824;
 Sun, 06 Jul 2025 15:59:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XHaa=ZT=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uYRm8-0006TE-6d
 for xen-devel@lists.xenproject.org; Sun, 06 Jul 2025 15:59:32 +0000
Received: from 18.mo550.mail-out.ovh.net (18.mo550.mail-out.ovh.net
 [46.105.35.72]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3172eef0-5a82-11f0-b894-0df219b8e170;
 Sun, 06 Jul 2025 17:59:27 +0200 (CEST)
Received: from director1.ghost.mail-out.ovh.net (unknown [10.110.54.226])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4bZsWL4kwHz6TKp
 for <xen-devel@lists.xenproject.org>; Sun,  6 Jul 2025 15:59:26 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-4bvrz (unknown [10.111.174.62])
 by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 1955BC160F;
 Sun,  6 Jul 2025 15:59:25 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.102])
 by ghost-submission-5b5ff79f4f-4bvrz with ESMTPSA
 id ZXOWMVydamhqlAgAxod2Hw
 (envelope-from <sergii.dmytruk@3mdeb.com>); Sun, 06 Jul 2025 15:59:24 +0000
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
X-Inumbo-ID: 3172eef0-5a82-11f0-b894-0df219b8e170
Authentication-Results:garm.ovh; auth=pass (GARM-102R004865a8840-c391-48c9-b67a-fcbf931f213a,
                    FF3279A5BAD606DDEEDDFD371ACA0117F5CC5AB0) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
Date: Sun, 6 Jul 2025 18:59:22 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	Mateusz =?iso-8859-1?Q?M=F3wka?= <mateusz.mowka@intel.com>,
	trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 01/22] x86/include/asm/intel-txt.h: constants and
 accessors for TXT registers and heap
Message-ID: <aGqdWsDQ_Ri1bx78@MjU3Nj>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <5da8e6c9fd2d986cd99be35774b850584e4a43ee.1748611041.git.sergii.dmytruk@3mdeb.com>
 <88f20e38-2fdd-4df2-8808-778c63fe45da@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88f20e38-2fdd-4df2-8808-778c63fe45da@suse.com>
X-Ovh-Tracer-Id: 11339500914382845017
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvleefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepvdfgveegtdffhfdugeevieehkeetudevfeefgedtleejledvfeeutdetudeiveelnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukeegrddvvddupdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheehtdgmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=CaqcKfSXibXicIcuPGbq/keKEOqHxyWNq/V2W3iNciY=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1751817566; v=1;
 b=i5FNOCPPVBqCGvFhrcQwF4WyEpHUtg0jjeAtwiLHGqOYa38c9yaNO8477ulJi3hhX+UOdwKJ
 j+yscfM2Wpq4U+Fv8KkVqdiqXPrgogOoVEoI3zio+8ku+opfnEMk95TARsW2Fkvilvv43Kgytm5
 cQ7HMrC1FE0zqrf6028cy0X25tZMnM1zQ+2i44flc0ujGlKY5opvM6YVzu2dIFIfFZLoaUSyhf3
 5QUXPqdRasJYZ17ik2F+1uX0Oub6djOLx+Yuuzzn2YSWoGZiyA05LE4+tpNvvpg0mS2ME97vdkb
 roOviyK/oHHVJjfUef6iLm9uuGlWRoIMM1dOntec3mDZA==

On Thu, Jul 03, 2025 at 12:27:04PM +0200, Jan Beulich wrote:
> On 30.05.2025 15:17, Sergii Dmytruk wrote:
> > +#define SLAUNCH_BOOTLOADER_MAGIC             0x4c534254
>
> Seeing how this is used in patch 3 - why does this live here?
> According to the use there it's something entirely internal to Xen. It
> could therefor be limited in scope to perhaps head.S or the boot/
> directory.
>
> Jan

You're right, I'll move it to head.S.

Regards

