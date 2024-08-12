Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E9C94EA1F
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2024 11:42:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775411.1185630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdRXv-0007sc-1s; Mon, 12 Aug 2024 09:40:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775411.1185630; Mon, 12 Aug 2024 09:40:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdRXu-0007pP-RD; Mon, 12 Aug 2024 09:40:58 +0000
Received: by outflank-mailman (input) for mailman id 775411;
 Mon, 12 Aug 2024 09:40:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gveb=PL=epam.com=prvs=4954548ae1=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1sdRXs-0007pJ-Q9
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2024 09:40:56 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f70694d2-588e-11ef-8776-851b0ebba9a2;
 Mon, 12 Aug 2024 11:40:53 +0200 (CEST)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47C7M6hS015074;
 Mon, 12 Aug 2024 09:40:41 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 40x12yujew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Aug 2024 09:40:41 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by DBBPR03MB6779.eurprd03.prod.outlook.com (2603:10a6:10:1f5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 09:40:38 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%4]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 09:40:38 +0000
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
X-Inumbo-ID: f70694d2-588e-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HIwgFOp1Nr9r9RmolOV4HBi29hRuyNG6/0czDrmM98gPT0QY9ff6S0DJI4P1LvMUpk6Sl8mYjucCZqmksXdaqFS81tgVsqF5vE41/DdkryfSYrgnS34no0mE8/UBTiCorpTHrn+GVx55ZJkr0SOGGsOjQmxdsDjw9fhJ+hTYJwAl3zcdaUPu5J3iFT89lN1GhUIUjQ11KAq4i6kYqZD41m7wXN2RielDqOtZSzCnIq3Q+MUXMs8AY/kbbvxr/+UYzwYr8fBBJwVX15tbCzNXe7ga+ZyepybI5qoX0Po+fvfxAgEhfOF1W/Ph8oFlSFOVigkNtiLdBjkgiG5294CeKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3J60Lu1Ko24Yt7SDG8qCQTrTfShpIfy43x/+MRA2PSU=;
 b=o9NnS9j+FZ9+4Z17giZi4aWnTkl+hWVzoA4xrjhUWsrCFBVZEl+ITV1bHQxyKWquwujNfAVBQV2wQtzb/wWIoAVnhwazLV65/aRq3eVGzEFdYJjG5v9zADidpsMPndDynnkf4zcNpHi1HVQwImUTX9PDgoirPUINP2LtJHPN1GUYxOPfohe72bmsmcU9Ywzp5ofbiUNKY224s9P97qbmU62bJ3eNvhgEPNtknuF1B0EBREzVp69o7WRQp9UsczwYD4YXfwrANf8qn0tLtm2boAKmetyBuIK5MsAMkWIqIKhKU0X0+3LLwBcvA6ULceiQ5PXTOybkjNQGl9IOc9Hm9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3J60Lu1Ko24Yt7SDG8qCQTrTfShpIfy43x/+MRA2PSU=;
 b=SRmC1f4QumGs291ZrxE+XlPs/x6BPetAX2vanYn3ryylH8LwU2sC9DhUTOA98FoGOuT5Y1oUhd98Tw1TeLCG/tFS7GIuJeZHcFxgp8GDVS6m3yfchXzSG1Dhr3YJDD4d1EeUns+VFXwdE4Z2i1XWiTmYM0jAkV5ev+HAkzGsfJJy9YNxTmGBGjRbyy3wZiiOdCu1ESkmA3A4ZdeXine8LhVcL5ySTwbaHBkMzzVw91YWne/5mG690iLk0TJmjcDDRG2/+r6Hb1jHIRtxabBG8qAqRHfPbjl4qBuveHorLX+05BTOE/F+LlnhbRL+Dsr0S7s8LH8ptsBY+KF4yjIJ6w==
