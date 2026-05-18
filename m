Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EzLOlOkC2qRKQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 01:44:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A030B5751A8
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 01:44:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312311.1582448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP7d2-0005g0-VL; Mon, 18 May 2026 23:44:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312311.1582448; Mon, 18 May 2026 23:44:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP7d2-0005db-P7; Mon, 18 May 2026 23:44:08 +0000
Received: by outflank-mailman (input) for mailman id 1312311;
 Mon, 18 May 2026 23:44:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Edgar.Iglesias@amd.com>) id 1wP7d0-0005dP-AX
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 23:44:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wP7cz-009rrh-J8
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 01:44:05 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Edgar.Iglesias@amd.com>)
 id 6a0ba42c-5cb7-0a2a0a5109dd-0a2a4501dea6-18
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 01:44:05 +0200
Received: from [40.107.208.71]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Edgar.Iglesias@amd.com>)
 id 6a0ba443-c1f2-0a2a45010019-286bd0477965-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 01:44:04 +0200
Received: from SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21)
 by SJ5PPFCB5E1B8F5.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::9a1) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.21; Mon, 18 May
 2026 23:43:59 +0000
Received: from SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::ae79:f50b:b7a6:4cd8]) by SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::ae79:f50b:b7a6:4cd8%5]) with mapi id 15.21.0025.016; Mon, 18 May 2026
 23:43:56 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U+RUe5ElVWAARF0FaoJ1Ao/GhrwMQo4TJN5SYIHl5qD+tb9tedt8Y86nuoGTO+iVWrA1NghdV2qnIZNl0OhF7r30e8VuR+kqBlAWafwCYGuvHqDJunpsYHaYe0WMKX49nErwwPYGzVlgdlh2ovasyMICD0FzHVThx7wGt0qtGcsJqanTzEIK1ybG2vN9lduQggIZZ7JpxA8hhDx8GdlV506UCaZsNGC+b2lMb67Vxsuhr5OwYNlFYYS3YYVgRiTIysROQJ/L8LxSLlNlrc8YE8u+GQdMVpcyyQ3PlsYJiiXF7XdHAcRHwS0Ksp4HrJ1+CnJBR+FAd545t983I8NUIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e6B15qfuEE6W4dJidFJsAPg+nOkXdcykrC9g9nGa02g=;
 b=EZUfZBocrPpaErQ8Ko2dxW8rwiTllLPHgV9Ap4E6ZIYPVmpXy40ukV+N5vp8j1yXliG+Sn0BGTVh3z0YI6/yfCk39ATzfk5AjfEBD/jTLE7ouhAzNkM2qHKRWXlnM5ESk+1mpZy8MfxyVaqYOYNyOxDbmvVDyJhlDX4iTSSjJf2eL4DX5bDyVvhVp92Bg0pSmYGofbez/p5AVfHtUrxjQnGGwCqSSdVejqKq5R3JQHRlbZjFdetRqWkErKykg28WTOtv/FlxDol+W8TS3euH8P27HPHrbITloZY6bo87Ajbj4xoZ1tcCZ5gkxuatlPH0ZSMg0f9TP47ydw3SzinN9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e6B15qfuEE6W4dJidFJsAPg+nOkXdcykrC9g9nGa02g=;
 b=s5Ug1JGf8+B1MLBeg9OBHEd3ngZ7AWjZor8fhmiDNzfkB27GPljVvRca4b7WbSDcRhE4sKCxgJNeUjxgCye/6fp8Va5zZHWeaYD9BeCSV60unqSb4f/gvAAYbfUy1AOLcGRHiAQpF6dQBG/9ZiRol1tLjbakRn1x+jX9lhl9Kdc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	edgar.iglesias@amd.com
Subject: [PATCH v1 0/1] arm64: Fix strrchr() matching of null terminator
Date: Tue, 19 May 2026 01:43:52 +0200
Message-ID: <20260518234353.453193-1-edgar.iglesias@amd.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CPCP307CA0012.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380::13)
 To SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB6839:EE_|SJ5PPFCB5E1B8F5:EE_
