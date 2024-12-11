Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 180F89ECBDA
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 13:19:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854710.1267845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLLgR-0001Zy-3E; Wed, 11 Dec 2024 12:19:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854710.1267845; Wed, 11 Dec 2024 12:19:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLLgR-0001XI-0P; Wed, 11 Dec 2024 12:19:15 +0000
Received: by outflank-mailman (input) for mailman id 854710;
 Wed, 11 Dec 2024 12:19:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7jQm=TE=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tLLgP-0001XC-3d
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 12:19:13 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2614::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2090fbf8-b7ba-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 13:19:11 +0100 (CET)
Received: from DU7P189CA0013.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::18)
 by DBBPR08MB5996.eurprd08.prod.outlook.com (2603:10a6:10:201::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 12:19:08 +0000
Received: from DB3PEPF0000885C.eurprd02.prod.outlook.com
 (2603:10a6:10:552:cafe::e9) by DU7P189CA0013.outlook.office365.com
 (2603:10a6:10:552::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.15 via Frontend Transport; Wed,
 11 Dec 2024 12:19:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF0000885C.mail.protection.outlook.com (10.167.242.7) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Wed, 11 Dec 2024 12:19:06 +0000
Received: ("Tessian outbound 2d228e31de9a:v524");
 Wed, 11 Dec 2024 12:19:06 +0000
Received: from L948dd1a0abef.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DE5BF4EF-BCC0-4AC8-8732-DB6C76BEE37D.1; 
 Wed, 11 Dec 2024 12:18:59 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L948dd1a0abef.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 11 Dec 2024 12:18:59 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by AS8PR08MB8111.eurprd08.prod.outlook.com (2603:10a6:20b:54d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 12:18:57 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%5]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 12:18:56 +0000
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
X-Inumbo-ID: 2090fbf8-b7ba-11ef-a0d5-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ZW5YPIatvUXRYRzrF5uWoAvZE04BmUR96A+gfNUpmxqY79r4DgB/3cXUAinwNY0B/herJ08ce0JOPrLezqKJJ61b+/Z7moK5asMxjzjzoo2hDi2SQRKRJThSdKtOLHrbvcpzdrKZF7NoTAIOUdLY/pzGb1eCmhYmUo0dk3pLMDbmr1jopKkrTDg52T04oxa46M/qILmRzhBQuD5FbLR4AsUxvrTzse/yQJFU2QqoWENYvQeq3hrGw0SVAdE5OHRFOIlD9N/p9aL4apaCnaxNO5Pl9r3Z1ZdT1uFxbfi+JIV+7N469YPr3xeFkes87yCMoBQnxsbie0rG1iTWSfM19g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tNX26RZp2IJJcVJeS8hXI8ZhhvBhOwf+/QnOaB9Ck4Y=;
 b=jOj9PSfV08w39NmU+Ez1EjfRBvnVP4khVGhBbEDn3cMV/rkYMimDzHwKD9Vqt6hybxT61RMI5+LI46opTB7Q6eVZFy8ErlHXPzBaaT67YFYi/qQC14VZ5xvEcbcYc0wuISJr7vJDk5J1KNSUk3T1l6jAaWSbYl/usiOpxKrGYalIWJmt8YFuHixUD92/pkjIp6msxDgxSXwzmc7t5k4l8yAJWNyTukNa6tgcLUK1HFTqtPbc+p2hJcmuAB1rLCk46RJNT41vHk130BrlnttVlbEyhmVoPU4rmOPbs2/WRt0JWJI/yJNwoOdnviVfdsbZKNHqFchPAxv+B+vD+q0AjA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNX26RZp2IJJcVJeS8hXI8ZhhvBhOwf+/QnOaB9Ck4Y=;
 b=eTP9ezwBhpHBjjfjdK8FPwfk/DqXvCEdNEMFc7XaZ/5jmwUPxOgsdUIcy0czLoh/ntOmZGycUOdH6O4duhT+l7Zlhp/IWaEandEPfLRS9oWMnmWx3eibOVy3eUnwNxzGMhuy6NdfJqPMsEqzZfgeb+B7+lFYJGIfOxxc906/CSA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d128d359b7199913
X-TessianGatewayMetadata: 93+zrbEsSL+hyhhikeWk4ebkuNDv2FYHp15K1WFvYkrpsTqnym2+eE8w56Ff59iNqG6UrxL31CS+e40MurOlkyN95sBK1NGYlxdo5XtBmfSd3GuyuIOzz1FAtWv4EFIhS6CERFdb6vp2oLg08uuPi7jXkAgmIhok0DDJcODFsVU=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rHTUf1a6Zd9DxsVv14+AN1SjdPWn2tM+01LeZlHbS4DYYM8T4UY/eg0y/LyLU3nbm1A3GKwe9rDtpJznwwO3v8FQ0kHOOzDzyYYRTB29ryYx7IcEBqSVRTfci35NNQeaka6spqu2BDyJiDdAGR7Oq1iD09ZPFqQGez4YXl0VI95ovtNmwv3nF/g8xuDueEmAvbjNGq/ucCMNxCIRpDksCSmrIZ2iq2n6rzskxab9VRHblQHW3ckkGQyibxopHIL6mwPRq+zZ18WObo72+v4WqO3w1TtQZhmhXDI5/GyUBgJB7k24+ELA3LjOiP1TWRPb0+2ngAKkiLEQyNQmaGIglg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tNX26RZp2IJJcVJeS8hXI8ZhhvBhOwf+/QnOaB9Ck4Y=;
 b=j2Dpbt/E2VXnddY4zsyPp018oMdWagIDPoKLncaMbyhPByo/zS2pFqvnNn5T/IouQl7nHZvybxouK5NiwGHto5I5MiL+tKwuLm9Gak5lVUFiITmBWPeXTsyBXi3GeFly7HiN+on8X54my+amTS0nlTrYTmdRl1ErI3U1w8kJYL0zNKMdVqFlbIpfG1mgUo9N0uTcP75Zym5raCqvtg6CAMV372SaUwXF0mAXOuma0tbNZnbqKyZ0+9ErMbJgM7wWck52/2V2GUdwhR9gaMZx/zvstKUEbdBsGt3ozP2aw0wS+WzoMkoxctbXhan4pZLImefXSumWKld55hxnCG5k6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNX26RZp2IJJcVJeS8hXI8ZhhvBhOwf+/QnOaB9Ck4Y=;
 b=eTP9ezwBhpHBjjfjdK8FPwfk/DqXvCEdNEMFc7XaZ/5jmwUPxOgsdUIcy0czLoh/ntOmZGycUOdH6O4duhT+l7Zlhp/IWaEandEPfLRS9oWMnmWx3eibOVy3eUnwNxzGMhuy6NdfJqPMsEqzZfgeb+B7+lFYJGIfOxxc906/CSA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Penny
 Zheng <Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Chen
	<Wei.Chen@arm.com>
Subject: Re: [PATCH v5] xen/arm: Check for Static Heap feature when freeing
 resources
Thread-Topic: [PATCH v5] xen/arm: Check for Static Heap feature when freeing
 resources
Thread-Index: AQHbS72LrOmoHoF88U+ox0p78LJ4nbLg8LeAgAAFXAA=
Date: Wed, 11 Dec 2024 12:18:56 +0000
Message-ID: <53D4B47C-5411-4F6A-ACDE-A183E830CDD7@arm.com>
References: <20241211111146.2827727-1-luca.fancellu@arm.com>
 <4dfbf14e-25b2-4d16-9323-b711e7e29752@amd.com>
In-Reply-To: <4dfbf14e-25b2-4d16-9323-b711e7e29752@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|AS8PR08MB8111:EE_|DB3PEPF0000885C:EE_|DBBPR08MB5996:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a81f980-e1b4-404b-58a1-08dd19de025f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?V3M4U251YlRCUHhnbjJmbmR2bVdmT0RWV1luNUhEVDNFNE51MWVXTUhwaDlo?=
 =?utf-8?B?bndQZkdpRmxHUk9rdjBwTithM21SdDIyd3Z0Z3F5ZGF3VDhGblJLS2JoaU85?=
 =?utf-8?B?RjhVVFBnNkhXQnBZVFBKNlNHSVN6Uit0WnZ0SFlYakdmaVFVTlM2YmlIVTYz?=
 =?utf-8?B?LzFoQ1FNbTlJcHJTWWVJem1sdUhtaWt0Yi96SHd6dWl3YmkxMTlmVDY2aTlS?=
 =?utf-8?B?YzFjQWlMTWxhYStYZnNpeTVCd20yOFhyRTYyUkFrbVFwYXVlbWJDTlVBWG1U?=
 =?utf-8?B?S1lTdytrYmV2NDJsc2dQMytKcXA4U25VbEZ1OS82U3ltVStvZ1o1TncvMDRq?=
 =?utf-8?B?ajhjMEhCRzNhVC9aa2IxQWk5dlVLWVdzMWllMWpJcGhRTW5VY09WdVlFRUxN?=
 =?utf-8?B?ZWtUM0NXRXQ4OEJqcDdCK1BBUnhGNm10ekdER2lIYmZLR3VZTmhKaTNqckc0?=
 =?utf-8?B?N2VaNTZQR2l6WnVtVXdUOGkyc3o2bVVmYk5qWTFDa1FtWlBrUWZYMWNlT0VB?=
 =?utf-8?B?ckpOY2RKaFpqZGczWit4Nm1xUmlSYXVhNi8rNWs3cStEUGpackY3YjR1ZzVO?=
 =?utf-8?B?TVQ5Zk1za0ZCY2RpQ2huamxzTndKaFdONDlhRjRDVzVWL0x6TUV6dkNYNWJM?=
 =?utf-8?B?NVVuUXdaYUU4d2RYQVhqWVJCdE1PUHE4MW5uTXozOXRJdGpsNmRraVNVS3VR?=
 =?utf-8?B?cytzRjl1QWhYc3BKK0tySEpIZkZQUlNKV1BzWDZ3YzhsWEFBcTdYY2I2b2Iy?=
 =?utf-8?B?VFIza3B1SnlLdWhNaHB1RVE4ZW5DRElQalFCRktMczQ5eEtob3o3TktPazlH?=
 =?utf-8?B?WnVYSjJlWHlwbTN5bFlOR0IyVjE3Sm5oZU52RHBvNXZiQmhUa21QSkxsY1ZI?=
 =?utf-8?B?NFNFV1dpbEVUdmtzWUxLYTltVk4wNGJOSXFScnVtcXkvd0NiN1BsR0NRYXRM?=
 =?utf-8?B?MFVydDNIQVdtVjVFditzVDNGV1RJQnYrSmJjdXArMElFS1JJNWkxZ0p0MFVE?=
 =?utf-8?B?V0V2VmtWMUFOMUczNjhBWkRmVVFVR2RTRDh5aXJ4dGpjWS8vZXI2cDBTMzBn?=
 =?utf-8?B?T0RNZWk2Rno5ZVJZb1pzY2ZVbXRoQXJ4NEw0S0N3RW5ZblkwQzVWSTNqM0Y1?=
 =?utf-8?B?ak42aFZOcDFlUmRGMjJLekoxcXFHMmF5cUhiOVpFWC90MGdUYytjeGJUQmVO?=
 =?utf-8?B?R1hSUG9yYUFzQzlkb2M0VUM2ZUtxREViYm5qSWFYc1d0ekhwMTdaNE9iSFVr?=
 =?utf-8?B?Y0Mxb3dTeUFnQXBPZmI1MldTVzRrQmJHSjlONzhzSFZUWGczTG1NSjBHY0NG?=
 =?utf-8?B?UEdNa3AyS3k5WlJjMnFzTjhmZE51MWtBVmJlaHVwNkMwK1l4ZC9LU2Yvam9m?=
 =?utf-8?B?Vzc4V3pDMVFHZ09CN2E4REl6TVpEQTRhTVJmT3BmdndLd2Y3dmRtazJnMGZX?=
 =?utf-8?B?WW40ajB4SFVYS2Z5NlNOME1COGUyN2VKa3BWYnA0MDFnN3hVbmFWSlFFa1ZE?=
 =?utf-8?B?S2JEWkxvNjF6QUJ4eDNpdG15RjdOWDNKYmE4aW1DdmtGcVBYTUJJUkY4YmVs?=
 =?utf-8?B?NGZxR1p4UFFXQlg5Qm90VDNTVVR6VWJ2YmdDM0JMcmk4MURVUmhiaVpjZUlD?=
 =?utf-8?B?aGNqUDNlQkd0ejNIRXRzY2VYZW10ZTlPODA2eko5TGtwakRuNk9rNlhyN2FF?=
 =?utf-8?B?SWJWN0MrS0p2MUpmdVdxRi91Y3kzMmo4TTRTNzM5UjVMTGZvSWo4amJ6YTd1?=
 =?utf-8?B?dkJ4NjgyL3JxSkpwL3A1NmNLRk15MTVZSCsxbkdwZk9abzREdFVqaVN4OVJ2?=
 =?utf-8?B?WTR0OW82Y2RvaytNZ0RyYk5UcENpV3J6M09hUVI1STlWaEVrSnNtQWp2aU45?=
 =?utf-8?B?dDRoVTU2bzZJRnN0UW5MQk1JeFg2bGJwa0pBd2t3dElUS3c9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5DA124A5EFEF4E42878DBFABA10A9DE7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8111
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF0000885C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d7c5193a-ab12-4c08-7a1b-08dd19ddfc63
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|35042699022|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ekd3bVpvVU1ra2VkdkwwdldkZ2xpNytLc0hUMFNrWU92RFNkSzM1YzBZRi9V?=
 =?utf-8?B?Z1IvRzBtWlp5dlR1RmVtRUhhS3VHd04zR0FsOTFKa3E5bERNUjNseDBWSk54?=
 =?utf-8?B?Y2w0amYveUI0TEdhN3c4ZGNpaHRLRk44Y1YxeUZlTjZQR1JzTU1RTEZvSzJh?=
 =?utf-8?B?ajU1UGtTazRqOGhRM3cwaGc5c0dpT0kvTHNVTDdldUN4cVVZUUFXdGxSMGZo?=
 =?utf-8?B?Z0dmRFFDQ2lTcGh2ZFZZMEJmWXh2TEtzRFRna1B1Y0ltNDF6ZSt2V00xWStu?=
 =?utf-8?B?K0wyVkZjUWZTcC9pQnljRkVzSUhEOGEvSTNabHpsNWE0UE1JdlZqNk13SEJ6?=
 =?utf-8?B?M2dRYnRsYjdBY1lVUmx1Mms5R1lveExReFBZdXhEQm1aNHpwbEZaZk1BbUp1?=
 =?utf-8?B?Skl5c2RiWFFyaTBVS29JaWt5N292ZXh6dXZlaXY5aHBJYXhVemNhNjQwNStJ?=
 =?utf-8?B?T0xET2MzdVVaM3ZrOVM3cWdsSVRVcEQ2WGZoL2hsZjJSVjRVSXQwelZtSXJ6?=
 =?utf-8?B?emlQTzJCby9lQlQ5V3Z6N1RqKzhmTHZRczJBbnQ2Wk9zTThTVDZtOWlVNVdv?=
 =?utf-8?B?QnVTNXZZVmF0SXlkc3BIbUI4OWJKQW1STEpGdkFScVNsN2xuNHB3eVV6RWdX?=
 =?utf-8?B?UzJPRmpvV2VEa0xvSDRrL1dqYWM5K1JwaVVLN1dpYmxrbVFBTDIzUTZEckZN?=
 =?utf-8?B?RUM0cXFpRjB1QVR5T3pTSjBSZkFIOUtTOXpOeFU0SmdJamxHMUgzOVNuYm04?=
 =?utf-8?B?WFBrUG4ybjdFN2ppNzRMV0VQMDlaTnIvZzVSd3o2Y3pHdHQ5Z3QyN0ZCM0FH?=
 =?utf-8?B?a0hTM0pPZ3pDTnBvWFNrbE1sUEJJcmRWZHJzTFdEbVZyZllDNXA0RWViNmhY?=
 =?utf-8?B?YmlKUHhPbVZaUWU4UUZyamNObE14V1JwS3RORGNIbVMwMDhpeEtUMVNEYits?=
 =?utf-8?B?YmVhbytKTDdLc3dQS1d2UUxJZXBqSU5Mb2ZtTkhCZ09Dc1owYndXdnhVVCtW?=
 =?utf-8?B?bnd4MDFMWDdMc3NwUHhHZ0hjSExteDJEdGlMcXM2VzZDV0VRdGwxUm10S0gy?=
 =?utf-8?B?Z3FHSHA4VmxWQ0NWTHlkV20vZXN0d1BORVNWbTFxZVc1dnZSUXBWOWtkK1BP?=
 =?utf-8?B?dldwTUhGMjBQWFJjL2R0OEFQMmlXUHJWK011WExEZmF3MVc5OFNSeGdXNXFL?=
 =?utf-8?B?N0Nuenpwd0NnVEdQa0N5WVhidFRpdjBnRTI5S1FSQ25obEZuY1F1Uy9YTHdp?=
 =?utf-8?B?UlF0NW5rYVp5TFdwZzI4YnRZS09SZ0ZNM09KUmhlalBFRXJaYzJQNUpJaktJ?=
 =?utf-8?B?MWh2bkJKUllIczc3UEJqM3pFMjRReWMzcVRvbW5ISWU4OTA1MGtqZWNWOURW?=
 =?utf-8?B?UTU0REM3TzRlVHB6T21sYksyeVRGV1VMWlNESDd5Y0xqeHIrZ1BoREozTFBo?=
 =?utf-8?B?dXVUdVBMM3VUZmtaTlFQdkFnYlFEOEx6RE1rRGNWVUJHVTVpdk1aS0p6ZU45?=
 =?utf-8?B?dEhpNGluSjd6UnRBa3I1R3VtSTlIME9ZVWNEZkFPcEx2dndRdXdPQ3BhRGF6?=
 =?utf-8?B?OVFoUUZFd2xReTdzbTMyemJOcGZ4SjQ2RkRIM2ZLV0VwQ3ZuNVFRMmpMVm5t?=
 =?utf-8?B?d0RSSE9sS3dkdXZlSDZpWENBd0RTdUZUVG1WMHpHSWpmZ054NklFTUJ0U3JF?=
 =?utf-8?B?LzgvUFdMZUFyVzcza2FXUEQ1czVyNDBScHF2ODVNYWh4cFdWT3NoWjhYSzhJ?=
 =?utf-8?B?TVBkY0RMNEg3N3RvU3dsNnJUUkpJK0ZRTFRlWTRGS3MyaE1qTUdoNm1tenYw?=
 =?utf-8?B?djdvU3paVEdsK0YwcVFwK0NBdkdoYzhXcjQxZkZsMFNDUDYzaUpCSzF3Yno5?=
 =?utf-8?B?V2JFMG4yS0lza0FhSmw3NEVEalMxUXVpUVdZbWdjc1ZlZkprZFRqSlJmQmpa?=
 =?utf-8?B?bHFJT0xINUFvbUtIUWhaL29SRXYyQ1JTTGl0T1VlSmhTWXhFVCsxaTByR1Jh?=
 =?utf-8?B?cnVzMmJOSUZBPT0=?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(376014)(35042699022)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 12:19:06.9403
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a81f980-e1b4-404b-58a1-08dd19de025f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5996

SGkgTWljaGFsLA0KDQo+IE9uIDExIERlYyAyMDI0LCBhdCAxMTo1OSwgTWljaGFsIE9yemVsIDxt
aWNoYWwub3J6ZWxAYW1kLmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IE9uIDExLzEyLzIwMjQg
MTI6MTEsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+PiANCj4+IA0KPj4gRnJvbTogUGVubnkgWmhl
bmcgPFBlbm55LlpoZW5nQGFybS5jb20+DQo+PiANCj4+IElmIHRoZSBYZW4gaGVhcCBpcyBzdGF0
aWNhbGx5IGNvbmZpZ3VyZWQgaW4gRGV2aWNlIFRyZWUsIGl0cyBzaXplIGlzDQo+PiBkZWZpbml0
ZSwgc28gb25seSB0aGUgZGVmaW5lZCBtZW1vcnkgc2hhbGwgYmUgZ2l2ZW4gdG8gdGhlIGJvb3QN
Cj4+IGFsbG9jYXRvci4gSGF2ZSBhIGNoZWNrIHdoZXJlIGluaXRfZG9taGVhcF9wYWdlcygpIGlz
IGNhbGxlZA0KPj4gd2hpY2ggdGFrZXMgaW50byBhY2NvdW50IGlmIHN0YXRpYyBoZWFwIGZlYXR1
cmUgaXMgdXNlZC4NCj4+IA0KPj4gRXh0cmFjdCBzdGF0aWNfaGVhcCBmbGFnIGZyb20gaW5pdCBk
YXRhIGJvb3RpbmZvLCBhcyBpdCB3aWxsIGJlIG5lZWRlZA0KPj4gYWZ0ZXIgZGVzdHJveWluZyB0
aGUgaW5pdCBkYXRhIHNlY3Rpb24sIHJlbmFtZSBpdCB0byB1c2luZ19zdGF0aWNfaGVhcA0KPj4g
YW5kIHVzZSBpdCB0byB0ZWxsIHdoZXRoZXIgdGhlIFhlbiBzdGF0aWMgaGVhcCBmZWF0dXJlIGlz
IGVuYWJsZWQuDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IFBlbm55IFpoZW5nIDxwZW5ueS56aGVu
Z0Bhcm0uY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogV2VpIENoZW4gPHdlaS5jaGVuQGFybS5jb20+
DQo+PiBTaWduZWQtb2ZmLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+
DQo+PiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiAjIGNvbW1v
bg0KPiANCj4gWy4uLl0NCj4gDQo+PiArI2lmZGVmIENPTkZJR19TVEFUSUNfTUVNT1JZDQo+PiAr
ZXh0ZXJuIGJvb2wgdXNpbmdfc3RhdGljX2hlYXA7DQo+PiArI2Vsc2UNCj4+ICsjZGVmaW5lIHVz
aW5nX3N0YXRpY19oZWFwIGZhbHNlDQo+PiArI2VuZGlmDQo+IFdoeT8NCj4gDQo+IFN0YXRpYyBo
ZWFwIGZlYXR1cmUgaXMgbm90IHByb3RlY3RlZCBieSBDT05GSUdfU1RBVElDX01FTU9SWSB0b2Rh
eSwgc28geW91IHdvdWxkIGludHJvZHVjZSBhIHNpbGVudCByZWdyZXNzaW9uDQo+IChpLmUuIHdp
dGhvdXQgY29uZmlnIGVuYWJsZWQsIHByb3BlcnR5IHdvdWxkIGJlIGlnbm9yZWQgYW5kIHRoZXJl
IHdvdWxkIGJlIG5vIHN0YXRpYyBoZWFwIHdpdGggbm8gZXJyb3IgbWVzc2FnZSkuDQo+IA0KPiB+
TWljaGFsDQo+IA0KDQpUaGFua3MgZm9yIHBvaW50aW5nIHRoYXQgb3V0LCBJIGJhc2VkIG15IGFz
c3VtcHRpb24gb24gdHJ1c3RpbmcgdGhlIGZ1bmN0aW9uYWwgY2hhbmdlcyBmb3JtIHRoZSBvcmln
aW5hbCBwYXRjaCwgbm93IHRoYXQNCnlvdSBwb2ludCBvdXQgdGhhdCwgc2VlbXMgYWxzbyB0byBt
ZSB0aGF0IHRoZSBzdGF0aWMgaGVhcCBmZWF0dXJlIGlzIG5vdCBkZXBlbmRlbnQgb24gdGhlIHN0
YXRpYyBtZW1vcnksIGl0IGNhbiB3b3JrIHdpdGgNCm9yIHdpdGhvdXQgaXQuDQoNCknigJlsbCBk
byB0aGUgY2hhbmdlcyBpbiBvcmRlciB0byBhZGRyZXNzIHRoYXQuDQoNCkNoZWVycywNCkx1Y2EN
Cg0K

