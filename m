Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E08CE2FD2C0
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 15:35:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71451.127958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Ea3-0006ax-AP; Wed, 20 Jan 2021 14:35:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71451.127958; Wed, 20 Jan 2021 14:35:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Ea3-0006aW-5t; Wed, 20 Jan 2021 14:35:31 +0000
Received: by outflank-mailman (input) for mailman id 71451;
 Wed, 20 Jan 2021 14:35:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+sX=GX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l2Ea1-0006aR-H0
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 14:35:29 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 918d3c1f-95d3-4664-9084-6110857af941;
 Wed, 20 Jan 2021 14:35:28 +0000 (UTC)
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
X-Inumbo-ID: 918d3c1f-95d3-4664-9084-6110857af941
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611153328;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=dIZNR1nR7XK3pQFyWHyTmItYVE31BjPPTpNiwFvIPvc=;
  b=iZw6HKVIc0od89XKw7hvfnKf4fa0bA1zfXV218cGvNKk37IvCl8mYPfL
   /75XDe4v2cMnE0mfI//Jq/Q71G555wJnOC8VeIwAIzFrcpbDrm8Wl/4I2
   Yi7hQZP8ZhZtpWtBgonQFrzr78wz73sd6nUzfUBozeFtFG5lmykvu+Q/Q
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: zJG8FlYCzwhLOj8dzfvjhcRGXcFbufTeujyFcCsuWU5YAUdxaPtzV2sqItIUtfp4g7Y6zslV1R
 JVpMZrA6MLk8hvLDuuZRUlP3ji0eY+qq89CShv+ocKQ1MPL1NA8deSgiEvvDxb1Jzwqn338m8X
 YoIOyN7QxmyjWdqgTNaT5Rr43zd6uvqg0UB4xCpSJxJvRONmTZWNiPQItFhAPwA2oTfiChgchh
 n0KwE2L3m3kfeY/QoCaKuay1fQAbZo2GWe9L1br7Chbfcyucrsd0bj1ZuJqB5PSQ66eRQUKnU1
 M8g=
X-SBRS: 5.2
X-MesageID: 35454456
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23: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
X-IronPort-AV: E=Sophos;i="5.79,361,1602561600"; 
   d="scan'208,223";a="35454456"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SWfMhVOSSlC94xfH4FdDG9se/uvHtykqRIb1Bw3TYc2gxlLz1e6oLRaLe2+ORSP6MumfsEbWT0NTtfCtMU5Ds7mn7mp6zvrCe1w+ObmgH1zJDMYJYJFy2TLDkYm4g94BscrX43wO0ez/pcJq4jl4e0rvcCdEpsOxGVqmwQ7AQRzBn4wJYmEPXw3aN6tyJD9Ht6UGmfXAl3GHzpKTfrKsemT1QjwzIgS3JtxpbUEN0+ELw3pj3eGSgv2MoWbyQwAjr6awBrysVGsBtO3kb3IcSK9uxn6IbPsCSgX+KE3U8vJ3HADVve6WSNnnCRhzN8Ng0O6jeAzQxitK2sjSQUFQvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OyOR7ooZfZSJYzcB6XtiZ+6cs/eR8SAObO2ckkyoKho=;
 b=RYwRchN0WCQgBEpK2nWvkliyfQL2fu8rWS1RksmHBrOH0tYuIc1X6sWz3k5ZyiaZY0Ukp4Lns04x5wn6OLaC7QXfpcQnUPFu0c6hUHZE8yz26cENdvFG9zvqyEa81g/7HWklhvgVWkG64yLaKGIMaxWlarSC8CjbdFORXYVSiYPOC7JTHv4/F1Drs0KaZG8SqNS63tfrPqOCIs8ruGnDVaZrBmBj2sqn17uW47xeo5TBo9BE7zXNx1Rp06NfkI8cMfP6defAO+LzKPi4XTYgxnvpra6+YT98DL9Uq0/O6nTMAcHPCbI6iRUlQx2Wg2gEyyWbwyx79n/C4yG14Vz2qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OyOR7ooZfZSJYzcB6XtiZ+6cs/eR8SAObO2ckkyoKho=;
 b=rl8zdYgARNULKWJtCHeTgGhdsu7FBeXLCKNpj8zlL8pW/AIxMqWRefP9Hk4j6hD8Z8r7jc8UASyfHNfnze5A3WsMlQJoku/pRVPOULBhVY3Uuxa4qQP8QDhtpMuEtJ2JqhzhT0hzXcvLIzLvhUJMsNYAr7XJbsbipE5x0xhvalg=