X-MS-Office365-Filtering-Correlation-Id: e5265474-c593-4d77-b5d8-08deb53753b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info:
	4dTzfZZLzpF0J199sDyPz3X1kFcEeSBWbQdUytrXvrQC3zQxqpvxpYzLiZVTso67Gw66ePGWLOhc5tNF0u7F3jQbcF4B7NJl1iveGrEe3eIxIRtOHg04j8/URSS755EhzulOgPvumkQTaBO/xHArl1h5/hhS2OK/+izKqlF76FnhAT0CzO/v7TxR7fZFxcKVoyrDkfNJtk9e6fJcyWChKOb8mwz1HmE3PokjSHWX5O4e5rZiwiptUOLPlvCyWqmCJQ4Nmdvi0Fh7KBCTfcTYL683T7odLq6yed2SkBQsGaCkcir8W7FpwOdXUIFNwNWFdyjkqyp3Jw5FtZcz63Iueb6XPCxuzD6U7DA+69TQI2zK0/kE2vc9+wKn0rJx+lOB/3QYgzMpNrnHI5/CtQF7hoWU5qR/5B/Mk8BLQp6y+o0+VSnmxF5E92AZyVAmJhjl6aXu7Jbjqq1vjPK5y7gXSEFtQfytuXeZVXJmmV84HshTjKtUjlqrbUfY8ivpj2n2ZhrZUCZhkf567QHgd/rR9ULToQMITXndflQOLEk5uwHiv1OcbrYHgUCDyoornaK3MKODEoEVO4pVhTKZAAfD18VcjbOspKtChyNJDhHLjkFuun9d0oSyF99uZQRVnCRKzUuaOv0LKnTMWYmmtEbe4jQQURG9ZY3GM7gne6rTaroli0UyTX/0W2VvzujqMuGk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB6839.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(3023799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mzKWru31fXblGvVUWCM1G2eqcA8ApK/NBTumM9BDlyPukplYX6dGU6oVElfO?=
 =?us-ascii?Q?8L5LiFypVwSSrWpDUdHxdAJjeai/CTxoIsGx1OaGafD2sfQbrD2Pu3lXJEfh?=
 =?us-ascii?Q?n0x4UUZx8b/R3gk/WPY9Kg7LTK2Pd0xNG/w+jjzY/kSrFYy78VVW2TgpvP01?=
 =?us-ascii?Q?qflNThwnViV03vXeqqZzEdTwfxMl7N5ZUoPN2+vFR0JoKORm41StrNssFLTT?=
 =?us-ascii?Q?R0dIWF6IJrxac/mTHtjLzCqUMHt76gGfjvpXNflXCVWtN508GvVEkHn319w9?=
 =?us-ascii?Q?iCPtBjLOQZ7iVywSApKWB+sdYDRg/EUmxJ0IitXQ/NOECByD9KYcRfMRQz1L?=
 =?us-ascii?Q?lhce/4Pz87UND+brPySBQZYUSQD7LUWloLIzRl5/14ggtEW0zCZolH3banGW?=
 =?us-ascii?Q?fGHjgjvO60OV2wNE3Cv+wAhEmzbI3kLs7QqqFrYWcyZdmBVfFM85puoaEVSn?=
 =?us-ascii?Q?U3sqdBWigPLWzMcFwEyK2m7nc7BdDmwoF1gUasr/MXnSX5XkeemCcsR8ngAR?=
 =?us-ascii?Q?PDsL1njPhL8DQ2H5keruNNO6p1FFyQPQCsX8QVG50O/hJ1oU4WYIgFwdHlvq?=
 =?us-ascii?Q?R4qSXUX12nyoNaVcZQZDvyuevizpEcIOAPVKWNwMhRZAbzuaOms5EN5oYbc2?=
 =?us-ascii?Q?/297LNdXrt8O4McbLhFwOFl1BvT4zDPpRA5xEWjcr0EoxSTILlfC7MkQw+sH?=
 =?us-ascii?Q?fHaxa3d/oo7cOH4CpUTAywTfKzqKK96O0LTZFuczFh5e28oeThsYkKTKiFe5?=
 =?us-ascii?Q?Rl8xJUbKktD1+AsYhkCWWFZILtm9cfQF6zb0v7j2qnuIbChoZJUWLteOcBTC?=
 =?us-ascii?Q?2Pw+AKYdkNZK5SMVZXjaRLBTvGpaj8jAGZ+kmY2nF4+ZLIogvbWCl1T6HE5U?=
 =?us-ascii?Q?rMbURjbMeY1zePObiTFezOCTOg7k6Mn7rVplL1mrlsqapyfdC0JHzGpq/wS2?=
 =?us-ascii?Q?xwX+4FnzR/QwPmU5F2KOQkDXzJZr6/lj7ano1cIiOtSlyycC/VBMQiVohxto?=
 =?us-ascii?Q?7jAGbsMNMMT860ail0r/Re1quhEHAtoAtjveYE+b3SdgaGQtkP2NPEnn1ElY?=
 =?us-ascii?Q?MWzqLfXrrqDS4jD2/0FCkXbNskcIZMDVUvA7upxDGJib3BZQ89tGRRGSIaJ+?=
 =?us-ascii?Q?xNdQPzqcFQePeCSKSlw5ceephimYMVAFfUSKx7ZRTG/6qKKUfTqDzeT7sVG5?=
 =?us-ascii?Q?LxjnuzpkZczhzZc58RFI8PTwk6HE2mrCa4cZe3GI3ayL32uupS1phI2rLAtM?=
 =?us-ascii?Q?EFaJ5roSaP6evx6K++sBkbDigtdhYtrJdmdXNB5jmgSV0kSI+zC2F8WzOOHM?=
 =?us-ascii?Q?MU1nOyIRwcRoS4yZN5ylRpiDVTS9eI3+z/3Od8wwLQfc2E5G+v0q1Ik32Ugr?=
 =?us-ascii?Q?OnUsDqh+1+9nkl3k/DMc19SxTHg2LZk1jPM6yh5XLgX02Bj3ZSxbayQZB/QW?=
 =?us-ascii?Q?ZL5XAi3imNQpB9pPmYgjvCP41v7ttDSPiOJqSQsxZvqMOnByS5u/H0FTMDTA?=
 =?us-ascii?Q?psz0YzbhSDnNOiXZxtRKEkDZM/XRYzXTertX24ko3TkTrXwzWbdUeOKe6zwg?=
 =?us-ascii?Q?4WuILkmwR7kbpjoKVwWAz376TxIn5KnO3oyZ/6JSOUeDk/96JSvSZJIoZSn7?=
 =?us-ascii?Q?Mm+Z499YagJJ2ExZ1DJL+86NDGsONW+dEvjkmXibDn1O+7tB0Hv2gYkbmg4H?=
 =?us-ascii?Q?eqW5HkmSRX5RO0rEvDV5CytYXr6u8JkPtKRDua4e94y7c8xu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5265474-c593-4d77-b5d8-08deb53753b5
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB6839.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 23:43:56.6285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GNIN2ZjpC0y653CDOf9dtJ42F0bl0g3ziGEph7hWgRZpbIAJT8xj58eYiusTX3sE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFCB5E1B8F5
X-purgate-ID: tlsNG-d62444/1779147845-B4F48FF4-878D859E/0/0
X-purgate-type: clean
X-purgate-size: 384
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[edgar.iglesias@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:edgar.iglesias@amd.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edgar.iglesias@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A030B5751A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Found a problem with strrchr("", '\0') returning NULL when searching for the
terminating null byte. This fixes it.

Found while GDB-fuzzing xen/lib helpers under QEMU.

Cheers,
Edgar

Edgar E. Iglesias (1):
  arm64: Fix strrchr() matching of null terminator

 xen/arch/arm/arm64/lib/strrchr.S | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

-- 
2.43.0