Message-ID: <dab7d359-4433-448f-b781-03544fd4b68d@epam.com>
Date: Mon, 12 Aug 2024 12:40:36 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 1/2] x86/intel: optional build of intel.c
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
        xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
        Andrew Cooper
 <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1723196909.git.Sergiy_Kibrik@epam.com>
 <25e80b9271607da56abf9d4193e4d91b3d00bd9c.1723196909.git.Sergiy_Kibrik@epam.com>
 <D3BBCS1WZ3FI.KYTC0BZLDUM9@cloud.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <D3BBCS1WZ3FI.KYTC0BZLDUM9@cloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0030.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::26) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|DBBPR03MB6779:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b58cae8-1f57-4f76-f7b0-08dcbab2d301
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VFdYNndtSksxUzR6M2x4TjRGRUlSUkRvSDJud3NaMXdacXV4UWJ2YkpzTThF?=
 =?utf-8?B?RWtpSmo4YmVodUczajRYUktnZnFqdkRFckpxd0lZNnVaV1NIRVFOZThKL0VQ?=
 =?utf-8?B?NTNyaTZ1c3puMkpNYUZpRGovK0gyRDJ2V0l3UkFubXFzV1N2cWs5YnUrWFVU?=
 =?utf-8?B?VnlBV29QK3JPUkYwMml3R1ZFU0NDSmhnc3p0SzZWR3luemROUFdHaERGdDVM?=
 =?utf-8?B?RGd3VktKbWR5RGREQlhPdzBGVThEY1R6NDg0NjFNL2JlNHJidWdzL0NLeWZO?=
 =?utf-8?B?Ti8zRkJsejAybysyQXdVdWh6TXFVZW1TL3RIS3dkd1c4LzdnSHNWSi9tNHp2?=
 =?utf-8?B?WlpPRk1acUNmNlFSTzh3YWFGRDdxcDNtN0p3dHh3UUlqdklBMVVwek9MWEZZ?=
 =?utf-8?B?M3VOdUY5anhUY3BYR1pGSmo1aWR3RllTVmZKTlhjbFBHWTBMc2JSTUM5SENz?=
 =?utf-8?B?MVpNTkxhUDJUUFVITFVhdW9LLzJ5c0Zlc0prSzVMZ2wwRGt4Yk82dlpKSmFY?=
 =?utf-8?B?dEhVWVZ4WE9Oa0lOZU5MRVRPYVJzb3dIZm9xS2dGdm92NE1SR0ZMKzlqd0VY?=
 =?utf-8?B?TWxpdExHVFRBM2VyQ2VKeDhLTFRQR20vZGF0ZjExRVBRUUJSa2ZTcWFpOVNZ?=
 =?utf-8?B?VHVPTk9tSGh0M0VkUXQ2V2ZFS2trdDZndTgyVGVOYnNEZVJrakhJWmJUMElr?=
 =?utf-8?B?SllpSTRUOTdSaDh3N2VCVWlSOVZ4MEpmSGNycnRuMHI3dTFDYklnSHFodkpl?=
 =?utf-8?B?bjhFWDV3aEtVTEJpeTMxZ2VsaGhlU1gvQmgwaEgrOUV4dTJ0NlBRMnBlcWo3?=
 =?utf-8?B?MVB0R2xWWWJ6dGxyVi9QcUZiMERFSzFkSVpCWmdtTXhVVUVkamNuR29MMUl3?=
 =?utf-8?B?aklHdnFuYU9Zb3pqVWxaUUJxaisxMlFMOHB6NG1UWkdoUythaTBOYVVuM1JU?=
 =?utf-8?B?cUhBbVlwWmtCMzAwM2dMSHhQLzFKRmlMQzdja0hBbW9YVHY0NmhzZ0hqMFlq?=
 =?utf-8?B?Tk9IYVJVK2Nxa3lsQS81dExoLzhoMWhsNy90L1NzNFRZUXpiWDlQNjNQNDA3?=
 =?utf-8?B?WDdCOEhzSWF2dGNRcGhaYmtGRXVzNjljdHhYdFV4a25BaXdFdDdyQytlOGI4?=
 =?utf-8?B?c2FQcHNPSzk2OU8vdmxOc0tyUjZkTncyaEc5V2pITVV1ZFc5T284eW9oUTBz?=
 =?utf-8?B?SG9pbUFaQWFTVmVNb21BNlNuWCtjdHp2VmxOQ0R6MElMM2JDSTJ1akhCbk85?=
 =?utf-8?B?dmpWZ3dUWkNYN05HQ2NUMk54cVhaN1BYR0lKVEU5V2V0VWs0RzA5SEdtL2Nm?=
 =?utf-8?B?MXlnOW5lODBOODErTlJJbGlPNWxHdmV4N2s5SFVDTkdKTTY5QlFjcHNwazFo?=
 =?utf-8?B?bTdLY2xJZ3pGbFJ1bnFLLytrOFZpem95ZUE2LzkyakZUS1BnMFhjL2txWlR6?=
 =?utf-8?B?Y2hmRlYzRmMyaEliVmUzc0lkcXg1ZFFYZ1pSdmhDc01hWDJ5TW1NSnlJaVA3?=
 =?utf-8?B?a3RJR1U2cURRNTJUVldickhHZVNjbC9HdmVtY25Ua2JaNFRZaVFKUkxRZ2VL?=
 =?utf-8?B?NFdES091a29qWVZqVzdyd1J3MmZmeHFOOHAwclhOcXdoR2RsNFNCQW9nNmow?=
 =?utf-8?B?ak9UT28vUHBmb2t2K2xTbU5jOXpMaXJzSzR1S00reW1YejZ6b0p1RUpxMmMr?=
 =?utf-8?B?WlE0UWFzRUhSMis0TjBJUXhxdEJTTTNwNTl6a29KY0RJTE5qV2psS0FJenhw?=
 =?utf-8?B?YkJHTHc1ZWZYMEdnMjhwbDdNbWthOW8zbDNvK0NaS2tPblBJbTNCRHpaVFZ3?=
 =?utf-8?B?eHZDRzdOdTJmM0FxWHFMUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzAxWFZ2VkRvMnVJekhyTkNYM2hvOGVFcytJYi9DTmk2VnFuMmhUL2hnSkV0?=
 =?utf-8?B?cTk5REVEVmxqZkppdVlXdFU1eXZxWkk3Unh3WXIwMnN4NC9KbDgxUjJWbytV?=
 =?utf-8?B?TTNsWWtRQ2c2VG5UdUkwSThabVg3MFpSVnNjZWJ6TXlVU3RyWlgvZzhsTGpW?=
 =?utf-8?B?MWJVbm9iamhDZWVzM0pzQlZ4c1FWT3N2aDA2cUEvKzJiZ3ZFK0crTmI3NVRx?=
 =?utf-8?B?dUZSV2l4YkJiTU90NkprcnpvVFYyZ3JqSTZtcmZzdWdMbTA4bnEyV0NNOXB2?=
 =?utf-8?B?ZjdVNDYwdnNWTmlIMmxwallkNmpLWk1WUUF1dzF4OW1NMDdoaVRsVTNSOWtQ?=
 =?utf-8?B?YVZjZURSYmovTWFmcUlQbzhuU3hRa0xmR2x3YSsvbGJreWhDUk11dGxzVHRi?=
 =?utf-8?B?bGRyeUJCa2pLL2I2dzgvMEl0U2U5VWtVdFFRZlkyTW1kZnRpd3VFTVhXVThs?=
 =?utf-8?B?cnVjemdVT2RtQytRQ29tejBuMjRNY0VERW4wSXhnL0htR2lSZHg3cGNxeVZp?=
 =?utf-8?B?VkJFNGFrWThMWG1aUS9vTTV2aFZGeE8zM3djc3dtNFlZUVlDRWIvL2Y5eGJx?=
 =?utf-8?B?a3VLSkZZVmMyYkpWSG5lV21KcDAzUVhxVzZldFdkRXd0WFVWeVlnQmc2RVVa?=
 =?utf-8?B?Yzlja3JPVGZ6cFpvLy9Ha2ZxNnZqUUdaem9hV1ZoNHUxVDQ5Z1p4WGZxQUlN?=
 =?utf-8?B?RG4zZ0tCWXVBWkpRSkdDS1lNVEtOYlJiTkRqcFdIdjdETmFOaExYQWZ4QXJv?=
 =?utf-8?B?U2dpZ2E3K3MwbEZOd09jelFEREpwOEdnZ1FrN1JFZFlZemcyUEJ4MWFrY1Fu?=
 =?utf-8?B?bWRtdWVYU1dicXVsRGtCc05JYlFLVklHZWFVclRNazVqa1NucFo3L1lPcjRv?=
 =?utf-8?B?VnpaazVmYUtHbDdJL21HQjRpRElDbFVITWllcmpwc2xEWU9MSVZlUndXUUcr?=
 =?utf-8?B?c0ExRUlDUGU2RzlMY2h2VmxQRG02QWc5Ym1WanBFZ0Z1Y25BYURJaHZHQ1BG?=
 =?utf-8?B?MjFUQTlQWjd2Z0kxSkZhVHVVRnJmcU1NN0FzREU0QTk4Y0tVZ0hqNHUzSHRY?=
 =?utf-8?B?VUVsN1Z6NG00a2EwT0E2bnFTOCtWN0s0OEdBWEMwaDFESGlYbkd2M0xkT3FE?=
 =?utf-8?B?aHpmQmJwSkJpU1hHM28xRDRuY0hVR210b3lHVCtaMFZDMUllS3BGVmt5bTBY?=
 =?utf-8?B?Z1VkYjBSbDdqMDg5ZklYSHpVR0pZWHBHeVEzb0lRRVQ2UENXUDJoTVlqSEM4?=
 =?utf-8?B?TkRraWVZT2ZJN1NxVVd6eDR0T2Y5S0x2cmUrbU1BRmJwVjVxRVNmdWtZM1ZF?=
 =?utf-8?B?Q1phMmRjTUFKZW1WVWV0OTEyK3lMNUl0dFVTUEJCeFBDK3RhQzlqRXpQTVRj?=
 =?utf-8?B?S3kxWEx1RXRqb1lTTFFUeEhxdDMrb3Ftc2U0V0VkTjczRWdXRXlack52ZlAx?=
 =?utf-8?B?YnROSlczMjFaTTJFbHkrSjd3RkxyTzNySkRMVkViRDFocUZJanQwQnc2aVRu?=
 =?utf-8?B?T2NGeWgwZERhNzFFYjcwcGZTVW9lU0k0RVB1VnBFZ0l3bys0Wk5TcHlGbW95?=
 =?utf-8?B?b1JmMER0Mjd0VkhsSE1CRUJFdFVvWnFyU09DN3JoY0xKMzErWWdPNk9KNDUr?=
 =?utf-8?B?eStkM20ya1hUalJPTFk1bGkvUXdRUTZPWi9PeHRNZHFnY3Uxd2FOQkZPb3Bh?=
 =?utf-8?B?dUQ3eGFya3U5VGJ1dWtCN0VFYWhGTHg3K21uOGxUVVFYWlVyQ09lelFpU3dL?=
 =?utf-8?B?Mm1SSFNhSlhJcWJkRFdPc0tCL0xZcGdzME9VaWtXQmFqOGlOV1VLOXdUUXNI?=
 =?utf-8?B?aFVhM0I5ZWNuUTVvWDZpZStxZE11NjVOenIySi9ic0xmV0RiaXViMVJvVjR6?=
 =?utf-8?B?N1lGaDFyTkpDZVdVY2xEc2FHaklEUGNCOXFZSFpDdDc4Um05dXY3c0JQM2xR?=
 =?utf-8?B?aHljdWlEWFBLbUZzNlhBT1ZCYlBQZkRlODdiV0kzVURvNnp1eEJNeWxuTUNh?=
 =?utf-8?B?SHVpRmllVmJqRXJxVTRRL0h3WWtwWDVaTDY4WGFyT0VMamozemQ0Mk0zZmw4?=
 =?utf-8?B?ZWV5OWIxd2VCOGltTDRBVkE1cGlIT2FmYnFLd1FuZGRlb01tOVVLSFFHREhD?=
 =?utf-8?Q?61moXUhN7VXhwRFeWqt1gDSCu?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b58cae8-1f57-4f76-f7b0-08dcbab2d301
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 09:40:38.7879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JbByr0eQ85wdE2CHEd7JRKSoNDQuxU+t+LU4whmc6SlKv3hViTTtbThEERBxWbf0wM0heTq7VWIMn+ac6ExwoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB6779
X-Proofpoint-ORIG-GUID: dBRbdRCa-SJjTwK3VPSJNQyIiNw1cw4g
X-Proofpoint-GUID: dBRbdRCa-SJjTwK3VPSJNQyIiNw1cw4g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-12_01,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 clxscore=1011 mlxscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408120072