Date: Wed, 20 Jan 2021 15:35:15 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Arthur Borsboom <arthurborsboom@gmail.com>
CC: <linux-kernel@vger.kernel.org>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Jens Axboe <axboe@kernel.dk>,
	<xen-devel@lists.xenproject.org>, <linux-block@vger.kernel.org>
Subject: Re: [PATCH v2] xen-blkfront: allow discard-* nodes to be optional
Message-ID: <20210120143515.v2vgyhcxrhnnng6r@Air-de-Roger>
References: <20210119105727.95173-1-roger.pau@citrix.com>
 <CALUcmUkd9Eeau6tC9ZWHbLdvHTYfY34LvK6KKpOOxreYF67Myg@mail.gmail.com>
Content-Type: multipart/mixed; boundary="4gc2aiveabc3g7bi"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALUcmUkd9Eeau6tC9ZWHbLdvHTYfY34LvK6KKpOOxreYF67Myg@mail.gmail.com>
X-ClientProxiedBy: PR2P264CA0043.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a137173-cb26-4044-6585-08d8bd509ed1
X-MS-TrafficTypeDiagnostic: DM6PR03MB4537:
X-Microsoft-Antispam-PRVS: <DM6PR03MB453771D163D22E37B8B6B2B28FA29@DM6PR03MB4537.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yv3drpaOt90dp6RnJjhqJoB3aEVPsVdo2tZPOoQevYcpz4B4u2OXh5gzx8bGU01BaslRT35a+EfwhorArlfZB/Qjy7k4kv4pZNWa86aRkCmYefLHqzQG7uNGg3m4RrLAaT+crmJRGdMP6CmOE5NGWhbCBi5iBQsf2KifypydB1afvWojr8/TSu7wOjYPxUuhHdVortw6HjMiZeG2I3f0w6NOEcBxBOBfgYwty6/WjfUhZFIfwQenO5VS8bLOQeAqQrPTviOmaNS6/olxjX+G/ieikiw2Jyq6SGHawu6hKPQclQJBsuC0a8pTvlMHHTp0UVNxRvAZ7NA2+Npx9s4cuqmKnyh6mcbjciMdXDnhCwc9jQwwGeOvV2c9y5preDsSqaBlp864kFO8yRMWPN2yNAknvmu610aJPGvvNdEuKllvoF68BVtnV3el84HVrIMm
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(235185007)(2906002)(44144004)(33964004)(6666004)(85182001)(316002)(9686003)(6916009)(5660300002)(16526019)(186003)(33716001)(478600001)(6496006)(83380400001)(8936002)(66946007)(66556008)(6486002)(956004)(54906003)(66476007)(66616009)(1076003)(86362001)(8676002)(4326008)(26005)(2700100001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TWRBM2NmWDZpZ3lreGZEVkVkaHVTdytUVThaWk5zTmlXNk9vckYrSEYyLzN5?=
 =?utf-8?B?Z09KYjBDVHY1S1dYTWZiM3ZzQ2ZKeDNtTUhLVGh0ZDFVZDZpTFM0N0c0QmpB?=
 =?utf-8?B?K09rN1lHNlFYVkNBd1FKMmtVc1ZaamducXo0U2d4aTF3eVdMZVRQc1FZZHhv?=
 =?utf-8?B?VUFhL09EbGU2d01EY3ZHNmRWcWNITHFwY1Y2YzNNR3VqZ3lvd28rd3IxcUs1?=
 =?utf-8?B?Y3pRNnFKbkhYZ1pkV3ZQOERwMzR5S1dhYTFvWUt0d0N5eDFBTUM0WHFySGRa?=
 =?utf-8?B?QU5CV1BxTFh1M2hKaHpTMzZBWGZFdG9IeWU5MGZ3RjJGS3RvbTZrZ1FnSktE?=
 =?utf-8?B?cURINXQwZzBLMWk4NWgvTHNMSFhxQm9nUDk5aHdtbjRwcVVKSVg0ZGhVUG1H?=
 =?utf-8?B?M1lEbi8yTGFuMWYzVzRqZnFqMmtCR1JOL2hnaWJOY05kWHJwR0ZJL3hlTUxW?=
 =?utf-8?B?R3NaNDlQeUpkeWNidzZtc29UQUhGMnhvbXQ3MDF3dkFkejd4R3BFWEYyRElz?=
 =?utf-8?B?aitQZHQzRjk4VlRIOHd2QzAwLzRFNTJXUTJjczZ1dnRQREtyQ0grRDZYbkRO?=
 =?utf-8?B?RzhTS2MwKzAweDFBRVZCdXU3bmNSSXBMWC81eG8zOWtsdEsvam5iQ3FMZHhI?=
 =?utf-8?B?SGIvZDV1TWdNQzhwOUZiMC92amk1YjNMbytqNEgyMG5uT3U1Rkt5dTVnWW5p?=
 =?utf-8?B?UWVzYXhrbmlmTzJ5eVBVRjRRREVkR3dqc25WWk55aVhqS0RFN3J0elhTcDNO?=
 =?utf-8?B?aDVvcTNsRjV5Mzg2M3Q4MmVOSitCbEtPUjY0T0dzK3M5djNmQUNtUWNCanpz?=
 =?utf-8?B?VitzVGVKTWNQUW9NMTNvOVU5T0lncy9nV0dCMGhDSkd2dVRiK2VuWkxuTERZ?=
 =?utf-8?B?UFJ3UUNFeWIrWnUvRzlxaGkxUHg1QVJXODJ0NTFaUmIxNDF6OHJwa210VU5M?=
 =?utf-8?B?ck5Eb3FMOFhDckFEdFRvdWROeDB4K2kyK2hieTI5Ukw0MlJUQnFOTHNGYWwx?=
 =?utf-8?B?Vm5kZGN5STl3NDdDRGRGRWExd1VWaiswUlFxT2Y4dkZWRlF6RWN6VkFjSE0r?=
 =?utf-8?B?T2pkVGVzOGdSNTdoUmpYeUpIUGozUW5ya2c5R1FUYmhCZ0xESmFhd1hySUYy?=
 =?utf-8?B?UkkzcUhDYXlOVERkbjRaTlZLRmI2cUlsSUkyTjQrTW9EUGRPR0lBWGFINXE2?=
 =?utf-8?B?K0p4WnA0MU4zNzNOb3krNDV5bVZObHlWQmNORTM0Sklqb0ZmaGl1UEEyZ3ZM?=
 =?utf-8?B?dEd3SWVDTDJxODQrWUh2RC9PWDk0eFo5c0wrT21UK3BNOTBTLzdYMGlGc1R5?=
 =?utf-8?Q?/1d/kOXBm8sQ7MsCRxdtq4+dUXmRwVUPVZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a137173-cb26-4044-6585-08d8bd509ed1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 14:35:23.3825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iA4N9gODw6C7NN6cVLh9djfFWkscv0h91mBUpeqk7zemuOpjq4gni8P3+8FjQ17kibQzmbZNwhrRuOHc5bbUIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4537
X-OriginatorOrg: citrix.com

--4gc2aiveabc3g7bi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Jan 20, 2021 at 03:23:30PM +0100, Arthur Borsboom wrote:
> Hi Roger,
> 
> I have set up a test environment based on Linux 5.11.0-rc4.
> The patch did not apply clean, so I copied/pasted the patch manually.
> 
> Without the patch the call trace (as reported) is visible in dmesg.
> With the patch the call trace in dmesg is gone, but ... (there is always a
> but) ...
> 
> Now the discard action returns the following.
> 
> [arthur@test-arch ~]$ sudo fstrim -v /
> fstrim: /: the discard operation is not supported
> 
> It might be correct, but of course I was hoping the Xen VM guest would pass
> on the discard request to the block device in the Xen VM host, which is a
> disk partition.
> Any suggestions?

Hm, that's not what I did see on my testing, the operation worked OK,
and that's what I would expect to happen in your case also, since I
know the xenstore keys.

I think it's possible your email client has mangled the patch, I'm
attaching the same patch to this email, could you try to apply it
again and report back? (this time it should apply cleanly)

Thanks, Roger.

--4gc2aiveabc3g7bi
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment;
	filename="v2-0001-xen-blkfront-allow-discard-nodes-to-be-optional.patch"
Content-Transfer-Encoding: 8bit

From f09acedb2e40fa84f31cfe4c960dea2037d06e3f Mon Sep 17 00:00:00 2001
From: Roger Pau Monne <roger.pau@citrix.com>
Date: Mon, 18 Jan 2021 11:47:05 +0100
Subject: [PATCH v2] xen-blkfront: allow discard-* nodes to be optional
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is inline with the specification described in blkif.h:

 * discard-granularity: should be set to the physical block size if
   node is not present.
 * discard-alignment, discard-secure: should be set to 0 if node not
   present.

This was detected as QEMU would only create the discard-granularity
node but not discard-alignment, and thus the setup done in
blkfront_setup_discard would fail.

Fix blkfront_setup_discard to not fail on missing nodes, and also fix
blkif_set_queue_limits to set the discard granularity to the physical
block size if none is specified in xenbus.

Fixes: ed30bf317c5ce ('xen-blkfront: Handle discard requests.')
Reported-by: Arthur Borsboom <arthurborsboom@gmail.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: xen-devel@lists.xenproject.org
Cc: linux-block@vger.kernel.org
Cc: Arthur Borsboom <arthurborsboom@gmail.com>
---
Changes since v2:
 - Allow all discard-* nodes to be optional.
---
 drivers/block/xen-blkfront.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
index 5265975b3fba..e1c6798889f4 100644
--- a/drivers/block/xen-blkfront.c
+++ b/drivers/block/xen-blkfront.c
@@ -945,7 +945,8 @@ static void blkif_set_queue_limits(struct blkfront_info *info)
 	if (info->feature_discard) {
 		blk_queue_flag_set(QUEUE_FLAG_DISCARD, rq);
 		blk_queue_max_discard_sectors(rq, get_capacity(gd));
-		rq->limits.discard_granularity = info->discard_granularity;
+		rq->limits.discard_granularity = info->discard_granularity ?:
+						 info->physical_sector_size;
 		rq->limits.discard_alignment = info->discard_alignment;
 		if (info->feature_secdiscard)
 			blk_queue_flag_set(QUEUE_FLAG_SECERASE, rq);
@@ -2179,19 +2180,12 @@ static void blkfront_closing(struct blkfront_info *info)
 
 static void blkfront_setup_discard(struct blkfront_info *info)
 {
-	int err;
-	unsigned int discard_granularity;
-	unsigned int discard_alignment;
-
 	info->feature_discard = 1;
-	err = xenbus_gather(XBT_NIL, info->xbdev->otherend,
-		"discard-granularity", "%u", &discard_granularity,
-		"discard-alignment", "%u", &discard_alignment,
-		NULL);
-	if (!err) {
-		info->discard_granularity = discard_granularity;
-		info->discard_alignment = discard_alignment;
-	}
+	info->discard_granularity = xenbus_read_unsigned(info->xbdev->otherend,
+							 "discard-granularity",
+							 0);
+	info->discard_alignment = xenbus_read_unsigned(info->xbdev->otherend,
+						       "discard-alignment", 0);
 	info->feature_secdiscard =
 		!!xenbus_read_unsigned(info->xbdev->otherend, "discard-secure",
 				       0);
-- 
2.29.2


--4gc2aiveabc3g7bi--