09.08.24 13:36, Alejandro Vallejo:
> On Fri Aug 9, 2024 at 11:09 AM BST, Sergiy Kibrik wrote:
>> With specific config option INTEL in place and most of the code that depends
>> on intel.c now can be optionally enabled/disabled it's now possible to put
>> the whole intel.c under INTEL option as well. This will allow for a Xen build
>> without Intel CPU support.
>>
>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>> ---
>>   xen/arch/x86/cpu/Makefile            | 6 +++---
>>   xen/arch/x86/cpu/common.c            | 4 +++-
>>   xen/arch/x86/include/asm/processor.h | 7 ++++---
>>   3 files changed, 10 insertions(+), 7 deletions(-)
>>
>> diff --git a/xen/arch/x86/cpu/Makefile b/xen/arch/x86/cpu/Makefile
>> index eafce5f204..020c86bda3 100644
>> --- a/xen/arch/x86/cpu/Makefile
>> +++ b/xen/arch/x86/cpu/Makefile
>> @@ -6,10 +6,10 @@ obj-y += amd.o
>>   obj-y += centaur.o
>>   obj-y += common.o
>>   obj-y += hygon.o
>> -obj-y += intel.o
>> -obj-y += intel_cacheinfo.o
>> +obj-$(CONFIG_INTEL) += intel.o
>> +obj-$(CONFIG_INTEL) += intel_cacheinfo.o
>>   obj-y += mwait-idle.o
>> -obj-y += shanghai.o
>> +obj-$(CONFIG_INTEL) += shanghai.o
> 
> Why pick this one too? It's based on VIA IP, aiui.

shanghai.c and intel.c both use init_intel_cacheinfo() routine, so 
there's build dependency on Intel code.

   -Sergiy

